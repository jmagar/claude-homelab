Tailscale Auto-Updates: Smarter Updates with Activity Awareness
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productFebruary 14, 2024
# Auto-Updates: Smarter Controls to Avoid Disruptions
Tailscale auto-updates are now Generally Available (GA), with a number of usability and control improvements. Today's update builds on our [previously announced beta release](https://tailscale.com/blog/auto-update-beta).
## [Smarter scheduling](#smarter-scheduling)
Auto-updates are kicked off on connected devices as soon as we deem a new release to be stable enough, typically a few days after the release is built. But this can happen while you’re in the middle of something important, like a video call or debugging a production issue over SSH. It can be really disruptive to break your connectivity to the tailnet for a few seconds while Tailscale updates itself.
With the GA, auto-updates take into account the level of activity on your devices. If your device is transferring a lot of traffic, or has any open SSH connections, we will delay the update until the activity dies down. On devices that always send a lot of traffic, like servers, the update will still kick in after about a day, so there won’t be any stragglers.
## [Admin console](#admin-console)
The Machines page in the admin console is now more useful, with filters like:
* [Update available](https://login.tailscale.com/admin/machines?q=version:update-available), which shows you all nodes that are not running the latest version
* [Security update available](https://login.tailscale.com/admin/machines?q=version:security-update-available), which can help you prioritize which nodes to update first
* Auto-update [disabled](https://login.tailscale.com/admin/machines?q=auto-update:disabled) and [enabled](https://login.tailscale.com/admin/machines?q=auto-update:enabled), which can help you find nodes that could be using auto-updates
For [outdated nodes](https://login.tailscale.com/admin/machines?q=auto-update:enabled+version:update-available+lastseen:connected), you can also manually trigger an update (before the normal auto-update process does it) by hovering over the update icon. There are a few safety precautions around this, so to trigger an update from the admin console:
* You must be logged in as an [Owner, Admin or IT Admin](https://tailscale.com/kb/1138/user-roles) of the tailnet
* The node must have [auto-updates enabled](https://tailscale.com/kb/1067/update#auto-updates)
* The node must be online
Your browser does not support the video tag.
And if you don’t want to remember to opt-in each node into auto-updates (and don’t use [an MDM solution](https://tailscale.com/kb/integrations/mdm)), you can now do it by default for all new nodes. On the [Device management](https://login.tailscale.com/admin/settings/device-management) page, toggle the **Auto-update Tailscale** setting and all new nodes will enable auto-updates when they first register. This setting is off by default, and also does not affect existing nodes in tailnets that predate this GA, to minimize surprises. This setting does not strictly enforce auto-updates for everyone and individual nodes can always opt-out of auto-updates.
## [What’s next](#whats-next)
As of this release, we’re going to make auto-updates on-by-default for new tailnets. We consider this to be a good security practice, but tailnet admins can always switch to off-by-default on the [Device management](https://login.tailscale.com/admin/settings/device-management) page. Our goal is to make updating Tailscale smooth and painless!
Share
Authors
Andrew Lytvynov
Chris Palmer
Authors
Andrew Lytvynov
Chris Palmer
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