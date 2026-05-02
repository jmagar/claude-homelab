Troubleshoot TCP connection issues between two devices · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshoot TCP connection issues between two devices
Last validated: Mar 16, 2026
If your devices are visible in the admin console, and there is no [access rule](/docs/reference/syntax/policy-file#access-rules) blocking connections between the devices, check the level of connectivity with Tailscale's three types of `ping`:
* `ping 100.x.x.x` tells the OS to send an ICMP ping across the tailnet.
* `tailscale ping 100.x.x.x` tests whether the two `tailscaled` processes can communicate at all, and how (direct, or relayed).
* `tailscale ping --tsmp 100.x.x.x` sends a packet that goes one level further than `tailscale ping`, also going through the WireGuard level, but doesn't involve the host's networking stack.
Packet size limits can also cause connection problems on certain types of networks.
Tailscale uses a maximum transmission unit (MTU) of `1280`. If there are other interfaces which might send a packet larger than this, those packets might get dropped silently. These can be verified by using `tcpdump`.
To solve this, we can set the MTU at the LAN level to a lower value, or use MSS (maximum segment size) clamping.
Scroll to top