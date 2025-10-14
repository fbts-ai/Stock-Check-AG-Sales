query 60100 "Item Ledger Stock"
{
    Caption = 'Item Ledger Entry';
    QueryCategory = 'Item Ledger Entry';

    elements
    {
        dataitem(Item_Ledger_Entry;
        "Item Ledger Entry")
        {
            DataItemTableFilter = "Remaining Quantity" = filter(<> 0), Positive = filter(true);
            column(Location_Code; "Location Code")
            {

            }
            column(Item_No_; "Item No.")
            {
            }
            column(Lot_No_; "Lot No.")
            {
            }
            column(Remaining_Quantity; "Remaining Quantity")
            {
                Method = Sum;
            }

        }
    }

}