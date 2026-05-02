Post-quantum cryptography · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Post-quantum cryptography
Last validated: May 2, 2025
Post-quantum cryptography (PQC) is cryptography designed to withstand key exchange attacks that could be possible from adversaries with access to quantum computers. At a high level, quantum computers could be used to break asymmetric cryptography. Symmetric cryptography is not affected.
Standards for post-quantum asymmetric cryptography are just starting to emerge. An example is [Module-Lattice-Based Key-Encapsulation Mechanism](https://csrc.nist.gov/pubs/fips/203/final) (ML-KEM, formerly known as Kyber). Some companies (like major browser vendors) are early in the process of using ML-KEM in their Transport Layer Security (TLS) implementations to mitigate future risk of an adversary having a quantum computer.
## [PQC and WireGuard](#pqc-and-wireguard)
During the handshake between two connecting devices, WireGuard, like many other protocols, uses asymmetric cryptography to negotiate a per-connection symmetric key. The rest of the connection is then encrypted by using the symmetric key, with periodic rotation of the symmetric key. If an adversary can break the asymmetric key during the negotiation phase, they can decrypt the rest of the connection data.
WireGuard's design doesn't provide the ability to change symmetric/asymmetric algorithms that both sides of the connection agree on. Specifically, as mentioned in [WireGuard: Next Generation Kernel Network Tunnel](https://www.wireguard.com/papers/wireguard.pdf), WireGuard intentionally avoids protocol agility. As a result, Tailscale cannot use ML-KEM in WireGuard directly, as it would be just a different new protocol.
In theory, an adversary's use of quantum computers could determine the symmetric key exchanged during the handshake. To mitigate this threat, one solution suggested by WireGuard's creator is to use the optional pre-shared key (PSK) feature that is already present in the WireGuard protocol. It involves both peers of a connection mixing in the same symmetric key (configured separately ahead of time) into the asymmetric handshake. Because symmetric cryptography is not considered at risk from quantum computers, the use of the PSK protects the handshake and therefore the rest of the WireGuard connection.
This presents a different challenge: generating and distributing unique PSKs to WireGuard peers. The distribution step should use some PQC mechanism, like a TLS connection using ML-KEM.
## [PQC and Tailscale](#pqc-and-tailscale)
Tailscale builds on top of WireGuard by adding automatic mesh configuration, single sign-on (SSO), NAT traversal, TCP transport, and centralized [access control policies](/docs/features/access-control).
Today, Tailscale's WireGuard implementation is not post-quantum secure and does not use PSKs. There is also no way for Tailscale users to configure PSKs manually.
Eventually, we intend to build automatic PSK provisioning and distribution to devices. This should allow us to make Tailscale post-quantum secure out of the box in the future.
On this page
* [PQC and WireGuard](#pqc-and-wireguard)
* [PQC and Tailscale](#pqc-and-tailscale)
Scroll to top