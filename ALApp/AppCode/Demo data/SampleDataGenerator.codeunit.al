codeunit 70011 "TO - SampleDataGenerator"
{
    procedure DeleteDemoDataForPowerApps()
    var
        ItemRecord: Record Item;
        CustomerRecord: Record Customer;
    begin
        // Delete all added items
        ItemRecord.SetRange(SoldInRestaurant, true);
        ItemRecord.DeleteAll(true);

        // Delete all added tables (customers)
        CustomerRecord.SetRange(IsTable, true);
        CustomerRecord.DeleteAll(true);
    end;

    procedure GenerateDemoDataForPowerApps()
    begin
        GenerateDemoDataForTakeMyOrder();
    end;

    procedure GenerateDemoDataForTakeMyOrder()
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

        Message('Demo data generated');
    end;

    procedure AddItem(ItemNumber: Text; ItemName: Text; itemCategory: Text; allergenInformation: Text; LongDescription: Text; UnitPrice: Decimal; ItemPicture: Text)
    var
        ItemRecord: Record Item;
        InventoryGroup: Record "Inventory Posting Group";
        ItemUnitOfMeasure: Record "Item Unit of Measure";
        GenProdPostingGroup: Record "Gen. Product Posting Group";
        TaxGroupCode: Record "Tax Group";
    begin
        InventoryGroup.FindFirst();
        TaxGroupCode.FindFirst();
        GenProdPostingGroup.Get('RETAIL');

        ItemRecord.Init();
        ItemRecord.Validate("No.", ItemNumber);
        ItemRecord.Validate(Description, ItemName);
        ItemRecord.Validate("Unit Price", UnitPrice);
        ItemRecord.Validate("Item Category Code", itemCategory);
        ItemRecord.Validate(LongItemDescription, LongDescription);
        ItemRecord.Validate(AllergenInformation, allergenInformation);
        ItemRecord.Validate("Inventory Posting Group", InventoryGroup.Code);
        ItemRecord.Validate("Gen. Prod. Posting Group", GenProdPostingGroup.Code);
        ItemRecord.Validate("Tax Group Code", TaxGroupCode.Code);
        ItemRecord.Validate(SoldInRestaurant, true);

        AddImageToItem(ItemPicture, ItemRecord);
        ItemRecord.Insert(true);

        AddItemUnitOfMeasure(ItemNumber);
    end;

    procedure AddCustomer(CustomerName: Text)
    var
        CustomerRecord: Record Customer;
        CustomerPostingGroup: Record "Customer Posting Group";
        PaymentTerms: Record "Payment Terms";
        GenBusPostingGroup: Record "Gen. Business Posting Group";
        TaxAreaCode: Record "Tax Area";
    begin
        CustomerPostingGroup.FindFirst();
        TaxAreaCode.FindFirst();
        GenBusPostingGroup.FindFirst();
        PaymentTerms.Get('COD');

        CustomerRecord.Init();
        CustomerRecord.Validate(Name, CustomerName);
        CustomerRecord.Validate(IsTable, true);
        CustomerRecord.Validate("Customer Posting Group", CustomerPostingGroup.Code);
        CustomerRecord.Validate("Payment Terms Code", PaymentTerms.Code);
        CustomerRecord.Validate("Gen. Bus. Posting Group", GenBusPostingGroup.Code);
        CustomerRecord.Validate("Tax Area Code", TaxAreaCode.Code);
        CustomerRecord.Insert(true);
    end;

    procedure AddItemCatagories(Description: Text; code: Text)
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

    procedure AddItemUnitOfMeasure(ItemNumber: Text)
    var
        ItemUnitOfMeasure: Record "Item Unit of Measure";
        ItemRecord: Record Item;
    begin
        ItemUnitOfMeasure.SetRange("Item No.", ItemNumber);
        ItemUnitOfMeasure.SetRange(Code, 'PCS');
        if ItemUnitOfMeasure.FindFirst() then
            exit;

        ItemUnitOfMeasure.Init();
        ItemUnitOfMeasure.Validate("Item No.", ItemNumber);
        ItemUnitOfMeasure.Validate(Code, 'PCS');
        ItemUnitOfMeasure.Insert(true);

        ItemRecord.Get(ItemNumber);
        ItemRecord.validate("Base Unit of Measure", 'PCS');
        ItemRecord.Modify(true);
    end;

    procedure AddImageToItem(Base64Img: Text; var itemRecord: Record Item)
    var
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
    begin
        Outstr := TempBlob.CreateOutStream();
        Base64Convert.FromBase64(Base64Img, Outstr);
        itemRecord.Picture.ImportStream(TempBlob.CreateInStream(), 'Image demo data for Item');
    end;
}
