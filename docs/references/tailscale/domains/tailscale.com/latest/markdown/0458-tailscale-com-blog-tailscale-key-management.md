Key Management Characteristics in the Tailscale Control Protocol
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|March 04, 2021
# Key management characteristics of the Tailscale Control Protocol
Tailscale is split into a control plane and a data plane. The data plane is built out of direct WireGuard links that provides end-to-end encryption between any two machines on the network. The control plane is responsible for verifying the identity of users, validating machine keys, and delivering the public keys of peers to each machine in the network. This document focuses on the management of keys in the control plane. For a broader overview of Tailscale, see [“How Tailscale Works.”](/blog/how-tailscale-works)
#### Machine Keys
Every machine the Tailscale client is installed on first generates a curve25519 machine private key. The control plane’s coordination server advertises its own 25519 public key (verified by the client with a public TLS certificate, optionally pinned). The client and control server then communicate via ECDH, specifically using small NaCl crypto\_box messages.
A common machine key policy is to require pre-authorization. Attempts to join a Tailscale network requiring machine authorization must first have the machine approved by the network administrators or automated policy check.
The ECDH crypto\_box handshake proves to the server that the client holds a specific machine private key and lets the server impose policies based on it.
#### Node Keys
On login, clients generate a node private key. This is a separate curve25519 key from the machine key. The public component of the key is transmitted to the control server and linked to a particular machine key.
The control server ties a node key to a specific identity. It does this in the general case by generating a unique authentication URL for a node key and sending it back to the client, requiring an end user to go through an interactive flow in a web browser. This typically results in an OAuth2 or SAML flow with an organization’s identity provider, and can include a multi-factor authentication (MFA) step. The control server ties a node key to a human identity, and can apply policy to determine how the key may be used.
The public node key is used to configure WireGuard peers. It is distributed to every machine the node is allowed to communicate with. Revocation messages are delivered the moment the key is automatically rotated or manually disabled.
Under certain policy settings, clients can regenerate node keys at will and replace old node keys by proving ownership of both. The control server can also require that a key be regenerated at a regular interval, acting as regular [key rotation](/blog/rotate-ssh-keys/) that adds significant difficulty to extracting credentials from compromised clients.
#### Network Maps
Once authorized, a client maintains a long-poll HTTPS request to the control server allowing rapid network updates. As a result, key authorizations and deauthorizations are essentially instantaneous network-wide, except in the case of a partial network failure that partitions the clients from the control server, in which case keys can be cached for a few hours.
The network map sent to clients includes only the relevant elements of the network relevant to that client, that is, only the machines that the user or the machine’s tag are permitted to communicate with.
#### TLS
The negotiation of machine and node keys happens entirely over TLS to ensure maximum compatibility on networks that strictly proxy all connections. This eases certification burdens in organizations that require all traffic be TLS.
① ECDH exchange over TLS
② Begin interactive auth
③ OAuth2 or SAML
④ Auth complete, network info
When interactive user authentication is required, the Tailscale client presents a Control server URL to the user in their machine’s preferred web browser, and an OAuth2 or SAML flow is done over TLS.
#### Distributed Firewall
The network map sent from the control server to individual Tailscale clients includes a list of IP:port filter rules. These filter rules control which peers are allowed to connect to the machine and limit the services exposed. This list is derived from the Tailscale [network ACLs](/kb/1018/acls). Firewall rules can be specified by the network administrator in terms of machine tags and user groups, with the Tailscale control server compiling this into a custom set of filter rules for each machine in the network.
User groups can be manually configured by network administrators in the control server or automatically imported from the organization’s identity service provider.
Machine tags can be set by users whose roles provide the appropriate capabilities when going through the client authorization process.
These policy tools let network administrators define their network in terms of high-level concepts, organizational units and people. By compiling these objects down to a simple IP:port filter list in the control server, these complex policy decisions are kept out of the Tailscale client and control protocol, providing clear separation of concerns.
Share
Author
David Crawshaw
Author
David Crawshaw
Share
Loading...
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)