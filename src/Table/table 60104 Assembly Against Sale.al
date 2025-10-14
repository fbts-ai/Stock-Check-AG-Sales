table 60104 "Assembly Against Sale"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Store No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Trans. Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Parent Item No."; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "BOM Level"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Parent Item Description"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Parent Item UOM"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Sale Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(8; "Order Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Error Text"; Code[500])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Posted"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        // field(12; "Posted Sucess"; Boolean)
        // {
        //     DataClassification = ToBeClassified;
        // }

    }

    keys
    {
        key(Key1; "Store No.", "Trans. Date", "Parent Item No.")
        {
            Clustered = true;
        }
    }
}