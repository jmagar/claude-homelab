SMSEagle Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# SMSEagle Notifications
## Overview
* **Source:** [https://www.smseagle.eu/](https://www.smseagle.eu/)
* **Image Support:** No
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 1200
* [ Build Your Apprise URL](/url-builder/?schema=smseagle)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Get your SMSEagle Hardware SMS/MMS Gateway connection [from here](https://www.smseagle.eu). It is from the device you can access its web interface and configure your access token.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `smseagles://{token}@{hostname}/{target}`
* `smseagles://{token}@{hostname}:{port}/{target}`
A `target` can be either a phone number, a contact, or if prefixed with `#` it becomes a group. Contacts are generally prefixed with a `@`.
* `smseagles://{token}@{hostname}:{port}/{phoneNo}`
* `smseagles://{token}@{hostname}:{port}/{phoneNo1}/{phoneNo2}/{phoneNoN}`
* `smseagles://{token}@{hostname}:{port}/@{contact}`
* `smseagles://{token}@{hostname}:{port}/@{contact1}/@{contact2}/@{contactN}`
* `smseagles://{token}@{hostname}:{port}/#{group}`
* `smseagles://{token}@{hostname}:{port}/#{group1}/#{group2}/#{groupN}`
**Note**: If you choose to leverage Groups, make sure your group as **Public** or it will not work from the API.
You can mix and match as well
* `smseagles://{token}@{hostname}:{port}/{to\_phone1}/3@{group1}/@{contact1}`
For ambiguity, if you do not provide a valid phone number, and the information parsed does not exclusively have a `#` or `@` in front of it, then it is interpreted as a Contact.
`smseagle:///` uses port 80 (and is not encrypted) while `smseagles://` secures the connection and defaults to port 443.
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|hostname|Yes|The hostname belonging to SMSEagle Appliance and/or account.|
|token|Yes|This is your generated Access Token associated with your SMSEagle account.|
|port|No|The port our Web server is listening on. By default the port is **80** for **smseagle://** and **443** for all **smseagles://** references.|
|target|Yes|A phone number, group, and/or contact you wish to send your notification to.|
|batch|No|Send multiple specified notifications in a single batch (1 upstream post to the end server). By default this is set to `no`.|
|test|No|Run in SMSEagle test mode. By default (unless specified) this is set to `No`.|
|flash|No|Send as SMS Flash message. By default (unless specified) this is set to `No`.|
|priority|No|Can be set to either `normal` or `high`. If not otherwise provided, this assumes to be `normal` by default.|
|status|No|Optionally include a small little ASCII string representing the notification status being sent (inline with it) by default this is set to `no`.|
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
Send a SMSEagle notification:
Terminal window
```
`
# Assuming our {AccessToken} is abcd123
# Assuming our {Hostname} of our SMSEagle Appliance is smseagle.example.com
# Assuming we want to notify 555221237, and +18005551234
# Test out the changes with the following command:
apprise -t "Test Title" -b "Test Message" \\
smseagle://abcd123@smseagle.example.com/555221237/+18005551234
`
```
SMSEagle Notifications also support attachments (Images only though):
Terminal window
```
`
# Assuming our {WebhookID} is 4174216298
# Assuming our {WebhookToken} is JHMHI8qBe7bk2ZwO5U711o3dV\_js
# Assuming our {AvatarURL} is https://i.imgur.com/FsEpmwg.jpeg
# Also support for attachments:
apprise -t "Test Title" -b "Test Message" \\
smseagle://abcd123@smseagle.example.com/555221237/+18005551234 \\
--attach /path/to/image.png
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