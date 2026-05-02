Custom OIDC providers · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Custom OIDC providers
Last validated: Dec 10, 2025
Tailscale can integrate with identity providers that support OpenID Connect (OIDC). The steps provided in this topic are required only for initial creation of a tailnet. After the signup process is completed, Tailscale will work like any other supported identity provider. For more information about OIDC, refer to [Welcome to OpenID Connect](https://openid.net/connect).
## [Requirements](#requirements)
* Proof of domain ownership and OIDC discovery using WebFinger.
* An identity provider with SSO based on OIDC, that uses `openid`, `profile`, and `email` scopes, and provides for a callback URL.
* The OIDC provider must use either ES256 or RSA signatures; the minimum RSA key size is 2048 bits.
## [WebFinger setup](#webfinger-setup)
To use a custom OIDC provider with Tailscale, you must set up a WebFinger endpoint on your domain. WebFinger verifies that you have administrative control over a domain and issuer URL discovery. For more detailed information about using WebFinger with OIDC issuer discovery, refer to [RFC 7033](https://www.rfc-editor.org/rfc/rfc7033.html#section-3.1).
The WebFinger endpoint must be served at `https://${domain}/.well-known/webfinger` and must include the issuer URL within the JRD in the response. For example:
```
`{
"subject": "acct:${email}",
"links": [
{
"rel": "http://openid.net/specs/connect/1.0/issuer",
"href": "${issuer URL}"
}
]
}
`
```
The WebFinger endpoint must be hosted at the domain of the email address provided during setup. The issuer URL specified in your JRD must exactly match the issuer URL in your `/.well-known/openid-configuration`. For more information, refer to the [Identity Provider Discovery for OpenID Connect](https://www.rfc-editor.org/rfc/rfc7033.html#section-3.1) section in the RFC 7033: WebFinger specification.
To verify your WebFinger endpoint:
1. In your browser, open the [WebFinger Lookup tool](https://webfinger.net/lookup).
2. In the **Lookup WebFinger** search box, enter the user's email address.
3. Select the search icon.
4. Examine the results to determine if your endpoint is valid.
Tailscale uses the issuer value from your WebFinger endpoint *only* during the initial setup. After you have started using a custom OIDC provider with Tailscale, to use a new issuer, update the issue in your WebFinger endpoint and then [contact support](/contact/support) so we can finalize your integration with the new issuer.
## [Identity provider setup](#identity-provider-setup)
The identity provider used for your custom OIDC setup must comply with the OIDC specification and the Tailscale requirements.
**Tailscale** requires you to provide the following:
* Issuer URL retrieved from the WebFinger endpoint, described in the [previous section](#webfinger-setup).
* Client ID.
* Client secret from your identity provider.
**Scopes** specify the required information to include in the authentication request. The required scopes are `openid`, `profile`, and `email`. Tailscale requests the minimum number scopes required to operate, and the information on how we use your data can be found in our [privacy policy](/privacy-policy).
**Prompts** specify the requirements and behavior on the authentication page for the user. Prompts are optional, and the supported values within the Tailscale
setup UI are `none`, `consent` (the default), `login`, and `select\_account`. Note that individual identity providers or identity provider
configuration may not support any or all of these values. For more information, refer to the OIDC [Authentication Request](https://openid.net/specs/openid-connect-core-1_0.html#AuthRequest) specification.
**Callback URL** must be configured in your identity provider settings, with the following URL:
`https://login.tailscale.com/a/oauth\_response`
### [Additional provider configurations](#additional-provider-configurations)
Specific identity providers may require additional configurations:
|Identity provider|Additional configurations needed|
|Auth0|None|
|Authelia|Refer to the instructions in the Authelia topic [Tailscale](https://www.authelia.com/integration/openid-connect/tailscale/).|
|Authentik|Refer to the instructions in the Authentik topic [Integrate with Tailscale](https://integrations.goauthentik.io/networking/tailscale/).|
|AWS Cognito|None|
|Codeberg|None|
|Dex|None|
|Duo|None|
|FoxIDs|Refer to the instructions in the FoxIDs topic [Connect to Tailscale with OpenID Connect](https://www.foxids.com/docs/app-reg-howto-oidc-tailscale).|
|Gitea|None|
|GitLab|You must have an active GitLab session in your browser when signing up or in.|
|GitLab self-managed|You must have an active GitLab session in your browser when signing up or in.|
|JumpCloud|Service Provider Attribute Name for `email` and `name` mapped to `email` and `fullname` as a JumpCloud Attribute Name, and Client Authentication Type set to Client Secret Basic.|
|Keycloak|None|
|Ory Network|None|
|Ory self-hosted|None|
|Ping Identity|None|
|Pocket ID|None. For details, refer to our YouTube video [Use a custom OIDC and passkeys to log in to Tailscale with Pocket ID](https://youtu.be/sPUkAm7yDlU).|
|ZITADEL Cloud|None|
|ZITADEL Open Source|None|
|Zoho|You must set up a Server-based Applications client type. The Issuer URL for your application must match the data center region the application was created in. As examples, US-based applications must use `https://accounts.zoho.com` whereas Canada-based applications must use `https://accounts.zohocloud.ca`. Your Zoho region is the domain you use to access your Zoho Dashboard. If you have users based in different Zoho regions, you must check the **Use the same OAuth credentials for all data centers** box under the **Settings** tab for the application.|
## [Tailscale setup](#tailscale-setup)
1. Go to the [Sign up with OIDC](https://login.tailscale.com/start/oidc) page of the admin console.
Or, when [signing up for your Tailscale account](https://login.tailscale.com/start), select **Sign up with OIDC**.
2. In the **Email address** field, enter the administrator's full email address. The domain in the email address must match the domain where the WebFinger endpoint is served, and the domain you will use for Tailscale.
3. Select **Get OIDC Issuer**. If Tailscale is able to retrieve an issuer from your WebFinger endpoint, it will be displayed in the **Issuer** field.
4. In the **Client ID** field, enter the ID that is generated for Tailscale by your OIDC provider.
5. In the **Client secret** field, enter the client secret generated for Tailscale by your OIDC provider.
6. (Optional) In the **Prompts** field, select one or more prompts to use for the user
authentication flow. Note that you are not required to pick a value. These values are defined in
the OIDC [Authentication Request](https://openid.net/specs/openid-connect-core-1_0.html#AuthRequest) specification. If you select `none`, you
cannot select any other prompt.
7. Select **Sign up with OIDC**. You will be redirected to your provider for authentication.
8. Log in to your provider using the email you entered in step 2. Upon authentication, you will be redirected to the Tailscale admin console.
The user that configures OIDC for Tailscale becomes the first user in the [tailnet](/docs/reference/glossary#tailnet) and [Owner](/docs/reference/user-roles) of the tailnet.
## [Additional tailnet users](#additional-tailnet-users)
When additional users from the same domain log in to Tailscale, they can enter their email, and will be redirected for authentication to the recognized identity provider.
## [Migrate an existing tailnet](#migrate-an-existing-tailnet)
If you have an existing tailnet, [contact support](/contact/support) to migrate to a custom OIDC provider. You must have a WebFinger endpoint correctly configured on your domain.
We can only migrate a Tailscale account that uses a custom domain to a custom OIDC provider. For example, `@yourcustomdomain.com` can be migrated, while non-custom domains such as `@gmail.com` cannot be migrated.
## [Notes](#notes)
* Self-hosted identity providers must be publicly accessible on the internet. IP block listing may interfere with the ability to sign up or authenticate to your tailnet.
* User and group provisioning is not supported for custom OIDC provider setups.
* All users connecting to a tailnet from the same domain must use the same identity provider.
* When a user logs out of Tailscale, they are not logged out of their identity provider automatically. If users do not log out of the identity provider, then when they reconnect to Tailscale, they will not need to reauthenticate.
* Tailscale doesn't support [Proof Key for Code Exchange](https://www.rfc-editor.org/rfc/rfc7636.html) (PKCE). Some identity providers enable PKCE by default. If your identity provider enabled PKCE, disable the PKCE feature to avoid errors when installing and running Tailscale.
* JSON Web Encryption (JWE) access tokens are not supported for `id\_tokens`.
On this page
* [Requirements](#requirements)
* [WebFinger setup](#webfinger-setup)
* [Identity provider setup](#identity-provider-setup)
* [Additional provider configurations](#additional-provider-configurations)
* [Tailscale setup](#tailscale-setup)
* [Additional tailnet users](#additional-tailnet-users)
* [Migrate an existing tailnet](#migrate-an-existing-tailnet)
* [Notes](#notes)
Scroll to top