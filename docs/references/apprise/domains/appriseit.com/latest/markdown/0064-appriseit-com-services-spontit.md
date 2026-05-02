Spontit Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Spontit Notifications
## Service End Reason
[Section titled “Service End Reason”](#service-end-reason)
Unknown
💡The Service was removed from Apprise in [apprise/1226](https://github.com/caronc/apprise/issues/1226)
## Overview
* **Source:** [https://spontit.com](https://spontit.com)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 5000
* [ Build Your Apprise URL](/url-builder/?schema=spontit)
## Account Setup
[Section titled “Account Setup”](#account-setup)
1. Visit [https://spontit.com](https://spontit.com) to create your account.
2. To acquire your `{user}`: Visit your profile at [https://spontit.com/profile](https://spontit.com/profile) and take note of your User ID here. It will look something like: `user12345678901`
3. To acquire your `{apikey}`: Generate an API key at [https://spontit.com/secret\_keys](https://spontit.com/secret_keys) (if you haven’t already done so).
## Syntax
[Section titled “Syntax”](#syntax)
Channels are optional; if no channel is specified then you are just personally notified.
Valid syntax is as follows:
* `spontit://{user}@{apikey}`
* `spontit://{user}@{apikey}/{channel\_id}`
* `spontit://{user}@{apikey}/{channel\_id1}/{channel\_id2}/{channel\_idN}/`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|user|Yes|This is the User ID associated with your Spontit account. It can be found on your [Spontit Profile page](https://spontit.com/profile).|
|apikey|Yes|This is the API key you generated for your Spontit account. It can be found (and generated if it doesn’t already exist) [here](https://spontit.com/secret_keys).|
|channel\_id|No|A Channel you wish to notify *that you created*.|
|subtitle|No|The subtitle of your push. Only appears on iOS devices.|
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
Send a Spontit notification to all devices associated with a project:
Terminal window
```
`
# Assume:
# - our {user} is user28635710302
# - our {apikey} is a6k4ABnck26hDh8AA3EDHoOVdDEUlw3nty
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
spontit://user28635710302@a6k4ABnck26hDh8AA3EDHoOVdDEUlw3nty
# Override the subtitle (Mac users only) by doing the following:
# You must use URL encoded strings, below the spaces are swapped with %20
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
spontit://myuser@myapi?subtitle=A%20Different%20Subtitle
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