Nextcloud Talk Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Nextcloud Talk Notifications
## Overview
* **Source:** [https://nextcloud.com/talk](https://nextcloud.com/talk)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 32000
* [ Build Your Apprise URL](/url-builder/?schema=nctalk)
## Account Setup
[Section titled “Account Setup”](#account-setup)
The official [Nextcloud Talk app](https://github.com/nextcloud/spreed) will need to be installed. An ‘app password’ (also referred to as ‘device-specific’ password/token) of one member of the chat will need to be created, see the [documentation](https://docs.nextcloud.com/server/stable/user_manual/session_management.html#managing-devices) for more information. Don’t forget to disable file system access for this password.
## Syntax
[Section titled “Syntax”](#syntax)
Secure connections (via https) should be referenced using **nctalks://** where as insecure connections (via http) should be referenced via **nctalk://**.
Valid syntax is as follows:
* `nctalk://{user}:{password}@{hostname}/{room\_id}`
* `nctalk://{user}:{password}@{hostname}:{port}/{room\_id}`
* `nctalks://{user}:{password}@{hostname}/{room\_id}`
* `nctalks://{user}:{password}@{hostname}:{port}/{room\_id}`
You can post in multiple chats by simply chaining them at the end of the URL.
* `nctalk://{user}:{password}@{hostname}:{port}/{room\_id1}/{room\_id2}/{room\_id3}`
* `nctalks://{user}:{password}@{hostname}:{port}/{room\_id1}/{room\_id2}/{room\_id3}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|hostname|Yes|The hostname of the server hosting your Nextcloud service.|
|user|Yes|The user of the nextcloud service you have set up.|
|password|Yes|The password associated with the **user** for your Nextcloud account.|
|room\_id|Yes|The room\_id of Nextcloud Talk.|
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
Send a secure nextcloud talk message to the room *93nfkdn3*:
Terminal window
```
`
# Assuming our {host} is localhost
# Assuming our {user} is user1
# Assuming our (user1) {password} is 12345-67890-12345-67890-12345:
apprise nctalks://user1:12345-67890-12345-67890-12345@localhost/93nfkdn3
`
```
### Header Manipulation
[Section titled “Header Manipulation”](#header-manipulation)
Some users may require special HTTP headers to be present when they post their data to their server. This can be accomplished by just sticking a hyphen (**-**) in front of any parameter you specify on your URL string.
Terminal window
```
`
# Below would set the header:
# X-Token: abcdefg
#
# We want to send an insecure connection (we'll use ncloud://)
# Assuming our {host} is localhost
# Assuming our {user} is user1
# Assuming our (user1) {password} is 12345-67890-12345-67890-12345
# We want to notify Room \_93nfkdn3\_:
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
nctalks://user1:12345-67890-12345-67890-12345@localhost/93nfkdn3?-X-Token=abcdefg
# Multiple headers just require more entries defined with a hyphen in front:
# Below would set the headers:
# X-Token: abcdefg
# X-Apprise: is great
#
# Assuming our {host} is localhost
# Assuming our {user} is user1
# Assuming our (user1) {password} is 12345-67890-12345-67890-12345
# We want to notify Room \_93nfkdn3\_:
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
nctalks://user1:12345-67890-12345-67890-12345@localhost/arnold?-X-Token=abcdefg&-X-Apprise=is%20great
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