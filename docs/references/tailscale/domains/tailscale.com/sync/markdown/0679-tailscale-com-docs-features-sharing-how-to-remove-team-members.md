Deleting and suspending users · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Deleting and suspending users
Last validated: Jan 5, 2026
You can delete and suspend users who should no longer be on your Tailscale network (known as a tailnet) in the [Users](https://login.tailscale.com/admin/users) page of the admin console, to prevent them from using Tailscale without permanently deleting their devices.
## [Deleting users](#deleting-users)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) of a tailnet to delete a user.
1. Open the [Users](https://login.tailscale.com/admin/users) page of the admin console.
2. Find the row corresponding to the user you are interested in.
3. Select the menu at the far right and select the **Delete user** option.
4. Done. The user is deleted.
When a user is deleted from your network:
* User devices are deleted. The device keys are removed from the [coordination server](/blog/how-tailscale-works) so that
any further requests from those devices to connect to the network are blocked.
* API access tokens and auth keys for the user stop working
* These actions usually happens within seconds
To delete a user with the Owner role, you must first [assign a different user as the tailnet Owner](/docs/reference/user-roles), then delete the desired user.
### [When using user & group provisioning](#when-using-user--group-provisioning)
If you have [user & group provisioning](/docs/features/user-group-provisioning) enabled in your tailnet, we recommend you use SCIM to automatically deprovision users.
* If using [Okta](/docs/integrations/identity/okta/okta-scim), deactivate the user in Okta. This will automatically suspend the user in Tailscale. Then, you can delete the suspended user in Tailscale.
* If using [Microsoft Entra ID](/docs/integrations/identity/entra/entra-id-scim), delete the user in Microsoft Entra ID. This will automatically suspend the user in Tailscale, and approximately 30 days later they are deleted in Tailscale.
## [Suspending users](#suspending-users)
If you don't want to delete a user from your network right away, but want to restrict them from using Tailscale, you can suspend the user.
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) of a tailnet to suspend and restore a user.
1. Go to the [Users](https://login.tailscale.com/admin/users) page of the admin console.
2. Find the row corresponding to the user you are interested in.
3. Select the menu at the far right and select the **Suspend user** option.
The user is shown as **Suspended** in the users page.
When a user is suspended, they cannot use Tailscale on this tailnet. That means:
* Their devices are not able to connect to other devices in the tailnet, including other devices they own
Devices belonging to a suspended user may appear connected, but they cannot exchange traffic with other devices in the tailnet until the suspension is lifted.
* They cannot add new devices to the tailnet. If they try to sign in on a device, they will get an error that they are suspended
* They cannot access the admin console
* Their API access tokens and auth keys stop working
If someone else has access to their devices, they can re-authenticate or tag these devices and use them in the same tailnet.
## [Pending users](#pending-users)
If you have enabled [user approval](/docs/features/access-control/user-approval), new users are placed in a pending state. For
information about removing a pending user, refer to [Remove a pending user](/docs/features/access-control/user-approval#remove-a-pending-user).
## [Restoring users](#restoring-users)
You can restore a user from the [Users](https://login.tailscale.com/admin/users) page of the admin console by choosing the **Restore user** option.
When a user is restored, they regain access to Tailscale on this tailnet, including the devices they owned when they were restored. More specifically, restored users can do the following:
* Reconnect to other devices in the tailnet, as allowed by [access control policies](/docs/features/access-control)
* Add new devices to the tailnet
* Access the admin console, if allowed based on their [role](/docs/reference/user-roles)
* Use pre-existing API access tokens and auth keys, if they have not expired
## [Managing user resources](#managing-user-resources)
* Machines for suspended users are suspended, and can be deleted or reassigned. Machines for deleted users are deleted. A machine can be re-assigned to a tag, or a new user can log into it. If new user logs into the machine, it's recognized as a new machine.
* API keys for suspended users are suspended. API keys for deleted users are automatically revoked. They cannot be reassigned. You must create a new [API key](/docs/reference/tailscale-api#authentication) or an [OAuth](/docs/features/oauth-clients) client.
* Auth keys for suspended users are suspended. Auth keys for deleted users are automatically revoked. They cannot be reassigned. You must create a new [auth key](/docs/features/access-control/auth-keys) or an [OAuth](/docs/features/oauth-clients) client.
## [Managing idle users](#managing-idle-users)
If a user is not the Owner and has not signed in or used Tailscale for more than 7 days, they are shown as **Idle** in the [Users](https://login.tailscale.com/admin/users) page of the admin console.
## [Leaving a tailnet](#leaving-a-tailnet)
You cannot delete yourself from a network or leave a network. Ask your administrator to remove your account. You can, however, delete your account by [contacting support](/contact/support?type=accountdeletion).
## [Deleting a tailnet](#deleting-a-tailnet)
If you decide you want to delete your entire tailnet, refer to the [Deleting your tailnet](/docs/account/delete-tailnet) topic.
On this page
* [Deleting users](#deleting-users)
* [When using user & group provisioning](#when-using-user--group-provisioning)
* [Suspending users](#suspending-users)
* [Pending users](#pending-users)
* [Restoring users](#restoring-users)
* [Managing user resources](#managing-user-resources)
* [Managing idle users](#managing-idle-users)
* [Leaving a tailnet](#leaving-a-tailnet)
* [Deleting a tailnet](#deleting-a-tailnet)
Scroll to top