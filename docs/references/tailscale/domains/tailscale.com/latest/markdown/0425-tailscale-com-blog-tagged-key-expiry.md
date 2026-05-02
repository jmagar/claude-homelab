Tagged Nodes No Longer Require Key Renewal for Easier Server Management
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|March 10, 2022
# Tagged nodes no longer need key renewal, which means it's easier than ever to manage servers
Devices you add to your Tailscale network will periodically expire their [node keys](/blog/tailscale-key-management/#node-keys) and force users to reauthenticate, to ensure the devices are still meant to be on your network.
In Tailscale, [ACL tags](/kb/1068/acl-tags/) provide a way to assign an identity to a device, which replaces the prior user approval on that device. So, node key expiry might be surprising behavior for tagged devices, such as servers, which do not have a user associated with them.
**Starting today, tagged devices will have key expiry disabled by default.**
### What’s changing?
* There is no change for existing tagged devices.
* When you authenticate a device and include a tag, such as when you [use an auth key with an ACL tag](/kb/1068/acl-tags/#using-an-acl-tag-with-an-auth-key), the device’s key expiry will be disabled. This also applies if you re-authenticate an existing tagged node.
* If you change the tags on the device via the admin console, CLI, or API, the device’s key expiry will not change. That is, if it is enabled, it stays enabled; and if it is disabled, it stays disabled.
You can also enable or disable key expiry on a device [via the admin console](/kb/1028/key-expiry/) and [via API](https://github.com/tailscale/tailscale/blob/main/api.md#device-key-post).
### Setting up a server on Tailscale, the easy way
If you’re managing your servers on Tailscale, this is now even easier, thanks to several features we’ve launched in the past few months:
1. Create a new [ACL tag](/kb/1068/acl-tags/) in your tailnet, and write an [ACL](/kb/1018/acls/) to give the tag the permissions you want.
* If you’re provisioning a subnet router or exit node, make the tag an [auto approver](/kb/1337/acl-syntax#auto-approvers-autoapprovers).
* Generate an [auth key](/kb/1085/auth-keys/) for authenticating your server. Since you’re authenticating a shared device, use a tagged key.
* If you’re authenticating more than one server, use a reusable auth key.
* If you’re authenticating ephemeral workloads like containers or functions, use an ephemeral key.
* If your tailnet has [device approval](/kb/1099/device-approval/) enabled, and you only intend to use that for end-user devices, use a pre-authorized auth key.
* Authenticate the server using the auth key you created, via CLI.
The server will automatically be added to your tailnet (with the device and routes approved, if applicable), with the right permissions, and without requiring you to re-authenticate it to keep it connected. Easy to set up and easy to maintain.
Happy automation!
Share
Author
Maisem Ali
Author
Maisem Ali
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