Plivo Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Plivo Notifications
## Overview
* **Source:** [https://plivo.com](https://plivo.com)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 140
* [ Build Your Apprise URL](/url-builder/?schema=plivo)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Signup with Plivo [from here](https://plivo.com). From within your account you can genrate both our **Auth ID** and **Auth Token**
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `plivo://{auth\_id}@{token}/{from\_phone}/`
* `plivo://{auth\_id}@{token}/{from\_phone}/{ToPhoneNo}`
* `plivo://{auth\_id}@{token}/{from\_phone}/{ToPhoneNo1}/{ToPhoneNo2}/{ToPhoneNoN}`
**Note**: If no target phone numbers are specified, then the `{source\_phone}` is notified.
**Note**: All Phone Numbers must be in E.164 format (e.g., `+14151234567`)
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|auth\_id|Yes|The **Auth ID** Associated with your Plivo account.|
|token|Yes|This is your generated Access Token associated with your Plivo account.|
|from|Yes|The phone number associated with your account you want the text message to originate from.|
|to|No|The phone numbers you wish to notify.|
|batch|No|Send multiple specified notifications in a single batch (1 upstream post to the end server). By default this is set to `no`.|
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
Send a Plivo notification:
Terminal window
```
`
# Assuming our {auth\_id} is abcd123
# Assuming our {token} is 9876test
# Assuming out {from\_no} is +1555229999
# Assuming we want to notify 1555221237, and +18005551234
# Test out the changes with the following command:
apprise -t "Test Title" -b "Test Message" \\
"plivo://abcd123@9876test/1555229999/+1555221237/+18005551234"
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