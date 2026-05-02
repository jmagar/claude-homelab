DAPNET/Hampager Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# DAPNET/Hampager Notifications
## Overview
* **Source:** [https://hampager.de/](https://hampager.de/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 80
* [ Build Your Apprise URL](/url-builder/?schema=dapnet)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Make sure you register your Amateur Radio Call Sign and create an account with [Hampager](https://hampager.de).
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `dapnet://{userid}:{password}@{callsign}`
* `dapnet://{userid}:{password}@{callsign1}/{callsign2}/{callsignN}/`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|callsign|Yes|One or more Amateur Radio Call sign’s is required to send a notification.|
|userid|Yes|Your [Hampager](https://hampager.de) account login|
|password|Yes|Your [Hampager](https://hampager.de) account password|
|priority|No|The message priority; if this isn’t specified then `normal` is used by default. The possible options are `emergency` and `normal`.|
|txgroups|No|The transmitter group(s) to associate with your message. Use a comma (`,`) to identify more then one. By default if this value isn’t specified then the group `dl-all` is used.|
|batch|No|[Hampager](https://hampager.de) allows for a batch mode. If you identify more then one call sign, you can send all of them in a single shot instead of the normal Apprise approach (which sends them one by one). Enabling batch mode has both pros and cons. By default batch mode is disabled.|
## Constraints
[Section titled “Constraints”](#constraints)
* The DAPNET API permits you to specify more than one target call sign. Any unknown or invalid call sign in that list will [terminate the whole message broadcast for all call signs](https://hampager.de/dokuwiki/doku.php?id=dapnetapisendcall)
* If the message exceeds 80 characters, the plugin will automatically truncate the content to DAPNET’s max message length
* If you specify an Apprise ‘title’ parameter, Apprise will automatically add that title to the message body along with a trailing `\\r\\n` control sequence which may result in undesired experiences. It is recommended to refrain from using Apprise’s ‘title’ parameter.
* For messages, it is recommended to stick to the English alphabet as DAPNET cannot process extended character sets like the cyrillic alphabet. The DAPNET API will still process messages with this content but the user’s pager may not display them in a proper format.
* In order to gain access to the DAPNET API, you need to be a licensed ham radio operator.
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
Send a DAPNET Notification :
Terminal window
```
`
# Assuming our {user} is df1abc
# Assuming our {password} is appriseIsAwesome
# Assuming our {callsign} - df1def
#
apprise -vv -b "Test Message Body" \\
"dapnet://df1abc:appriseIsAwesome@df1def"
# Assuming our {user} is df1abc
# Assuming our {password} is appriseIsAwesome
# Assuming our {callsign}s are - df1def,df1ghi and df1def-12
# This will result in two target call signs as the plugin is going
# to strip the '-12' ssid and detect the dupe call sign
#
apprise -vv -b "Test Message Body" \\
dapnet://df1abc:appriseIsAwesome@df1def/df1ghi/df1def-12
# Assuming our {user} is df1abc
# Assuming our {password} is test
# Assuming our {callsign} - df1def
# Assuming our {priority} - emergency
# Assuming our {txgroups} - 'dl-all', 'all'
apprise -vv -b "Test Message Body" \\
"dapnet://df1abc:test@df1def?txgroups=dl-all,all&priority=emergency"
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