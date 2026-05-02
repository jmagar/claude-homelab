Migrate from ACLs to grants · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Migrate from ACLs to grants
Last validated: Mar 13, 2026
The [tailnet policy file](/docs/features/tailnet-policy-file) is the foundation for defining who can access what in your Tailscale network (known as a [tailnet](/docs/concepts/tailnet)), controlling [device connections](/docs/how-to/connect-to-devices), and managing [logical groupings and assignments](/docs/reference/targets-and-selectors). Traditionally, access control lists ([ACLs](/docs/features/access-control/acls)) have been the primary method for defining these permissions at the network layer. However, Tailscale has introduced a more powerful and flexible system called [grants](/docs/features/access-control/grants). While ACLs will continue to function indefinitely, the recommended best practice is to prefer grants. This guide walks you through the process of migrating from ACLs to grants. It also explains the benefits, provides conversion examples, and offers best practices to ensure a smooth transition.
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
## [Understanding the differences](#understanding-the-differences)
ACLs and grants both use a [least privilege](/learn/principle-of-least-privilege) and [deny-by-default](https://en.wikipedia.org/wiki/Fail-safe) approach, but grants provide several advantages.
ACLs focus primarily on network layer permissions, using a syntax that combines destinations and ports into a single field. Each ACL entry also requires an explicit `action` field, even though `accept` is the only possible value. This structure can become more complex and difficult to read as your tailnet grows.
Grants, on the other hand, expand upon ACLs by unifying network and application layer capabilities under a shared syntax. They also separate destinations and ports/protocols into distinct fields for better readability and eliminate the redundant `action` field.
For more information, refer to [grants vs. ACLs](/docs/reference/grants-vs-acls).
## [Benefits of migrating to grants](#benefits-of-migrating-to-grants)
Migrating to grants offers several benefits:
* **Network and application level permissions**: The most significant advantage of grants is their ability to control both network and application layer access. While ACLs can only determine if a connection is allowed at the network level, grants can specify what actions are permitted in applications running at the destination once that connection is established.
* **More intuitive syntax**: Grants provide a more intuitive and consistent syntax. By separating the destination and port specifications, they make your tailnet policy file easier to read, write, and maintain.
* **Routing awareness**: The [`via`](/docs/features/access-control/grants/grants-via) field in grants gives the ability to control how traffic flows through subnet routers, exit nodes, or app connectors on its way to the destination. This means you can control not only who can access what, but also how that access is routed.
## [Structural mapping between ACLs and grants](#structural-mapping-between-acls-and-grants)
The following table outlines the mapping between the ACLs and grants structure to help visualize the conversion process.
|ACLs element|Grants element|Notes|
|`"acls": [...]`|`"grants": [...]`|Top-level array changes name|
|`"action": "accept"`|*Removed*|Implied in grants format|
|`"src": [...]`|`"src": [...]`|Source principals remain the same|
|`"dst": [...]`|`"dst": [...]` and `"ip": [...]`|Destination principals and ports separated|
|Port in destination: `"tag:server:80"`|Port in `"ip"` field: `"80"`|Port specification moves to IP field|
|`"proto": "tcp"`|Part of `"ip"` field: `"tcp:80"`|Protocol embedded in IP field|
|`"srcPosture": [...]`|`"srcPosture": [...]`|Same in both formats|
|*Not available*|`"app": {...}`|New field for application capabilities|
|*Not available*|`"via": [...]`|New field for routing control|
This structural mapping provides a foundation for the systematic conversion process that follows.
## [Basic migration patterns](#basic-migration-patterns)
The process of converting ACLs to grants follows some patterns that you can apply systematically to your tailnet policy file. This section outlines the basic conversion steps with practical examples.
The fundamental pattern for converting a standard ACL entry to a grant is to reorganize the components while maintaining the same access permissions.
1. Remove the `action` field.
2. Combine port specifications from destination with protocols from the `proto` field into the `ip` field.
In an ACL, you typically have a structure such as:
```
`"acls": [
{
"action": "accept",
"src": ["group:eng"],
"dst": ["tag:web-server:443"],
"proto": "tcp",
}
]
`
```
When converting to a grant, you'll reorganize this into:
```
`"grants": [
{
"src": ["group:eng"],
"dst": ["tag:web-server"],
"ip": ["tcp:443"],
}
]
`
```
Key differences: the grant removes the `action` field, as it's implied in grants, and moves the port specification from the `dst` field to a separate `ip` field. This separation makes the policy more readable and easier to maintain, especially when dealing with multiple ports or protocols.
If the ACL doesn't specify the protocol, you don't need to specify it in the grant.
For ACLs that specify multiple ports:
```
`"acls": [
{
"action": "accept",
"src": ["group:eng"],
"dst": ["tag:web-server:80", "tag:web-server:22"],
}
]
`
```
Becomes:
```
`"grants": [
{
"src": ["group:eng"],
"dst": ["tag:web-server"],
"ip": ["80", "22"]
}
]
`
```
However, if the original destination (`dst` field) targeted two different [tags](/docs/features/tags), you must create two grants⎯one for each tag.
```
`"acls": [
{
"action": "accept",
"src": ["group:eng"],
"dst": ["tag:web-server:80", "tag:dev-server:22"],
}
]
`
```
Becomes:
```
`"grants": [
{
"src": ["group:eng"],
"dst": ["tag:web-server"],
"ip": ["80"]
},
{
"src": ["group:eng"],
"dst": ["tag:dev-server"],
"ip": ["22"]
}
]
`
```
If you were to convert this ACL into a single grant, it would allow port `80` and port `22` for both the `dev-server` and `web-server` tags, which is a different permission outcome than the original ACL.
### [Convert ACLs to grants using the admin console](#convert-acls-to-grants-using-the-admin-console)
The admin console includes a **Convert to grants** button next to the JSON editor that automatically converts your entire `acls` section to equivalent `grants` entries.
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select **JSON editor**.
3. Under **Convert ACLs to grants**, select **Convert to grants**.
4. Review the converted grants in the editor. The conversion removes the `acls` section and replaces it with an equivalent `grants` section.
5. Select **Save** to apply the changes.
The **Convert to grants** button is always visible in the JSON editor but is disabled when your tailnet policy file does not contain an `acls` section.
The conversion takes effect in the editor immediately with no confirmation dialog. Review the converted grants before saving. Tailscale logs all tailnet policy file changes in the [configuration audit logs](/docs/features/logging/audit-logging), which lets you revert changes.
### [Manually convert ACLs to grants](#manually-convert-acls-to-grants)
This section outlines a step-by-step process for manually converting your ACLs to grants, with considerations for different scenarios that might add complexity.
Tailscale logs all tailnet policy file changes in the [configuration audit logs](/docs/features/logging/audit-logging), which lets you revert changes.
First, identify all ACL entries in your tailnet policy file and categorize them by their function or the resources they protect. This organization will help you convert related entries together and maintain a coherent structure in your grants.
For each ACL entry, follow this conversion process:
1. Create a new grant object with a `src` array containing the values from the ACLs `src` array.
2. Create a `dst` array in the grant object.
3. Create an `ip` array in the grant object.
4. For each entry in the ACLs `dst` array:
1. Split the entry on the colon (`:`) to separate the destination and ports.
2. Add the destination (part before the colon) to the `dst` array.
3. If the ACL rule has a `proto` field, add that protocol to the ports from the `dst` field (for example, `"tcp:80", "tcp:443"`).
4. If no `proto` field is specified, don't use a protocol prefix.
5. Add the resulting protocol string to the `ip` array.
6. If the ACL rule has a `srcPosture` array, copy it directly to the grant object.
If multiple destinations in a single ACL rule have different port requirements, create separate grant rules for each destination to maintain clear and specific permissions.
For complex policies, consider a phased approach by converting one section or functional area at a time. This incremental strategy reduces risk and makes it easier to identify and resolve any issues that arise during the migration.
After converting all ACLs to grants, review the entire tailnet policy file for consistency and completeness. Check that all necessary permissions have been preserved and that the resulting grants structure is logical and maintainable.
## [Migration scenarios](#migration-scenarios)
Beyond the basic patterns, you might encounter more complex ACL configurations that require special attention during migration. This section explores these scenarios and provides guidance on converting them to grants.
### [Wildcards](#wildcards)
When dealing with ACLs that use wildcard ports or protocol (`\*`) specifications, the conversion to grants follows specific rules. For example, an ACL that permits access to all ports:
```
`"acls": [
{
"action": "accept",
"src": ["group:prod"],
"dst": ["tag:database:\*"],
}
]
`
```
Converts to:
```
`"grants": [
{
"src": ["group:prod"],
"dst": ["tag:database"],
"ip": ["\*"],
}
]
`
```
### [IP address ranges and CIDR notations](#ip-address-ranges-and-cidr-notations)
For ACLs that use IP address ranges or [CIDR notation](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing), the conversion is similar, but you must be careful about how you structure the `dst` and `ip` fields. In grants, the CIDR notation stays in the `dst` field, while protocol and port specifications move to the `ip` field:
```
`"acls": [
{
"action": "accept",
"src": ["group:devops"],
"dst": ["192.0.2.0/24:22"],
"proto": ["tcp"],
}
]
`
```
Becomes:
```
`"grants": [
{
"src": ["group:devops"],
"dst": ["192.0.2.0/24"],
"ip": ["tcp:22"],
}
]
`
```
### [Autogroups](#autogroups)
If you've been using [autogroup selectors](/docs/reference/targets-and-selectors#autogroups) such as `autogroup:member` or `autogroup:self` in your ACLs, these convert directly to grants without any special handling:
```
`"acls": [
{
"action": "accept",
"src": ["autogroup:member"],
"dst": ["autogroup:self:\*"],
}
]
`
```
Becomes:
```
`"grants": [
{
"src": ["autogroup:member"],
"dst": ["autogroup:self"],
"ip": ["\*"],
}
]
`
```
## [SSH rules](#ssh-rules)
[Tailscale SSH](/docs/features/tailscale-ssh) uses a separate section in the policy file (`ssh`), separate from both ACLs and grants. During your migration, maintain these SSH rules in their original format.
## [Testing your migration](#testing-your-migration)
You can write access control [tests](/docs/reference/syntax/policy-file#tests) in the tailnet policy file to ensure that your migrated policies grant the expected access.
You can also use the **Preview rules** tab in the admin console editor. When you modify your tailnet policy file through the Tailscale admin console, you can preview the changes before applying them to check if the policies grant the expected access.
## [Best practices for grant management](#best-practices-for-grant-management)
As you transition to grants and begin managing your policy in this new format, following these best practices will help ensure a smooth and maintainable access control system.
* Organize your grants logically, grouping related permissions together and using comments to explain the purpose of each section.
* Consider implementing a staged migration approach, particularly for larger organizations. Start by converting your most basic ACLs to grants, then gradually migrate more complex rules, adding application capabilities as the final step. This phased approach reduces risk and makes it easier to identify and resolve any issues that arise during the migration.
* Document your grant structure and the reasoning behind it, especially for application layer capabilities. This documentation will be valuable for onboarding new team members who need to understand or modify the policy.
## [Troubleshooting common issues](#troubleshooting-common-issues)
Even with careful planning and testing, you might encounter some challenges during your migration.
If you notice missing permissions after migration, double-check that you converted all ACL entries to grants correctly. A common mistake is forgetting to include all ports or protocols in the `ip` field or omitting certain destinations when consolidating multiple ACL entries.
In complex setups, you might encounter overlapping grants that create unexpected access patterns. Review your grants to ensure that they don't inadvertently provide more access than intended, particularly when dealing with wildcards or ranges in the `ip` field.
For more troubleshooting guidance, refer to [Troubleshooting grants](/docs/reference/troubleshooting/grants).
On this page
* [Understanding the differences](#understanding-the-differences)
* [Benefits of migrating to grants](#benefits-of-migrating-to-grants)
* [Structural mapping between ACLs and grants](#structural-mapping-between-acls-and-grants)
* [Basic migration patterns](#basic-migration-patterns)
* [Convert ACLs to grants using the admin console](#convert-acls-to-grants-using-the-admin-console)
* [Manually convert ACLs to grants](#manually-convert-acls-to-grants)
* [Migration scenarios](#migration-scenarios)
* [Wildcards](#wildcards)
* [IP address ranges and CIDR notations](#ip-address-ranges-and-cidr-notations)
* [Autogroups](#autogroups)
* [SSH rules](#ssh-rules)
* [Testing your migration](#testing-your-migration)
* [Best practices for grant management](#best-practices-for-grant-management)
* [Troubleshooting common issues](#troubleshooting-common-issues)
Scroll to top