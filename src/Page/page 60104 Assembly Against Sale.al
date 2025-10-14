page 60104 "Assembly Against Sale"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Assembly Against Sale";
    Editable = true;
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Parent Item No."; Rec."Parent Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Parent Item No. field.', Comment = '%';
                }
                field("Parent Item Description"; Rec."Parent Item Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Parent Item Description field.', Comment = '%';
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order No. field.', Comment = '%';
                }
                field("Order Created"; Rec."Order Created")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order Created field.', Comment = '%';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Error Text field.', Comment = '%';
                }
                field("Sale Qty"; Rec."Sale Qty")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sale Qty field.', Comment = '%';
                }
                field("Store No."; Rec."Store No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Store No. field.', Comment = '%';
                }
                field("Error Text"; Rec."Error Text")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Error Text field.', Comment = '%';
                }
                field("Parent Item UOM"; Rec."Parent Item UOM")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Parent Item UOM field.', Comment = '%';
                }
                field("BOM Level"; Rec."BOM Level")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the BOM Level field.', Comment = '%';
                }

            }
        }
    }
}