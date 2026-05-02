Tailnet lock is now available in beta
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|August 16, 2023
# Tailnet lock is now available in beta
Traffic in Tailscale is end-to-end encrypted, which means we can’t see your data. But if you’re the kind of person who thinks about end-to-end encryption, you might also wonder whetheryou can trust Tailscale to manage the control plane for your network — and what happens if the Tailscale coordination server were compromised and used to maliciously insert new nodes into your network? [Tailnet lock](/kb/1226/tailnet-lock/) **lets you verify that nodes can only be added to your tailnet when those nodes are signed by trusted nodes in your tailnet, which you manage.**
When we [introduced tailnet lock](/blog/tailnet-lock/) a few months ago, we heard your feedback — that it helped address concerns about trusting a third-party provider for something as critical and sensitive as your network infrastructure — but there were still a few rough edges. Since then, we’ve improved the usability of tailnet lock so you can use mobile devices as trusted nodes, and implemented recovery mechanisms so you can regain control of your tailnet in case of compromise.
### Improving the user experience
When you enable tailnet lock, you define which nodes in your tailnet are trusted. Then, when a new node is added to your tailnet, its public node key must be signed by a trusted node’s tailnet lock key. Other nodes in your tailnet can only communicate with nodes that have signed node keys.
In alpha, tailnet lock was only available via the [Tailscale CLI](/kb/1080/cli/). Because tailnet lock requires you to perform signing operations on your nodes, rather than trust Tailscale’s coordination server, we can’t make it a feature that you can manage entirely via the admin console. However, you can now follow a step-by-step tutorial for enabling tailnet lock from the [**Device management**](https://login.tailscale.com/admin/settings/device-management) page of the admin console. The flow will walk you through selecting trusted nodes to use as signing nodes, generating disablement secrets, and give you the necessary `tailscale lock init` command to run on a trusted node to enable tailnet lock for your tailnet.
You can use the admin console to select signing nodes. This will generate the CLI command needed to enable tailnet lock.
And, we’ve made it easier to sign new nodes. You can also filter for new nodes which are “locked out” in the admin console. For each locked out node, in addition to the CLI command to sign the node, you’ll also see a signing link that you can copy (on your desktop device) or scan using a QR code (on your mobile device). This makes it possible for you to use a mobile device as a signing key.
You can sign a new machine using the desktop or mobile clients, or using the CLI.
We also made tailnet lock compatible with more features of Tailscale. You can now use [pre-signed auth keys](/kb/1085/auth-keys/),so that you can still use tailnet lock with programmatically managed infrastructure. And, tailnet lock now works with [shared nodes](/kb/1084/sharing/) and [Tailscale SSH Console](/kb/1216/tailscale-ssh-console/).
### Implementing network takeover recovery mechanisms
Although we’ve added flexibility around which nodes can be signing keys, that also introduces a concern — what if a signing key were compromised and used to sign nodes you didn’t want to add? How would you regain control of your tailnet?
We’ve now implemented the mechanisms [described in the tailnet lock white paper for recovering from key compromise](/kb/1230/tailnet-lock-whitepaper/). If a signing node *Node-A* is compromised, then you can use the new CLI command `tailscale lock recover-compromised-key` to recover:
* Specify and revoke the compromised signing key or keys, in this case *Node-A*.
* Tailscale will determine the point at which *Node-A* was added to the tailnet lock log, and the appropriate point at which to fork the log based on *Node-A*’s operations.
* Tailscale will automatically remove all devices signed with the compromised key, and not automatically re-sign them.
If multiple node keys are compromised, the same mechanism is used. Run the same command on as many trusted (that is, not compromised) signing nodes as possible — if more signing nodes agree that a key should be revoked than not, then the keys in the fork that Tailscale determined to still be trusted are then used, instead of the revoked keys.
It’s also possible to more easily remove a signing key without revoking trust in all the nodes it signed: when you remove a signing key *Node-A* from signing key *Node-B*, by default all nodes previously signed with *Node-A* will be re-signed with Node-B’s key.
### Continuing to move forward
There are still a few things we’re working on for tailnet lock — namely, support for Android devices. You can use iOS devices as a signing device, and we are working on adding the same support for Android.
We’ve also had a few users ask about verifying trust for other information coming from the Tailscale coordination server, such as the [tailnet policy file](/kb/1018/acls/). It’s something we’re thinking about, but don’t have a solution for yet. The challenge in bringing functionality like tailnet lock to access rules is that the principals in rules are identities only known to the Tailscale coordination server — that is, a node could verify that a rule allows [alice@example.com](mailto:alice@example.com) to access it, but it has no way to verify who [alice@example.com](mailto:alice@example.com) really is. Nonetheless, we will continue to develop strong controls, and [build Tailscale with security and privacy in mind](/security/), so that you can trust (and verify) us to manage your network.
### Joining the beta
Enable tailnet lock from the [**Device management**](https://login.tailscale.com/admin/settings/device-management) page of the admin console. If you’re already using tailnet lock, we strongly recommend updating your nodes to Tailscale v1.46.1 or later, to benefit from the latest improvements and bug fixes.
To learn more, read the [documentation on tailnet lock](/kb/1226/tailnet-lock/), and dive deeper into technical details in the [tailnet lock white paper](/kb/1230/tailnet-lock-whitepaper/).
Share
Authors
Tom D'Netto
Ross Zurowski
Adrian Dewhurst
Authors
Tom D'Netto
Ross Zurowski
Adrian Dewhurst
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