Blink(1) USB LED Notification Light | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Blink(1) USB LED Notification Light
## Overview
* **Source:** [https://blink1.thingm.com/](https://blink1.thingm.com/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=blink1)
## Account Setup
[Section titled “Account Setup”](#account-setup)
[Blink(1)](https://blink1.thingm.com/) is a small USB RGB LED notification
light made by ThingM. Plug it into any USB port and Apprise can flash it
in a color that reflects the notification type:
|Notification Type|Color|
|Info|Blue|
|Success|Green|
|Warning|Yellow|
|Failure|Red|
The plugin talks to the device directly over USB HID using the
[hidapi](https://pypi.org/project/hidapi/) Python package. There is no
cloud service, no API key, and no network connection required.
Install the `hidapi` package before using this plugin:
Terminal window
```
`
pip install hidapi
`
```
## Syntax
[Section titled “Syntax”](#syntax)
```
`
blink1://
blink1://{serial}/
blink1://{serial}/?duration={ms}&fade={ms}&ledn={n}
`
```
Use `blink1://` (or `blink1://\_/`) to target the first connected device.
Supply the device serial number in the host position to address a specific
unit when more than one Blink(1) is attached.
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|serial|No|USB serial number of the target device. Omit (or use `\_`) to use the first available device.|
|duration|No|How long in milliseconds to hold the notification color before switching the LED off. Default: `5000`. Range: `0`-`300000`.|
|fade|No|Fade transition time in milliseconds. `0` = instant. Default: `0`. Range: `0`-`10000`.|
|ledn|No|Which LED to address: `0` = all (default), `1` = first LED only, `2` = second LED only (mk2 devices).|
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
Flash the first connected Blink(1) with all defaults (blue, instant, 5 s):
Terminal window
```
`
apprise -vv -t "Deploy finished" -b "All checks passed." \\
blink1://
`
```
Address a specific device and use a 250 ms fade with a 2-second hold:
Terminal window
```
`
apprise -vv -n warning -b "Disk almost full." \\
"blink1://ABCD1234/?fade=250&duration=2000"
`
```
Light only the second LED on a mk2 device:
Terminal window
```
`
apprise -vv -n failure -b "Build failed." \\
"blink1://?ledn=2"
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