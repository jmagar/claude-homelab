Enigma2 Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Enigma2 Notifications
## Overview
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 1000
* [ Build Your Apprise URL](/url-builder/?schema=enigma2)
## Account Setup
[Section titled “Account Setup”](#account-setup)
A [*E2OpenPlugin*](https://github.com/E2OpenPlugins) called [OpenWebif](https://github.com/E2OpenPlugins/e2openplugin-OpenWebif) can allow you to communicate with your Enigma2 devices (such as [Dreambox](http://www.dream-multimedia-tv.de/), [Vu+](http://www.vuplus.com), etc.) using a API.
Once [OpenWebif](https://github.com/E2OpenPlugins/e2openplugin-OpenWebif) is installed, Apprise can utilize its API to send notifications to your Enigma2 device.
Installation instructions on how to install OpenWebif onto your Enigma2 device can be found on its [GitHub Page](https://github.com/E2OpenPlugins/e2openplugin-OpenWebif).
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `enigma2://{host}`
* `enigma2://{host}/{fullpath}`
* `enigma2://{host}:{port}`
* `enigma2://{host}:{port}/{fullpath}`
* `enigma2://{user}@{host}`
* `enigma2://{user}@{host}/{fullpath}`
* `enigma2://{user}@{host}:{port}`
* `enigma2://{user}@{host}:{port}/{fullpath}`
* `enigma2://{user}:{password}@{host}`
* `enigma2://{user}:{password}@{host}/{fullpath}`
* `enigma2://{user}:{password}@{host}:{port}`
* `enigma2://{user}:{password}@{host}:{port}/{fullpath}`
* `enigma2s://{host}`
* `enigma2s://{host}/{fullpath}`
* `enigma2s://{host}:{port}`
* `enigma2s://{host}:{port}/{fullpath}`
* `enigma2s://{user}@{host}`
* `enigma2s://{user}@{host}/{fullpath}`
* `enigma2s://{user}@{host}:{port}`
* `enigma2s://{user}@{host}:{port}/{fullpath}`
* `enigma2s://{user}:{password}@{host}`
* `enigma2s://{user}:{password}@{host}/{fullpath}`
* `enigma2s://{user}:{password}@{host}:{port}`
* `enigma2s://{user}:{password}@{host}:{port}/{fullpath}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|hostname|Yes|The Enigma2 devices IP/hostname|
|port|No|The port our Web server is listening on. By default the port is **80** for **enigma2://** and **443** for all **enigma2s://** references.|
|user|No|If you’re system is set up to use HTTP-AUTH, you can provide *username* for authentication to it.|
|password|No|If you’re system is set up to use HTTP-AUTH, you can provide *password* for authentication to it.|
|timeout|No|The number of seconds delivered notification stay on the screen for. The default value is 13.|
|fullpath|No|Those hosting this internally may wish to specify the (prefix) path their service is listening on.|
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
Send an notification to our Enigma2 Device:
Terminal window
```
`
# Assuming our {hostname} is dreambox
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
enigma2://dreambox
# Hosting your service at /enigma2, the following can be handle this:
# Assuming our {hostname} is dreambox
# Assuming our {fullpath} is /enigma2
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"enigma2://dreambox/enigma2"
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
# Assuming our {hostname} is vu-device
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"enigma2://localhost/?-X-Token=abcdefg"
# Multiple headers just require more entries defined with a hyphen in front:
# Below would set the headers:
# X-Token: abcdefg
# X-Apprise: is great
#
# Assuming our {hostname} is localhost
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"enigma2://localhost/path/?-X-Token=abcdefg&-X-Apprise=is%20great"
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