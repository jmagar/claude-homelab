APRS Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# APRS Notifications
## Overview
* **Source:** [http://www.aprs.org/](http://www.aprs.org/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 67
* [ Build Your Apprise URL](/url-builder/?schema=aprs)
## Account Setup
[Section titled “Account Setup”](#account-setup)
* You need to be a licensed Ham Radio Operator in order to use this plugin.
* Bring your own APRS-IS passcode. If you don’t know what this is or how to get one, then this plugin is not for you.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `aprs://{userid}:{password}@{callsign}`
* `aprs://{userid}:{password}@{callsign}?locale={locale\_code}`
* `aprs://{userid}:{password}@{callsign1}/{callsign2}/{callsignN}`
* `aprs://{userid}:{password}@{callsign1}/{callsign2}/{callsignN}?locale={locale\_code}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|userid|Yes|Your APRS call sign. This is the call sign that will send the message.|
|password|Yes|Numeric APRS passcode, corresponding to `userid`. Read-only access to APRS-IS (`passcode == -1`) is not supported.|
|callsign|Yes|One or more Amateur Radio target call sign(s) is/are required to send a notification.|
|delay|No|Messages are already sent with a `0.8` (second) throttle to accomodate multiple messages. However there are certain cases where you may wish to extend this value further. Any value provided to the `delay` parameter is added to the `0.8s` value already defined. The minimum (and default value) for this variable is `0.0`. You can however specified a value up to `5.0` (defined in seconds). Integer values are also accepted (hence setting this to `2`, or `4` is perfectly acceptable).|
|locale|No|Your nearest APRS-IS T2 server locale, see [https://www.aprs2.net](https://www.aprs2.net). Valid values: `NOAM`, `SOAM`, `EURO`, `AUNZ`, `ASIA`. Alternatively, select `ROTA` for `rotate.aprs2.net` in case you do not want to target a specific APRS server locale. Default is `EURO`. Only specify the locale’s short code; the plugin will then map the actual server URL respectively.|
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
## Constraints
[Section titled “Constraints”](#constraints)
* APRS control characters (`{}|\~`, [see APRS101.pdf chapter 14 pg. 71](http://www.aprs.org/doc/APRS101.PDF)) will be removed from the message body if present.
* If your message exceeds 67 characters, the plugin will automatically truncate the content to APRS’s maximum message length
* For messages, it is recommended to stick to the English alphabet as APRS is limited to ASCII 7-bit. The plugin will try to “translate” any UTF-8 message to plain ASCII with the help of the [unidecode](https://pypi.org/project/Unidecode/) module - but there will be no guarantee that the output is going to be usable.
* This plugin DOES honor call sign SSID’s, meaning that e.g. targets DF1JSL-1 and DF1JSL-9 are NOT identical and will result in two APRS messages.
* All messages generated by this plugin are going to lack an APRS message ID ([see APRS101.pdf chapter 14 pg. 71](http://www.aprs.org/doc/APRS101.PDF)). As the plugin’s communication with APRS-IS is unidirectional, Apprise will be unable to honor any APRS ack/rej responses sent by the target call sign (aka the target ham radio device).
* APRS Bulletins ([see APRS101.pdf chapter 14 pg. 73](http://www.aprs.org/doc/APRS101.PDF)) are not supported.
* With great (ham radio) power comes great responsibility; do not use this plugin for spamming other ham radio operators. Everything that you send to the APRS-IS server will get broadcasted via the APRS / Ham Radio network.
* In order to gain access to APRS-IS, you need to be a licensed ham radio operator.
* The plugin uses its own APRS device identifier (`APPRIS`; see [https://github.com/aprsorg/aprs-deviceid](https://github.com/aprsorg/aprs-deviceid) for details). This identifier is unique to each software/device that is allowed to communicate with the APRS network and **must not get modified** in any way UNLESS you clone this plugin and use its code outside of Apprise - in this case, please request your very own device identifier.
* Additional (technical) constraints: see plugin’s header section. Usually, you should not be required to change these settings.
## Examples
[Section titled “Examples”](#examples)
Send an APRS Notification:
Terminal window
```
`
# Assuming our {userid} is df1jsl-15
# Assuming our {password} is 12345
# Assuming our {callsign} - df1jsl-9
# {locale} is not set; using 'euro.aprs2.net' as target server default
#
apprise -vv -b "Test Message Body" \\
"aprs://df1jsl-15:12345@df1jsl-9"
# Assuming our {userid} is df1jsl-15
# Assuming our {password} is 12345
# Assuming our {callsign}s are - df1jsl-9,df1jsl-8 and df1jsl-7
# {locale} is not set; using 'euro.aprs2.net' as target server default
#
# This will result in three target call signs as the plugin
# is going to honor the call sign's SSID information
#
apprise -vv -b "Test Message Body" \\
aprs://df1jsl-15:12345@df1jsl-9/df1jsl-8/df1jsl-7
# Assuming our {userid} is df1jsl-15
# Assuming our {password} is 12345
# Assuming our {callsign} - df1jsl-9
# Assuming our {locale} is NOAM --\> maps server URL to 'noam.aprs2.net', see https://www.aprs2.net/
apprise -vv -b "Test Message Body" \\
"aprs://df1jsl-15:12345@df1jsl-9?locale=NOAM"
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