Edit access control policies in your tailnet policy file · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Edit access control policies in your tailnet policy file
Last validated: Mar 13, 2026
You can edit [access control policies](/docs/features/access-control/acls) in your [tailnet policy file](/docs/reference/glossary#tailnet-policy-file) by using the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console, [GitOps for Tailscale](/docs/gitops), or the [Tailscale API](/docs/reference/tailscale-api). Refer to [tailnet policy syntax](/docs/reference/syntax/policy-file).
You must be an [Owner, Admin, or Network admin](/docs/reference/user-roles) to edit the tailnet policy file.
## [Convert ACLs to grants](#convert-acls-to-grants)
The JSON editor includes a **Convert to grants** button that automatically converts the entire `acls` section in your tailnet policy file to equivalent [grants](/docs/features/access-control/grants). The button is always visible but is disabled when there is no `acls` section present. Refer to [Migrate from ACLs to grants](/docs/reference/migrate-acls-grants) for more information.
## [Preview changes](#preview-changes)
You can preview user permissions while editing the access control policies in the tailnet policy file.
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Open the **Preview rules** tab.
3. Select a user to access a list of destinations (one per line) accessible to the specified user.
The list also shows the line number that defines that rule and any other users or groups that can access that destination (due to that rule).
You can also define [access control policy tests](/docs/reference/syntax/policy-file#tests) to ensure changes don't accidentally remove access to an important system or unintentionally allow access to resources.
## [Debug access control policies](#debug-access-control-policies)
You can use the [`tailscale ping` command](/docs/reference/tailscale-cli#ping) to debug access control policies by testing the connections between devices. The `tailscale ping` supports TSMP pings and ICMP pings.
TSMP pings check whether two devices can establish a network connection but stop before the access control policy check. Use `tailscale ping --tsmp` to send a TSMP ping.
```
`tailscale ping --tsmp
`
```
ICMP pings check the end-to-end connectivity between devices, including access control policies. Use `tailscale ping --icmp` or regular `ping` to send an ICMP ping.
```
`tailscale ping
`
```
If TSMP ping succeeds, but ICMP ping fails, connections between devices are likely blocked by access control policies. If TSMP ping fails, devices cannot establish a network connection, even though access control policies might allow connections. If both TSMP and ICMP pings succeed, but connections still fail, check the port numbers in your access control policies and services you are trying to connect to.
In addition to manual testing, you can create built-in access control policy [tests](/docs/reference/syntax/policy-file#tests) to ensure that specific connections are allowed and prevent access control policy changes from accidentally breaking these connections.
## [Revert changes](#revert-changes)
You can revert your [tailnet policy file](/docs/reference/glossary#tailnet-policy-file) to a previous date and time from the [Configuration logs](https://login.tailscale.com/admin/logs) page of the admin console. Refer to [Reverting access control policies from audit logs](/docs/features/logging/audit-logging#reverting-acls-from-audit-logs) for instructions.
You cannot revert the tailnet policy file if you are using [GitOps for Tailscale](/docs/gitops).
On this page
* [Convert ACLs to grants](#convert-acls-to-grants)
* [Preview changes](#preview-changes)
* [Debug access control policies](#debug-access-control-policies)
* [Revert changes](#revert-changes)
Scroll to top