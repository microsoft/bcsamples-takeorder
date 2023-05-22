page 70011 "TO - ItemWithImage"
{
    PageType = API;
    Caption = 'Item with image';
    EntityName = 'itemWithImage';
    EntitySetName = 'itemsWithImage';

    APIPublisher = 'businessCentralDemos';
    APIGroup = 'TakeOrder';
    APIVersion = 'beta';

    SourceTable = "Item";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'System ID';
                }
                field(number; Rec."No.")
                {
                    Caption = 'Number';
                }
                field(DisplayName; Rec.Description)
                {
                    Caption = 'Display Name';
                }
                field("unitPrice"; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(baseUnitOfMeasureCode; Rec."Base Unit of Measure")
                {
                    Caption = 'Base Unit Of Measure Code';
                }
                field(itemImageText; Rec.Picture)
                {
                    Caption = 'Picture Reference';
                }
                field(GTIN; Rec.GTIN)
                {
                    Caption = 'GTIN';
                }
                field(SoldInRestaurant; Rec.SoldInRestaurant)
                {
                    Caption = 'Sold In Restaurant';
                }
                field(ShortItemDescription; Rec.ShortItemDescription)
                {
                    Caption = 'Short Item Description';
                }
                field(Facts; Rec.Facts)
                {
                    Caption = 'Facts';
                }
                field(AllergenInformation; Rec.AllergenInformation)
                {
                    Caption = 'Allergen Information';
                }
                field(itemCategoryName; ItemCategoryName)
                {
                    Editable = false;
                    Caption = 'Item Category Name';
                }
                field("itemCategoryCode"; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }
                field(picture; TempPictureBlobStorage."Value BLOB")
                {
                    Caption = 'Picture';
                }
                field(pictureHeight; PictureHeight)
                {
                    Editable = false;
                    Caption = 'Picture Height';
                }
                field(pictureWidth; PictureWidth)
                {
                    Editable = false;
                    Caption = 'Picture Width';
                }
            }
        }
    }

    var
        ItemCategoryName: Text[100];
        TempPictureBlobStorage: Record "Name/Value Buffer" temporary; // The temporary record is used to load the picture
        PictureHeight: Integer;
        PictureWidth: Integer;

    trigger OnAfterGetRecord()
    var
        TenantMedia: Record "Tenant Media";
        OutStr: OutStream;
        InStr: InStream;
        MediaId: Guid;
        RecordR: RecordRef;
        FieldR: FieldRef;
        ItemCategory: Record "Item Category";
    begin
        TempPictureBlobStorage.DeleteAll();
        TempPictureBlobStorage.Init();
        TempPictureBlobStorage."Value BLOB".CreateOutStream(OutStr);

        // If the picture is of type Media, use this code:
        // Rec.Picture.Image.ExportStream(OutStr);

        // If the picture is of type MediaSet, use this code:
        if Rec.Picture.Count > 0 then begin
            // If there are more than 1 pictures for this item. We take the first one.
            MediaId := Rec.Picture.Item(1);

            TenantMedia.SetAutoCalcFields(Content);
            if not TenantMedia.Get(MediaID) then
                exit;

            TenantMedia.Content.CreateInStream(InStr);
            CopyStream(OutStr, InStr);

            PictureWidth := TenantMedia.Width;
            PictureHeight := TenantMedia.Height;
        end;

        TempPictureBlobStorage.Insert();

        ItemCategoryName := '';
        if Rec."Item Category Code" <> '' then begin
            if ItemCategory.Get(Rec."Item Category Code")
            then
                ItemCategoryName := ItemCategory.Description
        end;
    end;

    [ServiceEnabled]
    procedure UpdateInventoryForLocation(LocationCode: Code[10]; NewInventoryValue: Decimal)
    var
        ItemJournalLine: Record "Item Journal Line";
        ItemJnlPostLine: Codeunit "Item Jnl.-Post Line";
    begin
        Rec.SetRange("Location Filter", LocationCode);
        Rec.calcfields(Inventory);
        if Rec.Inventory = NewInventoryValue then
            exit;

        ItemJournalLine.Init();
        ItemJournalLine.Validate("Posting Date", Today());
        ItemJournalLine."Document No." := Rec."No.";
        ItemJournalLine."Location Code" := LocationCode;

        if Rec.Inventory < NewInventoryValue then
            ItemJournalLine.Validate("Entry Type", ItemJournalLine."Entry Type"::"Positive Adjmt.")
        else
            ItemJournalLine.Validate("Entry Type", ItemJournalLine."Entry Type"::"Negative Adjmt.");

        ItemJournalLine.Validate("Item No.", Rec."No.");
        ItemJournalLine.Validate(Description, Rec.Description);
        ItemJournalLine.Validate(Quantity, Abs(NewInventoryValue - Rec.Inventory));

        ItemJnlPostLine.RunWithCheck(ItemJournalLine);
        Rec.Get(Rec."No.");
    end;
}
