Exotel Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Exotel Notifications
## Overview
* **Source:** [https://exotel.com/](https://exotel.com/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 2000
* [ Build Your Apprise URL](/url-builder/?schema=exotel)
## Account Setup
[Section titled “Account Setup”](#account-setup)
To use Exotel, you will need your *Account SID*, *API Key*, and *API Token*. These are available from the [Exotel Dashboard](https://my.exotel.com/) under API settings.
Exotel uses the *Account SID* in the API endpoint and the *API Key* with *API Token* for HTTP Basic authentication. For backwards compatibility, Apprise uses the *Account SID* as the API key when `apikey=` is not provided.
You will also need a valid source value for **{FromPhoneNo}**. Exotel accepts an ExoPhone, an approved alphanumeric Sender ID, or an approved numeric sender ID associated with your account.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `exotel://{AccountSid}:{ApiToken}@{FromPhoneNo}`
* `exotel://{AccountSid}:{ApiToken}@{FromPhoneNo}/{PhoneNo}`
* `exotel://{AccountSid}:{ApiToken}@{FromPhoneNo}/{PhoneNo1}/{PhoneNo2}/{PhoneNoN}`
* `exotel://{AccountSid}:{ApiToken}@{SenderID}/{PhoneNo}?apikey={ApiKey}`
* `exotel://{AccountSid}:{ApiToken}@{SenderID}/{PhoneNo1}/{PhoneNo2}?batch=yes`
If no *ToPhoneNo* is specified, then the *FromPhoneNo* will be messaged instead; hence the following is a valid URL:
* `exotel://{AccountSid}:{ApiToken}@{FromPhoneNo}/`
You can also pass values as query parameters:
* `exotel://\_?sid={AccountSid}&token={ApiToken}&apikey={ApiKey}&from={FromPhoneNo}&to={PhoneNo}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|AccountSid|Yes|The *Account SID* associated with your Exotel account. This is used in the Exotel API path.|
|ApiToken|Yes|The *API Token* associated with your Exotel account. This is used as the HTTP Basic authentication password.|
|ApiKey|**No**|The *API Key* associated with your Exotel account. This is used as the HTTP Basic authentication username. If omitted, Apprise uses **AccountSid** for backwards compatibility with older URLs.|
|FromPhoneNo|Yes|An ExoPhone associated with your Exotel account. The phone number MUST include the country code dialling prefix. Spaces, brackets, and hyphens are accepted for readability.|
|SenderID|Yes|An approved Exotel sender ID/header associated with your account. This may be an alphanumeric Sender ID such as `EXOTEL` or a numeric sender ID such as `600123`. Use this in place of **FromPhoneNo** when configured in Exotel.|
|PhoneNo|**\*No**|A phone number MUST include the country code dialling prefix. Spaces, brackets, and hyphens are accepted for readability. If no target is provided, Apprise sends the SMS to **FromPhoneNo**.|
|region|No|Can be either `us` or `in`. By default, the region is set to `us`. Use `in` for the Mumbai API endpoint.|
|priority|No|Can be either `normal` or `high`. By default, priority is set to `normal`. Exotel recommends `high` only for OTP SMS messages.|
|unicode|No|Optionally tell Apprise whether the SMS should be sent as unicode. By default this is set to `yes`; set it to `no` to use plain text encoding.|
|batch|No|Send multiple targets in a single Exotel bulk SMS API request. By default this is set to `no`, so Apprise sends one upstream request per target.|
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
Send an Exotel notification as an SMS:
Terminal window
```
`
# Assuming our {AccountSid} is acme123
# Assuming our {ApiToken} is exo-token
# Assuming our {FromPhoneNo} is +1-900-555-9999
# Assuming our {PhoneNo} - is in the US somewhere making our country code +1
# - identifies as 800-555-1223
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
exotel://acme123:exo-token@19005559999/18005551223
# the following would also have worked (spaces, brackets,
# dashes are accepted in a phone no field):
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
exotel://acme123:exo-token@1-(900) 555-9999/1-(800) 555-1223
`
```
Send through the India region using a separate API key and an approved sender ID:
Terminal window
```
`
# Assuming our {AccountSid} is acme123
# Assuming our {ApiKey} is api-key
# Assuming our {ApiToken} is exo-token
# Assuming our {SenderID} is EXOTEL
# Assuming our {PhoneNo} is +91-98765-43210
apprise -vv -b "Your verification code is 123456" \\
"exotel://acme123:exo-token@EXOTEL/919876543210?apikey=api-key&region=in&priority=high"
`
```
Send one message to multiple targets using Exotel bulk SMS:
Terminal window
```
`
# Assuming our {AccountSid} is acme123
# Assuming our {ApiKey} is api-key
# Assuming our {ApiToken} is exo-token
# Assuming our {SenderID} is EXOTEL
# Assuming our {PhoneNo1} is +91-98765-43210
# Assuming our {PhoneNo2} is +91-98765-43211
apprise -vv -b "Your scheduled reminder" \\
"exotel://acme123:exo-token@EXOTEL/919876543210/919876543211?apikey=api-key&region=in&batch=yes"
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