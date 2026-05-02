Ryver Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Ryver Notifications
## Overview
* **Source:** [https://ryver.com/](https://ryver.com/)
* **Image Support:** Yes
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 1000
* [ Build Your Apprise URL](/url-builder/?schema=ryver)
## Account Setup
[Section titled “Account Setup”](#account-setup)
To use Ryver you’ll need to have the forum(s) you intend to notify already pre-created. You’ll need to do this before you follow the next set of instructions.
Next you need to define a new webhook and get the corresponding URL. This is done through:
1. click on the **Integrations** \> **Incoming Webhooks** beneath your settings on the left
2. click on the **Create Webhook** button
3. choose either **Slack** or **Plain/text Ryver** as this plugin currently supports both.
4. Regardless of what webhook type you choose to create (Slack or Ryver), the next steps are still the same:
* Set the webhook type to **Chat Message**
* Select the forum(s) you already have set up to allow this webhook to access.
* Click next.
When you’ve completed this process you will receive a URL that looks something like this:
`https://apprise.ryver.com/application/webhook/ckhrjW8w672m6HG`
This effectively equates to:
`https://{organization}.ryver.com/application/webhook/{token}`
**Note:** Apprise supports this URL *as-is* (*as of v0.7.7*); you no longer need to parse the URL any further. However there is slightly less overhead (internally) if you do.
The last part of the URL you’re given is the token we’re most interested in. With respect to the above example:
* the **token** is `ckhrjW8w672m6HG`
* the **organization** is `apprise`
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `https://{organization}.ryver.com/application/webhook/{token}`
* `ryver://{organization}/{token}/`
* `ryver://{botname}@{organization}/{token}/`
* `ryver://{organization}/{token}/?webhook=slack`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|organization|Yes|The organization you created your webhook under.|
|token|Yes|The token provided to you after creating a *incoming-webhook*|
|botname|No|Set the display name the message should appear from.|
|webhook|No|The type of webhook you created (Slack or Ryver). The only possible values are **slack** and **ryver**. The default value is **ryver** if the webhook value isn’t specified.|
### Global Parameters
[Section titled “Global Parameters”](#global-parameters)
|Variable|Description|
|overflow|This parameter can be set to either `split`, `truncate`, or `upstream`. This determines how Apprise delivers the message you pass it. By default this is set to `upstream`
👉 `upstream`: Do nothing at all; pass the message exactly as you received it to the service.
👉 `truncate`: Ensure that the message will fit within the service’s documented upstream message limit. If more information was passed then the defined limit, the overhead information is truncated.
👉 `split`: similar to truncate except if the message doesn’t fit within the service’s documented upstream message limit, it is split into smaller chunks and they are all delivered sequentially there-after.|
|format|This parameter can be set to either `text`, `html`, or `markdown`. Some services support the ability to post content by several different means. The default of this varies (it can be one of the 3 mentioned at any time depending on which service you choose). You can optionally force this setting to stray from the defaults if you wish. If the service doesn’t support different types of transmission formats, then this field is ignored.|
|verify|External requests made to secure locations (such as through the use of `https`) will have certificates associated with them. By default, Apprise will verify that these certificates are valid; if they are not then no notification will be sent to the source. In some occasions, a user might not have a certificate authority to verify the key against or they trust the source; in this case you will want to set this flag to `no`. By default it is set to `yes`.|
|cto|This stands for Socket Connect Timeout. This is the number of seconds Requests will wait for your client to establish a connection to a remote machine (corresponding to the *connect()*) call on the socket. The default value is 4.0 seconds.|
|rto|This stands for Socket Read Timeout. This is the number of seconds the client will wait for the server to send a response. The default value is 4.0 seconds.|
|emojis|Enable Emoji support (such as providing `:+1:` would translate to 👍). By default this is set to `no`.
**Note:** Depending on server side settings, the administrator has the power to disable emoji support at a global level; but default this is not the case.|
|tz|Identify the IANA Time Zone Database you wish to operate as. By default this is detected based on the configuration the server hosting Apprise is running on. You can set this to things like `America/Toronto`, or any other properly formated Timezone describing your area.|
## Examples
[Section titled “Examples”](#examples)
Send a ryver notification:
Terminal window
```
`
# Assuming our {organization} is apprise
# Assuming our {token} is T1JJ3T3L2
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
ryver:///apprise/T1JJ3T3L2
`
```
Questions or Feedback?
#### Documentation
Notice a typo or an error?
[
Report it
](https://github.com/caronc/apprise-docs/issues/)
or
[
contribute a fix
](https://github.com/caronc/apprise-docs)
.
#### Technical Issues
Having trouble with the code? Open an issue on GitHub:
* [
Apprise Core & CLI
](https://github.com/caronc/apprise/issues/)
* [
Apprise API
](https://github.com/caronc/apprise-api/issues/)
Made with love from Canada