codeunit 70011 "TO - SampleDataGenerator"
{
    var
        DeleteDemodataConfirmationQst: Label 'Are you sure you want to delete all sample data generated for the Take Order app?';
        DemodataDeletedMsg: Label 'Sample data deleted successfully.';
        DemodataCreatedMsg: Label 'Sample data created successfully.';
        InvalidItemTemplateErr: Label 'We tried to create some sample items, but we could not apply the template "%1". Make sure you are running in an evaluation company with a valid item template.';
        InvalidCustTemplateErr: Label 'We tried to create some sample customers, but we could not apply the template "%1". Make sure you are running in an evaluation company with a valid customer template.';

    procedure DeleteDemoDataForPowerApps()
    var
        ItemRecord: Record Item;
        CustomerRecord: Record Customer;
    begin
        if not Confirm(DeleteDemodataConfirmationQst) then
            exit;

        // Delete all added items
        ItemRecord.SetRange(SoldInRestaurant, true);
        ItemRecord.DeleteAll(true);

        // Delete all added tables (customers)
        CustomerRecord.SetRange(IsTable, true);
        CustomerRecord.DeleteAll(true);

        Message(DemodataDeletedMsg);
    end;

    procedure GenerateDemoDataForPowerApps()
    begin
        GenerateDemoDataForTakeMyOrder();
    end;

    local procedure GenerateDemoDataForTakeMyOrder()
    var
        CustomerRecord: Record Customer;
        ItemRecord: Record Item;
        ItemImages: Codeunit "TO - ItemImages";
    begin
        AddCustomer('Table 1');
        AddCustomer('Table 2');
        AddCustomer('Table 3');
        AddCustomer('Table 4');
        AddCustomer('Table 5');
        AddCustomer('Table 6');

        AddItemCatagories('Warm drinks', 'warmDrinks');
        AddItemCatagories('Cold drinks', 'coldDrinks');
        AddItemCatagories('Food', 'food');

        AddItem('W0001', 'Caffè', 'warmDrinks', '', 'Hawaii dark roast has scents of cedar and roasted hazelnuts with flavors of chocolate, toasted nuts, and a tangy strawberry finish.', 2.00, ItemImages.W0001_Caffe());
        AddItem('W0002', 'Caffè Doppio', 'warmDrinks', '', 'Brazil medium roast: chocolate, honey, caramel notes, and a deep finish. Low-acidity for a smoother cup.', 3.00, ItemImages.W0002_CaffeDoppio());
        Additem('W0003', 'Americano', 'warmDrinks', '', 'This organic light roast from Costa Rica offers a nutty taste profile balanced with hints of caramel and vanilla.', 2.00, ItemImages.W0003_Americano());
        AddItem('W0004', 'Cappuccino', 'warmDrinks', 'Lactose', 'Indonesia medium roast, dry-processed, with delicate acidity and silky texture. Notes of floral, fruit, citrus, caramel, and nuts.', 4.00, ItemImages.W0004_Cappuccino());
        AddItem('W0005', 'Tea', 'warmDrinks', '', 'Choose between Earl Grey, Breakfast, Lemongrass & Ginger or Organic Chai', 3.00, ItemImages.W0005_Tea());
        AddItem('C0001', 'Water', 'coldDrinks', '', 'Sparkling water', 1.00, ItemImages.C0001_Water());
        AddItem('C0002', 'Smoothie', 'coldDrinks', 'Nuts, lactose', 'Strawberry (frozen) with banana, yogurt, and almond milk', 4.50, ItemImages.C0002_Smoothie());
        AddItem('C0003', 'Coke Zero', 'coldDrinks', '', '25 cl Coke Zero with ice', 2.00, ItemImages.C0003_Coke());
        AddItem('C0004', 'Frappuccino', 'coldDrinks', 'Lactose', 'Espresso with milk, crushed ice and whipped cream', 5.00, ItemImages.C0004_Frappuccino());
        AddItem('C0005', 'Cold brew', 'coldDrinks', 'Lactose', 'Cold brewed coffee with crushed ice and milk', 3.00, ItemImages.C0005_IceCoffee());
        AddItem('P0001', 'Croissant', 'food', '', 'French croissant based on the recipe from ”Des substances alimentaires”, 1853', 2.50, ItemImages.P0001_Croissant());
        AddItem('P0002', 'Scone', 'food', 'Nuts, lactose, gluten', 'British scone with raisins served with butter and jam', 2.50, ItemImages.P0002_Scone());
        AddItem('P0003', 'Cinnamon bun', 'food', 'Lactose, gluten', 'Classic Swedish “kanelbulla” recipe with both ground cinnamon, cardamom and pearl sugar', 3.00, ItemImages.P0003_CinnamonRoll());
        AddItem('P0004', 'Chocolate muffin', 'food', 'Nuts, lactose, gluten', 'Moist American quickbread muffin with chocolate chip', 3.50, ItemImages.P0004_ChocolateMuffin());
        AddItem('P0005', 'Lemon tart', 'food', 'Lactose, gluten', 'Pastry base with lemon curd topped with meringue', 4.00, ItemImages.P0005_LemonTart());
        AddItem('P0006', 'Blueberry pie', 'food', 'Nuts, lactose, gluten', 'Hazelnut pie base with Finnish blueberry, vanilla cream, milk chocolate and mint', 4.00, ItemImages.P0006_BlueberryPie());

        Message(DemodataCreatedMsg);
    end;

    local procedure AddItem(ItemNumber: Text; ItemName: Text; itemCategory: Text; allergenInformation: Text; ShortDescription: Text; UnitPrice: Decimal; ItemPicture: Text)
    var
        ItemTempl: Record "Item Templ.";
        ItemRecord: Record Item;
        ItemTemplMgt: Codeunit "Item Templ. Mgt.";
        ItemCreated: Boolean;
        IsHandled: Boolean;
    begin
        // Create item with manual primary key
        ItemRecord.Init();
        ItemRecord.Validate("No.", ItemNumber);

        // Apply item template for physical items
        ItemTempl.SetFilter("Inventory Posting Group", '<>%1', '');
        ItemTempl.FindFirst();
        ItemCreated := ItemTemplMgt.CreateItemFromTemplate(ItemRecord, IsHandled, ItemTempl.Code);
        if not ItemCreated or not IsHandled then
            Error(InvalidItemTemplateErr, ItemTempl.Code);

        // Update the item information
        ItemRecord.Get(ItemNumber);
        ItemRecord.Validate(Description, ItemName);
        ItemRecord.Validate("Unit Price", UnitPrice);
        ItemRecord.Validate("Item Category Code", itemCategory);
        ItemRecord.Validate(ShortItemDescription, ShortDescription);
        ItemRecord.Validate(AllergenInformation, allergenInformation);
        ItemRecord.Validate(SoldInRestaurant, true);
        ItemRecord.Modify(true);

        AddImageToItem(ItemPicture, ItemRecord);
        AddItemUnitOfMeasure(ItemNumber);
    end;

    local procedure AddCustomer(CustomerName: Text)
    var
        CustomerRecord: Record Customer;
        CustomerTempl: Record "Customer Templ.";
        TaxAreaCode: Record "Tax Area";
        CustomerTemplMgt: Codeunit "Customer Templ. Mgt.";
        CustomerCreated: Boolean;
        IsHandled: Boolean;
    begin
        // Apply first customer template for person
        CustomerTempl.SetRange("Contact Type", CustomerTempl."Contact Type"::Person);
        CustomerTempl.FindFirst();
        CustomerCreated := CustomerTemplMgt.CreateCustomerFromTemplate(CustomerRecord, IsHandled, CustomerTempl.Code);
        if not CustomerCreated or not IsHandled then
            Error(InvalidCustTemplateErr, CustomerTempl.Code);

        // Update the customer information
        CustomerRecord.Get(CustomerRecord."No.");
        CustomerRecord.Validate(Name, CustomerName);
        CustomerRecord.Validate(IsTable, true);
        CustomerRecord.Modify(true);
    end;

    local procedure AddItemCatagories(Description: Text; code: Text)
    var
        ItemCategory: Record "Item Category";
    begin
        if ItemCategory.Get(code) then
            exit;

        ItemCategory.Init();
        ItemCategory.Validate(Description, Description);
        ItemCategory.Validate(Code, code);
        ItemCategory.Insert(true);
    end;

    local procedure AddItemUnitOfMeasure(ItemNumber: Text)
    var
        ItemUnitOfMeasure: Record "Item Unit of Measure";
        ItemRecord: Record Item;
    begin
        ItemRecord.Get(ItemNumber);

        ItemUnitOfMeasure.SetRange("Item No.", ItemNumber);
        ItemUnitOfMeasure.SetRange(Code, ItemRecord."Base Unit of Measure");
        if ItemUnitOfMeasure.FindFirst() then
            exit;

        ItemUnitOfMeasure.Init();
        ItemUnitOfMeasure.Validate("Item No.", ItemNumber);
        ItemUnitOfMeasure.Validate(Code, ItemRecord."Base Unit of Measure");
        ItemUnitOfMeasure.Insert(true);
    end;

    local procedure AddImageToItem(Base64Img: Text; var ItemRecord: Record Item)
    var
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
    begin
        Outstr := TempBlob.CreateOutStream();
        Base64Convert.FromBase64(Base64Img, Outstr);
        ItemRecord.Picture.ImportStream(TempBlob.CreateInStream(), 'Image demo data for Item ' + ItemRecord."No.");
        ItemRecord.Modify(true);
    end;
}