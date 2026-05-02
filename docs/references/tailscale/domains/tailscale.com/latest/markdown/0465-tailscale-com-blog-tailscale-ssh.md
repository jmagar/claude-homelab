Tailscale SSH: Simplify and Secure SSH Connections on Your Tailnet
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|June 22, 2022
# Tailscale SSH: Simplify and Secure SSH Connections on Your Tailnet
**Today we’re delighted to introduce [Tailscale SSH](/kb/1193/tailscale-ssh/), to more easily manage SSH connections in your tailnet**. Tailscale SSH allows you to establish SSH connections between devices in your Tailscale network, as authorized by your access controls, without managing SSH keys, and authenticates your SSH connection using WireGuard®.
Many organizations already use Tailscale to protect their SSH sessions — for example, to allow users to connect from their work laptop to their work desktop. Since Tailscale allows you to connect your devices in a virtual private network, and use access controls to restrict communications between them, we thought, “Why do we need SSH keys? Let’s just make SSH use your Tailscale identity.” And so we did.
**For sensitive high-risk connections, such as those connecting as `root`, you can also enable [check mode](/kb/1193/tailscale-ssh/#configure-tailscale-ssh-with-check-mode)**. Check mode requires a user to re-authenticate with your SSO (or to have recently re-authenticated) before being able to establish a Tailscale SSH connection.
When using check mode, if you haven’t recently authenticated, you need to re-authenticate before establishing a Tailscale SSH connection.
Read on to learn more about what Tailscale SSH is, how it compares to other SSH solutions, and how to start using it in your tailnet.
### SSH, but make it Tailscale
Recall [how Tailscale works](/blog/how-tailscale-works/): Connections between your devices in your private tailnet are already automatically authenticated and encrypted using WireGuard. Tailscale’s coordination server distributes the [public node key](/blog/tailscale-key-management/) of your device to the peers in your network that it’s allowed to communicate with. This node key is your device’s identity: It’s what’s used to authenticate your device and encrypt connections to or from the device. In addition, your tailnet’s [ACLs](/kb/1018/acls/) are used to determine whether a given connection is authorized. Tailscale compiles ACLs into a set of packet filters that are distributed to all the devices in your network, and each device locally enforces what traffic is authorized.
What makes Tailscale SSH different? When you enable Tailscale SSH on a device, Tailscale claims port 22 for any traffic incoming to that device to its Tailscale IP address — that is, only for traffic coming over Tailscale. This traffic is rerouted to an SSH service inside the Tailscale daemon instead of to your standard SSH server. When you create a new SSH connection from a client to this server over the Tailscale network, the server already knows who the remote party is and takes over, and does not require the SSH client to provide further proof.
Managing your personal or your organization’s SSH keys can be kind of painful. Sure, SSH keys are better than passwords because they identify the user, but they’re still only secure until [they’re accidentally live-streamed](https://www.youtube.com/watch?v=BAgzkKpLVt4&amp;t=1672s). (SSH certificates are better, but have you tried running your own enterprise CA?) If you’re managing these keys correctly, it’s time-consuming — you might spend hours distributing SSH keys when provisioning new servers or removing SSH keys when a colleague leaves. Some organizations use bastions to force SSH connections through a single point for authentication and authorization — but it adds unnecessary latency if you’re not operating a bastion near all of your infrastructure, and it’s yet another server (or service) to manage.
Tailscale SSH connections leverage the same control mechanism as other Tailscale connections, using Tailscale’s node keys and ACLs to ensure a connection is authenticated, authorized, and encrypted:
* **Your Tailscale SSH connection is authenticated** based on your source device’s Tailscale identity. Tailscale also distributes public SSH host keys to your client when possible, so that the SSH client recognizes the host it is connecting to — meaning you won’t see an “unknown host” warning message.
* **Your Tailscale SSH connection is authorized** based on the access rules you define in your tailnet’s ACLs.
* **Your Tailscale SSH connection is encrypted** using WireGuard (in addition to regular SSH encryption), using your source and destination devices’ public node keys.
With Tailscale SSH, you no longer need to generate, distribute, and manage SSH keys. (You can develop remotely without having to figure out how to get your private SSH key onto your iPad!) Tailscale SSH lets you manage your permissions as code, so access is authorized based on your ACLs. If someone leaves, you can revoke access almost instantaneously, without touching every server. And unlike bastion hosts, you don’t need to funnel all your traffic through a single, demarcated network entry point.
Tailscale works with your existing identity provider, so it’s clear which key corresponds to which individual and device. Since Tailscale distributes the keys, you can easily rotate and redistribute keys. Node keys can be rotated by re-authenticating the device, as often as every day.
If you’re already familiar with [WireGuard](https://www.wireguard.com/), this makes sense — WireGuard is a lot like SSH in that each side needs a private key to establish its own identity and uses its peer’s public key to identify it. Either side can initiate a connection. In both cases, what Tailscale helps with is the network configuration, key distribution, and mapping of public keys back to user identities. Tailscale already extends your SSO identity into your network identity; with Tailscale SSH, we take it one more step.
### Use SSH access rules to define allowed connections
Tailscale SSH introduces a new section to Tailscale’s ACLs: [SSH access rules](/kb/1337/acl-syntax#tailscale-ssh-ssh). Like Tailscale’s other access rules, which let you define what a particular user or device is permitted to access on your Tailscale network, these let you restrict which users or devices can use Tailscale SSH, and as which SSH users.
So, you could allow Alice to access the production server as root using Tailscale SSH:
```
` "ssh": [
{
"action": "accept",
"src": ["alice@example.com"],
"dst": ["tag:prod"],
"users": ["root"]
}
]
`
```
To be able to use Tailscale SSH, you need *both* a rule that allows access to from the source device to the destination device over port 22 (where the Tailscale SSH server is run), and an SSH access rule that allows Tailscale SSH access to the destination device and SSH user.
### Use check mode to verify high-risk connections
Normally, Tailscale connections are based on your node key’s expiration — so that you re-authenticate to the tailnet regularly, but not as part of every interaction. (You can also [disable node key expiry](/kb/1028/key-expiry/#disabling-key-expiry) for servers.) For some more sensitive operations, you really do want to verify that a human is on the other end of the connection. (On the internet, nobody knows you’re a dog, and it really is harder to type your password with paws.)
Tailscale SSH check mode requires the user to have recently re-authenticated to Tailscale before establishing the connection. By default, this is a 12-hour check period — so if you’re connecting to various log servers to debug an outage, you can keep working throughout your day, uninterrupted. If you’re dealing with a particularly sensitive application or set of permissions, then you can set a much shorter check period — you might only need 15 minutes to access your database and identify which customers are affected by a bug.
You can require a check on any Tailscale SSH connection and set the desired check period as part of your SSH access rules. For example, what if you only wanted Alice to be able to connect as `root` on the production server, as long as she authenticated in the last hour?
```
` "ssh": [
{
"action": "check", // instead of "accept"
"src": ["alice@example.com"],
"dst": ["tag:prod"],
"users": ["root"],
"checkPeriod": "1h"
}
]
`
```
### Set up Tailscale SSH
Let’s see how (easy it is) to set Tailscale SSH up. You’ll need to: opt in the destination device to Tailscale SSH and ensure ACLs exist which allow Tailscale SSH access.
To enable Tailscale SSH on a destination device, run
```
`tailscale up --ssh
`
```
Right now, this is only supported on Linux devices. This *doesn’t* affect your existing SSH configuration, so you can use Tailscale SSH concurrently with other SSH tools you have, or gradually roll out Tailscale SSH across your fleet.
Next, make sure your ACLs have *both* an access rule that allows the source to connect to the destination on port 22, and an SSH access rule that allows the source to connect to the destination using Tailscale SSH. If you *haven’t* modified your ACLs, you’ll have a [default policy](/kb/1192/acl-samples/#allow-all-default-acl) which allows all users to connect to their own devices in check mode, as both root and non-root:
```
` "ssh": [
{
"action": "check",
"src": ["autogroup:member"],
"dst": ["autogroup:self"],
"users": ["autogroup:nonroot", "root"]
},
]
`
```
If you *have* modified your ACLs, you’ll need to add this or whatever SSH access rules you’d like to apply. You can modify your ACLs in the [admin console](https://login.tailscale.com/admin/acls).
Then, connect from the source device as normal:
```
`$ ssh root@100.100.100.100
`
```
Or, if you have [MagicDNS](/kb/1081/magicdns/) enabled:
```
`$ ssh root@server
`
```
(We were going to include a gif of using Tailscale SSH in this blog post, but it just looks like regular SSH, so there’s no point. Worst demo ever.)
### Get started
So: Say hello to Tailscale SSH — and say goodbye to managing SSH keys, setting up bastion jump boxes, and unnecessarily exposing your private production devices to the open internet.
Maya demonstrates how to use Tailscale SSH.
To get started, see our [documentation on Tailscale SSH](/kb/1193/tailscale-ssh/) or watch a [demo on setting it up](https://www.youtube.com/watch?v=5XEeLBNUKTU). Watch [our discussion with Maisem Ali and Brad Fitzpatrick](https://www.youtube.com/watch?v=MZu_T5YgW5c) on building Tailscale SSH to learn more.
Tailscale SSH is available in [beta](/kb/1167/release-stages/#beta) today, and included in all plans. *Tailscale SSH access rules with unique users are counted as part of the unique users in ACLs that are limited in some paid plans.*
We’re building this for you, so let us know what you think [@Tailscale on Twitter](https://twitter.com/tailscale), and [file a GitHub issue](https://github.com/tailscale/tailscale/issues) or [contact support](/contact/support) if Tailscale SSH isn’t working as expected.
Share
Authors
Brad Fitzpatrick
Maisem Ali
David Crawshaw
Ross Zurowski
Authors
Brad Fitzpatrick
Maisem Ali
David Crawshaw
Ross Zurowski
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