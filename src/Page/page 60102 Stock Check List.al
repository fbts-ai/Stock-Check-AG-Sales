page 60102 "Stock Check List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Stock Check Ag Sales";
    CardPageId = "Stock Check Against Sales";
    Editable = false;

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
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User Name field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date-Time"; Rec."Date-Time")
                {
                    ApplicationArea = All;
                    Caption = 'Creation Date Time';
                    ToolTip = 'Specifies the value of the Date-Time field.';
                }

            }
        }
    }
}