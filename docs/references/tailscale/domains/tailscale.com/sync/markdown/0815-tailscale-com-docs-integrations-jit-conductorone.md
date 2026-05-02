JIT access with ConductorOne · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# JIT access with ConductorOne
Last validated: Jan 5, 2026
[ConductorOne](https://www.conductorone.com) is a security platform that lets you manage access requests for your Tailscale entitlements.
On-demand access to Tailscale resources can be provisioned using ConductorOne. This works by adding and removing members from [groups](/docs/reference/syntax/policy-file#groups), [access rules](/docs/reference/syntax/policy-file#acls), and [SSH access rules](/docs/reference/syntax/policy-file#ssh) defined in Tailscale [access control policies](/docs/features/access-control).
You can use ConductorOne with [user & group provisioning](/docs/features/user-group-provisioning) to update [SCIM-integrated](/learn/what-is-scim) group membership in groups used in
Tailscale access control policies. Likewise, you can use ConductorOne to assign a user to the Tailscale application, with the user synced through SCIM to your Tailscale network.
You can connect multiple tailnets to ConductorOne simultaneously.
## [Prerequisites](#prerequisites)
Before you begin this guide, you'll need a tailnet and a ConductorOne account.
* For information about creating a tailnet, refer to the [Tailscale quickstart](/docs/how-to/quickstart).
* For information about creating a ConductorOne account, refer to [ConductorOne](https://www.conductorone.com).
## [Integration](#integration)
Review the full instructions in ConductorOne's [blog post](https://www.conductorone.com/blog/implementing-least-privilege-access-tailscale-conductorone) for setting up an integration with Tailscale.
To use ConductorOne with Tailscale, you'll need to:
1. Generate a Tailscale [API access token](/docs/reference/tailscale-api) from the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console.
2. In ConductorOne, select the **Tailscale** integration and then select **Add Connector**.
1. Choose the option to **Create a new app**.
2. Set the **Tailscale API key** to the Tailscale API access token you generated.
3. Set the **Tailnet** to your tailnet ID. You can find your tailnet ID in the [General](https://login.tailscale.com/admin/settings/general) page of the admin console.
ConductorOne will automatically identify all the users in the tailnet and parse existing [access rules](/docs/reference/syntax/policy-file#acls) in Tailscale
access control policies, including [SSH access rules](/docs/reference/syntax/policy-file#ssh), as entitlements in ConductorOne. The application owner in ConductorOne can specify for each
entitlement, such as group membership or another SSH access rule, whether to restrict access by time, and whether to
use the default application grant policy.
Now a user can request access to a specific Tailscale entitlement through the **Request access** page of ConductorOne and through Slack. ConductorOne will update the [tailnet policy file](/docs/features/tailnet-policy-file) to allow the temporary access.
On this page
* [Prerequisites](#prerequisites)
* [Integration](#integration)
Scroll to top