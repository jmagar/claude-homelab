Out of sync · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Out of sync
Last validated: Jan 5, 2026
This topic explains a message that may appear in the Tailscale client and the actions you can take to address it. For a list of currently documented messages in the Tailscale admin console and client, refer to the main [Messages](/docs/reference/messages) topic.
## [Message displayed in the client](#message-displayed-in-the-client)
> Out of sync
> > Unable to connect to the Tailscale coordination server to> synchronize the state of your tailnet. Peer reachabilitymight degrade over time.
## [Reference ID](#reference-id)
`not-in-map-poll`
## [Why you're seeing this message](#why-youre-seeing-this-message)
Your Tailscale client cannot connect to the coordination server that synchronizes devices and nodes (peers) across your tailnet.
This issue can occur for the following reasons:
* Internet connectivity issues.
* Firewall restrictions are blocking the connection to the Tailscale coordination server.
* The Tailscale background service, which runs on devices and nodes, is not running correctly.
* Device controls are preventing connectivity. This may include features such as Screen Time on Apple devices.
## [What to do](#what-to-do)
Here are some things you can try to resolve this issue:
* Restart your Tailscale client using the client UI, or run the CLI commands `tailscale down` followed by `tailscale up`.
* Check your internet connection.
* Adjust or remove controls of devices that might prevent connectivity.
* If you are using a firewall, verify that the ports and domains used for connecting to Tailscale are not blocked.
## [Additional information](#additional-information)
* For information about the ports and domain names used to communicate with Tailscale, refer to [What firewall ports should I open to use Tailscale?](/docs/reference/faq/firewall-ports).
* For information about disabling Apple's Screen Time feature, refer to [macOS Screen Time and Tailscale](/docs/concepts/macos-webfilterproxyd).
On this page
* [Message displayed in the client](#message-displayed-in-the-client)
* [Reference ID](#reference-id)
* [Why you're seeing this message](#why-youre-seeing-this-message)
* [What to do](#what-to-do)
* [Additional information](#additional-information)
Scroll to top