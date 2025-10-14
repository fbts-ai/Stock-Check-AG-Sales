page 60101 "Stock Check Against Sales"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Stock Check Ag Sales";
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Editable = not Rec.Posted;
                field("Store No."; Rec."Store No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Store No. field.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the User Name field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date-Time"; Rec."Date-Time")
                {
                    ApplicationArea = All;
                    Editable = false;

                    Caption = 'Creation Date Time';
                    ToolTip = 'Specifies the value of the Date-Time field.';
                }

            }
            part("Stock Check Against List"; "Stock Check Against List")
            {
                ApplicationArea = All;
                SubPageLink = "Store No." = field("Store No."), Date = field(Date);
                Editable = not Rec.Posted;


            }
            part("Assembly Against Sale"; "Assembly Against Sale")
            {
                ApplicationArea = All;
                SubPageLink = "Store No." = field("Store No."), "Trans. Date" = field(Date);
                Editable = not Rec.Posted;


            }
        }
    }


    actions
    {
        area(Navigation)
        {


            action("Assembly Against Sale Get Data")
            {
                ApplicationArea = All;
                Enabled = Rec.Posted;

                trigger OnAction()
                var
                    AssemblyAgainstSale: codeunit "Assembly Against Sale";
                    "Assembly Against Sale": Record "Assembly Against Sale";
                begin
                    // "Assembly Against Sale".DeleteAll();
                    AssemblyAgainstSale.CreateAssemblySales(rec.Date, rec."Store No.");
                end;
            }
            action("Assembly Order Create")
            {
                ApplicationArea = All;
                Enabled = Rec.Posted;

                trigger OnAction()
                var
                    AssemblyHeader: Record "Assembly Header";
                    AssemblyHeader1: Record "Assembly Header";

                    NoSeriesManagement: Codeunit NoSeriesManagement;
                    AssemblySetup: Record "Assembly Setup";
                    AssemblyLine: Record "Assembly Line";
                    R337_lRec: Record "Reservation Entry";
                    R337Check_lRec: Record "Reservation Entry";

                    Item_lRec: Record Item;
                    RemainingQty: Decimal;
                    RemainingQty1: Decimal;
                    TotPostingQty: Decimal;

                    FinalPostQty: Decimal;
                    TotalRemainingQty: Decimal;
                    AssemblyQty: Decimal;
                    ItemLedgerStock: Query "Item Ledger Stock";
                    ItemLedgerTotal: Query "Item Ledger Total";
                    AssemblyAgainstSale: Record "Assembly Against Sale";
                    ValueFlow: Decimal;
                    CheckCase: Boolean;
                    TrackingCheck: Boolean;
                    CustomBOM_Header: Record "Custom BOM_Header";
                    LSCStore: Record "LSC Store";
                    CustomBomLine: Record "Custom BOM Line";
                    LineNo: Integer;
                    ItemQty_lRec: record Item;
                    ItemUnitofMeasure: Record "Item Unit of Measure";
                    ItemUomConvQty: Decimal;
                    UOM: Code[10];
                begin
                    CheckCase := false;

                    AssemblySetup.GET;


                    AssemblyAgainstSale.Reset();
                    // AssemblyAgainstSale.SetCurrentKey("Store No.",par)
                    AssemblyAgainstSale.SetRange("Order Created", false);
                    AssemblyAgainstSale.SetRange("Store No.", Rec."Store No."); // FBTS SP
                    AssemblyAgainstSale.SetRange("Trans. Date", Rec.Date);
                    AssemblyAgainstSale.SetRange("Order No.", '');
                    AssemblyAgainstSale.SetRange("Error Text", '');
                    // AssemblyAgainstSale.SetRange("Parent Item No.", 'FG000660');
                    IF AssemblyAgainstSale.FindSet() then
                        repeat

                            //Dupilicate Case Check --NS
                            AssemblyHeader1.Reset();
                            AssemblyHeader1.SetRange("No.", AssemblyAgainstSale."Order No.");
                            IF Not AssemblyHeader1.FindFirst() then begin
                                //Dupilicate Case Check --NE


                                AssemblyHeader.Init();
                                AssemblyHeader."Document Type" := AssemblyHeader."Document Type"::Order;
                                AssemblyHeader."No." := NoSeriesManagement.GetNextNo(AssemblySetup."Assembly Order Nos.", Today, true);

                                AssemblyHeader.Insert(True);
                                AssemblyHeader.Validate("Posting Date", AssemblyAgainstSale."Trans. Date");
                                AssemblyHeader.Validate("Due Date", Today);
                                AssemblyHeader.Validate("Location Code", AssemblyAgainstSale."Store No.");
                                AssemblyHeader.Validate("Item No.", AssemblyAgainstSale."Parent Item No.");
                                AssemblyHeader.Validate(Quantity, AssemblyAgainstSale."Sale Qty");
                                AssemblyHeader.Modify();

                                LSCStore.Reset();
                                LSCStore.SetRange("No.", AssemblyAgainstSale."Store No.");
                                IF LSCStore.FindFirst() Then;
                                CustomBOM_Header.Reset();
                                // if LSCStore."Custom BOM Group Code" <> '' then 
                                CustomBOM_Header.SetRange("Custom BOM Group", LSCStore."Custom BOM Group Code");
                                CustomBOM_Header.SetRange("Parent Item No.", AssemblyAgainstSale."Parent Item No.");
                                IF CustomBOM_Header.FindFirst() Then begin
                                    CustomBomLine.Reset();
                                    CustomBomLine.SetRange("BOM Code", CustomBOM_Header."BOM Code");
                                    // CustomBomLine.SetRange("Child ItemNo.", 'RM000399');
                                    IF CustomBomLine.FindSet() then
                                        repeat
                                            AssemblyLine.Reset();
                                            AssemblyLine.SetRange("Custom Bom Line", false);
                                            AssemblyLine.SetRange("Document No.", AssemblyHeader."No.");
                                            IF AssemblyLine.FindFirst() then
                                                repeat
                                                    AssemblyLine.Delete();
                                                Until AssemblyLine.Next() = 0;
                                            Clear(LineNo);
                                            AssemblyLine.Reset();
                                            AssemblyLine.SetRange("Document No.", AssemblyHeader."No.");
                                            IF AssemblyLine.FindLast() then
                                                LineNo := AssemblyLine."Line No." + 10000
                                            else
                                                LineNo := 10000;
                                            //  IF CustomBomLine."Unit of Measure" = 'MLS' then begin
                                            UOM := '';
                                            Clear(ItemUomConvQty); //FBTS SP
                                            Clear(ItemQty_lRec);
                                            IF ItemQty_lRec.Get(CustomBomLine."Child ItemNo.") then begin
                                                IF ItemQty_lRec."Base Unit of Measure" <> CustomBomLine."Unit of Measure" then begin
                                                    UOM := ItemQty_lRec."Base Unit of Measure";
                                                    Clear(ItemUomConvQty);
                                                    ItemUnitofMeasure.Reset();
                                                    ItemUnitofMeasure.SetRange("Item No.", ItemQty_lRec."No.");
                                                    ItemUnitofMeasure.SetRange(code, CustomBomLine."Unit of Measure");
                                                    IF ItemUnitofMeasure.FindFirst() then begin
                                                        ItemUomConvQty := (ItemUnitofMeasure."Qty. per Unit of Measure");
                                                    end;
                                                end;
                                                //   end;
                                            end;

                                            AssemblyLine.Init();
                                            AssemblyLine."Document Type" := AssemblyLine."Document Type"::Order;
                                            AssemblyLine."Document No." := AssemblyHeader."No.";
                                            AssemblyLine."Line No." := LineNo;
                                            AssemblyLine.Type := AssemblyLine.Type::Item;
                                            AssemblyLine.Validate("No.", CustomBomLine."Child ItemNo.");
                                            AssemblyLine."Avail. Warning" := true;
                                            IF UOM <> '' then
                                                AssemblyLine."Unit of Measure Code" := UOM
                                            else
                                                AssemblyLine."Unit of Measure Code" := CustomBomLine."Unit of Measure";
                                            IF ItemUomConvQty <> 0 then
                                                AssemblyLine.Validate("Quantity per", CustomBomLine."Quantity per" * ItemUomConvQty)
                                            Else
                                                AssemblyLine.Validate("Quantity per", CustomBomLine."Quantity per");

                                            AssemblyLine."Custom Bom Line" := true;
                                            AssemblyLine.Insert();
                                        Until CustomBomLine.Next() = 0;
                                end;
                                AssemblyLine.Reset();
                                AssemblyLine.SetRange("Document No.", AssemblyHeader."No.");
                                IF AssemblyLine.FindFirst() then
                                    repeat
                                        AssemblyQty := AssemblyLine."Quantity (Base)";

                                        ItemLedgerTotal.SetFilter(Location_Code, AssemblyHeader."Location Code");
                                        ItemLedgerTotal.SetFilter(Item_No_, AssemblyLine."No.");
                                        ItemLedgerTotal.Open();
                                        while ItemLedgerTotal.Read do begin
                                            Commit();
                                            IF AssemblyQty > ItemLedgerTotal.Remaining_Quantity then begin
                                                AssemblyAgainstSale."Error Text" := 'Item Stock not Sufficient-' + ItemLedgerTotal.Item_No_;
                                                Message('Item Stock not Sufficient-%1..%2', ItemLedgerTotal.Item_No_, AssemblyAgainstSale."Parent Item No.");
                                                CheckCase := true;
                                            end else
                                                CheckCase := false;

                                        End;
                                        ItemLedgerTotal.Close();
                                        Commit();

                                        Clear(TotalRemainingQty);
                                        Clear(TotPostingQty);
                                        Clear(Item_lRec);
                                        IF Item_lRec.GET(AssemblyLine."No.") then
                                            IF Item_lRec."Item Tracking Code" <> '' then begin
                                                Clear(TotPostingQty);
                                                ItemLedgerStock.SetFilter(Location_Code, AssemblyHeader."Location Code");
                                                ItemLedgerStock.SetFilter(Item_No_, AssemblyLine."No.");
                                                ItemLedgerStock.Open();
                                                while ItemLedgerStock.Read do begin
                                                    TotalRemainingQty := ItemLedgerStock.Remaining_Quantity;
                                                    RemainingQty := AssemblyQty - TotalRemainingQty - TotPostingQty;


                                                    if RemainingQty <= 0 then begin
                                                        FinalPostQty := AssemblyQty - TotPostingQty;


                                                        ValueFlow := ABS(FinalPostQty);
                                                        R337_lRec.Init;
                                                        R337_lRec.Validate("Entry No.", GetLastEntryNo_lFnc);
                                                        R337_lRec.Positive := false;
                                                        R337_lRec.Insert(true);
                                                        R337_lRec.Validate("Item No.", ItemLedgerStock.Item_No_);
                                                        R337_lRec.Validate("Location Code", ItemLedgerStock.Location_Code);
                                                        R337_lRec.Validate("Qty. per Unit of Measure", 1);
                                                        R337_lRec.Validate("Quantity (Base)", -(ValueFlow));
                                                        R337_lRec."Reservation Status" := R337_lRec."Reservation Status"::Surplus;
                                                        R337_lRec."Creation Date" := today;
                                                        R337_lRec.Validate("Source Type", 901);
                                                        R337_lRec."Source Subtype" := R337_lRec."Source Subtype"::"1";
                                                        R337_lRec.Validate("Source ID", AssemblyLine."Document No.");
                                                        R337_lRec."Source Ref. No." := AssemblyLine."Line No.";
                                                        R337_lRec."Expiration Date" := Today;
                                                        R337_lRec."Shipment Date" := today;
                                                        R337_lRec."Created By" := UserId;
                                                        R337_lRec.Validate("Lot No.", ItemLedgerStock.Lot_No_);
                                                        R337_lRec.Validate("Item Tracking", R337_lRec."item tracking"::"Lot No.");
                                                        R337_lRec.Modify(true);
                                                    end else begin
                                                        FinalPostQty := TotalRemainingQty;
                                                        ValueFlow := ABS(FinalPostQty);


                                                        R337_lRec.Init;
                                                        R337_lRec.Validate("Entry No.", GetLastEntryNo_lFnc);
                                                        R337_lRec.Positive := false;
                                                        R337_lRec.Insert(true);
                                                        R337_lRec.Validate("Item No.", ItemLedgerStock.Item_No_);
                                                        R337_lRec.Validate("Location Code", ItemLedgerStock.Location_Code);
                                                        R337_lRec.Validate("Qty. per Unit of Measure", 1);
                                                        R337_lRec."Reservation Status" := R337_lRec."Reservation Status"::Surplus;
                                                        R337_lRec."Creation Date" := today;
                                                        R337_lRec.Validate("Source Type", 901);
                                                        R337_lRec."Source Subtype" := R337_lRec."Source Subtype"::"1";
                                                        R337_lRec.Validate("Source ID", AssemblyLine."Document No.");
                                                        R337_lRec."Source Ref. No." := AssemblyLine."Line No.";
                                                        R337_lRec."Expiration Date" := today;
                                                        R337_lRec."Shipment Date" := today;
                                                        R337_lRec.Validate("Quantity (Base)", -(ValueFlow));

                                                        R337_lRec."Created By" := UserId;
                                                        R337_lRec.Validate("Lot No.", ItemLedgerStock.Lot_No_);
                                                        // R337_lRec.Validate("Variant Code", ILE."Variant Code");
                                                        R337_lRec.Validate("Item Tracking", R337_lRec."item tracking"::"Lot No.");
                                                        R337_lRec.Modify(true);
                                                    end;
                                                    TotPostingQty += FinalPostQty;
                                                    IF RemainingQty <= 0 then
                                                        break;
                                                end;

                                            end;
                                        ItemLedgerStock.Close();
                                    Until AssemblyLine.Next() = 0;
                                IF Not CheckCase then begin
                                    Commit();
                                    If AssemblyAgainstSale."Error Text" = '' then
                                        CODEUNIT.Run(CODEUNIT::"Assembly-Post", AssemblyHeader);
                                    Commit();

                                end;
                                AssemblyAgainstSale."Order No." := AssemblyHeader."No.";
                                AssemblyAgainstSale."Order Created" := true;
                                If AssemblyAgainstSale."Error Text" = '' then
                                    AssemblyAgainstSale.Posted := true;
                                AssemblyAgainstSale.Modify();
                            END;
                        Until AssemblyAgainstSale.Next() = 0;

                    // AssemblyAgainstSale.Reset();
                    // AssemblyAgainstSale.SetRange("Order Created", True);
                    // AssemblyAgainstSale.SetRange("Store No.", Rec."Store No.");
                    // AssemblyAgainstSale.SetRange("Trans. Date", Rec.Date);
                    // AssemblyAgainstSale.Setfilter("Error Text", '<>%1', '');
                    // IF AssemblyAgainstSale.FindSet() then
                    //     repeat
                    //         AssemblyHeader.Reset();
                    //         AssemblyHeader.SetRange("No.", AssemblyAgainstSale."Order No.");
                    //         IF AssemblyHeader.FindFirst() then;
                    //  CODEUNIT.Run(CODEUNIT::"Assembly-Post", AssemblyHeader);
                    //     Until AssemblyAgainstSale.Next() = 0;

                    AssemblyAgainstSale.Reset();
                    AssemblyAgainstSale.SetRange("Store No.", Rec."Store No.");
                    AssemblyAgainstSale.SetRange("Trans. Date", Rec.Date);
                    AssemblyAgainstSale.SetRange(Posted, false);
                    IF AssemblyAgainstSale.FindSet() then begin
                        Message('Some Assembly Orders are Still Pending for Posting.Please Check Error Logs and Retry');
                    end else
                        Message('Assembly Order Created and Posted Successfully');

                end;
            }
            action(GetValueData)
            {
                ApplicationArea = All;
                Enabled = not Rec.Posted;
                trigger OnAction()
                var
                    LSCBarcodes: Record "LSC Barcodes";
                    LineNo: Integer;
                    ItemQty: Decimal;
                    BlisterHeader_lNos: Code[20];
                    Transfer1_lRec: Record "Transfer Line";
                    POQty: Decimal;
                    TransferLine3: Record "Transfer Line";
                    TransferLine1: Record "Transfer Line";
                    TransferLine: Record "Transfer Line";
                    TransferLine4: Record "Transfer Line";
                    Item: Record item;
                    TaxCaseExecution: Codeunit "Use Case Execution";
                    ItemLedgerEntry: Record "Item Ledger Entry";
                    TransferShipmentLine: Record "Transfer Shipment Line";

                    URL: Text;
                    HttpClient: HttpClient;
                    HttpResponseMessage: HttpResponseMessage;
                    Response: Text;
                    ResponseMessage: HttpResponseMessage;
                    RequestHeaders: HttpHeaders;
                    RequestMessage: HttpRequestMessage;
                    JsonObject: JsonObject;
                    JSONManagement: Codeunit "JSON Management";
                    ArrayJSONManagement: Codeunit "JSON Management";
                    ObjectJSONManagement: Codeunit "JSON Management";
                    Index: Integer;
                    Value: text;
                    ItemJsonobject: text;
                    JsonObject1: JsonObject;
                    JsonArray: JsonArray;
                    JsonToken: JsonToken;
                    JsonToken1: JsonToken;
                    ItemNo: Code[20];
                    VariantCode: Code[20];
                    StockCheckAgSalesLine: record "Stock Check Ag Sales Line";
                    StockCheckAgSalesLine1: record "Stock Check Ag Sales Line";
                    StoreNo: Text;
                    Date_: text;
                    Description: Text;
                    UOM: Text;
                    Sale_Quantity: text;
                    Stock: text;
                    Stock_lDec: Decimal;

                    Adj_Required: Text;
                    Pending_Receiving: Text;
                    Expected_Pur_Receiving:
                    Text;
                    Expected_Pur_Receiving_lDec: decimal;
                    Date_lDat: Date;
                    Sale_Quantity_ldec: Decimal;
                    Adj_Required_ldec: Decimal;
                    Pending_Receiving_ldec: Decimal;
                    InventorySetup: Record "Inventory Setup";
                begin
                    Clear(InventorySetup);
                    InventorySetup.GEt;


                    BlisterHeader_lNos := '';
                    Clear(LineNo);
                    Clear(POQty);
                    Clear(Item);
                    StockCheckAgSalesLine1.Reset();
                    StockCheckAgSalesLine1.SetRange("Store No.", Rec."Store No.");
                    StockCheckAgSalesLine1.SetRange(Date, Rec.Date);
                    StockCheckAgSalesLine1.DeleteAll();
                    URL := InventorySetup."Inv Chk Ag Sales API" + '?store=' + Rec."Store No." + '&date=' + Format(Rec.Date, 0, '<Year4><Month,2><Day,2>');


                    IF HttpClient.Get(URL, HttpResponseMessage) then begin
                        HttpResponseMessage.Content.ReadAs(Response);
                        Response := DelChr(Response, '=', '\/');
                        Response := CopyStr(Response, 2, StrLen(Response) - 2);
                        Message('%1', Response);
                        if JsonArray.ReadFrom(Response) then begin
                            for Index := 0 to JsonArray.Count() - 1 do begin
                                if JsonArray.Get(Index, JsonToken) then begin
                                    JsonObject1 := JsonToken.AsObject();


                                    if JsonObject1.Get('Store No_', JsonToken1) then begin
                                        StoreNo := JsonToken1.AsValue().AsText();
                                    end;
                                    // if JsonObject1.Get('Date', JsonToken1) then begin
                                    //     Date_ := JsonToken1.AsValue().AsText();
                                    //     Evaluate(Date_lDat, date_);
                                    // end;
                                    if JsonObject1.Get('Item No_', JsonToken1) then begin
                                        ItemNo := JsonToken1.AsValue().AsText();
                                    end;
                                    if JsonObject1.Get('Description', JsonToken1) then begin
                                        Description := JsonToken1.AsValue().AsText();
                                    end;
                                    if JsonObject1.Get('UOM', JsonToken1) then begin
                                        UOM := JsonToken1.AsValue().AsText();
                                    end;
                                    if JsonObject1.Get('Sale_Quantity', JsonToken1) then begin
                                        Sale_Quantity := JsonToken1.AsValue().AsText();
                                        Evaluate(Sale_Quantity_ldec, Sale_Quantity);
                                    end;
                                    if JsonObject1.Get('Stock', JsonToken1) then begin
                                        Stock := JsonToken1.AsValue().AsText();
                                        Evaluate(Stock_ldec, Stock);

                                    end;

                                    if JsonObject1.Get('Adj_Required', JsonToken1) then begin
                                        Adj_Required := JsonToken1.AsValue().AsText();
                                        Evaluate(Adj_Required_ldec, Adj_Required);

                                    end;

                                    if JsonObject1.Get('Pending_Receiving', JsonToken1) then begin
                                        Pending_Receiving := JsonToken1.AsValue().AsText();
                                        Evaluate(Pending_Receiving_ldec, Pending_Receiving);
                                    end;


                                    if JsonObject1.Get('Expected_Pur_Receiving', JsonToken1) then begin
                                        Expected_Pur_Receiving := JsonToken1.AsValue().AsText();
                                        Evaluate(Expected_Pur_Receiving_lDec, Expected_Pur_Receiving);
                                    end;





                                    StockCheckAgSalesLine1.Reset();
                                    StockCheckAgSalesLine1.SetRange("Store No.", StoreNo);
                                    StockCheckAgSalesLine1.SetRange(Date, Rec.Date);
                                    StockCheckAgSalesLine1.SetRange("Item No.", ItemNo);
                                    IF Not StockCheckAgSalesLine1.FindFirst() then begin
                                        StockCheckAgSalesLine.Init();
                                        StockCheckAgSalesLine."Store No." := StoreNo;
                                        StockCheckAgSalesLine.Date := Rec.Date;
                                        StockCheckAgSalesLine."Adj Required" := Adj_Required_ldec;
                                        StockCheckAgSalesLine.Description := Description;
                                        StockCheckAgSalesLine."Item No." := ItemNo;
                                        StockCheckAgSalesLine."Pending Receiving" := Pending_Receiving_ldec;
                                        StockCheckAgSalesLine."Sale Quantity" := Sale_Quantity_ldec;
                                        StockCheckAgSalesLine.Stock := Stock_lDec;
                                        StockCheckAgSalesLine."Store No." := StoreNo;
                                        StockCheckAgSalesLine."Expected Pur Receiving" := Expected_Pur_Receiving_lDec;
                                        StockCheckAgSalesLine.UOM := uom;
                                        StockCheckAgSalesLine.Insert();
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            }
            action(Post)
            {
                ApplicationArea = All;
                Enabled = not Rec.Posted;

                trigger OnAction()
                var
                    StockCheckAgSalesLine: Record "Stock Check Ag Sales Line";
                    ItemJournalLine: Record "Item Journal Line";
                    ItemJournalLine1: Record "Item Journal Line";
                    LineNo: Integer;
                    NoSeriesManagement: Codeunit NoSeriesManagement;
                    DocNo: Code[20];
                    ItemJnlPost: Codeunit "Item Jnl.-Post";
                    SalesSetup: Record "Sales & Receivables Setup";
                    R337_lRec: record 337;
                    Item_lRec: Record Item;
                begin
                    Clear(LineNo);
                    Clear(SalesSetup);
                    SalesSetup.GET;

                    // FBTS PT
                    // StockCheckAgSalesLine.Reset();
                    // StockCheckAgSalesLine.SetRange("Store No.", Rec."Store No.");
                    // StockCheckAgSalesLine.SetRange(Date, Rec.Date);
                    // StockCheckAgSalesLine.SetFilter("Pending Receiving", '<>%1', 0);
                    // IF StockCheckAgSalesLine.FindSet() then begin
                    //     Error('Please Complete Pending Receiving');
                    // end;
                    // FBTS PT


                    DocNo := Rec."No.";
                    StockCheckAgSalesLine.Reset();
                    StockCheckAgSalesLine.SetRange("Store No.", Rec."Store No.");
                    StockCheckAgSalesLine.SetRange(Date, Rec.Date);
                    IF StockCheckAgSalesLine.FindSet() then
                        repeat


                            ItemJournalLine1.Reset();
                            ItemJournalLine1.SetRange("Journal Template Name", 'ITEM');
                            ItemJournalLine1.SetRange("Journal Batch Name", 'PONS');
                            IF ItemJournalLine1.FindLast() then
                                LineNo := ItemJournalLine1."Line No." + 10000
                            Else
                                LineNo := 10000;


                            ItemJournalLine.Init();
                            ItemJournalLine."Journal Template Name" := 'ITEM';
                            ItemJournalLine."Journal Batch Name" := 'PONS';
                            ItemJournalLine."Line No." := LineNo;
                            ItemJournalLine.Validate("Posting Date", Rec.Date);
                            ItemJournalLine.Validate("Entry Type", ItemJournalLine."Entry Type"::"Positive Adjmt.");
                            ItemJournalLine."Document No." := DocNo;
                            ItemJournalLine.Validate("Item No.", StockCheckAgSalesLine."Item No.");
                            ItemJournalLine.Validate("Location Code", Rec."Store No.");
                            ItemJournalLine.Validate(Quantity, StockCheckAgSalesLine."Adj Required");
                            ItemJournalLine.Validate("Reason Code", 'PONS');
                            ItemJournalLine.Insert();
                            Clear(Item_lRec);
                            Item_lRec.GEt(ItemJournalLine."Item No.");

                            IF Item_lRec."Lot Nos." <> '' then begin
                                R337_lRec.Init;
                                R337_lRec.Validate("Entry No.", GetLastEntryNo_lFnc);
                                R337_lRec.Positive := false;
                                R337_lRec.Insert(true);
                                R337_lRec.Validate("Item No.", ItemJournalLine."Item No.");
                                R337_lRec.Validate("Location Code", ItemJournalLine."Location Code");
                                R337_lRec.Validate("Qty. per Unit of Measure", 1);
                                R337_lRec.Validate("Quantity (Base)", ItemJournalLine."Quantity");
                                R337_lRec."Reservation Status" := R337_lRec."Reservation Status"::Prospect;
                                R337_lRec."Creation Date" := today;
                                R337_lRec.Validate("Source Type", 83);
                                R337_lRec."Source Subtype" := R337_lRec."Source Subtype"::"2";
                                R337_lRec.Validate("Source ID", 'ITEM');
                                R337_lRec."Source Ref. No." := ItemJournalLine."Line No.";
                                R337_lRec."Source Batch Name" := 'PONS';
                                R337_lRec."Expiration Date" := ItemJournalLine."Posting Date";
                                R337_lRec."Shipment Date" := today;
                                R337_lRec."Created By" := UserId;
                                R337_lRec."Planning Flexibility" := R337_lRec."Planning Flexibility"::Unlimited;
                                R337_lRec.Validate("Lot No.", NoSeriesManagement.GetNextNo(SalesSetup."Lot Store Check No.", Today, True));
                                R337_lRec.Validate("Variant Code", ItemJournalLine."Variant Code");
                                R337_lRec.Validate("Item Tracking", R337_lRec."item tracking"::"Lot No.");
                                R337_lRec.Modify(true);
                            End;
                        Until StockCheckAgSalesLine.Next() = 0;
                    ItemJnlPost.Run(ItemJournalLine);
                    // ItemjouPost
                    rec.Posted := true;
                    rec.Modify();
                End;
            }
        }
    }

    local procedure GetLastEntryNo_lFnc(): Integer
    var
        ReservationEntry: Record "Reservation Entry";
    begin
        if ReservationEntry.FindLast then
            exit(ReservationEntry."Entry No." + 1)
        else
            exit(1);
    end;
}