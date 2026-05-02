The long wondrous life of a Tailscale packet
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|May 20, 2021
# The long wondrous life of a Tailscale packet
#### Birth
A friend wants to show you a prototype of the new sloth webcam website they’re building, so they [share their device](https://tailscale.com/kb/1084/sharing) with you using Tailscale. You accept.
Grabbing their IP address from the Tailscale GUI,
you visit `http://100.101.102.103/` in your browser.
(Not https. It’s OK! We’ll come back to that.)
The browser asks the kernel for a TCP connection to `100.101.102.103`.
The kernel [creates a TCP SYN packet](https://en.wikipedia.org/wiki/Transmission_Control_Protocol#Connection_establishment) addressed to `100.101.102.103`.
Our packet is born.
#### Infancy
The kernel needs to send our packet to `100.101.102.103`.
Enter the kernel’s [routing table](https://en.wikipedia.org/wiki/Routing_table).
The kernel manages network interfaces.
A network interface is a way to send and receive network traffic.
Your Wi-Fi card is a network interface.
So are the seven ethernet cards you’ve installed.
So is the loopback interface, which delivers packets to other processes running on the same device.
To decide which network interface should receive a packet, the kernel maintains a routing table.
On Linux, you can see the routing table by running `ip route`.
It’s based primarily on destination IP address, with a default route to use when nothing else matches.
Here’s a sample `ip route` run:
```
`$ ip route
default via 192.168.1.254 dev eno1
192.168.1.0/24 dev eno1 proto kernel scope link src 192.168.1.190
`
```
Any IP address with the same leading 24 bits as `192.168.1.0`, that is, `192.168.1.xxx`, can be reached via the `eno1` network interface.
And for all other destination IPs, the [default gateway](https://en.wikipedia.org/wiki/Default_gateway) is `192.168.1.254`, again reachable via `eno1`.
When you installed Tailscale, it added a [TUN/TAP](https://en.wikipedia.org/wiki/TUN/TAP) network interface, usually called `tailscale0`.
This is a *software* network interface: sending a packet over a TUN/TAP interface consists
of handing it off to a local process, in this case Tailscale.
Tailscale also added a route for `100.101.102.103` and specified that packets
destined for `100.101.102.103` should go to the `tailscale0` network interface.
Tailscale uses routing table 52 for its routes instead of the main table. Here’s part of a sample `ip route` run that shows them:
```
`$ ip route show table 52
100.101.102.103 dev tailscale0 scope link
[many more]
100.102.4.52 dev tailscale0 scope link
`
```
Since our packet has destination `100.101.102.103`, the kernel routes it to the `tailscale0` interface
and it arrives at the Tailscale process. The details for various
operating systems differ, but the basic idea is the same.
Before we follow our packet into the Tailscale process, let’s discuss routing a bit more.
Note that Tailscale did not set itself as the default route.
Traffic to regular websites thus does not flow through Tailscale.
This is different from *privacy VPNs* that route all your network traffic.
When using a privacy VPN, all your network traffic gets sent to a computer in the cloud that they operate,
that computer makes network requests on your behalf, usually alongside
many other peoples’ network requests, and sends the results back to you.
As of Tailscale 1.6, you can choose to [request that Tailscale route all your traffic](https://tailscale.com/kb/1103/exit-nodes/).
However, it can only be routed to a different Tailscale device that you operate and control.
Tailscale-owned servers never see your unencrypted traffic, ever.
Not only did Tailscale not set itself as the default route, Tailscale only set itself as the route for the specific, individual IP addresses in your Tailscale network.
This is different from *corporate VPNs* that route all traffic for an entire IP range, usually internal corporate IP addresses that are unreachable from the outside world.
When using a corporate VPN, all such traffic destined for that an IP range gets sent to (and via) a device that has access to those IP addresses.
This is called subnet routing. Tailscale also supports [subnet routing](https://tailscale.com/kb/1019/subnets), although as above, the device doing the subnet routing is a device that you operate and control.
#### Childhood
Our packet has arrived via TUN/TAP at the Tailscale process running on your device. Time for encryption!
This is why it’s OK that your friend shared their service with you over http instead of https.
All traffic is fully encrypted at the IP layer, before it ever leaves your device.
Tailscale is built atop [WireGuard®](https://www.wireguard.com/), so our packet now enters the WireGuard implementation.
From this moment, Tailscale ceases to have any understanding of the contents of the packet
until it is safely decrypted on your friend’s device.
Alas, there’s some bad news for our packet. It’s going to be stuck for a little while.
#### Adolescence/purgatory
A [full description of the WireGuard protocol](https://www.wireguard.com/papers/wireguard.pdf) is way outside the scope of this blog post, but we’ll hit a few highlights.
Before WireGuard can encrypt our packet, it must have a shared key with the destination device.
The shared key will be derived from public/private keypairs on each device.
Those keypairs are generated locally on each device.
The private half never leaves the device.
The public half is uploaded to the Tailscale control server,
which then distributes it to the other devices your Tailscale network.
With those keypairs in place, to obtain a shared key, WireGuard needs to do a handshake.
To do a handshake, WireGuard sends a handshake packet.
However, Tailscale wraps WireGuard, so that handshake packet doesn’t go straight to the kernel for dispatch.
Instead, it goes to the Tailscale process to be sent to your friend’s device.
Sending a packet to a peer is hard if neither of you has a static public IP address.
At this point, Tailscale’s NAT traversal kicks in.
We have a [detailed blog post](https://tailscale.com/blog/how-nat-traversal-works/) about how this all works, so we’ll skip the details here.
That handshake packet works its way, either directly via UDP or indirectly via a DERP relay, to your friend’s device.
It’s worth re-iterating that this handshake packet is not sensitive and not secret.
It is designed by WireGuard to be sent over the public internet, so it doesn’t matter for security purposes
whether it passes through a Tailscale-operated DERP server on the way.
Your friend’s device receives the handshake packet and generates an appropriate handshake response packet.
The response packet works its way back through all the layers and is delivered via Tailscale to WireGuard on your device.
(We’ll see more details later about what happens on the receiving end.)
#### Adulthood
One handshake round trip later, we have a shared key.
Our packet is ready for encryption.
WireGuard uses the shared key to encrypt and sign the packet.
Our packet is now an encrypted payload in an envelope packet.
The envelope packet heads to the Tailscale process to be sent.
Tailscale’s NAT traversal has succeeded in finding a direct communication path.
Your friend’s device is reachable at `1.2.3.4`, and Tailscale is listening on port `5678` there,
so that’s the destination IP address and port of the encrypted packet.
Tailscale asks the kernel to send the envelope packet over UDP to `1.2.3.4:5678`.
The kernel consults its routing table and hands the envelope packet to the Wi-Fi card.
Then the internet adventure happens. Routers, buried fiber, undersea cables, data centers, mobile radios.
The envelope UDP packet arrives at your friend’s device.
The kernel checks which process is listening on port `5678`, the destination port of this inbound envelope packet.
Answer: Tailscale. The kernel delivers the packet to Tailscale.
Tailscale hands the envelope packet to WireGuard.
WireGuard uses the shared key from the earlier handshake to verify and decrypt the envelope packet.
Our payload is now a packet again.
WireGuard hands that packet back to Tailscale.
Next, Tailscale checks whether that packet should be permitted.
If your friend enabled [Shields Up](https://tailscale.com/kb/1072/client-preferences), which blocks all incoming Tailscale connections, Tailscale will drop that packet on the floor.
Or if there’s a Tailscale [ACL](https://tailscale.com/kb/1018/acls) that prevents your devices from communicating, Tailscale will drop the packet.
Neither of those is the case; our packet makes it through the filter.
Then the Tailscale process, acting as the `tailscale0` network interface, hands our packet (back) to the kernel.
#### Retirement
The kernel has received our packet as an inbound network packet, from the Tailscale TUN/TAP software network interface.
It’s a TCP SYN packet, so the kernel formulates a TCP SYN+ACK to reply with.
Our packet has done its job. The kernel gently sets it out in the green sunny fields of the desktop wallpaper.
Later, when more TCP packets come in the same way from `tailscale0`, the kernel will look at the destination port
of the decrypted packet: `80`, same as it was before encryption.
Listening on port `80` is your friend’s server.
Your friend’s server will be unaware of how that packet got there:
kernel, Tailscale, WireGuard, Tailscale, kernel, NAT traversal, kernel, Tailscale, WireGuard, Tailscale, kernel.
It’ll look like just another packet. You will be rewarded by photos of sloths.
Share
Author
Josh Bleecher Snyder
Author
Josh Bleecher Snyder
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