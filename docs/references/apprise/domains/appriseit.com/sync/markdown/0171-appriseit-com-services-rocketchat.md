Rocket.Chat Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Rocket.Chat Notifications
## Overview
* **Source:** [https://rocket.chat/](https://rocket.chat/)
* **Image Support:** Yes
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 1000
* [ Build Your Apprise URL](/url-builder/?schema=rocket)
## Syntax
[Section titled “Syntax”](#syntax)
Rocket.Chat can send notifications through the following **modes**:
* **webhook**: A configured Incoming Webhook; this can be set up in the **Administration** area under **Integrations** heading.
* **basic**: A user/password combination.
Secure connections (via https) should be referenced using **rockets://** where as insecure connections (via http) should be referenced via **rocket://**.
### Basic Mode
[Section titled “Basic Mode”](#basic-mode)
Valid syntax is as follows:
* `rocket://{user}:{password}@{hostname}/#{channel}`
* `rocket://{user}:{password}@{hostname}:{port}/#{channel}`
* `rocket://{user}:{password}@{hostname}/{room\_id}`
* `rocket://{user}:{password}@{hostname}:{port}/{room\_id}`
* `rockets://{user}:{password}@{hostname}/#{channel}`
* `rockets://{user}:{password}@{hostname}:{port}/#{channel}`
* `rockets://{user}:{password}@{hostname}/{room\_id}`
* `rockets://{user}:{password}@{hostname}:{port}/{room\_id}`
**Note:** the `?avatar=yes` option will only work if your user has the `bot` permission setting.
You can also form any combination of the above and perform updates from one url:
* **rocket**://**{user}**:**{password}**@**{hostname}**/#**{channel\_id}**/**{room\_id}**
For the Basic Mode Only: if neither a **{room\_id}** or **#{channel}** is specified then this notification will fail.
### Webhook Mode
[Section titled “Webhook Mode”](#webhook-mode)
Valid syntax is as follows:
* `rocket://{webhook}@{hostname}/#{channel}`
* `rocket://{webhook}@{hostname}/{room\_id}`
* `rocket://{webhook}@{hostname}/{@user}`
* `rockets://{webhook}@{hostname}/#{channel}`
* `rockets://{webhook}@{hostname}:{port}/#{channel}`
* `rockets://{webhook}@{hostname}/{room\_id}`
* `rockets://{webhook}@{hostname}:{port}/{room\_id}`
You can also form any combination of the above and perform updates from one url:
* **rocket**://**{webhook}**@**{hostname}**:**{port}**/#**{channel\_id}**/**{room\_id}**/**@{user}**
By default a webhook is set up to be associated with a channel. Thus the following syntax is also valid:
* **rocket**://**{webhook}**@**{hostname}**/
**Note:** Some webhooks have slashes in them. For these you need to make sure you escape the slash (`/`) with `%2F`. So your URL may look like:
* `rocket://abcd%2F12345@{hostname}/` - Note the `%2F` (to swap out for `/` found in webhook)
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|user|\*Yes|The user identifier you’ve associated with your Rocket.Chat server. This is only required if you are not providing a **webhook** instead. This can be optionally combined with the **webhook** if you wish to over-ride the bot name.|
|password|\*Yes|The password identifier you’ve associated with your Rocket.Chat server. This is only required if you are not providing a **webhook** instead. This value can also substitute for a pre-generated token as well.|
|webhook|\*Yes|The incoming webhook you created and associated with your Rocket.Chat server . This is only required if you are not providing a **webhook** instead|
|hostname|Yes|The Rocket.Chat server you’re sending your notification to.|
|port|No|The port the Rocket.Chat server is listening on. By default the port is **80** for **rocket://** and **443** for all **rockets://** references.|
|room\_id|No|A room identifier. Available for both **basic** and **webhook** modes.|
|channel|No|Channels must be prefixed with a hash (#) or they will be interpreted as a room\_id. Available for both **basic** and **webhook** modes. Channels must be registered with your Rocket.Chat server to work.|
|user\_id|No|Another user you wish to notify. User IDs must be prefixed with an at symbol (@). Available for the **webhook** mode only.|
|mode|No|The authentication mode is automatically detected based what it parses from the URL provided. You only need to set this if you feel it is being detected incorrectly. The possible modes are **basic**, **token**, and **webhook** and are explained above.|
|avatar|No|Override the default avatar associated with the message to match that of the notification type (be that of a Warning, Error, Info, etc). By default this is set to **No** for **basic** mode and **Yes** for **webhook** mode.|
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
Send a Rocket.Chat notification to the channel *#nuxref*:
Terminal window
```
`
# Assuming our {user} is l2g
# Assuming our {password} is awes0m3!
# Assuming our {hostname} is rocket.server.local
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
rocket://l2g:awes0m3!@rocket.server.local/#nuxref
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