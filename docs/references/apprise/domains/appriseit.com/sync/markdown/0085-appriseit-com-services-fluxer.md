Fluxer Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Fluxer Notifications
## Overview
* **Source:** [https://fluxer.app/](https://fluxer.app/)
* **Image Support:** Yes
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 2000
* [ Build Your Apprise URL](/url-builder/?schema=fluxer)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Fluxer uses webhooks for posting notifications.
A webhook URL looks like this:
`https://api.fluxer.app/webhooks/417429632418316298/JHZ7lQml277CDHmQKMHI8qBe7bk2ZwO5UKjCiOAF7711o33MyqU344Qpgv7YTpadV`
This effectively equates to:
`https://api.fluxer.app/webhooks/{WebhookID}/{WebhookToken}`
The last part of the URL you are given make up the 2 tokens you need to send notifications with. With respect to the above example the tokens are as follows:
1. **WebhookID** is `417429632418316298`
2. **WebhookToken** is `JHZ7lQml277CDHmQKMHI8qBe7bk2ZwO5UKjCiOAF7711o33MyqU344Qpgv7YTpadV`
### Pinging Roles, Tags, and Users
[Section titled “Pinging Roles, Tags, and Users”](#pinging-roles-tags-and-users)
Fluxer supports Discord-style mentions. You can place these directly in the message body:
* **user**: `\<@123\>`
* **role**: `\<@&456\>`
* **tag**: `@everyone` or `@here`
You can also force pings via the `ping=` URL parameter (see below).
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `https://api.fluxer.app/webhooks/{WebhookID}/{WebhookToken}`
* `https://api.fluxer.app/v1/webhooks/{WebhookID}/{WebhookToken}`
* `fluxer://{WebhookID}/{WebhookToken}/`
* `fluxer://{botname}@{WebhookID}/{WebhookToken}/`
### Private Server Mode
[Section titled “Private Server Mode”](#private-server-mode)
Fluxer can be used in two modes:
* `mode=cloud` (default): posts to the Fluxer Cloud API (`https://api.fluxer.app`)
* `mode=private`: posts to the host you specify in the URL
When `mode=private` is used, a host is required:
* `fluxer://{host}/{WebhookID}/{WebhookToken}/?mode=private`
* `fluxer://{host}:{port}/{WebhookID}/{WebhookToken}/?mode=private`
If `mode=private` is selected but the host contains `fluxer.app`, Apprise will automatically switch back to `mode=cloud`.
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|WebhookID|Yes|The first part of 2 tokens provided to you after creating an incoming webhook|
|WebhookToken|Yes|The second part of 2 tokens provided to you after creating an incoming webhook|
|botname|No|Identify the name of the bot that should issue the message|
|host|No|Hostname of your private Fluxer server (used with `mode=private`)|
|port|No|Port of your private Fluxer server (used with `mode=private`)|
|mode|No|One of: `cloud` (default) or `private`|
|tts|No|Enable Text-To-Speech (default is **No**)|
|avatar|No|Override the default avatar icon and replace it with one identifying the notification type (default is **Yes**)|
|avatar\_url|No|Override the avatar icon URL. If not set, Apprise chooses a URL dynamically based on message type|
|footer|No|Include a footer section in the embed (default is **No**)|
|footer\_logo|No|Include the Fluxer footer logo when `footer=yes` (default is **Yes**)|
|image|No|Include an image in-line with the message describing the notification type (default is **No**)|
|fields|No|Use embedded fields when posting in `markdown` format (default is **Yes**)|
|format|No|The default is `text`. Set to `markdown` to enable markdown-to-embed parsing (headers are converted into embeds)|
|href|No|Identify a URL the title should link to when posting. You can also use `url=` as an alias|
|thread|No|Optionally set the `thread\_id` you wish your message to be applied to|
|thread\_name|No|Optionally set the thread name when using `thread=`|
|ping|No|A comma-separated list of users, roles, or tokens such as `everyone` that should always be pinged|
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
Send a Fluxer notification:
Terminal window
```
`
# Assuming our {WebhookID} is 417429632418316298
# Assuming our {WebhookToken} is JHZ7lQml277CDHmQKMHI8qBe7bk2ZwO5UKjCiOAF7711o33MyqU344Qpgv7YTpadV
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"fluxer://417429632418316298/JHZ7lQml277CDHmQKMHI8qBe7bk2ZwO5UKjCiOAF7711o33MyqU344Qpgv7YTpadV"
`
```
Send a notification using markdown-to-embed formatting:
Terminal window
```
`
# Assuming our {WebhookID} is 417429632418316298
# Assuming our {WebhookToken} is JHZ7lQml277CDHmQKMHI8qBe7bk2ZwO5UKjCiOAF7711o33MyqU344Qpgv7YTpadV
cat \<\< \_EOF | apprise -vv \\
"fluxer://417429632418316298/JHZ7lQml277CDHmQKMHI8qBe7bk2ZwO5UKjCiOAF7711o33MyqU344Qpgv7YTpadV?format=markdown"
# Title
- Bullet 1
- Bullet 2
- Bullet 3
\_EOF
`
```
Send an attachment:
Terminal window
```
`
# Assuming our {WebhookID} is 417429632418316298
# Assuming our {WebhookToken} is JHZ7lQml277CDHmQKMHI8qBe7bk2ZwO5UKjCiOAF7711o3dV\_js
apprise -vv -b "Here is a file" \\
--attach=/path/to/file.png \\
"fluxer://417429632418316298/JHZ7lQml277CDHmQKMHI8qBe7bk2ZwO5UKjCiOAF7711o33MyqU344Qpgv7YTpadV"
`
```
Post to a private Fluxer server:
Terminal window
```
`
# Assuming your private server is https://fluxer.example.com
# Assuming our {WebhookID} is 417429632418316298
# Assuming our {WebhookToken} is JHZ7lQml277CDHmQKMHI8qBe7bk2ZwO5UKjCiOAF7711o33MyqU344Qpgv7YTpadV
apprise -vv -b "Private server test" \\
"fluxer://fluxer.example.com/417429632418316298/JHZ7lQml277CDHmQKMHI8qBe7bk2ZwO5UKjCiOAF7711o33MyqU344Qpgv7YTpadV?mode=private"
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