report 50111 ProductReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Good Receipt Note';
    PreviewMode = PrintLayout;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layout/ProductReport.rdl';

    dataset
    {
        // dataitem("Reservation Entry"; "Reservation Entry")
        // {
        dataitem("Company Information"; "Company Information")
        {
            // DataItemLink = "Location Code" = field("Location Code");
            trigger OnAfterGetRecord()
            var
                TodayMonth: Integer;
                SaveFromDate: date;
                SaveToDate: date;



                TodayMonth1: Integer;
                SaveFromDate1: date;
                SaveToDate1: date;

                TodayMonth2: Integer;
                SaveFromDate2: date;
                SaveToDate2: date;
            begin

                //Find Current FY-NS

                SaveFromDate2 := CALCDATE('<-1Y>', TODAY - 365);
                TodayMonth2 := Date2dmy(SaveFromDate2, 2);
                if TodayMonth2 in [1, 2, 3] then begin
                    SaveFromDate2 := Dmy2date(1, 4, Date2dmy(SaveFromDate2, 3) - 1);
                    SaveToDate2 := Dmy2date(31, 3, Date2dmy(SaveFromDate2, 3));
                end else begin
                    SaveFromDate2 := Dmy2date(1, 4, Date2dmy(SaveFromDate2, 3));
                    SaveToDate2 := Dmy2date(31, 3, Date2dmy(SaveFromDate2, 3) + 1)
                end;
                //Find Current FY-NE


                //Find PY-NS
                SaveFromDate := CALCDATE('<-CY>', TODAY - 365);
                TodayMonth := Date2dmy(SaveFromDate, 2);
                if TodayMonth in [1, 2, 3] then begin
                    SaveFromDate := Dmy2date(1, 4, Date2dmy(today, 3) - 1);
                    SaveToDate := Dmy2date(31, 3, Date2dmy(today, 3));
                end else begin
                    SaveFromDate := Dmy2date(1, 4, Date2dmy(today, 3));
                    SaveToDate := Dmy2date(31, 3, Date2dmy(today, 3) + 1)
                end;
                //Find PY-NE


                //Find Current FY-NS
                TodayMonth1 := Date2dmy(Today, 2);
                if TodayMonth1 in [1, 2, 3] then begin
                    SaveFromDate1 := Dmy2date(1, 4, Date2dmy(today, 3) - 1);
                    SaveToDate1 := Dmy2date(31, 3, Date2dmy(today, 3));
                end else begin
                    SaveFromDate1 := Dmy2date(1, 4, Date2dmy(today, 3));
                    SaveToDate1 := Dmy2date(31, 3, Date2dmy(today, 3) + 1)
                end;
                //Find Current FY-NE


                Message('%1..%2..%3..%4..%5..%6', SaveFromDate2, SaveToDate2, SaveFromDate, SaveToDate, SaveFromDate1, SaveToDate1);


            end;
        }
    }
}