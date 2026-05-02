Cisco and Tailscale terminology mapping · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Cisco and Tailscale terminology mapping
Last validated: Jan 5, 2026
When migrating from the Cisco ecosystem to Tailscale, the following relates Cisco terminology and concepts to the closest match in Tailscale.
## [Cisco ASA/FTD: No Tailscale equivalent required](#cisco-asaftd-no-tailscale-equivalent-required)
Cisco Adaptive Security Appliance (Cisco ASA) and Cisco Firewall Threat Defense (Cisco FTD) are Cisco's network appliance offerings, which is hardware that provides security and firewall solutions. Tailscale does not enforce hardware requirements in setting up Tailscale, and does not have an equivalent offering. Tailscale users can choose their own firewall solution's hardware, including Cisco hardware.
## [Cisco Secure Client: Tailscale client](#cisco-secure-client-tailscale-client)
Formerly known as Cisco AnyConnect, Cisco Secure Client is the re-branded software that users install on their devices to use Cisco's virtual private network (VPN) services. The Tailscale equivalent is the Tailscale [client](/docs/reference/glossary#client).
## [Cisco Secure Client ACLs and DAP: Tailscale ACLs](#cisco-secure-client-acls-and-dap-tailscale-acls)
Cisco Secure Client provides access control lists (ACLs), which control traffic at the network layer on Cisco ASA/FTD network appliances. Tailscale also provides [ACLs](/docs/features/access-control/acls) to control traffic. Tailscale ACLs are a legacy component of the [tailnet policy file](/docs/features/tailnet-policy-file), which is a configuration file that stores parameters, policies, and settings for your Tailscale network (known as a tailnet). While functionally ACLs map from Cisco Secure Client to Tailscale, in practical use, Cisco Secure Client focuses on firewall policies and Dynamic Access Policies (DAP).
Tailscale now secures access to resources using [grants](/docs/features/access-control/grants), a next-generation access control policy syntax. Grants provide [all original ACL functionality plus additional capabilities](/docs/reference/grants-vs-acls).
ACLs will continue to work **indefinitely**; Tailscale will not remove support for this first-generation syntax from the product. However, Tailscale recommends [migrating to grants](/docs/reference/migrate-acls-grants) and using grants for all new tailnet policy file configurations because ACLs will not receive any new features.
## [Cisco Secure Clients device: Tailscale device, node, peer](#cisco-secure-clients-device-tailscale-device-node-peer)
As a traditional VPN, Secure Client's devices are the spokes in a hub-and-spoke model. While the definition of device is identical between Cisco Secure Client and Tailscale, Tailscale adds additional terminology due to being a mesh network. Each Tailscale device is also a node in the mesh network. Nodes within the mesh network are peers to one another.
## [VPN gateway or secure gateway: No Tailscale equivalent required](#vpn-gateway-or-secure-gateway-no-tailscale-equivalent-required)
Because Cisco Secure Client is a traditional VPN that uses a hub-and-spoke model for networking, a VPN gateway or secure gateway acts as the hub in that model. Often, it is a Cisco ASA/FTD. While Tailscale's control plane does employ a [coordination server](/docs/concepts/control-data-planes#coordination-server), its [data plane](/docs/concepts/control-data-planes#data-plane) is a mesh network that enables [direct peer-to-peer connections](/blog/how-tailscale-works#mesh-networks).
## [Summary of Cisco and Tailscale terminology mapping](#summary-of-cisco-and-tailscale-terminology-mapping)
The following table summarizes the terminology mapping.
|**Cisco term**|**Tailscale term**|
|Cisco ASA/FTD|No Tailscale equivalent required|
|Cisco Secure Client|Tailscale client|
|Cisco Secure Client ACLs and DAP|Tailscale ACLs|
|Cisco Secure Clients device|Tailscale device, node, peer|
|VPN gateway or secure gateway|No Tailscale equivalent required|
On this page
* [Cisco ASA/FTD: No Tailscale equivalent required](#cisco-asaftd-no-tailscale-equivalent-required)
* [Cisco Secure Client: Tailscale client](#cisco-secure-client-tailscale-client)
* [Cisco Secure Client ACLs and DAP: Tailscale ACLs](#cisco-secure-client-acls-and-dap-tailscale-acls)
* [Cisco Secure Clients device: Tailscale device, node, peer](#cisco-secure-clients-device-tailscale-device-node-peer)
* [VPN gateway or secure gateway: No Tailscale equivalent required](#vpn-gateway-or-secure-gateway-no-tailscale-equivalent-required)
* [Summary of Cisco and Tailscale terminology mapping](#summary-of-cisco-and-tailscale-terminology-mapping)
Scroll to top