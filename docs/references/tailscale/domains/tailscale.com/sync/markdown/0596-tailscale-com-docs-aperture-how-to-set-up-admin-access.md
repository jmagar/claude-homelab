Set up admin access · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Set up admin access
Last validated: Apr 9, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
New Aperture instances grant admin access to everyone by default. Before your team starts using Aperture, restrict admin access to specific users so that only designated administrators can edit settings and view data for all users.
Admins can:
* Edit the [Aperture configuration](/docs/aperture/configuration) from the **Settings** page of the Aperture dashboard.
* View dashboards, session logs, and usage data for all users.
* Access all quota buckets and refill them through the API.
* Access the `/metrics` Prometheus endpoint (when `read\_metrics` is granted).
Standard users can only view their own dashboard and usage data.
## [Prerequisites](#prerequisites)
Before you begin, ensure you have the following:
* An [Aperture instance](/docs/aperture/get-started) with at least one configured provider.
* Access to the Aperture dashboard.
* Your Tailscale login name (for example, `alice@example.com`).
## [Restrict admin access](#restrict-admin-access)
The [default configuration](/docs/aperture/configuration#default-configuration) grants everyone the admin role using `"src": ["\*"]`. Replace this with explicit admin grants for specific users.
Do not remove the wildcard admin grant until you have added an explicit admin grant for yourself. Aperture prevents saves that would remove the saving user's admin access, but editing the configuration directly (outside the web interface) does not have this safeguard.
1. Open the **Settings** page of the Aperture dashboard.
2. Find the grant with `{ "role": "admin" }` and `"src": ["\*"]`.
3. Replace `"\*"` with the Tailscale login names of your administrators.
The following example grants admin access to two specific users:
```
`{
"grants": [
{
"src": ["alice@example.com", "bob@example.com"],
"app": {
"tailscale.com/cap/aperture": [
{ "role": "admin" }
]
}
},
{
"src": ["\*"],
"app": {
"tailscale.com/cap/aperture": [
{ "role": "user" }
]
}
}
]
}
`
```
This configuration gives `alice@example.com` and `bob@example.com` admin access, while all other users get standard user access. Admin access takes precedence when a user matches both grants, so Alice and Bob receive admin-level permissions.
### [Use Tailscale groups](#use-tailscale-groups)
For organizations that manage access through Tailscale groups, you can assign admin roles using groups in the Aperture configuration. This approach lets you manage admin membership centrally through your Tailscale group definitions. Group matching requires the `tailscale.com/visible-groups` [node attribute](/docs/features/node-attributes) on the Aperture device.
```
`{
"grants": [
{
"src": ["group:aperture-admins"],
"app": {
"tailscale.com/cap/aperture": [
{ "role": "admin" }
]
}
},
{
"src": ["group:ai-users"],
"app": {
"tailscale.com/cap/aperture": [
{ "role": "user" }
]
}
}
]
}
`
```
If multiple grants match a given user, the highest-permissioned role (admin) wins. Refer to the [grants configuration reference](/docs/aperture/configuration#grants) for the full syntax.
## [Verify admin access](#verify-admin-access)
After restricting admin access, verify the configuration is correct:
1. Open the **Settings** page. If you can view and edit the configuration, your admin access is working.
2. Sign in from a non-admin device or have a non-admin user confirm they cannot access the **Settings** page.
## [Next steps](#next-steps)
* [Control model access](/docs/aperture/how-to/grant-model-access) to define which models each user or group can use.
* [Set per-user spending limits](/docs/aperture/how-to/set-per-user-spending-limits) to manage costs.
* Refer to the [Aperture dashboard reference](/docs/aperture/reference/dashboard) for details on each admin-accessible page.
On this page
* [Prerequisites](#prerequisites)
* [Restrict admin access](#restrict-admin-access)
* [Use Tailscale groups](#use-tailscale-groups)
* [Verify admin access](#verify-admin-access)
* [Next steps](#next-steps)
Scroll to top