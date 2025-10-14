page 60100 "Stock Check Against List"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Stock Check Ag Sales Line";
    DeleteAllowed = true;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
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
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }

                field(UOM; Rec.UOM)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the UOM field.';
                }
                field("Sale Quantity"; Rec."Sale Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sale Quantity field.';
                }

                field(Stock; Rec.Stock)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Stock field.';
                }

                field("Adj Required"; Rec."Adj Required")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Adj Required field.';
                }

                field("Pending Receiving"; Rec."Pending Receiving")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pending Receiving field.';
                }

                field("Expected Pur Receiving"; Rec."Expected Pur Receiving")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sale Quantity field.';
                }


            }
        }
    }

}