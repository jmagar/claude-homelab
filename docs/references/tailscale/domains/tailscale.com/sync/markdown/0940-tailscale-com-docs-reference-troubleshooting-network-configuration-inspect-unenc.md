Unencrypted packet examination · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Unencrypted packet examination
Last validated: Mar 26, 2026
It is sometimes useful to be able to inspect the unencrypted packets inside the WireGuard tunnel using tools like Wireshark. This can only be done from one of the devices at the endpoints of the tunnel. Packets captured while in transit cannot be decrypted.
From the devices at the endpoints of the tunnel, there are several ways to accomplish this:
1. `tailscale debug capture -o /path/to/capture.pcap`
2. Run Wireshark on the TUN device (this does not work in userspace mode).
With `tailscale debug capture`, the `-o /path/to/capture.pcap` argument specifies the name of a file to write packets to. If omitted, Tailscale will attempt to start Wireshark locally for a live capture. These `pcap` files are captured with a header of metadata about the tailnet. To inspect them in Wireshark, you must install a [Lua dissector](https://raw.githubusercontent.com/tailscale/tailscale/refs/heads/main/feature/capture/dissector/ts-dissector.lua).
To capture from a TUN device, you need to start Wireshark and have it capture from:
1. `tailscale0` for Linux and Windows systems.
2. `utun#` on macOS, where the number can vary. Wireshark will show a list of interfaces, and one of the `utun` interfaces should show some traffic.
Wireshark 3.65 or later support capturing Wireshark frames from TUN devices.
Scroll to top