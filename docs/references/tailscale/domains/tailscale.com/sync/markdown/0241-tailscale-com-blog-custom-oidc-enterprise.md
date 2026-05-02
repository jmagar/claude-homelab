Log into Tailscale with any OIDC-enabled identity provider
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|April 26, 2023
# Log into Tailscale with any OIDC-enabled identity provider
For large organizations, identity management and access control is about more than authenticating users and defining their access. It's also about delivering a great user experience without compromising security. Tailscale requires users to log in with an identity provider (IdP) — which hasn’t been much of a problem because we currently have [native SSO integrations](/kb/1013/sso-providers/) for Google, Microsoft Azure AD, Okta, GitHub, and OneLogin. But what if you’re not using one of these providers?
Some of Tailscale’s biggest customers, particularly those with complex identity or regulatory requirements, rely on industry-specific, custom, or self-hosted identity providers. That’s why we’re excited to support these customers with the [launch](/blog/custom-oidc/) of [custom OIDC providers](/kb/1240/sso-custom-oidc/). Currently in beta, custom OIDC providers enable organizations to set up user authentication with any OpenID Connect (OIDC) compliant identity provider. Now users can log in with the SSO provider that works best for their organization. Free or self-hosted providers are available on the Starter plan, advanced or enterprise providers are available on Premium and Enterprise [plans](/pricing/), and any custom OIDC provider can be used for up to three users on our Free plan.
Each device in Tailscale is tied to an identity, and users authenticate to the network with an identity provider, which means that organizations can use single sign-on and multi-factor authentication — and users don’t have to remember yet another password.
### Advanced and/or paid identity providers
Large organizations often have sophisticated compliance and security requirements, many of which are linked to properly authenticating users. Advanced identity providers have stepped in to fill this need, and we think they’re doing a great job. Authentication, however, is just the first step — since effective network security, compliance, and access controls often require additional measures such as implementing separation of duties using [admin roles](/kb/1138/user-roles/) and [user groups](/kb/1018/acls/), creating [role accounts for services](/kb/1068/acl-tags/), and [approving devices](/kb/1099/device-approval/) or [locking down](/kb/1226/tailnet-lock/) your network.
We’re hard at work testing custom OIDC, validating, and writing documentation for the identity providers our customers use the most. Visit the Tailscale [Integrations page](/integrations/) for a complete list of supported identity providers, and see below for a current list of validated providers:
* [Ory Network](https://www.ory.sh/)
>
> Ory provides a global identity and access control infrastructure that includes secure connectivity and privacy-first identity management based on open source software and open standards. Ory makes it simple to create flexible sign up flows for more conversions, and managing identities in a secure and compliant manner. With GDPR-ready solutions, a fully hosted identity infrastructure and a vibrant community, the Ory Network reduces risk and allows building secure, scalable and user-centric applications with ease. -
*> Thomas Curran, CEO, Ory
*
>
* [ZITADEL Cloud](https://zitadel.com/)
>
> We’re thrilled that Tailscale now integrates with ZITADEL to offer it as a custom OpenID Connect provider. As an identity platform, ZITADEL supports a comprehensive set of features for user administration, authentication, and access management. This collaboration allows users to utilize our IAM capabilities within Tailscale networks, enhancing security and user management. We’re excited about this partnership as it offers organizations a seamless and secure solution that combines the strengths of both ZITADEL and Tailscale. -
*> Florian Forster, CEO &amp; Co-Founder, ZITADEL
*
>
* [JumpCloud](https://jumpcloud.com/)
* [Duo](https://duo.com/)
* [GitLab](https://docs.gitlab.com/ee/integration/openid_connect_provider.html)
* [Auth0](https://auth0.com/docs)
### **Free and/or open source identity providers**
Tailscale (built on WireGuard®) is [committed to supporting free and open source software](/opensource/), and experimenting with new tech. If you’re using Tailscale for something non-critical, or your homelab, there are lots of great identity providers you can rely on, or even self-host. So, if you’d like to set up SSO with a self-hosted or free and open source (FOSS) solution, you’re able to do so on any Tailscale plan. We’ll continue to test custom OIDC, validate, and write documentation for free and open source identity providers, and you can always visit the [Integrations page](/integrations/) for a complete list of supported and validated providers.
* [authentik](https://goauthentik.io/)
* [Dex](https://dexidp.io/)
* [GitLab self-managed](https://docs.gitlab.com/ee/integration/openid_connect_provider.html)
* [Keycloak](https://www.keycloak.org/)
* [Ory self-hosted](https://www.ory.sh/)
* [ZITADEL Open Source](https://zitadel.com/)
### **Get started with custom OIDC**
To use custom OIDC, you must have a custom domain that you own, and enable discovery of the OIDC endpoint using [WebFinger](/kb/1240/sso-custom-oidc/). If you haven’t already configured WebFinger, see our documentation on [WebFinger setup](/kb/1240/sso-custom-oidc/). New accounts don’t need to contact Tailscale to get started with custom OIDC — users can go directly to [login.tailscale.com/start/oidc](https://login.tailscale.com/start/oidc) and configure it themselves. Existing customers can also migrate a tailnet with a custom domain from their current IdP to a custom provider by [contacting suppor](/contact/support/)t. To get started, read the documentation on [custom OIDC providers](/kb/1240/sso-custom-oidc/).
While user and group provisioning (aka SCIM) is not currently available for custom identity providers, we’d love to hear which providers you’d like us to build native integrations for. If user and group provisioning is something you need, please reach out directly to our [sales team](/contact/sales/).
Share
Author
Jeff Spencer
Author
Jeff Spencer
Share
Loading...
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)