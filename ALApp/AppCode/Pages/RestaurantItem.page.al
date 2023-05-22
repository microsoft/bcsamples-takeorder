pageextension 70012 "TO - RestaurantItem" extends "Item Card"
{
    layout
    {
        addafter(Item)
        {
            group("Restaurant Information")
            {
                field(SoldInRestaurant; Rec.SoldInRestaurant)
                {
                    Caption = 'Sold in Restaurant';
                    ToolTip = 'Check this box if the item is sold in the restaurant.';
                    ApplicationArea = All;
                }
                field(AllergenInformation; Rec.AllergenInformation)
                {
                    Caption = 'Allergen Information';
                    ToolTip = 'Enter the allergen information for the item.';
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field(LongItemDescription; Rec.ShortItemDescription)
                {
                    Caption = 'Long Item Description';
                    ToolTip = 'Enter the long item description for the item.';
                    ApplicationArea = All;
                    MultiLine = true;
                }
            }
        }
    }
}