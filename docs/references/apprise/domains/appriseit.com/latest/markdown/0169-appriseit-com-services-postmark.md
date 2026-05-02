Postmark Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Postmark Notifications
## Overview
* **Source:** [https://postmarkapp.com](https://postmarkapp.com)
* **Image Support:** No
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 10485760
* [ Build Your Apprise URL](/url-builder/?schema=postmark)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Postmark is a transactional email delivery service with a JSON HTTP API. To use it with Apprise:
1. Visit [https://account.postmarkapp.com/](https://account.postmarkapp.com/) and sign in (or create an account).
2. Create a **Server** (or select an existing one) from the Postmark dashboard.
3. Inside the server settings click **API Tokens** in the left sidebar.
4. Copy the **Server API Token** shown on that page. This token is what you use as `APIToken` in your Apprise URL.
5. Make sure your sender address is verified. Visit [Sender Signatures](https://account.postmarkapp.com/signature_domains) and add your sending domain or a specific sender address. Postmark will reject mail from unverified senders.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `postmark://{APIToken}:{FromEmail}`
* `postmark://{APIToken}:{FromEmail}/{ToEmail}`
* `postmark://{APIToken}:{FromEmail}/{ToEmail1}/{ToEmail2}/{ToEmailN}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|`APIToken`|\*Yes|The Server API Token found in your Postmark server’s API Tokens page.|
|`FromEmail`|\*Yes|A verified sender email address or domain. Postmark rejects mail from unverified senders.|
|`ToEmail`|No|One or more recipient email addresses placed in the URL path. When omitted the notification is sent to `FromEmail`.|
|`to`|No|Additional recipients as a comma-separated list (`?to=a@example.com,b@example.com`).|
|`name`|No|Display name for the sender (`?name=Alice`).|
|`cc`|No|Carbon-copy recipients, comma-separated (`?cc=cc@example.com`). Named recipients are supported: `?cc=Alice\<cc@example.com\>`.|
|`bcc`|No|Blind carbon-copy recipients, comma-separated (`?bcc=bcc@example.com`).|
|`reply`|No|Reply-To address, optionally including a display name (`?reply=support@example.com` or `?reply=Support\<support@example.com\>`).|
|`format`|No|Overrides the default body format. Set to `text` to send plain text instead of HTML.|
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
Send a basic notification to yourself (from and to are the same address):
Terminal window
```
`
apprise -vv -t "Test Title" -b "Test Message" \\
postmark://APIToken:user@example.com
`
```
Send from one address to a single recipient:
Terminal window
```
`
apprise -vv -t "Deployment Complete" -b "The release finished successfully." \\
postmark://APIToken:alerts@example.com/ops@example.com
`
```
Send to multiple recipients with CC, BCC, and a custom sender name:
Terminal window
```
`
apprise -vv -t "Incident Report" -b "See attached logs for details." \\
"postmark://APIToken:alerts@example.com/oncall@example.com/dev@example.com?cc=lead@example.com&bcc=manager@example.com&name=Alerting+System"
`
```
Send with an attachment:
Terminal window
```
`
apprise -vv -t "Nightly Report" -b "Attached is the latest report." \\
--attach /path/to/report.pdf \\
postmark://APIToken:reports@example.com/recipient@example.com
`
```
Send as plain text instead of HTML:
Terminal window
```
`
apprise -vv -t "Plain Text Alert" -b "Something happened." \\
"postmark://APIToken:user@example.com?format=text"
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