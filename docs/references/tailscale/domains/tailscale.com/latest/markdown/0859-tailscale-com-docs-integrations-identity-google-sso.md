Setting up Google to work with Tailscale · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Setting up Google to work with Tailscale
Last validated: Nov 12, 2025
**You should be able to use your Google identity to log into Tailscale without additional configuration.**
To use Google as your identity provider with Tailscale, select **Sign up with Google** when [signing up for your Tailscale account](https://login.tailscale.com/start).
## [Allowlist Tailscale as a third-party app](#allowlist-tailscale-as-a-third-party-app)
In some cases, your domain administrator may have [restricted third-party apps from being added to your domain without approval](https://support.google.com/a/answer/7281227). If you try to log in to Tailscale with Google, and you get the error message `Error 400: admin\_policy\_enforced`, Tailscale is blocked in your domain.
If you are the Google Workspace admin for your domain, allowlist Tailscale following [Google's instructions to manage access to apps](https://support.google.com/a/answer/7281227#zippy=,manage-access-to-google-services-restricted-or-unrestricted,manage-access-to-apps-trusted-limited-or-blocked):
1. Log in to the [Google Admin console](https://admin.google.com).
2. From the Home page, go to **Security \> API controls**.
3. Under **App access control**, select **Manage third-party app access**.
4. Search to find the Tailscale app in the list. Select **Add a filter** and enter "Tailscale" in the **App name** field, and select **Apply**.
* The Tailscale app's `client\_id` is `674241127656-lmq9su4p8ni1tcpuh6eqidoornqtvmvi.apps.googleusercontent.com`
* The Tailscale app's `client\_id` for Google group syncing is `923467998409-avhhsu3j9043drh8s798htd48jo27ki8.apps.googleusercontent.com`. This is only needed if you use System for Cross-domain Identity Management (SCIM) to sync Google Groups with Tailscale.
* The Tailscale Android authenticator's `client\_id` is `744055068597-ppu003h5o04mln2dlou55msf9t4mup3c.apps.googleusercontent.com`
* Check the box for Tailscale and select **Change access**.
* Choose the **Limited** or **Trusted** option to allow access.
* Select **Change**.
On this page
* [Allowlist Tailscale as a third-party app](#allowlist-tailscale-as-a-third-party-app)
Scroll to top