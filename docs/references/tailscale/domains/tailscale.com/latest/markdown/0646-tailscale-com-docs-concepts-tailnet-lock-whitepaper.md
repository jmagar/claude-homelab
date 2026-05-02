Tailnet Lock white paper · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailnet Lock white paper
Last validated: Jan 5, 2026
## [Abstract](#abstract)
Modern VPNs have made a lot of progress, when compared to legacy VPNs, in reducing the attack surface of the network. Adopting principles of zero trust, using modern cryptography for end-to-end encryption, and facilitating direct peer-to-peer connections also mean that VPN providers can no longer intercept unencrypted data plane traffic. While this architecture establishes secure and independent connections outside the VPN's control plane, the control plane is still necessary to exchange keys between users and endpoints — which means that a compromised control plane could read or write traffic by distributing attacker-generated keys.
To address this latent vulnerability, Tailscale has implemented a [Tailnet Lock](/docs/features/tailnet-lock) — a novel mechanism to prevent a compromised control plane from inserting itself into a network. Tailnet Lock adds another layer of security, requiring a user-controlled cryptographic signature for all WireGuard® node keys distributed by Tailscale's coordination server.
Each tailnet has a locally-managed key authority, which keeps track of permitted signing keys and processes validly signed requests to make changes. Signing keys are verified by the locally-managed key authority, and are never seen or stored by the control plane. This means the control plane cannot change or disable the set of permitted signing keys to insert a new node into a network without being detected.
## [Introduction](#introduction)
To transfer data between two nodes in a Tailscale network (a *[tailnet](/docs/concepts/tailnet)*), the Tailscale client establishes a [WireGuard®](https://www.wireguard.com) session (tunnel) between the two nodes, over which private network traffic traverses. These sessions are authenticated and subsequently encrypted based on the node's key pair — an X25519 public key which is unique for each node and used to establish these data connections. Connections between nodes are peer-to-peer (the *data plane*), and are distinct from the key distribution and settings for a tailnet, which are managed by Tailscale's coordination server (the *control plane*).
To establish these sessions, the data plane needs information about peer nodes in the tailnet. This includes information like the IP addresses the node can be contacted on, packet filtering rules applied to traffic originating from the node, and the node's public key which is needed to set up an authenticated WireGuard session. Dependence on information from the control plane — and in particular other nodes' public keys — creates a need to trust the control plane. Otherwise, a compromised or malicious control plane could broadcast nodes with attacker-controlled keys, and send or receive network traffic in plaintext.
## [Context](#context)
This section provides context and additional information about the issue Tailnet Lock is designed to address.
### [Design goal](#design-goal)
Tailnet Lock was designed to achieve a singular principle:
>
> Tailscale infrastructure cannot add an unauthorized node to a tailnet with Tailnet Lock enabled, and any attempt to do so can be detected and blocked.
>
Tailscale's control plane is responsible for a lot of different things — ranging from handling logins and interpreting access control policies to computing packet filters, and so on — but its most critical function, related to the security of a tailnet, is the distribution of node keys. By making it impossible for the control plane to unilaterally distribute node keys, Tailnet Lock eliminates the possibility of nodes surreptitiously joining a tailnet to send or receive unencrypted network traffic.
### [Assigning trust for key distribution](#assigning-trust-for-key-distribution)
With Tailnet Lock enabled, each node verifies and enforces that the other nodes' public keys (as announced by the control plane), are accompanied by a valid cryptographic signature from a trusted source. Node keys that fail signature verification are not accepted, and cannot establish a WireGuard session — effectively preventing the node from accessing the data plane and observing or intercepting tailnet traffic.
This approach, however, raises a new set of challenges: How do nodes know which keys are authorized to sign node keys, and how can this information be updated in a way that can't be tampered with by the control plane? Addressing these challenges forms the bulk of Tailnet Lock's design.
## [Components of Tailnet Lock](#components-of-tailnet-lock)
This section covers each component of Tailnet Lock.
At a high level, here's how the components of Tailnet Lock all work together: When Tailnet Lock is enabled, a set of existing Tailnet Lock keys is identified as trusted. Disablement secrets are generated, and a cryptographic derivation of these secrets are passed to all nodes. Each node in a tailnet keeps track of these keys and secrets in a local tailnet key authority. New nodes added to the tailnet must be signed by one of these trusted Tailnet Lock keys, and verified locally by each node. Changes to the set of trusted Tailnet Lock keys are sent with an authority update message, which must also be signed by a trusted Tailnet Lock key, and again, verified locally by each node. To disable Tailnet Lock, a disablement secret must be passed to each node, and validated against its local disablement secret derivations.
### [Tailnet Lock keys](#tailnet-lock-keys)
Tailnet Lock introduces a new set of keys — *Tailnet Lock keys (TLKs)* — to be used in the operation of Tailnet Lock. These are generated by every node on first startup, but not every node's TLK needs to be trusted. An initial set of trusted TLKs is specified by the administrator when Tailnet Lock is enabled, and trusted TLKs can be added or revoked at any time.
TLKs are Ed25519 keys, which are used to sign new node keys (used for WireGuard sessions) and changes to Tailnet Lock configuration.
The private key of each TLK is stored on the node that generated it, and a copy of each trusted public TLK is stored in the tailnet key authority (described in the next section [The tailnet key authority](#the-tailnet-key-authority)). In addition, each key has a *weight* associated with it, which is used to determine which update to apply when multiple update messages are conflicting (described in [Processing forking updates](#processing-forking-updates)).
### [The tailnet key authority](#the-tailnet-key-authority)
To keep track of the current set of trusted TLKs, a *tailnet key authority (TKA)* subsystem runs within each node. By knowing the current set of trusted TLKs, TKA is able to verify signatures in two situations:
1. Verifying node key signatures before adding node keys to its list of peers, and
2. Verifying signatures for requests to change the set of trusted TLKs before processing those changes.
When a node starts up, it checks if it has stored a TKA state from a previous run, that is, if Tailnet Lock has been enabled in the tailnet. If the node does have a TKA state, it computes the current set of trusted TLKs, and requires valid node key signatures on all peers to configure WireGuard sessions with them.
The control plane relays authority update messages to each node, which verifies and processes updates to its local tailnet key authority.
While a node is running, it processes update messages relayed by the control plane in real-time, such as changes to peers and changes to the TKA. Changes to the set of trusted TLKs are sent in *authority update messages (AUMs)*. AUMs must be signed by a trusted TLK so they cannot be tampered with by a compromised control plane, and must be validated against an intensive set of validation rules before they are applied to the state machine (described in [Validation](#validation)).
### [Authority update messages (AUMs)](#authority-update-messages-aums)
The main driver of information within Tailnet Lock are authority update messages (AUMs): signed messages describing either the initial state of Tailnet Lock (the *genesis update*), or some change to a previous state (a *delta update*).
AUMs only contain information about changes to Tailnet Lock state, including enabling Tailnet Lock and adding or removing trusted TLKs. While node key signatures are also created with TLKs and distributed by the control plane, they are distinct from AUMs.
With the exception of the genesis update, all AUMs reference the hash of the previous update. This forms a chain of blocks describing a sequence of strongly ordered changes: in a way that's similar to Git and other distributed ledgers.
Each authority update message embeds the hash of the preceding authority update message. The first authority update message is the genesis update.
As each AUM embeds the hash of the preceding AUM, the hash of the latest AUM is sufficient to describe the current state (in the same manner that a commit hash is sufficient to describe the current state of a Git branch). Borrowing Git nomenclature, we say the current state of a TKA is its *HEAD* (AUM hash).
#### [Processing incremental updates](#processing-incremental-updates)
When the user wishes to make changes to the parameters of Tailnet Lock, such as adding a new trusted TLK, their node generates an AUM describing the change. This AUM is signed by a trusted TLK, and encodes the HEAD of the TKA as the hash of the previous update.
An incremental authority update message encodes the HEAD of the tailnet key authority as the hash of the previous update, to build upon the latest Tailnet Lock state.
The control plane then relays this update to all nodes in the tailnet. Each node validates the AUM and applies the update. Nodes that have processed the AUM are now at the same state of trusting the newly added TLK; and being at the same state, have the same HEAD.
#### [Validation](#validation)
AUMs are validated prior to being processed. Validation includes two steps: verifying that the AUM is signed, and verifying the AUM is well formed.
AUMs must be signed by an already trusted TLK, that is, a TLK trusted at the state immediately preceding the current AUM. This signature verification is done as early as possible to preclude any security-relevant bugs in later validation logic and significantly reduce the code paths available to a potential attacker, as they would need to possess a trusted TLK to proceed.
Next, AUMs are verified to be well formed. A well formed AUM is validated as unambiguously describing a change to Tailnet Lock state. The exact semantics vary depending on the type of update message (for example, enable Tailnet Lock, add key, remove key). Specific message validation rules include:
* All AUMs, except the genesis AUM, must reference the hash of a known parent AUM.
* Remove key AUMs must reference a key that is present in the key authority, and must not remove all keys from the Tailnet Lock authority.
* Add key AUMs must completely specify the public parameters of the key being added, and must not add a key which is already trusted.
* The genesis AUM must specify at least one disablement secret and at least one key, and keys or disablement secrets cannot be duplicative.
#### [Processing forking updates](#processing-forking-updates)
The previous section [Processing incremental updates](#processing-incremental-updates) described a simple scenario in which a new key was added. This change is conveyed by a single AUM representing the new key, being applied to the latest state. While this is the common case, updates which build upon a much earlier update (that is, the AUM hash they reference as the previous AUM is not the head hash of the TKA) are also allowed. This mechanism enables recovery from malicious updates signed by a compromised TLK (refer to [Recovering from a Tailnet Lock key compromise](#recovering-from-a-tailnet-lock-key-compromise)).
A chain of authority update messages can fork to form multiple branches.
When this happens, the AUMs descending from a common ancestor form multiple branches. AUMs must form a single chain of updates, so when branching occurs, one branch needs to be deterministically chosen and the remaining branches discarded. The remainder of this section describes the algorithm by which this occurs.
Each trusted TLK is assigned a weight, which is used as part of this computation.
All nodes follow the same rules to decide which branch to take. For each set of updates that form a fork:
1. Sum the weights associated with each key signing an AUM. (As mentioned earlier, weights are an integer associated with each key for the purpose of resolving forking updates.) The AUM with the greatest sum is chosen as the next update.
>
> For example, if there are two AUMs, AUM A and AUM B, with the same parent AUM hash, both are candidates to be the next AUM processed. If AUM A has two signatures, where the key weight of the key associated with each signature is 1 and 3 respectively, then the sum of key weights for AUM A is 4. If AUM B only has a single signature, and the weight of the key associated with that signature is 1, then the sum of key weights for AUM B is 1. In this case, AUM A would be chosen as the next AUM because it has a higher combined key weight: 4 is greater than 1.
>
If the key weight sums are equal, the algorithm applies the next rule.
2. Prefer AUMs that describe the removal of keys.
>
> For example, if two candidate AUMs A and B have message types AddKey and RemoveKey respectively, then AUM B would be chosen as the next AUM because it contains the message type RemoveKey.
>
If neither or both AUMs are of type RemoveKey, the algorithm applies the final rule.
3. Finally, choose the AUM whose hash is lower when expressed as an integer.
Given the properties of our digest function BLAKE2, comparing the hashes of forking AUMs is a complete and deterministic tiebreaker, which means all nodes choose the same AUM to process.
Each node iteratively 'walks' the chain of updates, deciding at each update in the chain which branch to take based on the above rules (and ignoring the other branches). This process repeats until there are no known AUMs whose parent AUM hash matches that of the previous AUM applied; this occurs when we've reached the end of the chain and are up to date.
### [Disablement secrets](#disablement-secrets)
Disabling Tailnet Lock must require authorization — if the disablement procedure lacked authorization checks, a compromised control plane could trivially disable Tailnet Lock (and all its protections) to attack a tailnet. To avoid this, the use of a *disablement secret* is required to globally disable Tailnet Lock.
Disablement secrets are long passwords generated during the process of enabling Tailnet Lock. Multiple disablement secrets can be generated. Argon2 is used as a key derivation function (KDF).
The derived value of each disablement secret is stored by each node's TKA, and hence known by every node in a tailnet. By virtue of being stored as a derived value, the secret itself remains confidential until use — so each node can validate and process a disablement secret, without needing to know the secret itself.
When a disablement secret is used, the secret is made public and distributed to all nodes in the tailnet. Each node can then verify the authenticity of the disablement operation by computing the KDF of the secret, and comparing it to the stored KDF values in their TKA. If they match, the node can be sure the disablement is authentic and then disable Tailnet Lock locally.
### [Lock state ID](#lock-state-id)
When Tailnet Lock is first enabled, a randomly-generated nonce is stored in the Tailnet Lock state. This nonce is static for the tailnet and is known to both the coordination server and all nodes within the tailnet, but is not discoverable to shared nodes or any observer.
This state ID is used as the HMAC key when creating and validating application deep link URLs which power the **Sign node** button on the admin console. In addition to requiring confirmation of the action at the link, this mechanism helps ensure that someone outside the tailnet cannot generate a deep link URL or QR code and use it to phish someone within the tailnet.
## [Cryptography](#cryptography)
This section gives an overview of the cryptography used in Tailnet Lock, and why it was chosen.
In designing Tailnet Lock, we wanted to use modern, stable cryptography. To that end, we chose to use the following primitives.
### [BLAKE2 is used for generating digests of AUMs](#blake2-is-used-for-generating-digests-of-aums)
Tailnet Lock generates digests of Tailnet Lock state changes using [BLAKE2](https://www.blake2.net). These hashes are used to describe authority update messages (in the same manner that a commit hash in Git describes a specific change in a repository). BLAKE2 was chosen due to its status as a proven replacement for older hash functions (such as SHA1), with reasonable security properties (preimage resistance and indifferentiability) and speed.
### [Ed25519 keys are used for signing operations](#ed25519-keys-are-used-for-signing-operations)
[Ed25519](https://ed25519.cr.yp.to) is an elliptic curve signature scheme, well known for its small key size, fast signing and signature verification, and resistance to a number of potential attacks or implementation errors. Tailnet Lock keys are Ed25519 key pairs, and are used both to sign node keys and sign AUMs.
### [ZIP215 semantics are used for signature validity](#zip215-semantics-are-used-for-signature-validity)
Existing RFCs and implementations [do not implement identical verification rules](https://hdevalence.ca/blog/2020-10-04-its-25519am) for Ed25519 signatures, a critical property necessary to avoid divergence in distributed mechanisms such as Tailnet Lock. As such, Tailnet Lock verifies signatures using an implementation of the more tightly specified [ZIP215 rules](https://zips.z.cash/zip-0215), which is necessary to ensure consensus. Tailnet Lock signatures are not malleable.
### [Argon2 is used as the disablement secret key derivation function](#argon2-is-used-as-the-disablement-secret-key-derivation-function)
The KDF-derived value of a disablement secret is known to all nodes, as they must be able to validate a disablement secret. As such, the value needs to be infeasible to reverse the KDF-derivation of a disablement secret, or malevolent actors could compute the value and use it to disable Tailnet Lock.
Disablement secrets are 32 bytes of data sourced from the system CSPRNG. [Argon2](https://github.com/P-H-C/phc-winner-argon2) is used as the KDF due to its good preimage properties and resistance to tradeoff attacks. Given the use of 32-byte random secrets, Argon2 is likely overkill, as a single cryptographic hash like BLAKE2 would probably be sufficient. Argon2 is still helpful in case a disablement secret with low entropy is used.
### [CBOR2 is used to encode signatures and update messages](#cbor2-is-used-to-encode-signatures-and-update-messages)
While not strictly a cryptographic primitive, the choice of encoding has integral security implications and is therefore discussed here.
The main function of node key signatures and authority update messages is to carry signed data. Cryptographic signatures are over digests, so the serialized representation must be deterministic. Issues with other encodings (such as JWS/JWT, SAML, or X509) has demonstrated that even subtle behaviors (such as how you handle invalid, unsupported, or unrecognized fields, as well as invariants in subsequent re-serialization) can easily lead to security-relevant logic bugs.
[CBOR2](https://pypi.org/project/cbor2) is one of the few encoding schemes that are appropriate for use with signatures and has security-conscious parsing and serialization rules baked into the specification. Tailnet Lock uses the CTAP2 mode, which is well understood and widely-implemented, and already proven for use in signing assertions by its use in FIDO2 devices.
## [User flows within Tailnet Lock](#user-flows-within-tailnet-lock)
This section walks through the user flows that occur in Tailnet Lock, and explains what happens at each step.
### [Enabling Tailnet Lock](#enabling-tailnet-lock)
When an administrator wishes to enable Tailnet Lock, they go through the enablement flow on one of their nodes (with the [`tailscale lock init`](/docs/reference/tailscale-cli#lock) command). As part of this process, the admin enumerates the set of TLKs they wish to trust, as well as the number of disablement secrets they would like to generate.
The node then performs a number of steps:
1. The node first generates and displays the specified number of disablement secrets. These are secrets, so they will not be stored or shown again — the administrator must make careful note of the disablement secret values.
2. The node generates an AUM to describe the new (enabled) state of Tailnet Lock. This message is signed by the node's own TLK, and describes all the initial parameters of Tailnet Lock, including the set of initially trusted TLKs and values needed for disablement.
3. The node receives a list of all node keys in the tailnet from the control plane, which it then signs using its TLK. This is done so that when Tailnet Lock is enabled, all existing nodes have a valid node key signature and connectivity is not lost.
4. Lastly, the initial AUM and the initial list of node key signatures are transmitted to the control plane for distribution.
The control plane then distributes the initial AUM and node key signatures to all nodes in the tailnet. Each node receives the AUM, uses it to bootstrap the initial state of its TKA, and then begins to enforce node key signatures for any new nodes added to the tailnet.
### [Signing node keys for new nodes](#signing-node-keys-for-new-nodes)
When a new node is added to a locked tailnet, it will lack a node key signature and hence other nodes in the tailnet will not communicate with it, that is, it is *locked out*. An administrator can sign the new node's node key with a trusted TLK (using the `tailscale lock sign` command) to allow it to make connections within the tailnet. This signature is then transmitted to the control plane and distributed to all nodes in the tailnet.
When a new node is added to the tailnet, it is signed by a trusted Tailnet Lock key, then distributed to peer nodes, which can verify the signature before allowing connections.
### [Disabling Tailnet Lock](#disabling-tailnet-lock)
When an administrator wishes to disable Tailnet Lock, they provide a valid disablement secret and perform the disablement flow on one of their nodes (with the `tailscale lock disable` command).
The node is able to verify the correctness of the disablement secret by comparing the KDF of the provided secret to stored values in the TKA. If correct, the node transmits the secret for distribution to all nodes.
Upon receiving the disablement secret, all nodes perform the same check, comparing the KDF of the disablement secret to a stored KDF value in their TKA. If a value matches, the node disables its TKA locally and reverts to an unlocked state.
### [Changing trusted Tailnet Lock keys](#changing-trusted-tailnet-lock-keys)
The set of trusted TLKs (signing keys) can be changed on any node with a current trusted TLK. Any such change (adding, removing, or changing parameters of a trusted TLK) follows the same flow:
1. The node generates and signs an AUM, which encodes details about the change. For instance, the process for adding a new trusted TLK would generate an AddKey AUM, which would encode the details of the new trusted TLK.
2. The generated and signed AUM is transmitted to the control plane for distribution. The control plane transmits the AUM to nodes in the tailnet.
3. Each node receives the AUM from the control plane, verifies its signature, performs validation of the update, and applies the change to its local tailnet key authority.
Before a new trusted Tailnet Lock key is added, it must be signed by an existing trusted Tailnet Lock key. The coordination server distributes the new key to all nodes in the tailnet, which can verify the signature before trusting it.
### [Recovering from a Tailnet Lock key compromise](#recovering-from-a-tailnet-lock-key-compromise)
If a node with a trusted TLK is compromised, the compromised key could be used to affect malicious changes to Tailnet Lock — such that an attacker could add new nodes to the tailnet, and receive or send plaintext traffic from those nodes. A competent attacker might go even further and remove all other trusted TLKs from the tailnet authority, in an attempt to gain exclusive control over the tailnet.
Recovering from this scenario involves rewriting the changelog of AUMs to erase the attacker-generated updates, and removing trust in the compromised TLKs. This can be done by first generating a draft forking update with the `tailscale lock revoke-keys` command, and signing the update using the `revoke-keys` command on enough nodes with trusted TLKs that the sum of key weights is greater than those of the key or keys compromised by the attacker.
The generated update forks the changelog to erase the attacker's changes by retroactively revoking the compromised TLKs, and any node key signatures made with those TLKs (refer to the [processing forking updates](#processing-forking-updates) section).
## [Limitations](#limitations)
### [Tailnet Lock protects against unauthorized nodes, not denial of service](#tailnet-lock-protects-against-unauthorized-nodes-not-denial-of-service)
Tailnet Lock aims to prevent a compromised control plane from manipulating your tailnet such as to send or receive traffic from malicious nodes. It does not prevent a compromised control plane from breaking connectivity in your network, such as by failing to distribute new node keys, or distributing an access control policy which denies access to all nodes.
To mitigate this risk, we could implement a way for nodes to share AUMs directly instead of relying on the control plane for distribution, or have nodes cache last known good netmaps for connectivity.
### [Enablement is Trust on First Use (ToFU)](#enablement-is-trust-on-first-use-tofu)
When Tailnet Lock is first enabled or a new node is added to the tailnet, each node relies on the initial state of Tailnet Lock sent to it from the control plane. If the control plane is compromised, a malicious initial state could be sent to each node with attacker-controlled TLKs. Similarly, if an already compromised node's TLK is trusted, the initial state sent to each node would include attacker-controlled TLKs.
To mitigate this risk, we could implement a mechanism where administrators can define the expected Tailnet Lock state, and devices will refuse to operate if the control plane attempts to provision them with an unexpected Tailnet Lock state. In the meantime, it is possible to verify the provisioned state of Tailnet Lock on each node by running the [`tailscale lock status`](/docs/reference/tailscale-cli/lock#lock-status) command.
On this page
* [Abstract](#abstract)
* [Introduction](#introduction)
* [Context](#context)
* [Design goal](#design-goal)
* [Assigning trust for key distribution](#assigning-trust-for-key-distribution)
* [Components of Tailnet Lock](#components-of-tailnet-lock)
* [Tailnet Lock keys](#tailnet-lock-keys)
* [The tailnet key authority](#the-tailnet-key-authority)
* [Authority update messages (AUMs)](#authority-update-messages-aums)
* [Processing incremental updates](#processing-incremental-updates)
* [Validation](#validation)
* [Processing forking updates](#processing-forking-updates)
* [Disablement secrets](#disablement-secrets)
* [Lock state ID](#lock-state-id)
* [Cryptography](#cryptography)
* [BLAKE2 is used for generating digests of AUMs](#blake2-is-used-for-generating-digests-of-aums)
* [Ed25519 keys are used for signing operations](#ed25519-keys-are-used-for-signing-operations)
* [ZIP215 semantics are used for signature validity](#zip215-semantics-are-used-for-signature-validity)
* [Argon2 is used as the disablement secret key derivation function](#argon2-is-used-as-the-disablement-secret-key-derivation-function)
* [CBOR2 is used to encode signatures and update messages](#cbor2-is-used-to-encode-signatures-and-update-messages)
* [User flows within Tailnet Lock](#user-flows-within-tailnet-lock)
* [Enabling Tailnet Lock](#enabling-tailnet-lock)
* [Signing node keys for new nodes](#signing-node-keys-for-new-nodes)
* [Disabling Tailnet Lock](#disabling-tailnet-lock)
* [Changing trusted Tailnet Lock keys](#changing-trusted-tailnet-lock-keys)
* [Recovering from a Tailnet Lock key compromise](#recovering-from-a-tailnet-lock-key-compromise)
* [Limitations](#limitations)
* [Tailnet Lock protects against unauthorized nodes, not denial of service](#tailnet-lock-protects-against-unauthorized-nodes-not-denial-of-service)
* [Enablement is Trust on First Use (ToFU)](#enablement-is-trust-on-first-use-tofu)
Scroll to top