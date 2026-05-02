Discord Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Discord Notifications
## Overview
* **Source:** [https://discordapp.com/](https://discordapp.com/)
* **Image Support:** Yes
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 2000
* [ Build Your Apprise URL](/url-builder/?schema=discord)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Creating a Discord account is easy. The only part that requires a little bit of extra work is once you’ve got a channel set up (by default discord puts you in a #General channel). Click on the Gear icon (Settings) and from here you need to enable webhooks.
The webhook will end up looking something like this:
`https://discordapp.com/api/webhooks/4174216298/JHMHI8qBe7bk2ZwO5U711o3dV\_js`
This effectively equates to:
`https://discordapp.com/api/webhooks/{WebhookID}/{WebhookToken}`
**Note:** Apprise supports this URL *as-is* (*as of v0.7.7*); you no longer need to parse the URL any further. However there is slightly less overhead (internally) if you do.
The last part of the URL you’re given make up the 2 tokens you need to send notifications with. With respect to the above example the tokens are as follows:
1. **WebhookID** is `4174216298`
2. **WebhookToken** is `JHMHI8qBe7bk2ZwO5U711o3dV\_js`
### Pinging Roles, Tags, and Users
[Section titled “Pinging Roles, Tags, and Users”](#pinging-roles-tags-and-users)
The discord message body can contain content such as the following to trigger the appropriate pings
* **user**: `\<@123\>`
* **role**: `\<@&456\>`
* **tag**: `@everyone`
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `https://discordapp.com/api/webhooks/{WebhookID}/{WebhookToken}`
* `discord://{WebhookID}/{WebhookToken}/`
* `discord://{botname}@{WebhookID}/{WebhookToken}/`
Discord can also support a variety of website arguments, the below identifies the defaults and therefore do not need to be specified unless you want to override them:
* `discord://{WebhookID}/{WebhookToken}/?tts=No&avatar=Yes&footer=No&image=Yes`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|WebhookID|Yes|The first part of 2 tokens provided to you after creating a *incoming-webhook*|
|WebhookToken|Yes|The second part of 2 tokens provided to you after creating a *incoming-webhook*|
|botname|No|Identify the name of the bot that should issue the message. If one isn’t specified then the default is to just use your account (associated with the *incoming-webhook*).|
|tts|No|Enable Text-To-Speech (by default is is set to **No**)|
|footer|No|Include a message footer (by default is is set to **No**)|
|image|No|Include an image in-line with the message describing the notification type (by default is is set to **Yes**)|
|avatar|No|Over-ride the default discord avatar icon and replace it with one identify the notification type (by default is is set to **Yes**)|
|avatar\_url|No|Over-ride the default discord avatar icon URL. By default this is not set and Apprise chooses the URL dynamically based on the type of message (info, success, warning, or error).|
|format|No|The default value of this is *text*. But if you plan on managing the format yourself, you can optionally set this to *markdown*. If the mode is set to markdown, apprise will scan for header entries (usually on lines by themselves surrounded by hashtags (#)) and will place these inside embedded objects. This is done to give a nicer presentation.|
|href|No|Identify a URL the title should link to when posting the Discord Notification. This forces the post into `markdown` format in order to leverage the `embeds` section of Discord. You can also use `url=` as an alias of this as well.|
|thread|No|Optionally set the `thread\_id` you wish your message to be applied to.|
|ping|No|Optionally identify a role, user, our parsed name (such as `everyone`) that should always be pinged when them message is sent. Follow the syntax [identified above](https://github.com/caronc/apprise/wiki/Notify_discord/#pinging-roles-tags-and-users) for the format.|
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
Send a Discord notification:
Terminal window
```
`
# Assuming our {WebhookID} is 4174216298
# Assuming our {WebhookToken} is JHMHI8qBe7bk2ZwO5U711o3dV\_js
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"discord://4174216298/JHMHI8qBe7bk2ZwO5U711o3dV\_js"
`
```
If you want to have your own custom avatar URL you’re already hosting from another website, you could set the following:
Terminal window
```
`
# Assuming our {WebhookID} is 4174216298
# Assuming our {WebhookToken} is JHMHI8qBe7bk2ZwO5U711o3dV\_js
# Assuming our {AvatarURL} is https://i.imgur.com/FsEpmwg.jpeg
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"discord://4174216298/JHMHI8qBe7bk2ZwO5U711o3dV\_js?avatar\_url=https://i.imgur.com/FsEpmwg.jpeg"
`
```
Send a notification that notifies `@everyone` in the channel:
Terminal window
```
`
# Assuming our {WebhookID} is 4174216298
# Assuming our {WebhookToken} is JHMHI8qBe7bk2ZwO5U711o3dV\_js
apprise -vv -t "Hello All" -b "Test Message that pings @everyone" \\
"discord://4174216298/JHMHI8qBe7bk2ZwO5U711o3dV\_js"
`
```
Send a notification that leverages the built in `markdown` support of Discord:
Terminal window
```
`
# Assuming our {WebhookID} is 4174216298
# Assuming our {WebhookToken} is JHMHI8qBe7bk2ZwO5U711o3dV\_js
cat \<\< \_EOF | apprise -vv "discord://4174216298/JHMHI8qBe7bk2ZwO5U711o3dV\_js?format=markdown"
# Title
- Bullet 1
- Bullet 2
- Bullet 3
\_EOF
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