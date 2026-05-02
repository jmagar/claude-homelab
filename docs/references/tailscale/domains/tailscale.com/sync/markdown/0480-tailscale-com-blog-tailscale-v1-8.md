Tailscale v1.8: Enhanced Security, Split DNS & File Sharing
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|May 10, 2021
# Tailscale v1.8 is here!
The latest version of Tailscale is available today! Learn [how to update](https://tailscale.com/kb/1067/update/) or [read the full release notes on GitHub](https://github.com/tailscale/tailscale/releases/tag/v1.8.0).
The team has been hard at work making a lot of general improvements, enhanced capabilities, and some new alpha and beta features to play with. Let’s jump right in:
#### General Fixes and Improvements
We’ve added a long awaited `tailscale logout` command. We also now allow client access to exit node’s public IPs.
The `tailscale up` command now warns when options are being changed by omission. For example, if you used `tailscale up --advertise-route=192.168.0.0/24` and then `tailscale up --advertise-exit-node`, it would notice and warn that the `advertise-route` would be removed.
🐛 We’ve also added the tailscale bugreport subcommand to add a marker in your logs, along with an optional note. If you use this command shortly after a problem occurs (or ideally both before and after reproducing a problem) it will make it easier for [support@tailscale.com](mailto:support@tailscale.com) to find the details in your logs. Note that you still need to send an email or file a bug, the bugreport here only adds a known point in the logs so we can work to solve it with you more efficiently.
There was a large effort to improve and address DNS configuration issues and MagicDNS across all platforms. This leads nicely into our work on a new beta feature…
#### Coming Soon: Split DNS
Split DNS is a feature a lot of users with more complicated DNS configs have been asking for. This is the ability to set a DNS server that is only used for specific domain names. Split DNS enables better control on where DNS requests go, and allows users to apply more advanced policies.
Split DNS is complementary to MagicDNS. You’ll be able to create split DNS configs and this will be rolled out in the next week or so.
[Watch our demo video to see it in action →](https://youtu.be/-InBzRQWXwc)
#### Admin Console Updates
The admin console now has a [new **General** settings page, including feature previews](https://login.tailscale.com/admin/settings/general) letting admins to easily toggle features on and off. Use this page to opt your network into new Tailscale features.
From the feature preview, you can control which feature previews users on your network have access to.
#### Send Files via Tailscale
Easy, secure access to your files is important. A new alpha feature, [Taildrop](/kb/1106/taildrop), allows you to send files from your phone, computer, or tablet. The ability to send files to Tailscale connected devices requires both of them to be on 1.8, and they need to be your own devices. This feature is in alpha so major improvements are coming soon to the UX/UI, supported platforms, and more. To try it out, enable ‘Send Files’ in the [General](https://login.tailscale.com/admin/settings/general) page of the admin console.
[Watch this video](https://youtu.be/-InBzRQWXwc) to see it in action, and if you try it out please let us know!
We hope you enjoy this release. We’d love to hear any feedback you have about how we can make Tailscale better. Send us an email or reply to [@Tailscale on Twitter](https://twitter.com/tailscale).
That’s all for now — stay well!
Share
Author
Laura Franzese
Author
Laura Franzese
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