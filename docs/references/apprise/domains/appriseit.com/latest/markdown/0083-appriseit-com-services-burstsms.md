Burst SMS Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Burst SMS Notifications
## Overview
* **Source:** [https://burstsms.com/](https://burstsms.com/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 160
* [ Build Your Apprise URL](/url-builder/?schema=burstsms)
## Account Setup
[Section titled “Account Setup”](#account-setup)
You need to have an account with [Burst SMS](https://burstsms.com/). Visit your profile options and create a `Secret` to associate with your account. You’ll notice that there is already an `API Key` present. These will be used for your credentials.
Burst SMS will set you up with a Sender ID that you’re notifications will originate from. This must be provided as part of the Apprise URL as well.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `burstsms://{api\_key}:{secret}@{sender\_id}/{targets}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|api\_key|Yes|This is the **API Key** associated with your Bulk SMS Account|
|secret|Yes|This is the **Client Secret** associated with your Bulk SMS Account|
|sender\_id|Yes|This is the **Phone Number** associated with your Bulk SMS Account.|
|targets|Yes|Optionally identify the phone numbers you wish to send your **SMS** Message to.|
|country|No|Optionally specify the `countrycode` which is either `en`, `gb`, `au` or `nz`. By default this is set to `us`|
|validity|No|Optionally define how long an unsent SMS message is valid for (and will be attempted to be resent). By default this is set to zero (0) for the maximum amount of validity. This value is defined in minutes.|
|batch|No|Optionally send notifications in a batch (vs individually). By default this is set to `No`.|
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
Send a Burst SMS Notification:
Terminal window
```
`
# Assuming our {APIKey} is bc1451bd
# Assuming our {APISecret} is gank339l7jk3cjaE
# Assuming our {FromPhoneNo} is +1-900-555-9999
# Assuming our {PhoneNo} - is in the US somewhere making our country code +1
# - identifies as 800-555-1223
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
burstsms://bc1451bd:gank339l7jk3cjaE@19005559999/18005551223
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