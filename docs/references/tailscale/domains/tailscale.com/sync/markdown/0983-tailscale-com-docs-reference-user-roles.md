User roles · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# User roles
Last validated: Dec 4, 2025
User roles are Identity & Access Management (IAM) roles used to restrict access to the admin console.
User roles are available for [all plans](/pricing).
Some roles are available only for specific plans, which is noted in the role documentation.
To understand and restrict which users and devices can communicate in your tailnet, refer to [access control policies](/docs/features/access-control/acls).
## [Managing roles](#managing-roles)
You can [add](/docs/features/sharing/how-to/invite-team-members) or [remove](/docs/features/sharing/how-to/remove-team-members) users and [change their roles](/docs/features/sharing/how-to/change-role) in the [Users](https://login.tailscale.com/admin/users) page of the admin console.
A user cannot modify their own role, except to transfer the Owner role to another user.
## [User role categories](#user-role-categories)
To delineate which user roles are available by [pricing plan](/pricing), roles are categorized as Basic or Advanced.
### [Basic roles](#basic-roles)
Basic roles are available for all pricing plans. The following roles are in the Basic category:
* [Owner](#owner)
* [Admin](#admin)
* [Member](#member)
### [Advanced roles](#advanced-roles)
Advanced roles are available for the Standard, Premium, and Enterprise pricing plans. The following roles are in the Advanced category:
* [Billing admin](#billing-admin)
* [IT admin](#it-admin)
* [Network admin](#network-admin)
* [Auditor](#auditor)
## [Roles](#roles)
### [Owner](#owner)
An Owner is the owner of the Tailscale account for your organization. This individual can access all information about your Tailscale account, including pricing plan and billing information.
An Owner can transfer their ownership to another user in the [Users](https://login.tailscale.com/admin/users) page of the admin console, subject to [limitations](/docs/features/sharing/how-to/change-role#limitations-when-changing-owner). For an Owner's account to be deleted, the Owner role must first be transferred to another user.
A Tailscale organization must have an Owner. There can only be one Owner.
If you haven't modified this, the Owner is likely the first user who installed Tailscale. You can identify the Owner by their role on the Users tab of the admin console.
If you don't have access to the admin console to identify the Owner, or have lost access to the Owner account, [contact us](/contact/support) for help.
### [Admin](#admin)
An Admin is an administrator of the Tailscale account for your organization. They can perform any action in the [admin console](https://login.tailscale.com/admin), including inviting or removing users, modifying access control policies, approving machines, enabling or disabling features, and modifying pricing plan and billing information.
There can be multiple Admins.
### [Network admin](#network-admin)
This role is available for [the Personal, Premium, and Enterprise plans](/pricing).
A Network admin is an administrator of the Tailscale account for your organization, who can only manage your network configuration. They can modify the tailnet policy file, and modify DNS, subnets, and other networking settings. They can read but not modify user and device information (even for their own devices), and general settings. They cannot access or change the pricing plan or billing information.
In a larger organization, use this role for the Networking team, to manage your network topology including DNS and subnets.
### [IT admin](#it-admin)
This role is available for [the Personal, Premium, and Enterprise plans](/pricing).
An IT admin is an administrator of the Tailscale account for your organization, who can only manage users and machines. They can perform actions to remove users, or approve and remove devices, and can modify general settings, like enabling certain features. They can read but not modify network information, such as the tailnet policy file and DNS configurations. They cannot accept subnet router routes. They cannot access or change the pricing plan or billing information.
In a larger organization, use this role for the IT team, to onboard and offboard users and their devices.
An IT admin can grant all roles, including roles that are more powerful than IT admin. This follows the principle of separation of duties, as *two*
individuals must work together to elevate their access.
### [Billing admin](#billing-admin)
This role is available for [the Personal, Premium, and Enterprise plans](/pricing).
A Billing admin is an administrator of the Tailscale account for your organization, who can only modify pricing plan and billing information. They can read but not modify information in the admin console, such as user and device information, network information, or general settings.
A Billing admin does not automatically receive [billing emails](/docs/account/billing/modify-billing#change-the-billing-email-address).
In a larger organization, use this role for the finance or accounting team.
### [Auditor](#auditor)
This role is available for [the Personal, Premium, and Enterprise plans](/pricing).
An Auditor is a member of the Tailscale account for your organization. They can read all configurations for your tailnet but not modify any of them.
In a larger organization, use this role for the compliance or audit team.
### [Member](#member)
A Member is a user of your tailnet. They cannot access the admin console, but can connect to nodes in your tailnet as permitted by [access control policies](/docs/features/access-control/acls).
New users in a tailnet are Members by default.
There can be multiple Members.
If you are [sharing a node](/docs/features/sharing) with another user, they are a Member for that node only, not the entire tailnet.
## [Permission matrix](#permission-matrix)
### [Permissions managed by user roles](#permissions-managed-by-user-roles)
|**Permission**|**Owner**|**Admin**|**Network admin**|**IT admin**|**Billing admin**|**Auditor**|**Member**|
|Can access the admin console|✅|✅|✅|✅|✅|✅|❌|
|Read tailnet policy file|✅|✅|✅|✅|✅|✅|❌|
|Write tailnet policy file|✅|✅|✅|❌|❌|❌|❌|
|Read network configurations|✅|✅|✅|✅|✅|✅|❌|
|Write network configurations, for example, enable MagicDNS, split DNS, make subnet, or allow a node to be an exit node, enable HTTPS|✅|✅|✅|❌|❌|❌|❌|
|Read feature configuration|✅|✅|✅|✅|✅|✅|❌|
|Write feature configuration, for example, enable Taildrop|✅|✅|❌|✅|❌|❌|❌|
|Configure user & group provisioning|✅|✅|❌|✅|❌|❌|❌|
|Read machines, for example, read machine names and status|✅|✅|✅|✅|✅|✅|❌|
|Write machines, for example, approve, rename, and remove machines|✅|✅|❌|✅|❌|❌|❌|
|Read users and user roles|✅|✅|✅|✅|✅|✅|❌|
|Write users and user roles, for example, remove users, approve users, make Admin|✅|✅|❌|✅|❌|❌|❌|
|Can generate auth keys|✅|✅|✅|✅|❌|❌|❌|
|Can generate API access tokens and OAuth clients|✅|✅|✅|✅|❌|❌|❌|
|Can share a node|✅|✅|❌|✅|❌|❌|❌|
|Can accept a shared node|✅|✅|❌|✅|❌|❌|❌|
|Can use any tag (without being tag owner)|✅|✅|✅|❌|❌|❌|❌|
|Read configuration audit logs|✅|✅|✅|✅|✅|✅|❌|
|Use Tailscale SSH Console, if allowed by tailnet policy file|✅|✅|✅|✅|❌|❌|❌|
|Write webhooks|✅|✅|✅|✅|❌|❌|❌|
|Write tailnet name|✅|✅|✅|❌|❌|❌|❌|
|Read payment plan|✅|✅|❌|❌|✅|❌|❌|
|Write payment plan|✅|✅|❌|❌|✅|❌|❌|
|Write billing information|✅|✅|❌|❌|✅|❌|❌|
### [Permissions managed by tailnet policy file](#permissions-managed-by-tailnet-policy-file)
Permissions for communicating within a network, and for running certain commands on devices, are set by the [tailnet policy file](/docs/features/tailnet-policy-file):
* Access to a machine
* Ability to set a tag ([tag owner](/docs/reference/syntax/policy-file#tag-owners))
* Ability to self-approve a route or exit node ([auto approver](/docs/reference/syntax/policy-file#autoapprovers))
On this page
* [Managing roles](#managing-roles)
* [User role categories](#user-role-categories)
* [Basic roles](#basic-roles)
* [Advanced roles](#advanced-roles)
* [Roles](#roles)
* [Owner](#owner)
* [Admin](#admin)
* [Network admin](#network-admin)
* [IT admin](#it-admin)
* [Billing admin](#billing-admin)
* [Auditor](#auditor)
* [Member](#member)
* [Permission matrix](#permission-matrix)
* [Permissions managed by user roles](#permissions-managed-by-user-roles)
* [Permissions managed by tailnet policy file](#permissions-managed-by-tailnet-policy-file)
Scroll to top