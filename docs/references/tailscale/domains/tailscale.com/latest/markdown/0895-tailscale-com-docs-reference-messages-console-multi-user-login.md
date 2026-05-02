Multiple users with login · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Multiple users with login
Last validated: Jul 31, 2025
This topic explains a message that may appear in the Tailscale admin console and the actions you can take to address it. For a list of currently documented messages in the Tailscale admin console and client, refer to the main [Messages](/docs/reference/messages) topic.
## [Message displayed in the admin console](#message-displayed-in-the-admin-console)
> Multiple users with login
`> &lt;user@example.com&gt;
`> , please contact support to login
## [Why you're seeing this message](#why-youre-seeing-this-message)
This issue can occur for the following reasons:
* The email address belongs to a different tailnet.
* Changes were made to your identity provider (IdP) that affect the user ID associated with the email address used for authentication.
## [What to do](#what-to-do)
Here are some things you can try to resolve this issue:
* Make sure you're using the email address associated with the tailnet you're trying to log in to. If you have access to multiple tailnets, the wrong email address might have been used.
* Contact your IT administrator to determine if any changes were made to your account, such as updates to your user account. If this has occurred, you or your IT administrator may be required to contact [Tailscale Support](/support) for additional steps.
On this page
* [Message displayed in the admin console](#message-displayed-in-the-admin-console)
* [Why you're seeing this message](#why-youre-seeing-this-message)
* [What to do](#what-to-do)
Scroll to top