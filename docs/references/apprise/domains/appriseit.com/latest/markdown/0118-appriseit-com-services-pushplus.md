Pushplus Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Pushplus Notifications
## Overview
* **Source:** [https://www.pushplus.plus/](https://www.pushplus.plus/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 20000
* [ Build Your Apprise URL](/url-builder/?schema=pushplus)
## Account Setup
[Section titled “Account Setup”](#account-setup)
PushPlus is a Chinese notification platform that delivers messages via WeChat and several other channels (email, SMS, WeCom, webhook). It uses a personal token to authenticate requests.
1. Register or sign in at [PushPlus](https://www.pushplus.plus/).
2. Copy the **Token** shown on your dashboard under the “Push” section.
3. Optionally install the PushPlus mini-program in WeChat to receive messages on your phone.
Your notification URL for the simplest use case is:
```
`
pushplus://{token}
`
```
### Group (Topic) Sending
[Section titled “Group (Topic) Sending”](#group-topic-sending)
PushPlus also supports sending a single notification to everyone subscribed to a named group.
1. Open the **Group Push** section of the PushPlus console.
2. Create a group and note its **group code** — this is the topic value.
3. Subscribers join the group inside WeChat; when you send to the topic all members receive the message.
Place one or more group codes directly in the URL path:
```
`
pushplus://{token}/{topic}
pushplus://{token}/{topic1}/{topic2}
`
```
When multiple topics are listed Apprise sends the notification to each group in a separate API call.
### Delivery Channels
[Section titled “Delivery Channels”](#delivery-channels)
By default notifications arrive via WeChat. You can redirect them to a different channel using the `?channel=` (or its synonym `?mode=`) query parameter:
|`?channel=` value|Channel|
|`wechat`|WeChat (default — may be omitted)|
|`webhook`|Configured webhook endpoint|
|`cp`|WeCom (WeChat Work / Enterprise WeChat)|
|`wecom`|Friendly alias for `cp` — same channel|
|`mail`|Email address on file|
|`sms`|SMS|
```
`
pushplus://{token}?channel=mail
pushplus://{token}/{topic}?channel=cp
`
```
`channel=` and `mode=` are fully interchangeable; use whichever reads more naturally in your configuration.
#### Schema Alias
[Section titled “Schema Alias”](#schema-alias)
Apprise also accepts `wecom://` as a schema prefix for WeCom users. It automatically sets the delivery channel to `cp` — no extra query parameter needed:
|Schema|Equivalent to|
|`wecom://{token}`|`pushplus://{token}?channel=cp`|
#### Named Webhook Endpoint
[Section titled “Named Webhook Endpoint”](#named-webhook-endpoint)
When using `?channel=webhook` you can also target a specific named endpoint. Two equivalent forms are accepted:
```
`
pushplus://{token}?channel=webhook&name={webhook\_name}
pushplus://{webhook\_name}@{token}
`
```
In the second form (`schema://{name}@{token}`) the webhook channel is implied — you do not need to add `?channel=webhook` explicitly. An explicit `?channel=` always overrides the implication if you need a different channel alongside a user@ name.
### Message Rendering
[Section titled “Message Rendering”](#message-rendering)
The message body is rendered by PushPlus on their servers using a template that matches the standard Apprise format parameter:
|Apprise `?format=`|PushPlus renders as|
|`html` (default)|HTML — bold, links, and images work|
|`markdown`|Markdown — headings, bold, lists, etc.|
|`text`|Plain text — no formatting|
There is no separate PushPlus-specific parameter; set `?format=markdown` (or the equivalent in your YAML/config) the same way you would for any other Apprise service.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `https://www.pushplus.plus/send?token={token}`
* `pushplus://{token}`
* `pushplus://{token}/{topic}`
* `pushplus://{token}/{topic1}/{topic2}`
* `pushplus://{token}?channel={channel}`
* `pushplus://{token}/{topic}?channel={channel}`
* `pushplus://{token}?channel=webhook&name={webhook\_name}`
* `pushplus://{webhook\_name}@{token}`
* `wecom://{token}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|token|\*Yes|Your personal PushPlus token from the dashboard. May also be supplied as `?token=`.|
|topic|No|Group code placed in the URL path. Multiple topics may appear; one API call is made per topic. May also be supplied as `?topic=` or `?to=`.|
|channel|No|Delivery channel. One of `wechat` (default), `webhook`, `cp`, `wecom`, `mail`, `sms`. Supplied as `?channel=` or its alias `?mode=`.|
|name|No|Webhook endpoint name. Only used when `?channel=webhook`. Supplied as `?name=` or as the user@ component: `pushplus://{name}@{token}` (implies `channel=webhook`).|
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
## See Also
[Section titled “See Also”](#see-also)
If you need to post to a WeCom Group Bot directly — without going through PushPlus — see the [WeCom Bot](../wecombot/) plugin (`wecombot://`). It uses the WeCom Group Bot webhook API and requires a bot key, not a PushPlus token.
## Examples
[Section titled “Examples”](#examples)
Send a simple personal notification:
Terminal window
```
`
apprise -vv -t "Title" -b "Hello from Apprise" \\
pushplus://abc123def456ghi789jkl012mno345pq
`
```
Send a Markdown-formatted message:
Terminal window
```
`
apprise -vv -t "Alert" -b "## Warning\\n\\nSomething happened." \\
"pushplus://abc123def456ghi789jkl012mno345pq?format=markdown"
`
```
Send to a group (topic):
Terminal window
```
`
apprise -vv -t "Team Alert" -b "Deployment complete." \\
pushplus://abc123def456ghi789jkl012mno345pq/myteamgroup
`
```
Send to two groups at once (one API call per group):
Terminal window
```
`
apprise -vv -t "Broadcast" -b "System maintenance in 30 minutes." \\
pushplus://abc123def456ghi789jkl012mno345pq/ops-team/dev-team
`
```
Deliver via email:
Terminal window
```
`
apprise -vv -t "Title" -b "Email body" \\
"pushplus://abc123def456ghi789jkl012mno345pq?channel=mail"
`
```
Send to a group and deliver via email:
Terminal window
```
`
apprise -vv -t "Title" -b "Group email" \\
"pushplus://abc123def456ghi789jkl012mno345pq/myteamgroup?channel=mail"
`
```
Deliver via a named webhook endpoint (long form):
Terminal window
```
`
apprise -vv -t "Title" -b "Webhook payload" \\
"pushplus://abc123def456ghi789jkl012mno345pq?channel=webhook&name=myhook"
`
```
Deliver via a named webhook endpoint (compact form — channel implied):
Terminal window
```
`
apprise -vv -t "Title" -b "Webhook payload" \\
"pushplus://myhook@abc123def456ghi789jkl012mno345pq"
`
```
Use the WeCom schema alias (equivalent to `?channel=cp`):
Terminal window
```
`
apprise -vv -t "Title" -b "WeCom message" \\
wecom://abc123def456ghi789jkl012mno345pq
`
```
Use the native PushPlus API URL directly:
Terminal window
```
`
apprise -vv -t "Title" -b "Hello" \\
"https://www.pushplus.plus/send?token=abc123def456ghi789jkl012mno345pq"
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