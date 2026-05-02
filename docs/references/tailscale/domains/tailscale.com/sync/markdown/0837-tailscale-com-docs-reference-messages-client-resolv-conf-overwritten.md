Linux DNS configuration issue · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Linux DNS configuration issue
Last validated: Jan 12, 2026
This topic explains a message that may appear in the Tailscale client and the actions you can take to address it. For a list of currently documented messages in the Tailscale admin console and client, refer to the main [Messages](/docs/reference/messages) topic.
## [Message displayed in the client](#message-displayed-in-the-client)
> Linux DNS configuration issue
> Linux DNS config not ideal. /etc/resolv.conf overwritten.
## [Reference ID](#reference-id)
`resolv-conf-overwritten`
## [Why you're seeing this message](#why-youre-seeing-this-message)
Tailscale updates DNS settings on Linux clients to ensure that internal hostnames resolve correctly, especially when features like MagicDNS or split DNS are in use. An issue can arise if the client uses an unsupported DNS setup, such as a manually configured or locked `/etc/resolv.conf` file, or if a different network manager is overriding DNS changes. Problems may also occur if Tailscale doesn't have sufficient permissions or if the system is running in a restricted environment, such as a container. In cases such as these, Tailscale cannot apply its DNS configuration, which may lead to internal domains failing to resolve.
## [What to do](#what-to-do)
Here are some things you can try to resolve this issue:
* Use the command `sudo systemctl enable --now systemd-resolved` if your Linux distribution supports it. This starts the Linux DNS resolver service immediately and ensures it runs automatically every time it boots up.
* Run the `tailscaled` daemon as `root` to allow Tailscale to modify DNS settings and manage networking.
* Manually configure DNS in your Linux network settings.
## [Additional information](#additional-information)
For information on `tailscaled`, refer to [tailscaled daemon](/docs/reference/tailscaled).
On this page
* [Message displayed in the client](#message-displayed-in-the-client)
* [Reference ID](#reference-id)
* [Why you're seeing this message](#why-youre-seeing-this-message)
* [What to do](#what-to-do)
* [Additional information](#additional-information)
Scroll to top