pageextension 50102 "Assembly Order" extends "Assembly Order"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Dimensions)
        {

            action(Chatest1)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    AssemblyHeader: Record "Assembly Header";
                    NoSeriesManagement: Codeunit NoSeriesManagement;
                    AssemblySetup: Record "Assembly Setup";
                    AssemblyLine: Record "Assembly Line";
                    R337_lRec: Record "Reservation Entry";
                    ILE: Record "Item Ledger Entry";
                    Item_lRec: Record Item;
                    RemainingQty: Decimal;
                    RemainingQty1: Decimal;
                    TotPostingQty: Decimal;

                    FinalPostQty: Decimal;
                    TotalRemainingQty: Decimal;
                    AssemblyQty: Decimal;
                    ItemLedgerStock: Query "Item Ledger Stock";
                    ItemLedgerTotal: Query "Item Ledger Total";
                begin
                    Clear(AssemblyQty);
                    AssemblyLine.Reset();
                    AssemblyLine.SetRange("Document No.", Rec."No.");
                    IF AssemblyLine.FindFirst() then
                        repeat
                            AssemblyQty := AssemblyLine.Quantity;

                            ItemLedgerTotal.SetFilter(Location_Code, Rec."Location Code");
                            ItemLedgerTotal.SetFilter(Item_No_, AssemblyLine."No.");
                            ItemLedgerTotal.Open();
                            while ItemLedgerTotal.Read do begin
                                IF AssemblyQty > ItemLedgerTotal.Remaining_Quantity then
                                    Error('Item Stock not Sufficient-%1', ItemLedgerTotal.Item_No_);
                            End;
                            ItemLedgerTotal.Close();


                            Clear(TotalRemainingQty);
                            Clear(Item_lRec);
                            IF Item_lRec.GET(AssemblyLine."No.") then
                                IF Item_lRec."Item Tracking Code" <> '' then begin
                                    Clear(TotPostingQty);
                                    ItemLedgerStock.SetFilter(Location_Code, Rec."Location Code");
                                    ItemLedgerStock.SetFilter(Item_No_, AssemblyLine."No.");
                                    ItemLedgerStock.Open();
                                    while ItemLedgerStock.Read do begin
                                        TotalRemainingQty := ItemLedgerStock.Remaining_Quantity;
                                        RemainingQty := AssemblyQty - TotalRemainingQty - TotPostingQty;

                                        if RemainingQty <= 0 then begin
                                            FinalPostQty := AssemblyQty - TotPostingQty;
                                        end else begin
                                            FinalPostQty := TotalRemainingQty;
                                        end;
                                        TotPostingQty += FinalPostQty;


                                        Message('%1..ItemNo-%2', FinalPostQty, ItemLedgerStock.Item_No_);
                                        IF RemainingQty <= 0 then
                                            break;
                                    end;
                                    ItemLedgerStock.Close();
                                end;
                        Until AssemblyLine.Next() = 0;


                end;
            }
            action(CheckTestcase)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    AssemblyHeader: Record "Assembly Header";
                    NoSeriesManagement: Codeunit NoSeriesManagement;
                    AssemblySetup: Record "Assembly Setup";
                    AssemblyLine: Record "Assembly Line";
                    R337_lRec: Record "Reservation Entry";
                    ILE: Record "Item Ledger Entry";
                    Item_lRec: Record Item;
                    RemainingQty: Decimal;
                    RemainingQty1: Decimal;
                    TotalRemainingQty: Decimal;
                    AssemblyQty: Decimal;
                    FinalPostQty: Decimal;
                    TotPostingQty: Decimal;
                begin
                    Clear(AssemblyQty);
                    AssemblyLine.Reset();
                    AssemblyLine.SetRange("Document No.", Rec."No.");
                    AssemblyLine.SetRange("No.", 'SFG00092');
                    IF AssemblyLine.FindFirst() then
                        repeat
                            AssemblyQty := AssemblyLine.Quantity;
                            Clear(TotalRemainingQty);
                            Clear(TotPostingQty);
                            ILE.Reset();
                            ILE.SetRange("Item No.", AssemblyLine."No.");
                            ILE.SetRange("Location Code", Rec."Location Code");
                            ILE.SetFilter("Remaining Quantity", '<>%1', 0);
                            IF ILE.FindSet() then
                                repeat
                                    TotalRemainingQty := ILE."Remaining Quantity";
                                    Clear(Item_lRec);
                                    IF Item_lRec.GET(ILE."Item No.") then
                                        IF Item_lRec."Item Tracking Code" <> '' then begin
                                            RemainingQty := AssemblyQty - TotalRemainingQty - TotPostingQty;
                                            if RemainingQty <= 0 then begin
                                                FinalPostQty := AssemblyQty - TotPostingQty;
                                            end else begin
                                                FinalPostQty := TotalRemainingQty;
                                            end;

                                            TotPostingQty += FinalPostQty;
                                            Message('%1', FinalPostQty);
                                        end;
                                Until (ILE.Next() = 0) or ((RemainingQty) <= 0);
                        Until AssemblyLine.Next() = 0;

                end;
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