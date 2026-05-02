Improving NAT traversal, part 2: challenges in cloud environments
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsOctober 21, 2025
# NAT traversal improvements, pt. 2: Challenges in cloud environments
This is the second in a series of posts about how Tailscale makes secure connections between devices, and the challenges on the path between them. Read on for insights into connecting into one of the trickiest space around, commercial clouds. And stay tuned for future posts about where direct, secure networking might be headed.
*See [the first post in this series](https://tailscale.com/blog/nat-traversal-improvements-pt-1) for some context on how certain NATs make direct connections tricky, and how Tailscale has worked to improve the landscape.*
One domain where [NAT traversal](https://tailscale.com/blog/how-nat-traversal-works) remains especially challenging is the public cloud. Amazon Web Services (AWS), Microsoft Azure, Google Cloud, and other large-scale clouds provide NAT solutions for instances in private subnets—and these tend to be the hardest type of NAT to work through, from a peer-to-peer perspective.
Cloud NAT gateways are typically designed with goals like scalability, security isolation, and simplicity for outbound access. They are not particularly tailored for inbound peer connectivity or hole punching.
What follows is a rundown of the cloud NAT issues we face now, how Tailscale and other technologies can work with (or sometimes around) them, and some proposed changes, by us and cloud providers, that could appease all sides, while improving and securing everybody’s platform.
## [Cloud NAT gateways: symmetric by design](#cloud-nat-gateways-symmetric-by-design)
Cloud NAT gateways are designed for scale and reliability of outbound connections, not for peer-to-peer. That makes them highly [symmetric](<https://tailscale.com/blog/kubernetes-direct-connections#:~:text=The biggest barrier to getting,port to create direct connections>) by default, which is about the worst case for NAT traversal. A brief summary of the big three:
### [[AWS NAT Gateway](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html)](#aws-nat-gateway)
Always symmetric. Each connection gets a randomized source port, per-destination. Scales well for outbound traffic, terrible for peer-to-peer. If both peers are behind AWS NAT, direct tunnels almost never form, so [DERP](https://tailscale.com/kb/1232/derp-servers) is the fallback.
### [[Azure NAT Gateway](https://azure.microsoft.com/en-us/products/azure-nat-gateway)](#azure-nat-gateway)
Same story: symmetric by default, randomized port assignment. Azure emphasizes recycling and scaling, not stable mappings. Some limited reuse exists for the same destination IP, but that doesn’t help Tailscale peers.
### [[Google Cloud NAT](https://cloud.google.com/nat/docs/overview)](#google-cloud-nat)
Default is also symmetric, but Google uniquely offers an *Endpoint-Independent Mapping* option if you configure static port allocation. That makes it more friendly for peer-to-peer (P2P), though at the cost of connection scale. By default, though, GCP behaves like AWS and Azure.
## [Options for better NAT behavior on clouds](#options-for-better-nat-behavior-on-clouds)
If you have servers or containers in the cloud and you want to maximize peer-to-peer performance with Tailscale (or any similar P2P system), what can you do? There are a few approaches:
### [Give the instance a public ip (and open the firewall)](#give-the-instance-a-public-ip-and-open-the-firewall)
This is often the simplest and most effective solution. If you assign a public IPv4 address to your virtual machine (VM), and ensure its security group or firewall allows UDP traffic on the WireGuard port, you eliminate the cloud NAT from the equation. Your instance is then just behind its own host firewall, which can be configured for endpoint-independent UDP. Tailscale [strongly recommends](<https://tailscale.com/blog/kubernetes-direct-connections#:~:text=What can I do about,this>) this for critical infrastructure nodes—essentially turning the “cloud NAT” scenario into a “no NAT” scenario​. On AWS, this means using an Elastic IP or public IP on the instance, instead of routing out through a NAT Gateway. On GCP or Azure, it means an instance NIC with a public IP assignment.
You don’t even need to allow inbound traffic from anywhere; you can restrict inbound UDP port 41641 (or whatever port Tailscale is using) to the IP ranges your other nodes are in. Even with leaving that port open, the WireGuard traffic is authenticated and encrypted. With a public IP, Tailscale will directly coordinate the two endpoints and often get a direct connection (or even use IPv6 if both have it). Many users treat their cloud instances like “virtual servers” and give them public IP addresses anyway, and Tailscale can take advantage of that for easy, direct links.
A hybrid cloud can be messy, but there are ways to simplify it.### [Use a custom NAT instance or firewall VM](#use-a-custom-nat-instance-or-firewall-vm)
Instead of the managed Cloud NAT services, some advanced users deploy their own NAT gateway using a Linux instance or a virtual router appliance, like pfSense or OPNsense. The advantage here is you can configure the NAT behavior.
For example, a Linux NAT instance using iptables/nf\_conntrack in [netfilter](https://netfilter.org/\) typically preserves source ports for UDP as long as there’s no conflict, which is effectively endpoint-independent mapping. You could also run something like pfSense with the new ([Tailscale-sponsored](https://tailscale.com/blog/nat-traversal-improvements-pt-1#sponsoring-freebsds-endpoint-independent-nat-patch)) endpoint-independent NAT option enabled. This way, your cloud VMs still don’t each need public IP addresses, but the NAT they share is under your control, and can be made P2P-friendly. The downside is you’re foregoing the simplicity and scalability of the cloud provider’s native solution. In other words, you’ll have to manage this VM: ensure it’s redundant for HA, handle updates, handle the throughput limits of the instance, and so on.
AWS actually used to suggest stand-alone NAT instances before its managed NAT gateway existed, but it’s more work.
### [Leverage cloud provider features (if available)](#leverage-cloud-provider-features-if-available)
As noted, GCP Cloud NAT can be [configured for endpoint-independent mapping](https://cloud.google.com/nat/docs/ports-and-addresses) by using static port allocation for your VM. If you’re on GCP, you could enable that to improve the odds of direct Tailscale connectivity. The trade-off is you must allocate a block of ports to the VM, which requires predicting your connection needs (to avoid running out of ports)​. Azure currently doesn’t offer a user-facing setting to make their NAT less symmetric, but Azure does have the concept of instance-level public IP addresses and load balancers.
In Azure or AWS, another trick is to use a UDP load balancer (like AWS’ [Network Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/introduction.html) or Azure’s [Standard Load Balancer](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-overview)) to forward a UDP port to your instance. For example, you could set up a Network Load Balancer that listens on UDP port 41641 and forwards to your VM on port 41641. This effectively gives your instance a stable UDP port on a public IP without exposing everything. Tailscale nodes on the internet might then be able to reach it directly.
This approach is a bit complex and isn’t officially supported by Tailscale, since the node itself wouldn’t know it’s reachable at that forwarded address unless you manually advertise it. But it’s an option for tinkerers who can’t use a full public IP, but want an incoming hole for Tailscale.
### [Run a subnet router or exit node](#run-a-subnet-router-or-exit-node)
If making each instance reachable through cloud NATs is too much work, one compromise is to have one well-connected node in the cloud act as a [subnet router](https://tailscale.com/kb/1019/subnets) or [exit node](https://tailscale.com/kb/1103/exit-nodes), and let other instances reach the rest of your tailnet through it. For instance, you could run Tailscale on a small VM that has a public IP, and use Tailscale’s subnet routing feature to allow other private instances to send traffic through that VM when communicating with end-user devices like laptops and phones.
This won’t provide a true peer-to-peer connection from every instance; traffic between a private instance and your laptop would go through the subnet router node, for instance. But at least that relay is under your control, and likely on a fast connection.
This kind of setup is somewhat analogous to running your own DERP, but at the IP level, within your network. Tailscale’s exit node feature can similarly funnel traffic. However, these approaches introduce a single-point bottleneck, and some management overhead, so they’re usually a last resort, if direct P2P absolutely can’t be attained.
## [The private kind of public](#the-private-kind-of-public)
The simplest guidance today is: use public IP addresses for cloud nodes when you can. Tailscale is secure enough to expose to the internet (since WireGuard keys are required to talk to it), and doing so sidesteps a lot of NAT complexity. Where that’s not feasible, try to make the NAT as friendly as possible—either via configuration (GCP’s EIM, Azure’s forthcoming features) or by bypassing it with your own solution.
We have already seen cloud networks slowly acknowledge these needs: GCP’s addition of endpoint-independent mode is one example, and AWS might in the future offer some mode for “preserving source ports” if enough customers ask. Currently, AWS [seems more focused](https://docs.aws.amazon.com/wellarchitected/latest/framework/perf_networking_choose_appropriate_dedicated_connectivity_or_vpn.html) on scaling connections than optimizing peer-to-peer connectivity.
This is the second post in our series on improving connections across NATs, firewalls, and clouds. Next up: What Tailscale, and the web as a whole, might do to make even more connections direct, reliable, and secure.
Share
Authors
Will Moore
Kevin Purdy
Kabir Sikand
Contributors
Avery Pennarun
Jordan Whited
James Tucker
Authors
Will Moore
Kevin Purdy
Kabir Sikand
Contributors
Avery Pennarun
Jordan Whited
James Tucker
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