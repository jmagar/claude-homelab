Terminology and concepts · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Terminology and concepts
Last validated: Jan 12, 2026
## [Access control lists](#access-control-lists)
An [access control list](/docs/features/access-control/acls) (ACL) manages system access using rules in the [tailnet policy file](#tailnet-policy-file). You can use ACLs to filter traffic and enhance security by managing who and what can use which resources.
## [tags](#tags)
A [tag](/docs/features/tags) lets you assign an [identity](#identity-provider) (that's separate from human users) to [devices](#device). You can use tags in your [access rules](/docs/features/access-control/acls) to restrict access.
## [admin console](#admin-console)
The admin console is the central location to manage your Tailscale network (known as a [tailnet](#tailnet)). You can manage devices on your network, users and their permissions, and settings such as key expiry. The admin console also informs you if an update to the Tailscale client is available for your device. When you make changes from the admin console, the [coordination server](/docs/concepts/control-data-planes#coordination-server) updates the changes to your tailnet immediately.
You can access the admin console at [admin console](https://login.tailscale.com/admin).
## [API](#api)
API is an acronym for application programming interface. APIs define a set of rules to interact with an application or service programmatically. The [Tailscale API](/api) lets you manage your Tailscale account and tailnet.
## [CLI](#cli)
CLI is an acronym for command line interface. The Tailscale [CLI](/docs/reference/tailscale-cli) includes a robust set of commands with functionality that GUI applications might not have. The Tailscale CLI is installed automatically when you install Tailscale on Linux, macOS, or Windows.
## [Client](#client)
The Tailscale client is a software application that runs on a device so the device can join and participate in a [tailnet](#tailnet). The client uses the [WireGuard](#wireguard) protocol to create encrypted peer-to-peer connections. The client is available for multiple operating systems. Much of the client code is [open source](/opensource).
## [Coordination server](#coordination-server)
A [coordination server](/docs/concepts/control-data-planes#coordination-server) is a central server that maintains a connection to all devices in your [Tailscale network](#tailnet). It manages [encryption](/docs/concepts/tailscale-encryption) keys, network changes, access policy changes, and maintains a connection to all devices in your Tailscale network. The coordination server is part of the [control plane](/docs/concepts/control-data-planes#control-plane), not the [data plane](/docs/concepts/control-data-planes#data-plane). It avoids being a performance bottleneck by not relaying traffic between devices.
## [Device](#device)
A device is anything other than a user. It can be physical or virtual and sends, receives, or processes data on your Tailscale network.
## [Device key](#device-key)
A device key is a unique public and private key pair for a specific [device](#device). More than one user can use a device key, but each device can only have one device key. The combination of a specific user with a device key represents a unique device.
## [Firewall](#firewall)
A firewall limits what network traffic can pass between two points. Firewalls can be hardware-based or software-based. Tailscale includes a built-in firewall, defined by the domain's [access rules](/docs/features/access-control/acls).
## [Full tunnel](#full-tunnel)
With a traditional virtual private network (VPN), full tunnel describes a configuration where all traffic from a client is sent through the VPN, including internet-bound traffic. With Tailscale, you can route all internet-bound traffic by setting a device on your network as an [exit node](/docs/features/exit-nodes). If your clients are configured to use an exit node and also have routes or connectivity to other Tailscale [devices](#device), [subnet routers](/docs/features/subnet-routers), or [app connectors](/docs/features/app-connectors/how-to/setup), then Tailscale will still operate as a [split tunnel](#split-tunnel) VPN, routing traffic directly to each endpoint without routing traffic through the exit node first.
## [Identity Provider](#identity-provider)
An identity provider is a method for users to authenticate to a [tailnet](/docs/concepts/tailnet). Examples of [identity providers](/docs/integrations/identity) include Google, Okta, and Microsoft. Tailscale is not an identity provider but relies other identity providers for authentication.
## [Key expiry](#key-expiry)
Key expiry is the end of the validity period for a cryptographic key. An expired key can no longer encrypt or decrypt data, nor authenticate a device to a Tailscale network.
Using Tailscale means you never have to manage [encryption](/docs/concepts/tailscale-encryption) keys directly. Tailscale automatically expires keys and requires them to be regenerated at regular intervals. You can disable key expiry for long-lived devices from the admin console.
## [MagicDNS](#magicdns)
[MagicDNS](/docs/features/magicdns) automatically registers memorable hostnames for devices in your Tailscale network. It also extends and improves DNS functionality.
## [NAT traversal](#nat-traversal)
NAT is an acronym for [network address translation](https://en.wikipedia.org/wiki/Network_address_translation). [NAT traversal](/blog/how-nat-traversal-works) is a way to connect devices across the internet through barriers such as firewalls. Most internet devices can't talk to each other because of firewalls and devices that do network address translation. [NAT traversal works](/blog/how-tailscale-works#the-control-plane-key-exchange-and-coordination) around these barriers, allowing [data to traverse the network](#nat-traversal).
## [Network topology](#network-topology)
A network topology is an arrangement of devices in a network. It shows the connections between them. Examples of network topologies include star, bus, hub-and-spoke, mesh, and hybrid.
Traditional virtual private networks (VPNs) use a [hub-and-spoke topology](/blog/how-tailscale-works#hub-and-spoke-networks). Each device communicates with another in this setup by sending all traffic through a central gateway device. Tailscale operates as a [mesh topology](/blog/how-tailscale-works#mesh-networks) where each device can talk directly to others using [NAT traversal](#nat-traversal).
## [Node](#node)
A node is a combination of a user and a [device](#device).
## [Overlay network](#overlay-network)
An overlay network is a virtual network built on top of the [underlay](#underlay-network) network, where nodes communicate using logical addresses and encrypted tunnels independent of the underlay's addressing or topology. Tailscale forms an overlay network (the [tailnet](#tailnet)) that gives each node a stable identity and IP address, regardless of how the underlay changes.
## [Peer](#peer)
A peer is another [node](#node) that your device is trying to talk to. A peer might or might not be in the same domain.
## [Relay](#relay)
A relay is an intermediary server that passes data between two or more devices in a network. Tailscale uses a special type of globally distributed relay server called [Designated Encrypted Relay for Packets (DERP)](/docs/reference/derp-servers). DERP relay servers function as a fallback to connect devices when NAT traversal fails.
## [Split tunnel](#split-tunnel)
Split tunnel, as opposed to [full tunnel](#full-tunnel), describes a VPN configuration where only some traffic (specific IP ranges, domains, or subnets) is sent through the VPN, while all other traffic goes directly to the internet by using the device's local internet gateway. In Tailscale, this means only traffic destined for other Tailscale [devices](#device), [subnet routers](/docs/features/subnet-routers), or [app connectors](/docs/features/app-connectors/how-to/setup) uses the tailnet, leaving general internet traffic untouched.
## [SSO](#sso)
SSO is an acronym for [single sign-on](/docs/integrations/identity). Single sign-on lets users log in to one site using the identity of another.
## [Tailnet](#tailnet)
A [tailnet](/docs/concepts/tailnet) is another term for a Tailscale network, which is an interconnected collection of users, devices, and resources. The network has a [control plane](/docs/concepts/control-data-planes#control-plane) and a [data plane](/docs/concepts/control-data-planes#data-plane) that work in unison to manage access and send data between devices.
There are personal and organization tailnets. A personal tailnet is a shared domain single-user tailnet (like `gmail.com`). An organization tailnet is a custom domain tailnet (like `example.com`),
## [Tailnet policy file](#tailnet-policy-file)
The tailnet policy file stores your Tailscale network's access rules, along with other tailnet configuration items. It uses [human JSON (HuJSON)](https://github.com/tailscale/hujson) and conforms to the [Tailscale policy syntax](/docs/reference/syntax/policy-file).
## [Tailscalar](#tailscalar)
A Tailscalar is a Tailscale employee.
## [Tailscale IP address](#tailscale-ip-address)
A [Tailscale IP address](#tailscale-ip-address) is a [unique IP address](/docs/concepts/ip-and-dns-addresses) assigned to each device in your Tailscale network. It's always in the form `100.x.y.z` (for example, `100.100.123.123`). It stays the same even when switching between your home internet connection, cellular networks, or coffee shop Wi-Fi networks.
## [Tunnel](#tunnel)
In networking, a tunnel is an encapsulated connection between one or more points in a network. It lets users, devices, or resources communicate securely over a public data network.
## [Underlay network](#underlay-network)
An underlay network is the physical or existing IP network over which Tailscale runs, such as your home Wi-Fi, office LAN, or your cloud or data center's internet connection. Tailscale uses this underlay for actual packet transport, creating an [overlay network](#overlay-network) on top of the underlay that handles encryption, NAT traversal, access controls, and many more features.
## [WireGuard](#wireguard)
[WireGuard](https://www.wireguard.com) is the underlying cryptographic protocol that Tailscale uses.
On this page
* [Access control lists](#access-control-lists)
* [tags](#tags)
* [admin console](#admin-console)
* [API](#api)
* [CLI](#cli)
* [Client](#client)
* [Coordination server](#coordination-server)
* [Device](#device)
* [Device key](#device-key)
* [Firewall](#firewall)
* [Full tunnel](#full-tunnel)
* [Identity Provider](#identity-provider)
* [Key expiry](#key-expiry)
* [MagicDNS](#magicdns)
* [NAT traversal](#nat-traversal)
* [Network topology](#network-topology)
* [Node](#node)
* [Overlay network](#overlay-network)
* [Peer](#peer)
* [Relay](#relay)
* [Split tunnel](#split-tunnel)
* [SSO](#sso)
* [Tailnet](#tailnet)
* [Tailnet policy file](#tailnet-policy-file)
* [Tailscalar](#tailscalar)
* [Tailscale IP address](#tailscale-ip-address)
* [Tunnel](#tunnel)
* [Underlay network](#underlay-network)
* [WireGuard](#wireguard)
Scroll to top