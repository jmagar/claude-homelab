Relay server unavailable · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Relay server unavailable
Last validated: Jul 31, 2025
This topic explains a message that may appear in the Tailscale client and the actions you can take to address it. For a list of currently documented messages in the Tailscale admin console and client, refer to the main [Messages](/docs/reference/messages) topic.
## [Message displayed in the client](#message-displayed-in-the-client)
> Relay server unavailable
> Tailscale could not connect to the
`> &lt;derp-server&gt;
`> relay server. Your internet connection might be down, or the server might be temporarily unavailable.
## [Reference ID](#reference-id)
`no-derp-connection`
## [Why you're seeing this message](#why-youre-seeing-this-message)
This message indicates that the Tailscale client is unable to connect to a specific DERP (Designated Encrypted Routing Protocol) relay server, which Tailscale uses as a fallback method for routing traffic when direct peer-to-peer connections are not possible. Typically, the DERP server mentioned in the message is the one that is closest to your geographic location. If this issue occurs, the Tailscale client might attempt to connect to the next closest DERP server.
## [What to do](#what-to-do)
Here are some things you can try to resolve this issue:
* Restart your Tailscale client using the client UI, or run the CLI commands `tailscale down` followed by `tailscale up`.
* Check your internet connection.
* If you are using a firewall, verify that the ports and domains used for connecting to Tailscale are not blocked.
## [Additional information](#additional-information)
* For information about the ports and domain names used to communicate with Tailscale, refer to [What firewall ports should I open to use Tailscale?](/docs/reference/faq/firewall-ports).
* For information about the Designated Encrypted Routing Protocol, refer to [DERP servers](/docs/reference/derp-servers).
On this page
* [Message displayed in the client](#message-displayed-in-the-client)
* [Reference ID](#reference-id)
* [Why you're seeing this message](#why-youre-seeing-this-message)
* [What to do](#what-to-do)
* [Additional information](#additional-information)
Scroll to top