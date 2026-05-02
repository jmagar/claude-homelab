Stay Informed with Webhooks: Instant Notifications on Tailnet Events
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 26, 2022
# Get notifications for events on your tailnet with webhooks
If you’re managing and using Tailscale along with several other users, it’s hard to keep track of what changes get made, even with [audit logs](/kb/1203/audit-logging). For example, another admin might make an update, or an event that you need to react to could occur — such as a node needing [approval](/kb/1099/device-approval).
Webhooks are now available so you can get notified when common tailnet management and misconfiguration events occur, such as:
* A new node joins your tailnet
* A new node needs approval
* A new node has been approved
* Your tailnet policy file was updated
* You have a subnet router or exit node with IP forwarding disabled
You can configure webhooks to be sent to any HTTPS endpoint — for example, receiving notifications of changes to your ACLs in a Slack channel. Webhooks are owned by the tailnet, so any webhooks set up by an admin will continue to work even if that admin leaves the company.
To set up a webhook, open the [**Webhooks**](https://login.tailscale.com/admin/settings/webhooks) page of the admin console. [Read the documentation](/kb/1213/webhooks) to learn more about how to set up webhooks.
Share
Authors
Laura Florea
Sonia Appasamy
Authors
Laura Florea
Sonia Appasamy
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