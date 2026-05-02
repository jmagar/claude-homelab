Invite and Review Users Joining Your Tailscale Tailnet
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|March 28, 2023
# Invite and review users joining your tailnet
We want to make it as easy as possible for teams to get started with Tailscale. So when a new teammate signs up with an @example.com email address, they’ll automatically join the same tailnet as everyone else @example.com. This automatic joining makes it easy to deploy Tailscale — so by default, all that users need to do to join their teammates is sign in with their company email address.
**In case your new teammate’s onboarding list is too long, we’ve made it even easier to onboard users by **[**inviting**](/kb/1064/invite-team-members/)** them to join your tailnet.** Inviting teammates helps make sure they’re onboarded with the right [role](/kb/1138/user-roles/) — so they can quickly get to work — and makes it possible to see who *hasn’t* signed in yet, and might need a hand.
### Invite users and assign them roles before they join
Admins can send an invite to any user in the same domain, and even assign them a specific role before they join. When you send an invite from the admin console, the invited user will be emailed a link to tailscale.com and information on getting started. The users are put in an “Invited” state until they sign in on a device or log into the admin console, at which point they’re treated like any other user.
Invite and assign new users a role from the admin console.
To invite new users to your organization, select **Invite team** from the [**Users**](https://login.tailscale.com/admin/users) page of the admin console.
### Review and approve individual users before they join
**We’ve also made it possible to prevent new users in your organization from joining your tailnet until they’ve been approved by an admin, with **[**user approval**](/kb/1239/user-approval/)**.** With user approval, admins can review and approve individual users from your domain when they ask to join your tailnet. This comes in handy, when, for example, only one team in your organization is meant to be using Tailscale. You’ll be notified by email when a new user needs approval — but you can also be notified in other ways, such as Slack, with the [userNeedsApproval webhook](/kb/1213/webhooks/). Pending users are shown as “Needs Approval” in the admin console.
User approval is disabled by default. You can enable user approval from the [**User management**](https://login.tailscale.com/admin/settings/user-management) settings page of the admin console. (Note that single-user tailnets such as Gmail accounts don’t have user approval because no one else can join anyway!)
And yes, if you have user approval enabled, any invites you send from the admin console will automatically be approved, so that those users can join your tailnet — because they’ve been explicitly invited to do so. To learn more, read the documentation about [inviting users](/kb/1064/invite-team-members/) and [user approval](/kb/1239/user-approval/).
Share
Authors
Claire Wang
Fran Bull
Authors
Claire Wang
Fran Bull
Share
Loading...
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)