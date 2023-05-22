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
                field(ItemCategoryCode; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                }
                field(ShortDescription; Rec.ShortItemDescription)
                {
                    ApplicationArea = All;
                }
                field(Facts; Rec.Facts)
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