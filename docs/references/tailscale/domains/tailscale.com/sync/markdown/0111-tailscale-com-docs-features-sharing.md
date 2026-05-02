Share your machines with other users · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Share your machines with other users
Last validated: Jan 5, 2026
Sharing is currently [in beta](/docs/reference/tailscale-release-stages#beta). To try it, follow the steps below to enable it for your network using Tailscale v1.4 or later.
Sharing is available for [all plans](/pricing).
You can share access to specific machines with people outside your Tailscale network (known as a tailnet) without exposing them to the public internet. Sharing gives the recipient access to only the shared machine in your tailnet, and nothing else.
Users in your tailnet can access all machines as governed by [access control policies](/docs/features/access-control); sharing a machine is only required for allowing external users to access a machine.
Sharing respects the access control policies and [MagicDNS](#sharing-and-magicdns) settings of both your tailnet and the recipient's tailnet. Sharing strips [tags](/docs/features/tags), [groups](/docs/reference/syntax/policy-file#groups), and [subnet](#sharing--subnets-subnet-routers) information from the recipient tailnet. A shared machine is visible only to the individual recipient user—it is not visible to the recipient user's entire tailnet.
## [Share a machine with another user](#share-a-machine-with-another-user)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) of a tailnet to share a machine.
To share a machine:
1. Open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console and find the machine you'd like to share.
2. Send invites [by email](#share-using-email) or [manually by using links](#share-using-a-link).
3. [Wait for the recipient to accept](#wait-for-the-recipient-to-accept).
After the recipient accepts the invite, they can access the shared machine from their Tailscale clients and admin console, as if it was on their own tailnet. For example, the macOS app will display it in the menu bar, and Linux apps will find it from `tailscale status`.
Notes about shared machines:
* Tailscale [quarantines](#quarantine) shared machines by default. A shared machine can receive incoming connections (from the other user's tailnet) but cannot start connections. This means users can accept shares without exposing their tailnet to risks.
* As of Tailscale v1.4, shared machines appear in the other tailnet as the sharer, not the owner of the machine. If Ross shares his co-worker Dave's machine to another tailnet, it will appear to be owned by Ross in the new tailnet.
* Unused invite links expire after 30 days.
A machine cannot be shared with a tag or accessed by tagged machines on another tailnet, as only users can accept machine shares.
### [Share using email](#share-using-email)
When you send invites by email, each specified recipient receives a single-use invite link to your machine. The recipient does not need to have a Tailscale account with the same email address. They can log in and accept the share from any Tailscale account.
1. Select the menu, then select **Share** to open the **Share** dialog.
2. Select the **Share by email** tab.
3. Add the email address for each user that you want to send invite links.
4. Select **Share** to send email invitations to each listed email address.
### [Share using a link](#share-using-a-link)
For invite links you plan to share manually, you can choose to make a single-use or reusable invite link. A single-use invite link is a one-time use link. A reusable invite link can be used up to 1,000 times. Unused links expire in 30 days for both single-use and reusable invite links.
1. Select the menu, then select **Share** to open the **Share** dialog.
2. Select **Copy invite link** tab.
3. (Optional): Toggle on **Reusable link** for a link that can be accepted more than once.
4. Select **Copy share link** to create the link and copy it to your clipboard.
5. Share the copied invite link to your intended recipient. Treat the invite link the way you would a password. It provides the ability to connect to a machine within your tailnet.
### [Wait for the recipient to accept](#wait-for-the-recipient-to-accept)
A recipient needs to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) of a tailnet to accept a shared machine invitation.
The recipient can visit the invite link to review your invitation. After they accept, you can find their profile picture and email address in the **Share** dialog. You'll also find an indicator in the **Machines** list on the admin console showing which machines have been shared to external users.
Unused invite links expire after 30 days.
## [Revoke an invite](#revoke-an-invite)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) of a tailnet to revoke a share or share invite.
You can revoke a share or share invite from the [Machines](https://login.tailscale.com/admin/machines) page of the admin console. After you revoke an invite, the recipient user can no longer access the shared machine. To restore access, you must create a new invite and the recipient must accept that new invite.
To revoke an invite:
1. Go to the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
2. Select the **Share** option for the machine.
3. Select the menu \> **Revoke invite**.
## [How sharing works](#how-sharing-works)
Sharing a machine exposes that machine to a user on another tailnet. Only that user is able to access your machine. It is invisible to other users on that tailnet.
In this example, only the shared machine from tailnet A and the share recipient's machines in tailnet B can talk across tailnet boundaries.
When you accept an invite, Tailscale exposes the minimum set of information possible about your tailnet to that machine. Accepting an invite exposes:
* The email and avatar of the recipient (required to help confirm invites)
* Physical machine IPs of machines from your tailnet (required for connections)
### [Quarantine](#quarantine)
Shared machines are quarantined by default. They can respond to incoming connections from the tailnet they're shared to, but cannot start connections on their own. Quarantining helps sharing be "secure by default", since you can accept shares with no risk of exposing your tailnet.
### [Sharing and MagicDNS](#sharing-and-magicdns)
[MagicDNS](/docs/features/magicdns) is a per-tailnet setting. If your tailnet has MagicDNS enabled, you can access machines over MagicDNS regardless of the other tailnet's settings.
Shared machines support MagicDNS in Tailscale v1.4 or later. Shared machines can only be reached by using their fully qualified domain name, which looks like `\<hostname\>.\<tailnet-name\>.ts.net`.
* `\<hostname\>` is the name of a machine.
* `\<tailnet-name\>` is the [tailnet name](/docs/concepts/tailnet-name) of a tailnet.
For example, if your friend shares a machine named `minecraft-server` on the `yak-bebop` tailnet to your tailnet, you can reach it at `minecraft-server.yak-bebop.ts.net`. However, you can't reach it at `minecraft-server` from your tailnet.
Previously, you might have used a tailnet DNS name ending in `.beta.tailscale.net`. If so, migrate to the new tailnet DNS name that ends in `.ts.net`. Support for the `beta.tailscale.net` name ended on **September 13, 2024**.
These restrictions are necessary to prevent MagicDNS names from changing unexpectedly, and to support future features on top of sharing.
### [Sharing and access control policies](#sharing-and-access-control-policies)
When a user accepts a share, the user can make outbound requests to the shared machine, which will adhere to any [access control policies](/docs/features/access-control) defined in the tailnet that owns the shared machine.
By default, the shared machine is quarantined and cannot make outbound requests to the user's machines. However, it's possible to "mutually share" machines, allowing the machines to make outbound connections to each other.
For example, if you have `workstation-1` (owned by `example-company-tailnet`) and `workstation-2` (owned by `sam@example.com`) and you want `workstation-1` and `workstation-2` to have access to each other, you would:
1. Share workstation-1 with `alice@example.com`.
2. Share workstation-2 with `alice@example-company.com`.
If you're [having trouble connecting to a shared machine](#troubleshooting), review your tailnet policy file for rules that might be blocking access.
To write [access rules](/docs/reference/syntax/policy-file#acls) that apply to a shared machine, you can use the email address of the recipient. For example, if you invite `alice@example.com` to share a machine at `100.74.78.2`, you can give Alice access to a particular host.
```
`"grants": [
{
"src": ["group:admins"],
"dst": ["\*"],
"ip": ["\*"]
},
{
"src": ["alice@example.com"],
"dst": ["100.74.78.2"],
"ip": ["\*"]
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
Be careful of rules like `"src": ["\*"]`, which apply to everyone who has access to your tailnet, including invited users. Consider making a group that includes all your tailnet users instead of `\*`.
You can also write access rules by using the special `autogroup:shared` group. This group automatically includes all users invited to your tailnet, and lets you write rules without knowing email addresses in advance.
For example, to restrict invited users to only access web server ports `80` and `443`, you can write a rule like:
```
`"grants": [
// Admins can access everything in the tailnet.
{
"src": ["group:admins"],
"dst": ["\*"],
"ip": ["\*"]
},
// Shared users can only access port 80 and 443 of machines they are invited to.
{
"src": ["autogroup:shared"],
"dst": ["\*"],
"ip": ["80", "443"]
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
Remember: invited users are only able to access machines you've invited them to share. Access rules further limit what they can access. Although the rule `\*:80,443` seems like it lets users access all machines, it only further restricts their access to the ports we've specified.
Sharing does not expose [tag](/docs/features/tags) to the other tailnet. All tag information is stripped and cannot be used in the tailnet policy file of the other tailnet.
### [Sharing and Subnets (subnet routers)](#sharing-and-subnets-subnet-routers)
Shared machines do not advertise [subnets](/docs/features/subnet-routers) to the tailnets they're shared into, while [inviting](/docs/features/sharing/how-to/invite-any-user) external users into your tailnet will give them access to subnet routers.
### [Sharing and Exit Nodes](#sharing-and-exit-nodes)
Sharing an [exit node](/docs/features/exit-nodes) exposes it to the other tailnet.
To share an exit node, use the following sequence:
1. [Advertise the machine as an exit node](/docs/features/exit-nodes#advertise-a-device-as-an-exit-node).
2. If you are not using [`autoApprovers`](/docs/reference/syntax/policy-file#autoapprovers), [allow the exit node from the admin console](/docs/features/exit-nodes#allow-the-exit-node-from-the-admin-console).
3. Share the machine per the instructions above, allowing the recipient to use it as an exit node. Ensure the **Allow use as an exit node** option is checked.
If a [user is deleted](/docs/features/sharing/how-to/remove-team-members), the shared machines they manage will be deleted. If a user is suspended, the shared machines they manage will not be able to connect to other machines.
### [Sharing and suspended or deleted users](#sharing-and-suspended-or-deleted-users)
When you [delete a user](/docs/features/sharing/how-to/remove-team-members), it also deletes the shared machines they manage. If you suspend a user, Tailscale prevents the shared machines they manage from connecting to other machines.
### [Sharing and Tailnet Lock](#sharing-and-tailnet-lock)
A node shared into a tailnet with [Tailnet Lock](/docs/features/tailnet-lock) requires a signature before it is accessible.
To share nodes out of a tailnet with Tailnet Lock, the user who accepts the share invite needs to have their nodes signed in the locked tailnet before they can access the shared node.
### [Sharing and rewards](#sharing-and-rewards)
Every time you share a machine with a unique user, and they accept the invitation, Tailscale increases the device limit on both accounts by two. This applies to every unique domain that accepts a machine you shared. The rewards apply automatically when a user accepts an invitation, and the increased device limit shows on device limits on the [Billing](https://login.tailscale.com/admin/settings/billing) page of the admin console.
### [Troubleshooting](#troubleshooting)
If you can find a machine that was shared with you, but you can't connect to it:
* If you're trying to access the machine by [machine name](/docs/concepts/machine-names) (and not [100.x.y.z](/docs/concepts/tailscale-ip-addresses) address), ensure you have [MagicDNS enabled](/docs/features/magicdns). You can enable MagicDNS from the [DNS](https://login.tailscale.com/admin/dns) page of the admin console.
* Review your tailnet's [access control policies](/docs/features/access-control) to check if you have any rules that might disallow access. If you don't, it's possible the tailnet that shared it with you is restricting the traffic. Ask them to review their access control policies too.
On this page
* [Share a machine with another user](#share-a-machine-with-another-user)
* [Share using email](#share-using-email)
* [Share using a link](#share-using-a-link)
* [Wait for the recipient to accept](#wait-for-the-recipient-to-accept)
* [Revoke an invite](#revoke-an-invite)
* [How sharing works](#how-sharing-works)
* [Quarantine](#quarantine)
* [Sharing and MagicDNS](#sharing-and-magicdns)
* [Sharing and access control policies](#sharing-and-access-control-policies)
* [Sharing and Subnets (subnet routers)](#sharing-and-subnets-subnet-routers)
* [Sharing and Exit Nodes](#sharing-and-exit-nodes)
* [Sharing and suspended or deleted users](#sharing-and-suspended-or-deleted-users)
* [Sharing and Tailnet Lock](#sharing-and-tailnet-lock)
* [Sharing and rewards](#sharing-and-rewards)
* [Troubleshooting](#troubleshooting)
Scroll to top