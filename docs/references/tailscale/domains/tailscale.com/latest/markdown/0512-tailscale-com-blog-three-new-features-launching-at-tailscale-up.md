Three new features launching at Tailscale Up
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|May 31, 2023
# Three new features launching at Tailscale Up
Today we’re kicking off [Tailscale Up](https://tailscale.dev/up), our first ever community conference. To celebrate the occasion, we’re announcing new features that address some of the top community feature requests — and we hope will excite you. We’ll be rolling out more information about these announcements over the next week, but for now we’ve got some stuff that we can’t wait to share.
## Invite external users to your tailnet
Starting today, you can invite other users to your tailnet, even if they’re not part of the same domain as you are. From the [Users page](https://login.tailscale.com/admin/users) of the admin console, click the Invite button to generate an invite link that you can share with anyone to join your tailnet.
For people using Tailscale at home, this new feature will enable some uses for families or roommates that want to share a tailnet but don’t want to use GitHub or build out a full identity solution with a custom domain. For users on one of our paid plans — say, developers using Tailscale at work — that means you can add contractors to your tailnet without provisioning them a new email address.
As always, you can [check out the documentation](/kb/1271/invite-links/) for more info on this beta feature. One limitation to be aware of: for now, it’s not possible to share a tailnet with a user who logs in with a GitHub profile. Use an email address (even a Gmail address, now!) or a [GitHub Organization](https://tailscale.dev/blog/multi-user-tailnet-github-orgs).
## Passkeys for login
Another important identity feature now in beta: you can now use a passkey to authenticate to your Tailscale account. Passkeys, in case you haven’t seen them yet, are a [cryptographic mechanism for logins](https://fidoalliance.org/passkeys/) that aims to replace passwords with a system that’s more secure and resistant to phishing. On Apple devices, passkeys can be tied to your keychain, so you can use them via Touch ID or Face ID.
Tailscale isn’t the first service to roll out support for passkeys, but they are still pretty cutting edge. A caveat for the time being: you cannot create a tailnet with a passkey unless you’ve been invited to an existing tailnet. You can read [our documentation on the feature](/kb/1269/passkeys/) for more background.
## VS Code extension
Developers love Tailscale, and developers love VS Code. So we thought: why not make a developer tool with [two great tastes that taste great together](https://www.youtube.com/watch?v=DJLDF6qZUX0)? Install the new Tailscale extension, and you can interact with your tailnet from directly inside your VS Code environment.
That means you can share a local server with other devices on your tailnet or the wider internet using [Funnel](/kb/1223/tailscale-funnel/) with just a few clicks. We’ve been using this internally, and it’s already proven invaluable for web development and receiving webhooks. [Check out our documentation](/kb/1265/vscode-extension/) and [install the extension from the VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=Tailscale.vscode-tailscale) today.
We’ll be sharing more information about these new features — and about what’s happening at Tailscale Up — over the next few days. Stay tuned to this blog, and our community blog at [tailscale.dev](https://tailscale.dev), for more guides and deep dives.
Share
Authors
David Crawshaw
Parker Higgins
Authors
David Crawshaw
Parker Higgins
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