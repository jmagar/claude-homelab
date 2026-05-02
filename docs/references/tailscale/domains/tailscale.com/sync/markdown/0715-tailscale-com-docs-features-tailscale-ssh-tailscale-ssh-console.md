Tailscale SSH Console · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale SSH Console
Last validated: Jan 5, 2026
Tailscale SSH Console lets you establish a [Tailscale SSH](/docs/features/tailscale-ssh) session in your browser. Use
this feature to create a browser-based SSH session from the admin console to a node in your tailnet.
Tailscale SSH Console is currently [in beta](/docs/reference/tailscale-release-stages#beta).
The Tailscale SSH Console feature is available on all plans.
## [How it works](#how-it-works)
Using [WebAssembly](https://webassembly.org) (also known as Wasm), Tailscale SSH Console runs in the browser: the Tailscale client code, WireGuard®, a userspace networking stack, and an SSH client. When you establish a session, Tailscale generates an [ephemeral](/docs/features/ephemeral-nodes) auth key with your identity, and then uses the auth key to create a new ephemeral node for your browser session. The ephemeral node can be used as a source for Tailscale SSH, and is automatically removed when the browser session is terminated.
The ephemeral node is named with a format like `tailscale-ssh-console-hostname-nnnnn` (explained in [more detail](#ephemeral-tailscale-ssh-console-node)).
Once the ephemeral node is authorized, the auth key used to authorize the node is revoked. The auth key will appear in the [Keys](https://login.tailscale.com/admin/settings/keys) in the admin console, and it will have the **SSH Console** badge. The auth key's creation and revocation events will appear in the [configuration audit logs](/docs/features/logging/audit-logging).
With Tailscale SSH Console, your browser is a node in your tailnet. Like other connections in Tailscale, Tailscale Console SSH session is end-to-end encrypted using WireGuard. The node's WireGuard key for the SSH client is stored in memory in the browser, and is available for the length of the browser session. Tailscale cannot access nor read your session traffic. Note that traffic is relayed over our [encrypted TCP relays (DERP)](/docs/reference/derp-servers), but the DERP servers cannot decrypt your traffic.
## [Prerequisites](#prerequisites)
* You need to be an [Owner, Admin, IT admin, or Network admin](/docs/reference/user-roles) of a
tailnet to use the Tailscale SSH Console feature.
* The node that you want to connect to needs to be [configured for Tailscale SSH](/docs/features/tailscale-ssh).
* There needs to be a [Tailscale SSH policy](/docs/reference/syntax/policy-file#ssh) rule that enables access to the node on port `22`. Access control policies can be written only for nodes that you own or [tagged](/docs/features/tags) nodes.
* If you are using [Device Posture Conditions](/docs/features/device-posture#device-posture-conditions) to restrict SSH access, you will need to make sure that connections from Tailscale SSH console are being permitted. You can find the values of [posture attributes](/docs/features/device-posture#device-posture-attributes) for the SSH client ephemeral node while it's running on the **Machine Details** page. Since the SSH Console is running in a browser, its `node:os` attribute has the value of `js`.
## [Creating a Tailscale SSH Console session](#creating-a-tailscale-ssh-console-session)
1. Open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
2. Locate the node that you want to connect to. You can search for the node by machine name, owner, whether it has Tailscale SSH enabled, and the like. For more information, refer to [Filter devices in the admin console](/docs/features/access-control/device-management/how-to/filter).
3. Select the menu at the far right of the node and select **SSH to machine**. Alternatively, you can hover over
the node and select **SSH**.
If you can't find the **SSH** option, then either the node isn't configured for Tailscale SSH, or access control policies do not permit you to use Tailscale SSH for the node.
4. In the new window that pops up, select the local username that you want to connect as. If there is no dropdown, type the local username in the text box.
Any local usernames listed in the dropdown are generated from the users explicitly listed in the [SSH](/docs/reference/syntax/policy-file#ssh) section
of the [tailnet policy file](/docs/features/access-control/acls). There might be more users than are listed in the dropdown. For example, if the SSH policy specifies
`autogroup:nonroot`, any non-root users recognized locally would work. In that case, you can select **Other** as the value for
**Local username**, and enter the local username in the text box that appears when you select **Other**.
5. Select **SSH**.
6. In the authentication window that pops up, follow the prompts to re-authenticate. You will need to re-authenticate every new Tailscale SSH Console session.
7. Assuming your re-authentication is successful, a new browser window with the title **Tailscale — SSH to *Machine name***
opens. You are now in the Tailscale SSH Console session.
If you are still in the browser session and SSH to another device, the browser will re-use this same Tailscale SSH Console session.
## [Ephemeral Tailscale SSH Console node](#ephemeral-tailscale-ssh-console-node)
When you create a Tailscale SSH Console session, Tailscale creates a new [ephemeral](/docs/features/ephemeral-nodes) node in your tailnet. You can find it in the [Machines](https://login.tailscale.com/admin/machines) page of the admin console. This node does not require manual authorization—the authorization is assumed because an admin
created the session. The node is owned by the user that created the session and has a machine name of the form:
 `tailscale-ssh-console-hostname-nnnnn`
where:
* `hostname` is the "email-ish" name of the user with disallowed characters replaced by dashes. For most users,
the hostname is based on an email address; the user `alice@example.com` has a Tailscale SSH Console hostname of
`alice-example-com`). For users that sign in with GitHub, the hostname is of the form `username-github`.
* `nnnnn` is a randomly assigned string.
For example, if the user `alice@example.com` creates a Tailscale SSH Console session, the ephemeral node name would look like `tailscale-ssh-console-alice-example-com-12345abcde`.
This node also has the **Ephemeral** and **SSH Console** badges. The **SSH Console** badge indicates the node is a browser running Tailscale SSH Console. Because it is an ephemeral node, the node will be automatically removed shortly after the session is terminated.
## [Ending a Tailscale SSH Console session](#ending-a-tailscale-ssh-console-session)
There are multiple ways to end a Tailscale SSH Console session.
* Within the **Tailscale — SSH** browser window, you can end the session by running the `exit` command or closing the window.
* If you reload or end the browser session that you used to create the Tailscale SSH Console session, the Tailscale SSH Console will end.
* A Tailscale SSH Console session will end automatically if access control policies are changed to no longer allow the user with access.
## [Audit logging of Tailscale SSH Console sessions](#audit-logging-of-tailscale-ssh-console-sessions)
When a user starts a Tailscale SSH Console session, the creation of the session will appear in
[configuration audit logs](/docs/features/logging/audit-logging). This includes the following events:
* Creating an auth key
* Creating a node and naming it in the `tailscale-ssh-console-hostname-nnnnn` format
* Authorizing the node using the auth key
* Revoking the auth key
* Updating the key expiry time for the node
* Logging in to the node
When the Tailscale Console SSH session is terminated, the node deletion will appear as an event in the configuration audit log.
For each of the logged events, the log entry will show who performed the action, and when the action occurred.
## [Limitations](#limitations)
* Tailscale SSH Console sessions must be initiated from the Tailscale admin console—you cannot generate a standalone SSH session.
* Only [Owner, Admin, IT admin, or Network admin](/docs/reference/user-roles) users of a tailnet can use Tailscale SSH Console.
* All Tailscale SSH Console traffic uses [DERP relay servers](/docs/reference/derp-servers).
On this page
* [How it works](#how-it-works)
* [Prerequisites](#prerequisites)
* [Creating a Tailscale SSH Console session](#creating-a-tailscale-ssh-console-session)
* [Ephemeral Tailscale SSH Console node](#ephemeral-tailscale-ssh-console-node)
* [Ending a Tailscale SSH Console session](#ending-a-tailscale-ssh-console-session)
* [Audit logging of Tailscale SSH Console sessions](#audit-logging-of-tailscale-ssh-console-sessions)
* [Limitations](#limitations)
Scroll to top