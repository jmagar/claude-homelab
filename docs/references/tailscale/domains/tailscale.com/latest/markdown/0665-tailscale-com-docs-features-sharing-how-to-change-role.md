Changing user roles · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Changing user roles
Last validated: Jan 5, 2026
You can change the [roles](/docs/reference/user-roles) users in your network have to restrict access to the admin console. (To restrict which users and devices can communicate in your tailnet, refer to [access control policies](/docs/features/access-control).)
To remove or suspend users, refer to [Removing and suspending users](/docs/features/sharing/how-to/remove-team-members).
## [Change a user's role](#change-a-users-role)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) of a tailnet to change a user's role.
You can change a user's role from the [admin console](https://login.tailscale.com/admin):
1. Open the [Users](https://login.tailscale.com/admin/users) page of the admin console.
2. Find the row corresponding to the user you are interested in.
3. Select the menu at the far right, then select the **Edit role** option.
4. Select the role you want the user to have, then select **Save**:
A user cannot change their own role.
## [Change Owner](#change-owner)
You need to be the [Owner](/docs/reference/user-roles) of a tailnet to change the Owner.
You can change a user's role from the [admin console](https://login.tailscale.com/admin):
1. Open the [Users](https://login.tailscale.com/admin/users) page of the admin console.
2. Find the row corresponding to the user you are interested in.
3. Select the menu at the far right, then select the **Edit role** option.
4. Select **Owner**, then select **Save**.
### [Limitations when changing Owner](#limitations-when-changing-owner)
* If your tailnet uses a shared domain name (such as `gmail.com`), you cannot change ownership of the tailnet.
* If your tailnet uses a custom domain name, you can change the owner only to a user on that same domain.
On this page
* [Change a user's role](#change-a-users-role)
* [Change Owner](#change-owner)
* [Limitations when changing Owner](#limitations-when-changing-owner)
Scroll to top