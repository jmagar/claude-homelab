Docker with stateful filtering · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Docker with stateful filtering
Last validated: Dec 29, 2025
This topic explains a message that may appear in the Tailscale client and the actions you can take to address it. For a list of currently documented messages in the Tailscale admin console and client, refer to the main [Messages](/docs/reference/messages) topic.
## [Message displayed in the client](#message-displayed-in-the-client)
> Docker with stateful filtering
> Stateful filtering is enabled and Docker was detected; this may prevent Docker containers on this host from resolving DNS and connecting to Tailscale nodes.
## [Reference ID](#reference-id)
`docker-stateful-filtering`
## [Why you're seeing this message](#why-youre-seeing-this-message)
Stateful filtering occurs when a firewall tracks active connections and only lets traffic that is part of an established, approved connection. For example, the firewall permits a response because a node or device sent a request. When you configure Docker with its own firewall rules, such as iptables, they can conflict with the firewall or routing rules set by Tailscale, which may lead to connectivity issues or warnings like this message.
## [What to do](#what-to-do)
Here are some things you can try to resolve this issue:
* Disable Docker's iptables management, using the command `sudo dockerd --iptables=false`.
* Use Tailscale Serve or Tailscale Funnel to expose services securely without relying on Docker port mappings.
* Use the Tailscale CLI command `tailscale up --stateful-filtering=off` option to prevent dropping of inbound packets with another node's destination IP.
* Use the Tailscale CLI command `tailscale up --netfilter-mode=off` in advanced setups where you're manually managing all iptables rules. Refer to [netfilter modes](/docs/reference/netfilter-modes) for more information.
* Add custom iptables rules that allow Tailscale traffic, especially `ESTABLISHED` and `RELATED` connection states.
* Verify routing and NAT behavior with tools like `iptables -L -v` and `tailscale netcheck`.
## [Additional information](#additional-information)
* For information about configuring firewall rules in Docker, refer to [Packet filtering and firewalls](https://docs.docker.com/engine/network/packet-filtering-firewalls/).
* For information about setting up Tailscale Serve, refer to [Tailscale Serve](/docs/features/tailscale-serve).
* For information about setting up Tailscale Funnel, refer to [Tailscale Funnel](/docs/features/tailscale-funnel).
* For information about Tailscale commands, refer to [Tailscale CLI](/docs/reference/tailscale-cli).
On this page
* [Message displayed in the client](#message-displayed-in-the-client)
* [Reference ID](#reference-id)
* [Why you're seeing this message](#why-youre-seeing-this-message)
* [What to do](#what-to-do)
* [Additional information](#additional-information)
Scroll to top