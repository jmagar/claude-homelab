Deploy Tailscale with SimpleMDM · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Deploy Tailscale with SimpleMDM
Last validated: Jan 5, 2026
This integration is available for [the Standard, Premium, and Enterprise plans](/pricing).
[SimpleMDM](https://simplemdm.com) is a common mobile device management (MDM) solution to manage Apple devices within an organization. You can use SimpleMDM to deploy Tailscale in your organization. You can configure a number of [system policies](/docs/features/tailscale-system-policies), and you can then ask SimpleMDM to deploy these policies across the Apple devices in your organization. Tailscale system policies set through SimpleMDM are supported on macOS, iOS and tvOS.
If you need help deploying Tailscale using SimpleMDM, or would like to suggest any feature enhancements, contact our [support](/contact/support#support-form) or [sales](/contact/sales) teams.
Follow the steps in this document to get started. You'll create a configuration profile containing a system policy that displays the name of your organization in the Tailscale client. You'll then deploy it to a set of devices already enrolled in SimpleMDM.
## [Create and upload a Tailscale configuration profile](#create-and-upload-a-tailscale-configuration-profile)
See [Deploy Tailscale on macOS using MDM](/docs/integrations/mdm/mac) for general best practices and [Approve the Tailscale system extension automatically](/docs/integrations/mdm/mac#approve-the-tailscale-system-extension-automatically) to ensure the best end-user experience.
To get started with Tailscale and SimpleMDM, you'll first need to determine which [system policies](/docs/features/tailscale-system-policies) you wish to impose on your devices. Once you know which system policies to impose and the value for each, you'll then need to create an Apple configuration profile (`.mobileconfig` file) to define them, and upload the profile to the SimpleMDM admin console.
1. Paste the contents of our [configuration profile template](/docs/integrations/mdm/mac#deploying-system-policies-in-a-configuration-profile), which provides preset values for the **ManagedByOrganizationName** and **IPAddressCopiedAlertSuppressed** policies into a new XML file called `Tailscale.mobileconfig`. This XML file with the `.mobileconfig` extension will become your configuration profile.
2. Log in to the [SimpleMDM admin console](https://a.simplemdm.com).
3. In the sidebar, select **Profiles** under the **Configs** section.
4. A list of currently configured profiles will appear. Select the **Create Profile** button at the top right.
5. Among the available profile types, choose **Custom Configuration Profile**.
6. Assign a name to the profile. This will be displayed to the user in System Settings. For instance, `Tailscale Policies`.
7. Leave the **For macOS devices, deploy as a device profile instead of a user profile.** option selected.
8. Use the **Choose File** button to upload the `.mobileconfig` file previously created.
9. Save the profile.
## [Assign the Tailscale profile to a group of devices](#assign-the-tailscale-profile-to-a-group-of-devices)
SimpleMDM is now ready to deploy your configuration profile to one or more devices in your fleet. To do so, follow these steps.
1. Log in to the [SimpleMDM admin console](https://a.simplemdm.com).
2. In the sidebar, select **Groups** under the **Devices** section.
3. Select a group of devices to deploy Tailscale to. For instance, the **Default** group should already exist, and include all devices in your fleet.
4. Once the group settings appear, go to the **Profiles** tab.
5. Select the **Assign Profile** button.
6. Identify the Tailscale profile you just created in the list of profiles, and select **Assign**.
SimpleMDM will momentarily begin deploying the profile to the devices in the selected group. After rebooting the device, each enrolled client should display the organization name in the Tailscale client menu as set in the sample configuration profile used.
On this page
* [Create and upload a Tailscale configuration profile](#create-and-upload-a-tailscale-configuration-profile)
* [Assign the Tailscale profile to a group of devices](#assign-the-tailscale-profile-to-a-group-of-devices)
Scroll to top