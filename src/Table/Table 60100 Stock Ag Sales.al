table 60100 "Stock Check Ag Sales"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Store No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "LSC Store";
            trigger OnValidate()
            begin
                IF "No." <> xRec."No." THEN BEGIN
                    SalesSetup.GET;
                    NoSeriesMgt.TestManual(SalesSetup."Store Check No.");
                END;
            end;

        }
        field(2; "Date"; Date)
        {
            DataClassification = ToBeClassified;

        }

        field(3; "User Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Date-Time"; DateTime)
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Posted"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(7; "No. Series"; code[20])
        {
            DataClassification = CustomerContent;
            // TableRelation = "No. Series";
            Editable = false;
        }
        field(8; "No."; code[20])
        {
            DataClassification = CustomerContent;
            // TableRelation = "No. Series";
            Editable = false;
        }

    }

    keys
    {
        key(Key1; "Store No.", Date)
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
    var
        LSCRetailUser: Record "LSC Retail User";
    begin
        Clear(LSCRetailUser);
        LSCRetailUser.Get(UserId);
        Rec."Store No." := LSCRetailUser."Store No.";
        rec."User Name" := LSCRetailUser.Name;
        Rec."Created By" := UserId;
        Rec."Date-Time" := CurrentDateTime;


        SalesSetup.GET;
        IF "No." = '' THEN BEGIN
            SalesSetup.TESTFIELD("Store Check No.");
            NoSeriesMgt.InitSeries(SalesSetup."Store Check No.", xRec."No. Series", WORKDATE, "No.", "No. Series");

        end;


    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    var
        StockCheckAgSalesLine: Record "Stock Check Ag Sales Line";
    begin
        StockCheckAgSalesLine.Reset();
        StockCheckAgSalesLine.SetRange("Store No.", Rec."Store No.");
        StockCheckAgSalesLine.SetRange(Date, Rec.Date);
        StockCheckAgSalesLine.DeleteAll();
    end;

    trigger OnRename()
    begin

    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}