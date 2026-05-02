Direct 7 (D7) Networks Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Direct 7 (D7) Networks Notifications
## Overview
* **Source:** [https://d7networks.com](https://d7networks.com)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 160
* [ Build Your Apprise URL](/url-builder/?schema=d7sms)
## Account Setup
[Section titled “Account Setup”](#account-setup)
To use this service you will need a D7 Networks account from their [website](https://d7networks.com/)
After you’ve established your account you can get your API Token from the API Details section from within your [account profile area](https://d7networks.com/accounts/profile/).
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `d7sms://{token}@{PhoneNo}`
* `d7sms://{token}@{PhoneNo1}/{PhoneNo2}/{PhoneNoN}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|token|Yes|The *API Token* associated with your D7 Networks account. This is available to you via the **API Details** section from within your [account profile area](https://d7networks.com/accounts/profile/).|
|PhoneNo|Yes|At least one phone number MUST identified to use this plugin. This field is also very friendly and supports brackets, spaces and hyphens in the event you want to format the number in an easy to read fashion.|
|from|No|Originating address,In cases where the rewriting of the sender’s address is supported or permitted by the SMS-C. This is used to transmit the message, this number is transmitted as the originating address and is completely optional.|
|unicode|No|Message should be set to `unicode`. By default this is set `False`. When set to `False` (default), in the background: an `auto` switch is specified allowing D7 Networks to detect the message type on its own. Set this to `True` if you want to enforce all messages to be of type `unicode`.|
|batch|No|D7 Networks allows a batch mode. If you identify more then one phone number, you can send all of the phone numbers you identify on the URL in a single shot instead of the normal *Apprise* approach (which sends them one by one). Enabling batch mode has both pros and cons. By default batch mode is disabled.|
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
Send a SMS message through D7 Networks:
Terminal window
```
`
# Assuming our {token} is AJfkafjA4Baghkr0Zkjk
# Assuming our {PhoneNo} - is in the US somewhere making our country code +1
# - identifies as 800-555-1223
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"d7sms://AJfkafjA4Baghkr0Zkjk@18005551223"
# the following would also have worked (spaces, brackets,
# dashes are accepted in a phone no field):
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"d7sms://AJfkafjA4Baghkr0Zkjk@1-(800) 555-1223"
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