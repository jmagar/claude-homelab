Ntfy Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Ntfy Notifications
## Overview
* **Source:** [https://ntfy.sh/](https://ntfy.sh/)
* **Image Support:** No
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=ntfy)
## Account Setup
[Section titled “Account Setup”](#account-setup)
[Ntfy](https://ntfy.sh/) is an easy to use messaging service that supports both
public cloud usage (`https://ntfy.sh`) and self-hosted private servers.
Apprise supports both insecure (`ntfy://`) and secure (`ntfys://`) schemas.
## Syntax
[Section titled “Syntax”](#syntax)
Ntfy can send notifications through the following **modes**:
* **private**: A locally hosted private server [https://github.com/binwiederhier/ntfy](https://github.com/binwiederhier/ntfy)
* **cloud**: A setup pointing to [https://ntfy.sh](https://ntfy.sh)
Valid syntax is as follows:
* `ntfy://{topic}`
* `ntfy://{host}/{topic}`
* `ntfy://{host}:{port}/{topics}`
* `ntfy://{user}@{host}/{topics}`
* `ntfy://{user}@{host}:{port}/{topics}`
* `ntfy://{user}:{password}@{host}/{topics}`
* `ntfy://{user}:{password}@{host}:{port}/{topics}`
* `ntfy://{token}@{hostname}/{topics}`
The secure versions:
* `ntfys://{topic}`
* `ntfys://{host}/{topic}`
* `ntfys://{host}:{port}/{topics}`
* `ntfys://{user}@{host}/{topics}`
* `ntfys://{user}@{host}:{port}/{topics}`
* `ntfys://{user}:{password}@{host}/{topics}`
* `ntfys://{user}:{password}@{host}:{port}/{topics}`
* `ntfys://{token}@{hostname}/{topics}`
You can specify more than one topic:
* `ntfy://{user}:{password}@{hostname}/{topic1}/{topic2}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|user|No|The user account to authenticate with.|
|password|No|The password used for authentication.|
|hostname|No|The ntfy server to send notifications to.|
|port|No|Defaults to **80** for `ntfy://` and **443** for `ntfys://`.|
|topic|Yes|At least one topic must be defined.|
|token|No|Authorization token (auto-detected if provided in URL).|
|mode|No|Authentication mode. Auto-detected. Possible values: `private`, `cloud`.|
|auth|No|`basic` (default) or `token`.|
|email|No|Associate an email address with the ntfy post.|
|xtags|No|**ntfy message tags** (sent as the `X-Tags` header) to associate with the notification. Use comma and/or space to specify more than one. The legacy `tags=` parameter is still accepted as a backward-compatible alias. These are not to be confused with Apprise tags; [see here for more details](#ntfy-tags-vs-apprise-tags).|
|attach|No|URL pointing to a remote attachment to reference.|
|filename|No|Override the attachment filename.|
|click|No|Hyperlink users are directed to when clicking the notification.|
|priority|No|One of `max`, `high`, `default`, `low`, or `min`. Defaults to `default`.|
|actions|No|ntfy action button definitions.|
|delay|No|Delay message delivery.|
|image|No|Defaults to `Yes`; includes image preview when available.|
|avatar\_url|No|Override the Apprise icon with a custom image URL.|
If your Ntfy server is behind an HTTPS (Secure) hosted setup, then you simply use `ntfys://`:
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
## Ntfy Tags vs Apprise Tags
[Section titled “Ntfy Tags vs Apprise Tags”](#ntfy-tags-vs-apprise-tags)
The `xtags=` parameter above refers to **ntfy message tags only** (sent as
the `X-Tags` header). The legacy `tags=` spelling is still accepted for
backward compatibility but `xtags=` is preferred going forward.
These tags are sent directly to the ntfy server and appear as labels or
emojis on the delivered notification.
They are **not** the same as Apprise routing tags.
Apprise routing tags are configured in your Apprise configuration file
(using `tag:` or `tags:` in YAML) and control which notification services
are triggered. They have no effect on the `X-Tags` header sent to the ntfy
server.
The old `tags=` spelling was renamed to `xtags=` because the Apprise YAML
config parser also uses `tags:` as a key for routing tags. Using `tags=`
inside a YAML-loaded ntfy URL could cause the value to be silently
interpreted as an Apprise routing tag instead of an ntfy message tag,
preventing the notification from being delivered when no tag filter is
active. Using `xtags=` avoids this ambiguity entirely.
Below is an example of a Ntfy message being sent that includes tags:
Terminal window
```
`
apprise -vv -t "Failure" -b "Something went wrong" \\
"ntfy://localhost/mytopic?priority=high&xtags=warning"
`
```
Below is an example that furthers onto the above by showing multiple (Ntfy) tags are supported too:
Terminal window
```
`
apprise -vv -t "Alert" -b "Disk space low" \\
"ntfy://localhost/mytopic?priority=high&xtags=warning,storage"
`
```
Apprise YAML configuration files can sometimes introduce confusion since they also use tags. Below shows the clear separation between Apprise `tag:` and ntfy `xtags=`.
apprise.yaml
```
`
urls:
- ntfy://localhost/mytopic?priority=high&xtags=warning:
tag: ntfy-alert
`
```
In the example above:
* `xtags=warning`: Ntfy message tag (sets the `X-Tags: warning` header)
* `tag: ntfy-alert`: Apprise routing tag; this would later be expected to be triggered by:
Terminal window
```
`
apprise -vv -t "Alert" -b "Disk space low" \\
--tag=ntfy-alert --config=apprise.yaml
`
```
## Examples
[Section titled “Examples”](#examples)
Send a notification to a local Ntfy server:
Terminal window
```
`
# Assuming our {hostname} is localhost
# Assuming our {topic} is great-place
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
ntfy://localhost/great-place
`
```
We can also send a notification to the ntfy.sh (cloud) server:
Terminal window
```
`
# Assuming our {topic} is great-place
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
ntfy://great-place
`
```
Ntfy also supports Markdown; if you want to leverage this, simply add `?format=markdown` to your Apprise URL; eg:
Terminal window
```
`
# Assuming our {hostname} is localhost
# Assuming our {topic} is great-place
# Assuming we want to leverage the markdown support
apprise -vv -t "Test Message Title" -b "# Markdown Support" \\
"ntfy://localhost/great-place?format=markdown"
`
```
Secure HTTPS usage:
Terminal window
```
`
# Assuming our SECURE {hostname} is localhost
# Assuming our {topic} is great-topic
apprise -vv -t "Test Secure Message Title" -b "Test Message Body" \\
ntfys://localhost/great-topic
`
```
Using ntfy action buttons:
Terminal window
```
`
apprise -vv -t "Title" -b "Message content" \\
ntfy://ntfy.selfhostedexample.com/mytopic?actions=view%2CGoogle%2Chttps://www.google.com%3Bview%2CBing%2Chttps://www.bing.com
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