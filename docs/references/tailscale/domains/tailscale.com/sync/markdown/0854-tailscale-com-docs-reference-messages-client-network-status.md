Network down · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Network down
Last validated: Aug 1, 2025
This topic explains a message that may appear in the Tailscale client and the actions you can take to address it. For a list of currently documented messages in the Tailscale admin console and client, refer to the main [Messages](/docs/reference/messages) topic.
## [Message displayed in the client](#message-displayed-in-the-client)
> Network down
> Tailscale cannot connect because the network is down.
## [Message ID](#message-id)
`network-status`
## [Why you're seeing this message](#why-youre-seeing-this-message)
This message typically displays when the Tailscale client cannot communicate with the Tailscale [coordination server](/docs/concepts/control-data-planes#coordination-server) because a network connection is not detected for the end-user.
## [What to do](#what-to-do)
Here are some things you can try to resolve this issue:
* Restart your Tailscale client using the client UI, or run the CLI commands `tailscale down` followed by `tailscale up`.
* Check your network and internet connectivity and try reconnecting.
* Check the [Tailscale Status](https://status.tailscale.com) page. If there is an issue on our end that impacts any of our services, it will be reported here.
## [Additional reference](#additional-reference)
For more information about resolving general issues related to Tailscale, refer to [Troubleshooting guide](/docs/reference/troubleshooting).
On this page
* [Message displayed in the client](#message-displayed-in-the-client)
* [Message ID](#message-id)
* [Why you're seeing this message](#why-youre-seeing-this-message)
* [What to do](#what-to-do)
* [Additional reference](#additional-reference)
Scroll to top