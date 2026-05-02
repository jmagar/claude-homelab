Bark Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Bark Notifications
## Overview
* **Source:** [https://github.com/Finb/Bark](https://github.com/Finb/Bark)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=bark)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Bark is an iOS App which allows you to push custom notifications to your iPhone. Download the server for a self-hosted solution.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `bark://{host}/{device\_key}`
* `bark://{host}:{port}/{device\_key}`
The secure versions:
* `barks://{host}/{device\_key}`
* `barks://{host}:{port}/{device\_key}`
You can also notify more than one device at a time:
* `bark://{host}:{port}/{device\_key1}/{device\_key2}/{device\_keyN}/`
## Message Format Support
[Section titled “Message Format Support”](#message-format-support)
Bark supports receiving content as either plain text or Markdown.
Apprise will automatically send one of the following payload fields,
depending on the message format in use:
* **Plain text** (default): content is sent using the `body` field.
* **Markdown**: content is sent using the `markdown` field.
To explicitly control this behaviour, set the Apprise message format.
For example:
* `?format=text` forces plain text handling.
* `?format=markdown` enables Markdown handling.
Note that the `format` handling is done by Apprise and affects how the
notification is assembled and delivered to Bark.
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|device\_key|Yes|The device key you wish to notify|
|sound|No|Optionally set a sound file to be played with notification sent. Supported sounds are identified [here](https://github.com/Finb/Bark/tree/master/Sounds)|
|click|No|Provide a hyperlink that should be associated with the notification|
|level|No|Specify the message level. Can be either **active**, **timeSensitive**, or **passive**.|
|volume|No|Specify a volume between 0 and 10 (inclusive).|
|badge|No|Provide a numerical value of 0 (zero) or greater to associate a badge with the bark icon on the iOS device.|
|category|No|Associate a category with your notification|
|group|No|Associate a group with your notification|
|icon|No|Set a custom icon URL for the notification. If not specified, Apprise may use its default notify image (unless disabled).|
|image|No|Set to `no` if you do not want the Apprise alert level being placed as the icon associated with the message.|
|call|No|Boolean-like input. Accepts `yes/no`, `true/false`, `1/0`, `+/-`. When enabled, payload includes `1`.|
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
Send a Bark notification to all devices associated with a project:
Terminal window
```
`
# Assume:
# - our {hostname} is localhost
# - our {port} is 8080
# - our {device\_key} is j300012fl9y0b5AW9g9Nsejb8P
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
bark://localhost:8080/j300012fl9y0b5AW9g9Nsejb8P
`
```
Send a Markdown formatted Bark notification:
Terminal window
```
`
# Markdown content is sent using Bark's `markdown` field
apprise -vv -t "Build Status" -b "# Success\\n\\nDeployment completed." \\
bark://localhost:8080/j300012fl9y0b5AW9g9Nsejb8P?format=markdown
`
```
Force plain text behaviour (even if your Apprise configuration defaults
to another format):
Terminal window
```
`
apprise -vv -t "Plain Text" -b "\*\*This will not be bold\*\*" \\
bark://localhost:8080/j300012fl9y0b5AW9g9Nsejb8P?format=text
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