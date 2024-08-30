# Business Central Samples - Take Order

The **Take Order** sample demonstrates how you can build a customized user experience for servers at restaurants, using Power Apps powered by Business Central.

The app allows servers to seat guests at a table and provides an intuitive UI for easily taking their orders. The sample includes a Business Central extension, a Power App, and a Power Automate flow. The extension adds the appropriate APIs and extends the items and customer tables with the following fields:

- **Items**
  - *SoldInRestaurant*: Indicates if the item should appear in the app
  - *LongItemDescription* and *AllergenInformation*: Optional fields that the app can utilize

- **Customers**
  - *IsTable*: Indicates that the customer should appear as a table within the app

The extension also includes a sample data page called **Take Order sample data**, which contains an action to generate sample items and tables for the app to use. 

*Note: The sample data generator has only been tested with US versions of Business Central. Adjustments may be necessary for other locales.*

## Try the sample yourself

Follow the steps in the [Try our sample apps](https://github.com/microsoft/AL-Go/blob/main/Scenarios/TryPowerPlatformSamples.md) guide to try the sample with your own tenant.

## Per Tenant Extension Project

This repository is based on the AL-Go for GitHub PTE template, which is available [here](https://github.com/microsoft/AL-Go-PTE).

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft trademarks or logos is subject to and must follow.
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
