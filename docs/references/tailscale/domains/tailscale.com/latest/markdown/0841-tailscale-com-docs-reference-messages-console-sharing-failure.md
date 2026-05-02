Failed to load sharing information · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Failed to load sharing information
Last validated: Oct 15, 2025
This topic explains a message that may appear in the Tailscale admin console and the actions you can take to address it. For a list of currently documented messages in the Tailscale admin console and client, refer to the main [Messages](/docs/reference/messages) topic.
## [Message displayed in the admin console](#message-displayed-in-the-admin-console)
> Error: Failed to load sharing information. Please try again later or contact support.
## [Why you're seeing this message](#why-youre-seeing-this-message)
This message might display when attempting to share a device in your tailnet by selecting **Share** for a device in the **Machines** page of the admin console. This may be the result of an issue with the Tailscale control server.
The Tailscale coordination server is responsible for device discovery, authentication, key distribution, policy enforcement, and distributing network configurations to all devices in your tailnet.
## [What to do](#what-to-do)
Here are some things you can try to resolve this issue:
* Wait a while and retry accessing the Tailscale admin console.
* Check the [Tailscale Status](https://status.tailscale.com/) page. If there is an issue on our end that impacts any of our services, it will be reported here.
## [Additional information](#additional-information)
* For information about the Tailscale coordination server, refer to [Control and data planes](/docs/concepts/control-data-planes).
* For information about sharing devices in a tailnet, refer to [Share your machines with other users](/docs/features/sharing).
On this page
* [Message displayed in the admin console](#message-displayed-in-the-admin-console)
* [Why you're seeing this message](#why-youre-seeing-this-message)
* [What to do](#what-to-do)
* [Additional information](#additional-information)
Scroll to top