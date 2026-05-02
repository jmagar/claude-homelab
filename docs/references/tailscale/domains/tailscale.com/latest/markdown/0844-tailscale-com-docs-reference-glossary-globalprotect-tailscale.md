Palo Alto Networks GlobalProtect and Tailscale terminology mapping · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Palo Alto Networks GlobalProtect and Tailscale terminology mapping
Last validated: Oct 6, 2025
When migrating from the Palo Alto Networks GlobalProtect ecosystem to Tailscale, the following relates GlobalProtect terminology and concepts to the closest match in Tailscale.
## [GlobalProtect App: Tailscale client](#globalprotect-app-tailscale-client)
GlobalProtect App is the software that runs on endpoints and enables access through portals and gateways. While the mobile versions are downloadable through traditional app stores, you must deploy Windows and macOS versions from the GlobalProtect portal. The Tailscale equivalent is the Tailscale client, which you can download without having to go through portal deployment hoops.
## [GlobalProtect Portal: No Tailscale equivalent required](#globalprotect-portal-no-tailscale-equivalent-required)
GlobalProtect Portal is the set of servers that provide management capabilities within the GlobalProtect infrastructure, particularly with configuration and distribution of software like the GlobalProtect app. They maintain a list of gateways and client certificates that every endpoint depends on. This is essentially a control plane that follows a traditional VPN model. Tailscale has no hardware requirements, and the Tailscale [control plane](/docs/concepts/control-data-planes) exists as a [coordination server](/docs/concepts/control-data-planes#coordination-server) to help peers share public keys and addresses to establish direct connections.
## [GlobalProtect Gateways: No Tailscale equivalent required](#globalprotect-gateways-no-tailscale-equivalent-required)
GlobalProtect Gateways are responsible for enforcing security policies and providing VPN connectivity. Being a traditional hub-and-spoke model, all user traffic must go through a gateway for security inspections. The encrypted tunnel between endpoints and gateways is the data plane. Tailscale has no gateways or centralized server requirements, instead using direct peer-to-peer connections as its end-to-end encrypted data plane.
## [GlobalProtect device: Tailscale device, node, peer](#globalprotect-device-tailscale-device-node-peer)
While the definition of devices is identical between GlobalProtect and Tailscale, Tailscale adds more related terminology due to being a mesh network. Every Tailscale device is also a node in the mesh network, and nodes within the network are peers to one another.
## [Host Information Profile: Tailscale device posture management](#host-information-profile-tailscale-device-posture-management)
Host Information Profile (HIP) is a feature that enables the collection of security status information from endpoints, such as whether the device has the latest security patches or is running the latest software. The Tailscale equivalent is [device posture management](/docs/features/device-posture).
## [Endpoint Traffic Policy Enforcement: tailnet policy file](#endpoint-traffic-policy-enforcement-tailnet-policy-file)
Endpoint Traffic Policy Enforcement is a new GlobalProtect feature that enables policy enforcement to happen on individual endpoints instead of only at gateways. Tailscale's [tailnet policy file](/docs/features/tailnet-policy-file) is a baseline Tailscale feature that has existed since the initial Tailscale release. Tailscale by design distributes policy enforcement on every device.
On this page
* [GlobalProtect App: Tailscale client](#globalprotect-app-tailscale-client)
* [GlobalProtect Portal: No Tailscale equivalent required](#globalprotect-portal-no-tailscale-equivalent-required)
* [GlobalProtect Gateways: No Tailscale equivalent required](#globalprotect-gateways-no-tailscale-equivalent-required)
* [GlobalProtect device: Tailscale device, node, peer](#globalprotect-device-tailscale-device-node-peer)
* [Host Information Profile: Tailscale device posture management](#host-information-profile-tailscale-device-posture-management)
* [Endpoint Traffic Policy Enforcement: tailnet policy file](#endpoint-traffic-policy-enforcement-tailnet-policy-file)
Scroll to top