Manage Tailscale resources using Pulumi · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Manage Tailscale resources using Pulumi
Last validated: Mar 3, 2025
[Pulumi](https://www.pulumi.com) is an infrastructure as code (IaC) tool that lets you deploy infrastructure programmatically. Pulumi maintains the [Tailscale Pulumi provider](https://www.pulumi.com/registry/packages/tailscale) in the Pulumi registry.
You can use the Tailscale Pulumi provider to:
* Define your [ACLs](/docs/features/access-control/acls) using the [`Acl` resource](https://www.pulumi.com/registry/packages/tailscale/api-docs/acl).
* Set [DNS settings](/docs/reference/dns-in-tailscale), including:
* Global nameservers using the [`DnsNameservers` resource](https://www.pulumi.com/registry/packages/tailscale/api-docs/dnsnameservers).
* Restricted nameservers for split DNS using the [`DnsSearchPaths` resource](https://www.pulumi.com/registry/packages/tailscale/api-docs/dnssearchpaths).
* [MagicDNS](/docs/features/magicdns) using the [`DnsPreferences` resource](https://www.pulumi.com/registry/packages/tailscale/api-docs/dnspreferences).
* Generate an [auth key](/docs/features/access-control/auth-keys) (including setting whether it's reusable, ephemeral, pre-authorized, and tagged) using the [`TailnetKey` resource](https://www.pulumi.com/registry/packages/tailscale/api-docs/tailnetkey).
* Manage properties of a device, including:
* [Device approval](/docs/features/access-control/device-management/device-approval) using the [`DeviceAuthorization` resource](https://www.pulumi.com/registry/packages/tailscale/api-docs/deviceauthorization).
* [Key expiry](/docs/features/access-control/key-expiry) using the [`DeviceKey` resource](https://www.pulumi.com/registry/packages/tailscale/api-docs/devicekey).
* [Tags](/docs/features/tags) using the [`DeviceTags` resource](https://www.pulumi.com/registry/packages/tailscale/api-docs/devicetags).
* [Subnet routes](/docs/features/subnet-routers) using the [`DeviceSubnetRoutes` resource](https://www.pulumi.com/registry/packages/tailscale/api-docs/devicesubnetroutes).
## [Installation steps](#installation-steps)
To use Pulumi with Tailscale:
1. Install the package for the Tailscale Pulumi provider in [Node.js, Python, Go, or .NET](https://github.com/pulumi/pulumi-tailscale/blob/master/README.md#installing).
2. Set the Tailscale configuration for Pulumi with an [API access token](/docs/reference/tailscale-api) for Tailscale and with the name of your tailnet. You can either [set these as environment variables or as part of your Pulumi configuration](https://www.pulumi.com/registry/packages/tailscale/installation-configuration/#configuring-the-provider). To set these in your Pulumi configuration:
```
`pulumi config set tailscale:apiKey tskey-1234567CNTRL-abcdefghijklmnopqrstu --secret
pulumi config set tailscale:tailnet example.com
`
```
## [Support](#support)
If you have an issue or feature request, [file a GitHub issue](https://github.com/pulumi/pulumi-tailscale/issues).
On this page
* [Installation steps](#installation-steps)
* [Support](#support)
Scroll to top