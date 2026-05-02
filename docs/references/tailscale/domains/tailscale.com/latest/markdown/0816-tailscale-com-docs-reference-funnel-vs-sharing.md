Funnel vs. sharing devices · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Funnel vs. sharing devices
Last validated: Aug 3, 2025
Tailscale offers more than one way to serve and share resources. You can use [Tailscale Funnel](/docs/features/tailscale-funnel) to share resources outside your Tailscale network (known as a [tailnet](/docs/concepts/tailnet)) or use [device sharing](/docs/features/sharing) to share an entire device with someone. The following table lists the differences between these features and describes when each works best.
||**Funnel**|**Sharing a device**|
|**Purpose**|Expose local services to the public internet.|Share specific devices with a single person.|
|**Access**|Anyone with the Funnel URL can access the shared service.|The specific person you shared the device with.|
|**Use case example**|Sharing a local web server with a contract employee.|Giving someone temporary access to a device in your tailnet.|
Although both Funnel and device sharing serve similar purposes: to share with someone outside of your tailnet, their use cases and functionality differ.
## [Funnel](#funnel)
Funnel is for more ephemeral purposes where you might quickly share a link with someone. It doesn't work with other Tailscale features like [subnet routers](/docs/features/subnet-routers), [exit nodes](/docs/features/exit-nodes), or [access controls](/docs/features/access-control).
Funnel works best for sharing a single resource, such as a service or a folder, temporarily. You can share the resource using a unique Funnel URL. The person you share the URL with can only access the resource when their device is online, the service is running, and Funnel is running.
Use Funnel to:
* Temporarily share a service running on your device with anyone on the public internet.
* Temporarily share a file or a folder on your device with anyone on the public internet.
Consider using device sharing instead if:
* You need to share with only a specific person.
* You want the person to retain access to the device until you unshare the device.
* You want to apply access control policies to the person you're sharing with.
* You want to share more than a single service.
[
#### Tailscale Funnel
Securely route internet traffic to local services using Tailscale Funnel.
](/docs/features/tailscale-funnel)
## [Sharing a device](#sharing-a-device)
Sharing a device is more temporary than [inviting someone to your tailnet](/docs/features/sharing/how-to/invite-users) (which increases your user count), but less temporary than sharing a single resource with Funnel.
Sharing a device works best for sharing an entire device with someone outside your tailnet. When you share a device, you send an invite link to the person you want to share with. Tailscale automatically [quarantines](/docs/features/sharing#quarantine) devices you share. This means the shared device can only respond to inbound connections; it cannot use outbound connections. You can further refine their access with [access control policies](/docs/features/access-control) for shared devices. For example, you can apply an access control policy to the user's email address so that they can only access port `22` on devices tagged with `tag:shared`.
Use device sharing to share a single device with a specific person in a quarantined way that you can further manage using access control policies.
Consider using Funnel instead if you only need to share a single service for a short period of time.
[
#### Share your machines with other users
Give a Tailscale user on another tailnet access to a private machine within your tailnet, without exposing the machine publicly.
](/docs/features/sharing)
## [Example scenarios](#example-scenarios)
The following section describes example scenarios and whether Funnel or device sharing would work best.
|**Scenario**|**Recommendation**|
|You have a local development build of a web server running on your device and you want to share a preview of your changes with a co-worker.|[Use Funnel](/docs/features/tailscale-funnel)|
|You're hosting a Plex media server in your tailnet and you want to give a friend access to it so they can access your movie collection.|[Use device sharing](/docs/features/sharing)|
|You're running a Minecraft server in your tailnet and you want to let one or more of your friends join.|[Use device sharing](/docs/features/sharing)|
|You hired a contract developer and you want to give them access to a development server in your tailnet.|[Use device sharing](/docs/features/sharing)|
|You're working on an integration project locally and you want to test a GitHub webhook receiver without deploying your project to the cloud.|[Use Funnel](/docs/features/tailscale-funnel)|
On this page
* [Funnel](#funnel)
* [Sharing a device](#sharing-a-device)
* [Example scenarios](#example-scenarios)
Scroll to top