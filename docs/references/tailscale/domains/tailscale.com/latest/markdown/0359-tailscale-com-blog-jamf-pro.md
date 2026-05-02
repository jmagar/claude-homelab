Jamf Pro + Tailscale, for better Apple device management
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productJanuary 20, 2025
# Better Apple device management with Jamf Pro, integrated with Tailscale
For teams managing fleets of Apple devices, [Jamf Pro](https://www.jamf.com/lp/jamf-pro/) is well-known as a leading mobile device management (MDM) solution. Those teams can now count on an integration with Tailscale, generally available today, making it simpler and more straightforward to install and configure Tailscale on those devices and to keep the networking access requirements under control. To configure Jamf Pro on your Enterprise tailnet, [check out our docs and get started today](https://tailscale.com/kb/1409/jamf-pro).
We expect this integration will save IT administrators and their users lots of time and headaches by allowing Tailscale to be installed across a fleet of macOS, iPadOS, and iOS devices in a standardized and pre-configured way. With Tailscale and Jamf Pro installed, admins can tap into the security promises offered by both services, through a single configuration mechanism.
This integration works by tying into Tailscale’s existing [device posture management](https://tailscale.com/kb/1288/device-posture) features, which allow administrators to condition access to tailnet devices and services on a collection of specific rules. Out of the box, our device posture tools have access to a significant but limited set of properties about the Tailscale client and the device it’s running on.
Where the device posture management really shines is when it’s combined with tools like Jamf Pro, which provide access to even more robust signals about the device. For example, an admin might want to specify that only devices with the macOS firewall enabled are allowed to connect to sensitive development resources. An admin can introduce a rule in the Tailscale ACLs checking that `jamfPro:firewallEnabled` is `true`. As a result, the rules can be maintained and logged in the Tailscale ACLs, and enforced at the network level for even tighter security.
In addition to matching tailnet devices against Jamf Pro devices, Tailscale’s Jamf Pro integration gives admins access to the following device properties, updated regularly:
* `jamfPro:remoteManaged`: Whether the device is managed by Jamf Pro
* `jamfPro:supervised`: Whether the device is supervised by Jamf Pro
* `jamfPro:firewallEnabled`: Whether the macOS firewall is enabled
* `jamfPro:fileVaultStatus`: Status of FileVault disk encryption
* `jamfPro:SIPEnabled`: Whether macOS System Integrity Protection is enabled
To read more about these device properties and how they can be used, check out [our Jamf Pro documentation](https://tailscale.com/kb/1409/jamf-pro).
For teams already using Tailscale for networking and Jamf Pro as their MDM, this integration combines two layers of security into one easy package. Teams can more readily enforce device and user authentication on each connection, making the ideals of Zero-Trust security more readily achievable.
The Jamf Pro device posture integration is available for [the Enterprise plan](https://tailscale.com/pricing).
Share
Author
Parker Higgins
Author
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