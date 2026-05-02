JIT access with Opal · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# JIT access with Opal
Last validated: Jan 5, 2026
[Opal](https://opal.dev) is a centralized authorization platform for IT and infrastructure teams to make access
management requests self-service.
On-demand access to Tailscale resources can be provisioned using Opal. This works by adding and
removing members from [SSH access rules](/docs/reference/syntax/policy-file#ssh)
for [tags](/docs/features/tags) in Tailscale [access control policies](/docs/features/access-control).
You can use Opal with [user & group provisioning](/docs/features/user-group-provisioning) to update [SCIM-integrated](/learn/what-is-scim) group membership in groups used in
Tailscale access control policies. Likewise, you can use Opal to assign a user to the Tailscale application, with the user synced through SCIM to your Tailscale network.
## [Prerequisites](#prerequisites)
Before you begin this guide, you'll need a tailnet and an Opal account.
* For information about creating a tailnet, refer to the [Tailscale quickstart](/docs/how-to/quickstart).
* For information about creating an Opal account, refer to the [Opal](https://opal.dev) documentation.
## [Integration](#integration)
Refer to the full instructions in Opal's [blog post](https://www.opal.dev/blog/tailscale) for setting up an integration with Tailscale.
To use Opal with Tailscale, you'll need to:
1. Generate a Tailscale [API access token](/docs/reference/tailscale-api) from the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console.
2. In Opal, [add Tailscale as a new application](https://app.opal.dev/apps/create/tailscale).
1. Set the **App Admin** to the team that should manage the Tailscale app in Opal.
2. Enter a **Description** of how you use Tailscale, so colleagues know what they're requesting access to. For example,
"SSH access to the production network".
3. Set the **Tailnet name** to be your tailnet ID. You can find your tailnet ID in the [General](https://login.tailscale.com/admin/settings/general) page of the admin console.
4. Set the **Tailscale API key** to the Tailscale API access token you generated.
5. Determine which Tailscale [tags](/docs/features/tags) should be imported into Opal. This is done by the App Admin. For each
tag that is selected, Opal will automatically parse the existing [access rules](/docs/reference/syntax/policy-file#acls) and
[SSH access rules](/docs/reference/syntax/policy-file#ssh) that apply to that tag, and which [groups](/docs/reference/syntax/policy-file#groups) have access to the tagged
sources using those rules.
Now a user can request access or SSH access to a specific tag in Tailscale, and Opal will update the [tailnet policy file](/docs/reference/syntax/policy-file) to allow the temporary access.
On this page
* [Prerequisites](#prerequisites)
* [Integration](#integration)
Scroll to top