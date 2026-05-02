Using Tailscale with your Palo Alto Networks firewall · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Using Tailscale with your Palo Alto Networks firewall
Last validated: Sep 30, 2025
## [Types of connections](#types-of-connections)
Tailscale tries to connect your nodes directly peer-to-peer, and does so nearly all the time. Where this is not possible, Tailscale will use [DERP relay servers](/docs/reference/derp-servers) to forward traffic from one node to another. For more information about relays including how to determine whether relays are being used, refer to [Using Tailscale with your firewall](/docs/integrations/firewalls).
The default NAT translation type in [Palo Alto Networks](https://www.paloaltonetworks.com) firewall products uses a random source port in every connection, and makes finding a direct connection more challenging. Connections involving a Palo Alto Networks firewall using the default NAT type will be able to establish a direct connection only if the other end of the connection uses a predictable port number.
## [PAN-OS 11.1.x and later: Persistent Dynamic IP and Port](#pan-os-111x-and-later-persistent-dynamic-ip-and-port)
Ensure stability and performance by referring to the list of preferred releases for PAN-OS.
PAN-OS 11.1.1 contains the translation type for NAT policies, [Persistent Dynamic IP and Port](https://docs.paloaltonetworks.com/pan-os/10-1/pan-os-new-features/networking-features/persistent-nat-for-dipp). In this translation type, once a client has sent a packet with a particular source port, the same NAT translated port number will be used for all destinations. This lets Tailscale to predict the port number and establish a direct connection.
To use this translation type, go to **NAT Policy Rule**, select the **Translated Packet** tab, then select the **Translation Type** option **Persistent Dynamic IP and Port**.
### [Selective use of Persistent Dynamic IP and Port](#selective-use-of-persistent-dynamic-ip-and-port)
To incorporate Persistent Dynamic IP and Port into an existing set of NAT Policies, it may not be desirable to change all connections to use it. Use of persistent translation can be made conditional for just Tailscale's direct connectivity by configuring a Service for UDP source port 41641. We recommend setting the timeout to four minutes, more closely aligning with the idle timeout for direct connections.
The Service is added as a match criteria in the **NAT Policy Rule**, **Original Packet** tab.
For this to work, the `randomizeClientPort` setting described in [Using Tailscale with your firewall](/docs/integrations/firewalls), must not be used. Packets will be matched only if they use the default port 41641.
## [Earlier PAN-OS releases: Static IP](#earlier-pan-os-releases-static-ip)
With older PAN-OS releases and the Dynamic IP and Port translation type, every UDP stream will translate to a random UDP port. Opening a specific port will not allow traffic through, and Tailscale cannot predict what port number to try for a direct connection.
With older PAN-OS releases it is possible to use the Static IP NAT Policy to enable one device within the protected zone to make direct connections. One might choose a subnet router or other high-traffic node to optimize. In the PAN-OS software create a NAT policy rule with **Translation Type** set to **Static IP**, instead of the default setting **Dynamic IP And Port**. This helps Tailscale figure out how to get packets through the NAT and establish direct connections.
On this page
* [Types of connections](#types-of-connections)
* [PAN-OS 11.1.x and later: Persistent Dynamic IP and Port](#pan-os-111x-and-later-persistent-dynamic-ip-and-port)
* [Selective use of Persistent Dynamic IP and Port](#selective-use-of-persistent-dynamic-ip-and-port)
* [Earlier PAN-OS releases: Static IP](#earlier-pan-os-releases-static-ip)
Scroll to top