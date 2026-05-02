Brevo Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Brevo Notifications
## Overview
* **Source:** [https://www.brevo.com](https://www.brevo.com)
* **Image Support:** No
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=brevo)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Brevo is a transactional email platform that exposes a JSON HTTP API for sending mail. The new `NotifyBrevo` plugin integrates this API with Apprise, using a URL schema consistent with other email providers such as SendGrid and Resend. The plugin:
1. Visit [https://www.brevo.com/](https://www.brevo.com/) and sign in to your Brevo account.
2. Navigate to **SMTP & API** in your account, then create a **Transactional email API key** with permission to send email.
3. Copy the generated **API key**. This will be used as the `APIToken` part of your Apprise URL.
4. Ensure you have at least one verified sender address or authenticated sending domain configured in Brevo. The **From Email** used in Apprise must be a valid sender, or Brevo will reject the request.
5. Construct your `brevo://` URL using the syntax below, substituting your API key, From address, and target recipients.
6. Use this URL in your Apprise configuration file or CLI calls.
⚠️ Brevo may send you a confirmation email (`subject: Security Alert: Verify a new IP`) indicating that `Someone tried to use your organization account and make an API call with an IP address you have never used before. We wanted to check this activity with you.`. You then need to use the confirmation link to approve the IP in question. From that point forward Apprise should work uninterrupted.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* Single sender, default recipient (self-notification). Note that the ‘From Email’ must be a ‘Verified Sender’ already with Brevo for this syntax to work.
* `brevo://APIToken:FromEmail`
* Explicit recipients:
* `brevo://APIToken:FromEmail/ToEmail`
* `brevo://APIToken:FromEmail/ToEmail1/ToEmail2/ToEmailN`
* Additional parameters:
* `?to=extra1@example.com,extra2@example.com`
* `?cc=cc1@example.com,cc2@example.com`
* `?bcc=bcc1@example.com,bcc2@example.com`
* `?reply=Reply Name \<reply@example.com\>`
The plugin URL template is:
* `brevo://{apikey}:{from\_email}`
* `brevo://{apikey}:{from\_email}/{targets}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|`APIToken`|Yes|Your Brevo transactional API key (`api-key` header value).|
|`FromEmail`|Yes|Verified sender email address in Brevo (`sender.email`).|
|`ToEmail`|No|One or more recipient email addresses in the URL path.|
|`to`|No|Additional recipients as a comma-separated list in the query string.|
|`cc`|No|Carbon-copy recipients, comma-separated.|
|`bcc`|No|Blind carbon-copy recipients, comma-separated.|
|`reply`|No|Reply-To header, optionally including a display name.|
|`format`|No|Overrides default format (`html` or `text`), consistent with Apprise core.|
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
Send a basic Brevo notification to yourself (from and to are the same):
Terminal window
```
`
apprise -vv -t "Test Title" -b "Test Message" \\
brevo://APIToken:user@example.com
`
```
Send an email from `user@example.com` to a single recipient:
Terminal window
```
`
apprise -vv -t "Deployment Complete" -b "The release finished successfully." \\
brevo://APIToken:user@example.com/ops@example.com
`
```
Send to multiple recipients with CC, BCC and a Reply-To header:
Terminal window
```
`
apprise -vv -t "Incident Report" -b "See attached logs for details." \\
"brevo://APIToken:alerts@example.com/oncall@example.com?to=dev1@example.com,dev2@example.com&cc=teamlead@example.com&bcc=manager@example.com&reply=Support%20Desk%20\<support@example.com\>"
`
```
Send with an attachment:
Terminal window
```
`
apprise -vv -t "Nightly Report" -b "Attached is the latest report." \\
--attach /path/to/report.pdf \\
brevo://APIToken:reports@example.com/recipient@example.com
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