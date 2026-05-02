Octopush Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Octopush Notifications
## Overview
* **Source:** [https://octopush.com/](https://octopush.com/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 1224
* [ Build Your Apprise URL](/url-builder/?schema=octopush)
## Account setup
[Section titled “Account setup”](#account-setup)
To use Octopush, you will need your *API Login* and *API Key*. The API login
is the email address associated with your Octopush account.
You can also optionally configure a *Sender* value. Octopush accepts an
alphanumeric sender of 3 to 11 characters for supported routes.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `octopush://{api\_login}/{api\_key}/{phone\_no}`
* `octopush://{api\_login}/{api\_key}/{phone\_no1}/{phone\_no2}/{phone\_noN}`
* `octopush://{sender}:{api\_login}/{api\_key}/{phone\_no}`
* `octopush://{sender}:{api\_login}/{api\_key}/{phone\_no1}/{phone\_no2}?batch=yes`
You can also pass values as query parameters:
* `octopush://\_?login={api\_login}&key={api\_key}&to={phone\_no}`
* `octopush://\_?login={api\_login}&key={api\_key}&sender={sender}&to={phone\_no}&type=sms\_low\_cost`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|api\_login|Yes|The *API Login* associated with your Octopush account. This must be a valid email address.|
|api\_key|Yes|The *API Key* associated with your Octopush account.|
|sender|No|An optional sender ID to display when your Octopush route supports it.|
|phone\_no|Yes|At least one phone number must be identified to use this plugin. This field is also very friendly and supports brackets, spaces, and hyphens in the event you want to format the number in an easy to read fashion.|
|batch|No|Octopush allows a batch mode. If you identify more than one phone number, you can send all of the phone numbers you identify in the URL in a single shot instead of the normal Apprise approach, which sends them one by one. By default batch mode is disabled.|
|replies|No|When set to `yes`, Apprise requests reply handling through Octopush. By default this is `no`.|
|purpose|No|The message purpose. Supported values are `alert` and `wholesale`. By default this is `alert`.|
|type|No|The message type. Supported values are `sms\_premium` and `sms\_low\_cost`. By default this is `sms\_premium`.|
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
Send an Octopush notification as an SMS:
Terminal window
```
`
# Assuming our {api\_login} is user@example.com
# Assuming our {api\_key} is my-api-key
# Assuming our {phone\_no} is in the US making our country code +1
# and identifies as 800-555-1223
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"octopush://user@example.com/my-api-key/18005551223"
# the following would also have worked (spaces, brackets,
# dashes are accepted in a phone no field):
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"octopush://user@example.com/my-api-key/1-(800) 555-1223"
`
```
Send using a sender ID and the low-cost route:
Terminal window
```
`
# Assuming our {api\_login} is user@example.com
# Assuming our {api\_key} is my-api-key
# Assuming our {sender} is MyCompany
# Assuming our {phone\_no} is +33-6-00-01-02-03
apprise -vv -b "Your order has shipped" \\
"octopush://MyCompany:user@example.com/my-api-key/33600010203?type=sms\_low\_cost"
`
```
Send one message to multiple targets using Octopush batch mode:
Terminal window
```
`
# Assuming our {api\_login} is user@example.com
# Assuming our {api\_key} is my-api-key
# Assuming our {sender} is MyCompany
# Assuming our {phone\_no1} is +33-6-00-01-02-03
# Assuming our {phone\_no2} is +33-6-00-01-02-04
apprise -vv -b "System maintenance starts in 15 minutes" \\
"octopush://MyCompany:user@example.com/my-api-key/33600010203/33600010204?batch=yes&purpose=alert"
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