Life on the edge: Networking challenges of AI deployments
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsJune 05, 2024
# Life on the edge: Networking challenges of AI deployments
If you’ve deployed an AI model to a remote device before, then you’ll know that connecting to it and keeping it secure aren’t exactly easy. Existing edge device tooling from cloud providers has been built around entirely different workloads, focused mostly on streaming low bandwidth sensor data to a centralized location. For more complex AI workloads, edge deployments lack most of the mature connectivity, security, and orchestration tooling available in a typical public cloud region. When it comes to AI at the edge, training a computer vision or AI model may be difficult, but it’s only half the technical challenge.
## [What makes AI at the edge different from IoT?](#what-makes-ai-at-the-edge-different-from-iot)
In some ways, the hurdles faced deploying an AI model to the edge resemble the ones faced by the original IoT and IIoT deployments during the first wave of “smart” everything. But beyond some basic similarities, there are a few new issues. This new wave of AI applications at the edge have much greater security and connectivity requirements than their predecessors, including needs for:
* Order(s) of magnitude more bandwidth and lower latencies than existing “of Things” applications.
* Fine-grained access control & logging to support deployments to sensitive environments.
* Reliable IP connectivity in both mesh and hub-and-spoke configurations.
Unfortunately, we can’t just connect everything to the internet as it works today and expect things to work out fine. It’s one thing for an attacker to [take over a smart tv](https://arstechnica.com/security/2024/04/patches-released-for-as-many-as-91000-hackable-lg-tvs-exposed-to-the-internet/), but it’s something entirely different for an attacker to take over a self-driving car while it’s simultaneously merging into traffic. So, before we talk about a solution, what went wrong the first time?
* **It was too easy to leave devices unsecured** — and while default or weak passwords (Hi admin123!) and public IPs obviously don’t mix, more nuanced security tradeoffs aren’t always so obvious to end-users. Not only that, but due to network constraints (or forgetfulness), necessary software updates to fix critical CVEs aren’t always applied either.
* **We trusted private networks a little too much** — and while it’s certainly better than publicly exposing a device, all it takes is an already compromised device joining the same network to experience an attack via lateral movement.
* **We treated the symptoms, not the causes, of compromised devices** — and made services like DDoS protection and ransomware backup plans fundamental requirements of having internet connected services, because attackers can easily get access to millions of compromised devices.## [Why are existing edge connectivity solutions insufficient?](#why-are-existing-edge-connectivity-solutions-insufficient)
With the massive positive impact computer vision and other AI applications can have in the physical world, it’s no surprise that a couple of work-around patterns have emerged to support their deployment. We typically hear from people who’ve deployed AI solutions to the edge that they’ve dealt with existing issues in two primary ways:
* **Leveraging cloud IoT device management** **solutions** — cloud based IoT device management solutions typically connect less complex devices that coordinate other basic onsite devices like sensors, lights, motors, and cameras. They’re reasonably good at what they were designed to do, but they were intended for mostly lower bandwidth applications and centralized device-to-cloud communication.
* **Using a traditional VPN** — legacy VPNs are the most common approach we see to solve the high bandwidth connectivity problem, as they offer a mostly straightforward initial implementation as well as encrypted connections over the public internet. However, a traditional VPN still requires trusting the network as a whole, introduces significant latency in common configurations, and doesn’t adeptly handle poor or intermittent network connectivity experienced by many edge deployments.## [How do you solve for both connectivity and security at the edge?](#how-do-you-solve-for-both-connectivity-and-security-at-the-edge)
Existing solutions are really only partial solutions, and they don’t go far enough for AI deployments. To make secure and reliable edge deployments the default we need to rethink how the network actually works. At Tailscale we aim to do a few things differently to make fast, easy, and secure connectivity between any and all devices a reality.
* **Bring identity to the network layer** — so machines don’t have to use IPs / IP ranges to be either overly restrictive or overly broad in how they allow connections. Validating user identities at the network layer eliminates the traditional security / ease of access trade-offs, and it provides assurances for every connection rather than leaving it up to individual applications.
* **Create direct connections between devices** — since any bandwidth limitations and added latencies from network bottlenecks only exacerbate issues as workload demands grow. It’s not possible to build a resilient and cost effective service for the next generation of applications if everything has to go through a small number of concentrated points. Flexibility to support the long tail of applications is what drives innovation on the internet and we don’t intend to limit it.
* **Create lightweight, secure, and stateless private network tunnels** — because networks are made up of a heterogeneous mix of connections and devices it’s important to ensure as many are supported as possible. It’s not practical or really even possible for every device to create dozens to hundreds of [long-lived IPSec connections](https://tailscale.com/compare/ipsec) to connect to other individual devices.
At Tailscale we think the new Internet will be built of small, trusted, human-scale networks, interconnected. It should be easy for builders leveraging AI and computer vision to create the next wave of smart infrastructure on top of secure, private, and distributed networks. Whether or not you’re deploying AI models at the edge, [check out Tailscale for free](https://tailscale.com/pricing), and connect up to 3 users and 100 devices.
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