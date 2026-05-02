Deploy Tailscale using TinyMDM · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Deploy Tailscale using TinyMDM
Last validated: Jan 5, 2026
This integration is available for [the Standard, Premium, and Enterprise plans](/pricing).
MDM support and system policies, including TinyMDM integration, require Tailscale for Android v1.66 or later. The feature is not available on earlier versions.
You can use the [TinyMDM](https://www.tinymdm.net) mobile device management (MDM) solution to deploy Tailscale across your organization. TinyMDM lets you distribute and install Tailscale automatically on your fleet of Android devices. You can then configure a number of system policies, and use TinyMDM to deploy these policies across the devices in your organization.
If you need help deploying Tailscale using TinyMDM, or would like to suggest any feature enhancements, contact our [support](/contact/support#support-form) or [sales](/contact/sales) teams.
## [Distribute Tailscale for Android using TinyMDM](#distribute-tailscale-for-android-using-tinymdm)
See [Deploy Tailscale on macOS using MDM](/docs/integrations/mdm/mac) for general best practices and [Approve the Tailscale system extension automatically](/docs/integrations/mdm/mac#approve-the-tailscale-system-extension-automatically) to ensure the best end-user experience.
Follow these steps to deploy the Tailscale APK onto devices enrolled in your TinyMDM account.
1. Log into the [TinyMDM admin console](https://www.tinymdm.net/console).
2. Select **Enterprise approved apps** in the sidebar.
3. We are going to deploy the latest version of the Tailscale client as available in the Google Play Store. In the **Add applications to the company catalog** screen that appears, select **Public Apps**. If you wish to manually deploy a Tailscale APK you fetched manually (for instance, to keep devices on a different version of the client), choose **Private apps** at this step.
4. Search for **Tailscale**, and select the **Select** input in the listing that appears among the search results.
5. The **Add applications to the company catalog** dialog appears. Select the **Add applications to the company catalog** checkbox to add Tailscale to an already existing device policy, and choose either **Approve** or **Approve and install**. You may also select **Add app to all policies** to deploy Tailscale to all enrolled Android devices in your organization.
6. Upon completing this step, Tailscale should appear in the **Approved apps list**. If **Approve and install** was selected in the previous step, enrolled devices will begin installing the Tailscale client.
## [Deploy Tailscale system policies on Android using TinyMDM](#deploy-tailscale-system-policies-on-android-using-tinymdm)
Once you have finished adding the Tailscale client to your device policies for distribution, you may choose to deploy system policies. Follow these steps to continue.
1. Log into the [TinyMDM admin console](https://www.tinymdm.net/console).
2. Select **Policies** in the sidebar.
3. Choose a policy whose users you want to deploy Tailscale for, then select its **Edit** button.
4. In the policy editor that appears, identify and expand the **Apps management** section.
5. Because it was added during the previous steps, Tailscale should be listed among the available applications here.
6. Open the settings menu for the Tailscale item, and choose **Configuration**.
7. The Tailscale configuration editor will appear. You may now configure Tailscale system policies. For instance, provide [your organization name](/docs/features/tailscale-system-policies#set-your-organization-name) in the **Managed by — organization name** field. When you're done, select **Save** at the top right of the screen.
On this page
* [Distribute Tailscale for Android using TinyMDM](#distribute-tailscale-for-android-using-tinymdm)
* [Deploy Tailscale system policies on Android using TinyMDM](#deploy-tailscale-system-policies-on-android-using-tinymdm)
Scroll to top