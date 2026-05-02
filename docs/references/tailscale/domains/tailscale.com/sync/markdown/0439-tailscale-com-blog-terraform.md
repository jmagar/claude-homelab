Manage Tailscale with Terraform: ACLs, DNS, Auth Keys
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|August 30, 2022
# Manage your Tailscale resources with Terraform
When deploying infrastructure, you might need to frequently redeploy an environment for testing, or spin up servers in response to an increase in demand. A common tool to automate the provisioning of your infrastructure is [Terraform](https://www.terraform.io/) — with Terraform, you can define infrastructure as code, then script deployments of that infrastructure. If you’re deploying servers that you want to access over Tailscale, [you can already simplify setup by using a tagged auth key](/kb/1245/set-up-servers) to automatically connect devices to your tailnet with the right permissions. But what if you’re trying to manage your deployment of Tailscale?
You can *also* use Terraform to manage your use of Tailscale to define and deploy your ACLs, DNS settings, auth keys, and more. **Tailscale is adopting the [Tailscale Terraform provider](https://registry.terraform.io/providers/tailscale/tailscale/latest) and taking responsibility for ongoing support and development.** The community, notably [David Bond](https://github.com/davidsbond), originally created the Tailscale Terraform provider, and we are very thankful for the work they’ve done to provide this valuable tool to others.
### The Tailscale Terraform provider is now published by Tailscale
Anyone can contribute a provider to the Terraform registry, and a natural question might be: If the current provider is working, why change it? By moving this from a community-managed to a Tailscale-managed provider, we’re not changing how community contributions work — rather, we’re committing, as Tailscale, to maintain this provider because we recognize how critical it is for our users.
Tailscale is now publishing the provider — but what does that actually mean? Technically, it means that we’re moving the source code for the provider to the Tailscale organization, publishing the provider under Tailscale’s namespace in the Terraform registry, and signing new versions of the provider with a Tailscale-managed key. Practically, this means that we’ll continue to develop the Terraform provider as we add new features to Tailscale, review new contributions, and respond to requests for additional functionality.
We want to thank [everyone who contributed to the development of the Tailscale Terraform provider](https://github.com/tailscale/terraform-provider-tailscale/graphs/contributors), and especially [David Bond](https://github.com/davidsbond). We really appreciate and value community contributions to Tailscale, and we love to see what the community builds.
### Tailscale’s Terraform provider allows you to configure ACLs, update DNS setting, create auth keys, and manage devices
To use Terraform with Tailscale, configure the [Tailscale Terraform provider](https://registry.terraform.io/providers/tailscale/tailscale/latest) with an API key for Tailscale and the name of your tailnet. Then you can use the Terraform provider to programmatically:
* Define your [tailnet policy file](/kb/1018/acls/) (using the [`tailscale\_acl` resource](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/acl)).
* Set [DNS settings](/kb/1054/dns/), including global nameservers ([`tailscale\_dns\_nameservers`](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/dns_nameservers)), restricted nameservers for split DNS ([`tailscale\_dns\_search\_paths`](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/dns_search_paths)), and enabling or disabling MagicDNS ([`tailscale\_dns\_preferences`](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/dns_preferences)).
* Generate an [auth key](/kb/1085/auth-keys/), including setting whether it’s reusable, ephemeral, pre-authorized, and tagged ([`tailscale\_key`](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/tailnet_key)).
* Manage properties of a device, including authorizing the device ([`tailscale\_device\_authorization`](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/device_authorization)), disabling key expiry ([`tailscale\_device\_key`](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/device_key)), setting tags ([`tailscale\_device\_tags`](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/device_tags)), and advertising subnet routes ([`tailscale\_device\_subnet\_routes`](https://registry.terraform.io/providers/tailscale/tailscale/latest/docs/resources/device_subnet_routes)).
### Updating from the existing Terraform provider
If you’re already using the community-contributed Terraform provider, you can update to the new provider by modifying your Terraform configuration and setting `source` to `tailscale/tailscale`:
```
`terraform {
required\_providers {
tailscale = {
source = "tailscale/tailscale" // previously davidsbond/tailscale
version = "0.13.5"
}
}
}
provider "tailscale" {
api\_key = "tskey-1234567CNTRL-abcdefghijklmnopqrstu" // not recommended. Use env variable `TAILSCALE\_API\_KEY` instead
tailnet = "example.com"
}
`
```
Note that it is not recommended to store sensitive information such as your Tailscale API key in source control. Instead, use the environment variable `TAILSCALE\_API\_KEY` to set this in Terraform.
Then, run `terraform init`.
This new provider is available from a new namespace in the Terraform registry and will be signed with a new key. References to `davidsbond/tailscale` will still work, but will no longer receive updates. We recommend switching over to `tailscale/tailscale` the next time you update your Terraform configuration.
We plan to update the Terraform provider as we update [Tailscale’s API](/kb/1101/api/). To provide feedback or request features, please [file an issue on GitHub in tailscale/terraform-provider-tailscale](https://github.com/tailscale/terraform-provider-tailscale/issues).
### Tailscale also has a Pulumi provider
If you’re using Pulumi, don’t fret — the [Tailscale Pulumi provider](https://www.pulumi.com/registry/packages/tailscale/) is maintained by Pulumi (thanks!) and generated from the Terraform provider, so the Pulumi provider will also just keep working.
To use Pulumi for managing Tailscale resources, [configure Pulumi with your Tailscale API key and tailnet name](https://www.pulumi.com/registry/packages/tailscale/installation-configuration/), then [use Pulumi to manage your tailnet policy file, DNS settings, auth keys, and properties of a device](https://www.pulumi.com/registry/packages/tailscale/api-docs/).
### Addendum: How to transfer a Terraform provider
It’s not obvious how to move a Terraform provider from one organization to another without breaking users. If you’re in the same situation as Tailscale and want to know how to do it, here’s a model approach based on the steps we took:
1. [Sign up for a Terraform registry account](https://registry.terraform.io/sign-in). Sign in with GitHub, which will allow you to tie it to an existing GitHub organization. Then, set up your organization’s namespace in the Terraform registry.
2. [Transfer the repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/transferring-a-repository#transferring-a-repository-owned-by-your-personal-account) with the source code of the provider on GitHub from the community contributor to an employee of your organization. It can’t be transferred directly to the organization, as that would require giving the contributor the ability to create public repositories in the organization on GitHub. Once it’s transferred to an employee, transfer it again, this time to your organization.
3. If appropriate, change the original contributor’s permissions in the new repository, for example, [from Write to Read](https://docs.github.com/en/organizations/managing-access-to-your-organizations-repositories/repository-roles-for-an-organization). Now is also a good time to review the code of conduct and align to other conventions your organization might use, like the primary branch name.
4. [Kindly ask Terraform](https://www.terraform.io/registry/providers/publishing#support) to transfer the existing published provider to your organization’s namespace, including the existing public key used for signing.
5. Generate a new public private keypair for your organization to sign releases, and add the new public key to the Terraform registry.
6. [Build, sign, and publish](https://www.terraform.io/registry/providers/publishing#publishing-to-the-registry) a new version of the Terraform provider.
GitHub automatically updates references (such as dependencies) from the original repository to where it was transferred. Terraform warns users in the CLI that the provider has been updated, and they should reference the new provider; but still allows the use of the previously signed provider.
To manage your Tailscale resources programmatically, install the [Tailscale Terraform provider](https://registry.terraform.io/providers/tailscale/tailscale/latest) and [view the docs](/kb/1210/terraform-provider), or install the [Tailscale Pulumi provider](https://www.pulumi.com/registry/packages/tailscale/) and [view the docs](/kb/1211/pulumi-provider).
Share
Authors
Denton Gentry
Andrew Dunham
Authors
Denton Gentry
Andrew Dunham
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