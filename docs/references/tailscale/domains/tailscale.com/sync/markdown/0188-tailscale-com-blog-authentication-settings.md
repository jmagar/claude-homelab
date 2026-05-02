Enable device approval and set key expiry in Tailscale admin console
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 12, 2021
# Enable device approval and set key expiry in the admin console
We’ve made a few settings easier for you to manage [in the admin console](https://login.tailscale.com/admin/settings/authentication): device approval and key expiry.
You can enable [device approval](https://tailscale.com/kb/1099/device-approval/) in the admin console. With device approval, every new device you add to your network needs to be approved by an admin before it can join your network.
You can also set [key expiry](https://tailscale.com/kb/1028/key-expiry/) in the admin console. Devices you add to your network will periodically expire their [node keys](https://tailscale.com/blog/tailscale-key-management/#node-keys) and force users to reauthenticate, to ensure the devices are still meant to be on your network. (You can [disable key expiry](https://tailscale.com/kb/1028/key-expiry/#disabling-key-expiry) for certain types of devices where this is inconvenient, like servers.) By default, keys expire every 180 days. We’d like to shorten the default expiry time in the future, but for now, in the admin console, you can set the key expiry period to as few as 3 days and as many as 180 days.
Share
Authors
Sonia Appasamy
Ross Zurowski
Authors
Sonia Appasamy
Ross Zurowski
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