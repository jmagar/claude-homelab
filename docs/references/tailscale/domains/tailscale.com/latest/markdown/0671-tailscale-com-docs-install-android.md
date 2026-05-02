Install Tailscale on Android · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Install Tailscale on Android
Last validated: Jan 5, 2026
The Tailscale client works with Android 8.0 or later on devices such as phones, tablets, and Android TV. If you want to install the Tailscale client on ChromeOS, refer to [Install Tailscale on a Chromebook](/docs/install/chromebook).
## [Use a single sign-on account](#use-a-single-sign-on-account)
You can use this method if you are installing the Tailscale client on an Android phone or Android tablet.
1. Download Tailscale from the [Google Play Store](https://play.google.com/store/apps/details?id=com.tailscale.ipn) or go to the Tailscale [Download](/download/android) page.
2. Launch the app and select **Get Started**, accept the prompts to install a VPN configuration, and allow push notifications. Push notifications serve to alert users that they need to reauthenticate. For example, when keys are about to expire.
3. Tap **Sign in with Google** to use your system Google account, or **Sign in with other** to use any other [supported SSO identity provider](/docs/integrations/identity).
## [Use a QR code](#use-a-qr-code)
You can use this method if you are installing the Tailscale client on an Android phone, Android tablet, or Android TV. For more information, refer to [Add a device using a QR code](/docs/features/access-control/device-management/how-to/set-up-qr-code).
## [Use a generated code](#use-a-generated-code)
You can use this method if you are installing the Tailscale client on Android TV. It generates an alphanumeric code that you can add in the Tailscale admin console for automatic authentication.
1. Download Tailscale from the [Google Play Store](https://play.google.com/store/apps/details?id=com.tailscale.ipn).
1. Launch the Tailscale app and select **Log in**.
2. Record the code that is displayed below the QR code.
3. Open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
1. Select **Add device**, then **Client device**.
2. Select **Android** then the **Input code** tab, and enter the code you recorded.
3. Select **Submit**.
## [MDM deployments](#mdm-deployments)
You can use [app restrictions](/docs/integrations/mdm/android) to personalize Tailscale for Android programmatically. This can help you deploy Tailscale within an organization using solutions like MDM.
On this page
* [Use a single sign-on account](#use-a-single-sign-on-account)
* [Use a QR code](#use-a-qr-code)
* [Use a generated code](#use-a-generated-code)
* [MDM deployments](#mdm-deployments)
Scroll to top