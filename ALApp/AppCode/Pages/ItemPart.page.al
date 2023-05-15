page 70015 "TO - ItemListPart"
{
    PageType = ListPart;
    SourceTable = Item;
    SourceTableView = where(SoldInRestaurant = const(true));

    layout
    {
        area(Content)
        {
            repeater(CustomerInformation)
            {
                field(ItemNumber; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(ItemName; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(ItemPrice; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                }
                field("longDescription"; Rec.LongItemDescription)
                {
                    ApplicationArea = All;
                }
                field(AllergenInformation; Rec.AllergenInformation)
                {
                    ApplicationArea = All;
                }
                field(showInPowerApp; Rec.SoldInRestaurant)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}