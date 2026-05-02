Short Message Peer-to-Peer (SMPP) Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Short Message Peer-to-Peer (SMPP) Notifications
## Overview
* **Source:** [https://smpp.org/](https://smpp.org/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=smpp)
## Account Setup
[Section titled “Account Setup”](#account-setup)
SMPP (Short Message Peer-to-Peer) is a telecom protocol used to submit SMS messages to an SMSC.
Apprise integrates with SMPP using the `smpplib` Python library.
Terminal window
```
`
pip install smpplib
`
```
To use this service you will need:
1. The SMPP server hostname (or IP) and port.
2. A valid SMPP username and password (sometimes called *system\_id* and *password*).
3. A sender address, usually your E.164 phone number (the **From** phone number).
4. One or more recipient phone numbers (targets).
If you do not control an SMPP server yourself, your SMS provider can usually supply these details.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `smpp://{user}:{password}@{host}/{from\_phone}/{targets}`
* `smpp://{user}:{password}@{host}:{port}/{from\_phone}/{targets}`
Secure variants:
* `smpps://{user}:{password}@{host}/{from\_phone}/{targets}`
* `smpps://{user}:{password}@{host}:{port}/{from\_phone}/{targets}`
Where `{targets}` is one or more phone numbers separated by `/`:
* `.../{to\_phone}`
* `.../{to\_phone1}/{to\_phone2}/{to\_phoneN}`
### Query string aliases
[Section titled “Query string aliases”](#query-string-aliases)
For configuration files and environments where paths are inconvenient, you may also specify:
* `from=` as an alias for the sender phone number
* `to=` as a comma-separated list of target phone numbers
Example:
* `smpps://\_?user=user&pass=password&host=smpp.example.ca&from=+15551234567&to=+15557654321,+15559876543`
## Important Notes
[Section titled “Important Notes”](#important-notes)
* **Titles are not used** for SMS messages. If you pass a title, Apprise will merge it into the body where applicable.
* Phone numbers should be in **E.164** format where possible (for example `+15551234567`).
* `smpp://` is considered *insecure* transport. Prefer `smpps://` when your provider supports it.
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|`user`|Yes|SMPP username (system\_id).|
|`password`|Yes|SMPP password.|
|`host`|Yes|SMPP server hostname.|
|`port`|No|SMPP port. Default is **2775** for `smpp://` and **3550** for `smpps://` (unless overridden).|
|`from\_phone`|Yes|Sender phone number (E.164 recommended).|
|`targets`|Yes|One or more destination phone numbers.|
|`from`|No|Query-string alias for `from\_phone`.|
|`to`|No|Query-string alias for additional targets as a comma-separated list.|
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
Send an SMS to a single recipient:
Terminal window
```
`
apprise -vv -b "Test message" \\
smpp://user:password@smpp.example.ca/+15551234567/+15557654321
`
```
Send to multiple recipients:
Terminal window
```
`
apprise -vv -b "Maintenance window starts at 22:00" \\
smpp://user:password@smpp.example.ca/+15551234567/+15557654321/+15559876543
`
```
Use `smpps://` (secure) on a custom port:
Terminal window
```
`
apprise -vv -b "Secure SMPP test" \\
smpps://user:password@smpp.example.ca:3550/+15551234567/+15557654321
`
```
Use query parameters (handy for YAML and environment variables):
Terminal window
```
`
apprise -vv -b "Query string example" \\
"smpps://\_?user=user&pass=password&host=smpp.example.ca&from=+15551234567&to=+15557654321,+15559876543"
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