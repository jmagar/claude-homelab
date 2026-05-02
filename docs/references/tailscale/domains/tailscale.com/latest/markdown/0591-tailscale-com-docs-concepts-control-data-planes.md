Control and data planes · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Control and data planes
Last validated: Jan 5, 2026
Modern networks separate their operations into two distinct planes that work together: the [control plane](#control-plane) and the [data plane](#data-plane). These planes maintain constant communication, and the separation helps organize network operations and makes networks more manageable, efficient, and reliable.
In a Tailscale network (known as a [tailnet](/docs/concepts/tailnet)), the control plane operates through the Tailscale [coordination server](#coordination-server), while the data plane runs on each tailnet device.
## [Control plane](#control-plane)
The control plane is a vital part of a network that manages how data flows through the [data plane](#data-plane). You can think of the control plane as an air traffic controller; it oversees the entire network and makes high-level decisions. It performs many tasks, including identity management, network configuration, connection coordination, and policy management.
* Authentication and identity functions of the control plane include validating device identities, maintaining [access control](/docs/features/access-control) policies, tracking device registration and removal, and managing device authorization states.
* Network setup and maintenance functions of the control plane include distributing subnet routes, configuring DNS settings, managing [IP address assignments](/docs/concepts/ip-and-dns-addresses), and updating network configurations.
* Connection coordination functions of the control plane include managing [NAT traversal](/blog/how-tailscale-works), peer discovery, distributing device information, selecting optimal [DERP](/docs/reference/derp-servers) regions, and maintaining device state information.
* Policy management functions of the control plane include enforcing [access control](/docs/features/access-control) policies, managing [subnet routing](/docs/features/subnet-routers) rules, implementing [exit node](/docs/features/exit-nodes) configurations, and managing permissions.
### [Coordination server](#coordination-server)
The Tailscale coordination server is a single, centralized server that manages [control plane](#control-plane) operations and maintains a connection to all tailnet devices. It handles essential functions including device discovery, authentication, [key distribution](/blog/tailscale-key-management), and policy enforcement. It also distributes routing configurations and access control policies to Tailscale clients on tailnet devices, which convert these high-level instructions into to the lowest-level configuration the [data plane](#data-plane) can execute.
Additionally, the coordination server enables NAT traversal by managing endpoint information between devices and selecting optimal [DERP](/docs/reference/derp-servers) regions when [direct connections](/docs/reference/connection-types) aren't possible.
If the [coordination server becomes unavailable](/docs/reference/coordination-server-down), tailnet devices can still communicate with pre-established connections and use cached network policies. However, they won't be able to establish new connections, alter their keys, or retrieve network policy updates until the coordination server comes back online. This is because Tailscale doesn't route any traffic through the coordination server, device keys are stored locally, and network policies are cached locally.
#### [Device discovery and NAT traversal](#device-discovery-and-nat-traversal)
One of the core functions of the coordination server is to maintain a registry of all devices in a tailnet. It also collects and manages device information, such as IP addresses, Tailscale client versions, public keys, location, and operating systems. The coordination server uses this information to populate device data on the Tailscale admin console, select [DERP servers](/docs/reference/derp-servers), apply [device posture](/docs/features/device-posture) policies, and facilitate connections.
#### [State, policies, and configurations](#state-policies-and-configurations)
The Tailscale coordination server collects and distributes this device and network information across the tailnet. This information includes:
* Device metadata, such as [IP addresses](/docs/concepts/ip-and-dns-addresses), Tailscale client versions, operating systems, and geographic location.
* Device public keys and certificates.
* Network configurations, such as [DNS](/docs/reference/dns-in-tailscale) name servers and preferred DERP servers.
* Policies, such as access control policies, [device posture](/docs/features/device-posture) policies, and other security policies.
Keeping this information on the coordination server helps ensure things like facilitating [NAT traversal](/blog/how-tailscale-works) through DERP servers, keeping configurations in sync across the tailnet, ensuring enforcement of access control policies, and surfacing data on the admin console.
#### [Authentication, authorization, and key distribution](#authentication-authorization-and-key-distribution)
While a traditional implementation of a centralized coordination server might manage authentication, Tailscale's coordination server does not handle user authentication. Authentication is outsourced to an [OAuth 2.0](/docs/features/oauth-clients), [OpenID Connect](/docs/integrations/identity/custom-oidc), or [identity provider](/docs/integrations/identity), which lets you maintain user accounts through an existing provider such as GitHub or Google. The coordination server does, however, manage authentication tokens and their lifecycles and enforce [access control](/docs/features/access-control) policies.
All device public keys are stored on the coordination server. The coordination server only permits devices to access the public keys of devices and resources they're allowed to access. As a result, devices in a tailnet aren't aware of other devices unless you grant them access.
## [Data plane](#data-plane)
The data plane operates on individual devices within your tailnet, handling the actual movement of encrypted data between devices using the [WireGuard](/docs/concepts/wireguard) protocol.
The data plane manages packet [encryption](/docs/concepts/tailscale-encryption), applies routing rules from the [control plane](#control-plane), and handles packet forwarding. It also establishes connections, continuously monitors connection health, manages bandwidth usage, and implements failover mechanisms when network conditions change.
* Device-to-device communication functions of the data plane include establishing WireGuard tunnels, encrypting and decrypting traffic, managing direct connections between devices, implementing UDP-based communication, and handling connection migration.
* Packet management functions of the data plane include forwarding encrypted packets between devices, applying routing rules to traffic, implementing packet filtering based on access control policies, managing packet queuing and prioritization, and handling packet fragmentation and reassembly.
On this page
* [Control plane](#control-plane)
* [Coordination server](#coordination-server)
* [Device discovery and NAT traversal](#device-discovery-and-nat-traversal)
* [State, policies, and configurations](#state-policies-and-configurations)
* [Authentication, authorization, and key distribution](#authentication-authorization-and-key-distribution)
* [Data plane](#data-plane)
Scroll to top