Join Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Join Notifications
## Overview
* **Source:** [https://joaoapps.com/join/](https://joaoapps.com/join/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 1000
* [ Build Your Apprise URL](/url-builder/?schema=join)
## Account Setup
[Section titled “Account Setup”](#account-setup)
To use this plugin:
1. Ensure your browser allows popups and visit [joinjoaomgcd.appspot.com](https://joinjoaomgcd.appspot.com/).
2. To register you just need to allow the page to link with your Google Profile. The good news is it doesn’t ask for anything too personal.
3. Download the app for your phone from the [Android Store here](https://play.google.com/store/apps/details?id=com.joaomgcd.join).
4. Using your phone, when you first open the application, it will ask for a series of permissions and ask you a couple questions.
5. If you just recently registered your device (in the previous step), you should now be able to refresh your browser at [joinjoaomgcd.appspot.com](https://joinjoaomgcd.appspot.com/). Your device should list itself. From here you can retrieve the API you need to worth with Apprise.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `join://{apikey}/`
* `join://{apikey}/{device\_id}`
* `join://{apikey}/{device\_id1}/{device\_id2}/{device\_idN}`
If no device is specified, then by default **group.all** is used.
Groups can be referenced like this (the *group.* part is optional):
* `join://{apikey}/group.{group\_id}`
* `join://{apikey}/group.{group\_id1}/group.{group\_id2}/group.{group\_idN}`
* `join://{apikey}/{group\_id}`
* `join://{apikey}/{group\_id1}/{group\_id2}/{group\_idN}`
If what you specify isn’t a `group` or `device\_id` then it is interpreted as a `device\_name` as a fallback:
* `join://{apikey}/{device\_name}`
* `join://{apikey}/{device\_name1}/{device\_name1}/{device\_nameN}`
You can freely mix and match these combinations as well:
* `join://{apikey}/{device\_id}/{group\_id}/{device\_name}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|apikey|Yes|The api key associated with your Join account.|
|device\_id|No|The device identifier to send your notification to (a 32 bit alpha-numeri string).|
|device\_name|No|The device name (PC, Nexus, etc)|
|group\_id|No|The group identifier to send your notification to.|
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
Send a Join notification to all of our configured devices:
Terminal window
```
`
# Assuming our {apikey} is abcdefghijklmnop-abcdefg
# Assume we're sending to the group: all
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
join://abcdefghijklmnop-abcdefg/group.all
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