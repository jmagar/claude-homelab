SparkPost Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# SparkPost Notifications
## Overview
* **Source:** [https://sparkpost.com/](https://sparkpost.com/)
* **Image Support:** No
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=sparkpost)
## Account Setup
[Section titled “Account Setup”](#account-setup)
You can create an account for free [on their website](https://sparkpost.com/) but it comes with restrictions.
For each domain you set up with them, you’ll be able access them all from your dashboard once you’re signed in. You’ll need to generate an API key and grant it `transmission` access.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `sparkpost://{user}@{domain}/{apikey}/`
* `sparkpost://{user}@{domain}/{apikey}/{email}/`
* `sparkpost://{user}@{domain}/{apikey}/{email1}/{email2}/{emailN}/`
You may also identify your region if you aren’t using the US servers like so:
* `sparkpost://{user}@{domain}/{apikey}/?region=eu`
You can adjust what the Name associated with the From email is set to as well:
* `sparkpost://{user}@{domain}/{apikey}/?name=Darth%20Vader`
### Email Extensions
[Section titled “Email Extensions”](#email-extensions)
If you wish to utilize extensions, you’ll need to escape the addition/plus (+) character with **%2B** like so:
`sparkpost://{user}@{domain}/{apikey}/chris%2Bextension@example.com`
The Carbon Copy (**cc=**) and Blind Carbon Copy (**bcc=**) however are applied to each email sent. Hence if you send an email to 3 target users, the entire *cc* and *bcc* lists will be part of all 3 emails.
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|apikey|Yes|The API Key associated with the domain you want to send your email from. This is available to you after signing into their website an accessing the [dashboard](https://app.sparkpost.com/app/domains).|
|domain|Yes|The Domain you wish to send your email from; this domain must be registered and set up with your sparkpost account.|
|user|Yes|The user gets paired with the domain you specify on the URL to make up the **From** email address your recipients receive their email from.|
|batch|No|If batch mode is set to `yes` then all of email addresses are sent in a single batch for SparkPost to handle.|
|email|No|You can specify as many email addresses as you wish. Each address you identify here will represent the **To**.
**Note:** Depending on your account setup, sparkpost does restrict you from emailing certain addresses.|
|region|No|Identifies which server region you intend to access. Supported options here are **eu** and **us**. By default this is set to **us** unless otherwise specified. This specifically affects which API server you will access to send your emails from.|
|from|No|This allows you to identify the name associated with the **From** email address when delivering your email.|
|to|No|This is an alias to the email variable. You can chain as many (To) emails as you want here separating each with a comma and/or space.|
|cc|No|Carbon Copy email address(es). More than one can be separated with a space and/or comma.|
|bcc|No|Blind Carbon Copy email address(es). More than one can be separated with a space and/or comma.|
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
Send a sparkpost notification to the email address `bill.gates@microsoft.com`
Terminal window
```
`
# Assuming the {domain} we set up with our sparkpost account is example.com
# Assuming our {apikey} is 4b4f2918fddk5f8f91f
# We already know our To {email} is bill.gates@microsoft.com
# Assuming we want our email to come from noreply@example.com
apprise sparkpost:///noreply@example.com/4b4f2918fddk5f8f91f/bill.gates@microsoft.com
`
```
### Header Manipulation
[Section titled “Header Manipulation”](#header-manipulation)
Some users may require special HTTP headers to be present when they post their data to their server. This can be accomplished by just sticking a plus symbol (**+**) in front of any parameter you specify on your URL string. The below examples send a sparkpost notification to the email address `bill.gates@microsoft.com` while leveraging the header manipulation.
Terminal window
```
`
# Below would set the header:
# X-Token: abcdefg
#
# Assuming the {domain} we set up with our sparkpost account is example.com
# Assuming our {apikey} is 4b4f2918fddk5f8f91f
# We already know our To {email} is bill.gates@microsoft.com
# Assuming we want our email to come from noreply@example.com
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"sparkpost:///noreply@example.com/4b4f2918fddk5f8f91f/bill.gates@microsoft.com/?+X-Token=abcdefg"
# Multiple headers just require more entries defined with a hyphen in front:
# Below would set the headers:
# X-Token: abcdefg
# X-Apprise: is great
#
# Assuming the {domain} we set up with our sparkpost account is example.com
# Assuming our {apikey} is 4b4f2918fddk5f8f91f
# We already know our To {email} is bill.gates@microsoft.com
# Assuming we want our email to come from noreply@example.com
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"sparkpost:///noreply@example.com/4b4f2918fddk5f8f91f/bill.gates@microsoft.com/?+X-Token=abcdefg&+X-Apprise=is%20great"
`
```
### Global Substitution
[Section titled “Global Substitution”](#global-substitution)
SparkPost allows you to identify `{{tokens}}` that are wrapped in 2 curly braces. [See here on their section of templating](https://developers.sparkpost.com/api/template-language/) for more details. If you wish to pass in a keyword and its substituted value, simply use the colon (**:**) in front of any parameter you specify on your URL string. The below examples send a sparkpost notification to the email address `bill.gates@microsoft.com` while leveraging the header manipulation.
Terminal window
```
`
# Below would set the token {{software}} to be substituted with Microsoft:
# Assuming the {domain} we set up with our sparkpost account is example.com
# Assuming our {apikey} is 4b4f2918fddk5f8f91f
# We already know our To {email} is bill.gates@microsoft.com
# Assuming we want our email to come from noreply@example.com
apprise -vv -t "Test Message Title" -b "Bill Gates works at {{software}}" \\
"sparkpost:///noreply@example.com/4b4f2918fddk5f8f91f/bill.gates@microsoft.com/?:software=Microsoft"
`
```
You can specify as many tokens as you like. Apprise automatically provides some default (out of the box) translated tokens if you wish to use them; they are as follows:
* **app\_id**: The Application identifier; usually set to `Apprise`, but developers of custom applications may choose to over-ride this and place their name here. this is how you acquire this value.
* **app\_desc**: Similar the the Application Identifier, this is the Application Description. It’s usually just a slightly more descriptive alternative to the *app\_id*. This is usually set to `Apprise Notification` unless it has been over-ridden by a developer.
* **app\_color**: A hex code that identifies a colour associate with a message. For instance, `info` type messages are generally blue where as `warning` ones are orange, etc.
* **app\_type**: The message type itself; it may be `info`, `warning`, `success`, etc
* **app\_title**: The actual title (`--title` or `-t` if from the command line) that was passed into the apprise notification when called.
* **app\_body**: The actual body (`--body` or `-b` if from the command line) that was passed into the apprise notification when called.
* **app\_url**: The URL associated with the Apprise instance (found in the **AppriseAsset()** object). Unless this has been over-ridden by a developer, its value will be `https://github.com/caronc/apprise`.
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