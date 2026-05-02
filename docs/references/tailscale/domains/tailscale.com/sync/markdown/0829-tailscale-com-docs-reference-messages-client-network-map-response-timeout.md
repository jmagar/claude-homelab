Network map response timeout · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Network map response timeout
Last validated: Jan 30, 2026
This topic explains a message that might appear in the Tailscale client and the actions you can take to address it. For a list of currently documented messages in the Tailscale admin console and client, refer to the main [Messages](/docs/reference/messages) topic.
## [Message displayed in the client](#message-displayed-in-the-client)
> Network map response timeout
> Tailscale hasn&#x27;t received a network map from the coordination server in
`> &lt;seconds&gt;
`> .
## [Message ID](#message-id)
`mapresponse-timeout`
## [Why you're seeing this message](#why-youre-seeing-this-message)
This message means the Tailscale client sent a request to the [Tailscale control plane](/docs/concepts/control-data-planes) for the network map, which is the data describing what devices are in your tailnet and how to reach them, but did not receive a response in time. Without a timely network map response, the client cannot fully update its network display, which can delay or disrupt connectivity even when the client is running.
## [What to do](#what-to-do)
Here are some things you can try to resolve this issue:
* [Check that the device has a stable internet connection](/docs/reference/troubleshooting/connectivity/connect-internet-failure) and can reach external services.
* Restart the Tailscale client to refresh the connection.
* Update Tailscale to the latest version.
* Verify firewalls, proxies, and other security software are not blocking outbound HTTPS or long-lived connections used by Tailscale.
* Verify the system clock is accurate. This can break control plane communication.
* Try switching to a different network or internet connection to rule out network filtering.
* Check for restrictive corporate or [captive networks](/docs/integrations/captive-portals) that might block WebSocket or HTTPS traffic.
On this page
* [Message displayed in the client](#message-displayed-in-the-client)
* [Message ID](#message-id)
* [Why you're seeing this message](#why-youre-seeing-this-message)
* [What to do](#what-to-do)
Scroll to top