Effortless Network Expansion: Invite Anyone to Your Tailnet
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|June 06, 2023
# Invite anyone to your tailnet
Starting today, you can invite anyone to your Tailscale network (tailnet) even if they’re on a different domain or using a shared domain like Gmail. For those using Tailscale at home, you’ll be able to add family and friends with their existing email accounts — so multiple Gmail.com users can be on the same tailnet! For organizations using Tailscale, you can now invite external contractors or partners without setting up a temporary email account or adding them to your IdP. This also means that if you’re on the Free plan using a single-user email account to authenticate — like Gmail — you’ll now be able to invite more users to your tailnet.
When we launched Tailscale, we wanted it to be the easiest way for users to connect their devices securely across the internet. So, when you sign up, your Tailscale network (tailnet) is automatically created based on your domain. Anyone in the same custom domain as you can automatically join the same tailnet. This makes a lot of sense at work: everyone who works at the same organization, with the same email domain, should be on the same network.
That restriction — tying your domain to your organization, is not always true — not everyone uses a custom domain at home. Sharing access to your secure network of devices has been challenging for users that sign in with Apple, or shared domains like Gmail.com and Outlook.com.
## Inviting users with the same email domain
In a tailnet with a custom domain, you can [invite teammates by email](/kb/1064/invite-team-members/) by going to the [Users page](https://login.tailscale.com/admin/users) of the admin console, clicking **Invite users**, and selecting **Invite team…**. You can also [share nodes](/kb/1084/sharing/) into and out of a tailnet.
## Inviting users with a different (or shared) email domain
With external invites, all tailnets can add users from any identity or email provider. For example, If you signed up for Tailscale with your Gmail account, you can now invite other Gmail users, or Apple, Microsoft or passkey users to your tailnet.
To invite users from a different domain to your tailnet, navigate to the [Users page](https://login.tailscale.com/admin/users) of the admin console, click “Invite users”, and generate a link to share. When the user clicks on the link and accepts the invite, they’ll be added to your tailnet.
A tailnet admin creates a unique invitation, tied to a specific role, which can be shared with the user you want to invite.
Users can accept an invite to a tailnet using any identity provider they choose, including passkeys, as shown here.
## Managing users in your tailnet
When you add an external user to your tailnet, your existing security controls will still work to keep your network safe. [User approval](/kb/1239/user-approval/) ensures that even after someone accepts an invitation, you’ll be able to confirm that it’s the right user. And it also gives you the opportunity to make sure the new user only has the access you give them in your [ACLs](/kb/1018/acls/).
We’ve also added a new control for Admins that lets you limit whether your users can join external tailnets. You might not want your users at YourCo™ accidentally accepting an invitation to the CompetitorCo™ tailnet. By default, only Admins can join external tailnets, but you can disable anyone from joining using the “Join external tailnets” option in the [Feature Previews](https://login.tailscale.com/admin/settings/general) in the admin console. You can also monitor when invitations are created and when users join a tailnet in the [audit log](/kb/1203/audit-logging/).
To learn more about inviting external users to your tailnet, [see the documentation](/kb/1271/invite-any-user/)**.**
Share
Author
Ben Lee-Cohen
Author
Ben Lee-Cohen
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