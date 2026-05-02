Twingate vs. Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Go back](/compare#vpn-comparisons)
[Compare](/compare)
Twingate
# Twingate vs. Tailscale
On this page
[
Use Tailscale
](https://login.tailscale.com/start)[
Contact Sales
](/contact/sales)
[Twingate](https://www.twingate.com/) and [Tailscale](https://tailscale.com/) are each VPNs, with similar pitches about ease-of-use and remote employee security. Despite these similarities, they address different situations.
This article explores how Twingate and Tailscale differ and which you might want to choose.
### [Why are businesses rolling out VPNs?](#why-are-businesses-rolling-out-vpns)
With the increased popularity of remote work, many businesses are looking to implement their own VPN to allow their teams to collaborate securely. Businesses with existing VPNs are re-evaluating their current solutions with the aim of improving their reliability in order to reduce the number of interruptions remote employees experience. Have general questions about VPNs and how to set them up? Check out our topical [VPN reviewer’s guide](https://tailscale.com/kb/1062/reviewer-guide/#can-non-technical-users-set-it-up).
### [What about cloud file sharing?](#what-about-cloud-file-sharing)
Many businesses are unable or unwilling to use cloud file sharing solutions such as Dropbox or OneDrive. Such companies might be concerned about regulatory or privacy concerns; they might need to share more than just files; or they might wish to share access to database servers, build environments, printers, or private web applications. VPNs allow all of this functionality to occur over an encrypted tunnel instead of opening up these services to the public internet and hoping they are not attacked.
Providing your team with an easy-to-use and secure storage server over a VPN makes your team more resilient. This makes it easy to get productive again if one of your team members loses their device, a laptop dies, or someone’s laptop falls victim to ransomware.
### [Traditional VPNs](#traditional-vpns)
The industry standard for implementing traditional site-to-site VPNs linking remote networks is [IPsec](https://en.wikipedia.org/wiki/IPsec). IPsec allows users at two locations to access the same network resources like file shares, internal services, and printers. Other protocols such as SSL allow users to dial into their corporate networks from their mobile devices while on the move. For example, [OpenVPN](https://openvpn.net/) is an SSL VPN.
However, IPsec can be difficult to configure properly without leaving attack surfaces open to hackers. Meanwhile, mobile workers may be using their own incompatible mobile devices, or they may be stuck behind restrictive hotel or conference center firewalls, causing connectivity issues (usually just as they are due to give a presentation).
### [Twingate at a glance](#twingate-at-a-glance)
Twingate bills itself as a secure alternative to traditional “perimeter defense” VPNs. It is designed to allow remote workers to connect to existing internal networks. Once Twingate’s service is connected to an internal-only network and resources are added, remote users can access those resources as if they were in the same room.
This is great for teams who have existing networked resources they wish to share that are hosted on machines that can run the Twingate connector. An existing network can be quickly upgraded with a secure, flexible VPN solution.
### [Tailscale at a glance](#tailscale-at-a-glance)
Tailscale is also a secure VPN designed to quickly enable remote work, but with Tailscale, the connection is direct: Once Tailscale is installed on two devices, they can access each other over a secure connection, no matter where they are in the world — as long as they can access the public internet. Team members could be in different coffee shops on different continents and be able to access resources on each other’s computers as if they were in the same room.
Tailscale offers a quick and easy solution for getting a team connected and sharing resources independently of any existing infrastructure.
### [Setting up Twingate](#setting-up-twingate)
You must have a Google, Microsoft, or GitHub account to sign up for Twingate. You can then download and configure the [Twingate connector](https://docs.twingate.com/docs/connector-best-practices) and start adding [resources](https://docs.twingate.com/docs/resources-and-access-nodes). This can require some technical skills, but Twingate has support engineers to assist should you need help. You must then set up an identity provider so that your users can log in with their devices.
### [Setting up Tailscale](#setting-up-tailscale)
Tailscale also requires an account with Google, Microsoft Active Directory, GitHub, Okta, or OneLogin. You can then download Tailscale for any devices that you want to connect. Installing Tailscale on a device typically requires no technical skills and can be done within minutes. No engineering support is required.
When you have added two or more devices to Tailscale, they will be able to talk to each other securely over their private Tailscale network. Any services shared on those devices are immediately available to the others. No extra setup is required.
### [Devices and network topology](#devices-and-network-topology)
Twingate is available for all [major platforms](https://docs.twingate.com/docs/download). Once devices are added, they will have access to devices configured as resources on the network, in the same subnet as the Twingate connector.
Tailscale is also available for all major platforms, including [macOS, iOS, Windows, Linux, and Android](https://tailscale.com/download).
Once Tailscale is installed on a device, it can access other devices in the same Tailscale network as permitted by Access Control Lists (ACLs). You are not required to perform any additional configuration, and there is no special resource configuration required. All you need to do is log in, and you’re done.
Tailscale has explicit support for the [Raspberry Pi](https://www.raspberrypi.com/software/). This allows you to use a Raspberry Pi as an affordable network bridge device, which you can use to bridge an existing internal network to Tailscale using [subnet routing](https://tailscale.com/kb/1019/subnets/).
### [Users and access control](#users-and-access-control)
Twingate provides an online interface for setting up resources — the services on your network available to your connected users. Resources are defined by their IP address and port, and permissions can be granted to users and devices.
By default, devices connected by Tailscale can access any service on any other connected device, making it easy to check connectivity and get up and running. You can then restrict permissions using Tailscale’s [access control lists](https://tailscale.com/kb/1018/acls/) (ACLs) through an online interface, known as the admin console.
But what if you want to allow limited access to someone outside the network? The [Node Sharing](https://tailscale.com/kb/1084/sharing/) feature in Tailscale allows you to grant access to specific devices in your Tailscale network to external users. This could be used by a developer to grant a trusted third party access to a demo service they are running on their machine. This prevents you from also granting that third party access to the rest of your company’s tailnet.
### [Security](#security)
Twingate and Tailscale both use industry standard encryption algorithms. All of your traffic is encrypted in transit, ideal for working from untrusted networks like those found in hotels, airplanes, and coffee shops.
### [The bottom line](#the-bottom-line)
Twingate and Tailscale both provide you with an easily configurable VPN solution for connecting your team members, regardless of location.
Twingate will connect to your internal network and provide your team with the tools it needs to securely connect to your existing internal servers and cloud-hosted solutions like Azure, Digital Ocean, and AWS. While the setup process is not complicated, some familiarity with network administration is required.
Tailscale also makes it easy to provide access to internal networks via subnet routing, but it can also be deployed where there is limited or no existing infrastructure. Tailscale is supported on a wide range of devices and can be deployed in minutes.
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)