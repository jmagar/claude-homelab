Manage Tailscale resources using Terraform · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Manage Tailscale resources using Terraform
Last validated: Jan 30, 2026
[Terraform](https://www.terraform.io) is an infrastructure as code (IaC) tool that lets you deploy infrastructure programmatically. Tailscale maintains the [Tailscale Terraform provider](https://registry.terraform.io/providers/tailscale/tailscale/latest) in the Terraform registry by Tailscale. We recommend using the latest version of the provider.
You can use the Tailscale Terraform provider to:
* Define your [policy file](/docs/features/tailnet-policy-file) using the [`tailscale\_acl` resource](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/acl).
* Set [DNS settings](/docs/reference/dns-in-tailscale), including:
* Global nameservers using the [`tailscale\_dns\_nameservers` resource](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/dns_nameservers).
* Restricted nameservers for split DNS, using the [`tailscale\_dns\_search\_paths` resource](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/dns_search_paths).
* [MagicDNS](/docs/features/magicdns) using the [`tailscale\_dns\_preferences` resource](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/dns_preferences).
* Generate an [auth key](/docs/features/access-control/auth-keys) (including setting whether it's reusable, ephemeral, pre-authorized, and tagged)
using the [`tailscale\_key` resource](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/tailnet_key).
* Manage properties of a device, including:
* [Device approval](/docs/features/access-control/device-management/device-approval) using the [`tailscale\_device\_authorization` resource](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/device_authorization).
* [Key expiry](/docs/features/access-control/key-expiry) using the [`tailscale\_device\_key` resource](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/device_key).
* [Tags](/docs/features/tags) using the [`tailscale\_device\_tags` resource](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/device_tags).
* [Subnet routes](/docs/features/subnet-routers) using the [`tailscale\_device\_subnet\_routes` resource](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/device_subnet_routes).
Refer to the [Terraform Provider documentation](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs) for the full list of supported resources.
## [Credentials and tailnet configuration](#credentials-and-tailnet-configuration)
To use Terraform with Tailscale, configure the [Tailscale Terraform provider](https://registry.terraform.io/providers/tailscale/tailscale/latest) with your
Tailscale credentials, which can be a [trust credential](https://login.tailscale.com/admin/settings/trust-credentials) or an [API access token](https://login.tailscale.com/admin/settings/keys).
Tailscale recommend that you use a trust credential (an OAuth client or federated identity) because trust credentials are associated with the tailnet, not an individual user, do not expire, and support [scopes](/docs/reference/trust-credentials#scopes). For details, refer to [trust credentials](/docs/reference/trust-credentials).
You must also specify your tailnet in the Tailscale Terraform provider configuration. You can provide a dash (`-`) to reference the default tailnet of the [trust credential](/docs/reference/trust-credentials) (or API access token) used as credentials. Using the default tailnet from the credential information is the best option for most users. Alternatively, you can specify your [tailnet ID](/docs/concepts/tailnet-name#tailnet-id). You can find your tailnet ID in the [General](https://login.tailscale.com/admin/settings/general) page of the admin console.
It is not recommended to store sensitive information, such as an OAuth client or API access token, in source control. Instead, use an environment variable or a secrets manager.
Use the default variables `TAILSCALE\_OAUTH\_CLIENT\_ID`, `TAILSCALE\_OAUTH\_CLIENT\_SECRET`, and `TAILSCALE\_TAILNET` to provide your credentials and tailnet organization name to the Tailscale Terraform provider. Alternatively, refer to the Terraform documentation for [setting values with variables](https://developer.hashicorp.com/terraform/tutorials/configuration-language/sensitive-variables#set-values-with-variables).
If you are using a federated identity instead of an OAuth client, use the default `TAILSCALE\_IDENTITY\_TOKEN` variable instead of `TAILSCALE\_OAUTH\_CLIENT\_SECRET`.
If you are using an API access token instead of an OAuth client, use the default `TAILSCALE\_API\_KEY` variable instead of `TAILSCALE\_OAUTH\_CLIENT\_ID` and `TAILSCALE\_OAUTH\_CLIENT\_SECRET`.
### [Environment variables](#environment-variables)
You can store most information as environment variables in Terraform. Tailscale uses environment variables for the following configuration settings:
|**Setting**|**Description**|**Environment variable**|
|`api\_key`
(String, Sensitive)|The API key to use for authenticating requests to the API.
Conflicts with '`TAILSCALE\_OAUTH\_CLIENT\_ID`' and '`TAILSCALE\_OAUTH\_CLIENT\_SECRET`'.|`TAILSCALE\_API\_KEY`|
|`base\_url`
(String)|The base URL of the Tailscale API.
Defaults to `https://api.tailscale.com`.|`TAILSCALE\_BASE\_URL`|
|`TAILSCALE\_OAUTH\_CLIENT\_ID`
(String)|The OAuth application or federated identity's ID when using OAuth client credentials or workload identity federation. If set, then either '`TAILSCALE\_OAUTH\_CLIENT\_SECRET`' or '`TAILSCALE\_IDENTITY\_TOKEN`' must also be set, but not both.
Conflicts with '`api\_key`'.|`TAILSCALE\_OAUTH\_CLIENT\_ID`|
|`TAILSCALE\_OAUTH\_CLIENT\_SECRET`
(String, Sensitive)|The OAuth application's secret when using OAuth client credentials. If set, '`TAILSCALE\_OAUTH\_CLIENT\_ID`' must also be set.
Conflicts with '`api\_key`' and '`identity\_token`'.|`TAILSCALE\_OAUTH\_CLIENT\_SECRET`|
|`TAILSCALE\_IDENTITY\_TOKEN`
(String, Sensitive)|The JWT identity token to exchange for a Tailscale API token when using a federated identity.
Conflicts with '`api\_key`' and '`client\_secret`'.|`TAILSCALE\_OAUTH\_CLIENT\_SECRET`|
|`tailnet`
(String)|The [tailnet ID](/docs/concepts/tailnet-name#tailnet-id) to perform actions in.|`TAILSCALE\_TAILNET`|
### [Migrate from the community-contributed Terraform provider](#migrate-from-the-community-contributed-terraform-provider)
If you previously used the community-contributed Terraform provider, and now want to use the provider managed and published by Tailscale, update the `source` argument in your Terraform configuration. That is, update `source = "davidsbond/tailscale"` to `source = "tailscale/tailscale"`.
## [Special thanks](#special-thanks)
Special thanks to [David Bond](https://github.com/davidsbond), who contributed and maintained the original community-contributed Tailscale Terraform provider. Tailscale now maintains and publishes this provider.
## [Support](#support)
The Tailscale Terraform provider is maintained and published in the Terraform registry by Tailscale. If you have an issue or feature request, [contact support](/contact/support) or [file a GitHub issue](https://github.com/tailscale/terraform-provider-tailscale/issues).
On this page
* [Credentials and tailnet configuration](#credentials-and-tailnet-configuration)
* [Environment variables](#environment-variables)
* [Migrate from the community-contributed Terraform provider](#migrate-from-the-community-contributed-terraform-provider)
* [Special thanks](#special-thanks)
* [Support](#support)
Scroll to top