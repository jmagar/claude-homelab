Dot. Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Dot. Notifications
## Overview
* **Source:** [https://dot.mindreset.tech](https://dot.mindreset.tech)
* **Image Support:** No
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=dot)
## Account Setup
[Section titled “Account Setup”](#account-setup)
1. Open the Dot. mobile app and retrieve both your **API token** (`dot\_app\_...`) and device **serial number** (12-character hex string).
2. In the app, enable the **Text API** and/or **Image API** content slot for the device.
3. Use the token and device ID with the `dot://` URLs shown below to trigger notifications.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `dot://{token}@{device\_id}/`
* `dot://{token}@{device\_id}/?mode=image`
The default mode is **text**. In text mode, body and title are sent to the Text API, and any attachment or `image=` parameter is sent to the Image API. When both are present, text is dispatched first, then image.
Old-style URLs with `/text/` or `/image/` in the path continue to work for backward compatibility but are no longer generated.
## Mode Behavior
[Section titled “Mode Behavior”](#mode-behavior)
|Mode|Behavior|
|`text` (default)|Body and title go to the Text API. Any attachment or `image=` parameter also goes to the Image API. When both are present, text is sent first, then image.|
|`image`|Only the Image API is called. Body and title are ignored. Requires `image=` or an attachment.|
## Attachment Support
[Section titled “Attachment Support”](#attachment-support)
* **Text mode** (default): The attachment is sent as a full-screen image (296×152 PNG) to the Image API. If body or title are also present, text is sent first. The `icon=` URL parameter can still be used independently to set the 40×40 corner icon in the text card.
* **Image mode**: The first attachment is used as the full-screen image (296×152 PNG) if no `image=` is supplied in the URL.
* In all modes, only the first attachment is used; extra attachments trigger a warning.
* If `image=` is already supplied via URL, attachments are ignored.
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|token|\*Yes|Dot. API token (`dot\_app\_...`)|
|device\_id|\*Yes|Dot. device serial number (12 hex characters)|
|mode|No|`text` (default) or `image`. Controls which API endpoint is used. In `text` mode, both APIs may be called in a single send.|
|refresh|No|Set to `no` to defer display until the next scheduled refresh (default: `yes`)|
|title|No (text)|Title shown on device|
|message|No (text)|Body text shown on device|
|signature|No (text)|Footer text shown on device|
|icon|No (text)|Base64 PNG icon (40×40) for the lower-left corner of the text card.|
|image|Yes (image)|Base64 PNG image (296×152) rendered full-screen. Can be provided via URL parameter or first attachment (auto-converted to base64).|
|link|No|Tap-to-interact target (http/https or custom scheme)|
|border|No (image)|`0`=white frame (default), `1`=black frame|
|dither\_type|No (image)|`DIFFUSION` (default), `ORDERED`, or `NONE`|
|dither\_kernel|No (image)|`FLOYD\_STEINBERG` (default), `THRESHOLD`, `ATKINSON`, `BURKES`, `SIERRA2`, `STUCKI`, `JARVIS\_JUDICE\_NINKE`, `DIFFUSION\_ROW`, `DIFFUSION\_COLUMN`, `DIFFUSION\_2D`|
|task\_key|No|Specify which content slot to update when multiple Text or Image API contents exist on a device|
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
**Send a text reminder:**
Terminal window
```
`
apprise -vv -t "Morning Routine" -b "Remember to water the plants" \\
"dot://dot\_app\_TOKEN@A1B2C3D4E5F6/?signature=Apprise"
`
```
**Send text and image together (text first, then image):**
Terminal window
```
`
apprise -vv -t "Morning Routine" -b "Remember to water the plants" \\
-a /path/to/image.png \\
"dot://dot\_app\_TOKEN@A1B2C3D4E5F6/"
`
```
**Update a specific content slot using task\_key:**
Terminal window
```
`
apprise -vv -t "Server Status" -b "All systems operational" \\
"dot://dot\_app\_TOKEN@A1B2C3D4E5F6/?task\_key=status\_monitor"
`
```
**Push an image card (via URL parameter):**
Terminal window
```
`
apprise -vv \\
"dot://dot\_app\_TOKEN@A1B2C3D4E5F6/?mode=image&image=$(base64 -w0 poster.png)&link=https://example.com"
`
```
**Push an image card via attachment:**
Terminal window
```
`
apprise -vv -a /path/to/image.png \\
"dot://dot\_app\_TOKEN@A1B2C3D4E5F6/?mode=image&link=https://example.com"
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