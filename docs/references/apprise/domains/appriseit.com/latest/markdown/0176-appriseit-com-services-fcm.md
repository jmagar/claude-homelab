Firebase Cloud Messaging (FCM) Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Firebase Cloud Messaging (FCM) Notifications
## Overview
* **Source:** [https://firebase.google.com/docs/cloud-messaging](https://firebase.google.com/docs/cloud-messaging)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 5000
* [ Build Your Apprise URL](/url-builder/?schema=fcm)
## Account Setup
[Section titled “Account Setup”](#account-setup)
You’ll need to create an account with Google’s Firebase Cloud Messaging Service (FCM) first to use this.
From there you will access the FCM Management Console and choose which mode you wish to leverage when sending your notifications. The modes are **legacy** and **oauth2**. Both have their pros and con. Depending on which mode you choose, you will be required to construct your Apprise URL slightly diferent:
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
The legacy mode doesn’t seem to suggest it will be decommissioned anytime soon, however this is how the FCM refers to it as. This only requires the APIKey generated through the FCM Management Console.
* `fcm://{APIKey}/{Device}`
* `fcm://{APIKey}/{Device1}/{Device2}/{DeviceN}`
* `fcm://{APIKey}/#{Topic}`
* `fcm://{APIKey}/#{Topic1}/#{Topic2}/#{TopicN}`
You can mix and match these entries as well:
* `fcm://{APIKey}/{Device1}/#{Topic1}/`
### OAuth2 Mode
[Section titled “OAuth2 Mode”](#oauth2-mode)
The OAuth2 mode is what FCM seems to hint that you use. But it has much more overhead then the legacy way of doing things. It also requires you to point to a specially generated `JSON` file you can generate from your FCM Management Console.
You can point to the `JSON` file generated locally (if you saved it onto your PC) or refer to it by its web URL (if you’re sharing it somewhere on your network) like so:
* `fcm://{Project}/{Device}/?keyfile=/path/to/keyfile`
* `fcm://{Project}/{Device1}/{Device2}/{DeviceN}/?keyfile=https://user:pass@localhost/web/location`
* `fcm://{Project}/#{Topic}/?keyfile=/path/to/keyfile`
* `fcm://{Project}/#{Topic1}/#{Topic2}/#{TopicN}/?keyfile=https://user:pass@localhost/web/location`
You can mix and match these entries as well:
* `fcm://{Project}/{Device1}/#{Topic1}/?keyfile={JSON\_KeyFile}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|APIKey|Yes|The generated *API Key* from the FCM Management Console. This is only required if you intend to use the **Legacy** method.|
|Project|Yes|The generated *Project ID* from the FCM Management Console. This is only required if you intend to use the **OAuth2** method.|
|KeyFile|Yes|The location of the \_JSON Keyfile\_\_ generated from the FCM Management Console. This is only required if you intend to use the **OAuth2** method.|
|Device|No|The device you wish send your message to|
|Topic|No|The topic you want to publish your message to.|
|mode|No|The mode can be set to either **legacy** or **oauth2**. This is automatically detected depending on what you provide the Apprise URL. But you can explicitly set this here if you require.|
|priority|No|The FCM Priority. By default the priority isn’t passed into the payload so it takes on all upstream defaults. Valid options here are `min`, `low`, `normal`, `high`, and `max`.|
|image|No|Set this to `yes` if you want to include an image as part of the payload. Depending on your firebase subscription; this may or may not incur charges. By default this is set to `no`|
|image\_url|No|Specify your own custom image\_url to include as part of the payload. If this is provided, it is assumed `image` is `yes`. You an additionally set `image=no` to enforce that this assumption does not happen.|
|color|No|Identify the colour of your notification by specifying your own custom RGB value (in format #RRGGBB where the hashtag (`#`) is optional. The other options are `yes` and `no`. When set to `no`, the `color` argument simply is not part of the payload at all. When set to `yes` (default), Apprise chooses the color based on the message type (info, warning, etc).|
**Note:** This notification service does not use the title field; only the *body* is passed along.
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
Send a Legacy FCM notification:
Terminal window
```
`
# Assuming our {APIKey} is bu1dHSdO22pfaaVy
# Assuming our {Device} is ABCD:12345
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"fcm://bu1dHSdO22pfaaVy/ABCD:12345"
`
```
Send a OAuth2 FCM notification:
Terminal window
```
`
# Assuming our {Project} is Apprise
# Assuming the path to our JSON {Keyfile} is /etc/apprise/fcm/keyfile.json
# Assuming our {Device} is ABCD:12345
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"fcm://Apprise/ABCD:12345/?keyfile=/etc/apprise/fcm/keyfile.json"
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