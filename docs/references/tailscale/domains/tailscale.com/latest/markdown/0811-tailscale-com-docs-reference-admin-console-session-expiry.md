Do admin console sessions expire? · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Do admin console sessions expire?
Last validated: Sep 30, 2025
Yes.
A browser session that is accessing the Tailscale [admin console](https://login.tailscale.com/admin) has an expiry of 30 days. This expiry is unrelated to any key expiry. If your browser session is open to the admin console for more than 30 days, you will need to refresh your browser session or open a new browser session to continue engaging with the admin console.
You cannot configure the 30-day expiry for an admin console session. However, you can [configure the session to timeout](/docs/account/admin-console-session-timeout) after a period of inactivity.
Scroll to top