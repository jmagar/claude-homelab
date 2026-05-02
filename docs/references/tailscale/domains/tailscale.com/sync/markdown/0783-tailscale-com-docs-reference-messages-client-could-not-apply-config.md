Could not apply configuration · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Could not apply configuration
Last validated: Jul 31, 2025
This topic explains a message that may appear in the Tailscale client and the actions you can take to address it. For a list of currently documented messages in the Tailscale admin console and client, refer to the main [Messages](/docs/reference/messages) topic.
## [Message displayed in the client](#message-displayed-in-the-client)
> Could not apply configuration
> An error occurred applying the Tailscale envknob configuration stored on disk:
`> &lt;error&gt;
`
## [Reference ID](#reference-id)
`apply-disk-config`
## [Why you're seeing this message](#why-youre-seeing-this-message)
A Tailscale envknob is another name for a Tailscale-specific environment variable or parameter used to adjust how the Tailscale client works within the tailnet. These settings start with prefixes, including `TS\_`, `PORT`, and `HTTP\_PROXY`, and used by the part of Tailscale that runs in the background, called `tailscaled`, also known as the Tailscale daemon.
Here are some reasons why this message might display:
* An envknob is not properly configured.
* The envknob conflicts with other client settings.
* You do not have permission to run the `tailscaled` process on the node or device.
* A configuration file on the disk containing envknobs might be corrupted or unreadable.
## [What to do](#what-to-do)
Here are some things you can try to resolve this issue:
* Restart your Tailscale client using the client UI, or run the CLI commands `tailscale down` followed by `tailscale up`.
* Verify that your envknobs are properly configured and spelled correctly.
* Verify that your envknobs do not conflict with other Tailscale settings such as exit nodes, subnets, or your tailnet policy file.
## [Additional information](#additional-information)
* For information about the tailnet policy file, refer to [Tailnet policy file](/docs/features/tailnet-policy-file).
* For information about `tailscaled`, refer to [tailscaled daemon](/docs/reference/tailscaled).
On this page
* [Message displayed in the client](#message-displayed-in-the-client)
* [Reference ID](#reference-id)
* [Why you're seeing this message](#why-youre-seeing-this-message)
* [What to do](#what-to-do)
* [Additional information](#additional-information)
Scroll to top