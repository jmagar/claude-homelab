Security update available · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Security update available
Last validated: Aug 1, 2025
This topic explains a message that may appear in the Tailscale client and the actions you can take to address it. For a list of currently documented messages in the Tailscale admin console and client, refer to the main [Messages](/docs/reference/messages) topic.
## [Message displayed in the client](#message-displayed-in-the-client)
> Security update available
> A security update from version
`> &lt;current-version&gt;
`> to
`> &lt;new-version&gt;
`> is available.
## [Message ID](#message-id)
`security-update-available`
## [Why you're seeing this message](#why-youre-seeing-this-message)
Tailscale security updates are available for the device to patch a known security issue related to the Tailscale client.
## [What to do](#what-to-do)
We recommend installing all security updates as soon as they are available.
If you are using macOS, Windows, iOS, Android, or tvOS, you can update your Tailscale client from the UI, the device's app store, or the [Tailscale Packages - stable track](https://pkgs.tailscale.com/stable/) page.
If your device is running on a platform that can use the [Tailscale CLI](/docs/reference/tailscale-cli) such as Linux, macOS, and Windows, you can run `tailscale update` for a one-time update, or `tailscale set --auto-update` to automatically update the OS as new versions become available.
## [Additional reference](#additional-reference)
* For information about installing the Tailscale client, refer to [Install Tailscale](/docs/install).
* For information about updating the Tailscale client, refer to [Update Tailscale](/docs/features/client/update).
* For in-depth guidance on securing Tailscale clients and Tailscale in general, refer to [Best practices to secure your tailnet](/docs/reference/best-practices/security).
On this page
* [Message displayed in the client](#message-displayed-in-the-client)
* [Message ID](#message-id)
* [Why you're seeing this message](#why-youre-seeing-this-message)
* [What to do](#what-to-do)
* [Additional reference](#additional-reference)
Scroll to top