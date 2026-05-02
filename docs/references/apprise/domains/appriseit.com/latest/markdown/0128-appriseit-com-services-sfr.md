Société Française du Radiotéléphone (SFR) Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Société Française du Radiotéléphone (SFR) Notifications
## Overview
* **Source:** [https://www.sfr.fr/](https://www.sfr.fr/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 160
* [ Build Your Apprise URL](/url-builder/?schema=sfr)
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `sfr://{user}:{password}@{space\_id}/{PhoneNo}`
* `sfr://{user}:{password}@{space\_id}/{PhoneNo1}/{PhoneNo2}/{PhoneNoN}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|user|Yes|The user associated with your SFR account.|
|password|Yes|The password associated with your SFR account.|
|space\_id|Yes|The Space ID associated with your SFR account.|
|PhoneNo|**\*No**|The phone number you wish to notify|
|to|Yes|This is the Phone Number that will receive the notification; this is an alias of PhoneNo|
|lang|No (default value set)|This is required by SFR when sending an SMS. Default to `fr\_FR`|
|from|no|This is the sender name that will be seen when people receive the sms. It *MUST* be registered previously in the SFR Business DMC Account|
|timeout|No|This is the time after which the SMS will be dropped by SFR. Default to `2880` minutes|
|voice|No|This is the voice used when SMS is encoded as a vocal. Not applicable in apprise, but must be set for API compatibility reasons. Default to `claire08s`.|
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
Send a SFR Notification:
Terminal window
```
`
# Assuming our {user} is foo
# Assuming our {password} is bar
# Assuming our {space\_id} is 1234
# Assuming our {PhoneNo} - is in the US somewhere making our country code +1
# - identifies as 800-555-1223
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
sfr://foo:bar@1234/18005551223
# the following would also have worked (spaces, brackets,
# dashes are accepted in a phone no field):
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
sfr://foo:bar@1234//1-(800) 555-1223
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