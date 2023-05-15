tableextension 70011 "TO - Item" extends Item
{
    fields
    {
        field(70010; SoldInRestaurant; Boolean)
        {
            Caption = 'Is Item sold in Restaurant';
            DataClassification = CustomerContent;
        }
        field(70011; LongItemDescription; Text[1000])
        {
            Caption = 'Long Item Description';
            DataClassification = CustomerContent;
        }
        field(70012; AllergenInformation; Text[1000])
        {
            Caption = 'Allergen Information';
            DataClassification = CustomerContent;
        }
    }
}