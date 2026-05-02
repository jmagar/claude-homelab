IPsec vs. WireGuard | Tailscale Comparison Matrix
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Go back](/compare#vpn-comparisons)
[Compare](/compare)
Ipsec vs. WireGuard
# IPsec vs. WireGuard
On this page
[
Use Tailscale
](https://login.tailscale.com/start)[
Contact Sales
](/contact/sales)
If you are tasked with selecting a VPN (Virtual Private Network) solution for your team or company, chances are high that you’ve looked into both IPsec-based and WireGuard-based VPNs as potential options. VPNs are often the preferred way to allow you and your teammates to access private infrastructure like Kubernetes clusters and file servers, and your ideal solution needs to be secure, easy to use, and easy to administer.
In this article, we compare IPsec and WireGuard, two protocols used in VPNs which allow businesses to connect remote networks. We look at both from the standpoints of security, user experience, and platform availability. Finally, we provide guidance on which might better suit your business VPN use case.
### [Overview of IPsec](#overview-of-ipsec)
[**IPsec**](https://en.wikipedia.org/wiki/IPsec) is a network protocol used for the encryption of [IP](https://en.wikipedia.org/wiki/Internet_Protocol) traffic. IPsec is frequently used as the secure communication protocol for business VPNs, most commonly with a tunneling protocol like [L2TP](https://en.wikipedia.org/wiki/Layer_2_Tunneling_Protocol). IPsec is supported on many operating systems and device types, including embedded devices and network routers.
### [Overview of WireGuard](#overview-of-wireguard)
[**WireGuard**](https://www.wireguard.com/) is a modern VPN protocol that is simple to use and easy to implement on both new and existing networks. WireGuard is free and open-source, and WireGuard implementations are available for major operating systems.
WireGuard offers VPN functionality by encapsulating [TCP](https://en.wikipedia.org/wiki/Transmission_Control_Protocol), [UDP](https://en.wikipedia.org/wiki/User_Datagram_Protocol), and other [IP](https://en.wikipedia.org/wiki/Internet_Protocol) traffic inside UDP packets with encrypted content. It does not rely upon a dedicated protocol for tunneling.
### [Comparison criteria](#comparison-criteria)
IPsec and WireGuard are both commonly used VPN protocols. As providers of business VPN solutions, we focus on comparing the protocols specifically for VPN use within business environments.
Having surveyed dozens of our business VPN customers, it became clear to us that a VPN protocol needs to provide solid encryption, be easy to use and operate, and have clients available for all the relevant devices and operating systems.
### [Comparison table](#comparison-table)
||**IPsec**|**WireGuard**|
|Open source
|Yes
|Yes
|
|End-to-end encryption
|Yes
|Yes
|
|Encryption options
|Many encryption options present the possibility of using insecure settings
|Fewer encryption options, focused on modern encryption solutions with more secure defaults
|
|Key exchange
|Uses [Internet Key Exchange (IKE)](https://en.wikipedia.org/wiki/Internet_Key_Exchange)|Uses [Noise Protocol](https://noiseprotocol.org/)|
|Maintains an active connection
|Yes
|No
|
Let’s explore each aspect of comparison in greater detail.
### [
](#)
### [Security](#security)
Whereas IPsec offers many encryption options, many of which can be insecure if incorrectly configured, WireGuard limits the available choices to modern, secure encryption methods. Neither the client nor the server can specify an insecure encryption option, and this approach ensures that most (if not all) WireGuard users will rely on recent encryption standards.
WireGuard has a small code base with very little legacy functionality, making it easy for the open source community to audit it for security bugs. WireGuard’s code has been formally verified, and the verification process has been documented in a paper [*A Cryptographic Analysis of the WireGuard protocol*](https://books.google.com/books?id=UKJfDwAAQBAJ&amp;pg=PA3&amp;redir_esc=y#v=onepage&amp;q&amp;f=false) by researchers Benjamin Downling and Kenneth G. Paterson. IPsec has not been verified in this manner, and due to IPsec’s large code base size a formal verification would be highly complex to execute.
IPsec offers more encryption options than WireGuard, for example, it supports using the RSA algorithm and pre-shared keys for authentication. Despite these legacy encryption methods no longer being considered secure, the IPsec user has the option to choose them if, for example, they need to add legacy clients to an existing IPsec VPN. The additional encryption options leave IPsec open to misconfiguration and make it a poorer choice for new VPN configurations.
IPsec’s code base is significantly larger than WireGuard’s due to IPsec’s inclusion of legacy protocols. In general, a larger code base is harder to audit. For example, [OpenSwan](https://github.com/xelerance/Openswan), a popular IPsec implementation for Linux, contains more than [8MB of code](https://api.github.com/repos/xelerance/OpenSwan/languages) in various languages, which at 80 bytes per line would amount to 100,000 lines of code. A codebase of that size is more complex and harder to verify than WireGuard’s.
Below, we show how IPsec and WireGuard concepts relate to each other.
|**IPsec concept**|**Related WireGuard concept**|
|Connection
|None (connectionless protocol)
|
|Security Association
|Route
|
|Security Policy
|Rule-based routing
Namespaces
|
|Security Associations Database
Security Policy Database
|None (internally maintained table)
|
### [Ease of use](#ease-of-use)
For both WireGuard and IPsec, the specific requirements for your VPN network will determine how easy it is to configure and use. However, some of the properties at the protocol level dictate the experiences that are possible with WireGuard and IPsec, namely connection management and available configuration options.
In stark contrast with IPsec, WireGuard does not have a concept of an open connection or tunnel. WireGuard sends the packets (encapsulated in UDP) to the target IP address and does not perform any active connection management.
With this connectionless approach, using WireGuard VPNs results in fewer disconnects, faster reconnections in cases of disconnect, and easy reconnection if the device’s IP address has changed (roaming). The latter case significantly improves the experience of users who often move between locations, such as remote workers who might need to access the VPN at home, at a café, and in the office—all within a single workday.
WireGuard’s roaming also improves the experience for mobile device users whose IP address might change as the result of their devices connecting to different cell towers.
IPsec takes a more traditional approach to connection management: most IPsec VPN clients require users to connect to an IPsec server to use the VPN. An IPsec connection can become stuck if the client and the server can’t communicate for a short period of time, and reestablishing the connection takes time and affects end users’ productivity.
Firewalls also present a problem to IPsec. Allowing IPSec to pass through firewalls and dealing with NAT requires additional configuration steps, which adds complexity to the implementation of a secure VPN. WireGuard was built with firewalls in mind, and it is simpler to connect to WireGuard endpoints from behind a firewall or a NAT — like within home environments and with public Wi-Fi hotspots.
### [Platform availability](#platform-availability)
IPsec has been around since 1995, with the first draft standard for the protocol being [RFC 1825](https://datatracker.ietf.org/doc/html/rfc1825). IPsec today is built into many common operating systems, from Windows and Linux to iOS and Android.
IPsec implementations also exist inside major routers, including Cisco and Juniper. Some routers offer hardware acceleration for IPsec traffic through chips like [NVIDIA’s BlueField](https://docs.mellanox.com/display/BlueFieldSWv36011699/IPsec+Functionality) digital processing unit for faster performance with thousands of simultaneous connections. If your use case involves Internet of Things (IoT) devices, you will likely find a supported IPsec implementation.
The WireGuard protocol was developed more recently, and while it is already available on all major platforms, including being [part of the Linux kernel](https://lists.zx2c4.com/pipermail/wireguard/2020-March/005206.html), it is not supported natively on iOS nor on Android (yet!). You can, however, use WireGuard on these platforms through the WireGuard iOS and Android apps. Depending on your configuration, WireGuard connections made via iOS and Android apps may use more energy and offer inferior performance versus comparable IPsec connections.
Some older operating systems, IoT devices and embedded systems may not support a WireGuard implementation. If your requirements include, say, an embedded chip you may be able to use IPsec but not WireGuard, unless you decide to implement the WireGuard protocol yourself from scratch.
IPsec and WireGuard VPNs are comparable performance-wise across most platforms, with WireGuard being slightly faster. WireGuard itself has conducted an in-depth performance [study](https://www.wireguard.com/performance/), comparing the throughput and latency in IPsec and WireGuard connections with similar encryption options on a powerful Linux computer. The WireGuard connection shows an approximately 15% higher throughput and 20% lower latency than IPsec.
### [Which one is right for you?](#which-one-is-right-for-you)
WireGuard is a more modern, simpler VPN protocol than IPsec, as well as being more secure by default.
As of 2021, most operating systems support WireGuard through a kernel-based implementation. We recommend WireGuard for most VPN use cases like enabling employee access to private infrastructure behind the firewall and facilitating connections between employee machines for collaboration. Thanks to its versatility, Tailscale’s VPN-as-a-service offering uses WireGuard under the hood.
The IPsec protocol is suitable for environments where regulation, legacy operating systems or IoT devices dictate what legacy encryption methods, or encryption methods not supported by WireGuard, should be used.
The complexity of IPsec configurations means more work for both the user and administrator to set up and maintain secure VPN connections, so unless you fall into one of the categories we mentioned above, WireGuard is the better VPN choice for establishing private network connections between businesses and employees.
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)