What is STUN? · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# What is STUN?
Last validated: Aug 6, 2025
STUN lets a device to determine its public IP address and the [type of NAT](/docs/reference/device-connectivity#nat-types) it is behind, which is essential for establishing direct communication between devices on different private networks. STUN uses a client-server architecture model where the STUN client sends requests to a STUN server, which responds with the client's public IP address and port number.
Tailscale uses STUN (session traversal utilities for NAT) to enable direct communication between devices behind NAT firewalls or routers. The Tailscale client running on a device functions as the STUN client, and the [DERP](/docs/reference/derp-servers) relay servers function as the STUN servers.
The Tailscale client sends a STUN request to all the DERP relay servers, and the DERP relay servers note the public IP and port it received the request from. Tailscale uses this information to determine how to traverse the NAT the client is behind. You can get this information using the [`tailscale netcheck`](/docs/reference/tailscale-cli#netcheck) command.
To better understand how Tailscale connections work, read [How Tailscale works](/blog/how-tailscale-works).
Scroll to top