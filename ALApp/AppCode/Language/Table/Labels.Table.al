table 70010 "TO - Labels"
{
    Caption = 'Take Order - Labels';
    DataClassification = SystemMetadata;
    ReplicateData = false;
    TableType = "temporary";

    fields
    {
        field(1; "Label ID"; Text[100])
        {
            Caption = 'Label ID';
            DataClassification = SystemMetadata;
        }
        field(2; "Text Value"; Text[250])
        {
            Caption = 'Text Value';
            DataClassification = SystemMetadata;
        }
        field(3; "Language Code"; Text[10])
        {
            Caption = 'Language Code';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Label ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}