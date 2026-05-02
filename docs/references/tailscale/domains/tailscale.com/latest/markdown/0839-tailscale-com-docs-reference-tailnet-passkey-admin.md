Admin account with passkey login · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Admin account with passkey login
Last validated: Jan 5, 2026
We recommend that you proactively create an admin user that can log in with a passkey, so in the future that admin can log in if your single sign-on (SSO) [identity provider](/docs/integrations/identity) otherwise prevents an admin from logging in.
Let's say that your Tailscale network (known as a tailnet) has been working just fine, and unexpectedly your identity provider prevents you and anyone else in your tailnet from logging in by using the identity provider's authentication. You need a way to quickly recover your tailnet and start adding users to restore administrative control. If you previously set up an admin that can log in to your tailnet with a passkey, that admin can log in with their passkey and perform admin tasks for your tailnet.
As an alternative to having an admin with the ability to log in with a passkey, you could set up an admin with the ability to log in with an identity provider other than the identity provider that is preventing successful login to your tailnet.
## [How it works](#how-it-works)
Tailscale provides the ability to log in with a [passkey](/docs/integrations/identity/passkeys) for Tailscale authentication. That is, a user with the ability to log in with a passkey has no dependency on an SSO identity provider.
If a user can log in with a passkey and they have the role of [Admin](/docs/reference/user-roles#admin), they can invite additional users, approve devices, edit your [tailnet policy file](/docs/features/tailnet-policy-file), and perform other admin tasks as needed to recover your tailnet and restore connectivity.
If a user can log in with a passkey and they have the role of [IT admin](/docs/reference/user-roles#it-admin), they can create a user invite for a user that is granted the [Admin](/docs/reference/user-roles#admin), and then the invited user can log in with a passkey. The invited user has admin access to help recover your tailnet.
## [Creating an admin that can log in with a passkey](#creating-an-admin-that-can-log-in-with-a-passkey)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) to send a user invite.
1. Create a [user invite](/docs/features/sharing/how-to/invite-any-user#send-an-invite-link) with the [Admin](/docs/reference/user-roles#admin) or [IT admin](/docs/reference/user-roles#it-admin) role set for the invitee.
2. Instruct the invited user to open a private or incognito browser session, to prevent logging in with an existing account, and then log in with a [passkey](/docs/integrations/identity/passkeys). Alternatively, the invitee can log in by authenticating with an identity provider other than the identity provider that is preventing successful login to your tailnet.
The invited user can now administer your tailnet.
For more information about the different capabilities of the Admin and IT admin roles, refer to [Permissions managed by user roles](/docs/reference/user-roles#permission-matrix).
On this page
* [How it works](#how-it-works)
* [Creating an admin that can log in with a passkey](#creating-an-admin-that-can-log-in-with-a-passkey)
Scroll to top