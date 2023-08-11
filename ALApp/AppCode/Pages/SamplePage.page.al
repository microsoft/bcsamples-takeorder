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
                Caption = 'This is a sample page to help manage and set up the Take Order PowerApp';
            }

            group(SetUpData)
            {
                Caption = 'Set up information';
                field(CurrentEnvironment; CurrentEnvironment)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Environment Name';
                }
                field(CurrentCompanyId; CurrentCompanyId)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Company Id';
                }
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
                Caption = 'Generate or update sample Data';
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

    trigger OnOpenPage()
    var
        CompanyRecord: Record Company;
        EnvironmentInformation: Codeunit "Environment Information";
    begin
        CompanyRecord.Get(CompanyName());
        CurrentCompanyId := CompanyRecord.SystemId;
        CurrentEnvironment := EnvironmentInformation.GetEnvironmentName();
    end;

    var
        CurrentEnvironment: Text;
        CurrentCompanyId: Guid;
}