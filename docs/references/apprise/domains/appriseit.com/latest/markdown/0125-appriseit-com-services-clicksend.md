ClickSend Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# ClickSend Notifications
## Overview
* **Source:** [https://clicksend.com](https://clicksend.com)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 160
* [ Build Your Apprise URL](/url-builder/?schema=clicksend)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Sign up for ClickSend account [from here](https://clicksend.com). You will be provided to create a user and password to associate with your account. This is all you need to use this through Apprise.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `clicksend://{user}:{password}@{PhoneNo}`
* `clicksend://{user}:{password}@{PhoneNo1}/{PhoneNo2}/{PhoneNoN}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|user|Yes|The *username* associated with your ClickSend account.|
|password|Yes|The *password* associated with your ClickSend account.|
|PhoneNo|Yes|At least one phone number MUST identified to use this plugin. This field is also very friendly and supports brackets, spaces and hyphens in the event you want to format the number in an easy to read fashion.|
|batch|No|ClickSend allows a batch mode. If you identify more then one phone number, you can send all of the phone numbers you identify on the URL in a single shot instead of the normal *Apprise* approach (which sends them one by one). Enabling batch mode has both pros and cons. By default batch mode is disabled.|
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
Send a ClickSend Notification as an SMS:
Terminal window
```
`
# Assuming our {user} is l2g
# Assuming our {password} is appriseIsAwesome
# Assuming our {PhoneNo} - is in the US somewhere making our country code +1
# - identifies as 800-555-1223
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"clicksend://l2g:appriseIsAwesome@18005551223"
# the following would also have worked (spaces, brackets,
# dashes are accepted in a phone no field):
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"clicksend://l2g:appriseIsAwesome@1-(800) 555-1223"
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