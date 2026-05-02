Tailscale encryption · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale encryption
Last validated: Jan 7, 2026
[Tailscale's architecture](/blog/how-tailscale-works) provides end-to-end encryption for all network communications, whether devices [connect directly](/docs/reference/connection-types#direct-connections) or through a [relayed connection](/docs/reference/connection-types#relayed-connections)⎯regardless of whether they're on the same local network or across the globe. The architecture uses multiple layers of encryption across the control plane and data plane to secure device connections throughout your Tailscale network (known as a [tailnet](/docs/concepts/tailnet)).
The following sections explain Tailscale's use of encryption across the [control and data planes](#control-and-data-planes), [during NAT traversal operations](#device-discovery-and-nat-traversal), and throughout the [Tailscale ecosystem](#encryption-across-tailscale).
The information here represents the current implementation state as of **December 2024** and should not be interpreted as a commitment to maintain these exact mechanisms indefinitely. The cryptographic landscape continues to evolve, and Tailscale's implementations will likely adapt to incorporate new developments and address emerging security requirements.
## [Control and data planes](#control-and-data-planes)
The control and data planes are fundamental network components that work together to manage and execute network operations. Each plane has a distinct division of responsibilities to minimize the impact of security breaches and facilitate independent scalability. The [control plane](#control-plane) manages how data flows, which includes policy management, routing, resource management, and signaling (session management). The [data plane](#data-plane) executes instructions from the control plane. These include packet forwarding, packet processing, and traffic management. In effect, the control plane makes the decisions, and the data plane executes those decisions.
[Explore the control plane, data plane, and the coordination server](/docs/concepts/control-data-planes).
### [Control plane](#control-plane)
In Tailscale, the control plane performs many tasks, including device coordination, authentication, access control interpretation, and packet filter computation.
Control plane communication, which includes key exchange and coordinating device connections, employs a custom [Noise IK](https://noiseexplorer.com/patterns/IK/)-based protocol with [X25519](https://www.rfc-editor.org/rfc/rfc7748.html#section-5) as described in [RFC7748](https://www.rfc-editor.org/rfc/rfc7748.html). While it can operate directly over plain TCP in environments that allow it, it also supports being wrapped in TLS when necessary for compatibility or additional security requirements.
### [Data plane](#data-plane)
Tailscale's data plane uses [WireGuard](/docs/concepts/wireguard) as its primary mechanism to encrypt communication between Tailscale devices. For more about WireGuard's cryptographic design, refer to the [WireGuard white paper](https://www.wireguard.com/papers/wireguard.pdf).
Tailnet devices start out using a [DERP server](/docs/reference/derp-servers) to establish a connection, then transition to a direct connection if possible. If a direct connection isn't possible, devices fall back to a relayed connection using DERP servers. DERP servers never access your unencrypted data; they only handle WireGuard packets that are already encrypted.
The connection between devices and DERP servers are authenticated using a [NaCl box](https://pkg.go.dev/golang.org/x/crypto/nacl/box) construction on top of TLS to verify that clients own their claimed WireGuard keys. This ensures only devices with the correct private key can establish a connection with the DERP server.
## [Device discovery and NAT traversal](#device-discovery-and-nat-traversal)
[Tailscale's NAT traversal engine](/blog/how-nat-traversal-works) implements a custom UDP protocol for path discovery, using NaCl box for authenticated encryption. This protocol operates separately from the main WireGuard data plane, and can only influence the efficiency of connections, not the security of the data they carry.
## [Encryption across Tailscale](#encryption-across-tailscale)
Tailscale also uses encryption for authentication, [secure node state storage](#secure-node-state-storage), [certificates](#device-tls-certificates), and features like the [logging system](#log-system) and [Tailnet Lock](#tailnet-lock).
### [Secure node state storage](#secure-node-state-storage)
Tailscale devices can be configured to [secure node state storage](/docs/features/secure-node-state-storage) by using encryption.
### [Device TLS certificates](#device-tls-certificates)
Tailscale assists you with provisioning [TLS certificates](/docs/how-to/set-up-https-certificates#provision-tls-certificates-for-your-devices) from [Let's Encrypt](https://letsencrypt.org/) using hostnames within your [tailnet's MagicDNS domain](/docs/concepts/tailnet-name#tailnet-dns-name). These certificates ensure only authorized devices in your tailnet can present valid service identities for MagicDNS hostnames.
For example, a service advertising itself at `app.example-tailnet.ts.net` can only present a valid TLS certificate if it's an authorized device in your tailnet.
### [Tailnet Lock](#tailnet-lock)
The [Tailnet Lock](/docs/features/tailnet-lock) feature uses ED25519 signatures for authentication. While this feature doesn't involve encryption directly, it ensures that only devices authorized by designated approvers (which are not under Tailscale's control) can communicate with devices in your tailnet.
### [Log system](#log-system)
All Tailscale [log data](/docs/features/logging) is sent over TLS without additional authentication or encryption.
## [TLS and cryptography](#tls-and-cryptography)
Tailscale's [TLS (Transport Layer Security)](https://en.wikipedia.org/wiki/Transport_Layer_Security) implementation builds upon the Go [`crypto/tls`](https://pkg.go.dev/crypto/tls) package, requiring a minimum of TLS 1.2 while supporting TLS 1.3. The system uses the default cipher suite selection from the Go implementation, which includes ECDHE for [forward secrecy](https://www.eff.org/deeplinks/2013/08/pushing-perfect-forward-secrecy-important-web-privacy-protection) and AEAD schemes. The AEAD implementation can dynamically choose between AES-128-GCM or ChaCha20-Poly1305 based on the availability of hardware acceleration for AES operations.
## [Compliance](#compliance)
Tailscale's cryptographic implementations are not [FIPS](https://en.wikipedia.org/wiki/Federal_Information_Processing_Standards) compliant, and several of the primitive choices (including Curve25519, [XSalsa20](https://en.wikipedia.org/wiki/Salsa20), ChaCha20-Poly1305, and the Noise and WireGuard protocols) cannot be made compliant under current FIPS standards. While these implementations have been reviewed by cryptographers and are considered secure⎯in many cases, providing superior security to FIPS-approved alternatives⎯this might be a consideration for organizations requiring FIPS compliance. For more information, refer to [Tailscale FedRAMP and FIPS-140 considerations](/docs/reference/tailscale-fedramp-fips140).
On this page
* [Control and data planes](#control-and-data-planes)
* [Control plane](#control-plane)
* [Data plane](#data-plane)
* [Device discovery and NAT traversal](#device-discovery-and-nat-traversal)
* [Encryption across Tailscale](#encryption-across-tailscale)
* [Secure node state storage](#secure-node-state-storage)
* [Device TLS certificates](#device-tls-certificates)
* [Tailnet Lock](#tailnet-lock)
* [Log system](#log-system)
* [TLS and cryptography](#tls-and-cryptography)
* [Compliance](#compliance)
Scroll to top