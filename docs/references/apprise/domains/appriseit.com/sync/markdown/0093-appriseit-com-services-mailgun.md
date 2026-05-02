Mailgun Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Mailgun Notifications
## Overview
* **Source:** [https://www.mailgun.com/](https://www.mailgun.com/)
* **Image Support:** No
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=mailgun)
## Account Setup
[Section titled “Account Setup”](#account-setup)
You can create an account for free [on their website](https://www.mailgun.com/) but it comes with restrictions.
For each domain you set up with them, you’ll be able access them all from your dashboard once you’re signed in. Here is a [quick link](https://app.mailgun.com/app/domains) to it. If you’re using a free account; at the very least you will be able to see your *sandbox domain* here. From here you can also acquire your **API Key** associated with each domain you’ve set up.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `mailgun://{user}@{domain}/{apikey}/`
* `mailgun://{user}@{domain}/{apikey}/{email}/`
* `mailgun://{user}@{domain}/{apikey}/{email1}/{email2}/{emailN}/`
You may also identify your region if you aren’t using the US servers like so:
* `mailgun://{user}@{domain}/{apikey}/?region=eu`
You can adjust what the Name associated with the From email is set to as well:
* `mailgun://{user}@{domain}/{apikey}/?name=Luke%20Skywalker`
### Email Extensions
[Section titled “Email Extensions”](#email-extensions)
If you wish to utilize extensions, you’ll need to escape the addition/plus (+) character with **%2B** like so:
`mailgun://{user}@{domain}/{apikey}/chris%2Bextension@example.com`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|apikey|Yes|The API Key associated with the domain you want to send your email from. This is available to you after signing into their website an accessing the [dashboard](https://app.mailgun.com/app/domains).|
|domain|Yes|The Domain you wish to send your email from; this domain must be registered and set up with your mailgun account.|
|user|Yes|The user gets paired with the domain you specify on the URL to make up the **From** email address your recipients receive their email from.|
|email|No|You can specify as many email addresses as you wish. Each address you identify here will represent the **To**.
**Note:** Depending on your account setup, mailgun does restrict you from emailing certain addresses.|
|region|No|Identifies which server region you intend to access. Supported options here are **eu** and **us**. By default this is set to **us** unless otherwise specified. This specifically affects which API server you will access to send your emails from.|
|name|No|This allows you to identify the name associated with the **From** email address when delivering your email.|
|to|No|This is an alias to the email variable. You can chain as many (To) emails as you want here separating each with a comma and/or space.|
|cc|No|Identify address(es) to notify as a Carbon Copy.|
|bcc|No|Identify address(es) to notify as a Blind Carbon Copy.|
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
Send a Mailgun notification to the email address [bill.gates@microsoft.com](mailto:bill.gates@microsoft.com)
Terminal window
```
`
# Assuming the {domain} we set up with our mailgun account is example.com
# Assuming our {apikey} is 4b4f2918fd-dk5f-8f91f
# We already know our To {email} is bill.gates@microsoft.com
# Assuming we want our email to come from noreply@example.com
apprise -vv -t "Email Subject" -b "Message Body" \\
mailgun:///noreply@example.com/4b4f2918fd-dk5f-8f91f/bill.gates@microsoft.com
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