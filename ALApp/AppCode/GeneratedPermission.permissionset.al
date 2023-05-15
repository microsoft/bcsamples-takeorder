permissionset 70010 "TO - Permission"
{
    Assignable = true;
    Permissions = tabledata "TO - Labels" = RIMD,
        table "TO - Labels" = X,
        codeunit "TO - LabelManagement" = X,
        codeunit "TO - SampleDataGenerator" = X,
        codeunit "TO - ItemImages" = X,
        page "TO - Tables" = X,
        page "TO - ItemWithImage" = X,
        page "TO - LanguageResources" = X,
        page "TO - SamplePage" = X,
        page "TO - CustomerListPart" = X,
        page "TO - ItemListPart" = X;
}