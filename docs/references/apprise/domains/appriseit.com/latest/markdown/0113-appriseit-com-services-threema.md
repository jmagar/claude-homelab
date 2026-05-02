Threema Gateway Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Threema Gateway Notifications
## Overview
* **Source:** [https://gateway.threema.ch/](https://gateway.threema.ch/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 3500
* [ Build Your Apprise URL](/url-builder/?schema=threema)
## Account Setup
[Section titled “Account Setup”](#account-setup)
You need to set up a [Threema Gateway](https://gateway.threema.ch/) account first, which will allow you to request and access one or more 8-character Gateway IDs (each starting with an asterisk (`\*`), e.g., `\*THREEMA`).
**Important**: Please make sure to request a “Basic” ID for now, as end-to-end encrypted Threema Gateway messages are not yet supported by Apprise. End-to-end Gateway IDs cannot be used for sending Simple Messages (encrypted on Threema Servers).
* Create your Threema Gateway account at [https://gateway.threema.ch/](https://gateway.threema.ch/), and confirm your e-mail address
* For credits:
* Ask Threema Gateway support via e-mail (support-gateway at threema.ch) for test credits, and they will get you covered for some testing
* OR acquire them after logging into your Gateway account.
* [Request](https://gateway.threema.ch/en/id-request?type=simple) your Simple Gateway ID. After a short review, Threema will then create your ID, and you will find the corresponding ID secret on the ID overview page. This usually takes no more than one or two business days.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `threema://{gateway\_id}@{secret}/{user}`
* `threema://{gateway\_id}@{secret}/{user1}/{user2}/{user3}/{userN}`
* `threema://{gateway\_id}@{secret}/{email}`
* `threema://{gateway\_id}@{secret}/{email1}/{email2}/{email3}/{emailN}`
* `threema://{gateway\_id}@{secret}/{phone}`
* `threema://{gateway\_id}@{secret}/{phone1}/{phone2}/{phone3}/{phoneN}`
You can also freely mix/match the variables:
* `threema://{gateway\_id}@{secret}/{phone1}/{user1}/{email1}/...`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|gateway\_id|Yes|Your Gateway ID. It consists of 8 characters and usually starts with an asterisk (`\*`), e.g., `\*MYGWYID`. You may use `?from=` (or `gwid`) as an alias to this variable.|
|secret|Yes|The ID secret associated with your Gateway ID. You may use `?secret=` as an alias to this variable.|
|target|No|Specfiy the recipient Threema ID, e-mail address, or phone no. There is no limit to the number of targets you may specify. You may use `?to=` as an alias to this variable.|
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
Send a Threema (Gateway) Simple Notification
Terminal window
```
`
# Assume:
# - our {gateway\_id} is \*MYGWYID
# - our {secret} is abc123-2345
# - The {toPhoneNo} is 6135551234
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
threema://\*MYGWYID@abc123-2345/6135551234
`
```
Send a Threema (Gateway) Simple Notification to a Threema User by specifying their ID:
Terminal window
```
`
# Assume:
# - our {gateway\_id} is \*MYGWYID
# - our {secret} is abc123-2345
# - The {toThreemaID} is FRIENDID
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
threema://\*MYGWYID@abc123-2345/FRIENDID
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