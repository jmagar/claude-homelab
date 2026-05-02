Tailscale SSH · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale SSH
Last validated: Jan 5, 2026
Tailscale SSH lets Tailscale manage the authentication and authorization of SSH connections in your tailnet.
Tailscale SSH is available for [all plans](/pricing).
## [Why it matters](#why-it-matters)
With Tailscale SSH, you can:
* **SSH as normal**, using Tailscale for authentication. With Tailscale SSH, Tailscale takes over port `22` for SSH connections incoming from the Tailscale network. Tailscale will authenticate and encrypt the connection over WireGuard, using Tailscale node keys. The SSH client and server will still create an encrypted SSH connection, but it will not be further authenticated.
* **Verify high-risk connections with check mode**. Optionally require certain connections, or connections as certain users (for example, `root`), to re-authenticate before connecting. This lets the user access these high-risk applications for the next 12 hours or for a specified check period before re-authenticating again.
Your SSH config (`/etc/ssh/sshd\_config`) and keys (`\~/.ssh/authorized\_keys`) files will not be modified, which means that other SSH connections to the same host, not made over Tailscale, will still work.
This video explains some of the features of Tailscale SSH and how to use them.
## [Benefits](#benefits)
* **Reduce management of SSH keys**—Tailscale SSH uses WireGuard keys that are automatically generated and expire after a session ends.
* **Enforce access by leveraging Tailscale access controls**—give access only to users and groups that need SSH and enforce it with check mode.
* **Record SSH sessions with SSH recording**—enforce [SSH recording](/docs/features/tailscale-ssh/tailscale-ssh-session-recording) for audit, troubleshooting, and compliance requirements.
## [Use cases](#use-cases)
* **SSH access to infrastructure**—ensure all SSH traffic is routed over the tailnet.
* **Reduce usage of other tools**—consolidate tooling for managing SSH access.
* **Meet compliance needs**—meet workforce regulatory and compliance requirements for SSH.
## [How is Tailscale SSH different?](#how-is-tailscale-ssh-different)
Historically, to secure an SSH connection, you generate a key pair on the machine you are connecting from (known as the client), with the private key stored on the client, and the public key distributed to the device you want to connect to (known as the server). This lets the server authenticate communication from the client.
With Tailscale, you can already connect machines in your network, and encrypt communications end-to-end from one point to another—and this includes, for example, SSH-ing from your work laptop to your work desktop. Tailscale also knows your identity, since that's how you connected to your tailnet. When you enable Tailscale SSH, Tailscale claims port `22` for the Tailscale IP address (that is, only for traffic coming from your tailnet) on the devices for which you have enabled Tailscale SSH. This routes SSH traffic for the device from the Tailscale network to an SSH server run by Tailscale, instead of your standard SSH server. With Tailscale SSH, based on the access control policies in your tailnet, you can allow devices to connect over SSH and rely on Tailscale instead of public keys for authentication.
||SSH|Tailscale SSH|
|IP addresses|Works with IP addresses.|Works with IP addresses.|
|[MagicDNS](/docs/features/magicdns)|Works with MagicDNS names.|Works with MagicDNS names.|
|DNS Limitations|Does not require DNS if using IP addresses.|Uses a custom `known\_hosts` file with hostnames. If DNS cannot resolve, this can cause errors.|
|Access Controls|Works with Access Controls.|Uses centralized policy management based on Tailscale identities.|
|SSH recording||Works with SSH recording.|
|macOS|Available.|Requires use of [open source `tailscaled` variant](/docs/concepts/macos-variants#open-source-tailscaled-variant).|
For additional information, refer to [Limitations](#limitations).
## [How does it work?](#how-does-it-work)
Compared to using SSH keys, using Tailscale SSH changes how authentication of your connections, key generation and distribution, and user revocation work.
### [Authentication and authorization](#authentication-and-authorization)
Normally, to establish an SSH connection, the local SSH client you use will connect to the SSH server on the machine you're trying to reach.
With Tailscale SSH, Tailscale will authenticate and encrypt the connection over WireGuard, using Tailscale node keys. The SSH client and server will still create an SSH connection, but during the SSH protocol's authentication phase, the Tailscale SSH server already knows who the remote party is and takes over, not requiring the SSH client to provide further proof (using the SSH authentication type `none`).
Tailscale will only authorize the two devices to connect if the access control policies in the tailnet permit it. Tailscale uses `netstack` port interception and just-in-time automatic configuration of the client `known\_hosts` file to make `ssh myhost` work without any new binary or config file. Tailscale implements the SSH File Transfer Protocol (SFTP) which lets SCP and SFTP work for newer SSH clients.
### [Encryption](#encryption)
With Tailscale SSH, in addition to encryption provided by the SSH protocol, Tailscale encrypts the connection end-to-end using WireGuard, which also includes integrity.
### [Key management and distribution](#key-management-and-distribution)
Tailscale already manages and distributes [node keys and machine keys](/blog/tailscale-key-management) for devices in your tailnet. Tailscale uses the node key for authentication, authorization, and encryption of the SSH connection.
With Tailscale SSH, Tailscale also distributes public SSH host keys. The private key is stored locally, and the public key is shared with the Tailscale control plane for distribution. This host key means that the SSH client recognizes the host it is connecting to. Once the host is recognized, Tailscale stores the host key to avoid presenting the user with an "unknown host" error message.
Based on an [access control policy](/docs/features/access-control/acls), if two devices are permitted to connect, then Tailscale's control plane will share their public node keys for discovery, which lets these devices generate an end-to-end encrypted WireGuard connection. If also permitted by the access control policy, Tailscale will share their public SSH host keys, which lets these devices be recognized as part of an SSH connection. If a key is compromised, the user can [remove the keys on the device, re-install Tailscale](/docs/features/client/uninstall), and re-authenticate to generate and distribute new node and SSH host keys.
### [User revocation](#user-revocation)
[Access control policies](/docs/features/access-control/acls) determine which devices, and which users, are authorized for an SSH connection. Unlike with SSH keys which need to be purged, to remove a user's ability to SSH to a device, the access control policy can be updated to restrict a user's access. Once the access control policy is saved, clients respond to the new rules within seconds. This **will** stop existing SSH connections the user has established.
### [Check mode](#check-mode)
Optionally, connections over Tailscale SSH can require a user to re-authenticate before establishing an SSH connection. This requires the user to sign in again with their identity provider. A user will not need to re-authenticate for other connections in check mode for the next 12 hours, or a specified check period.
## [Configure Tailscale SSH](#configure-tailscale-ssh)
### [Prerequisites](#prerequisites)
Tailscale SSH's server component is only available on:
* Linux
* macOS open source [`tailscale` + `tailscaled` CLI devices](https://github.com/tailscale/tailscale/wiki/Tailscaled-on-macOS)
You can connect from any device running Tailscale, regardless of platform. Tailscale SSH's server component requires Tailscale v1.24 or later.
To enable Tailscale SSH, you must:
* Advertise Tailscale SSH from the destination to which you want to connect.
* Ensure an access control policy exists that grants the source with access to the destination on port `22`.
* This is not necessary if you haven't modified the [access control policies](/docs/features/access-control/acls) in your account, as the [default access control policy](/docs/reference/examples/acls#allow-all-default-acl) grants access to all devices in the tailnet.
* This may require modifying the tailnet policy file to include SSH. You need to be an [Admin or Network admin](/docs/reference/user-roles) to modify the tailnet policy file.
* Ensure an access control policy exists that lets the source use SSH to connect to the destination machine using Tailscale SSH.
* This is not necessary if you haven't modified the [access control policies](/docs/features/access-control/acls) in your account, as the [SSH access rules in the default access control policy](#ssh-access-rules-in-default-acl) grant SSH access to all devices.
* This will require modifying the tailnet policy file to include SSH policies. You need to be an [Admin or Network admin](/docs/reference/user-roles) to modify the tailnet policy file.
### [Advertise SSH on the host](#advertise-ssh-on-the-host)
On the host being connected to, you need to advertise that Tailscale is managing SSH connections which originate from the Tailscale network to this host. To do so, run:
```
`tailscale set --ssh
`
```
Running `tailscale set --ssh` will cause any existing SSH connections you have to the host's Tailscale IP to hang.
This generates a host key pair, shares its public half with the Tailscale control plane for distribution to clients, and configures `tailscaled` to intercept all traffic from your tailnet that is routed to port `22` on the Tailscale IP address. This SSH initialization only needs to be done once per host.
### [Ensure Tailscale SSH is permitted in access control policies](#ensure-tailscale-ssh-is-permitted-in-access-control-policies)
Before you can use Tailscale SSH, you have to tell Tailscale which users are allowed to SSH to which devices. Since Tailscale automatically manages the authorization and authentication for you, you need to explicitly define these connections.
SSH access rules are defined in the tailnet policy file, which you can edit through the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console, or through the Tailscale [API](/docs/reference/tailscale-api).
For a connection to be permitted, the tailnet policy file must contain rules permitting both network access and SSH access:
1. An allowed connection from the source to the destination. This is used to allow any connections in Tailscale (including SSH connections), to distribute keys for WireGuard.
2. An allowed SSH connection from the source to the destination and the given SSH users. This is used for Tailscale SSH, to distribute keys for authenticating SSH connections.
Each SSH access rule looks like this:
```
`{
"action": "check", // "accept" or "check"
"src": [list-of-sources],
"dst": [list-of-destinations],
"users": [list-of-ssh-users],
"checkPeriod": "20h", // optional, only for check actions. default 12h
"acceptEnv": [ "GIT\_EDITOR", "GIT\_COMMITTER\_\*", "CUSTOM\_VAR\_V?" ] // optional, allowlists environment variables that can be forwarded from clients to the host
},
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
#### [`action`](#action)
Specifies whether to accept the connection or to perform additional checks on it.
* `accept` accepts connections from users already authenticated in the tailnet.
* `check` requires users to periodically reauthenticate according to the `checkPeriod`.
#### [`src`](#src)
The source where a connection originates from. This can be a user, group, tag, `user:\*@\<domain\>`, or [`autogroup`](/docs/reference/syntax/policy-file#autogroups).
This cannot be a bare wildcard `\*`.
Granting access to `autogroup:member` also grants access to [external invited users](/docs/features/sharing/how-to/invite-any-user) if the destination node is [shared](/docs/features/sharing) with them, even if they have no nodes in your tailnet.
#### [`dst`](#dst)
The destination where the connection goes. This can be a user, tag, or autogroup.
Unlike ACLs, a port cannot be specified. Only port `22` is allowed, and does not need to be specified as it is used by default.
This cannot be a bare wildcard `\*`.
#### [`users`](#users)
The set of allowed usernames on the host. Like other SSH clients, Tailscale will only use user accounts that already exist on the host, not create new accounts.
* Specify `autogroup:nonroot` to allow any user that is not `root`.
* Specify `localpart:\*@\<domain\>` to allow the user on the host whose name matches the [local-part](https://www.rfc-editor.org/rfc/rfc2822.html#section-3.4.1) of the user's login, if and only if the user's login email is in `\<domain\>`. Tailscale does not do any special processing on the local-part. For example, if the login is `dave+sshuser@example.com`, Tailscale will map this to the SSH user `dave+sshuser`.
#### [`checkPeriod`](#checkperiod)
When `action` is `check`, `checkPeriod` specifies the time period for which to allow a connection before requiring a check. This can be specified in minutes or hours, with a minimum of one minute and a maximum of 168 hours (one week).
* If not specified, the default is 12 hours.
* You may also specify `always` to require check mode on every connection. Choosing to always require check mode may cause unexpected behavior with automation tools that open many SSH connections in a short time span, like [Ansible](https://www.ansible.com).
#### [`acceptEnv`](#acceptenv)
The host must be running Tailscale v1.76.0 or later to use `acceptEnv`.
Specifies the set of allowlisted environment variable names that clients can send to the host using [`SendEnv`](https://man.openbsd.org/ssh_config#SendEnv) or [`SetEnv`](https://man.openbsd.org/ssh_config#SetEnv).
Values can contain `\*` and `?` wildcard characters. `\*` matches zero or more characters and `?` matches a single character.
##### [`acceptEnv` examples](#acceptenv-examples)
|`acceptEnv`|Permitted|Rejected|
|`\*`|`FOO\_A``FOO\_B``FOO\_OTHER``BAZ`||
|`FOO\_\*`|`FOO\_A``FOO\_B``FOO\_OTHER`|`BAZ`|
|`FOO\_?`|`FOO\_A``FOO\_B`|`FOO\_OTHER``BAZ`|
|`FOO\_A`|`FOO\_A`|`FOO\_B``FOO\_OTHER``BAZ`|
#### [Order of evaluation](#order-of-evaluation)
SSH access rules are evaluated considering the most restrictive policies first:
* Check policies
* Accept policies
For example, if you have an access rule allowing the user `alice@example.com` to access a resource with an `accept` rule, and a rule allowing `group:devops` which `alice@example.com` belongs to, to access a resource with a `check` rule, then the `check` rule applies.
The only kinds of connections that are allowed are:
* From a user to their own devices, as any user including `root`.
* From a user to a tagged device, as any user including `root`.
* From a user to a [shared](/docs/features/sharing) tagged device, as any user including `root`.
* From a tagged device to another tagged device, for any tags. An SSH access rule from a tagged device cannot be in [check mode](/docs/features/tailscale-ssh#configure-tailscale-ssh-with-check-mode).
That is, the broadest policy allowed would be:
```
`{
"grants": [
{
"src": ["\*"],
"dst": ["\*"],
"ip": ["\*"]
}
],
"ssh": [
{
"action": "accept",
"dst": ["autogroup:self"],
"src": ["autogroup:member"],
"users": ["root", "autogroup:nonroot"]
},
{
"action": "accept",
"dst": ["tag:prod"],
"src": ["autogroup:member"],
"users": ["root", "autogroup:nonroot"]
},
{
"action": "accept",
"dst": ["tag:prod"],
"src": ["tag:logging"],
"users": ["root", "autogroup:nonroot"]
}
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
#### [SSH access rules in default access control policy](#ssh-access-rules-in-default-access-control-policy)
By default, new tailnets or existing tailnets that have not modified their access control policies have a usable but conservative Tailscale SSH access rule. To facilitate connectivity, Tailscale SSH is configured with a [default policy](/docs/reference/examples/acls#allow-all-default-acl) that lets the user access their own devices using check mode, as either `root` or non-`root`:
```
`"ssh": [
{
// any user can use Tailscale SSH to connect to their own devices
// in check mode as a root or non-root user
"action": "check",
"src": ["autogroup:member"],
"dst": ["autogroup:self"],
"users": ["autogroup:nonroot", "root"]
},
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
You still need to opt in a destination device.
Modifying the access control policy for SSH overrides this default configuration, and removing it disables Tailscale SSH in your tailnet.
**Important note about `autogroup:nonroot`**
In the default ACL, the `ssh` rule uses `autogroup:self` for the `dst` field and`autogroup:nonroot` in the `users` field. If you change the `dst` field from`autogroup:self` to some other destination, such as an [ACL tag](https://tailscale.com/docs/features/tags/), also consider replacing `autogroup:nonroot` in the `users` field. If you don't remove`autogroup:nonroot` from the `users` field, then anyone permitted by the `src` setting will be able to SSH in as any nonroot user on the `dst` device.
#### [SSH access rule examples](#ssh-access-rule-examples)
To allow a user to only SSH to their own devices, as non-`root`:
```
`{
"grants": [
{
"src": ["\*"],
"dst": ["\*"],
"ip": ["\*"]
}
],
"ssh": [
{
"action": "accept",
"dst": ["autogroup:self"],
"src": ["autogroup:member"],
"users": ["autogroup:nonroot"]
}
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
To allow `group:sre` to access devices in the production environment tagged `tag:prod`:
```
`{
"grants": [
{
"src": ["group:sre"],
"dst": ["tag:prod"],
"ip": ["\*"]
}
],
"groups": {
"group:sre": ["alice@example.com", "bob@example.com"]
},
"ssh": [
{
"action": "accept",
"dst": ["tag:prod"],
"src": ["group:sre"],
"users": ["ubuntu", "root"]
}
],
"tagOwners": {
"tag:prod": ["group:sre"]
}
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
It may be useful to match host users with login emails. For example, you can allow `dave@example.com` to authenticate as the host user `dave`. To allow any tailnet member in the login domain `example.com` to access devices in the production environment tagged `tag:prod`, as a user that matches their login email local-part:
```
`{
"grants": [
{
"src": ["user:\*@example.com"],
"dst": ["tag:prod"],
"ip": ["\*"]
}
],
"ssh": [
{
"action": "accept",
"dst": ["tag:prod"],
"src": ["user:\*@example.com"],
"users": ["localpart:\*@example.com"]
}
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
### [Connect over SSH](#connect-over-ssh)
Now that your access control policy permits SSH, and the destination host has Tailscale configured with SSH, you should be able to use Tailscale SSH.
To connect to a host named `device` in your tailnet:
```
`ssh device
`
```
This example uses the [MagicDNS](/docs/features/magicdns) hostname.
The MagicDNS hostname is automatically generated from the machine's name. You can [edit the machine name](/docs/concepts/machine-names#renaming-a-machine) if you want to use a different name.
To use a user different from the local user, specify the user, for example, `ubuntu`:
```
`ssh ubuntu@device
`
```
Some SSH clients may fail to connect to an SSH server using no authentication. In this case, you can simulate password authentication by adding `+password` to the username you are connecting to in the client:
```
`username: ubuntu+password
password: [any]
`
```
In this case you can enter any password, it does not need to match the user's actual password. Note that the string to add to the username is the literal string `+password` and not the user's password.
You can also connect over SSH to a node that is tagged and has been [shared](/docs/features/sharing) with you, as long as the destination host has Tailscale configured with SSH and the destination's access control policy lets you connect over SSH.
In addition to hostnames, it is also possible to use [Tailscale IP addresses](/docs/concepts/tailscale-ip-addresses) as SSH destinations. Tailscale IP addresses remain constant regardless of the device's physical location. Even if a device switches network connections, such as from Wi-Fi to a cellular network, its Tailscale IP address remains the same.
For example, connecting to a Tailscale IP address (like `100.64.0.1`) would resemble:
```
`ssh user@100.64.0.1
`
```
You cannot connect to a Tailscale SSH server using a non-Tailscale IP address.
### [Transition from your existing SSH client to Tailscale SSH](#transition-from-your-existing-ssh-client-to-tailscale-ssh)
When you enable Tailscale SSH, Tailscale claims port `22` for the Tailscale IP address (that is, only for traffic coming from your tailnet) on the devices for which you have enabled SSH, and routes SSH traffic for the device to an SSH server run by Tailscale, instead of your standard SSH server. Your SSH config (`/etc/ssh/sshd\_config`) and keys (`\~/.ssh/authorized\_keys`) file will not be modified, which means that other SSH connections to the same host, not made over Tailscale, will still work.
### [Rotate keys](#rotate-keys)
Re-authenticating on the device will generate a new node key pair, store the private key locally, and share the public key with Tailscale for distribution.
To generate new node and SSH host keys:
```
`tailscale up --ssh --force-reauth
`
```
## [Disable Tailscale SSH](#disable-tailscale-ssh)
### [Disable Tailscale SSH from a device](#disable-tailscale-ssh-from-a-device)
Prior to disabling Tailscale SSH, ensure you have another way to SSH to the device, or else you may lose access to it.
Run `tailscale set` on the device with `--ssh=false` to disable Tailscale SSH:
```
`tailscale set --ssh=false
`
```
### [Block other devices from connecting to your device over SSH](#block-other-devices-from-connecting-to-your-device-over-ssh)
To disable Tailscale SSH on your device, reconfigure the device with `--ssh=false`:
```
`tailscale set --ssh=false
`
```
To [block incoming connections](/docs/features/client/manage-preferences#allow-incoming-connections) from the tailnet to your device, including Tailscale SSH connections:
```
`tailscale set --shields-up
`
```
### [Revoke a user's ability to SSH](#revoke-a-users-ability-to-ssh)
To remove a user's ability to SSH to a device, modify the [access rule](/docs/reference/syntax/policy-file#acls) specifying the user's ability to SSH to the device. An update to access control policies will be pushed to the device, and remove the user's access, almost instantaneously. You can still allow the user to connect to the device, but not use Tailscale SSH, if that is desired.
This **will** stop existing SSH connections the user has established. The user will receive a message, "Access revoked".
If a user has another way of accessing the device outside of Tailscale, such as their SSH key, this also needs to be removed or revoked.
### [Disable Tailscale SSH from your tailnet](#disable-tailscale-ssh-from-your-tailnet)
To completely remove Tailscale SSH functionality from your tailnet:
* Opt out every host from Tailscale SSH (`tailscale set --ssh=false`)
* Remove SSH access rules for Tailscale SSH from the access control policies
You do not need to remove or modify other [access rules](/docs/reference/syntax/policy-file#acls) if you still want users to be able to access the specified devices, but not using Tailscale SSH.
### [Misconfigurations](#misconfigurations)
Tailscale SSH requires access control policies in the tailnet policy file that allow and specify both the SSH source and destination. Additionally, Tailscale SSH must be enabled on the destination device.
If the access control policy is missing, this can be changed in the tailnet policy file in the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console. You need to be an [Admin or Network admin](/docs/reference/user-roles) to modify the tailnet policy file.
If SSH is not advertised on the device, connect to the device over Tailscale, then run `tailscale set --ssh`.
## [Configure Tailscale SSH with check mode](#configure-tailscale-ssh-with-check-mode)
SSH check mode lets you require SSH connections to be further verified before establishing the connection. Check mode requires re-authentication on the device initiating the connection. The SSH initialization provides a URL for signing in. The sign-in attempt may also trigger any identity provider [multifactor authentication](/docs/multifactor-auth) (MFA) or other risk-based challenges.
Example of check mode requiring a user to re-authenticate their session in a browser.
Once re-authenticated to a destination, the user can access the device and any other device in the tailnet without re-verification for the next 12 hours. If a different check period is specified for the connection, then the user can access *specifically* this device without re-verification for the duration of the check period. For example, if a check period of 10 minutes is specified, if the user has not re-authenticated within the last 10 minutes, they will be asked to re-authenticate even if they have re-authenticated within the last 12 hours.
* Check mode is optional and not enabled by default.
* Check mode is only available for Tailscale SSH connections.
Check mode is controlled through SSH policy settings. The `ssh` rule must contain the `action` field, set to `check`:
```
`"ssh": [
{
"action": "check", // instead of "accept"
"src": ["autogroup:member"],
"dst": ["autogroup:self"],
"users": ["autogroup:nonroot"],
"checkPeriod": "5m", // optional, define in minutes, hours, or "always"
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
You can specify a custom check period in minutes or hours. The default check period is 12 hours. You may also specify `"always"` to require check mode on every connection.
Choosing to always require check mode may cause unexpected behavior with automation tools that open many SSH connections in a short time span, such as [Ansible](https://www.ansible.com).
For example, to require check mode for Alice to SSH to devices tagged `tag:prod` as `root` and re-authenticate after `1h`, but not require check mode for her to SSH to her own devices as non-`root`:
```
`{
"grants": [
{
"src": ["\*" ],
"dst": ["\*"],
"ip": ["\*"]
}
],
"ssh": [
{
"action": "accept",
"dst": ["autogroup:self"],
"src": ["alice@example.com"],
"users": ["autogroup:nonroot"]
},
{
"action": "check",
"checkPeriod": "1h",
"dst": ["tag:prod"],
"src": ["alice@example.com"],
"users": ["root"]
}
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
## [Limitations](#limitations)
### [Devices](#devices)
* You can currently use Tailscale SSH to connect to only devices on your Tailscale network. Devices available behind subnet routers, but not running Tailscale, cannot use Tailscale SSH.
* You can currently use Tailscale SSH to connect to only Linux devices and macOS open source [`tailscale` + `tailscaled` CLI version devices](https://github.com/tailscale/tailscale/wiki/Tailscaled-on-macOS). You can connect from any device running Tailscale, regardless of platform.
* You cannot run Tailscale SSH on Synology or QNAP devices.
* Restarting the Tailscale daemon (`tailscaled`), for example, by performing an upgrade, will stop any existing Tailscale SSH session.
### [Ports](#ports)
Tailscale SSH assumes you use port `22` for SSH.
At this time, there is no way to configure Tailscale SSH to use a different port.
### [SSH users](#ssh-users)
SSH access rules are evaluated based on their restrictiveness, so if both a check and an accept rule exist for a given connection, the check rule applies. This means that the user will be restricted by the SSH `users` in the check rule only, not also considering those allowed in the accept rule.
### [SSH tests](#ssh-tests)
You can write [SSH tests](/docs/reference/syntax/policy-file#sshtests) to assert that your SSH access rules are working as expected.
### [Check mode](#check-mode-1)
You can use check mode only on Tailscale SSH connections, not for plain SSH or other TCP connections running over Tailscale.
### [OS user authentication on the client](#os-user-authentication-on-the-client)
Traditional SSH requires a local OS user on the client machine to be able to read their SSH key pair from files on disk. This effectively restricts which client-side OS users can SSH to remote machines.
Because Tailscale doesn't use a local SSH key pair for authentication, any OS user on the client machine can connect to SSH servers over Tailscale. The scope of this access is still restricted by [Tailscale access control policies](/docs/features/access-control/acls), which are enforced on the server side.
Tailscale SSH is an [improvement](#how-does-it-work) over traditional SSH for:
* servers and containers that use a single system user to run workloads
* single-user machines, like employees' laptops
* any machines that don't allow outbound SSH connections in Tailscale access control policies
Tailscale SSH may not be a good fit for:
* multi-user machines, where OS users on those machines have different SSH access permissions in Tailscale access control policies
* machines that have outbound Tailscale SSH access, where you do not trust the code running on those machines
* machines where you use `authorized\_keys` to limit what commands remote users can run
You can mitigate this concern by using [check mode](#configure-tailscale-ssh-with-check-mode) with `checkPeriod` set to `always`, which will prompt for SSO-based approval on every new connection.
If Tailscale SSH is not a good fit for your needs, you can still run traditional SSH servers and clients on top of Tailscale as the network layer. This provides you the standard SSH experience without exposing your servers to the internet.
## [Additional information](#additional-information)
* Tailscale CLI command: [`tailscale set --ssh`](/docs/reference/tailscale-cli#set)
* Tailscale CLI command: [`tailscale up --ssh`](/docs/reference/tailscale-cli/up)
* tailnet policy file section: [`ssh`](/docs/reference/syntax/policy-file#ssh)
On this page
* [Why it matters](#why-it-matters)
* [Benefits](#benefits)
* [Use cases](#use-cases)
* [How is Tailscale SSH different?](#how-is-tailscale-ssh-different)
* [How does it work?](#how-does-it-work)
* [Authentication and authorization](#authentication-and-authorization)
* [Encryption](#encryption)
* [Key management and distribution](#key-management-and-distribution)
* [User revocation](#user-revocation)
* [Check mode](#check-mode)
* [Configure Tailscale SSH](#configure-tailscale-ssh)
* [Prerequisites](#prerequisites)
* [Advertise SSH on the host](#advertise-ssh-on-the-host)
* [Ensure Tailscale SSH is permitted in access control policies](#ensure-tailscale-ssh-is-permitted-in-access-control-policies)
* [action](#action)
* [src](#src)
* [dst](#dst)
* [users](#users)
* [checkPeriod](#checkperiod)
* [acceptEnv](#acceptenv)
* [acceptEnv examples](#acceptenv-examples)
* [Order of evaluation](#order-of-evaluation)
* [SSH access rules in default access control policy](#ssh-access-rules-in-default-access-control-policy)
* [SSH access rule examples](#ssh-access-rule-examples)
* [Connect over SSH](#connect-over-ssh)
* [Transition from your existing SSH client to Tailscale SSH](#transition-from-your-existing-ssh-client-to-tailscale-ssh)
* [Rotate keys](#rotate-keys)
* [Disable Tailscale SSH](#disable-tailscale-ssh)
* [Disable Tailscale SSH from a device](#disable-tailscale-ssh-from-a-device)
* [Block other devices from connecting to your device over SSH](#block-other-devices-from-connecting-to-your-device-over-ssh)
* [Revoke a user's ability to SSH](#revoke-a-users-ability-to-ssh)
* [Disable Tailscale SSH from your tailnet](#disable-tailscale-ssh-from-your-tailnet)
* [Misconfigurations](#misconfigurations)
* [Configure Tailscale SSH with check mode](#configure-tailscale-ssh-with-check-mode)
* [Limitations](#limitations)
* [Devices](#devices)
* [Ports](#ports)
* [SSH users](#ssh-users)
* [SSH tests](#ssh-tests)
* [Check mode](#check-mode-1)
* [OS user authentication on the client](#os-user-authentication-on-the-client)
* [Additional information](#additional-information)
Scroll to top