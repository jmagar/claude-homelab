Supported SSO identity providers · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Supported SSO identity providers
Last validated: Jan 5, 2026
Tailscale works on top of the identity provider (IdP) or single sign-on (SSO) provider that you already use.
## [Set up an identity provider](#set-up-an-identity-provider)
When you activate your domain name with Tailscale for the first time, you must choose which identity provider you want to use.
You need to be an [Owner](/docs/reference/user-roles) of a tailnet to set up an identity provider.
### [Supported native identity providers](#supported-native-identity-providers)
Tailscale natively supports the following identity providers:
* [Apple](/docs/integrations/identity/apple-sso)
* [Google](/docs/integrations/identity/google-sso), including Gmail and Google Workspace (G Suite)
* [GitHub](/docs/integrations/identity/github)
* [Microsoft](/docs/integrations/identity/entra), including Microsoft Accounts, Office365, Active Directory, and Microsoft Entra ID
* [Okta](/docs/integrations/identity/okta)
* [OneLogin](/docs/integrations/identity/onelogin)
### [Supported custom identity providers](#supported-custom-identity-providers)
In addition to the natively supported identity providers, Tailscale also lets you authenticate with [custom OpenID Connect (OIDC) providers](/docs/integrations/identity/custom-oidc). For the list of custom identity providers that Tailscale has successfully tested, refer to [Additional provider configurations](/docs/integrations/identity/custom-oidc#additional-provider-configurations).
### [Support for passkeys](#support-for-passkeys)
Tailscale supports the use of [passkey](/docs/integrations/identity/passkeys) authentication for any tailnet that you are authorized to join.
### [Signing up with an email address](#signing-up-with-an-email-address)
Tailscale does not support sign-up with email addresses. By design, Tailscale is not an identity provider—there are no Tailscale passwords.
Identity providers build robust infrastructure to handle identity and authentication, which are core and complex aspects of security. Tailscale delegates user authentication to identity providers because of their expertise, which lets Tailscale focus on areas like secure networking.
Using an identity provider is not only more secure than email and password, but it lets us automatically [rotate connection encryption keys](/blog/rotate-ssh-keys), [follow security policies](/docs/features/access-control/acls) set by your team such as multifactor authentication (MFA), and more.
For more information about why Tailscale is not an identity provider, refer to the [Tailscale doesn't want your password](/blog/passkeys) and [SSO tax, cut](/blog/sso-tax-cut) blog posts.
### [Support for MFA](#support-for-mfa)
Tailscale supports two-factor and multifactor authentication.
Tailscale does not handle authentication itself. Instead, you can [enable MFA features](/docs/multifactor-auth) in your single sign-on identity provider, and they will apply to all your apps, including Tailscale.
## [Changing identity providers](#changing-identity-providers)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) of a tailnet to change the identity provider configuration.
If you need to change identity providers, [contact support](/contact/support?type=sso).
Unfortunately, we cannot migrate your tailnet from/to GitHub or Apple as an identity provider.
## [What Tailscale accesses from identity providers](#what-tailscale-accesses-from-identity-providers)
Tailscale uses OpenID Connect (OIDC) for authentication.
Tailscale requests the minimum access needed to function. When authenticating to Tailscale, you must share information about users' emails and their name. Some providers also share a user photo; in this case, Tailscale stores the photo URL but not the photo itself.
Tailscale only uses your organization's team membership to ensure users can join the tailnet for their organization. With the GitHub identity provider, Tailscale requests the minimum set of permissions needed to get team membership, which includes access to your repositories and project boards. Tailscale does not use any content in your repositories or project boards.
Tailscale requests the minimum number scopes required to operate, and the information on how we use your data can be found in our [privacy policy](/privacy-policy).
On this page
* [Set up an identity provider](#set-up-an-identity-provider)
* [Supported native identity providers](#supported-native-identity-providers)
* [Supported custom identity providers](#supported-custom-identity-providers)
* [Support for passkeys](#support-for-passkeys)
* [Signing up with an email address](#signing-up-with-an-email-address)
* [Support for MFA](#support-for-mfa)
* [Changing identity providers](#changing-identity-providers)
* [What Tailscale accesses from identity providers](#what-tailscale-accesses-from-identity-providers)
Scroll to top