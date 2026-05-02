Kernel vs. netstack subnet routing & exit nodes · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Kernel vs. netstack subnet routing & exit nodes
Last validated: Jan 5, 2026
Tailscale can act as a subnet router or exit node in one of two
different modes:
1. **kernel mode** (root on Linux)
2. **userspace mode** (all non-Linux devices & non-root on Linux)
## [Kernel mode](#kernel-mode)
In kernel mode, the operating system itself forwards the packets.
Encrypted WireGuard UDP packets from peers arrive in the kernel, which
forwards them to Tailscale to decrypt. Tailscale then returns the
decrypted packets to the kernel, to be forwarded to the relevant
target.
This is the default mode of operation on Linux and was the first mode
that Tailscale supported.
In this mode, Tailscale doesn't rewrite the IP packets passing through
it. TCP streams are end-to-end from the origin, through the Tailscale
subnet router or exit node, and on to the final destination. All IP
protocols are supported.
## [Userspace ("netstack") mode](#userspace-netstack-mode)
Tailscale can also run subnet routers and exit nodes in
userspace, without the kernel forwarding packets. This happens when either:
1. `tailscaled` is run with `--tun=userspace-networking` (used when running as a regular, non-root user)
2. Tailscale is run on operating systems other than Linux, such as
FreeBSD, macOS, or Windows. This is the only way to run subnet
routers and exit nodes on these operating systems.
In userspace mode, Tailscale uses the
[gVisor](https://github.com/google/gvisor)
[`netstack`](https://github.com/inetaf/netstack) library, implementing
[networking in userspace](https://gvisor.dev/blog/2020/04/02/gvisor-networking-security).
In this mode, Tailscale terminates TCP and UDP connections
from the origin Tailscale peer and makes new outbound connections
to the target from the subnet router, stitching them together.
For ICMP pings, the Tailscale daemon does something similar to how it
relays TCP and UDP traffic. When a Tailscale subnet router or exit
node receives an ICMP ping request, it issues its own ping request to
the target (running the `ping` command if needed), replying to the
original request if its relayed one succeeds. This can add a small
amount of apparent ping latency; it's supported primarily so people
can test connectivity using familiar tools.
Other ICMP traffic is not relayed through Tailscale in userspace
mode. Similarly, any IP protocol other than TCP or UDP (such as SCTP)
is not supported in userspace mode.
## [Performance](#performance)
The kernel mode and userspace mode have different CPU and memory
characteristics.
In general, kernel mode (and thus only Linux, for now) should be used
for heavily used subnet routers, where "heavy" is some combination of
number of users, number of flows, bandwidth.
The userspace mode should be more than sufficient for smaller numbers
of users or low bandwidth. Even though Tailscale's userspace
subnet routing is not as optimized as the Linux kernel, it makes up for
it slightly in being able to avoid some context switches to the
kernel.
In any case, if you observe that `tailscaled` is using more CPU or memory than desired, consider switching to a kernel mode subnet router.
## [Summary](#summary)
|Feature|Kernel mode|Userspace mode|
|Routing type|Layer 3 (IP)|Layer 4 (UDP, TCP)|
|ICMP support|all|only ping (reconstructed)|
|TCP end-to-end|yes|no (reconstructed)|
|UDP end-to-end|yes|no (reconstructed)|
|SCTP and support|yes (all IP protocols)|no (only TCP, UDP)|
|Performance|best|acceptable|
|Maturity|stable|new (in Tailscale)|
On this page
* [Kernel mode](#kernel-mode)
* [Userspace ("netstack") mode](#userspace-netstack-mode)
* [Performance](#performance)
* [Summary](#summary)
Scroll to top