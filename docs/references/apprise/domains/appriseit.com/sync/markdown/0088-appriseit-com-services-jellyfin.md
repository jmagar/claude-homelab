Jellyfin Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Jellyfin Notifications
## Overview
* **Source:** [https://jellyfin.org](https://jellyfin.org)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=jellyfin)
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `jellyfin://{hostname}`
* `jellyfin://{hostname}:{port}`
* `jellyfin://{userid}:{password}@{hostname}`
* `jellyfin://{userid}:{password}@{hostname}:{port}`
* `jellyfins://{hostname}`
* `jellyfins://{hostname}:{port}`
* `jellyfins://{userid}:{password}@{hostname}`
* `jellyfins://{userid}:{password}@{hostname}:{port}`
Secure connections (via https) should be referenced using **jellyfins://**, whereas insecure connections (via http) should be referenced via **jellyfin://**.
## Emby Compatibility
[Section titled “Emby Compatibility”](#emby-compatibility)
Jellyfin is a fork of Emby, and Apprise treats Jellyfin as an Emby-compatible notification target.
If you also run Emby, you can use the **Emby** schema in the same way:
* `emby://...`
* `embys://...`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|hostname|Yes|The server Jellyfin is listening on.|
|port|No|The port the server is listening on. By default the port is **8096** for both **jellyfin://** and **jellyfins://** references.|
|userid|Yes|The account login to your Jellyfin server.|
|password|No|The password associated with your Jellyfin server.|
|modal|No|Defines if the notification should appear as a modal type box. By default this is set to No.|
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
Send a notification to a server listening on the default port (8096):
Terminal window
```
`
# Assuming our {hostname} is media.server.local
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"jellyfin://user:password@media.server.local"
`
```
Send a notification to a server listening on a non-default port:
Terminal window
```
`
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"jellyfin://user:password@media.server.local:8097"
`
```
Send a secure (https) notification:
Terminal window
```
`
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"jellyfins://user:password@media.server.local"
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