ACL policy examples · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# ACL policy examples
Last validated: Feb 2, 2026
Tailscale now secures access to resources using [grants](/docs/features/access-control/grants), a next-generation access control policy syntax. Grants provide [all original ACL functionality plus additional capabilities](/docs/reference/grants-vs-acls).
ACLs will continue to work **indefinitely**; Tailscale will not remove support for this first-generation syntax from the product. However, Tailscale recommends [migrating to grants](/docs/reference/migrate-acls-grants) and using grants for all new tailnet policy file configurations because ACLs will not receive any new features.
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
This topic provides example [access controls (ACLs)](/docs/features/access-control/acls) for common scenarios. For information about the syntax, refer to the [tailnet policy syntax](/docs/reference/syntax/policy-file).
|**Example**|**Description**|**Uses**|
|[Allow all](#allow-all-default-acl)|The default tailnet policy that lets all devices within the tailnet access other devices in the tailnet.|[ACLs](/docs/features/access-control/acls), [SSH](/docs/reference/syntax/policy-file#ssh)|
|[Deny all](#deny-all)|Deny all connections.|[ACLs](/docs/features/access-control/acls)|
|[Users can access their own devices](#users-can-access-their-own-devices)|All tailnet users can access devices they own unless another policy prevents it.|[ACLs](/docs/features/access-control/acls), [SSH](/docs/reference/syntax/policy-file#ssh)|
|[Resource-level access policies](#resource-level-access-policies)|Allow specific devices to access specific resources within the tailnet.|[ACLs](/docs/features/access-control/acls), [hosts](/docs/reference/syntax/policy-file#hosts)|
|[Restrict based on purpose (tags)](#restrict-based-on-purpose-tags)|Allow specific devices to access specific resources within the tailnet using tags.|[ACLs](/docs/features/access-control/acls)|
|[Restrict based on group](#restrict-based-on-group)|Manage access to resources using autogroups, custom groups, and provisioned groups.|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups)|
|[Restrict based on individual users](#restrict-based-on-individual-user)|Manage access to resources for specific users.|[ACLs](/docs/features/access-control/acls)|
|[Standard plan ACL](#standard-plan-acl)|Use a basic standard plan that lets employees access their own devices and devices tagged with `corp` and lets admins access devices tagged with `corp` or `prod`.|[ACLs](/docs/features/access-control/acls), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
|[Access to an internal application (VPN)](#access-to-an-internal-application-vpn)|Manage user access applications based on their job role.|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
|[Access to an internal application (VPN) with synced groups](#access-to-an-internal-application-vpn-with-synced-groups)|Manage access to internal resources using groups synced to an identity provider.|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
|[Remote access to a production environment](#remote-access-to-production-environment)|Manage user access to the production environment based on their job role.|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [tag owners](/docs/reference/syntax/policy-file#tag-owners), [tests](/docs/reference/syntax/policy-file#tests)|
|[VPC access (VPC peering)](#vpc-access-vpc-peering)|Manage access to a virtual private cloud using access control lists.|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [tag owners](/docs/reference/syntax/policy-file#tag-owners), [auto approvers](/docs/reference/syntax/policy-file#autoapprovers)|
|[Share access with a contractor](#share-access-with-a-contractor)|Allow a third-party contractor to access shared resources in the development environment.|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
|[Remote development](#remote-development)|Manage access to a remote development environment.|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
|[Pair programming](#pair-programming)|Create a paired programming environment multiple engineers can connect to using SSH.|[ACLs](/docs/features/access-control/acls), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
|[CI/CD deployment pipeline](#cicd-deployment-pipeline)|Manage access to resources based on job roles.|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
|[Monitoring access to applications](#monitoring-access-to-applications)|Allow a monitoring server to access all applications on common ports.|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
|[Application peering](#application-peering)|Allow multiple cloud providers or applications to access each other.|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
|[Network microsegmentation](#network-microsegmentation)|Allow access to network microsegments, but deny access between them.|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [tag owners](/docs/reference/syntax/policy-file#tag-owners), [tests](/docs/reference/syntax/policy-file#tests)|
## [Allow all (default ACL)](#allow-all-default-acl)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|All plans|[ACLs](/docs/reference/syntax/policy-file), [SSH](/docs/reference/syntax/policy-file#ssh), [autogroups](/docs/reference/syntax/policy-file#autogroups)|
When you first create your Tailscale network (known as a tailnet), Tailscale initializes it with a default *allow all* access policy to make it easy to connect to and use Tailscale without restricting any traffic in your network.
You can reset your ACL policy file to the original default by deleting the existing policy file contents and selecting **Reset to default**. Policy file changes can also be [reverted](/docs/features/tailnet-policy-file/manage-tailnet-policies#revert-changes) from the [Configuration logs](https://login.tailscale.com/admin/logs) page of the admin console.
Here's a breakdown of what the default policy does:
* Lets all devices in the tailnet access all other devices in the tailnet.
* Lets all users establish a [Tailscale SSH](/docs/features/tailscale-ssh) session to their own devices using [check mode](/docs/features/tailscale-ssh#configure-tailscale-ssh-with-check-mode), as either root or non-root.
* If you have a [subnet router initialized with `--snat-subnet-routes=false`](/docs/reference/troubleshooting/network-configuration/disable-subnet-route-masquerading) (Linux only), then any devices on the same local network as the subnet router can also access all devices in the tailnet.
* If you have a [device shared from another network](/docs/features/sharing#sharing-and-access-control-lists-acls) in your tailnet, that device cannot access any devices in the tailnet. The device [can only respond to incoming connections](/docs/features/sharing#quarantine) from the tailnet.
```
`{
"acls": [
{
"action": "accept",
"src": [
"\*"
],
"dst": [
"\*:\*"
]
}
],
"ssh": [
{
"action": "check",
"src": [
"autogroup:member"
],
"dst": [
"autogroup:self"
],
"users": [
"autogroup:nonroot",
"root"
]
}
],
}
`
```
Omitting the `acls` field from the tailnet policy file is equivalent to the default allow all policy. To deny all connections, [use an empty object for the `acls` field](#deny-all) in your policy file.
```
`{} // Tailscale applies the default allow all policy if the acls section is empty.
`
```
In the default ACL, the `ssh` rule uses `autogroup:self` for the `dst` field and`autogroup:nonroot` in the `users` field. If you change the `dst` field from`autogroup:self` to some other destination, such as an [ACL tag](https://tailscale.com/docs/features/tags/), also consider replacing `autogroup:nonroot` in the `users` field. If you don't remove`autogroup:nonroot` from the `users` field, then anyone permitted by the `src` setting will be able to SSH in as any nonroot user on the `dst` device.
## [Deny all](#deny-all)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|All plans|[ACLs](/docs/reference/syntax/policy-file)|
You can deny all connections in your tailnet by using an empty option for the `acls` field in your policy file. This configuration prevents all devices from communicating with each other. This configuration is not recommended for general use because nothing in the tailnet will work.
```
`{
"acls": []
}
`
```
Omitting the `acls` field from the tailnet policy file is not the equivalent of a "deny all" policy. Instead, Tailscale applies the [default allow all policy](#allow-all-default-acl), which allows all devices within the tailnet to access other devices in the tailnet.
## [Users can access their own devices](#users-can-access-their-own-devices)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|All plans|[ACLs](/docs/features/access-control/acls), [tags](/docs/features/tags), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
This example lets all users access their own devices. It is suitable for many use cases where you want to allow users to access their own devices, but not other devices in the tailnet.
```
`{
"acls": [
{
"action": "accept",
"src": [
"autogroup:member"
],
"dst": [
"autogroup:self:\*"
]
}
],
}
`
```
## [Resource-level access policies](#resource-level-access-policies)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|All plans|[ACLs](/docs/features/access-control/acls), [hosts](/docs/reference/syntax/policy-file#hosts)|
You can enable connectivity from one device or network to another using their IP addresses. Additionally, the [`hosts`](/docs/reference/syntax/policy-file#hosts) section lets you define a human-friendly name for an IP address or CIDR range, to make access rules more readable.
What this example does:
* The device with the IP address `100.100.123.124` can access the device with the IP address `100.100.123.123`.
* The device with the IP address `100.100.123.124` can access devices in the subnet `192.0.2.0/24` through a [subnet router](/docs/features/subnet-routers).
* The device with the hostname `frontend-server-01` can access devices in the subnet `192.0.2.0/24`.
* The device with the hostname `frontend-server-01` can access the device with the hostname `dev-network-01`.
```
`{
"acls": [
{
"action": "accept",
"src": [
"100.100.123.124"
],
"dst": [
"100.100.123.123:\*"
]
},
{
"action": "accept",
"src": [
"100.100.123.124"
],
"dst": [
"192.0.2.0/24:\*"
]
},
{
"action": "accept",
"src": [
"frontend-server-01"
],
"dst": [
"192.0.2.0/24:\*"
]
},
{
"action": "accept",
"src": [
"frontend-server-01"
],
"dst": [
"dev-network-01:\*"
]
}
],
"hosts": {
"frontend-server-01": "100.100.123.123",
"dev-network-01": "203.0.113.0/24"
}
}
`
```
When writing access control rules targeting resources behind a [4via6 subnet](/docs/features/subnet-routers/4via6-subnets) router, use the IPv6 CIDR or address as the destination, not the IPv4 address.
Use `tailscale debug via` to get the IPv6 CIDR.
## [Restrict based on purpose (tags)](#restrict-based-on-purpose-tags)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|All plans|[ACLs](/docs/features/access-control/acls), [tags](/docs/features/tags)|
[Tags](/docs/features/tags) let you assign an identity to a device that is separate from human users, and use that identity as part of an ACL to restrict access. Tags should be used when adding servers to your Tailscale network, so that their access is based on their purpose, not based on which member of your operations team enrolled them.
What this example does:
* Devices tagged with `tag:frontend` can access devices tagged with `tag:backend`.
* Devices tagged with `tag:backend` can access devices tagged with `tag:logging`.
```
`{
"acls": [
{
"action": "accept",
"src": [
"tag:frontend"
],
"dst": [
"tag:backend:\*"
]
},
{
"action": "accept",
"src": [
"tag:backend"
],
"dst": [
"tag:logging:\*"
]
}
]
}
`
```
## [Restrict based on group](#restrict-based-on-group)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
You can enable access to resources in your tailnet with [autogroups](#with-autogroups), [custom groups](#with-custom-groups), or [groups provisioned from supported identity providers](#with-provisioned-groups).
### [With autogroups](#with-autogroups)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|All plans|[ACLs](/docs/features/access-control/acls), [autogroups](/docs/reference/syntax/policy-file#autogroups), [tags](/docs/features/tags)|
[Autogroups](/docs/reference/syntax/policy-file#autogroups) are built-in groups that automatically include users, destinations, or usernames with the same properties.
What this example does:
* All tailnet members `autogroup:member` can access devices tagged with `tag:frontend`.
* All Tailscale [Admins](/docs/reference/user-roles) (`autogroup:admin`) can access devices tagged with `tag:backend` or `tag:logging`.
```
`{
"acls": [
{
"action": "accept",
"src": [
"autogroup:member"
],
"dst": [
"tag:frontend:\*"
]
},
{
"action": "accept",
"src": [
"autogroup:admin"
],
"dst": [
"tag:backend:\*",
"tag:logging:\*"
]
}
]
}
`
```
### [With custom groups](#with-custom-groups)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|Personal, Premium, and Enterprise|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [autogroups](/docs/reference/syntax/policy-file#autogroups), [tags](/docs/features/tags)|
[Custom groups](/docs/reference/syntax/policy-file#groups) let you define a shorthand for a group of users, which you can then use in access rules instead of listing users out explicitly.
What this example does:
* The Engineering team `group:engineering` consists of `alice@example.com` and `bob@example.com`.
* The DevOps team `group:engineering` consists of `amelie@example.com` and `carl@example.com`.
* The Engineering team `group:engineering` can access devices tagged with `tag:frontend` or `tag:backend`.
* The DevOps team `group:devops` can access devices tagged with `tag:frontend`, `tag:backend`, or `tag:logging`.
```
`{
"groups": {
"group:engineering": [
"alice@example.com",
"bob@example.com"
],
"group:devops": [
"amelie@example.com",
"carl@example.com"
]
},
"acls": [
{
"action": "accept",
"src": [
"group:engineering"
],
"dst": [
"tag:frontend:\*",
"tag:backend:\*"
]
},
{
"action": "accept",
"src": [
"group:devops"
],
"dst": [
"tag:frontend:\*",
"tag:backend:\*",
"tag:logging:\*"
]
}
]
}
`
```
### [With provisioned groups](#with-provisioned-groups)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
You can use [group provisioning from supported identity providers](/docs/features/user-group-provisioning) and avoid maintaining custom groups in your ACLs.
```
`{
"acls": [
{
"action": "accept",
"src": [
"group:engineering@example.com"
],
"dst": [
"tag:frontend:\*",
"tag:backend:\*"
]
},
{
"action": "accept",
"src": [
"group:devops@example.com"
],
"dst": [
"tag:frontend:\*",
"tag:backend:\*",
"tag:logging:\*"
]
}
]
}
`
```
## [Restrict based on individual user](#restrict-based-on-individual-user)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|Personal, Premium, and Enterprise|[ACLs](/docs/features/access-control/acls), [tags](/docs/features/tags)|
You can enable access to resources based on individual users.
What this example does:
* User Alice can access devices tagged with `tag:frontend`.
* User Bob can access devices tagged with `tag:backend`.
```
`{
"acls": [
{
"action": "accept",
"src": [
"amelie@example.com"
],
"dst": [
"tag:frontend:\*"
]
},
{
"action": "accept",
"src": [
"bob@example.com"
],
"dst": [
"tag:backend:\*"
]
}
]
}
`
```
## [Standard plan ACL](#standard-plan-acl)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|All plans|[ACLs](/docs/features/access-control/acls), [autogroups](/docs/reference/syntax/policy-file#autogroups), [tags](/docs/features/tags), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
This example provides remote access to corp and prod devices. It is suitable for many Standard plan use cases.
Your team can use Tailscale to access remote devices. In this scenario, all users can access their own remote devices, as well as any common corporate devices, such as servers, that are tagged. Only Tailscale [Admins](/docs/reference/user-roles) can access production devices. Admins can configure which devices are tagged. No corporate or production devices can access each other, and no shared users can access devices.
What this example does:
* All employees can access their own devices.
* All employees can access corporate devices tagged with `tag:corp`.
* All Tailscale [Admins](/docs/reference/user-roles) (`autogroup:admin`) can access devices tagged with `tag:prod`.
* All Tailscale [Admins](/docs/reference/user-roles) can manage which devices are tagged with `tag:corp` and `tag:prod`.
```
`{
"acls": [
{
"action": "accept",
"src": [
"autogroup:member"
],
"dst": [
"autogroup:self:\*"
]
},
{
"action": "accept",
"src": [
"autogroup:member"
],
"dst": [
"tag:corp:\*"
]
},
{
"action": "accept",
"src": [
"autogroup:admin"
],
"dst": [
"tag:prod:\*"
]
}
],
"tagOwners": {
"tag:corp": [
"autogroup:admin"
],
"tag:prod": [
"autogroup:admin"
]
}
}
`
```
## [Access to an internal application (VPN)](#access-to-an-internal-application-vpn)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|Personal, Premium, and Enterprise|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [tags](/docs/features/tags), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
You can use Tailscale to allow users to access internal applications, including both custom internal applications and third-party applications hosted internally. In this scenario, users in your tailnet can access applications based on their job role. The IT team can set up internal applications.
What this example does:
* Members of the engineering team `group:engineering` can access the devices tagged with `tag:engineering`.
* Members of the finance team `group:finance` can access the devices tagged with `tag:finance`.
* Members of the legal team `group:legal` can access the devices tagged with `tag:legal`.
* All employees can access the devices tagged with `tag:internal`.
* All Tailscale [Admins](/docs/reference/user-roles) (`autogroup:admin`) (such as the IT team) can manage which devices are tagged with `tag:engineering`, `tag:finance`, `tag:legal`, and `tag:internal`.
```
`{
"groups": {
"group:engineering": [
"alice@example.com"
],
"group:finance": [
"bob@example.com"
],
"group:legal": [
"carl@example.com"
]
},
"acls": [
{
"action": "accept",
"src": [
"group:engineering"
],
"dst": [
"tag:engineering:\*"
]
},
{
"action": "accept",
"src": [
"group:finance"
],
"dst": [
"tag:finance:\*"
]
},
{
"action": "accept",
"src": [
"group:legal"
],
"dst": [
"tag:legal:\*"
]
},
{
"action": "accept",
"src": [
"autogroup:member"
],
"dst": [
"tag:internal:\*"
]
}
],
"tagOwners": {
"tag:engineering": [
"autogroup:admin"
],
"tag:finance": [
"autogroup:admin"
],
"tag:legal": [
"autogroup:admin"
],
"tag:internal": [
"autogroup:admin"
]
}
}
`
```
### [Access to an internal application (VPN) with synced groups](#access-to-an-internal-application-vpn-with-synced-groups)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|Enterprise|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [autogroups](/docs/reference/syntax/policy-file#autogroups), [tags](/docs/features/tags), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
You can use [user and group provisioning](/docs/features/user-group-provisioning) to include groups synced from your identity provider in access rules. Tailscale treats synced group names as lowercase. They can include spaces, but not the `@` symbol.
What this example does:
* Members of the engineering team in the synced group `group:engineering@example.com` can access the devices tagged with `tag:engineering`.
* Members of the finance team in the synced group `group:finance team@example.com` can access the devices tagged with `tag:finance`.
* Members of the legal team in the synced group `group:Legal@example.com` can access the devices tagged with `tag:legal`.
* All employees can access the devices tagged with `tag:internal`.
* All Tailscale [Admins](/docs/reference/user-roles) (`autogroup:admin`) (such as the IT team) can manage which devices are tagged with `tag:engineering`, `tag:finance`, `tag:legal`, and `tag:internal`.
```
`{
"groups": {},
"acls": [
{
"action": "accept",
"src": [
"group:engineering@example.com"
],
"dst": [
"tag:engineering:\*"
]
},
{
"action": "accept",
"src": [
"group:finance team@example.com"
],
"dst": [
"tag:finance:\*"
]
},
{
"action": "accept",
"src": [
"group:legal@example.com"
],
"dst": [
"tag:legal:\*"
]
},
{
"action": "accept",
"src": [
"autogroup:member"
],
"dst": [
"tag:internal:\*"
]
}
],
"tagOwners": {
"tag:engineering": [
"autogroup:admin"
],
"tag:finance": [
"autogroup:admin"
],
"tag:legal": [
"autogroup:admin"
],
"tag:internal": [
"autogroup:admin"
]
}
}
`
```
## [Remote access to production environment](#remote-access-to-production-environment)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|Personal, Premium, and Enterprise|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [autogroups](/docs/reference/syntax/policy-file#autogroups), [tags](/docs/features/tags), [tag owners](/docs/reference/syntax/policy-file#tag-owners), [tests](/docs/reference/syntax/policy-file#tests)|
You can modify this example to work on the Standard plan by using `autogroup:member` instead of a custom group (`group:dev`).
Your DevOps, infrastructure, or SRE team can use Tailscale to access their sensitive and highly protected production environment. In this scenario, a DevOps team might be able to access the production environment, whereas other developers might only be able to access resources in a development environment. All developers are able to access monitoring tools, such as [Grafana](/blog/grafana-auth).
What this example does:
* All employees can access their own devices (such as remote workstations).
* Members of the development team `group:dev` can access the devices tagged with `tag:dev` (such as license servers).
* All Tailscale [Admins](/docs/reference/user-roles) (`autogroup:admin`) (such as members of the DevOps team) can access the devices tagged with `tag:prod` (such as the production environment).
* All employees can access devices tagged with `tag:monitoring` on ports `80` and `443` (such as monitoring dashboards).
* All Tailscale [Admins](/docs/reference/user-roles) (`autogroup:admin`) can manage which devices are tagged with `tag:dev`, `tag:prod`, and `tag:monitoring`
* [Tests](/docs/reference/syntax/policy-file#tests) ensure that if ACLs change:
* Carl will still be able to access devices tagged with `tag:prod` on port `80`.
* Alice will still be able to access devices tagged with `tag:dev` (but not devices tagged with `tag:prod`) on port `80`.
```
`{
"groups": {
"group:dev": [
"alice@example.com",
"bob@example.com"
]
},
"acls": [
{
"action": "accept",
"src": [
"autogroup:member"
],
"dst": [
"autogroup:self:\*"
]
},
{
"action": "accept",
"src": [
"group:dev"
],
"dst": [
"tag:dev:\*"
]
},
{
"action": "accept",
"src": [
"autogroup:admin"
],
"dst": [
"tag:prod:\*"
]
},
{
"action": "accept",
"src": [
"autogroup:member"
],
"dst": [
"tag:monitoring:80,443"
]
}
],
"tagOwners": {
"tag:monitoring": [
"autogroup:admin"
],
"tag:dev": [
"autogroup:admin"
],
"tag:prod": [
"autogroup:admin"
]
},
"tests": [
{
"src": "carl@example.com",
"accept": [
"tag:prod:80"
]
},
{
"src": "alice@example.com",
"accept": [
"tag:dev:80"
],
"deny": [
"tag:prod:80"
]
}
]
}
`
```
## [VPC access (VPC peering)](#vpc-access-vpc-peering)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|Personal, Premium, and Enterprise|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [autogroups](/docs/reference/syntax/policy-file#autogroups), [tags](/docs/features/tags), [tag owners](/docs/reference/syntax/policy-file#tag-owners), [auto approvers](/docs/reference/syntax/policy-file#autoapprovers)|
You can modify this example to work on the Standard plan by using `autogroup:member` instead of a custom group (`group:dev`).
Your DevOps team can use Tailscale to allow developers to access existing internal applications running in a Virtual Private Cloud (VPC) on a private or hosted cloud provider. In this scenario, developers can access resources in the VPC, and the DevOps team is able to manage access to the VPC. VPCs can be peered to each other if they don't have [overlapping IP ranges](/docs/features/subnet-routers/4via6-subnets). To connect an existing subnet to your Tailscale network without installing Tailscale on every device, you can use a [subnet router](/docs/features/subnet-routers). Run a subnet router in the subnet, and advertise the routes so that Tailscale can route traffic for the subnet to the device for forwarding. For devices on a subnet to connect to devices in your tailnet, [disable subnet route masquerading](/docs/reference/troubleshooting/network-configuration/disable-subnet-route-masquerading). You can also use [auto approvers](/docs/reference/syntax/policy-file#autoapprovers) to automatically approve routes.
What this example does:
* All Tailscale [Admins](/docs/reference/user-roles) (`autogroup:admin`) (such as the IT team) can access the devices tagged with `tag:vpc-peering` (for maintenance).
* Members of the development team `group:dev` can access devices in the subnets `192.0.2.0/24` and `198.51.100.0/24`.
* The subnet `192.0.2.0/24` can access the subnet `198.51.100.0/24` and vice versa (if [subnet route masquerading is disabled](/docs/reference/troubleshooting/network-configuration/disable-subnet-route-masquerading)).
* All Tailscale [Admins](/docs/reference/user-roles) (`autogroup:admin`) (such as the IT team) can manage which devices are tagged with `tag:vpc-peering`.
* All Tailscale [Admins](/docs/reference/user-roles) (`autogroup:admin`) and devices tagged with `tag:vpc-peering` can auto-approve routes for `192.0.2.0/24` and `198.51.100.0/24`.
```
`{
"groups": {
"group:dev": [
"alice@example.com",
"bob@example.com"
]
},
"acls": [
{
"action": "accept",
"src": [
"autogroup:admin"
],
"dst": [
"tag:vpc-peering:\*"
]
},
{
"action": "accept",
"src": [
"group:dev",
"192.0.2.0/24",
"198.51.100.0/24"
],
"dst": [
"192.0.2.0/24:\*",
"198.51.100.0/24:\*"
]
}
],
"tagOwners": {
"tag:vpc-peering": [
"autogroup:admin"
]
},
"autoApprovers": {
"routes": {
"192.0.2.0/24": [
"tag:vpc-peering",
"autogroup:admin"
],
"198.51.100.0/24": [
"tag:vpc-peering",
"autogroup:admin"
]
}
}
}
`
```
## [Share access with a contractor](#share-access-with-a-contractor)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|Personal, Premium, and Enterprise|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [autogroups](/docs/reference/syntax/policy-file#autogroups), [tags](/docs/features/tags), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
You can modify this example to work on the Standard plan by using `autogroup:member` instead of a custom group (`group:dev`).
Your development team can use Tailscale to share access to specific resources, such as a database or a hosted code repository, with a contractor. In this scenario, developers can access internal development resources. Specific devices can be [shared](/docs/features/sharing) with a contractor as part of their job.
What this example does:
* All employees can access their own devices.
* Members of the development team `group:dev` can access devices tagged with `tag:dev` (such as package registries and databases)
* Contractors who have accepted a share invite can access devices tagged with `tag:dev` (that have been shared with them).
```
`{
"groups": {
"group:dev": [
"alice@example.com",
"bob@example.com"
]
},
"acls": [
{
"action": "accept",
"src": [
"autogroup:member"
],
"dst": [
"autogroup:self:\*"
]
},
{
"action": "accept",
"src": [
"group:dev",
"autogroup:shared"
],
"dst": [
"tag:dev:\*"
]
}
],
"tagOwners": {
"tag:dev": [
"group:dev"
]
}
}
`
```
## [Remote development](#remote-development)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|Personal, Premium, and Enterprise|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [autogroups](/docs/reference/syntax/policy-file#autogroups), [tags](/docs/features/tags), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
You can modify this example to work on the Standard plan by using `autogroup:member` instead of a custom group (`group:dev`).
Your development team can use Tailscale as part of their remote development setup. In this scenario, a developer might have a local device, like a laptop, and use it to access a remote workstation, hosted in the cloud or hosted on another device in their network. This is useful if you're accessing a workstation with more processing power, for example, for machine learning or for building. You might also use a remote code environment like [GitHub Codespaces](/docs/integrations/github/github-codespaces), [Gitpod](/docs/install/cloud/gitpod), or [Coder](/docs/install/cloud/coder). From your development environment, you might access a license server, a package registry, a production database, or another development or build resource. You might also access a self-hosted or private code repository.
What this example does:
* All employees can access their own devices.
* Members of the development team `group:dev` can access devices tagged with `tag:dev` (such as package registries and databases).
* The development team `group:dev` can manage which devices are tagged with `tag:dev`.
```
`{
"groups": {
"group:dev": [
"alice@example.com",
"bob@example.com"
]
},
"acls": [
{
"action": "accept",
"src": [
"autogroup:member"
],
"dst": [
"autogroup:self:\*"
]
},
{
"action": "accept",
"src": [
"group:dev"
],
"dst": [
"tag:dev:\*"
]
}
],
"tagOwners": {
"tag:dev": [
"group:dev"
]
}
}
`
```
## [Pair programming](#pair-programming)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|Personal, Premium, and Enterprise|[ACLs](/docs/features/access-control/acls), [tags](/docs/features/tags), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
You can modify this example to work on the Standard plan by using `autogroup:member` and `autogroup:admin` instead of named users.
Your development team can use Tailscale to pair program on the same device remotely. In this scenario, two or more developers can use SSH to connect to a corporate device, such as a virtual machine (VM), and share a terminal (such as a `tmux` session).
What this example does:
* Users Alice and Bob can access the corporate device tagged `tag:pair-programming` on port `22` (for SSH).
* Bob can manage which devices are tagged `tag:pair-programming`.
```
`{
"acls": [
{
"action": "accept",
"src": [
"alice@example.com",
"bob@example.com"
],
"dst": [
"tag:pair-programming:22"
]
}
],
"tagOwners": {
"tag:pair-programming": [
"bob@example.com"
]
}
}
`
```
## [CI/CD deployment pipeline](#cicd-deployment-pipeline)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|Personal, Premium, and Enterprise|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [tags](/docs/features/tags), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
Your DevOps or infrastructure team can use Tailscale to restrict access to your deployment pipeline. In this scenario, developers can access your development tools, such as your code repository. Then, an automated CI/CD pipeline builds and deploys code. The DevOps team can access the deployment pipeline and production environment.
What this example does:
* Members of the development team `group:dev` can access the devices tagged with `tag:dev` (such as code repositories and license servers).
* Members of the DevOps team `group:devops` can access the devices tagged with `tag:ci` (such as the build tooling) and `tag:prod` (such as the production environment).
* The DevOps team `group:devops` can manage which devices are tagged with `tag:dev`, `tag:ci`, and `tag:prod`.
* The tag `tag:ci` can manage which device are tagged with `tag:prod` and `tag:dev` (to apply tags as part of the deployment pipeline).
```
`{
"groups": {
"group:dev": [
"alice@example.com",
"bob@example.com"
],
"group:devops": [
"carl@example.com"
]
},
"acls": [
{
"action": "accept",
"src": [
"group:dev"
],
"dst": [
"tag:dev:\*"
]
},
{
"action": "accept",
"src": [
"group:devops"
],
"dst": [
"tag:ci:\*",
"tag:prod:\*"
]
}
],
"tagOwners": {
"tag:ci": [
"group:devops"
],
"tag:dev": [
"group:devops",
"tag:ci"
],
"tag:prod": [
"group:devops",
"tag:ci"
]
}
}
`
```
## [Monitoring access to applications](#monitoring-access-to-applications)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|Personal, Premium, and Enterprise|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [tags](/docs/features/tags), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
You can modify this example to work on the Standard plan by using `autogroup:member` instead of a custom group (`group:devops`).
Your DevOps team can use Tailscale to query logs from services in your network and report these as part of your monitoring tooling. In this scenario, your monitoring server (such as Prometheus) can access all applications in your network on common ports.
What this example does:
* Devices tagged with `tag:monitoring` can access services on ports `80`, `443`, `9100`.
* Devices tagged with `tag:monitoring` can access services tagged `tag:logging`.
* The DevOps team `group:devops` can access devices tagged with `tag:monitoring` and `tag:logging`.
* The DevOps team `group:devops` can manage which devices are tagged with `tag:monitoring` and `tag:logging`.
```
`{
"groups": {
"group:devops": [
"carl@example.com"
]
},
"acls": [
{
"action": "accept",
"src": [
"tag:monitoring"
],
"dst": [
"\*:80,443,9100",
"tag:logging:\*"
]
},
{
"action": "accept",
"src": [
"group:devops"
],
"dst": [
"tag:monitoring:\*",
"tag:logging:\*"
]
}
],
"tagOwners": {
"tag:monitoring": [
"group:devops"
],
"tag:logging": [
"group:devops"
]
}
}
`
```
## [Application peering](#application-peering)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|Personal, Premium, and Enterprise|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [tags](/docs/features/tags), [tag owners](/docs/reference/syntax/policy-file#tag-owners)|
You can modify this example to work on the Standard plan by using `autogroup:member` instead of a custom group (`group:infra`).
Your infrastructure team can use Tailscale to connect applications or services running in multiple cloud providers or SaaS applications together. In this scenario, one application can connect with another application in your network, for example, to stream from one database to another, such as with
[Materialize](https://materialize.com/introducing-tailscale-materialize).
What this example does:
* Devices tagged with `tag:database` can access other devices tagged with `tag:database`.
* Devices tagged with `tag:gcp` and `tag:aws` can access devices tagged with `tag:database`, but not vice versa.
* The infrastructure team `group:infra` can manage which devices are tagged with `tag:database`, `tag:gcp`, and `tag:aws`.
```
`{
"groups": {
"group:infra": [
"carl@example.com"
]
},
"acls": [
{
"action": "accept",
"src": [
"tag:database",
"tag:gcp",
"tag:aws"
],
"dst": [
"tag:database:\*"
]
}
],
"tagOwners": {
"tag:database": [
"group:infra"
],
"tag:gcp": [
"group:infra"
],
"tag:aws": [
"group:infra"
]
}
}
`
```
## [Network microsegmentation](#network-microsegmentation)
**Prefer grant examples**
Grants provide all the capabilities of ACLs plus application-layer permissions. For modern access control patterns, refer to the [grant examples](/docs/reference/examples/grants).
|[Plan availability](/pricing)|Features|
|Personal, Premium, and Enterprise|[ACLs](/docs/features/access-control/acls), [groups](/docs/reference/syntax/policy-file#groups), [tags](/docs/features/tags), [tag owners](/docs/reference/syntax/policy-file#tag-owners), [tests](/docs/reference/syntax/policy-file#tests)|
[Network microsegmentation](/learn/network-microsegmentation) is a security technique that divides network devices, access, and communications into unique logical units. There are many use cases for this—segmenting data centers, virtual networks, customer deployments, and others. Each microsegment is a logical unit that cannot access other microsegments. In some cases, you might still need a support team or tagged devices that can access all segments.
What this example does:
* Members of the support team `group:support` can access devices tagged `tag:segment-abc` and `tag:segment-xyz` on port `443`.
* Devices tagged with `tag:support` can access devices tagged `tag:segment-abc` and `tag:segment-xyz` on port `443`.
* [Tests](/docs/reference/syntax/policy-file#tests) ensure that if ACLs change:
* Members of the support team `group:support` will still be able to access devices tagged `tag:segment-abc` and `tag:segment-xyz` on port `443`.
* Devices tagged with `tag:support` will still be able to access devices tagged `tag:segment-abc` and `tag:segment-xyz` on port `443`.
* Devices tagged with `tag:segment-abc` are denied access to devices tagged `tag:segment-xyz` on port `443`.
* Devices tagged with `tag:segment-xyz` are denied access to devices tagged `tag:segment-abc` on port `443`.
```
`{
"acls": [
{
"action": "accept",
"src": [
"group:support"
],
"dst": [
"tag:segment-abc:443",
"tag:segment-xyz:443"
]
},
{
"action": "accept",
"src": [
"tag:support"
],
"dst": [
"tag:segment-abc:443",
"tag:segment-xyz:443"
]
}
],
"tests": [
{
"src": "group:support",
"accept": [
"tag:segment-abc:443",
"tag:segment-xyz:443"
]
},
{
"src": "tag:support",
"accept": [
"tag:segment-abc:443",
"tag:segment-xyz:443"
]
},
{
"src": "tag:segment-abc",
"deny": [
"tag:segment-xyz:443"
]
},
{
"src": "tag:segment-xyz",
"deny": [
"tag:segment-abc:443"
]
}
],
"groups": {
"group:support": [
"alice@example.com",
"bob@example.com"
]
},
"tagOwners": {
"tag:support": [
"autogroup:admin"
]
}
}
`
```
On this page
* [Allow all (default ACL)](#allow-all-default-acl)
* [Deny all](#deny-all)
* [Users can access their own devices](#users-can-access-their-own-devices)
* [Resource-level access policies](#resource-level-access-policies)
* [Restrict based on purpose (tags)](#restrict-based-on-purpose-tags)
* [Restrict based on group](#restrict-based-on-group)
* [With autogroups](#with-autogroups)
* [With custom groups](#with-custom-groups)
* [With provisioned groups](#with-provisioned-groups)
* [Restrict based on individual user](#restrict-based-on-individual-user)
* [Standard plan ACL](#standard-plan-acl)
* [Access to an internal application (VPN)](#access-to-an-internal-application-vpn)
* [Access to an internal application (VPN) with synced groups](#access-to-an-internal-application-vpn-with-synced-groups)
* [Remote access to production environment](#remote-access-to-production-environment)
* [VPC access (VPC peering)](#vpc-access-vpc-peering)
* [Share access with a contractor](#share-access-with-a-contractor)
* [Remote development](#remote-development)
* [Pair programming](#pair-programming)
* [CI/CD deployment pipeline](#cicd-deployment-pipeline)
* [Monitoring access to applications](#monitoring-access-to-applications)
* [Application peering](#application-peering)
* [Network microsegmentation](#network-microsegmentation)
Scroll to top