Windows network configuration failed · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Windows network configuration failed
Last validated: Jan 30, 2026
This topic explains a message that might appear in the Tailscale client and the actions you can take to address it. For a list of currently documented messages in the Tailscale admin console and client, refer to the main [Messages](/docs/reference/messages) topic.
## [Message displayed in the client](#message-displayed-in-the-client)
> Windows network configuration failed
> Failed to set the network category to private on the Tailscale adapter. This may prevent Tailscale from working correctly.
## [Message ID](#message-id)
`set-network-category-failed`
## [Why you're seeing this message](#why-youre-seeing-this-message)
This message appears when Tailscale is unable to apply the required network changes on Windows operating systems. Tailscale modifies Windows networking settings such as routes, DNS, and firewall rules to ensure traffic can flow through the Tailscale tunnel. If Windows blocks or rejects those changes, Tailscale reports that the network configuration step failed, which can prevent connectivity from working correctly even though the Tailscale client is running.
## [What to do](#what-to-do)
Here are some things you can try to resolve this issue:
* Restart the Tailscale client to refresh the connection.
* Update the Tailscale client to the latest version.
* Run the Tailscale client as an administrator so it has permission to modify network settings.
* Check for [other installed VPN clients](/docs/reference/faq/other-vpns) or network software. These might conflict with the Tailscale client.
* Verify firewalls, proxies, and other security software are not blocking outbound HTTPS or long-lived connections used by Tailscale.
* Confirm that the Tailscale virtual network adapter exists and is enabled in your Windows network settings.
* Make sure Windows networking components, such as IP routing and DNS services, are functioning normally and not disabled by policy.
* Ensure Windows is fully up to date, as Windows networking bugs or outdated drivers can interfere with configuration changes.
On this page
* [Message displayed in the client](#message-displayed-in-the-client)
* [Message ID](#message-id)
* [Why you're seeing this message](#why-youre-seeing-this-message)
* [What to do](#what-to-do)
Scroll to top