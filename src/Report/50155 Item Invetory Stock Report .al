report 50155 "Stock Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Src/Report/item Inventory location Wise.rdl';
    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "Location Filter", "Date Filter", "No.", "Item Category Code";
            CalcFields = Inventory;
            column(No_; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(Purch__Unit_of_Measure; "Purch. Unit of Measure")
            {
            }
            column(Date_Filter; "Date Filter")
            {

            }
            column(Date_; Date_)
            {

            }
            column(LocName; LocName)
            { }

            column(Inventory; Inventory)
            {
            }
            column(Unit_Cost; "Unit Cost")
            { }
            column(inventoryQtyRec; inventoryQtyRec)
            { }
            // column(Location_Filter; "Location Filter")
            // {

            // }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Clear(inventoryQtyRec);
                ItemUnitofMeasureRec.Reset();
                ItemUnitofMeasureRec.SetRange("Item No.", Item."No.");
                ItemUnitofMeasureRec.SetRange(Code, Item."Base Unit of Measure");
                if ItemUnitofMeasureRec.FindFirst() then
                    inventoryQtyRec := ItemUnitofMeasureRec."Qty. per Unit of Measure";
            end;
            // Message('%1', inventoryQtyRec);
            // end;
            trigger OnPreDataItem()
            var
            begin
                Date_ := GetFilter("Date Filter");
                LocName := GetFilter("Location Filter");


            end;
        }

    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group("Stock Report")
                {
                    // field(Name; SourceExpression)
                    // {

                    //     ApplicationArea = All;

                    // }
                }
            }
        }
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }



    var
        ItemUnitofMeasureRec: Record "Item Unit of Measure";
        inventoryQtyRec: Decimal;
        Loc: Record Location;
        LocName: Code[20];
        Date_: Text;
}