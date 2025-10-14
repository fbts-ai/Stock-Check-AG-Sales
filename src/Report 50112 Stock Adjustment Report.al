report 50112 "Stock Adjustment Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/Report ILE.rdl';


    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            RequestFilterFields = "Posting Date", "Location Code";
            column(DocumentNo; "Document No.")
            {

            }
            column(postingDate; "posting date")
            {

            }
            column(StoreNo; "Location Code")
            {

            }
            column(CostAmt; "Item Ledger Entry"."Cost Amount (Actual)")
            {

            }
            column(DocType; "Document Type")
            {

            }
            column(ItemNo; "Item No.")
            {

            }
            column(Description; Description)
            {

            }
            column(Quantity; Quantity)
            {

            }
            column(RemQty; "Remaining Quantity")
            {

            }
            column(ReasonCode; "Reason Code")
            {

            }
            column(CompInfoPic; CompInfo.Picture)
            {

            }
            column(CompInfoName; CompInfo.Name)
            {

            }
            column(CompInfoAdd; CompInfo.Address + CompInfo."Address 2")
            {

            }
            column(CompInfoCode; CompInfo."Post Code")
            {

            }
            column(CompInfoCity; CompInfo.City)
            {

            }
            column(CompInfoState; CompInfo."State Code")
            {

            }
            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                CompInfo.Get();
                CompInfo.CalcFields(Picture);
                Setrange("Reason Code", 'PONS')
            end;

            trigger OnPostDataItem()
            var
                myInt: Integer;
            begin
                CompInfo.Get();
                CompInfo.CalcFields(Picture)
            end;
        }

    }

    // requestpage
    // {
    //     AboutTitle = 'Teaching tip title';
    //     AboutText = 'Teaching tip content';
    //     layout
    //     {
    //         area(Content)
    //         {
    //             group(GroupName)
    //             {
    //                 field(Name; SourceExpression)
    //                 {
    //                     ApplicationArea = All;

    //                 }
    //             }
    //         }
    //     }

    //     actions
    //     {
    //         area(processing)
    //         {
    //             action(LayoutName)
    //             {
    //                 ApplicationArea = All;

    //             }
    //         }
    //     }
    // }



    var
        CompInfo: Record "Company Information";
}