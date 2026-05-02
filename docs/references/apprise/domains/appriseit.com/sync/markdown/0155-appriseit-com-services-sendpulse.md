SendPulse Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# SendPulse Notifications
## Overview
* **Source:** [https://sendpulse.com/](https://sendpulse.com/)
* **Image Support:** No
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=sendpulse)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Once you have an account and access to [your dashboard](https://app.sendpulse.com/). You will need to ensure you acquire your Client ID and Client Secret in order to construct the Apprise URLs
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `sendpulse://{user}@{host}/{client\_id}/{client\_secret}`
* `sendpulse://{user}@{host}/{client\_id}/{client\_secret}/{to\_email}`
* `sendpulse://{user}@{host}/{client\_id}/{client\_secret}/{to\_email1}/{to\_email2}/{to\_email3}`
Template support is also supported as well, You just need to specify the integer assigned to it as part of the URL:
* `sendpulse://{user}@{host}/{client\_id}/{client\_secret}/:{to\_email}?template={temlate\_int}`
If you want to take advantage of the `dynamic\_template\_data` variables, just create arguments prefixed with a plus (+); for example:
* `sendpulse://{user}@{host}/{client\_id}/{client\_secret}/{to\_email}?template={template\_int}&+{sub1}=value&+{sub2}=value2`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|user|Yes|Combined with the `host`, it constructs the email address you have configured with your SendPulse account.|
|host|Yes|Combined with the `user`, it constructs the email address you have configured with your SendPulse account.|
|client\_id|Yes|The Client ID associated with your SendPulse account.|
|client\_secret|Yes|The Client Secret associated with your SendPulse account.|
|from|No|You can optionally identify who the email is from if you wish.|
|to\_email|No|This is the email address will identify the email’s destination (the *To* address). If one isn’t specified then the *from\_email* is used instead.|
|template|No|You may optionally specify the integer of a previously generated SendPulse template to base the email on.|
|cc|No|The *Carbon Copy* (CC:) portion of the email. This is entirely optional.|
|bcc|No|The *Blind Carbon Copy* (BCC:) portion of the email.|
### Dynamic Template Data
[Section titled “Dynamic Template Data”](#dynamic-template-data)
Apprise has template support for SendPulse. Just define the `?template=` and the optional arguments you want to set. You can identify and set these variables using Apprise by simply sticking a plus (+) in front of any parameter you specify on your URL string.
Consider the following template: `1234`
An Apprise URL might look like:
`sendpulse://user@example.com?template=1234&+what=templates&+app=Apprise`
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
Send a SendPulse notification:
Terminal window
```
`
# Assuming our {user} is user@example.com
# Assuming our {client\_id} is client\_id
# Assuming our {client\_secret} is client\_secret
# Assuming we want to send an email to target@example.com
# Assuming our {to\_email} is someone@microsoft.com
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
sendpulse:///user@example.com/client\_id/client\_secret/target@example.com
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