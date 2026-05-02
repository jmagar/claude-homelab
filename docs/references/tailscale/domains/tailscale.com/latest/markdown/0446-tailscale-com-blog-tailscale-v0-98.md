Tailscale v0.98
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|May 05, 2020
# Tailscale v0.98
We’re happy to announce a new version of Tailscale. This minor
release fixes various connectivity issues and squashes some annoying
platform-specific bugs. Thanks to everyone who wrote in to report these issues!
A few highlights from [the complete changelog on GitHub](https://github.com/tailscale/tailscale/releases/tag/v0.98):
* **We now prefer IPv6 over IPv4 when sending encrypted packets between nodes**.
Note: this does not yet make IPv6 available inside the Tailscale network.
* **Switching between different networks is now smoother than ever**,
particularly between Wi-Fi and LTE, or when moving a sleeping laptop between
different networks.
* **Windows no longer resets active connections** when new nodes get added to
the network.
* We’ve adjusted MTU settings to **avoid packet loss for users on Google Cloud or DSL**.
This release only contains connectivity and stability fixes, so we recommend
everyone update to the latest version. You can see out-of-date nodes on
[the machines page of your admin console](https://login.tailscale.com/admin/machines).
You can [find update instructions for your platform](/kb/1067/update).
Share
Author
Ross Zurowski
Author
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