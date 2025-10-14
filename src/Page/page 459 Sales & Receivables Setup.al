pageextension 50100 MyExtensionV1 extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Order Nos.")
        {
            field("Store Check No."; Rec."Store Check No.")
            {
                ApplicationArea = all;
            }
            field("Lot Store Check No."; Rec."Lot Store Check No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Lot Store Check No. field.';
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