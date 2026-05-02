Deploy Tailscale using Google Workspace · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Deploy Tailscale using Google Workspace
Last validated: Jan 5, 2026
This integration is available for [the Standard, Premium, and Enterprise plans](/pricing).
MDM support and system policies, including Google Workspace integration, require Tailscale for Android v1.66 or later. The feature is not available on earlier versions.
You can use the Google Workspace mobile device management (MDM) solution to deploy Tailscale across your organization. Google Workspace lets you distribute and install the Tailscale app automatically on your fleet of Android devices. You can then configure a number of system policies, and use Google Workspace to deploy these policies across the Android devices in your organization.
If you need help deploying Tailscale using Google Workspace, or would like to suggest any feature enhancements, contact our [support](/contact/support#support-form) or [sales](/contact/sales) teams.
## [Distribute Tailscale for Android using Google Workspace](#distribute-tailscale-for-android-using-google-workspace)
1. Log into the [Google Workspace Admin console](https://admin.google.com/ac/home).
2. Using the sidebar, select **Apps** and then **Web and mobile apps**.
3. Select **Add app \> Search for apps**.
4. Search for **Tailscale**, and select it from the search results.
5. Configure user access for the Tailscale app. At this time, you may choose to distribute Tailscale to all Android users in your organization, or just a subset of them. Then, select **Continue**.
6. Define the distribution settings for the Tailscale app. Within this configuration screen, you can choose to make the app available to your users for manual download from the Work profile Play Store, or automatically force-install the app on the user's behalf. Note that at this stage you may also set up Tailscale as an always-on VPN, which means that Android will automatically start and restart Tailscale, ensuring it is always running on the device.
7. Once the above steps are completed, Tailscale should appear in the applications list.
## [Deploy Tailscale system policies on Android using Google Workspace](#deploy-tailscale-system-policies-on-android-using-google-workspace)
Once you have completed the steps above and added the Tailscale client to your organization setup for distribution, you may choose to deploy [system policies](/docs/features/tailscale-system-policies) as well. Follow these steps to continue.
1. In the applications list above, select Tailscale. In the screen that appears, scroll down to the **Managed configurations** item, and select **Add managed configuration**.
2. The Tailscale configuration editor will appear. You may now configure Tailscale system policies. For instance, provide [your organization name](/docs/features/tailscale-system-policies#set-your-organization-name) in the **Managed by — organization name** field. When you're done, select **Save** at the bottom right of the screen.
## [Deploy Tailscale system policies on ChromeOS using Google Workspace](#deploy-tailscale-system-policies-on-chromeos-using-google-workspace)
You can also use Google Workspace to [deploy and configure Tailscale on
managed ChromeOS devices](https://support.google.com/chrome/a/answer/7131624). Managed
policies for Android apps on ChromeOS are provided as JSON object literals,
with keys corresponding to [managed policy keys](/docs/features/tailscale-system-policies).
On this page
* [Distribute Tailscale for Android using Google Workspace](#distribute-tailscale-for-android-using-google-workspace)
* [Deploy Tailscale system policies on Android using Google Workspace](#deploy-tailscale-system-policies-on-android-using-google-workspace)
* [Deploy Tailscale system policies on ChromeOS using Google Workspace](#deploy-tailscale-system-policies-on-chromeos-using-google-workspace)
Scroll to top