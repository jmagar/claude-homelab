Tailscale 4via6 — Simple, secure network connectivity that scales
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productMay 12, 2025
# Tailscale 4via6 — Connect Edge Deployments at Scale
Tailscale lets you connect anything to anything — securely. But real-world deployments often come with messy networks: overlapping IPs, double NAT, and strict firewalls.
In this post, we’re highlighting 4via6 subnet routing — a powerful way to extend Tailscale’s mesh into complex edge deployments. It’s ideal for scenarios where traditional VPNs struggle, like fleets of robots, edge devices, or numerous VPCs.
When deploying software or hardware solutions to the edge or into customer networks, you’ve probably experienced these connectivity problems: multiple layers of NAT without an available public IP, restrictive network policies blocking open ports, fixed CIDR ranges, and a constantly moving list of unknown unknowns.
To tackle these challenges, Tailscale users typically take one of three different approaches:
1. Consolidating everything into a single machine or application to reduce the required network permissions.
2. Deploying a dedicated sub-network consisting of a router and any devices.
3. Side-stepping existing network infrastructure entirely with a dedicated cellular or satellite-connected network.
We built Tailscale 4via6 subnet routing for the many Tailscale users with complex deployments, where consolidating everything into a single machine simply isn’t possible. By natively supporting the network-in-a-network approaches of the second or third options, 4via6 makes it easier to manage and connect deployed infrastructure like cameras, sensors, robots, or local servers for AI inference and data processing.
### [Site-to-site VPNs weren’t built to connect edge infrastructure](#site-to-site-vpns-werent-built-to-connect-edge-infrastructure)
When you need to connect several networks, your first thought might be a site-to-site VPN. However, site-to-site VPNs were designed to connect entire offices or branches — they’re built on the assumption of no CIDR range overlaps, long-lived connections, and public IPs. In most deployment scenarios involving customer sites, it’s unlikely that even one of these assumptions holds true, much less all three.
### [4via6 subnet routing provides an alternative approach](#4via6-subnet-routing-provides-an-alternative-approach)
The new [4via6 subnet routing](https://tailscale.com/kb/1201/4via6-subnets) option enables seamless connections between hundreds or thousands of identical networks, without the need to manage IPs, CIDR ranges, or ports. Typically, an ideal setup needs to fulfill these requirements:
* Isolate each customer from one another.
* Connect all of a single customer’s deployments.
* Grant secure remote access to support teams and telemetry servers.
Tailscale 4via6 subnet routing provides a single solution for all of these that works on any internet connection including: LTE, 5G, or satellite (Starlink). Add in Tailscale’s fine-grained ACLs, and it’s possible to connect customer deployments regardless of their network configuration.
One common use case for 4via6 is to provide simple connectivity for robots and autonomous vehicles no matter where they happen to be deployed. While it might be tempting to think of a robot as a singular machine, it’s quite common for robots to, in reality, resemble a complete network. Each robot can contain a multitude of IP addressable sensors, cameras, servers and controllers, but management & connectivity can often still be tricky as many of these devices are not able to run additional software due to legacy or compatibility issues.
In addition, it’s also advantageous to make each network exactly the same such that the front camera can be found at `10.10.0.2`, the rear camera at `10.10.0.3`, and so on. None of this would be feasible at even a minor scale with a traditional site-to-site VPN setup without custom tooling and networking tradeoffs.
“Tailscale and 4via6 give us secure, low-latency access to our global fleet of autonomous robots — and critically, they make it easy to include embedded networked devices in the same mesh. That flexibility lets us deliver real-time, AI-powered insights to warehouse operators without the overhead of complex VPN or SD-WAN setups.” — Matthew MacLeod, VP Software Systems @ Dexory
### [An easy whole-network access pattern](#an-easy-whole-network-access-pattern)
With 4via6, each connected network receives a unique identifier (up to 65,536 of them), and each device on the network can be accessed directly using a MagicDNS name. Devices receive names formatted as `10-1-1-0via7` where `10-1-1-0` is that device’s local network IPv4 address and `7` is the network identifier number. Alternatively, devices can be accessed using their new IPv6 address in the format of:
While 4via6 is most commonly used to connect physical deployments, its applications extend into cloud deployments. It supports linking VPCs across environments, regions, or even cloud providers with overlapping CIDR ranges. This makes it easy to connect a hosted control plane with a data plane in a customer’s cloud infrastructure, or use the same IP range for testing and production environments for better reproducibility of tests during development.
### [Connect your deployments with Tailscale today](#connect-your-deployments-with-tailscale-today)
[4via6 subnet routers](https://tailscale.com/kb/1201/4via6-subnets) are available [on all plans](https://tailscale.com/pricing) and can be used with additional security monitoring features on our Premium and Enterprise plans.
Share
Author
Remy Guercio
Author
Remy Guercio
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