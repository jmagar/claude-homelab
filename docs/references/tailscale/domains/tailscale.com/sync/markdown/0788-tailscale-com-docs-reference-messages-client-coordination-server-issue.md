Coordination server reports an issue · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Coordination server reports an issue
Last validated: Aug 1, 2025
This topic explains a message that may appear in the Tailscale client and the actions you can take to address it. For a list of currently documented messages in the Tailscale admin console and client, refer to the main [Messages](/docs/reference/messages) topic.
## [Message displayed in the client](#message-displayed-in-the-client)
> Coordination server reports an issue
> The coordination server is reporting a health issue:
`> &lt;reported-issue&gt;
`
## [Reference ID](#reference-id)
`control-health`
## [Why you're seeing this message](#why-youre-seeing-this-message)
The coordination server is responsible for device discovery, authentication, key distribution, policy enforcement, and distributing network configurations to all devices in your tailnet.
This message may appear when the coordination server is not reachable. There are multiple reasons why this can happen, including the following:
* There is an issue on our end.
* A router, firewall, or network configuration was recently updated, causing connectivity issues.
* You were recently assigned a new public IP address and the client is attempting to re-establishing a connection to the coordination server.
## [What to do](#what-to-do)
Here are some things you can try to resolve this issue:
* Restart your Tailscale client using the client UI, or run the CLI commands `tailscale down` followed by `tailscale up`.
* Check your internet connection.
* Wait a few minutes and restart the Tailscale client.
* Check your firewall rules.
* Check the [Tailscale Status](https://status.tailscale.com) page. If there is an issue on our end that impacts any of our services, it will be reported here.
## [Additional information](#additional-information)
* For information about coordination server outages, refer to [What happens if the coordination server is down?](/docs/reference/coordination-server-down).
* For information about the Tailscale coordination server, refer to [Control and data planes](/docs/concepts/control-data-planes).
* For information about using firewalls with Tailscale, refer to [Using Tailscale with your firewall](/docs/integrations/firewalls).
On this page
* [Message displayed in the client](#message-displayed-in-the-client)
* [Reference ID](#reference-id)
* [Why you're seeing this message](#why-youre-seeing-this-message)
* [What to do](#what-to-do)
* [Additional information](#additional-information)
Scroll to top