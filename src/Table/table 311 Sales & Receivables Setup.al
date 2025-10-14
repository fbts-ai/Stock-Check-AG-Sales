tableextension 60100 MyExtension extends "Sales & Receivables Setup"
{
    fields
    {
        field(60100; "Store Check No."; code[20])
        {
            TableRelation = "No. Series";
        }
        field(60101; "Lot Store Check No."; code[20])
        {
            TableRelation = "No. Series";
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}