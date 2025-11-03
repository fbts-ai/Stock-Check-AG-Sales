// pageextension 50101 "LSC Open Statement" extends "LSC Open Statement"
// {
//     layout
//     {
//         // Add changes to page layout here
//     }

//     actions
//     {
//         modify("C&alculate Statement")
//         {
//             trigger OnBeforeAction()
//             var
//                 Text000: Label 'Do you have completed the "Check Stock" process?';
//             begin
//                 if not Confirm(Text000, false) then
//                     Exit;
//             end;
//         }
//         addafter("Check &Transactions")
//         {
//             action("Check &Stock")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Check &Stock';
//                 Image = Check;
//                 Promoted = true;
//                 PromotedCategory = New;
//                 trigger OnAction()
//                 var
//                     StockCheckAgSales: record "Stock Check Ag Sales";
//                     StockCheckList: Page "Stock Check List";
//                     RetailUser: Record "LSC Retail User";
//                 begin
//                     Clear(RetailUser);
//                     RetailUser.GEt(UserId);
//                     StockCheckAgSales.Reset();
//                     StockCheckAgSales.SetRange("Store No.", RetailUser."Store No.");
//                     StockCheckList.SetTableView(StockCheckAgSales);
//                     StockCheckList.Run();
//                     //                    CheckTransactions;
//                 end;
//             }
//         }
//         modify("P&ost Sales Entries")
//         {
//             Visible = false;
//         }
//     }

//     var
//         myInt: Integer;
// }
pageextension 50101 "LSC Open Statement" extends "LSC Open Statement"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addbefore("C&alculate Statement")
        {
            action("Custom Cal.Statemnet")
            {
                ApplicationArea = all;
                PromotedCategory = Process;
                Promoted = true;
                Caption = 'Custom C&alculate Statement';
                Image = Calculate;
                trigger OnAction()
                var
                    myInt: Integer;
                    BatchPostingStatus: Text[30];
                    StatementCalculate: Codeunit "Custom LSC Statement-Calculate";
                    Text006: Label 'Settings controlling how the Statement is calculated have been changed. Please clear and recalculate the Statement before continuing.';
                    BatchPostingQueue: Record "LSC Batch Posting Queue";
                begin
                    if BatchPostingStatus <> '' then
                        BatchPostingQueue.EditOpenStatement(Rec);

                    if Rec.Recalculate then
                        Error(Text006);

                    if Rec.Insert(true) then;
                    StatementCalculate.Run(Rec);
                    Clear(StatementCalculate);
                end;
            }
            action("Check &Stock")
            {
                PromotedCategory = Process;
                Promoted = true;
                ApplicationArea = All;
                Caption = 'Check &Stock';
                Image = Check;
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
        modify("P&ost Sales Entries")
        {
            Visible = false;
        }
    }

    var
        myInt: Integer;
}