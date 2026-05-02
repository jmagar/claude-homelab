Twilio Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Twilio Notifications
## Overview
* **Source:** [https://twilio.com](https://twilio.com)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 140
* [ Build Your Apprise URL](/url-builder/?schema=twilio)
## Account Setup
[Section titled “Account Setup”](#account-setup)
To use Twilio, you will need to acquire your *Account SID* and *Auth Token*. Both of these are accessible via the [Twilio Dashboard](https://www.twilio.com/console).
You’ll need to have a number defined as an Active Number ([from your dashboard here](https://www.twilio.com/console/phone-numbers/incoming)). This will become your **{FromPhoneNo}** when identifying the details below.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `twilio://{AccountSID}:{AuthToken}@{FromPhoneNo}/{PhoneNo}`
* `twilio://{AccountSID}:{AuthToken}@{FromPhoneNo}/{PhoneNo1}/{PhoneNo2}/{PhoneNoN}`
If no *ToPhoneNo* is specified, then the *FromPhoneNo* will be messaged instead; hence the following is a valid URL:
* twilio://{AccountSID}:{AuthToken}@{FromPhoneNo}/`
[Short Codes](https://www.twilio.com/docs/glossary/what-is-a-short-code) are also supported but require at least 1 Target PhoneNo
* `twilio://{AccountSID}:{AuthToken}@{ShortCode}/{PhoneNo}`
* `twilio://{AccountSID}:{AuthToken}@{ShortCode}/{PhoneNo1}/{PhoneNo2}/{PhoneNoN}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|AccountSID|Yes|The *Account SID* associated with your Twilio account. This is available to you via the Twilio Dashboard.|
|AuthToken|Yes|The *Auth Token* associated with your Twilio account. This is available to you via the Twilio Dashboard.|
|FromPhoneNo|**\*No**|The [Active Phone Number](https://www.twilio.com/console/phone-numbers/incoming) associated with your Twilio account you wish the SMS message to come from. It must be a number registered with Twilio. As an alternative to the **FromPhoneNo**, you may provide a [ShortCode](https://www.twilio.com/docs/glossary/what-is-a-short-code) instead. The phone number MUST include the country codes dialling prefix as well when placed. This field is also very friendly and supports brackets, spaces and hyphens in the event you want to format the number in an easy to read fashion.|
|ShortCode|**\*No**|The ShortCode associated with your Twilio account you wish the SMS message to come from. It must be a number registered with Twilio. As an alternative to the **ShortCode**, you may provide a **FromPhoneNo** instead.|
|PhoneNo|**\*No**|A phone number MUST include the country codes dialling prefix as well when placed. This field is also very friendly and supports brackets, spaces and hyphens in the event you want to format the number in an easy to read fashion.
**Note:** If you’re using a *ShortCode*, then at least one *PhoneNo* MUST be defined.|
::note
This notification service does not use the title field; only the *body* is passed along.
:::
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
Send a Twilio Notification as an SMS:
Terminal window
```
`
# Assuming our {AccountSID} is AC735c307c62944b5a
# Assuming our {AuthToken} is e29dfbcebf390dee9
# Assuming our {FromPhoneNo} is +1-900-555-9999
# Assuming our {PhoneNo} - is in the US somewhere making our country code +1
# - identifies as 800-555-1223
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
twilio://AC735c307c62944b5a:e29dfbcebf390dee9@19005559999/18005551223
# the following would also have worked (spaces, brackets,
# dashes are accepted in a phone no field):
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
twilio://AC735c307c62944b5a:e29dfbcebf390dee9@1-(900) 555-9999/1-(800) 555-1223
`
```
### WhatsApp Support
[Section titled “WhatsApp Support”](#whatsapp-support)
If your account is configured to support [WhatsApp for Buisness](https://www.twilio.com/en-us/messaging/channels/whatsapp) you can also use this plugin to notify those endpoints as well. Simply place a `w:` infront of the outbound phone numbers that should be delivered through WhatsApp instead of the default Twillio configuration: e.g:
Terminal window
```
`
# Assuming our {AccountSID} is AC735c307c62944b5a
# Assuming our {AuthToken} is e29dfbcebf390dee9
# Assuming our {FromPhoneNo} is +1-900-555-9999
# Assuming our WhatsApp {PhoneNo} is +1 555 123 3456
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
twilio://AC735c307c62944b5a:e29dfbcebf390dee9@19005559999/w:15551233456
# the following would also have worked (spaces, brackets,
# dashes are accepted in a phone no field):
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
twilio://AC735c307c62944b5a:e29dfbcebf390dee9@1-(900) 555-9999/w:+1 555 123 3456
`
```
You can also place a `w:` infront of your own phone number to switch the default behavior to interpret all of the numbers that follow to be sent to WhatsApp. For example: `twillio://credentials/w:18005559876/15551234444/15551235555`
In the above example, the target numbers `15551234444` and `15551235555` would have been sent through WhatsApp because the default switch of how to treat the numbers was switched by prefixing the source with `w:` instead.
**Note:** Sources with Short Codes will not work for WhatsApp.
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