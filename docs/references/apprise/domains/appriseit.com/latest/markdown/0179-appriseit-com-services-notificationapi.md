NotificationAPI Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# NotificationAPI Notifications
## Overview
* **Source:** [https://www.notificationapi.com](https://www.notificationapi.com)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 160
* [ Build Your Apprise URL](/url-builder/?schema=napi)
## Account Setup
[Section titled “Account Setup”](#account-setup)
NotificationAPI lets you trigger email, SMS, calls, push, and in‑app notifications using a single API. The Apprise plugin supports the US, CA, and EU regional hosts. Configure the content once in NotificationAPI, then trigger it from Apprise by sending the notification **type** and **recipient** information, with optional merge‑tag parameters.
1. Create a NotificationAPI account and sign in.
2. In the dashboard, locate your **clientId** and **clientSecret** under *Environments*.
3. Create or identify the **notification type** you want to trigger (for example, `order\_tracking`).
4. Make sure your recipients have the correct identifiers:
* **Email** notifications require an email address on the `to` object.
* **SMS** notifications require a phone number in **E.164** format, for example `+15005550006`.
* You can also address users by a NotificationAPI **user id**.
* If you are hosted outside the US, note your region’s API host (US default, CA, or EU).
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows (both `napi://` and `notificationapi://` are accepted aliases):
* `napi://{ClientID}/{ClientSecret}/{Target}`
* `napi://{Type}@{ClientID}/{ClientSecret}/{Target}`
**Targets** can be combined in a single path and are grouped by a leading **id**. Each `{Target}` segment may be:
* a user id (`userid` or `@userid`)
* an email (`name@example.com`)
* an E.164 phone number (`+15551234567`)
Examples of grouped targets:
* `userid/test@example.com` → id + email
* `userid/+15551234567` → id + SMS
* `userid/+15551234567/test@example.com` → id + SMS + email
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|`type`|No|Notification type id from your NotificationAPI dashboard. Defaults to `apprise`.|
|`mode`|No|Notification mode; can be either `message` or `template`. Defaults to `message`.|
|`id`|Yes\*|Client id. Required unless supplied in the path.|
|`secret`|Yes\*|Client secret. Required unless supplied in the path.|
|`to`|No|Comma‑separated target; each subset of targets must have and `id` associated with them|
|`region`|No|`us` (default), `ca`, or `eu` to select the API host.|
|`channels`|No|Channels are detected based on first target detected. The following channels can be proivded: `email`, `sms` , `inapp`, `web\_push`, `mobile\_push` and/or `slack`.|
|`from`|No|Display name for the email *From* identity.|
|`cc`|No|Comma‑separated list of CC addresses.|
|`bcc`|No|Comma‑separated list of BCC addresses.|
|`:{key}`|No|Dynamic template parameter tokens passed to `parameters` (e.g., `:orderId=123`). It’s important to prefix each one of these with a colon (`:`) for it to be correctly interpreted. This is only used if `mode` is set to `template`|
\* Required when not already set in the URL path component.
### NotificationAPI Default Parameters
[Section titled “NotificationAPI Default Parameters”](#notificationapi-default-parameters)
Each NotificationAPI request sent through Apprise includes the following default parameters:
|Parameter|Description|
|`appBody`|The main message body payload of the notification.|
|`appTitle`|The message title or subject line.|
|`appType`|The Apprise notification type (e.g., `info`, `success`, `warning`, `failure`).|
|`appId`|The Apprise application identifier, usually `apprise`.|
|`appDescription`|The description text configured for the Apprise service.|
|`appColor`|A colour code associated with the notification type (used by some channels for visual context).|
|`appImageUrl`|A URL pointing to an icon image representing the notification type.|
|`appUrl`|A URL reference back to the source application (if configured).|
These parameters are always included by Apprise in addition to any custom `:{key}={value}` tokens you provide in your URL.
These defaults are common across all Apprise plugins, in addition to the service‑specific parameters described above.
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
Send to one email recipient by type and let NotificationAPI pick the channel:
Terminal window
```
`
apprise -vv -t "Order Update" -b "Your order shipped." napi://order\_tracking@CLIENT\_ID/CLIENT\_SECRET/id/user@example.com
`
```
Send the same notification to multiple recipients using path segments:
Terminal window
```
`
apprise -vv -t "Status" -b "Processing complete." napi://order\_tracking@CLIENT\_ID/CLIENT\_SECRET/\\
id/user@example.com/+15552341234/alice\_123
`
```
Force the SMS channel and set the region to Canada:
Terminal window
```
`
apprise -vv -t "Code" -b "Your verification code is 123456" 'napi://order\_tracking@CLIENT\_ID/CLIENT\_SECRET/id/+16475550123?channel=sms&region=ca'
`
```
Set *From*, CC and BCC for an email:
Terminal window
```
`
apprise -vv -t "Release" -b "v2.0.1 is live." 'napi://release\_note@CLIENT\_ID/CLIENT\_SECRET/id/dev@example.ca?from=Dev%20Team&cc=qa@example.ca&bcc=ops@example.ca'
`
```
Pass dynamic template tokens that your NotificationAPI template references:
Terminal window
```
`
apprise -vv -t "Order" -b " " 'napi://order\_tracking@CLIENT\_ID/CLIENT\_SECRET/user@example.com?:orderId=12345&:status=shipped'
`
```
Use a query‑only form, handy in YAML:
Terminal window
```
`
apprise -vv -t "Hello" -b "Hi there" 'napi://?id=CLIENT\_ID&secret=CLIENT\_SECRET&type=greeting&to=id,user@example.com'
`
```
Minimal (id + email):
Terminal window
```
`
apprise -vv -t "Welcome" -b "Hello from Apprise" "napi://welcome\_email@CID/SECRET/user123/test@example.com"
`
```
EU region + token substitutions
Terminal window
```
`
apprise -vv -b "\<b\>Your order shipped!\</b\>" --format=html "napi://order\_update@CID/SECRET/user123/test@example.com?region=eu&:firstName=Chris&:trackingUrl=https://t.example/ABC123"
`
```
Setting From / CC / BCC / Reply‑To (email)
Terminal window
```
`
apprise -vv -b "Body" "napi://newsletter@CID/SECRET/user123/test@example.com?from=Team\<team@example.com\>&cc=dev@example.com&bcc=ops@example.com&reply=help@example.com"
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