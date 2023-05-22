codeunit 70012 "TO - LabelManagement"
{
    // Codeunit for generating the static values that the Take Order app use for titles or other
    // text labels. This approach lets reports get values translated for the user's locale rather than hardcoding English.
    trigger OnRun()
    begin
    end;

    var
        GallerySelect: Label 'GallerySelect', Locked = true;
        GallerySelect_ValueTxt: Label 'Click to select';

        LoadingMessage: Label 'LoadingMessage', Locked = true;
        LoadingMessage_ValueTxt: Label 'Loading data...';

        Subtract: Label 'Subtract', Locked = true;
        SubTract_ValueTxt: Label 'Substract one from the quantity';

        AddText: Label 'AddText', Locked = true;
        AddText_ValueTxt: Label 'Add one to the quantity';

        DismissQuantityControl: Label 'DismissQuantityControl', Locked = true;
        DismissQuantityControl_ValueTxt: Label 'Dismiss the quantity control';

        FirstAdd: Label 'FirstAdd', Locked = true;
        FirstAdd_ValueTxt: Label 'Add to selection';

        ItemImageText: Label 'ItemImageText', Locked = true;
        ItemImageText_ValueTxt: Label 'Image of item: ';

        StartScreen_TakeOrder: Label 'StartScreen_TakeOrder', Locked = true;
        StartScreen_TakeOrder_ValueTxt: Label 'Take Order';

        StartScreen_User: Label 'StartScreen_User', Locked = true;
        StartScreen_User_ValueTxt: Label 'User:';

        StartScreen_InfoScreen: Label 'StartScreen_InfoScreen', Locked = true;
        StartScreen_InfoScreen_ValueTxt: Label 'Open about screen';

        InfoScreen_Close: Label 'InfoScreen_Close', Locked = true;
        InfoScreen_Close_ValueTxt: Label 'Close the page';

        InfoScreen_Title: Label 'InfoScreen_Title', Locked = true;
        InfoScreen_Title_ValueTxt: Label 'Business Central sample app';

        InfoScreen_Text: Label 'InfoScreen_Text', Locked = true;
        InfoScreen_Text_ValueTxt: Label 'Take Order is a simple sample app that shows how to build a high fidelity canvas Power App using Business Central data.';

        InfoScreen_ReadMore: Label 'InfoScreen_ReadMore', Locked = true;
        InfoScreen_ReadMore_ValueTxt: Label 'Read more about Business Central sample apps:';

        InfoScreen_Link: Label 'InfoScreen_Link', Locked = true;
        InfoScreen_Link_ValueTxt: Label 'Sample apps';

        InfoScreen_LinkToolTip: Label 'InfoScreen_LinkToolTip', Locked = true;
        InfoScreen_LinkToolTip_ValueTxt: Label 'Click to open the sample app documentation page';

        SelectTableScreen_Title: Label 'SelectTableScreen_Title', Locked = true;
        SelectTableScreen_Title_ValueTxt: Label 'Select table';

        SelectTableScreen_Free: Label 'SelectTableScreen_Free', Locked = true;
        SelectTableScreen_Free_ValueTxt: Label 'Free';

        SelectTableScreen_Occupied: Label 'SelectTableScreen_Occupied', Locked = true;
        SelectTableScreen_Occupied_ValueTxt: Label 'Order placed';

        SelectTableScreen_Update: Label 'SelectTableScreen_Update', Locked = true;
        SelectTableScreen_Update_ValueTxt: Label 'Refresh the list';

        SelectTableScreen_GalleryToolTip: Label 'SelectTableScreen_GalleryToolTip', Locked = true;
        SelectTableScreen_GalleryToolTip_ValueTxt: Label 'Gallery with available tables';

        TakeOrderScreen_FullMenu: Label 'TakeOrderScreen_FullMenu', Locked = true;
        TakeOrderScreen_FullMenu_ValueTxt: Label 'Full menu';

        TakeOrderScreen_Items: Label 'TakeOrderScreen_Items', Locked = true;
        TakeOrderScreen_Items_ValueTxt: Label 'Items:';

        TakeOrderScreen_Totals: Label 'TakeOrderScreen_Totals', Locked = true;
        TakeOrderScreen_Totals_ValueTxt: Label 'Total:';

        TakeOrderScreen_Review: Label 'TakeOrderScreen_Review', Locked = true;
        TakeOrderScreen_Review_ValueTxt: Label 'Review';

        TakeOrderScreen_Close: Label 'TakeOrderScreen_Close', Locked = true;
        TakeOrderScreen_Close_ValueTxt: Label 'Close the list';

        TakeOrderScreen_Delete: Label 'TakeOrderScreen_Delete', Locked = true;
        TakeOrderScreen_Delete_ValueTxt: Label 'Delete the selection';

        TakeOrderScreen_FilterGallery: Label 'TakeOrderScreen_FilterGallery', Locked = true;
        TakeOrderScreen_FilterGallery_ValueTxt: Label 'A gallery with the available item filters';

        TakeOrderScreen_ItemGallery: Label 'TakeOrderScreen_ItemGallery', Locked = true;
        TakeOrderScreen_ItemGallery_ValueTxt: Label 'A gallery with the available items';

        ItemScreen_Title: Label 'ItemScreen_Title', Locked = true;
        ItemScreen_Title_ValueTxt: Label 'Item details';

        ItemScreen_Close: Label 'ItemScreen_Close', Locked = true;
        ItemScreen_Close_ValueTxt: Label 'Close the page';

        ItemScreen_Description: Label 'ItemScreen_Description', Locked = true;
        ItemScreen_Description_ValueTxt: Label 'Description';

        ItemScreen_Allergens: Label 'ItemScreen_Allergens', Locked = true;
        ItemScreen_Allergens_ValueTxt: Label 'Allergens';


        ItemScreen_Facts: Label 'ItemScreen_Facts', Locked = true;
        ItemScreen_Facts_ValueTxt: Label 'Coffee Facts';

        SummaryScreen_Delete: Label 'SummaryScreen_Delete', Locked = true;
        SummaryScreen_Delete_ValueTxt: Label 'Delete the order';

        SummaryScreen_Back: Label 'SummaryScreen_Back', Locked = true;
        SummaryScreen_Back_ValueTxt: Label 'Go back to the previous page';

        SummaryScreen_Submit: Label 'SummaryScreen_Submit', Locked = true;
        SummaryScreen_Submit_ValueTxt: Label 'Submit';

        SummaryScreen_AddMore: Label 'SummaryScreen_AddMore', Locked = true;
        SummaryScreen_AddMore_ValueTxt: Label 'Add more';

        SummaryScreen_CheckOut: Label 'SummaryScreen_CheckOut', Locked = true;
        SummaryScreen_CheckOut_ValueTxt: Label 'Checkout';

        SummaryScreen_Total: Label 'SummaryScreen_Total', Locked = true;
        SummaryScreen_Total_ValueTxt: Label 'Total:';

        SummaryScreen_DeleteMessage: Label 'SummaryScreen_DeleteMessage', Locked = true;
        SummaryScreen_DeleteMessage_ValueTxt: Label 'Are you sure you want to cancel the order?';

        SummaryScreen_CheckOutMessage: Label 'SummaryScreen_CheckOutMessage', Locked = true;
        SummaryScreen_CheckOutMessage_ValueTxt: Label 'Are you sure you want to check out and close the order?';

        SummaryScreen_Gallery: Label 'SummaryScreen_Gallery', Locked = true;
        SummaryScreen_Gallery_ValueTxt: Label 'A gallery with the ordered items';

        SummaryScreen_SummaryStateExpanded: Label 'SummaryScreen_SummaryStateExpanded', Locked = true;
        SummaryScreen_SummaryStateExpanded_ValueTxt: Label 'Group summary expanded.';

        SummaryScreen_SummaryStateCollapsed: Label 'SummaryScreen_SummaryStateCollapsed', Locked = true;
        SummaryScreen_SummaryStateCollapsed_ValueTxt: Label 'Group summar collapsed.';

        SummaryScreen_SummaryDraftTitle: Label 'SummaryScreen_SummaryDraftTitle', Locked = true;
        SummaryScreen_SummaryDraftTitle_ValueTxt: Label 'Order (draft)';

        SummaryScreen_SummaryAddTo: Label 'SummaryScreen_SummaryAddTo', Locked = true;
        SummaryScreen_SummaryAddTo_ValueTxt: Label 'Add to order';

        SummaryScreen_SummarySubmittedTitle: Label 'SummaryScreen_SummarySubmittedTitle', Locked = true;
        SummaryScreen_SummarySubmittedTitle_ValueTxt: Label 'Order ';

        SummaryScreen_OrderUpdatedMessage: Label 'SummaryScreen_OrderUpdatedMessage', Locked = true;
        SummaryScreen_OrderUpdatedMessage_ValueTxt: Label 'Order updated for ';

    procedure GetLabelsForLanguage(var TempPowerAppsLabels: Record "TO - Labels" temporary; LanguageFilter: Text)
    var
        PreviousLanguage: Integer;
        LanguageCodeId: Integer;
    begin
        LanguageCodeId := LanguageCodeToLanguageLcid(LanguageFilter);
        PreviousLanguage := GlobalLanguage();
        GlobalLanguage(LanguageCodeId);

        GetReportLabels(TempPowerAppsLabels, LanguageFilter);

        GlobalLanguage(PreviousLanguage);
    end;

    procedure LanguageCodeToLanguageLcid(LanguageCode: Text[10]): Integer
    var
        DotNetCultureInfo: Codeunit DotNet_CultureInfo;
        PreviousLanguage: Integer;
        LanguageCodeId: Integer;
    begin
        // This will be rolled out in a coming release:
        // DotNetCultureInfo.GetCultureInfoByName(languageFilter);

        // But for now we use a workaround:
        case LanguageCode of
            'da-dk':
                exit(1030);
            else
                exit(1033);
        end;
    end;

    procedure GetReportLabels(var TempPowerAppsLabels: Record "TO - Labels" temporary; var languageFilter: Text[10])
    begin

        InsertLabel(TempPowerAppsLabels, LoadingMessage, LoadingMessage_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, Subtract, SubTract_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, AddText, AddText_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, FirstAdd, FirstAdd_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, GallerySelect, GallerySelect_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, DismissQuantityControl, DismissQuantityControl_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, ItemImageText, ItemImageText_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, StartScreen_TakeOrder, StartScreen_TakeOrder_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, StartScreen_User, StartScreen_User_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, StartScreen_InfoScreen, StartScreen_InfoScreen_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, InfoScreen_Title, InfoScreen_Title_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, InfoScreen_Text, InfoScreen_Text_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, InfoScreen_ReadMore, InfoScreen_ReadMore_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, InfoScreen_Link, InfoScreen_Link_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, InfoScreen_Close, InfoScreen_Close_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, InfoScreen_LinkToolTip, InfoScreen_LinkToolTip_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SelectTableScreen_Title, SelectTableScreen_Title_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SelectTableScreen_Free, SelectTableScreen_Free_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SelectTableScreen_Occupied, SelectTableScreen_Occupied_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SelectTableScreen_Update, SelectTableScreen_Update_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SelectTableScreen_GalleryToolTip, SelectTableScreen_GalleryToolTip_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, TakeOrderScreen_FullMenu, TakeOrderScreen_FullMenu_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, TakeOrderScreen_Items, TakeOrderScreen_Items_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, TakeOrderScreen_Totals, TakeOrderScreen_Totals_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, TakeOrderScreen_Review, TakeOrderScreen_Review_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, TakeOrderScreen_Close, TakeOrderScreen_Close_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, TakeOrderScreen_Delete, TakeOrderScreen_Delete_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, TakeOrderScreen_FilterGallery, TakeOrderScreen_FilterGallery_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, TakeOrderScreen_ItemGallery, TakeOrderScreen_ItemGallery_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, ItemScreen_Title, ItemScreen_Title_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, ItemScreen_Close, ItemScreen_Close_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, ItemScreen_Description, ItemScreen_Description_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, ItemScreen_Allergens, ItemScreen_Allergens_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, ItemScreen_Facts, ItemScreen_Facts_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SummaryScreen_Delete, SummaryScreen_Delete_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SummaryScreen_Back, SummaryScreen_Back_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SummaryScreen_Submit, SummaryScreen_Submit_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SummaryScreen_AddMore, SummaryScreen_AddMore_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SummaryScreen_CheckOut, SummaryScreen_CheckOut_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SummaryScreen_Total, SummaryScreen_Total_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SummaryScreen_DeleteMessage, SummaryScreen_DeleteMessage_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SummaryScreen_CheckOutMessage, SummaryScreen_CheckOutMessage_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SummaryScreen_Gallery, SummaryScreen_Gallery_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SummaryScreen_SummaryStateExpanded, SummaryScreen_SummaryStateExpanded_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SummaryScreen_SummaryStateCollapsed, SummaryScreen_SummaryStateCollapsed_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SummaryScreen_SummaryDraftTitle, SummaryScreen_SummaryDraftTitle_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SummaryScreen_SummarySubmittedTitle, SummaryScreen_SummarySubmittedTitle_ValueTxt, languageFilter);
        InsertLabel(TempPowerAppsLabels, SummaryScreen_SummaryAddTo, SummaryScreen_SummaryAddTo_ValueTxt, languageFilter);
        insertLabel(TempPowerAppsLabels, SummaryScreen_OrderUpdatedMessage, SummaryScreen_OrderUpdatedMessage_ValueTxt, languageFilter);
    end;

    local procedure InsertLabel(var TempPowerAppsLabels: Record "TO - Labels" temporary; LabelName: Text[100]; LabelText: Text[250]; LabelLanguage: Text[10])
    begin
        // Inserts the given key-value pair into the temp table.
        TempPowerAppsLabels."Label ID" := LabelName;
        TempPowerAppsLabels."Text Value" := LabelText;
        tempPowerAppsLabels."Language Code" := LabelLanguage;
        TempPowerAppsLabels.Insert();
    end;
}

