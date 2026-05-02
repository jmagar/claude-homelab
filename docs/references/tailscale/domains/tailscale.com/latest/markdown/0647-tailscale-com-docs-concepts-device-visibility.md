What devices can connect to or know mine? · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# What devices can connect to or know mine?
Last validated: Jan 5, 2026
This topic explains how Tailscale manages device visibility and connections between devices in your Tailscale network (known as a [tailnet](/docs/concepts/tailnet)). Understanding these concepts helps you control which devices can connect to each other and what resources they can access.
## [Device visibility in Tailscale](#device-visibility-in-tailscale)
Tailscale creates secure private networks (called tailnets) that connect your devices. By default, Tailscale organizes devices into tailnets based on [identity provider](/docs/integrations/identity) domains. This creates natural boundaries between different organizations:
* Devices in different tailnets cannot know about or connect to each other by default.
* Each tailnet has its own [tailnet policy file](/docs/features/tailnet-policy-file) and [access controls](/docs/features/access-control).
* Cross-tailnet access requires explicit [sharing of devices](/docs/features/sharing).
These boundaries ensure that your organization's devices remain private and inaccessible to users in other organizations, even if they also use Tailscale.
When you create a Tailscale account using an [identity provider](/docs/integrations/identity) with a domain that you own or through a GitHub organization, Tailscale recognizes users as belonging to the same organization. As a result, they will be added to the same tailnet.
The visibility of devices within a tailnet is governed by the tailnet policy file, which defines access controls determining which devices can communicate with each other. This follows a deny-by-default security model, meaning that two devices can only connect if an access rule explicitly lets it.
Although access control policies in Tailscale follow a deny-by-default security model, the default access control policy is to [allow all devices within a tailnet to connect to each other](/docs/reference/examples/grants#allow-all).
### [Default device visibility](#default-device-visibility)
When you create a new tailnet, the default access control policy lets all devices communicate with all other devices. This default policy also lets any device know about all other devices in the tailnet. For example, all other devices appear when running `tailscale status` or reviewing devices in all Tailscale clients.
You can restrict which devices know about each other by implementing more prescriptive access control policies to limit which devices can *access* or *communicate* with other devices.
If you'd like to restrict which devices can be accessed, implementing more prescriptive access control policies will limit which devices can *access* or *communicate* with other devices.
### [Device visibility principles](#device-visibility-principles)
Tailscale implements a concept called *netmap trimming* that determines which devices appear in your Tailscale client. This mechanism helps keep larger tailnets manageable and enhances privacy by showing you only the devices relevant to your work. Your device's visible network map includes:
* Devices that your device can connect to as permitted by the tailnet policy file. This includes both devices in your tailnet and devices shared with you from other tailnets.
* [Exit nodes](/docs/features/exit-nodes) that your device can use, as permitted by your tailnet policy file.
* All devices authenticated with the same user identity as your current device, even if the tailnet policy file doesn't permit you to connect to them. This lets you use [Taildrop](/docs/features/taildrop) if it's enabled in your tailnet.
* All devices that can connect to your device, even if you aren't permitted to connect to them. This visibility enables Tailscale to establish direct connections in as many environments as possible.
## [Manage device access](#manage-device-access)
By default, Tailscale organizes devices into tailnets based on identity provider domains. When you create a Tailscale account using an identity provider with a domain you own or through a GitHub organization, Tailscale recognizes users as belonging to the same organization and adds them to the same tailnet.
### [Access control between devices](#access-control-between-devices)
The tailnet policy file controls access between devices using either [grants](/docs/features/access-control/grants) (the preferred approach) or legacy access control lists ([access control policies](/docs/features/access-control)). Both mechanisms follow the "default deny" principle, meaning:
* Connections between devices are denied by default.
* Connections are only allowed when explicitly permitted by a rule in the tailnet policy file.
* Access control policies define which [users, groups, or tags](/docs/reference/targets-and-selectors) can access specific resources.
### [Cross-organization visibility](#cross-organization-visibility)
If you use Tailscale on your work device, your personal devices won't be visible to co-workers unless you've explicitly shared them. Device visibility follows these principles:
* Co-workers who use a different tailnet than yours cannot connect to or know about your devices.
* Co-workers on the same tailnet can know about and connect to your devices *if allowed by the tailnet policy file*.
* Personal devices on a separate tailnet remain private unless explicitly [shared](/docs/share).
## [Restrict access to your devices](#restrict-access-to-your-devices)
There are two primary approaches to restricting which devices can connect to yours in a tailnet: access control policies through the tailnet policy file and individual device restrictions through the [Tailscale client preferences](/docs/features/client/manage-preferences).
### [Access control policies](#access-control-policies)
Tailnet [Admins](/docs/reference/user-roles) can restrict which devices can connect to each other by defining appropriate access control policies (such as [grants](/docs/features/access-control/grants)) in the tailnet policy file. This is the primary method for controlling access between devices and should be your first approach for managing device visibility.
For example, if a grant policy lets `device-a` connect to `device-b`, that means:
* `device-a` can know about `device-b`.
* `device-b` can know about `device-a`.
Likewise, if there there's no grant rule that lets `device-a` connect to `device-b`, that means:
* `device-a` cannot know about `device-b`.
* `device-b` cannot know about `device-a`.
### [Individual device restrictions](#individual-device-restrictions)
You can also restrict incoming connections from Tailscale to your specific device through the [Tailscale client preferences](/docs/features/client/manage-preferences). This provides an additional layer of control for situations where you need more granular restrictions beyond what the tailnet policy file provides.
On this page
* [Device visibility in Tailscale](#device-visibility-in-tailscale)
* [Default device visibility](#default-device-visibility)
* [Device visibility principles](#device-visibility-principles)
* [Manage device access](#manage-device-access)
* [Access control between devices](#access-control-between-devices)
* [Cross-organization visibility](#cross-organization-visibility)
* [Restrict access to your devices](#restrict-access-to-your-devices)
* [Access control policies](#access-control-policies)
* [Individual device restrictions](#individual-device-restrictions)
Scroll to top