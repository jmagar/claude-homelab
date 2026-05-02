Invite team members to your tailnet · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Invite team members to your tailnet
Last validated: Jan 5, 2026
If your Tailscale network (tailnet) uses a custom domain, you can send a team invite to one or more email addresses simultaneously.
Your Tailscale billing includes invited users who join and transfer data in your tailnet. This includes invited users who are paid users in other tailnets. Tailscale bills for every user on every tailnet.
Team invites are available for [all plans](/pricing).
A Tailscale user account may not be shared or used by multiple individuals.
Unused invites expire 90 days after the last welcome invite was sent.
## [Prerequisites](#prerequisites)
* You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) to send invites.
* Your tailnet must use a custom domain. If your tailnet uses shared domains (such as `example@gmail.com`) you can [send invites using a URL link](/docs/features/sharing/how-to/invite-any-user) instead.
* Your custom domain must use one of the following identity providers:
* A [supported identity provider](/docs/integrations/identity).
* A [custom OIDC provider](/docs/integrations/identity/custom-oidc).
## [Send a team invite](#send-a-team-invite)
1. Open the [Users](https://login.tailscale.com/admin/users) page of the admin console.
2. Select **Send welcome email**.
3. Add the email address for each user that you want to add to the tailnet. Any email address in an invite must match the custom domain name for your tailnet.
Multiple email addresses must be comma-separated with an optional space after each comma. The acceptable formats are:
`user1@example.com,user2@example.com,user3@example.com`
`user1@example.com, user2@example.com, user3@example.com`
4. Select the [user role](/docs/reference/user-roles) you want to automatically assign for each user in the invite. Only one role can be assigned for all email addresses in a single invite.
5. Select **Send emails**.
## [Accept a team invite](#accept-a-team-invite)
Users will receive an email inviting them to join your organization's tailnet by [downloading the Tailscale client](/download) and signing in with an identity provider or a [passkey](/docs/integrations/identity/passkeys).
## [Approve a team invite](#approve-a-team-invite)
If your tailnet has [user approval](/docs/features/access-control/user-approval) enabled, you must approve invited users before they can join the tailnet.
## [Review team invites](#review-team-invites)
To review all current invites, use the [`status:invited`](https://login.tailscale.com/admin/users?q=status:invited) filter.
## [Resend a team invite](#resend-a-team-invite)
To resend an invite:
1. Open the [Users](https://login.tailscale.com/admin/users) page of the admin console.
2. Locate the invited user by typing their email address in the search bar or using the [`status:invited`](https://login.tailscale.com/admin/users?q=status:invited) filter.
3. Select the menu next to the user's name, then select **Resend user invite**.
## [Delete a team invite](#delete-a-team-invite)
You can delete invites if you accidentally share a user invite or want to revoke it for another reason.
To delete an invite:
1. Open the [Users](https://login.tailscale.com/admin/users) page of the admin console.
2. Locate the invited user by either typing their email address in the search bar or using the [`status:invited`](https://login.tailscale.com/admin/users?q=status:invited) filter.
3. Select the menu next to the user's name, then select **Delete user invite**.
## [Monitor team invites](#monitor-team-invites)
You can track user invite activity in the [Configuration logs](https://login.tailscale.com/admin/logs) page of the admin console.
## [Limitations](#limitations)
* You can only invite users in the same domain.
* GitHub user accounts don't have email addresses, so you cannot send an invite to GitHub accounts.
* A single team invite can only grant the invited users one role.
On this page
* [Prerequisites](#prerequisites)
* [Send a team invite](#send-a-team-invite)
* [Accept a team invite](#accept-a-team-invite)
* [Approve a team invite](#approve-a-team-invite)
* [Review team invites](#review-team-invites)
* [Resend a team invite](#resend-a-team-invite)
* [Delete a team invite](#delete-a-team-invite)
* [Monitor team invites](#monitor-team-invites)
* [Limitations](#limitations)
Scroll to top