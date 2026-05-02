Matrix Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Matrix Notifications
## Overview
* **Source:** [https://matrix.org/](https://matrix.org/)
* **Image Support:** Yes
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 65000
* [ Build Your Apprise URL](/url-builder/?schema=matrix)
## Account Setup
[Section titled “Account Setup”](#account-setup)
By default, Apprise communicates directly with your Matrix server using the official Client API.
Alternatively, you may use webhook mode instead of the Matrix Client API. Webhook usage is enabled by specifying **?mode=matrix**, **?mode=slack**, or **?mode=hookshot** depending on the webhook service you have configured.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
Using a username and password:
* `matrix://{user}:{password}@{hostname}/#{room\_alias}`
* `matrixs://{user}:{password}@{hostname}/!{room\_id}`
Using a pre-generated access token (no username or password required):
* `matrix://{token}@{hostname}/#{room\_alias}`
* `matrixs://{token}@{hostname}/!{room\_id}`
You may also supply the token as a query parameter:
* `matrixs://{hostname}/#{room\_alias}?token={token}`
### Room Alias Targets
[Section titled “Room Alias Targets”](#room-alias-targets)
Room aliases are prefixed with `#`. You may specify multiple room aliases by separating them with a forward slash:
* `matrixs://{user}:{password}@{hostname}/#{room\_alias}`
* `matrixs://{user}:{password}@{hostname}/#{room\_alias1}/#{room\_alias2}`
* `matrixs://{token}@{hostname}/#{room\_alias1}/#{room\_alias2}`
### Room ID Targets
[Section titled “Room ID Targets”](#room-id-targets)
Room IDs are prefixed with `!`. You may specify multiple room IDs in the same way:
* `matrixs://{user}:{password}@{hostname}/!{room\_id}`
* `matrixs://{user}:{password}@{hostname}/!{room\_id1}/!{room\_id2}`
* `matrixs://{token}@{hostname}/!{room\_id1}/!{room\_id2}`
### Direct Message Targets
[Section titled “Direct Message Targets”](#direct-message-targets)
To send a direct message (DM) to a Matrix user, prefix the target with `@`. You may optionally include the homeserver component on the target:
* `matrixs://{user}:{password}@{hostname}/@{target\_user}`
* `matrixs://{user}:{password}@{hostname}/@{target\_user}:{homeserver}`
* `matrixs://{token}@{hostname}/@{target\_user}`
* `matrixs://{token}@{hostname}/@{target\_user}:{homeserver}`
You may notify multiple DM users in a single URL:
* `matrixs://{user}:{password}@{hostname}/@{user1}/@{user2}`
* `matrixs://{token}@{hostname}/@{user1}/@{user2}`
Unlike room identifiers, DM user targets **always** have the authenticated homeserver appended when no explicit homeserver is provided. `@alice` is always resolved as `@alice:{home\_server}`, regardless of the `hsreq` setting. To DM a user on a different server, include the homeserver explicitly: `@alice:otherhost.com`.
### Mixing Target Types
[Section titled “Mixing Target Types”](#mixing-target-types)
Room aliases (`#`), room IDs (`!`), and DM users (`@`) can be freely mixed and matched in any order in a single URL:
* `matrixs://{user}:{password}@{hostname}/#{room\_alias}/@{target\_user}`
* `matrixs://{user}:{password}@{hostname}/#{room\_alias}/!{room\_id}/@{target\_user}`
* `matrixs://{token}@{hostname}/#{room\_alias}/!{room\_id}/@{target\_user}`
If no user and/or password is specified, the Matrix registration process may be invoked. Some Matrix servers allow automatic registration of temporary users, depending on server configuration. In most production environments you should always provide both **{user}** and **{password}**, or a pre-generated **{token}**.
## Room Identifiers and Homeserver Behaviour
[Section titled “Room Identifiers and Homeserver Behaviour”](#room-identifiers-and-homeserver-behaviour)
Matrix supports both:
* **Room aliases** (prefixed with `#`)
* **Room IDs** (prefixed with `!`)
Room identifiers may include a homeserver component (for example `:example.com`). In Matrix, room aliases are typically written with a homeserver, and room IDs are generally expected to include one as well.
Examples:
* `#general`
* `#general:example.com`
* `!abc123`
* `!abc123:example.com`
### Default Behaviour (Recommended)
[Section titled “Default Behaviour (Recommended)”](#default-behaviour-recommended)
By default, Apprise **enforces** a homeserver on room identifiers when it is missing.
If you provide:
* `#room`: it is internally interpreted as `#room:{hostname}`
* `!room`: it is internally interpreted as `!room:{hostname}`
If you explicitly include a homeserver component, Apprise honours it exactly as specified.
### Opt-out Behaviour (Compatibility Mode)
[Section titled “Opt-out Behaviour (Compatibility Mode)”](#opt-out-behaviour-compatibility-mode)
You may disable homeserver enforcement by specifying `?hsreq=no`. In this setting:
* `#room` is used exactly as provided.
* `!room` is used exactly as provided.
`hsreq` applies only to room identifiers (`#` and `!`). DM user targets (`@`) are not affected — they always have the authenticated homeserver applied when no explicit homeserver is included in the target.
This is intended for environments where a reverse proxy, non-standard server behaviour, or strict URL routing makes `:homeserver` suffixing undesirable.
If you are using room IDs (prefixed with `!`), note that many Matrix deployments expect fully-qualified room IDs. If your server rejects `!room:{hostname}` but accepts `!room` as-is, `hsreq=no` may be required.
For example; given:
```
`
matrix://user:pass@localhost/#room/!abc123
`
```
With default behaviour (`hsreq=yes`):
* `#room` becomes `#room:localhost`
* `!abc123` becomes `!abc123:localhost`
With enforcement disabled:
```
`
matrix://user:pass@localhost/#room/!abc123?hsreq=no
`
```
* `#room` is used as `#room`
* `!abc123` is used as `!abc123`
In both cases, a DM target such as `@alice` would become `@alice:localhost` regardless of `hsreq`.
## Webhook Mode
[Section titled “Webhook Mode”](#webhook-mode)
When specifying the **?mode=** argument, the plugin switches entirely to webhook behaviour and the syntax changes:
* `matrix://{user}:{token}@{hostname}?mode=matrix`
* `matrixs://{token}@{hostname}:{port}?mode=matrix`
* `matrix://{user}:{token}@{hostname}?mode=slack&format=markdown`
* `matrixs://{token}@{hostname}?mode=slack&format=markdown`
* `matrix://{user}:{token}@{hostname}?mode=hookshot`
* `matrixs://{user}:{token}@{hostname}?mode=hookshot&path=/webhook`
When using **matrix-hookshot**, the webhook path is configurable and defaults to **/webhook**:
* `matrixs://{user}:{token}@{hostname}?mode=hookshot`
* `matrixs://{user}:{token}@{hostname}?mode=hookshot&path=/public-hooks`
If you use [**t2bot.io**](https://t2bot.io/), you may use:
* `matrix://{t2bot\_webhook\_token}`
* `matrix://{user}@{t2bot\_webhook\_token}`
Or directly:
* `https://webhooks.t2bot.io/api/v1/matrix/hook/{t2bot\_webhook\_token}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|hostname|\*Yes|The Matrix server you wish to connect to.|
|t2bot\_webhook\_token|\*Yes|Used when leveraging t2bot webhook mode. Acts as hostname in this case.|
|user|No|The user to authenticate (and/or register) with the Matrix server.|
|password|No|The password to authenticate (and/or register) with the Matrix server.|
|token|No|A pre-generated Matrix access token. Use this instead of **user** and **password** when your server disables password login (for example, SSO-only deployments). May also be supplied as `?token=` in the URL. When used without a username, place the token in the user position: `matrix://{token}@{hostname}/`.|
|port|No|The server port Matrix is listening on. By default **matrixs://** uses port **443**, while **matrix://** uses port **80**.|
|room\_alias|No|The room alias to join and notify. It is recommended to prefix with **#**.|
|room\_id|No|The room ID to join and notify. You must prefix this with **!**.|
|thumbnail|No|Displays an image before each notification identifying the notification type. Default is **False**.|
|mode|No|Enables webhook mode. Valid values are **matrix**, **slack**, **t2bot**, and **hookshot**.|
|path|No|Used with **hookshot** mode to define the public webhook path. Defaults to **/webhook**. For example, if your hookshot instance is exposed at `https://hookshot.example/public-hooks/{token}`, then set `?mode=hookshot&path=/public-hooks`.|
|msgtype|No|Matrix message type: **text** or **notice**. Default is **text**.|
|version|No|Overrides the Matrix Client API version. Supported values are **2** and **3**. Default is **3**. May also be supplied as `?v=`.|
|hsreq|No|When enabled (the default), Apprise automatically appends the authenticated homeserver to room identifiers that do not already include one. For example, `#room` becomes `#room:hostname`. Set to **no** to disable this and use room identifiers exactly as provided.|
|e2ee|No|Controls end-to-end encryption using the Matrix Olm/MegOLM protocol. When enabled (the default), Apprise automatically detects whether each room has encryption configured and encrypts both messages and attachments for those that do, while sending others as plain text. When Apprise creates a new room with `e2ee=yes`, it sets `m.room.encryption` at creation time so the room is encrypted from the very first message. Requires the `cryptography` Python package and a **matrixs://** (HTTPS) connection. Not supported in webhook mode. Set to **no** to always send unencrypted and to skip E2EE room creation. Default is **yes**.|
|target\_user|No|A Matrix user ID to notify via direct message. Must be prefixed with **@**, for example **@alice** or **@alice:homeserver**. Apprise looks up (or creates) a DM room with that user automatically. Not supported in webhook mode.|
|discovery|No|When enabled (the default), Apprise performs a `.well-known/matrix/client` server-discovery lookup on first use to resolve the actual homeserver base URL. Set to **no** to skip discovery and connect directly to the specified hostname. Automatically disabled in webhook mode. Default is **yes**.|
If neither a **{room\_alias}**, **{room\_id}**, nor a **{target\_user}** is specified, Apprise will query the server for currently joined rooms and notify all of them.
When sending to a **{target\_user}**, Apprise looks up an existing DM room via `m.direct` account data, or creates one if none exists. If the target user later leaves that room, Apprise will continue sending to it (the messages are accepted by the server but the user will not see them). There is no automatic re-invite. To recover, the target user should rejoin, or you should clear Apprise persistent storage so that a new DM room is created on the next send.
E2EE requires both a **matrixs://** (HTTPS) URL and the `cryptography` Python package (`pip install cryptography`). On plain **matrix://** (HTTP) connections E2EE is silently skipped and messages are sent unencrypted, regardless of the `e2ee` setting.
Apprise caches E2EE session keys and room encryption state in its persistent storage to avoid redundant network round-trips. If a room’s encryption configuration changes after the first send (for example, encryption is enabled on a previously unencrypted room), Apprise will continue to use the cached state until the storage is reset. To force a fresh key exchange and room state lookup, clear the Apprise persistent storage for this plugin instance.
When `e2ee=yes` (the default) and Apprise creates a new room — because a room alias does not yet exist or a new DM room is needed — Apprise creates that room **with** the `m.room.encryption` state event set to `m.megolm.v1.aes-sha2`.
* Encryption is **irreversible** once set on a room; Apprise encrypts new rooms up front so every message, including the very first, is protected.
* Clients that do not support E2EE (older or non-standard clients) can still **join** the room, but they will not be able to read encrypted messages.
* If you need a room that non-E2EE clients can read, either pre-create the room in your Matrix client (without enabling encryption) before pointing Apprise at it, or use `e2ee=no` in your Apprise URL.
For rooms Apprise did **not** create, it checks the `m.room.encryption` state on every send and automatically encrypts messages for rooms that already have it set, regardless of how the room was originally created. Rooms that have no encryption state are always sent as plain text, even when `e2ee=yes`.
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
Send a secure Matrix notification using a username and password:
Terminal window
```
`
# Assuming {hostname} is matrix.example.com
# Assuming {user} is nuxref
# Assuming {password} is abc123
# Notify #general and #apprise
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
matrixs://nuxref:abc123@matrix.example.com/#general/#apprise
`
```
Send a notification using a pre-generated access token (useful when
password login is disabled on the server):
Terminal window
```
`
# Assuming {hostname} is matrix.example.com
# Assuming {token} is syt\_abc123...
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"matrixs://syt\_abc123@matrix.example.com/#general"
`
```
Disable homeserver enforcement:
Terminal window
```
`
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
matrixs://nuxref:abc123@matrix.example.com/!abc123?hsreq=no
`
```
Use API v2 (required for attachments in some deployments):
Terminal window
```
`
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
matrixs://nuxref:abc123@matrix.example.com/#general?v=2
`
```
E2EE is enabled by default when the `cryptography` package is installed and the room supports it. To explicitly disable E2EE (always send unencrypted):
Terminal window
```
`
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"matrixs://nuxref:abc123@matrix.example.com/#general?e2ee=no"
`
```
Send a direct message to a Matrix user:
Terminal window
```
`
# Assuming {hostname} is matrix.example.com
# Assuming {user} is nuxref, {password} is abc123
# DM @bob on the same homeserver
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
matrixs://nuxref:abc123@matrix.example.com/@bob
`
```
Send a direct message using a pre-generated access token:
Terminal window
```
`
# Assuming {hostname} is matrix.example.com
# Assuming {token} is syt\_abc123...
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"matrixs://syt\_abc123@matrix.example.com/@bob"
`
```
Send a **t2bot.io** webhook request:
Terminal window
```
`
# Assuming {webhook} is ABCDEFG12345
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
matrix://ABCDEFG12345
`
```
Send a **matrix-hookshot** webhook request:
Terminal window
```
`
# Assuming {hostname} is hookshot.example.com
# Assuming {token} is ABCDEFG12345
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"matrixs://apprise:ABCDEFG12345@hookshot.example.com?mode=hookshot"
`
```
If your hookshot instance is exposed behind a custom public webhook path:
Terminal window
```
`
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"matrixs://apprise:ABCDEFG12345@hookshot.example.com?mode=hookshot&path=/public-hooks"
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