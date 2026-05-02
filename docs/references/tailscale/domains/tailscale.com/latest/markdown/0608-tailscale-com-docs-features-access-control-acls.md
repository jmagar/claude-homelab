Manage permissions using ACLs · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Manage permissions using ACLs
Last validated: Jan 5, 2026
Tailscale now secures access to resources using [grants](/docs/features/access-control/grants), a next-generation access control policy syntax. Grants provide [all original ACL functionality plus additional capabilities](/docs/reference/grants-vs-acls).
ACLs will continue to work **indefinitely**; Tailscale will not remove support for this first-generation syntax from the product. However, Tailscale recommends [migrating to grants](/docs/reference/migrate-acls-grants) and using grants for all new tailnet policy file configurations because ACLs will not receive any new features.
ACLs are available on all plans, but [certain functionality might be restricted](#availability-by-plan) on some plans.
Tailscale's [access control](/docs/features/access-control) methodology follows the [least privilege](/learn/principle-of-least-privilege) and [zero trust](/docs/concepts/zero-trust) principles. There are two ways to define access controls for your tailnet: access control lists (ACLs) and grants. Both methods follow a deny-by-default principle and are defined in the [tailnet policy file](/docs/features/tailnet-policy-file) using a [declarative huJSON syntax](/docs/reference/syntax/policy-file).
ACLs represent the traditional [network layer](https://en.wikipedia.org/wiki/Network_layer) approach to managing access within your tailnet, where you define [a set of devices or users](/docs/reference/targets-and-selectors) who can access ports on other devices. Each ACL you create must define a source and a destination. They let you precisely define access controls for users and devices on your Tailscale network (known as a tailnet).
```
`{
"acls": [
{
"action": "accept",
"src": [ \<list-of-sources\> ], // These sources (devices or users)
"dst": [ \<destination\>:\<port\> ], // can access these destination devices on their defined ports
}
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
When you first create your tailnet, the [default tailnet policy file](/docs/reference/examples/acls#allow-all-default-acl) enables communication between all devices within the tailnet. You can modify your policy file (including [editing ACLs](#edit-acls)) to fit your needs.
ACLs are deny-by-default, directional, locally enforced, and don't affect local network traffic.
* **Deny-by-default**. Using a default deny policy prevents communication between devices without explicit access to each other. However, in the absence of an `acls` section in the tailnet policy file, Tailscale applies the [default allow all policy](/docs/reference/examples/acls#allow-all-default-acl).
* **Directional**. Allowing a source to connect to a destination doesn't mean the destination can connect to the source (unless a policy explicitly enables it).
* **Locally enforced**. A device enforces incoming connections based on the access rules distributed to all devices in your tailnet. Rule enforcement happens on each device directly, without further involvement from Tailscale's coordination server.
* ACLs do not affect what a device can or cannot access on its local network.
For more information about Tailscale's approach to access control, refer to [RBAC like it was meant to be](/blog/rbac-like-it-was-meant-to-be).
If you don't define any access control policies, Tailscale applies the [default allow all ACL policy](/docs/reference/examples/acls#allow-all-default-acl). To deny all traffic, use an [empty object for the `acls` section](/docs/reference/examples/acls#deny-all) in your tailnet policy file.
## [Edit ACLs](#edit-acls)
You can edit your tailnet's access rules by using the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console, [GitOps for Tailscale ACLs](/docs/gitops), or the [Tailscale API](/docs/reference/tailscale-api). Refer to [Editing ACLs](/docs/features/tailnet-policy-file/manage-tailnet-policies) for more information.
Refer to [tailnet policy file syntax](/docs/reference/syntax/policy-file) to create access control policies or the [sample ACLs](/docs/reference/examples/acls) for examples of common policies.
## [Availability by plan](#availability-by-plan)
ACLs are available on all plans, but certain functionality might be restricted on some plans.
|**Availability**|**
On [all plans](/pricing)
**|**
On [the Premium and Enterprise plans](/pricing)
**|
|Access rules for...|
* Any
* Tailscale IP
* Subnet CIDR Range
* Autogroups
* Groups
* Users
* Tags
* Hosts
* IP sets|
|Access rules specifying...|
* Ports
* Protocols||
|ACL sections for...|
* `acl`
* `groups`
* `hosts`
* `tests`
* `tagOwners`
* `autoApprovers`
* `nodeAttrs`
* `postures` with default device posture attributes only
* `ipsets`|
* `acl`
* `groups`
* `hosts`
* `tests`
* `tagOwners`
* `autoApprovers`
* `postures` with default, custom, and third-party attributes
* `ipsets`|
On this page
* [Edit ACLs](#edit-acls)
* [Availability by plan](#availability-by-plan)
Scroll to top