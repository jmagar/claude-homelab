Replace site-to-site VPNs with Tailscale and WireGuard · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Replace site-to-site VPNs with Tailscale and WireGuard
Last validated: Sep 4, 2024
A site-to-site VPN (virtual private network) transparently forwards network traffic between two or more local networks. Devices or virtual machines on one of those networks can access services on all the other subnets, without needing to install any software on the device itself.
Examples of common use cases for site-to-site VPNs include:
* Connecting physical offices to the cloud.
* Linking VPCs (virtual private clouds) across regions.
* Linking between different cloud providers (such as Google to AWS).
* Sharing servers or APIs with external suppliers, partners, or contractors.
Examples of common site-to-site VPN providers and platforms include Amazon Web Services (AWS) VPN, Google Cloud Platform (GCP) VPN, Cisco or Palo Alto Networks hardware, and Linux devices configured for IPsec.
## [Use Tailscale and WireGuard as a site-to-site VPN](#use-tailscale-and-wireguard-as-a-site-to-site-vpn)
By using Tailscale with [WireGuard](/docs/concepts/wireguard), you can replace all these traditional site-to-site configurations with a secure, high-performance mesh network. This combination ensures a level of security that you can trust.
To get started, configure a [Tailscale subnet router](/docs/features/subnet-routers) in each location. Tailscale handles all the key management and routing necessary to create a multi-site mesh network automatically.
On this page
* [Use Tailscale and WireGuard as a site-to-site VPN](#use-tailscale-and-wireguard-as-a-site-to-site-vpn)
Scroll to top