Flock Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Flock Notifications
## Overview
* **Source:** [https://flock.com/](https://flock.com/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=flock)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Flock has a lot of similarities to Slack. Flock notifications require an *incoming-webhook* or a *app/bot* it can connect to.
### Incoming Webhook
[Section titled “Incoming Webhook”](#incoming-webhook)
You can generate an Incoming webhook from [here](https://dev.flock.com/webhooks). Just follow the wizard to pre-determine the channel(s) you want your message to broadcast to. When you’ve completed this process you will receive a URL that looks something like this:
`https://api.flock.com/hooks/sendMessage/134b8gh0-eba0-4fa9-ab9c-257ced0e8221`
This effectively equates to:
`https://api.flock.com/hooks/sendMessage/{token}`
**Note:** Apprise supports this URL *as-is* (*as of v0.7.7*); you no longer need to parse the URL any further. However there is slightly less overhead (internally) if you do.
In this example the token is `134b8gh0-eba0-4fa9-ab9c-257ced0e8221`
### Bot
[Section titled “Bot”](#bot)
Bots are a bit more difficult and presume that you followed their instructions on setting on up [your own app](https://docs.flock.com/display/flockos/Creating+an+App#CreatinganApp-HowdoIcreateaFlockOSapp?). Just like a webhook, you’ll get your own **{token}** provided to you that allows you to message people and channels directly.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax with an *incoming webhook* is as follows:
* `https://api.flock.com/hooks/sendMessage/{token}`
* `flock://{token}/`
* `flock://{botname}@{token}/`
Valid syntax with an *application / bot* are:
**Note:** the **userid** and **channelid** belong to the actual encoded id and not the public displayed value. For instance; if you have a channel called #general, it will have an encoded id associated with it that might look something like **g:abcd1234defg**. Users are identified in a similar fashion but are prefixed with **u:** instead of **g:**. These are the values you must specify here:
* `flock://{token}/u:userid`
* `flock://{botname}@{token}/u:{user}`
* `flock://{botname}@{token}/u:{user1}/u:{user2}/u:{userN}/`
* `flock://{botname}@{token}/g:{channel}`
* `flock://{token}/g:{channel}`
* `flock://{botname}@{token}/g:{channel1}/g:{channel2}/g:{channelN}/`
* `flock://{botname}@{token}/g:{channel}/u:{user}/`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|token|Yes|The first part of 3 tokens provided to you after creating a *incoming-webhook* and or an *application/bot*|
|botname|No|Identify the name of the bot that should issue the message. If one isn’t specified then the default is to just use your account (associated with the *incoming-webhook*).|
|channel|No|Channels must be prefixed with a hash tag **#** or **g:**. They must represent the encoded id of the channel name (not the human readable reference) You can specify as many channels as you want by delimiting each of them by a forward slash (/) in the url.|
|user|No|Users must be prefixed with an at symbol **@** or **u:**! They must represent the encoded id of the user name (not the human readable reference) You can specify as many users as you want by delimiting each of them by a forward slash (/) in the url.|
|image|No|Associate an image with the message. By default this is enabled.|
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
Send a Flock notification to our channel #nuxref (which is identified as `g:abcd1234efgh`):
Terminal window
```
`
# Assuming our {token} is 134b8gh0-eba0-4fa9-ab9c-257ced0e8221
# our channel nuxref is represented as g:abcd1234efgh
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
flock:///134b8gh0-eba0-4fa9-ab9c-257ced0e8221/g:abcd1234efgh
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