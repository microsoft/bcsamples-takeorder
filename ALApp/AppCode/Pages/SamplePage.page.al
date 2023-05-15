page 70010 "TO - SamplePage"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Take Order sample data';

    layout
    {
        area(Content)
        {
            label(Processing)
            {
                Caption = 'This is a sample page to generate and delete data for the Take Order PowerApp';
            }
            part(PowerAppCustomers; "TO - CustomerListPart")
            {
                Editable = false;
                Caption = 'Tables - Customers';
            }

            part(PowerAppItems; "TO - ItemListPart")
            {
                Editable = false;
                Caption = 'Restuarant - Items';
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            actionref(PromotedGenerateTestData; GenerateTestData)
            {

            }
            actionref(PromotedDeleteTestData; DeleteTestData)
            {

            }
        }
        area(Processing)
        {
            action(GenerateTestData)
            {
                ApplicationArea = All;
                Caption = 'Generate sample Data';
                trigger OnAction()
                var
                    sampleDataGenerator: Codeunit "TO - SampleDataGenerator";
                begin
                    sampleDataGenerator.GenerateDemoDataForPowerApps();
                end;
            }
            action(DeleteTestData)
            {
                ApplicationArea = All;
                Caption = 'Delete sample Data';
                trigger OnAction()
                var
                    sampleDataGenerator: Codeunit "TO - SampleDataGenerator";
                begin
                    sampleDataGenerator.DeleteDemoDataForPowerApps();
                end;
            }
        }
    }
}