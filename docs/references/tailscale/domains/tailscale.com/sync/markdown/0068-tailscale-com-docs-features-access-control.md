Access control · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Access control
Last validated: May 29, 2025
Tailscale's approach to access control embodies the principles of [least privilege](/learn/principle-of-least-privilege) and [zero trust security](/docs/concepts/zero-trust). By default, all connections between devices in your Tailscale network (known as a [tailnet](/docs/concepts/tailnet)) are denied unless explicitly permitted through your [tailnet policy file](/docs/features/tailnet-policy-file). This ensures that only authorized users and devices can communicate with each other, with precise controls over what specific resources they can access.
There are two primary methods for creating access control policies: [Grants](/docs/features/access-control/grants) and [access control lists (ACLs)](/docs/features/access-control/acls). Grants are the recommended method and offer more functionality. However, ACLs will always be supported. Refer to [Grants vs. ACLs](/docs/reference/grants-vs-acls).
Access control in Tailscale uses various [targets and selectors](/docs/reference/targets-and-selectors) to identify resources, which are also defined in the tailnet policy file. These include autogroups, custom groups, tags, IP addresses, and individual users, and let you create flexible policies that adapt to your organization's structure.
Explore the following resources for more information:
* [Tailnet policy file](/docs/features/tailnet-policy-file)
* [Policy syntax](/docs/reference/syntax/policy-file)
* [Targets and selectors](/docs/reference/targets-and-selectors)
* [Grants vs. ACLs](/docs/reference/grants-vs-acls)
## [Grants](#grants)
Grants represent Tailscale's modern approach to access control, providing a unified syntax for managing permissions across both network and application layers. Each grant defines which sources can access which destinations, along with the specific capabilities they're allowed to use at both the network and application levels.
Explore the grants documentation:
* [Grants overview](/docs/features/access-control/grants)
* [Grant syntax reference](/docs/reference/syntax/grants)
* [Application capabilities](/docs/features/access-control/grants/grants-app-capabilities)
* [Troubleshooting grants](/docs/reference/troubleshooting/grants)
* [Example grants](/docs/reference/examples/grants)
## [Access control lists (ACLs)](#access-control-lists-acls)
Tailscale recommends [migrating to grants](/docs/reference/migrate-acls-grants).
Access control lists ([ACLs](/docs/features/access-control/acls)) represent Tailscale's original approach to network layer security. The recommended approach is to use grants. However, Tailscale will always support ACLs.
Explore the ACLs documentation:
* [ACLs overview](/docs/features/access-control/acls)
* [ACL syntax reference](/docs/reference/syntax/policy-file)
* [Example ACL policies](/docs/reference/examples/acls)
## [Tailscale SSH](#tailscale-ssh)
Tailscale SSH integrates with the access control system to provide secure SSH access between devices in your tailnet. Instead of managing SSH keys, Tailscale SSH leverages your tailnet's identity system to authenticate and authorize connections based on the rules defined in your tailnet policy file.
[Explore Tailscale SSH](/docs/features/tailscale-ssh).
On this page
* [Grants](#grants)
* [Access control lists (ACLs)](#access-control-lists-acls)
* [Tailscale SSH](#tailscale-ssh)
Scroll to top