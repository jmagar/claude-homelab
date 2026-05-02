Admin console session timeout · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Admin console session timeout
Last validated: Jan 5, 2026
Admin console session timeout is available for [all plans](/pricing).
By default, Tailscale [admin console](https://login.tailscale.com/admin) sessions [expire 30 days after](/docs/reference/admin-console-session-expiry) the initial login. [Owners and Admins](/docs/reference/user-roles#roles) can configure the session timeout to change the period of inactivity that must occur before Tailscale expires a session for members of your tailnet. This setting applies to all members of your tailnet, including [Owners and Admins](/docs/reference/user-roles#roles).
Admin console session timeout does not affect user [node key expiry](/docs/features/access-control/key-expiry).
## [Enable session timeout](#enable-session-timeout)
1. Open the [User management](https://login.tailscale.com/admin/settings/user-management) page of the admin console.
2. Select a timeout value in **Set an inactivity period** under **Admin Console Session Timeout**.
The timeout can be set to between 5 minutes and 30 days. Only Owners, Admins, and IT Admins of the tailnet can configure the timeout.
## [Disable session timeout](#disable-session-timeout)
1. Open the [User management](https://login.tailscale.com/admin/settings/user-management) page of the admin console.
2. Select **Edit** under **Admin Console Session Timeout**.
3. Select **Disable**.
On this page
* [Enable session timeout](#enable-session-timeout)
* [Disable session timeout](#disable-session-timeout)
Scroll to top