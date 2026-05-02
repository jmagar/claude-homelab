IRC Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# IRC Notifications
## Overview
* **Source:** [https://ircv3.net/](https://ircv3.net/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 380
* [ Build Your Apprise URL](/url-builder/?schema=irc)
## Account Setup
[Section titled “Account Setup”](#account-setup)
IRC does not require a formal account setup in Apprise. You only need access to an IRC server, or access to a ZNC bouncer if you plan to use bouncer mode.
If your IRC network requires NickServ authentication, make sure you have registered your nickname and have your NickServ password ready.
If you are using ZNC, ensure your bouncer is reachable and your ZNC username and password are correct.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `irc://{host}/{target}`
* `ircs://{host}/{target}`
Targets are defined in the URL path as one or more entries:
* Channels use `#` prefix: `#channel`
* Users use `@` prefix: `@nickname`
You can provide multiple targets by separating them with `/`:
* `ircs://irc.example.net/#alerts/@bob/@alice`
### Channel Keys
[Section titled “Channel Keys”](#channel-keys)
If a channel is protected by a key, append it after the channel name using `:`:
* `ircs://irc.example.net/#private:channel-key`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|host|Yes|IRC server hostname or IP address.|
|port|No|IRC server port. Defaults to 6667 for `irc://` and 6697 for `ircs://`.|
|user|No|Username used for authentication. Meaning depends on `mode`.|
|password|No|Password used for authentication. Meaning depends on `mode`.|
|target|No|One or more recipients (channels and/or users) provided in the URL path.|
|to|No|Alias of `targets`. Allows defining recipients in the query string instead of the path.|
|nick|No|Nickname used when registering to the server. If not specified, the nick defaults to `user` when provided.|
|name|No|Real name (GECOS) used during registration.|
|mode|No|Authentication mode, one of: `server`, `nickserv`, `znc`. Default is `server`.|
|join|No|Controls whether Apprise joins channels before sending. Default is `yes`.
Channels that have a password associated with them (provided as `#channel:key` here) can not post the message without first joining the channel. Thus if this `join=no`, it will not apply to channels with assigned passwords, but will apply to everything else. This setting has no value if you are only messaging users.|
### Mode Notes
[Section titled “Mode Notes”](#mode-notes)
* `mode=server`: Optional `password` is sent as a server PASS during registration when provided.
* `mode=nickserv`: Uses NickServ identify flow after connecting, then sends notifications.
* `mode=znc`: Authenticates to the ZNC bouncer. The PASS line is built as `user:password` for compatibility with common ZNC configurations. A PING/PONG liveness check is performed prior to sending notifications.
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
Send a message to a channel over TLS:
Terminal window
```
`
apprise -vv -t "Title" -b "Message body" \\
"ircs://irc.example.net/#alerts"
`
```
Send to multiple targets:
Terminal window
```
`
apprise -vv -t "Title" -b "Message body" \\
"ircs://irc.example.net/#alerts/@bob/@alice"
`
```
Send to a password protected channel:
Terminal window
```
`
apprise -vv -t "Title" -b "Message body" \\
"ircs://irc.example.net/#private:channel-key"
`
```
NickServ mode example:
Terminal window
```
`
apprise -vv -t "Title" -b "Message body" \\
"ircs://user:pass@irc.example.net/#alerts?mode=nickserv&nick=MyNick"
`
```
ZNC bouncer mode example:
Terminal window
```
`
apprise -vv -t "Title" -b "Message body" \\
"ircs://zncuser:zncpass@znc.example.net/#alerts?mode=znc&nick=MyNick"
`
```
ZNC mode, multiple targets:
Terminal window
```
`
apprise -vv -t "Title" -b "Message body" \\
"ircs://zncuser:zncpass@znc.example.net/#alerts/@bob?mode=znc&nick=MyNick"
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