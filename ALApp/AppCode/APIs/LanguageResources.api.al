page 70014 "TO - LanguageResources"
{
    PageType = API;
    Caption = 'Take Order Language Resources';
    EntityName = 'LanguageResource';
    EntitySetName = 'LanguageResources';
    APIPublisher = 'businessCentralDemos';
    APIGroup = 'TakeOrder';
    APIVersion = 'beta';

    InsertAllowed = false;
    ModifyAllowed = false;
    SourceTable = "TO - Labels";
    SourceTableTemporary = true;
    Extensible = false;
    ODataKeyFields = "Label ID";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(labelId; Rec."Label ID")
                {
                    Caption = 'Label Id';
                }
                field(DisplayName; Rec."Text Value")
                {
                    Caption = 'Text Value';
                }
                field(languageCode; Rec."Language Code")
                {
                    Caption = 'Language Code';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    var
        LabelManagement: Codeunit "TO - LabelManagement";
        LanguageFilter: Text;
    begin
        LanguageFilter := Rec.GetFilter("Language Code");
        LabelManagement.GetLabelsForLanguage(Rec, LanguageFilter);
    end;
}