Inviting users vs sharing a device · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Inviting users vs sharing a device
Last validated: Jan 5, 2026
Tailscale offers two ways to share access to devices and services:
* [Invite someone to your Tailscale network (known as a tailnet)](#inviting-a-user).
* [Give someone in another tailnet access to a device within your tailnet](#sharing-a-device).
Both options have pros and cons, and each works best for certain scenarios. Review the following sections to understand each option.
## [Inviting a user](#inviting-a-user)
You can share access to the devices and resources in your tailnet by [inviting another user](/docs/features/sharing/how-to/invite-any-user). An invited user can access any device or service in your tailnet by default. You can control what they can access using [access controls](/docs/features/access-control). For example, you could invite a user and restrict their access to a few devices.
When inviting someone, you must choose their [role](/docs/reference/user-roles). The role you choose determines what they can and cannot do within your tailnet. For example, you could make them a [Member](/docs/reference/user-roles#member) and allow them to access devices and services (as specified by access controls) but not the admin console.
Inviting a user is best when you're sharing more than few devices, especially if the user needs to have access to new devices as they get added to your tailnet. Inviting a user also lets you change what they have access to over time without having to share and revoke access to individual devices each time.
The following table lists the pros and cons of inviting a user (instead of sharing a device).
|**Pros**|**Cons**|
|User can access the entire tailnet (limited by access controls).|Increases the user count of your tailnet.|
|You can configure access control policies for the user.||
|You can select the user's role.||
|User can access devices behind [subnet routers](/docs/features/subnet-routers).||
|User can use Tailscale features like (like [Taildrop](/docs/features/taildrop)).||
|User can add devices to the tailnet.||
## [Sharing a device](#sharing-a-device)
You can [share a device](/docs/features/sharing) with people outside your tailnet without exposing it to the public internet. After you share a device with another Tailscale user, the device appears in their tailnet like any other device, including in the [Machines](https://login.tailscale.com/admin/machines) page of the admin console. Only the people you shared the device with will be able to access it, even if they are in the same tailnet.
Note that both your tailnet and theirs must have [access controls](/docs/features/access-control) that allow connections to the shared device. The default tailnet policy file permits this, but if either tailnet has a custom [policy file](/docs/reference/glossary#tailnet-policy-file), you must ensure it grants access to the shared device.
Sharing a device is best when you're sharing a fixed number of devices and the user doesn't need access to all Tailscale's functionality.
The following table lists the pros and cons of sharing a device (instead of inviting a user).
|**Pros**|**Cons**|
|User can access one or a small fixed number of devices.|Can't access devices behind [subnet routers](/docs/features/subnet-routers).|
|User can access the device while connected to a different tailnet.|Can't use Tailscale features like (like [Taildrop](/docs/features/taildrop)).|
|Doesn't increase the user count of your tailnet.|Can't add new devices.|
||Can't create access control policies for the user.|
On this page
* [Inviting a user](#inviting-a-user)
* [Sharing a device](#sharing-a-device)
Scroll to top