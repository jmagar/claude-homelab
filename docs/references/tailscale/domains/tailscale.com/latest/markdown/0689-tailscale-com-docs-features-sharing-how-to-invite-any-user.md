Invite any user to your tailnet · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Invite any user to your tailnet
Last validated: Jan 5, 2026
You can send a one-time use invitation to any user you want to join a Tailscale network (tailnet) in the form of a generated URL. You might want to use one-time user invites to add users such as friends, family, or contractors to a personal tailnet or an organization tailnet for authentication.
Your Tailscale billing includes invited users who join and transfer data in your tailnet. This includes invited users who are paid users in other tailnets. Tailscale [bills for every active user](/docs/account/billing/modify-billing) on every tailnet.
Inviting any user to a tailnet is available for [all plans](/pricing).
A Tailscale user account may not be shared or used by multiple individuals.
Unused invites expire after 30 days.
## [Send an invite email](#send-an-invite-email)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) to send an invitation by using email.
To send an invitation by using email:
1. Open the [Users](https://login.tailscale.com/admin/users) page of the admin console.
2. Select **Invite external users**.
3. Add the email address for each user that you want to invite to the tailnet.
4. Select the user role you want to automatically assign for each user in the invite. Only one role can be assigned for all email addresses in a single invite.
5. Select **Invite** to send email invitations to each listed email address.
## [Send an invite link](#send-an-invite-link)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) to send an invitation link.
To send an invite link:
1. Open the [Users](https://login.tailscale.com/admin/users) page of the admin console.
2. Select **Invite external users**.
3. Select the **Copy invite link** tab.
4. Select the [user role](/docs/reference/user-roles) you want to assign to the invite link.
5. Select **Generate & copy invite link** to copy the invite URL to your clipboard.
6. Send the URL link to the user you want to invite to your tailnet.
## [Enable or disable joining external tailnets](#enable-or-disable-joining-external-tailnets)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) to enable or disable joining external tailnets.
You can allow or prevent users in your tailnet from joining other (external) tailnets. By default, tailnets only allow Admin users to accept an invitation to join external tailnets.
To enable joining external tailnets:
1. Open the [General](https://login.tailscale.com/admin/settings/general) settings page of the admin console.
2. In the **Join external tailnets** section, select the user roles to allow joining external tailnets.
To disable joining external tailnets:
1. Open the [General](https://login.tailscale.com/admin/settings/general) settings page of the admin console.
2. Select **None (disable)** in the **Join external tailnets** section.
Events for joining and leaving an external tailnet appear in the [configuration audit logs](/docs/features/logging/audit-logging#events).
## [Accept an invite](#accept-an-invite)
To accept an invite:
1. Copy and paste the URL from your invite into a web browser.
2. Sign in to Tailscale with your identity provider or [passkey](/docs/integrations/identity/passkeys).
3. [Download](/download) the Tailscale client.
## [Leave a tailnet](#leave-a-tailnet)
Users who join multiple external tailnets can leave subsequently joined tailnets using the **Leave tailnet** option. This option only displays subsequent tailnets a user joins. It is only available for organizational tailnets.
If you have access to the admin console:
1. Open the [Users](https://login.tailscale.com/admin/users) page of the admin console.
2. Locate your account.
3. Select the menu.
4. Select **Leave tailnet**.
If you do not have access to the admin console:
1. Go to the Tailscale [admin console](https://login.tailscale.com/admin).
2. In the top right corner, select the menu.
3. Select **Leave tailnet**.
## [Approve an invite](#approve-an-invite)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) to approve an invited user.
If your tailnet has [user approval](/docs/features/access-control/user-approval) enabled, you must approve invited users before they can join the tailnet.
## [Review invites](#review-invites)
You need to be an [Owner, Admin, IT admin, Network admin, or Billing admin](/docs/reference/user-roles) to review invitations.
To review all current invites, use the [`status:invited`](https://login.tailscale.com/admin/users?q=status:invited) filter.
## [Resend an invite](#resend-an-invite)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) to resend an invitation.
To resend an invite:
1. Open the [Users](https://login.tailscale.com/admin/users) page of the admin console.
2. Locate the invited user by either typing their email address in the search bar or using the [`status:invited`](https://login.tailscale.com/admin/users?q=status:invited) filter.
3. Select the menu next to the user's name, then select **Resend user invite** or **Copy invite link**.
## [Delete an invite](#delete-an-invite)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) to revoke an invitation.
You can delete invites if you accidentally share a user invite or want to revoke it for another reason.
To delete an invite:
1. Open the [Users](https://login.tailscale.com/admin/users) page of the admin console.
2. Locate the invited user by typing their email address in the search bar or using the [`status:invited`](https://login.tailscale.com/admin/users?q=status:invited) filter.
3. Select the menu next to the user's name, then select **Delete invite**.
## [Monitor invites](#monitor-invites)
You need to be an [Owner, Admin, IT admin, Network admin, or Billing admin](/docs/reference/user-roles) to review configuration audit logs.
You can track user invite activity in the [Configuration logs](https://login.tailscale.com/admin/logs) page of the admin console.
On this page
* [Send an invite email](#send-an-invite-email)
* [Send an invite link](#send-an-invite-link)
* [Enable or disable joining external tailnets](#enable-or-disable-joining-external-tailnets)
* [Accept an invite](#accept-an-invite)
* [Leave a tailnet](#leave-a-tailnet)
* [Approve an invite](#approve-an-invite)
* [Review invites](#review-invites)
* [Resend an invite](#resend-an-invite)
* [Delete an invite](#delete-an-invite)
* [Monitor invites](#monitor-invites)
Scroll to top