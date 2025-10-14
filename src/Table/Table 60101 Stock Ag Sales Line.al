table 60101 "Stock Check Ag Sales Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Store No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Date"; Date)
        {
            DataClassification = ToBeClassified;

        }

        field(3; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Description"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "UOM"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Sale Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(7; "Stock"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(8; "Adj Required"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(9; "Pending Receiving"; Decimal)
        {
            DataClassification = ToBeClassified;

        }

        field(10; "Expected Pur Receiving"; Decimal)
        {
            DataClassification = ToBeClassified;

        }


    }

    keys
    {
        key(Key1; "Store No.", Date, "Item No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}