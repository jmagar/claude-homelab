MagicSock function not running · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# MagicSock function not running
Last validated: Jul 31, 2025
This topic explains a message that may appear in the Tailscale client and the actions you can take to address it. For a list of currently documented messages in the Tailscale admin console and client, refer to the main [Messages](/docs/reference/messages) topic.
## [Message displayed in the client](#message-displayed-in-the-client)
> MagicSock function not running
> The MagicSock function
`> &lt;function-name&gt;
`> is not running. You might experience connectivity issues.
## [Message ID](#message-id)
`magicsock-receive-func-error`
## [Why you're seeing this message](#why-youre-seeing-this-message)
MagicSock is a Tailscale networking layer that is responsible for discovering and selecting networking paths and handling packet transport in your tailnet. When you install the Tailscale client, it runs as a background service. When this error displays, it's usually because a function of the service has failed. The functions associated with MagicSock include creating new connections, discovery, network map updates, encrypted key updates, and switching between UDP and DERP relay servers.
Here are some reasons why this message might display:
* There was an issue with your Tailscale client installation.
* There was an issue switching between peer-to-peer UDP connections and DERP server relay connections.
* A firewall on your network is blocking UDP ports or is in some other way blocking connections.
## [What to do](#what-to-do)
Here are some things you can try to resolve this issue:
* Restart the Tailscale client.
* If you are using a firewall, verify that the ports and domains used for connecting to Tailscale are not blocked.
* Update your Tailscale client, if it's not already on the most current version.
* Reinstall the Tailscale client.
* Generate a bug report and send it to Tailscale Support.
## [Additional reference](#additional-reference)
* For information about the ports and domain names used to communicate with Tailscale, refer to [What firewall ports should I open to use Tailscale?](/docs/reference/faq/firewall-ports).
* For information about updating the Tailscale client, refer to [Update Tailscale](/docs/features/client/update).
* For information about how to generate and send a bug report to Tailscale Support, refer to [Generate a bug report](/docs/account/bug-report).
* For information about how UDP and DERP relay server connections work, refer to [Connection types](/docs/reference/connection-types).
On this page
* [Message displayed in the client](#message-displayed-in-the-client)
* [Message ID](#message-id)
* [Why you're seeing this message](#why-youre-seeing-this-message)
* [What to do](#what-to-do)
* [Additional reference](#additional-reference)
Scroll to top