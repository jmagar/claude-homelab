Node keys · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Node keys
Last validated: Jan 5, 2026
Node keys are cryptographic keys that authenticate and identify devices on your Tailscale network (known as a [tailnet](/docs/concepts/tailnet)). They are a fundamental component in Tailscale's security architecture, working alongside machine keys in a [multi-layered approach to secure your network](/blog/tailscale-key-management).
Tailscale uses node keys to authenticate devices, authorize access based on user identity and device status, and encrypt traffic between devices. When a device connects to Tailscale:
1. The device generates a private node key (separate from the machine key).
2. Tailscale sends the public component of the node key to the [coordination server](/docs/concepts/control-data-planes#coordination-server).
3. You complete authentication through your [identity provider](/docs/features/access-control/device-management/how-to/manage-identity) (such as OAuth 2.0 or SAML).
4. After authentication, the coordination server links the node key to both the specific device (machine key) and the user identity.
5. The coordination server validates the node key against your tailnet's [access control policies](/docs/features/access-control) to determine what resources your device can access.
6. The coordination server then distributes the public node key to other devices in the tailnet (based on your access control policies).
7. The device uses the key pair for [encrypted](/docs/concepts/tailscale-encryption) connections with other devices.
When an [Admin](/docs/reference/user-roles) [removes a device](/docs/features/access-control/device-management/how-to/remove) using the admin console, Tailscale immediately revokes its node key. Both authorization and revocation take effect almost instantly across your entire tailnet.
## [Machine keys vs. node keys](#machine-keys-vs-node-keys)
Tailscale uses [machine keys](/blog/tailscale-key-management#machine-keys) and node keys to manage device identity and device authorization. Machine keys identify physical devices to the Tailscale coordination server. Node keys authorize network access and enable secure connections between devices.
|Machine keys|Node keys|
|Generated when Tailscale is first installed|Generated each time a user authenticates|
|Identify the physical device|Tie the device to a user identity|
|Used for secure communication with the coordination server|Used for [WireGuard](/docs/concepts/wireguard) connections between devices|
|Cannot be rotated|Can be rotated regularly|
|Pre-authorization can be required|Automatically validated against access control policies|
On this page
* [Machine keys vs. node keys](#machine-keys-vs-node-keys)
Scroll to top