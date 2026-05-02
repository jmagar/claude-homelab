Home Assistant Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Home Assistant Notifications
## Overview
* **Source:** [https://www.home-assistant.io/](https://www.home-assistant.io/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 4096
* [ Build Your Apprise URL](/url-builder/?schema=hassio)
This page covers sending notifications **to** Home Assistant from Apprise.
If you want to use Apprise **from within** Home Assistant to fan out to
other services (email, Telegram, etc.), see the
[Home Assistant Integration Guide](/guides/hassio/).
## Account Setup
[Section titled “Account Setup”](#account-setup)
1. Log into your Home Assistant instance and navigate to your **Profile** page.
2. Scroll to the very bottom and click **Create Token** under
**Long-Lived Access Tokens**.
3. Give it a name (e.g. *Apprise*) and copy the generated token — you
will not be able to view it again.
## Syntax
[Section titled “Syntax”](#syntax)
There are two operating modes depending on whether you include a
service target in the URL.
### Persistent Notification Mode (default)
[Section titled “Persistent Notification Mode (default)”](#persistent-notification-mode-default)
When no service target is provided, Apprise posts a
[persistent notification](https://www.home-assistant.io/integrations/persistent_notification/)
to the Home Assistant dashboard.
```
`
hassio://{host}/{access\_token}
hassios://{host}/{access\_token}
hassio://{host}:{port}/{access\_token}
`
```
By default a new unique notification is created on every send. To
instead **replace** the previous notification (useful for status
updates), pin a fixed notification ID with `?nid=`:
```
`
hassio://{host}/{access\_token}?nid=myid
`
```
### Service Notification Mode
[Section titled “Service Notification Mode”](#service-notification-mode)
Append one or more service targets after the access token to call any
Home Assistant service directly. This supports mobile app push
notifications, TTS, media players, and any other HA service domain.
Each target segment follows this grammar:
|Form|Example|Notes|
|`service`|`mobile\_app\_phone`|Domain defaults to `notify`|
|`domain.service`|`media\_player.living\_room`|Explicit domain|
|`service:target`|`mobile\_app\_phone:user1`|Single sub-target|
|`service:t1,t2,t3`|`notify\_group:alice,bob`|Comma (or space) separated sub-targets|
|`domain.service:t1,t2`|`tts.google\_say:en-US`|Domain + sub-targets|
Multiple top-level targets are separated by `/` in the URL:
```
`
hassio://{host}/{access\_token}/{service}
hassio://{host}/{access\_token}/{domain}.{service}
hassio://{host}/{access\_token}/{domain}.{service}:{target}
hassio://{host}/{access\_token}/{domain}.{service}:{t1},{t2}
hassio://{host}/{access\_token}/{service1}/{domain}.{service2}:{target}
`
```
The **default domain** is `notify` when none is specified, so
`hassio://host/token/mobile\_app\_phone` is equivalent to
`hassio://host/token/notify.mobile\_app\_phone`.
In Home Assistant, go to **Developer Tools → Services**. The service
names listed there map directly to `{domain}.{service}` in the Apprise
URL. For mobile app push notifications the service is usually named
`notify.mobile\_app\_{device\_name}` where `{device\_name}` matches what
appears in the HA companion app settings.
#### Reverse-Proxy Path Prefix
[Section titled “Reverse-Proxy Path Prefix”](#reverse-proxy-path-prefix)
If your Home Assistant instance is served under a sub-path (e.g.
behind a reverse proxy at `/ha`), supply it with `?prefix=`:
```
`
hassio://{host}/{access\_token}/{service}?prefix=/ha
`
```
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|host|Yes|The hostname or IP address of your Home Assistant instance.|
|access\_token|Yes|The **Long-Lived Access Token** generated from your profile page.|
|port|No|Port to connect on. Defaults to **8123** for `hassio://` and **443** for `hassios://`.|
|service|No|One or more `[domain.]service[:target]` entries. Omit entirely to use **Persistent Notification** mode.|
|nid|No|A fixed **Notification ID** for persistent notifications only. When set, each new message replaces the previous one instead of creating a new entry.|
|prefix|No|A URL path prefix prepended to every API call. Required when Home Assistant is served under a sub-path (e.g. `?prefix=/ha`).|
|batch|No|Set to `yes` to group up to 10 service targets into a single API call. Defaults to `no`.|
|to|No|Alias for service targets. Equivalent to adding targets in the URL path.|
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
Send a persistent notification (creates a new entry in the HA
dashboard on every call):
Terminal window
```
`
apprise -vv -t "Alert" -b "Motion detected" \\
'hassio://myserver.local/4b4f2918fd-dk5f-8f91f'
`
```
Send a persistent notification that always **replaces** the last
(useful for recurring status updates):
Terminal window
```
`
apprise -vv -t "Status" -b "All systems nominal" \\
'hassio://myserver.local/4b4f2918fd-dk5f-8f91f?nid=apprise'
`
```
Push to a mobile app notification service:
Terminal window
```
`
apprise -vv -t "Alert" -b "Someone rang the doorbell" \\
'hassio://myserver.local/4b4f2918fd-dk5f-8f91f/notify.mobile\_app\_myphone'
`
```
Push to multiple services in one URL:
Terminal window
```
`
apprise -vv -t "Alert" -b "Garage door left open" \\
'hassio://myserver.local/4b4f2918fd-dk5f-8f91f/notify.mobile\_app\_phone1/notify.mobile\_app\_phone2'
`
```
Send using a secure connection (`hassios://` → HTTPS on port 443):
Terminal window
```
`
apprise -vv -t "Test" -b "Secure message" \\
'hassios://my.secure.server/4b4f2918fd-dk5f-8f91f/notify.mobile\_app\_myphone'
`
```
Use `?to=` when constructing URLs programmatically:
Terminal window
```
`
apprise -vv -t "Test" -b "Hello" \\
'hassio://myserver.local/4b4f2918fd-dk5f-8f91f?to=notify.mobile\_app\_myphone'
`
```
## Troubleshooting
[Section titled “Troubleshooting”](#troubleshooting)
* **401 Unauthorized** — Your token is invalid or has expired. Generate
a new one from the Home Assistant profile page.
* **400 Bad Request** — A service target was specified that does not
exist, or the payload contained unsupported parameters for that
service domain. Verify the domain and service name against your HA
instance.
* **Self-signed certificate** — Add `?verify=no` to skip SSL
verification: `hassios://myserver/{token}?verify=no`
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