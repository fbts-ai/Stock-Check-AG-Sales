codeunit 60100 "Assembly Against Sale"
{
    trigger OnRun()
    begin
    end;

    procedure CreateAssemblySales(Date_l: Date; StoreNo_l: Code[20])
    var
        LineNo: Integer;
        ItemQty: Decimal;
        TaxCaseExecution: Codeunit "Use Case Execution";
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
        StoreNo: Code[20];
        BOMLevel: Code[20];
        ParentItemNo: Code[20];
        ParentItemDescription: text;
        ParentItemUOM: Code[20];
        Sale_Qty: Text;
        Sale_Qty_ldec: Decimal;
        AssemblyAgainstSale: Record "Assembly Against Sale";
        AssemblyAgainstSale1: Record "Assembly Against Sale";
        InventorySetup: Record "Inventory Setup";
        DataGet: Boolean;
    begin
        Clear(InventorySetup);
        InventorySetup.get;
        // StoreNo_l := 'S014';//

        //'http://localhost:1122/api/values/getassorder?store='
        URL := InventorySetup."Auto Assembly API" + '?store=' + StoreNo_l + '&date=' + Format(Date_l, 0, '<Year4><Month,2><Day,2>');

        IF HttpClient.Get(URL, HttpResponseMessage) then begin
            HttpResponseMessage.Content.ReadAs(Response);
            Response := DelChr(Response, '=', '\/');
            Response := CopyStr(Response, 2, StrLen(Response) - 2);
            // Message('%1', Response);
            if JsonArray.ReadFrom(Response) then begin
                DataGet := True;
                for Index := 0 to JsonArray.Count() - 1 do begin
                    if JsonArray.Get(Index, JsonToken) then begin
                        JsonObject1 := JsonToken.AsObject();


                        if JsonObject1.Get('Store No_', JsonToken1) then begin
                            StoreNo := JsonToken1.AsValue().AsText();
                        end;


                        if JsonObject1.Get('BOM Level', JsonToken1) then begin
                            BOMLevel := JsonToken1.AsValue().AsText();
                        end;
                        if JsonObject1.Get('Parent Item No_', JsonToken1) then begin
                            ParentItemNo := JsonToken1.AsValue().AsText();
                        end;

                        if JsonObject1.Get('Parent Item Description', JsonToken1) then begin
                            ParentItemDescription := JsonToken1.AsValue().AsText();
                        end;

                        if JsonObject1.Get('Parent Item UOM', JsonToken1) then begin
                            ParentItemUOM := JsonToken1.AsValue().AsText();
                        end;

                        if JsonObject1.Get('Sale_Qty', JsonToken1) then begin
                            Sale_Qty := JsonToken1.AsValue().AsText();
                            Evaluate(Sale_Qty_ldec, Sale_Qty);
                        end;

                        AssemblyAgainstSale.Reset();
                        AssemblyAgainstSale.SetRange("Store No.", StoreNo);
                        AssemblyAgainstSale.SetRange("Parent Item No.", ParentItemNo);
                        AssemblyAgainstSale.SetRange("Trans. Date", Date_l);
                        IF Not AssemblyAgainstSale.FindFirst() then begin
                            AssemblyAgainstSale1.Init();
                            AssemblyAgainstSale1."Store No." := StoreNo;
                            AssemblyAgainstSale1."Trans. Date" := Date_l;
                            AssemblyAgainstSale1."BOM Level" := BOMLevel;
                            AssemblyAgainstSale1."Parent Item No." := ParentItemNo;
                            AssemblyAgainstSale1."Parent Item Description" := ParentItemDescription;
                            AssemblyAgainstSale1."Parent Item UOM" := ParentItemUOM;
                            AssemblyAgainstSale1."Sale Qty" := Sale_Qty_ldec;
                            AssemblyAgainstSale1.Insert();
                        end;
                    end;


                end;
            end;
        end;
        IF DataGet then
            Message('Sale Data Fetched Successfully to Create Assembly Orders');

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assembly Line Management", 'OnBeforeShowAvailability', '', false, false)]
    local procedure "Assembly Line Management_OnBeforeShowAvailability"(var TempAssemblyHeader: Record "Assembly Header" temporary; var TempAssemblyLine: Record "Assembly Line" temporary; ShowPageEvenIfEnoughComponentsAvailable: Boolean; var IsHandled: Boolean; var RollBack: Boolean)
    begin
        IsHandled := true;
    end;


    // [EventSubscriber(ObjectType::Table, Database::"Tracking Specification", 'OnBeforeTestFieldError', '', false, false)]
    // local procedure "Tracking Specification_OnBeforeTestFieldError"(FieldCaptionText: Text[80]; CurrFieldValue: Decimal; CompareValue: Decimal; var IsHandled: Boolean)
    // begin
    //     IsHandled := true;

    // end;


    [EventSubscriber(ObjectType::Table, Database::"Assembly Line", 'OnBeforeValidateDueDate', '', false, false)]
    local procedure "Assembly Line_OnBeforeValidateDueDate"(var AsmLine: Record "Assembly Line"; AsmHeader: Record "Assembly Header"; NewDueDate: Date; var ShowDueDateBeforeWorkDateMsg: Boolean)
    begin
        ShowDueDateBeforeWorkDateMsg := false;
    end;





    // [EventSubscriber(ObjectType::Table, Database::"Posted Assembly Header", 'OnAfterInsertEvent', '', false, false)]
    // local procedure MyProcedure(var Rec: Record "Posted Assembly Header"; RunTrigger: Boolean)
    // var
    //     "Assembly Against Sale": Record "Assembly Against Sale";
    // begin
    //     "Assembly Against Sale".Reset();
    //     "Assembly Against Sale".SetRange("Order No.", Rec."Order No.");
    //     IF "Assembly Against Sale".FindFirst() then begin
    //         "Assembly Against Sale"."Posted Sucess" := true;
    //         "Assembly Against Sale".Modify();
    //     end;
    // end;





    var
        myInt: Integer;
}