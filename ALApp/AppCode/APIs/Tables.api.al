page 70013 "TO - Tables"
{
    PageType = API;
    Caption = 'Tables';
    EntityName = 'Table';
    EntitySetName = 'Tables';

    APIPublisher = 'businessCentralDemos';
    APIGroup = 'TakeOrder';
    APIVersion = 'beta';

    SourceTable = Customer;
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
                field(number; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field(mail; Rec."E-Mail")
                {
                    Caption = 'E-Mail';
                }
                field(phone; Rec."Phone No.")
                {
                    Caption = 'Phone';
                }
                field(itemImageText; Rec.Image)
                {
                    Caption = 'Picture Reference';
                }
                field(IsTable; Rec.IsTable)
                {
                    Caption = 'Is Table';
                }
            }
        }
    }
}