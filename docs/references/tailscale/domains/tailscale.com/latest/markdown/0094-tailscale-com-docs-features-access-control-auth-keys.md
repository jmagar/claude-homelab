Auth keys · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Auth keys
Last validated: Dec 4, 2025
Auth keys are available for [all plans](/pricing).
Pre-authentication keys (called auth keys) let you register new nodes without needing to sign in using a web browser. This is most useful when spinning up containers, IoT devices, or using infrastructure-as-code systems like Terraform.
An auth key authenticates a device as the user who generated the key. That is, if Alice generates an auth key, and uses it to add a server to her tailnet, then that device is authenticated with Alice's identity. Think of it as logging into a device.
However, if you use [tags](/docs/features/tags#best-practices) with an auth key, after a device logs in as the user who generated the auth key, the device assumes the identity of the auth key's tags.
As an alternative to directly creating auth keys, consider using an [OAuth client](/docs/features/oauth-clients). You can use an OAuth client and the [Tailscale API](/docs/reference/tailscale-api) to programmatically create auth keys.
## [Types of auth keys](#types-of-auth-keys)
Auth keys can either be:
* **One-off**, for one-time use. They can only be used to connect a device or server one time. This is meant for situations where you can't authenticate on the device yourself, so using a key is more practical. For example, a cloud server might use a one-off key to connect.
* **Reusable**, for multiple uses. They can be used to connect multiple devices. For example, multiple instances of an on-premises database might use a reusable key to connect.
**Be very careful with reusable keys!** These can be very dangerous if stolen. They're best kept in a key vault product specially designed for the purpose.
## [Key expiry](#key-expiry)
An auth key automatically expires after the number of days you specified when you generated the key. You can choose the number of days, between 1 and 90 inclusive, for the key expiry. If you don't specify an expiry time, the auth key will expire after the maximum of 90 days. If you want to continue using an auth key after it expires, you need to generate a new key.
You can enable or disable key expiry on a device by using the [Machines](https://login.tailscale.com/admin/machines) page of the admin console and by using the [Update device key](/api#tag/devices/POST/device/{deviceId}/key) method in the [Tailscale API](/docs/reference/tailscale-api).
If an auth key expires, any device authorized by it remains authorized until its [node key](/docs/features/access-control/key-expiry) expires. Each device generates a node key when you log in to Tailscale and uses it to identify itself to the tailnet. By default, node keys automatically expire every 180 days. You can change the default node key expiry from the **Key Expiry** section of the [Device management](https://login.tailscale.com/admin/settings/device-management) page of the admin console.
[Review key management](/blog/tailscale-key-management#node-keys).
### [Key expiry for tagged devices](#key-expiry-for-tagged-devices)
Key expiry for [tagged](/docs/features/tags#best-practices) devices is disabled by default. If you change the tags on the device through the admin console, [Tailscale CLI](/docs/reference/tailscale-cli), or [Tailscale API](/docs/reference/tailscale-api), the device's key expiry will not change unless you re-authenticate. That is, if it is enabled, it stays enabled; and if it is disabled, it stays disabled. After you re-authenticate, the device's key expiry will be disabled.
You can find recently revoked or expired keys on the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console.
## [Generate an auth key](#generate-an-auth-key)
You must be an [Owner, Admin, IT admin, or Network admin](/docs/reference/user-roles) of a tailnet to generate a key.
To generate an auth key:
1. Open the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console.
2. Select **Generate auth key**.
3. Fill out the form fields to specify characteristics about the auth key, such as the description, [whether its reusable](#types-of-auth-keys), when it expires, and device settings.
The device settings section lets you set special characteristic for the auth key:
* Enable **Ephemeral** to automatically remove the auth key after the device goes offline.
* Enable **Pre-approved** to automatically authorize a device if you have [device approval](/docs/features/access-control/device-management/device-approval) enabled for your tailnet.
* Enable **Tags** to automatically [tag](/docs/features/tags#best-practices) devices that use the auth key.
* Select **Generate key**.
## [Register a node with the auth key](#register-a-node-with-the-auth-key)
When you register a node, use the `--auth-key` option in the [`tailscale up`](/docs/reference/tailscale-cli/up) command to supply the key and bypass interactive login:
```
`sudo tailscale up --auth-key=tskey-abcdef1432341818
`
```
Tailscale-generated auth keys are case-sensitive.
## [Revoke an auth key](#revoke-an-auth-key)
You must be an [Owner, Admin, IT admin, or Network admin](/docs/reference/user-roles) of a tailnet to revoke a key. And you can revoke only your own keys. Tailscale automatically revokes [one-off keys](/docs/features/access-control/auth-keys#authkey-one-off) after they are used.
To revoke a key:
1. Open the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console.
2. Locate the key in the table at the bottom, and select **Revoke**.
Revoking a key does not deauthorize nodes using the key. To deauthorize a node, delete it from the [Machines](https://login.tailscale.com/admin/machines) page.
## [Best practices](#best-practices)
Depending on what devices you're authenticating, consider using an auth key that is:
* **Ephemeral**, for authenticating [ephemeral nodes](/docs/features/ephemeral-nodes) as part of short-lived workloads. Because node keys do not persist when a workload restarts, they reconnect as a different node. Tailscale automatically removes inactive nodes. For example, containers or Lambda functions should use an ephemeral key to connect.
* **Pre-approved**, for servers. If your tailnet has [device approval](/docs/features/access-control/device-management/device-approval) enabled, this lets you add a device to your tailnet without further authorization. For example, shared devices, such as servers, should use a pre-approved auth key to connect in a network with device approval.
* **Pre-signed**, for nodes whose auth keys are signed locally on a [signing node](/docs/features/tailnet-lock#add-a-node-to-a-locked-tailnet), which applies to tailnets with [Tailnet Lock](/docs/features/tailnet-lock) enabled. You can make an auth key (created by any means) pre-signed only by using the [`tailscale lock sign`](/docs/reference/tailscale-cli/lock#lock-sign) CLI command.
* **Tagged**, for servers. You can automatically apply a tag to a device by including the [tag](/docs/features/tags#best-practices) in the auth key. Access control policies restricting the device's permissions based on the tag apply after provisioning the device. For example, shared devices, such as servers, should use a tagged auth key to connect.
On this page
* [Types of auth keys](#types-of-auth-keys)
* [Key expiry](#key-expiry)
* [Key expiry for tagged devices](#key-expiry-for-tagged-devices)
* [Generate an auth key](#generate-an-auth-key)
* [Register a node with the auth key](#register-a-node-with-the-auth-key)
* [Revoke an auth key](#revoke-an-auth-key)
* [Best practices](#best-practices)
Scroll to top