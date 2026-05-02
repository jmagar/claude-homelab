User approval · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# User approval
Last validated: Sep 25, 2025
User approval is a feature that lets Tailscale network administrators to review and approve new
users before they can join your Tailscale network (known as a tailnet).
This feature is available for [all plans](/pricing).
When user approval is enabled, the first time a new user logs in to a tailnet, the user's status
is set to pending. While in a pending state, the user can connect their device to the Tailscale
coordination server, but cannot connect to other devices in the tailnet. An
[Owner, Admin, or IT admin](/docs/reference/user-roles) of the tailnet can review the user information and set the
user status to approved, or remove the user.
For tailnets created May 22, 2025 or later, user approval is enabled by default. For tailnets created prior to May 22, 2025, user approval was disabled by default.
## [Enable user approval for your network](#enable-user-approval-for-your-network)
You need to be an [Owner, Admin, or Network admin](/docs/reference/user-roles)
of a tailnet to enable user approval.
To enable user approval, open the [User management](https://login.tailscale.com/admin/settings/user-management) page of the admin console and enable **User Approval**.
Once this setting is enabled, new users that access your network cannot send or receive traffic
to other devices until they are approved. When a new user logs in, the user's device appears in the
[Machines](https://login.tailscale.com/admin/machines) page of the admin console with the **User needs approval** badge. You can
[use a filter](https://login.tailscale.com/admin/machines/?q=disabled:user-needs-approval) to find all machines that have the **User needs approval** badge.
## [Approve a pending user](#approve-a-pending-user)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles)
of a tailnet to approve a user.
To approve a user, open the [Users](https://login.tailscale.com/admin/users) page of the admin console. At the top of the list you will
find the user with a **Needs approval** badge beneath them. You can find the user by user name, and also the [`status:pending`](https://login.tailscale.com/admin/users?q=status:pending) filter.
You can review details about the user before deciding whether to approve the user. You can also change the role to assign the
user. For example, an Admin could change an unapproved user's role from Member to IT admin, before approving the user.
When you're ready to approve the user, select the menu and select **Approve** to allow the user to
connect to your network.
After approval, the user will immediately be able to connect.
## [Remove a pending user](#remove-a-pending-user)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles)
of a tailnet to remove a user whose status is pending.
To remove a user, open the [Users](https://login.tailscale.com/admin/users) page of the admin console. At the top of the list you will
find the user with a **Needs approval** badge beneath them. You can find the user by user name, and also the [`status:pending`](https://login.tailscale.com/admin/users?q=status:pending) filter.
For the user that your want to remove, select the menu and select **Remove**.
Note that removing a pending user does not prevent them from trying to log in (to a pending state)
again.
## [Disable user approval for your network](#disable-user-approval-for-your-network)
You need to be an [Owner, Admin, or Network admin](/docs/reference/user-roles)
of a tailnet to disable user approval.
To disable user approval, open the [User management](https://login.tailscale.com/admin/settings/user-management) page of the admin console and disable **User Approval**.
## [Impact on other features](#impact-on-other-features)
If you enable [User & group provisioning](/docs/features/user-group-provisioning) for your tailnet, you cannot enable user
approval because both cannot be enabled. If user approval is enabled, and then you enable User and
group provisioning, the user approval feature will be disabled—you will need to manually
approve or remove any pending users.
## [Limitations](#limitations)
A tailnet can enable either user approval or [User & group provisioning](/docs/features/user-group-provisioning), but not
both.
On this page
* [Enable user approval for your network](#enable-user-approval-for-your-network)
* [Approve a pending user](#approve-a-pending-user)
* [Remove a pending user](#remove-a-pending-user)
* [Disable user approval for your network](#disable-user-approval-for-your-network)
* [Impact on other features](#impact-on-other-features)
* [Limitations](#limitations)
Scroll to top