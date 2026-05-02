Setting up OneLogin to work with Tailscale · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Setting up OneLogin to work with Tailscale
Last validated: Jul 8, 2024
You will have to contact us to
enable your domain for OneLogin authentication, following the steps below. We are actively working to make
this process more automated.
1. In the OneLogin dashboard, go to *Applications*.
* Select **Add App**
* Search for "OIDC" and select **OpenID Connect (OIDC).**
* Set the *Display Name* to "Tailscale."
* Select **Save.**
* Under *Configuration*:
* Add to *Redirect URIs*: `https://login.tailscale.com/a/oauth\_response`
* Select **Save**
* Under *SSO*:
* Set *Refresh Token Minutes* to **40320** (4 weeks)
* Select **Save**
* When done, fill out the [Identity provider configuration or change](/contact/support?type=sso) section of the support form.
* Make sure all users you want to be able to log in are enabled for the
Tailscale application in OneLogin.
After you send us your OneLogin app information, note that it may take up to
two business days to activate your domain.
Scroll to top