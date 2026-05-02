SimplePush Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# SimplePush Notifications
## Overview
* **Source:** [https://simplepush.io/](https://simplepush.io/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 10000
* [ Build Your Apprise URL](/url-builder/?schema=simplepush)
## Account Setup
[Section titled “Account Setup”](#account-setup)
SimplePush is a pretty straight forward messaging system you can get for your Android Device through their App [here](https://play.google.com/store/apps/details?id=io.tymm.simplepush).
You can optionally add additional notification encryption in the settings where it provides you with a **{salt}** value and allows you to configure/set your own encryption **{password}**.
### 🔒 AES-CBC-128 Encryption Weakness
[Section titled “🔒 AES-CBC-128 Encryption Weakness”](#-aes-cbc-128-encryption-weakness)
The Apprise team recognizes that the encryption used by this plugin is AES-CBC-128 which has been identified to have weaknesses including being vulnerable to the padding oracle attack ([Reference](https://soatok.blog/2020/07/12/comparison-of-symmetric-encryption-methods/#aes-gcm-vs-aes-cbc)).
If the level of encryption is not satisfactory to you, your options are:
1. Reach out to SimplePush and ask for them to improve their security (to which Apprise will gladly accomodate) …or
2. Choose not to use Simple Push and select one of the [many other options available](https://github.com/caronc/apprise/wiki#notification-services).
What is important to identify is this weak encryption used by Apprise to access SimplePush is in place for compliance only. This will never have any cascading effect or impact any other secure notification service also supported by Apprise.
Below is a screenshot from [https://simplepush.io/features](https://simplepush.io/features) explaining the defined encryption setting from the upstream source:
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `spush://{apikey}/`
* `spush://{salt}:{password}@{apikey}/`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|apikey|Yes|This is required for your account to work. You will be provided one from your SimplePush account.|
|event|No|Optionally specify an event on the URL.|
|password|No|SimplePush offers a method of further encrypting the message and title during transmission (on top of the secure channel it’s already sent on). This is the Encryption password set. You must provide the `salt` value with the `password` in order to work.|
|salt|No|The salt is provided to you by SimplePush and is the second part of the additional encryption you can use with this service. You must provide a `password` with the `salt` value in order to work.|
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
Send a SimplePush notification:
Terminal window
```
`
# Assume:
# - our {apikey} is ABC123
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
spush://ABC123
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