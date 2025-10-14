pageextension 50101 "LSC Open Statement" extends "LSC Open Statement"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        modify("C&alculate Statement")
        {
            trigger OnBeforeAction()
            var
                Text000: Label 'Do you have completed the "Check Stock" process?';
            begin
                if not Confirm(Text000, false) then
                    Exit;
            end;
        }
        addafter("Check &Transactions")
        {
            action("Check &Stock")
            {
                ApplicationArea = All;
                Caption = 'Check &Stock';
                Image = Check;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                var
                    StockCheckAgSales: record "Stock Check Ag Sales";
                    StockCheckList: Page "Stock Check List";
                    RetailUser: Record "LSC Retail User";
                begin
                    Clear(RetailUser);
                    RetailUser.GEt(UserId);
                    StockCheckAgSales.Reset();
                    StockCheckAgSales.SetRange("Store No.", RetailUser."Store No.");
                    StockCheckList.SetTableView(StockCheckAgSales);
                    StockCheckList.Run();
                    //                    CheckTransactions;
                end;
            }
        }
        modify("P&ost Sales Entries")
        {
            Visible = false;
        }
    }

    var
        myInt: Integer;
}