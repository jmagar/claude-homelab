Fortinet and Tailscale terminology mapping · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Fortinet and Tailscale terminology mapping
Last validated: Jan 14, 2026
When migrating from the Fortinet ecosystem to Tailscale, the following relates Fortinet terminology and concepts to the closest match in Tailscale.
## [FortiAuthenticator and FortiToken: Tailscale SSO integrations](#fortiauthenticator-and-fortitoken-tailscale-sso-integrations)
FortiAuthenticator is the centralized solution for identity management and single sign-on (SSO) integration, and FortiToken provides multifactor authentication (MFA). Tailscale out-of-the-box doesn't require a separate solution for identity or SSO, and has integrations with popular identity providers, including MFA if supported by the identity provider.
## [FortiClient: Tailscale client](#forticlient-tailscale-client)
FortiClient is an agent, which is a piece of software that users install on their device that creates an endpoint for using Fortinet's services. The Tailscale equivalent is the Tailscale [client](/docs/reference/glossary#client).
## [FortiClient EMS: Tailscale admin console](#forticlient-ems-tailscale-admin-console)
FortiClient Endpoint Management Server (FortiClient EMS) gives centralized control and orchestration over all endpoints, including distributing policies and device posture profiles. Tailscale does not require a separate server setup, with management done in the Tailscale [admin console](/docs/reference/glossary#admin-console).
## [FortiGate and FortiOS: No Tailscale equivalent required](#fortigate-and-fortios-no-tailscale-equivalent-required)
Because Fortinet uses a traditional hub-and-spoke model for networking, FortiGate began as the "hub" hardware offering by Fortinet that acts as a firewall and policy enforcement point, and FortiOS is the operating system. FortiGate has since evolved into a next-generation firewall (NGFW) that has both physical and virtual offerings for cloud setups. Tailscale does not enforce hardware requirements in setting up or using Tailscale, and does not have an equivalent offering. Tailscale users can choose their own firewall solution's hardware, including FortiGate. While Tailscale's control plane does employ a [coordination server](/docs/concepts/control-data-planes#coordination-server), its [data plane](/docs/concepts/control-data-planes#data-plane) is a mesh network that enables [direct peer-to-peer connections](/blog/how-tailscale-works#mesh-networks).
## [Fortinet "on-net" and "off-net": Tailscale tailnet](#fortinet-on-net-and-off-net-tailscale-tailnet)
Fortinet doesn't have an equivalent term to tailnet, which is a Tailscale network, because Fortinet doesn't create a mesh overlay network like Tailscale. In their documentation, Fortinet uses traditional networking language like "on-net" and "off-net" to distinguish whether a device is within Fortinet's known network behind a FortiGate.
## [Fortinet ACLs: Tailscale ACLs](#fortinet-acls-tailscale-acls)
Fortinet makes limited use of access control lists (ACLs), which control traffic at the network layer, and only on certain specs of FortiGate. Tailscale also provides [ACLs](/docs/features/access-control/acls) to control traffic. Tailscale ACLs are a legacy component of the [tailnet policy file](/docs/features/tailnet-policy-file), which is a configuration file that stores parameters, policies, and settings for your tailnet. While functionally ACLs map from Fortinet to Tailscale, in practical use, Fortinet operates more heavily at the level of firewall policies within the FortiGate hardware setup.
Tailscale now secures access to resources using [grants](/docs/features/access-control/grants), a next-generation access control policy syntax. Grants provide [all original ACL functionality plus additional capabilities](/docs/reference/grants-vs-acls).
ACLs will continue to work **indefinitely**; Tailscale will not remove support for this first-generation syntax from the product. However, Tailscale recommends [migrating to grants](/docs/reference/migrate-acls-grants) and using grants for all new tailnet policy file configurations because ACLs will not receive any new features.
## [Fortinet device: Tailscale device, node, peer](#fortinet-device-tailscale-device-node-peer)
As a traditional VPN, Fortinet's devices are the spokes in a hub-and-spoke model. While the definition of devices is identical between Fortinet and Tailscale, Tailscale adds more related terminology due to being a mesh network. Every Tailscale device is also a node in the mesh network, and nodes within the network are peers to one another.
## [Summary of Fortinet and Tailscale terminology mapping](#summary-of-fortinet-and-tailscale-terminology-mapping)
The following table summarizes the terminology mapping.
|**Fortinet term**|**Tailscale term**|
|FortiAuthenticator and FortiToken|Tailscale SSO integrations|
|FortiClient|Tailscale client|
|FortiClient EMS|Tailscale admin console|
|FortiGate and FortiOS|No Tailscale equivalent required|
|Fortinet "on-net" and "off-net"|Tailscale tailnet|
|Fortinet ACLs|Tailscale ACLs|
|Fortinet device|Tailscale device, node, peer|
On this page
* [FortiAuthenticator and FortiToken: Tailscale SSO integrations](#fortiauthenticator-and-fortitoken-tailscale-sso-integrations)
* [FortiClient: Tailscale client](#forticlient-tailscale-client)
* [FortiClient EMS: Tailscale admin console](#forticlient-ems-tailscale-admin-console)
* [FortiGate and FortiOS: No Tailscale equivalent required](#fortigate-and-fortios-no-tailscale-equivalent-required)
* [Fortinet "on-net" and "off-net": Tailscale tailnet](#fortinet-on-net-and-off-net-tailscale-tailnet)
* [Fortinet ACLs: Tailscale ACLs](#fortinet-acls-tailscale-acls)
* [Fortinet device: Tailscale device, node, peer](#fortinet-device-tailscale-device-node-peer)
* [Summary of Fortinet and Tailscale terminology mapping](#summary-of-fortinet-and-tailscale-terminology-mapping)
Scroll to top