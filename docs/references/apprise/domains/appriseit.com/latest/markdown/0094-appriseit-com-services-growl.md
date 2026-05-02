Growl Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Growl Notifications
## Overview
* **Source:** [http://growl.info/](http://growl.info/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=growl)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Growl requires this script to pre-register the notifications it sends before being able to actually send something. Make sure you are configured to allow application registration!
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `growl://{hostname}`
* `growl://{hostname}:{port}`
* `growl://{password}@{hostname}`
* `growl://{password}@{hostname}:{port}`
* `growl://{hostname}/?priority={priority}`
Depending on the version of your Apple OS, you may wish to enable the legacy protocol version (v1.4) as follows if you have problems receiving the icon in version 2 (the default):
* `growl://{password}@{hostname}?version=1`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|hostname|Yes|The server Growl server is listening on.|
|port|No|The port Growl Server is listening on. By default the port is **23053**. You will probably never have to change this.|
|password|No|The password associated with the Growl server if you set one up.|
|version|No|The default version is 2, but you can specify the attribute ?version=1 if you would require the 1.4 version of the protocol.|
|priority|No|Can be **low**, **moderate**, **normal**, **high**, or **emergency**; the default is **normal** if a priority isn’t specified.|
|image|No|Whether or not to include an icon/image along with your message. By default this is set to **yes**.|
|sticky|No|The Gotify sticky flag; by default this is set to **no**.|
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
Send a Growl notification to our server
Terminal window
```
`
# Assuming our {hostname} is growl.server.local
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
growl://growl.server.local
`
```
Some versions of Growl don’t display the image/icon correctly, you can also try the following to see if this solves it for you:
Terminal window
```
`
# Send a Growl notification using a a raw binary image (instead of URL - internally)
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
growl://growl.server.local?version=1
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