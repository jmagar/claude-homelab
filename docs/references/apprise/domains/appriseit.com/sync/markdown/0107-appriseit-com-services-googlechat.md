Google Chat Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Google Chat Notifications
## Overview
* **Source:** [https://chat.google.com/](https://chat.google.com/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 4000
* [ Build Your Apprise URL](/url-builder/?schema=gchat)
## Account Setup
[Section titled “Account Setup”](#account-setup)
For this to work correctly you a GSuite account (there are free trials if you don’t have one). You then need to create a Webhook; they can be done as follows:
1. [Open Google Chat in your browser](https://chat.google.com/)
2. Go to the room to which you want to add a bot.
3. From the room menu at the top of the page, select **Manage webhooks**.
4. Provide it a name and optional avatar and click **SAVE**
5. Copy the URL associated with your new webhook.
6. Click outside the dialog box to close.
When you’ve completed, you’ll get a URL that looks a little like this:
```
`
https://chat.googleapis.com/v1/spaces/AAAAkM/messages?key=AIzaSSjMm-WEfqKqqsHI&token=O7bnyri\_WEXKcyFk%3D
^ ^ ^ ^ ^ ^
| | | | | |
workspace ... webhook\_key... ..webhook\_token..
`
```
Simplified, it looks like this:
* `https://chat.googleapis.com/v1/spaces/WORKSPACE/messages?key=WEBHOOK\_KEY&token=WEBHOOK\_TOKEN`
Now it’s important to note that while this Apprise plugin uses `gchat://`, you can also just use this URL exactly the way it was provided to you from Google when you copied and pasted. This is a perfectly valid Google Chat Apprise URL as well.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `https://chat.googleapis.com/v1/spaces/{workspace}/messages?key={webhook\_key}&token={webhook\_token}`
* `gchat://{workspace}/{webhook\_key}/{webhook\_token}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|workspace|Yes|The workspace associated with your Google Chat account.|
|webhook\_key|Yes|The webhook key associated with your Google Chat account.|
|webhook\_token|Yes|The webhook token associated with your Google Chat account.|
|thread|No|You can optionally specify a `ThreadKey` on the URL to focus its notifications there.|
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
Send a Google Chat notification
Terminal window
```
`
# Assuming our {workspace} is AAAAkM
# Assuming our {webhook\_key} is AIzaSSjMm-WEfqKqqsHI
# Assuming our {webhook\_token} is O7bnyri\_WEXKcyFk%3D
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
gchat://AAAAkM/AIzaSSjMm-WEfqKqqsHI/O7bnyri\_WEXKcyFk%3D
`
```
Remember, you can also just use the URL as it was provided to you when configuring your Webhook:
Send a Google Chat notification
Terminal window
```
`
# Assuming our {workspace} is AAAAkM
# Assuming our {webhook\_key} is AIzaSSjMm-WEfqKqqsHI
# Assuming our {webhook\_token} is O7bnyri\_WEXKcyFk%3D
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
https://chat.googleapis.com/v1/spaces/AAAAkM/messages?key=AIzaSSjMm-WEfqKqqsHI&token=O7bnyri\_WEXKcyFk%3D
`
```
Want to target a specific threadKey? Just do the following:
Terminal window
```
`
# Assuming our {workspace} is AAAAkM
# Assuming our {webhook\_key} is AIzaSSjMm-WEfqKqqsHI
# Assuming our {webhook\_token} is O7bnyri\_WEXKcyFk%3D
# Assuming our {threadkey} is ABC
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
gchat://AAAAkM/AIzaSSjMm-WEfqKqqsHI/O7bnyri\_WEXKcyFk%3D/?thread=ABC
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