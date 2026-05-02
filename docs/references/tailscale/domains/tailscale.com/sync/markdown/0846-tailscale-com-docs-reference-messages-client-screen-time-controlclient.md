Tailscale blocked by Screen Time · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale blocked by Screen Time
Last validated: Jul 31, 2025
This topic explains a message that may appear in the Tailscale client and the actions you can take to address it. For a list of currently documented messages in the Tailscale admin console and client, refer to the main [Messages](/docs/reference/messages) topic.
## [Message displayed in the client](#message-displayed-in-the-client)
> Tailscale blocked by Screen Time
> The Screen Time feature in macOS is preventing Tailscale from working properly.
## [Message ID](#message-id)
`macos-screen-time-controlclient`
## [Why you're seeing this message](#why-youre-seeing-this-message)
If macOS and iOS users enable Screen Time restrictions, the system will block access to Tailscale during the restricted time period.
## [What to do](#what-to-do)
Disable the Screen Time setting in **System Settings**, **Screen Time**, **Content & Privacy**, **Access to Web Content**.
## [Additional reference](#additional-reference)
* Refer to our documentation [macOS Screen Time and Tailscale](/docs/concepts/macos-webfilterproxyd).
* Refer to Apple's documentation [Change Screen Time settings on Mac](https://support.apple.com/guide/mac-help/change-screen-time-settings-on-mac-mchlca5139d2/mac).
On this page
* [Message displayed in the client](#message-displayed-in-the-client)
* [Message ID](#message-id)
* [Why you're seeing this message](#why-youre-seeing-this-message)
* [What to do](#what-to-do)
* [Additional reference](#additional-reference)
Scroll to top