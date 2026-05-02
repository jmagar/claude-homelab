Invalid packet filter · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Invalid packet filter
Last validated: Aug 1, 2025
This topic explains a message that may appear in the Tailscale client and the actions you can take to address it. For a list of currently documented messages in the Tailscale admin console and client, refer to the main [Messages](/docs/reference/messages) topic.
## [Message displayed in the client](#message-displayed-in-the-client)
> Invalid packet filter
> The coordination server sent an invalid packet filter permitting traffic to unlocked nodes; rejecting all packets for safety
## [Reference ID](#reference-id)
`invalid-packet-filter`
## [Why you're seeing this message](#why-youre-seeing-this-message)
The coordination server is responsible for device discovery, authentication, key distribution, policy enforcement, and distributing network configurations to all devices in your tailnet.
This message can display when the coordination server has sent a packet filter configuration considered invalid or unsafe by the client.
Here are some reasons why this message might display:
* There might be issues related to your tailnet policy file such as invalid values including ports, protocol strings, and CIDR details.
* The same tailnet policy file tag is assigned to both Tailscale Funnel and an existing app connector.
* The operating system reporting this error might have system-level packet filters enabled that conflict with the Tailscale client packet filtering. These platforms can include BSD variants, macOS with the Packet Filtering (pf) firewall enabled, and Linux using iptables or nftables.
## [What to do](#what-to-do)
Here are some things you can try to resolve this issue:
* Restart your Tailscale client using the client UI, or run the CLI commands `tailscale down` followed by `tailscale up`.
* Check your internet connection.
* Wait a few minutes and restart the Tailscale client.
* Verify that your tailnet policy file does not contain invalid rules and that Tailscale Funnel and app connectors are not assigned the same tag.
* Check your firewall rules.
## [Additional information](#additional-information)
* For information about using firewalls with Tailscale, refer to [Using Tailscale with your firewall](/docs/integrations/firewalls).
* For information about tailnet policy file usage and syntax, refer to [Syntax reference for the tailnet policy file](/docs/reference/syntax/policy-file).
* For information about coordination server outages, refer to [What happens if the coordination server is down?](/docs/reference/coordination-server-down).
* For information about the Tailscale coordination server, refer to [Control and data planes](/docs/concepts/control-data-planes).
On this page
* [Message displayed in the client](#message-displayed-in-the-client)
* [Reference ID](#reference-id)
* [Why you're seeing this message](#why-youre-seeing-this-message)
* [What to do](#what-to-do)
* [Additional information](#additional-information)
Scroll to top