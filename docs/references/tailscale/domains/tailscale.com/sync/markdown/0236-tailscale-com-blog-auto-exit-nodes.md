Introducing Auto Exit Nodes: Smarter, Secure Internet Access with Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productMay 30, 2024
# Introducing auto exit nodes
Auto exit nodes are a new Tailscale feature to connect users to the nearest and most performant exit node to access the public internet. We know employees work from a variety of places: the office, co-working spaces, their favorite coffee shop, or airports and hotels while on the road. With auto exit nodes, employers can support that remote work by ensuring employees have the best available connection and aren't stuck looking for less secure workarounds.
### [Built to scale across your organization](#built-to-scale-across-your-organization)
Earlier this year, we released [regional routing](https://tailscale.com/kb/1115/high-availability#regional-routing), a feature that helps organizations scale app connectors and subnet routers globally by efficiently routing and balancing traffic across their available infrastructure. Now organizations can extend the power of regional routing to their exit nodes to provide a reliable and performance-driven experience regardless of the geo-location of the user.
Auto exit nodes help you scale secure internet access across your global workforce.### [A simplified workflow to secure outbound traffic](#a-simplified-workflow-to-secure-outbound-traffic)
Customers using MacOS, Windows, iOS, or Android (coming soon) clients can select a Tailscale-recommended exit node. For customers using Linux or CLI, input the `exit-node suggest` command, such as `tailscale exit-node suggest`, to select the currently recommended exit node. Recommendations are based on measured latency, and make will remain connected to an exit node until a new one is selected, or the auto exit node option is selected again.
### [Works with Mullvad](#works-with-mullvad)
Auto exit nodes can suggest your [Mullvad exit nodes](https://tailscale.com/kb/1258/mullvad-exit-nodes) as well. For tailnets subscribed to the Mullvad add-on, Tailscale will recommend exit nodes based on a combination of IP geolocation and the locations of the nearest Mullvad servers, taking into account colo-local Mullvad load balancing hints.
### [Secure the workforce with forced exit nodes](#secure-the-workforce-with-forced-exit-nodes)
Customers will soon be able to secure their entire workforce without user input using forced exit nodes, across every platform. Tailnets on the Enterprise and Premium plans will be able to configure their fleet to use Tailscale-recommended exit nodes, or to use a specific exit node across the fleet using [mobile device management (MDM) tools](https://tailscale.com/kb/1362/mdm), like JAMF, Microsoft Intune, Kandji, TinyMDM, and more. If a node becomes unavailable, Tailscale will automatically attempt to reconnect to the next available node.
### [Hybrid workforces, rejoice](#hybrid-workforces-rejoice)
The public internet harbors threats to any enterprise. Hybrid workforces are especially at risk, as employees and contractors are constantly accessing company resources like SaaS applications, partner portals, and more over questionable connections and networks. With auto exit nodes, Tailscale customers can hedge against active threats on untrusted networks by enabling or forcing their remote employees to use trusted egress points to access sensitive resources. Connections to the exit nodes are secured over direct or relayed WireGuard tunnels, regardless of the user’s local network.
If you have a global, hybrid, or remote workforce, set up exit nodes in multiple availability zones, across multiple clouds, in the branch offices, and more. Then, enable use of auto exit nodes using your MDM solution to intelligently route your employees to the closest available exit nodes without their manual input.
### [Get started today](#get-started-today)
Auto exit nodes are available to customers on our Starter, Premium, and Enterprise plans, or customers who have purchased the [Mullvad add-on](https://tailscale.com/kb/1258/mullvad-exit-nodes). To learn more about auto exit nodes, check out our [documentation](https://tailscale.com/kb/1392/auto-exit-nodes).
Share
Authors
Kabir Sikand
Jairo Camacho
Claire Wang
Adrian Dewhurst
Authors
Kabir Sikand
Jairo Camacho
Claire Wang
Adrian Dewhurst
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