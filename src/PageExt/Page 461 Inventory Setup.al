pageextension 50103 "Inventory Setup" extends "Inventory Setup"
{
    layout
    {
        addafter("Transfer Order Nos.")
        {

            field("Auto Assembly API"; Rec."Auto Assembly API")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Auto Assembly API field.', Comment = '%';
            }
            field("Inv Chk Ag Sales API"; Rec."Inv Chk Ag Sales API")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Inv Chk Ag Sales API field.', Comment = '%';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}