IP sets · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# IP sets
Last validated: Oct 29, 2025
An IP set is a way to manage groups of IP addresses. It can encapsulate a collection of [targets](/docs/reference/targets-and-selectors), such as IP addresses, CIDRs, hosts, [autogroups](/docs/reference/targets-and-selectors#autogroups), and other IP sets. Tailscale translates everything in the IP set to a list of IP address ranges. You can use the [`ipset` syntax](#syntax) to create IP sets within your [tailnet policy file](/docs/features/tailnet-policy-file) and [reference](#references) them from [access control](/docs/features/access-control) policies such as [ACLs](/docs/features/access-control/acls) and [grants](/docs/features/access-control/grants).
The primary benefit of IP sets is that they let you group multiple network parts into a single collection, enabling you to apply access control policies to the collection rather than the individual IP addresses, hosts, or subnets.
You can leverage IP sets in a variety of ways. For example, you can:
* Target and manage logical cross-sections of your tailnet independently of other groupings like [subnets](/docs/features/subnet-routers), [tags](/docs/features/tags), and [groups](/docs/reference/syntax/policy-file#groups).
* Target a subnet in access control policies while excluding a few specific hosts.
* [Customize an autogroup](#customize-autogroupinternet) to exclude some private or public subnets from global [exit node](/docs/features/exit-nodes) access.
* Facilitate a more modular organization of your [tailnet policy file](/docs/features/tailnet-policy-file).
## [Limitations](#limitations)
IP sets have the following limitations:
* You can't include [tags](/docs/features/tags), [users](/docs/reference/user-roles), or [groups](/docs/reference/syntax/policy-file#groups) in IP sets.
* You can't use circular references to IP sets.
* The only supported [autogroup](/docs/reference/syntax/policy-file#autogroups) is `autogroup:internet`. This is because `autogroup:internet` is the only autogroup that refers to IP address ranges. The other autogroups refer to unsupported targets, such as tags, users, and dynamic sets of devices.
## [Syntax](#syntax)
An `ipset` is an object within the tailnet policy file that defines one or more named `ipsets`. Each named `ipset` contains one or more [operations](#operations), each adding or removing a [target](#targets).
The following example demonstrates the basic syntax for creating an `ipset` in the tailnet policy file where `\<name\>` is the name of the IP set and `\<target\>` is a CIDR, IP address, host, autogroup, or IP set.
```
`"ipsets": {
"ipset:\<name\>": [
"add \<target\>",
"remove \<target\>"
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
### [Operations](#operations)
The `ipset` syntax supports two operations: `add` and `remove`. Each named IP set can have one or more operations, which are processed in order.
You must include the operation type before the [target](#targets) unless the named [IP set only uses `add` operations](#create-ip-sets-with-only-add-operations).
|**Operation**|**Description**|
|`add`|Adds a target to a named IP set.|
|`remove`|Removes a target from a named IP set.|
### [Targets](#targets)
A target is a [CIDR](https://www.rfc-editor.org/rfc/rfc4632.html), IP address, [host](/docs/reference/syntax/policy-file#hosts), autogroup, or IP set that you add to or remove from a named IP set. Each target must be preceded by an [operation](#operations) (`add` or `remove`) unless the named IP set only adds targets (and doesn't remove any IP addresses).
|**Target**|**Syntax**|**Example**|
|CIDR|`\<cidr\>`|`192.0.2.0/24`, `2001:db8::/32`|
|IP address|`\<ip-address\>`|`192.0.2.33`, `2001:db8::`|
|IP address range|`\<ip-range-start\>-\<ip-range-end\>`|`192.0.2.50-192.0.2.100` , `2001:db8::5-2001:db8::9`|
|Host|`host:\<name\>`|`host:sql-server-1`|
|Autogroup|`autogroup:internet`|`autogroup:internet`|
|IP set|`ipset:\<name\>`|`ipset:prod`|
Hosts refers to the [hosts](/docs/reference/syntax/policy-file#hosts) section of the tailnet policy file, not MagicDNS names.
### [References](#references)
You can reference named IP sets from specific parts of the tailnet policy file using the format `ipset:\<name\>` where `\<name\>` is the name of the IP set.
The following sections of the tailnet policy file support referencing IP sets:
* [ACLs](/docs/features/access-control/acls) (sources and destinations)
* [Grants](/docs/features/access-control/grants) (sources and destinations)
* IP sets
## [Examples](#examples)
The following examples illustrate how to leverage IP sets.
* [Create an IP set with only add operations](#create-ip-sets-with-only-add-operations).
* [Create an IP set that contains several subnets and excludes a single IP address](#create-an-ip-set-that-adds-several-subnets-and-excludes-a-single-ip-address).
* [Create an IP set that excludes another IP set](#create-an-ip-set-that-excludes-another-ip-set).
* [Reference IP sets in grants](#reference-ip-sets-in-grants).
* [Reference IP sets in ACLs](#reference-ip-sets-in-acls).
* [Customize `autogroup:internet`](#customize-autogroupinternet).
### [Create IP sets with only add operations](#create-ip-sets-with-only-add-operations)
The following IP sets don't remove any [targets](#targets). As a result, they can use a simplified syntax that omits the [operation type](#operations) (because `add` is assumed).
```
`"ipsets": {
"ipset:prod": ["192.0.2.0/24"],
"ipset:dev": [
"198.51.100.0/24",
"203.0.113.0/24",
"host:sql-server-1",
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
### [Create an IP set that adds several subnets and excludes a single IP address](#create-an-ip-set-that-adds-several-subnets-and-excludes-a-single-ip-address)
The following example shows how to create an IP set that includes several subnets and excludes a single IP address.
```
`"ipsets": {
"ipset:prod": [
"add 192.0.2.0/24",
"add 2001:db8::/32",
"add 198.51.100.0/24",
"add 203.0.113.0/24",
"remove 192.0.2.33",
],
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
### [Create an IP set that excludes another IP set](#create-an-ip-set-that-excludes-another-ip-set)
The following example creates a `dev` IP set and a `prod` IP set. The `prod` IP set excludes anything in the `dev` IP set.
```
`"ipsets": {
"ipset:dev": ["host:sql-server-1"],
"ipset:prod": [
"add 192.0.2.0/24",
"add 198.51.100.0/24",
"remove ipset:dev",
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
### [Reference IP sets in grants](#reference-ip-sets-in-grants)
The following example shows how to create [grants](/docs/features/access-control/grants) that [reference](#references) the `dev` IP set.
```
`"grants": [
{
"src": ["group:devops"],
"dst": ["ipset:dev"],
"ip": ["80","443","22"]
},
{
"src": ["group:dev"],
"dst": ["ipset:dev"],
"ip": ["80","443"],
"via": ["tag:office-routers"],
},
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
### [Reference IP sets in ACLs](#reference-ip-sets-in-acls)
The following example shows how to create [ACLs](/docs/features/access-control/acls) that [reference](#references) the `prod` IP set.
```
`"acls": [
{
"src": ["group:devops"],
"dst": ["ipset:prod:\*"],
"action": "accept",
},
],
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
### [Customize `autogroup:internet`](#customize-autogroupinternet)
You can use IP sets to customize the traffic that flows through an exit node (when enabled) in the tailnet using [`autogroup:internet`](/docs/reference/syntax/policy-file#autogroups).
The following example creates an IP set named `internet` that customizes `autogroup:internet` by doing the following:
* Adds `autogroup:internet`.
* Removes the production application gateways (`ipset:cdn-edge`).
* Removes the publicly accessible partner network (`ipset:partner-net`).
* [Grants](/docs/features/access-control/grants) the `internet` IP set (a subset of internet-bound traffic) access to the Seattle and London office [exit nodes](/docs/features/exit-nodes).
```
`"ipsets": {
"ipset:internet": [
"add autogroup:internet",
"remove ipset:cdn-edge",
"remove ipset:partner-net"
],
"ipset:cdn-edge": ["8.21.9.6", "8.21.9.7", "8.21.9.13", "8.21.9.14"],
"ipset:partner-net": ["52.23.40.0/24"]
},
"grants": [
{
"src": ["group:sea"],
"dst": ["ipset:internet"],
"ip": ["\*"],
"via": ["tag:officerouter-sea"],
},
{
"src": ["group:lhr"],
"dst": ["ipset:internet"],
"ip": ["\*"],
"via": ["tag:officerouter-lhr"],
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
On this page
* [Limitations](#limitations)
* [Syntax](#syntax)
* [Operations](#operations)
* [Targets](#targets)
* [References](#references)
* [Examples](#examples)
* [Create IP sets with only add operations](#create-ip-sets-with-only-add-operations)
* [Create an IP set that adds several subnets and excludes a single IP address](#create-an-ip-set-that-adds-several-subnets-and-excludes-a-single-ip-address)
* [Create an IP set that excludes another IP set](#create-an-ip-set-that-excludes-another-ip-set)
* [Reference IP sets in grants](#reference-ip-sets-in-grants)
* [Reference IP sets in ACLs](#reference-ip-sets-in-acls)
* [Customize autogroup:internet](#customize-autogroupinternet)
Scroll to top