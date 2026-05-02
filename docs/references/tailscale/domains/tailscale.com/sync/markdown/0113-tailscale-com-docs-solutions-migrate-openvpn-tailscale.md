Migrate from OpenVPN to Tailscale · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Migrate from OpenVPN to Tailscale
Last validated: Jan 5, 2026
## [Introduction](#introduction)
OpenVPN is a popular choice for a virtual private network (VPN), but needs more setup, management, and maintenance compared to Tailscale. Tailscale is a mesh VPN service designed for protection of modern and legacy networks. Tailscale is built on the WireGuard® protocol, providing performance, privacy, and security by default.
To start your migration, you'll create a small network by installing and configuring Tailscale on two devices. Unlike a traditional VPN, you won't need a central gateway server. Next, you'll explore access controls to customize access within your network, and you'll explore how to configure Domain Name System (DNS) settings for handling DNS queries. When you complete the steps in this guide, you'll have a mesh network with end-to-end encrypted connections. You can build upon this network to completely migrate from OpenVPN to Tailscale.
This guide applies to running Tailscale on your entire network. Benefits of running a Tailscale network instead of only replacing an OpenVPN concentrator include:
* End-to-end encryption using WireGuard.
* Fewer re-authentications required.
* More reliable connectivity.
* No hardware required.
* Automatic encryption key management.
* Better network performance.
* Easier maintenance of access controls.
* More comprehensive logging.
* Automatically registered DNS names for devices in your network (through [MagicDNS](/docs/features/magicdns)).
## [How Tailscale differs from OpenVPN](#how-tailscale-differs-from-openvpn)
OpenVPN uses a central server maintained by the user to create and manage encryption keys and client setup, and also to tunnel all network traffic between devices.
Tailscale uses WireGuard for creation of encryption keys, and the control plane handles key management. Tailscale provides client downloads and scripts to streamline installation. Tailscale facilitates direct connections between devices where possible. In the cases where it is not possible, a global set of relay servers to facilitate the network traffic, but these relays never decrypt the WireGuard tunnels between your devices.
## [Prerequisites](#prerequisites)
To follow this guide, you need:
* An email account. Tailscale natively supports the following identity providers:
* Apple
* Google, including Gmail and Google Workspace (G Suite)
* GitHub
* Microsoft, including Microsoft Accounts, Microsoft 365, Active Directory, and Microsoft Entra ID
If you are using a different identity provider, you need to take additional steps. Refer to [Setting up Okta](/docs/integrations/identity/okta), [Setting up OneLogin](/docs/integrations/identity/onelogin), or [Custom OIDC providers](/docs/integrations/identity/custom-oidc), depending on which identity provider you use.
* Two devices on which to install the Tailscale client. For example, you can use laptops, desktops, servers, and cell phones as the devices. Tailscale runs on most operating systems, including Linux, Windows, macOS, iOS, and Android.
## [Create your first tailnet](#create-your-first-tailnet)
Begin your migration to a Tailscale network (known as a tailnet) by installing the Tailscale client on a single device and logging in with the identity provider that you already use. This process automatically creates the tailnet for you.
1. Go to the [Sign up](https://login.tailscale.com/start) page of the admin console and log in using a [single sign-on (SSO) identity provider](/docs/integrations/identity) account.
2. On the **Welcome to Tailscale** page, select **Business use** or **Personal use**. If you plan to use this network with a team at work, select **Business use**. If you plan to use this network at home or with friends and family, select **Personal use**.
After you make your selection, select **Next**.
3. On the **Let's add your first device** page, select the operating system (OS) that corresponds to the device you are using.
Depending on your OS, you have an opportunity to download the Tailscale client or copy a command script. Install the client by using the download or script as needed for your device.
4. When prompted to authenticate the client, log in using the same credentials that you used to create the tailnet in Step 1. Once authenticated, your device appears in the browser window.
With your tailnet created and one device added, you'll connect another device so you can make a network connection between the two devices.
## [Add a second device to your tailnet](#add-a-second-device-to-your-tailnet)
To observe connectivity within your tailnet, add another device.
1. On another device, go to [`https://tailscale.com/download`](/download). Install the Tailscale client by using the download or script as needed for your device, then log in at the Tailscale [Login](https://login.tailscale.com/login) page, using the same credentials that you used for your first device.
2. Open the [Machines](https://login.tailscale.com/admin/machines) page of the Tailscale admin console. You manage your tailnet devices in the **Machines** page. Your two devices are in the list, with information such as the device name, IP address, who manages it, and so on.
3. Open the [Users](https://login.tailscale.com/admin/users) page of the admin console. You manage your tailnet users on this page. Your email account is in the list.
Because you created the tailnet, your [user role](/docs/reference/user-roles) is Owner, which has complete admin access for your tailnet. When other users join your tailnet, you or others that are admins can set their role. A user's role helps determine their access to resources in your tailnet. For example, the [Admin](/docs/reference/user-roles#admin) role has more access to resources than the [Member](/docs/reference/user-roles#member) role, as shown in the [Permission matrix](/docs/reference/user-roles#permission-matrix).
Unlike OpenVPN, which requires a dedicated server maintained by you to manage your network, the Tailscale admin console runs on Tailscale's platform.
With two devices in your tailnet, you can now verify connectivity between the devices.
## [Verify connectivity between the two devices](#verify-connectivity-between-the-two-devices)
Unlike many VPNs, which use a central gateway server between connections, Tailscale devices establish direct peer-to-peer connections.
1. To show that your two devices can communicate with each other, run a [Tailscale CLI](/docs/reference/tailscale-cli) command. The Tailscale CLI runs on Linux, Windows, and macOS. (If you are running macOS, you need to [set up the Tailscale CLI](/docs/reference/tailscale-cli?tab=macos#using-the-tailscale-cli) on your device first.)
At a command prompt on one of your tailnet's devices, ping the other device by running:
```
`tailscale ping \<other-device-name-or-ip\>
`
```
You can determine the value to use for `\<other-device-name-or-ip\>` by going to the [Machines](https://login.tailscale.com/admin/machines) page and copying the name of the other device. Alternatively, you can copy the device IP address.
The `tailscale ping` command typically responds with a `pong` message that indicates how long it took for your `ping` command to receive a response. This shows you that your devices are able to connect and communicate with each other.
2. For another command to get familiar with Tailscale, run:
```
`tailscale netcheck --verbose
`
```
The `tailscale netcheck` command displays a report on your current physical network conditions. Included at the end of the report is the list of Designated Encrypted Relay for Packets (DERP) servers that Tailscale operates, and how long it takes your device to reach each server. DERP servers make the initial connection between devices to establish direct connections. In the case where direct connections are not possible, DERP servers handle [NAT traversal](/blog/how-nat-traversal-works) for the devices.
If you are running Android or iOS, you cannot run the Tailscale CLI. You can still ping other devices using the Tailscale client.
1. On Android, open the Tailscale app. The app shows the list of devices in your tailnet. Long press one of the other devices and then select the Count Down Timer icon. The app shows the result of ten pings from your device to the other device, unless the other device is not connected.
2. On iOS, open the Tailscale app. The app shows the list of devices in your tailnet. Long press one of the other devices and then select **Ping**. The app shows the result of ten pings from your device to the other device, unless the other device is not connected.
With your tailnet in place, you can now move on to restricting access to a device.
## [Configure access control to a device](#configure-access-control-to-a-device)
Within your tailnet, you can restrict access based on users, groups, autogroups, tags, Tailscale IP addresses, and subnet ranges.
To read or update the access controls configured for your tailnet, open the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console. This page shows the tailnet policy for the devices and users allowed to connect in your network. The policy stores as a [tailnet policy file](/docs/features/tailnet-policy-file).
Tailscale initialized your tailnet policy file with a [default allow all access policy](/docs/reference/examples/acls#allow-all-default-acl). This lets you connect to and use Tailscale without restricting any traffic in your network and grants all devices in the tailnet access to all other devices in the tailnet.
To use a different policy that is less permissive than the default policy, edit your tailnet policy file. As an example, the following policy grants all users access to their own devices.
1. Open the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Within the **View file** tab, replace the contents with the following JSON:
```
`{
// All users can access their own devices.
"grants": [
{
"src": ["autogroup:member"],
"dst": ["autogroup:self"],
"ip": ["\*"]
}
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
3. Select **Save**.
It is suitable for many use cases where you want to allow users to access their own devices, but not other devices in the tailnet.
The syntax for this policy contains the following:
* `grants`: The policy is based on grants, as opposed to the legacy (but still supported) access control lists (`acls`).
* `src`: An array of selectors that define the source of the grant. In this case, the array contains the `autogroup:member` [autogroup](/docs/reference/syntax/policy-file#autogroups), which grants access for any user who is a direct member of your tailnet.
* `dst`: An array of selectors that define the destination of the grant. In this case, the array contains the `autogroup:self` autogroup, which grants access for any user that is authenticated as the same user as the source.
* `ip`: An array of strings that define the network-layer capabilities to grant. In this case, the array contains `\*`, which grants access to all ports on the destination.
For more information about the syntax shown in this policy, refer to [Grants](/docs/features/access-control/grants).
You have now modified the tailnet policy file from the default. You're ready to customize it again to provide more granular access control.
## [Restrict access based on user role and purpose](#restrict-access-based-on-user-role-and-purpose)
To let users access devices appropriate for their role and purpose, update your tailnet policy file to use additional controls. For example, configure your policy to support the following scenario:
* All employees can access devices considered for internal use, like a web server that lists company holidays.
* Members of the engineering team can access the devices intended for engineering use only.
* Members of the finance team can access the devices intended for finance use only.
* Members of the legal team can access the devices intended for legal use only.
* Your tailnet's admins (such as the IT team) can manage which devices are considered as internal, engineering, finance, or legal.
To designate a purpose for a device, Tailscale provides [tags](/docs/features/tags), which let you manage access control for the device.
You define groups and tags directly in your tailnet policy file.
1. Open the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console and make the **View file** tab the active tab.
2. Add a `groups` array, and add an entry to define each team and its members.
```
`{
"groups": {
// Alice and Frank are in group:engineering
"group:engineering": ["alice@example.com", "frank@example.com"],
// Bob and Dana are in group:finance
"group:finance": ["bob@example.com", "dana@example.com"],
// Carl is in group:legal
"group:legal": ["carl@example.com"]
},
// All users can access their own devices.
"grants": [
{
"src": ["autogroup:member"],
"dst": ["autogroup:self"],
"ip": ["\*"]
},
]
}
`
```
The [`groups`](/docs/reference/syntax/policy-file#groups) section lets you create groups of users, which you can use in access rules, instead of listing users out explicitly. This policy creates groups `group:engineering`, `group:finance`, and `group:legal`, and adds an array of users to each group. For example, `group:engineering` contains `alice@example.com` and `frank@example.com` as members.
3. Within the `grants` array, add grants for the `engineering` team:
```
` // All users can access their own devices.
"grants": [
{
"src": ["autogroup:member"],
"dst": ["autogroup:self"],
"ip": ["\*"]
},
// Users in group:engineering can access devices tagged with tag:engineering
{
"src": ["group:engineering"],
"dst": ["tag:engineering"],
"ip": ["\*"]
},
]
`
```
The `src` is the previously created `group:engineering` group. The `dst` is the `tag:engineering` tag, which results in any member of the engineering team being able to access devices that contain the `tag:engineering` tag.
4. Also add grants for the `finance` and `legal` teams:
```
` // All users can access their own devices.
"grants": [
{
"src": ["autogroup:member"],
"dst": ["autogroup:self"],
"ip": ["\*"]
},
// Users in group:engineering can access devices tagged with tag:engineering
{
"src": ["group:engineering"],
"dst": ["tag:engineering"],
"ip": ["\*"]
},
// Users in group:finance can access devices tagged with tag:finance
{
"src": ["group:finance"],
"dst": ["tag:finance"],
"ip": ["\*"]
},
// Users in group:legal can access devices tagged with tag:legal
{
"src": ["group:legal"],
"dst": ["tag:legal"],
"ip": ["\*"]
},
]
`
```
5. Add a grant entry that grants all tailnet members access to devices tagged as `tag:internal`.
```
` // All users can access their own devices.
"grants": [
{
"src": ["autogroup:member"],
"dst": ["autogroup:self"],
"ip": ["\*"]
},
// Users in group:engineering can access devices tagged with tag:engineering
{
"src": ["group:engineering"],
"dst": ["tag:engineering"],
"ip": ["\*"]
},
// Users in group:finance can access devices tagged with tag:finance
{
"src": ["group:finance"],
"dst": ["tag:finance"],
"ip": ["\*"]
},
// Users in group:legal can access devices tagged with tag:legal
{
"src": ["group:legal"],
"dst": ["tag:legal"],
"ip": ["\*"]
},
// All employees can access devices tagged with tag:internal
{
"src": ["autogroup:member"],
"dst": ["tag:internal"],
"ip": ["\*"]
}
],
`
```
6. Below the `grants` array, but before the closing bracket of your tailnet policy file, define a `tagOwners` section. Within the `tagOwners` section, add an entry to define each tag and the members of your tailnet that can apply the tag to a device. For brevity of this example, make the `autogroup:admin` [autogroup](/docs/reference/syntax/policy-file#autogroups) the tag owner.
```
` // All employees can access devices tagged with tag:internal
{
"src": ["autogroup:member"],
"dst": ["tag:internal"],
"ip": ["\*"]
}
],
"tagOwners": {
// Users who are Tailscale admins can apply the tag tag:engineering
"tag:engineering": ["autogroup:admin"],
// Users who are Tailscale admins can apply the tag tag:finance
"tag:finance": ["autogroup:admin"],
// Users who are Tailscale admins can apply the tag tag:legal
"tag:legal": ["autogroup:admin"],
// Users who are Tailscale admins can apply the tag tag:internal
"tag:internal": ["autogroup:admin"]
}
}
`
```
Now any [Admin](/docs/reference/user-roles#admin) in your tailnet can apply the tags to devices.
7. The following shows the entire tailnet policy file:
```
`{
"groups": {
// Alice and Frank are in group:engineering
"group:engineering": ["alice@example.com", "frank@example.com"],
// Bob and Dana are in group:finance
"group:finance": ["bob@example.com", "dana@example.com"],
// Carl is in group:legal
"group:legal": ["carl@example.com"]
},
// All users can access their own devices.
"grants": [
{
"src": ["autogroup:member"],
"dst": ["autogroup:self"],
"ip": ["\*"]
},
// Users in group:engineering can access devices tagged with tag:engineering
{
"src": ["group:engineering"],
"dst": ["tag:engineering"],
"ip": ["\*"]
},
// Users in group:finance can access devices tagged with tag:finance
{
"src": ["group:finance"],
"dst": ["tag:finance"],
"ip": ["\*"]
},
// Users in group:legal can access devices tagged with tag:legal
{
"src": ["group:legal"],
"dst": ["tag:legal"],
"ip": ["\*"]
},
// All employees can access devices tagged with tag:internal
{
"src": ["autogroup:member"],
"dst": ["tag:internal"],
"ip": ["\*"]
}
],
"tagOwners": {
// Users who are Tailscale admins can apply the tag tag:engineering
"tag:engineering": ["autogroup:admin"],
// Users who are Tailscale admins can apply the tag tag:finance
"tag:finance": ["autogroup:admin"],
// Users who are Tailscale admins can apply the tag tag:legal
"tag:legal": ["autogroup:admin"],
// Users who are Tailscale admins can apply the tag tag:internal
"tag:internal": ["autogroup:admin"]
}
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
8. Select **Save**.
Now that you have defined tags for your tailnet, set up a device with the tag named `tag:engineering`.
1. Add a new device to your tailnet, as done in the [Add a second device to your tailnet](#add-a-second-device-to-your-tailnet) section.
2. Open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
3. Select the machine that you added to your tailnet.
4. Select the menu.
5. Select **Edit ACL tags**.
6. Select **Add tags**.
7. Select the tag `tag:engineering`.
8. Select **Save**.
You have now set up identity-first networking based on purpose for your tailnet. For example, any member of the `group:engineering` group can access this device because the policy permits it. Anyone outside of the `group:engineering` cannot access the device.
In addition to tagging a device by using the admin console, you can tag devices using the Tailscale CLI and the Tailscale API.
For additional information about access control within Tailscale, refer to [Manage access](/docs/manage).
Now that you have explored access control, move on to DNS configuration.
## [Configure DNS settings](#configure-dns-settings)
If your OpenVPN configuration requires clients to use specific DNS servers, configure your tailnet to do the same. By default, your tailnet has [MagicDNS](/docs/features/magicdns) enabled, which means that your tailnet automatically registers DNS names for devices in your network. You only need to add other DNS servers if you want to use global nameservers or restricted nameservers (known as split DNS).
1. Open the [DNS](https://login.tailscale.com/admin/dns) page in the Tailscale admin console.
2. In the **Nameservers** section, select **Add nameserver** and then add any public DNS servers, as well as custom DNS servers, that you want to use.
3. Also in the [DNS](https://login.tailscale.com/admin/dns) page in the Tailscale admin console, add any search domains. Search domains provide a convenient way for users to access local network resources without having to specify the full domain path every time they connect to a resource. You can specify a list of domain suffixes that are automatically appended to any domain name that is not a fully qualified domain name (FQDN).
Now when users in your tailnet browse the internet or perform other network communication, their DNS queries resolve to the hosts as configured by your DNS settings.
## [Conclusion](#conclusion)
You created a Tailscale network and installed the Tailscale client on two devices. You ensured that the two devices can connect to each other. You also used the Tailscale admin console to manage users, devices, and access control (among other tasks not yet shown). And if your OpenVPN configuration used specific DNS servers, you configured Tailscale to use the same DNS servers.
Continue on to discover more about Tailscale networking features and how to configure them in your tailnet.
## [Further exploration](#further-exploration)
Explore Tailscale features that let you customize network traffic routes, use SSH to securely connect to devices, and manage users and devices. Also discover features that let you enable HTTPS for your devices, as well as monitor your tailnet configuration and network traffic flow.
### [Access devices where you can't install the Tailscale client](#access-devices-where-you-cant-install-the-tailscale-client)
Tailscale works best when you install the Tailscale client on every device in your organization. This enforces end-to-end traffic encryption without additional configuration.
However, there are situations where you can't or don't want to install the Tailscale client on each device. For example, some devices, like printers, might not allow installing the Tailscale client. Additionally, installing the Tailscale client on every device might not make sense. This is true when connecting many devices, like an entire virtual private cloud (VPC), or gradually deploying Tailscale to a legacy network. In these cases, you can set up a [subnet router](/docs/features/subnet-routers) to access these devices from your tailnet. Subnet routers act as a gateway, relaying traffic from your tailnet to a physical subnet. For OS-specific instructions for setting up and using a subnet router, refer to [Set up a subnet router](/docs/features/subnet-routers#set-up-a-subnet-router).
When you set up a subnet router, use the same Classless Inter-domain Routing (CIDR) values that you used in OpenVPN.
When you add [access rules for the advertised subnet routes](/docs/features/subnet-routers?tab=linux#add-access-rules-for-the-advertised-subnet-routes), in Tailscale you grant access to the routes themselves (such as `192.0.2.0/24`). This is different from OpenVPN, which grants routing access to a device, not to the routes that the device provides.
When you set up a device to serve as a subnet router, you need to [enable the subnet routes in the admin console](/docs/features/subnet-routers#enable-subnet-routes-from-the-admin-console) unless you have set up [auto approvers](/docs/reference/syntax/policy-file#autoapprovers). Use auto approvers so that when a device authenticated by a user that has access for the specified routes (as configured in the [`autoApprovers`](/docs/reference/syntax/policy-file#autoapprovers) section of your tailnet policy file), the device automatically has subnet routes approval.
### [Route public internet traffic through a single device](#route-public-internet-traffic-through-a-single-device)
There might be times when you want Tailscale to route your public internet traffic. For example, you might want to route all your public internet traffic if:
* You're in a coffee shop with untrusted Wi-Fi.
* You're traveling overseas and need access to an online service (such as banking) only available in your home country.
You can route all your public internet traffic by setting a device on your network as an [exit node](/docs/features/exit-nodes). When you route all traffic through an exit node, you're effectively using default routes (`0.0.0.0/0, ::/0`), similar to how you would if you were using a typical virtual private network (VPN). For OS-specific instructions for setting up and using an exit node, refer to [Use exit nodes](/docs/features/exit-nodes/how-to/setup).
When you set up a device to serve as an exit node, you need to [allow the exit node from the admin console](/docs/features/exit-nodes#allow-the-exit-node-from-the-admin-console) unless you have set up [auto approvers](/docs/reference/syntax/policy-file#autoapprovers). Use auto approvers so that when a device authenticated by a user that has access for the specified routes (as configured in the [`autoApprovers`](/docs/reference/syntax/policy-file#autoapprovers) section of your tailnet policy file), the device automatically has exit node approval.
### [Control access to third-party and SaaS apps](#control-access-to-third-party-and-saas-apps)
[App connectors](/docs/features/app-connectors) let you control access to third-party and software as a service (SaaS) applications available over your tailnet in the same way that you would for self-hosted applications. For information about using an app connector, refer to [App connectors](/docs/features/app-connectors).
### [Establish and record SSH sessions](#establish-and-record-ssh-sessions)
[Tailscale SSH](/docs/features/tailscale-ssh) lets Tailscale manage the authentication and authorization of SSH connections in your tailnet. With Tailscale SSH, you can SSH to a device as normal, and optionally verify high-risk connections with [check mode](/docs/features/tailscale-ssh#check-mode).
[Tailscale SSH session recording](/docs/features/tailscale-ssh/tailscale-ssh-session-recording) lets you stream logs of Tailscale SSH sessions to another device in your tailnet. These recordings use end-to-end encryption just like all other Tailscale traffic.
### [Add and approve users and devices](#add-and-approve-users-and-devices)
There's several ways to add users to your tailnet. For details, refer to [Inviting users](/docs/features/sharing/how-to/invite-users).
User approval is a feature that lets Tailscale network administrators review and approve new users before they can join your tailnet. When you enable user approval, the first time a new user logs in to a tailnet, the user's status is pending. While in a pending state, the user can connect their device to the Tailscale coordination server, but cannot connect to other devices in the tailnet. An Owner, Admin, or IT admin of the tailnet can review the user information and set the user status to approved, or remove the user. For information about enabling user approval, refer to [Enable user approval for your network](/docs/features/access-control/user-approval#enable-user-approval-for-your-network).
Device approval is a feature that lets Tailscale network administrators review and approve new devices before they can join your tailnet. Use device approval to ensure only trusted devices, such as workplace-managed laptops and phones, can access a network. For information about enabling device approval, refer to [Enable device approval for your network](/docs/features/access-control/device-management/device-approval#enable-device-approval-for-your-network).
### [Use auth keys to add new devices](#use-auth-keys-to-add-new-devices)
You can use pre-authenticated keys ("auth keys") to register new devices without needing to sign in using a web browser. This applies whether or not you enable device approval. For details, refer to [Register a device with an auth key](/docs/features/access-control/auth-keys#register-a-node-with-the-auth-key).
### [Enable HTTPS](#enable-https)
Connections between Tailscale nodes use end-to-end encryption. Browsers, web APIs, and products like VS Code are not aware of that, however, and can warn users or disable features based on the fact that HTTP URLs to your tailnet services look unencrypted since they're not using Transport Layer Security (TLS) certificates. To provision TLS certificates for devices in your tailnet, refer to [Enabling HTTPS](/docs/how-to/set-up-https-certificates).
### [Monitor tailnet configuration and network flow](#monitor-tailnet-configuration-and-network-flow)
[Configuration audit logs](/docs/features/logging/audit-logging) let you identify *who* did *what*, and *when*, in your tailnet. Configuration audit logs record actions that modify a tailnet's configuration, including the type of action, the actor, the target resource, and the time. Tailscale enables configuration audit logs for all tailnets and you cannot turn them off. You can monitor your configuration audit logs in the [Logs](https://login.tailscale.com/admin/logs) page of the admin console.
Network flow logs let you understand how and when nodes in your tailnet connect to each other. The data captured in network logs is the flow of network traffic, not the contents of network traffic. Tailscale does not and cannot inspect your traffic. For information about enabling network flow logs, refer to [Enable network flow logs](/docs/features/logging/network-flow-logs#enable-network-flow-logs).
On this page
* [Introduction](#introduction)
* [How Tailscale differs from OpenVPN](#how-tailscale-differs-from-openvpn)
* [Prerequisites](#prerequisites)
* [Create your first tailnet](#create-your-first-tailnet)
* [Add a second device to your tailnet](#add-a-second-device-to-your-tailnet)
* [Verify connectivity between the two devices](#verify-connectivity-between-the-two-devices)
* [Configure access control to a device](#configure-access-control-to-a-device)
* [Restrict access based on user role and purpose](#restrict-access-based-on-user-role-and-purpose)
* [Configure DNS settings](#configure-dns-settings)
* [Conclusion](#conclusion)
* [Further exploration](#further-exploration)
* [Access devices where you can't install the Tailscale client](#access-devices-where-you-cant-install-the-tailscale-client)
* [Route public internet traffic through a single device](#route-public-internet-traffic-through-a-single-device)
* [Control access to third-party and SaaS apps](#control-access-to-third-party-and-saas-apps)
* [Establish and record SSH sessions](#establish-and-record-ssh-sessions)
* [Add and approve users and devices](#add-and-approve-users-and-devices)
* [Use auth keys to add new devices](#use-auth-keys-to-add-new-devices)
* [Enable HTTPS](#enable-https)
* [Monitor tailnet configuration and network flow](#monitor-tailnet-configuration-and-network-flow)
Scroll to top