page 70017 "TO - LocaleInformation"
{
    PageType = API;
    Caption = 'Business Central Localization information for PowerApps';
    EntityName = 'LocaleInformation';
    EntitySetName = 'LocaleInformations';

    APIPublisher = 'businessCentralDemos';
    APIGroup = 'TakeOrder';
    APIVersion = 'beta';

    SourceTable = "Company Information";
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
                field(DisplayName; Rec.Name)
                {
                    Caption = 'Display Name';
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                }
                field(powerAppLocale; 'en-us')
                {
                    caption = 'PowerApp Locale';
                }
            }
        }
    }
}