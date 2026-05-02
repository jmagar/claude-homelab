notifiarr Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# notifiarr Notifications
## Notifiarr Notifications
[Section titled “Notifiarr Notifications”](#notifiarr-notifications)
* **Source**: [https://notifiarr.com](https://notifiarr.com)
* **Icon Support**: No
* **Attachment Support**: No
* **Message Format**: Text
* **Message Limit**: 32768 Characters per message
## Account Setup
[Section titled “Account Setup”](#account-setup)
You need to first set up an account with [Notifiarr](https://notifiarr.com) if you don’t have one already. From there you can generate yourself your `{api\_key}`. You will need to use your “global” API key, the integration-specific Notifiarr API keys do not work with Apprise.
### Discord Channel IDs
[Section titled “Discord Channel IDs”](#discord-channel-ids)
To use Notifiarr, you need your Discord ChannelID. **It must be the numeric version of it**. [Here is some great instructions on how to get it](https://support.discord.com/hc/en-us/articles/206346498-Where-can-I-find-my-User-Server-Message-ID-).
In short:
* **Enable Developer Mode** by visiting your *Discord Settings* and going to **Appearance**.
### Pinging Roles, Tags, and Users
[Section titled “Pinging Roles, Tags, and Users”](#pinging-roles-tags-and-users)
The notifiarr message body can contain content such as the following to trigger the appropriate pings
* **user**: `\<@123\>`
* **role**: `\<@&456\>`
* **tag**: `@everyone`
**Note**: that as of this time (2024 Jul 28th), the upstream webhook to Notifiarr only supports 1 user/role in the payload. If you provide more then one, only the first will be passed upstream.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `notifiarr://{api\_key}/{channel\_id}`
* `notifiarr://{api\_key}/{channel1\_id}/{channel2\_id}/{channelN\_id}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|api\_key|Yes|Your global (not integration-specific) Notifiarr API Key|
|source|No|Optionally provide the source of the notification as a descriptive string (you can also use `from` as an alias to this same variable)|
|event|No|Optionally specify the Notifiarr Event ID you want your notification update. If none is specified, then a new notification is generated|
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
Send a discord notification:
Terminal window
```
`
# Assuming our {APIKey} is 4174216298
# Assuming our {ChannelID} is 123456789
# Test out the changes with the following command:
apprise -t "Test Title" -b "Test Message" \\
"notifiarr://4174216298/123456789"
`
```
If you have a Discord Event ID you wish to reference, you can do the following:
Terminal window
```
`
# Assuming our {APIKey} is 4174216298
# Assuming our {ChannelID} is 123456789
# Assuming our {EventID} is 1234
# Test out the changes with the following command:
apprise -t "Test Title" -b "Test Message" \\
"notifiarr://4174216298/123456789?event=1234"
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