Resend Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Resend Notifications
## Overview
* **Source:** [https://resend.com/](https://resend.com/)
* **Image Support:** No
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=resend)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Creating an account with Resend is free of charge and can be done through their main page.
Once you have an account and access to [your dashboard](https://resend.com/). You will need to ensure you’ve correctly **authenticated your domains** with them; this is done from the [Domains](https://resend.com/domains) section of your dashboard.
The last thing you need is to generate an **API Key** with at least the **Sending** permission. This can also be done through your dashboard in the [API Keys](https://resend.com/api-keys) section of your dashboard.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `resend://{apikey}:{from\_email}`
* `resend://{apikey}:{from\_email}/{to\_email}`
* `resend://{apikey}:{from\_email}/{to\_email1}/{to\_email2}/{to\_email3}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|apikey|Yes|The [API Key](https://resend.com/api-keys) you generated from within your Resend dashboard.|
|from\_email|Yes|This is the email address will identify the email’s origin (the *From* address). This address **must** contain a domain that was previously authenticated with your Resend account (See [Domain](https://resend.com/domains) section of API).|
|to\_email|No|This is the email address will identify the email’s destination (the *To* address). If one isn’t specified then the *from\_email* is used instead.|
|cc|No|The *Carbon Copy* (CC:) portion of the email. This is entirely optional. It should be noted that Resend immediately rejects emails where the *cc* contains an email address that exists in the *to* or the *bcc* list. To avoid having issues, Apprise automatically eliminates these duplicates silently if detected.|
|bcc|No|The *Blind Carbon Copy* (BCC:) portion of the email. This is entirely optional. It should be noted that Resend immediately rejects emails where the *bcc* contains an email address that exists in the *to* or the *cc* list. To avoid having issues, Apprise automatically eliminates these duplicates silently if detected. If an identical email is detected in both the CC and the BCC list, the BCC list will maintain the email and it will drop from the CC list automatically.|
|name|No|With respect to {from*email}, this allows you to provide a name with your \_Reply-To* address.
**Note:** This field has become redundant and become synonymous to `from=`. It still behaves as it did in previous versions, but you can also follow the `A User\<user@email.com\>` syntax as well. To eliminate ambiguity; the values parsed from the `from=` will always trump the `name=`.|
|reply|No|Provide a Reply-To email (or set of). More than one can be separated with a space and/or comma.|
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
Send a Resend notification:
Terminal window
```
`
# Assuming our {apikey} is re\_bcd123-xyz
# Assuming our Authenticated Domain is example.com, we might want to
# set our {from\_email} to noreply@example.com
# Assuming our {to\_email} is someone@microsoft.com
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
resend:///re\_bcd123-xyz:noreply@example.com/someone@microsoft.com
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