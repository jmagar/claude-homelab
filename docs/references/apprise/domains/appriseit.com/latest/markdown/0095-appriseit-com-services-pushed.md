Pushed Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Pushed Notifications
## Overview
* **Source:** [https://pushed.co/](https://pushed.co/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 160
* [ Build Your Apprise URL](/url-builder/?schema=pushed)
## Account Setup
[Section titled “Account Setup”](#account-setup)
You’ll want to *Request Developer Access* which is asked of you when you first log in to the site. Check your email because you’ll need to verify your account with them.
Once this is done you will have access to the [apps](https://account.pushed.co/apps) where you can create a new one if you don’t already have one.
Once this is done, you’ll get access to an:
* Application Key: **{app\_key}**
* Application Secret: **{app\_secret}**
You’ll also need something to notify; so once you’ve created an account and an app, you’ll also need to retrieve their mobile app (for either [Android](https://play.google.com/store/apps/details?id=co.pushed.GetPushed) or [iOS](https://itunes.apple.com/us/app/get-pushed/id804777699?mt=8&#x26;uo=6&#x26;at=&#x26;ct=)) and log in.
Subscribe to this App; there is a *Subscription Link* you can follow right from the settings page of the App you just created. You will need at least one subscription to use the notification service.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `pushed://{app\_key}/{app\_secret}`
* `pushed://{app\_key}/{app\_secret}/@{user\_pushed\_id}`
* `pushed://{app\_key}/{app\_secret}/@{user\_pushed\_id1}/@{user\_pushed\_id2}/@{user\_pushed\_idN}`
* `pushed://{app\_key}/{app\_secret}/#{channel\_alias}`
* `pushed://{app\_key}/{app\_secret}/#{channel\_alias1}/#{channel\_alias2}/#{channel\_aliasN}`
You can also form any combination of the above and perform updates from one url:
* `pushed://{app\_key}/{app\_secret}/@{user\_pushed\_id}/#{channel\_alias}/`
neither a **@{user\_pushed\_id}** or **#{channel}** is specified, then the default configuration is to send to just the *App* you provided keys for.
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|app\_key|Yes|The Application Key can be generated on the Settings page of your Pushed’s account. You must have an application key for this Notification service to work.|
|app\_secret|Yes|The Application Secret can be generated on the Settings page of your Pushed’s account. You must have an application secret for this Notification service to work.|
|user\_pushed\_id|No|Users must be prefixed with an *at* (@) character or they will be ignored. You can identify users here by their Pushed ID.|
|channel\_alias|No|Channels must be prefixed with a *hash tag* (#) or they will be ignored. Channels must be registered with your Pushed account to work. This must be the channel alias itself; not the channel. The alias can be retrieved from the channel settings from within your pushed.io account.|
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
Send a Pushed notification:
Terminal window
```
`
# Assuming our {app\_key} is sopJo0dVKVC9YK1F5wDQ
# Assuming our {app\_secret} is KWEtXxVm1PtDTTrKaEM49DhBd8MJvSMCHSvunPerbCf1MaNLO300roqOL0F8HErAl
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
pushed://sopJo0dVKVC9YK1F5wDQ/KWEtXxVm1PtDTTrKaEM49DhBd8MJvSMCHSvunPerbCf1MaNLO300roqOL0F8HErAl
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