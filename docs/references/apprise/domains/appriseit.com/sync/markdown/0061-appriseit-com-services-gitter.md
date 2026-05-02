Gitter Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Gitter Notifications
Gitter uses Matrix and does not have its own custom service anymore. All information below pertains to its legacy configuration for those still hosting it.
## Overview
* **Source:** [https://gitter.im/](https://gitter.im/)
* **Image Support:** Yes
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=gitter)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Gitter isn’t to difficult to get yourself an account [on their website](https://gitter.im/).
From here, you just need to get your Gitter **Personal Access Token** which is as simple as visiting their [development website](https://developer.gitter.im/apps) and signing in (if you’re not already). Almost immediately you should see a pop-up box providing you your token.
\*\*Note: You can ignore the App generation feature here as it’s not relevant to sending an apprise notification.
The last thing you need to know about this is you need to have already joined the channel you wish to send notifications to. The **Personal Access Token** represents you, so even if you join a channel and close out of your web browser, you’re still actually a part of that channel (until you log back in and leave the channel).
Channels identify themselves as **name**/community; you only need to focus on the name. So if the channel was [**apprise**/community](https://gitter.im/apprise-notifications/community), the channel name can be assumed to be **apprise** when using this script.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `gitter://{token}/{room}/`
* `gitter://{token}/{room1}/{room2}/{roomN}/`
* `gitter://{token}/{room}/?image=Yes`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|token|Yes|The Personal Access Token associated with your account. This is available to you after signing into their [development website](https://developer.gitter.im/apps).|
|room|No|The room you want to notify. You can specify as many as you want of these on the URL.|
|image|No|Send an image representing the message type prior to sending the message body. This is disabled by default.|
|to|No|This is an alias to the room variable.|
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
Send a Gitter notification to the channel *apprise/community*:
Terminal window
```
`
# Assuming our {token} is abcdefghij1234567890
# Assuming our {room} is apprise/community
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
gitter:///abcdefghij1234567890/apprise
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