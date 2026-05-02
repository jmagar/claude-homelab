Lunasea Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Lunasea Notifications
## Service End Reason
[Section titled “Service End Reason”](#service-end-reason)
Taken from their website:
💡The Service was removed from Apprise in [apprise/1318](https://github.com/caronc/apprise/issues/1318)
## Overview
* **Source:** [https://www.lunasea.app/](https://www.lunasea.app/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 160
* [ Build Your Apprise URL](/url-builder/?schema=lunasea)
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
### Cloud Hosting
[Section titled “Cloud Hosting”](#cloud-hosting)
* `lunasea://{toFireBaseUser}`
* `lunasea://{toFireBaseUser1}/{toFireBaseUser2}/{toFireBaseUserN}`
* `lunasea://+{toFireBaseDevice}`
* `lunasea://+{toFireBaseDevice1}/{toFireBaseDevice2}/{toFireBaseDeviceN}`
You can mix and match as well:
* `lunasea://{user}:{pass}@/+{toFireBaseUser1}/{toFireBaseDevice1}/`
### Private Hosting
[Section titled “Private Hosting”](#private-hosting)
This works the exact same way; you can just additionally specify your connection details to your local server:
* `lunasea://{user}:{pass}@{hostname}/{toFireBaseUser}`
* `lunasea://{user}:{pass}@{hostname}/{toFireBaseUser1}/{toFireBaseUser2}/{toFireBaseUserN}`
* `lunasea://{user}:{pass}@{hostname}/+{toFireBaseDevice}`
* `lunasea://{user}:{pass}@{hostname}/+{toFireBaseDevice1}/{toFireBaseDevice2}/{toFireBaseDeviceN}`
* `lunasea://{user}:{pass}@{hostname}:{port}/{toFireBaseUser}`
* `lunasea://{user}:{pass}@{hostname}:{port}/{toFireBaseUser1}/{toFireBaseUser2}/{toFireBaseUserN}`
* `lunasea://{user}:{pass}@{hostname}:{port}/+{toFireBaseDevice}`
* `lunasea://{user}:{pass}@{hostname}:{port}/+{toFireBaseDevice1}/{toFireBaseDevice2}/{toFireBaseDeviceN}`
**Note:** The `{user}`/`{pass}` is purely optional.
You can mix and match as well:
* `lunasea://{user}:{pass}@{hostname}/+{toFireBaseUser1}/{toFireBaseDevice1}/`
* `lunasea://{user}:{pass}@{hostname}:{port}/+{toFireBaseUser1}/{toFireBaseDevice1}/`
### Additional Notes
[Section titled “Additional Notes”](#additional-notes)
Use `lunaseas://` for a Secure (`https://`) connection and `lunasea://` for Insecure (`http://`).
`lsea://` and `lseas://` can also be used as an alias to `lunasea://` and `lunaseas://` (respectively) if you choose.
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|to|**\*No**|One or more Firebase User IDs or Device IDs you wish to send your notification to. You can use comma’s to separate multiple entries if you wish.|
|image|No|Map the image associated with the notification type to the payload. By default this is set to `no`.|
|mode|No|The default mode to treat the URL provided as. Possible values are `cloud` and `private`. This is detected if no otherwise specified. When set to `private`, a hostname must be provided as part of the URL. When set to `cloud`, all elements are presumed to be notification end points and [https://lunasea.app](https://lunasea.app) is used. In cloud mode, all transactions are secure (regardless if you specify `lunasea://` or `lsea://`).|
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
Send a LunaSea notification:
Terminal window
```
`
# Assuming our {FireBaseDeviceID} is abcd\_abcd\_abcd
# Send to a Device (make sure to add + at front):
apprise -t "Test Title" -b "Test Message" \\
lunasea://+abcd\_abcd\_abcd
# Assuming our {FireBaseDeviceID} is abcd\_abcd\_abcd
# Assuming our {FireBaseUserID} is wxyz\_wxyz\_wxyz
#Send to a device (add +) and a user (optionally add @)
apprise -t "Test Title" -b "Test Message" \\
lunasea://+abcd\_abcd\_abcd/@wxyz\_wxyz\_wxyz
# Running your own private server, no problem:
# Assuming our {hostname} is myhostname
# Assuming our {user} is user
# Assuming our {password} is pass
# Assuming our {FireBaseDeviceID} is abcd\_abcd\_abcd
# Assuming our {FireBaseUserID} is wxyz\_wxyz\_wxyz
apprise -t "Test Title" -b "Test Message" \\
lunasea://user:pass@myhostname/+FireBaseDevice1/@FireBaseUserID
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