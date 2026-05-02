Login name change detected · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Login name change detected
Last validated: Jul 31, 2025
This topic explains a message that may appear in the Tailscale admin console and the actions you can take to address it. For a list of currently documented messages in the Tailscale admin console and client, refer to the main [Messages](/docs/reference/messages) topic.
## [Message displayed in the admin console](#message-displayed-in-the-admin-console)
> Account login name change detected (from
`> username1@example.com
`> to
`> username2@example.com
`> ) that requires a login and tailnet rename, please contact support to resolve this issue.
## [Why you're seeing this message](#why-youre-seeing-this-message)
This message typically indicates that an account's email address using a public/shared domain has changed. For example, modifying your Gmail account to use a different `@gmail.com` address. Tailscale will detect a mismatch and block access to the tailnet to prevent unauthorized use, locking the account out of the admin console.
Devices already connected to the tailnet with the old email address will continue to work, however, you cannot take administrative actions that require admin console authentication.
## [What to do](#what-to-do)
Here are some things you can try to resolve this issue:
* Change the email for the account back to the original email address in your provider's settings.
* If you are unable to change the email address back to the original one, the only other option is to create a new tailnet. We cannot correlate your existing tailnet with the changed email address for an account using a public/shared domain name.
## [Additional information](#additional-information)
For information about creating a new tailnet, refer to [Tailscale quickstart](/docs/how-to/quickstart).
On this page
* [Message displayed in the admin console](#message-displayed-in-the-admin-console)
* [Why you're seeing this message](#why-youre-seeing-this-message)
* [What to do](#what-to-do)
* [Additional information](#additional-information)
Scroll to top