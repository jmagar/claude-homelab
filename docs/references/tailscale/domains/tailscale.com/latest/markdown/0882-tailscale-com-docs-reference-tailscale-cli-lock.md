tailscale lock command · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# tailscale lock command
Last validated: Jan 5, 2026
`tailscale lock` manages [Tailnet Lock](/docs/features/tailnet-lock) for your tailnet.
```
`tailscale lock \<subcommand\> [flags] \<args\>
`
```
Subcommands:
* [`init`](#lock-init) Initializes Tailnet Lock.
* [`status`](#lock-status) Outputs the state of Tailnet Lock.
* [`add`](#lock-add) Adds one or more trusted signing keys to Tailnet Lock.
* [`remove`](#lock-remove) Removes one or more trusted signing keys from Tailnet Lock.
* [`sign`](#lock-sign) Signs a node key and transmits the signature to the coordination server.
* [`disable`](#lock-disable) Consumes a disablement secret to shut down Tailnet Lock for the tailnet.
* [`log`](#lock-log) Lists changes applied to Tailnet Lock.
* [`local-disable`](#lock-local-disable) Disables Tailnet Lock for this node only.
* [`revoke-keys`](#lock-revoke-keys) Retroactively revoke one or more Tailnet Lock keys.
Running `Tailnet Lock` with no subcommand and no arguments is equivalent to running [`tailscale lock status`](#lock-status).
Example:
```
`tailscale lock
`
```
Example output:
```
`Tailnet Lock is ENABLED.
This node is accessible under Tailnet Lock.
This node's tailnet-lock key: tlpub:1234abcdef
Trusted signing keys:
tlpub:1234abcdef (us)
`
```
## [lock init](#lock-init)
Initializes [Tailnet Lock](/docs/features/tailnet-lock) for the entire tailnet.
```
`tailscale lock init [flags] \<tlpub:trusted-key1 tlpub:trusted-key2 ...\>
`
```
Available flags:
* `--confirm=false` Whether to prompt for confirmation. If `true`, there is no prompt for confirmation.
* `--gen-disablement-for-support` Generate an additional disablement secret and transmit it to Tailscale support. Tailscale support can then use it to disable Tailnet Lock. Note that if Tailscale support disables Tailnet Lock, it will remain disabled and Tailscale support cannot re-enable it, so this would be considered an emergency recovery mechanism, not a temporary disabling of Tailnet Lock.
* `--gen-disablements \<N\>` Number of disablement secrets to generate. If not specified, defaults to one disablement secret, which is the minimum required to initialize Tailnet Lock.
The Tailnet Lock keys specified are those initially trusted to sign nodes or to make further changes to your Tailnet Lock configuration. These are Tailnet Lock public keys. You can identify the Tailnet Lock key for a node you wish to trust by running `tailscale lock` on that node and then copying the node's Tailnet Lock key.
You must specify the Tailnet Lock key for the node where you are running `tailscale lock init` as one of the trusted Tailnet Lock keys. The list of additional keys must be space-separated.
The disablement secrets are displayed only when you initialize Tailnet Lock. Make note of them and secure them in a safe place.
Example:
```
`tailscale lock init --gen-disablements=3 --gen-disablement-for-support \\
--confirm tlpub:1234abcdef
`
```
Example output:
```
`You are initializing Tailnet Lock with the following trusted signing keys:
- tlpub:1234abcdef (25519 key)
3 disablement secrets have been generated and are printed below. Take note of them now, they WILL NOT be shown again.
disablement-secret:ABC1234
disablement-secret:DEF5678
disablement-secret:GHI9012
A disablement secret for Tailscale support has been generated and will be transmitted to Tailscale upon initialization.
Initialization complete.
`
```
The disablement secrets are long passwords needed to disable your Tailnet Lock. Refer to the [`tailscale lock disable`](#lock-disable) command for more information.
The number of disablement secrets will be the value you specified for `--gen-disablements`. If you set `--gen-disablement-for-support`, you'll receive a message about a disablement secret being generated for Tailscale support.
## [lock status](#lock-status)
Outputs the state of Tailnet Lock. The command shows whether Tailnet Lock is enabled, the value of the node's Tailnet Lock public key, and which nodes are locked out by Tailnet Lock and cannot connect to other nodes.
```
`tailscale lock status [flags]
`
```
Available flags:
* `--json` Return a machine-readable JSON response.
Example:
```
`tailscale lock status
`
```
Example output:
```
`Tailnet Lock is ENABLED.
This node is accessible under Tailnet Lock.
This node's tailnet-lock key: tlpub:1234abcdef
Trusted signing keys:
tlpub:1234abcdef (us)
`
```
If the node you run `tailscale lock status` on doesn't have an accessible key, the output will look like:
```
`This node is LOCKED OUT by tailnet-lock, and action is required to establish connectivity.
Run the following command on a node with a trusted key:
tailscale lock sign nodekey:abcdef12 tlpub:11223344
`
```
If one of your peer nodes is locked out of your tailnet, after the list of trusted signing keys, the output will look like:
```
` The following nodes are locked out by Tailnet Lock and cannot connect to other nodes:
bob.yak-bebop.ts.net. 100.111.222.33, fd7a:115c:a1e0:aabb:ccdd:eeff:0123:4567 n12345CNTRL
`
```
## [lock add](#lock-add)
Adds one or more trusted signing keys to Tailnet Lock.
This command needs to be run from a node with a trusted Tailnet Lock key.
```
`tailscale lock add \<tlpub:trusted-key1 tlpub:trusted-key2 ...\>
`
```
The Tailnet Lock keys specified are Tailnet Lock public keys. You can identify the Tailnet Lock key by running `tailscale lock` on that node and then copying the node's Tailnet Lock key.
The list of additional keys must be space-separated.
## [lock remove](#lock-remove)
Removes one or more trusted signing keys from Tailnet Lock.
This command needs to be run from a node with a trusted Tailnet Lock key.
```
`tailscale lock remove [flags] \<tlpub:trusted-key1 tlpub:trusted-key2 ...\>
`
```
Available flags:
* `--re-sign` Resign signatures which would be invalidated by removal of trusted signing keys. Defaults to true.
The Tailnet Lock keys specified are Tailnet Lock public keys. You can identify the Tailnet Lock key by running `tailscale lock` on that node and then copying the node's Tailnet Lock key.
The list of additional keys must be space-separated.
## [lock sign](#lock-sign)
Performs signing operations. `tailscale lock sign` has two signing modes:
* Signs a node key using the Tailnet Lock key on the current node (the node where the command is running), and transmits the signature to the coordination server.
* Signs a [pre-approved auth key](/docs/features/access-control/auth-keys), printing it in a form that can be used to bring up nodes under [Tailnet Lock](/docs/features/tailnet-lock). Specifically, it [signs the auth key](/docs/features/tailnet-lock#add-a-node-using-a-pre-signed-auth-key) so it can authenticate a new node without needing to *then* sign the new node before adding it to the tailnet. Each signed auth key, also known as a wrapped auth key, embeds a signing key that can sign a new node or multiple nodes, until it has been [removed](#lock-remove).
Signing a node key is necessary to establish connectivity for nodes which are locked out by Tailnet Lock.
If any of the key arguments begin with `file:`, the key is retrieved from the file at the path specified in the argument suffix.
This command needs to be run from a node with a trusted Tailnet Lock key.
```
`tailscale lock sign \<node-key\> [\<rotation-key\>]
`
```
or
```
`tailscale lock sign \<auth-key\>
`
```
Examples:
This example demonstrates signing a node key, optionally using the node's Tailnet Lock key (`tlpub:trusted-key2`) to support key rotation.
```
`tailscale lock sign nodekey:1abddef1 tlpub:trusted-key2
`
```
This example shows signing an auth key. For this example, `$AUTH\_KEY` is an environment variable set to a [pre-approved](/docs/features/access-control/auth-keys#types-of-auth-keys) auth key that you [already generated](/docs/features/access-control/auth-keys#generate-an-auth-key).
```
`tailscale lock sign $AUTH\_KEY
`
```
The output from successfully running the command is a signed pre-approved auth key, which you can then use to [pre-approve a device](/docs/features/access-control/device-management/device-approval#pre-approve-devices-with-an-auth-key) in your tailnet.
When you create a signed auth key, a new trusted signing key gets created for it, which is added to the [tailnet key authority](/docs/features/tailnet-lock#tailnet-key-authority). The private key of the signing key gets encoded in the signed auth key. A signed auth key is equivalent to a private signing key on a signing node in your tailnet, and poses a risk to your tailnet if leaked. Even if the auth key is single-use, the signing key remains trusted until it's removed from the tailnet key authority.
For security best practices, we do not recommend using signed auth keys.
## [lock disable](#lock-disable)
Consumes the specified disablement secret to disable Tailnet Lock for the entire tailnet.
```
`tailscale lock disable \<disablement-secret\>
`
```
Disabling Tailnet Lock is a security-relevant operation—if the disablement procedure lacked authorization checks, a compromised control plane could trivially disable Tailnet Lock (and all its protections) to attack a tailnet as before. To avoid this, use of a disablement secret is required to globally disable Tailnet Lock.
Disablement secrets are long passwords generated during the process of enabling Tailnet Lock, when you ran [`tailscale lock init`](#lock-init). The key derivation function (KDF) derived value of each disablement secret is stored by each node's tailnet key authority (and hence known by every node in a tailnet), but the secret itself remains confidential until use.
When a disablement secret is used, the secret is distributed to all nodes in the tailnet. Each node can then verify the authenticity of the disablement operation by computing the KDF value of the secret, and comparing it to the stored KDF values in their tailnet key authority (TKA). If they match, then the node can be sure the disablement was authentic, and disable Tailnet Lock locally.
Once the specified `disablement-secret` secret is used, it has been distributed to all nodes in the tailnet and should be considered public.
If Tailnet Lock is re-enabled, new disablement secrets will be generated.
Example:
```
`tailscale lock disable disablement-secret:ABC1234
`
```
## [lock disablement-kdf](#lock-disablement-kdf)
Compute a disablement value from a disablement secret. This command is for advanced users only.
```
`tailscale lock disablement-kdf \<hex-encoded-disablement-secret\>
`
```
## [lock log](#lock-log)
List changes applied to Tailnet Lock.
```
`tailscale lock log [flags]
`
```
Available flags:
* `--json` Return a machine-readable JSON response.
* `--limit` Maximum number of changes to list. Defaults to 50.
Example:
```
`tailscale lock log
`
```
Example output:
```
`update 17310b8e655867d3973a72cd20bc7c21f81f7687b4e7911c285f2eb16df5df36 (checkpoint)
Disablement values:
- 1234abcd
- 9876aaaa
- c1d2e3f4
- 8f6e4d2c
Keys:
Type: 25519
KeyID: 1234abcdef
Votes: 1
`
```
## [lock local-disable](#lock-local-disable)
Disables Tailnet Lock for this node only.
```
`tailscale lock local-disable
`
```
This command disables Tailnet Lock for only the current node (the node where the command is running). If Tailnet Lock is disabled just for this node, the node will now accept traffic from other nodes that are locked out. It does not mean that the node can send or receive traffic from other nodes in the tailnet that are signed.
If you encounter a significant issue with Tailnet Lock for your entire tailnet and can't disable it with [`tailscale lock disable`](#lock-disable) (for example, if you can't locate your disablement secret), you could run `tailscale lock local-disable` on each of your nodes to make your tailnet in effect ignore Tailnet Lock.
## [lock revoke-keys](#lock-revoke-keys)
Retroactively revoke the specified Tailnet Lock keys.
This command needs to be run from a node with a trusted Tailnet Lock key.
```
`tailscale lock revoke-keys \<tlpub:key1 tlpub:key2 ...\> [flags]
`
```
Available flags:
* `--cosign=false` Continue the key revocation using the Tailnet Lock key on this device and the provided recovery command from another device with a trusted Tailnet Lock key that has run `tailscale lock revoke-keys`.
* `--finish=false` Finish the recovery process by transmitting the revocation.
* `--fork-from \<hash\>` (Advanced users only) Hash of the parent [authority update message](/docs/concepts/tailnet-lock-whitepaper#authority-update-messages-aums) (AUM) from which to rewrite the tailnet key authority state.
The Tailnet Lock keys specified are Tailnet Lock public keys. You can identify the Tailnet Lock key by running `tailscale lock` on that node and then copying the node's Tailnet Lock key.
The list of additional keys must be space-separated.
If you want to remove a key that has not been compromised, use the [`tailscale lock remove`](#lock-remove) command instead.
Revocation is a multi-step process that requires several signing nodes to co-sign the revocation. Each step uses the `tailscale lock revoke-keys` command.
1. Open a terminal on a signing node that does not have a compromised key.
2. Run the following command, where `\<tlpub:compromised-key1 tlpub:compromised-key2\>` is a space-separated list of the keys that you want to revoke:
```
`tailscale lock revoke-keys tlpub:compromised-key1 tlpub:compromised-key2
`
```
The output of this command contains a `tailscale lock revoke-keys --cosign` command, which you will use in the next step.
3. On another trusted signing node, run the `tailscale lock revoke-keys --cosign` command. The output of this command contains a new `tailscale lock revoke-keys --cosign` command. Repeat this process, always using the new output from each `--cosign` command, until the number of times you used `--cosign` exceeds the number of revoked keys. For example, if you revoked 3 keys, you need to run the `tailscale lock revoke-keys --cosign` command 4 times.
4. Finish the process by running the command that was output from the last use of `--cosign` **except** replace `--cosign` with `--finish`:
```
`tailscale lock revoke-keys --finish \<hex-data\>
`
```
By default, Tailscale will determine the appropriate point in the Tailnet Lock log to fork. If more signing nodes agree that a key should be revoked than not, then the keys in the fork that Tailscale determined to still be trusted are then used instead of the revoked keys.
If the majority of signing nodes are compromised, you can [disable](/docs/features/tailnet-lock#disable-tailnet-lock) and then [re-enable](/docs/features/tailnet-lock#enable-tailnet-lock) Tailnet Lock itself.
On this page
* [lock init](#lock-init)
* [lock status](#lock-status)
* [lock add](#lock-add)
* [lock remove](#lock-remove)
* [lock sign](#lock-sign)
* [lock disable](#lock-disable)
* [lock disablement-kdf](#lock-disablement-kdf)
* [lock log](#lock-log)
* [lock local-disable](#lock-local-disable)
* [lock revoke-keys](#lock-revoke-keys)
Scroll to top