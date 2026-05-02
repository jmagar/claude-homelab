Deploy Tailscale with Jamf Pro · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Deploy Tailscale with Jamf Pro
Last validated: Jan 5, 2026
This integration is available for [the Standard, Premium, and Enterprise plans](/pricing).
You can use the [Jamf Pro](https://www.jamf.com/products/jamf-pro) mobile device management (MDM) solution to deploy Tailscale across your organization. Jamf Pro lets you distribute and install Tailscale automatically on your fleet of devices. You can then configure a number of [system policies](/docs/features/tailscale-system-policies), and use Jamf Pro to deploy these policies across the devices in your organization. Tailscale system policies through Jamf Pro are supported on macOS and iOS.
If you need help deploying Tailscale using Jamf Pro, or would like to suggest any feature enhancements, contact our [support](/contact/support#support-form) or [sales](/contact/sales) teams.
## [Distributing Tailscale using Jamf Pro](#distributing-tailscale-using-jamf-pro)
See [Deploy Tailscale on macOS using MDM](/docs/integrations/mdm/mac) for general best practices and [Approve the Tailscale system extension automatically](/docs/integrations/mdm/mac#approve-the-tailscale-system-extension-automatically) to ensure the best end-user experience.
You can distribute Tailscale on the devices in your fleet using Jamf Pro. You can choose to deploy either the Mac App Store variant of the client, or the Standalone variant. You can find more information on the differences between the two variants at [Three ways to run Tailscale on macOS](/docs/concepts/macos-variants).
### [Distributing the Mac App Store variant of the client](#distributing-the-mac-app-store-variant-of-the-client)
1. Login to the Jamf Pro admin console for your organization at `\<companyName\>.jamfcloud.com`.
2. Select **Computers** in the sidebar, and then **Mac Apps** in the **Content Management** section. Move to the **App Store** tab.
3. Select the **New** button at the top-right to add a new app.
4. Choose **Mac App Store** as the source for the app.
5. Search for **Tailscale** in the App Store for your current region.
6. Select the **Add** button for the Tailscale app in the search results.
7. Set up any deployment options as needed, especially in the **Scope** tab.
8. Tailscale should now be available in the Self Service app across your fleet.
## [Deploying system policies using Jamf Pro](#deploying-system-policies-using-jamf-pro)
We suggest reading the [system policies](/docs/features/tailscale-system-policies) topic to identify configuration options suitable for your organization. Once you know which policies you want to deploy to your fleet of devices, follow these steps to define them in Jamf:
1. Login to the Jamf Pro admin console for your organization at `\<companyName\>.jamfcloud.com`.
2. Select **Computers** in the sidebar, and then **Configuration Profiles** in the **Content Management** section.
3. Select the **New** button at the top-right to create a new configuration profile.
4. Enter a descriptive display name for the profile such as *Tailscale System Policies*.
5. Select **Application & Custom Settings**, and then choose **External Applications** in the dropdown that appears.
6. Select the **Add** button at the top-right to add a new preference domain.
7. Choose **Custom Schema** as the source to use for the preference domain.
8. Enter the proper name for the preference domain, which matches the bundle identifier of the Tailscale client. If you're using the Mac App Store variant of Tailscale, enter `io.tailscale.ipn.macos`. If you're using the Standalone variant, enter `io.tailscale.ipn.macsys`.
9. Select **Add Schema** to provide a JSON schema.
10. In the modal window that appears, select **Upload** to provide the latest version of the Tailscale JSON schema. The ProfileManifestsMirror project provides up-to-date versions of the Tailscale profile manifest compatible with the Jamf JSON schema. You can download them from [`io.tailscale.ipn.macos.json`](https://github.com/Jamf-Custom-Profile-Schemas/ProfileManifestsMirror/blob/main/manifests/ManagedPreferencesApplications/io.tailscale.ipn.macos.json) for the Mac App Store variant of the client, and from [`io.tailscale.ipn.macsys.json`](https://github.com/Jamf-Custom-Profile-Schemas/ProfileManifestsMirror/blob/main/manifests/ManagedPreferencesApplications/io.tailscale.ipn.macsys.json) for the Standalone variant. Upload the file to Jamf Pro once you have downloaded it from GitHub.
11. After uploading the JSON file, Jamf Pro will display a user interface to configure the Tailscale system policies. Complete the form by providing values for any policies you would like to set up.
12. Remember to select the deployment scope for your configuration policies in the **Scope** tab. You may select **All Computers** as **Target Computers** to deploy the policies to all Macs in your organization.
13. Select **Save** to save the configuration profile and begin deploying the policies. The Tailscale client must be restarted in order for all policies to be applied.
On this page
* [Distributing Tailscale using Jamf Pro](#distributing-tailscale-using-jamf-pro)
* [Distributing the Mac App Store variant of the client](#distributing-the-mac-app-store-variant-of-the-client)
* [Deploying system policies using Jamf Pro](#deploying-system-policies-using-jamf-pro)
Scroll to top