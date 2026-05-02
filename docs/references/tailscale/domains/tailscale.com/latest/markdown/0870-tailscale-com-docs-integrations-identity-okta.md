Setting up Okta to work with Tailscale · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Setting up Okta to work with Tailscale
Last validated: Jan 5, 2026
To activate Okta for your domain, follow the instructions below.
## [Contents](#contents)
* [Supported Features](#features)
* [Requirements](#requirements)
* [Configuration Steps](#steps)
* [Notes](#notes)
* [Okta Initiated Login](#workaround)
## [Supported Features](#supported-features)
* Single Sign-On (OpenID Connect) initiated by Okta
## [Requirements](#requirements)
* Install the Tailscale app from the
[Okta Integration Network](https://www.okta.com/integrations)
## [Configuration Steps](#configuration-steps)
We are actively working to make this process more automated. In the meantime,
here are the steps you'll need to take to enable your domain for Okta
authentication.
1. On the Okta admin page, select the Tailscale application and select the
Sign On tab.
1. Copy the values of Client ID and Client secret.
2. Copy the issuer published in the OpenID Provider Metadata. Typically, this is the Okta URL. To find this URL, select **OpenID Provider Metadata**, look for a line that contains `"issuer:"`, and then copy the URL listed on that line (without the quotes). For example, it will look like `https://dev-123456.okta.com` or similar.
3. Fill out the [Identity provider configuration or change](/contact/support?type=sso) section of the
support form using the OpenID Connect details saved in the previous step. Note that the
domain name used to log into Tailscale should match the email addresses of
users assigned to this app
If this is the initial setup for your domain, after you submit this information, we will send you a custom link to
finish activation. This may take up to two business days.
In the meantime, give users and/or groups access to the Tailscale app:
Note that if you make changes to a domain already activated for Okta, or when you migrate an existing tailnet from
another identity provider to Okta, no custom link is sent—your activation finishes without requiring this step.
If your organization has defined
[custom access policies](https://developer.okta.com/docs/guides/customize-authz-server/create-access-policies),
verify that the Tailscale app is authorized for the `openid`, `email`,
and `profile` [scopes](https://developer.okta.com/docs/guides/customize-authz-server/create-scopes).
## [Notes](#notes)
After activation, check out our [getting started guide](/docs/how-to/quickstart).
For information about provisioning users and groups in Okta, refer to [User & group provisioning in Okta](/docs/integrations/identity/okta/okta-scim).
## [Okta initiated login](#okta-initiated-login)
Tailscale is currently not compatible with Identity Provider initiated login, and only provides service provider initiated
login. This means users must start authentication from Tailscale's login page, rather than from inside their Okta instance.
As a workaround, users who are interested in initializing login from the Okta instance can create a Tailscale Login
bookmark chiclet by following the below steps.
1. Open the Tailscale App in Okta, select the **General** tab, then select **Edit**.
2. Check **Do not display application icon to users** and save.
3. Open the [Okta Integration Network](https://www.okta.com/integrations), search for **Bookmark App**, and select it. Choose **Add integration**.
4. Fill out the application label name as **Tailscale Login**, and set `https://login.tailscale.com` as the URL.
5. Leave the **Application Visibility** setting unchecked, and choose **Done**.
6. Choose **Applications**, and assign the new bookmark app to Tailscale users.
On this page
* [Contents](#contents)
* [Supported Features](#supported-features)
* [Requirements](#requirements)
* [Configuration Steps](#configuration-steps)
* [Notes](#notes)
* [Okta initiated login](#okta-initiated-login)
Scroll to top