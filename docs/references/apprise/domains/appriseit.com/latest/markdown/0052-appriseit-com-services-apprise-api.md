Apprise API Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Apprise API Notifications
## Overview
* **Source:** [https://github.com/caronc/apprise-api](https://github.com/caronc/apprise-api)
* **Image Support:** No
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=apprise)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Get yourself a self-hosted setup of the [Apprise-API](https://github.com/caronc/apprise-api) and use this service to integrate with it remotely.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `apprise://{host}/{token}`
* `apprise://{host}:{port}/{token}`
* `apprise://{user}@{host}:{port}/{token}`
* `apprise://{user}:{password}@{host}:{port}/{token}`
For a secure connection, just use `apprises` instead.
* `apprises://{host}/{token}`
* `apprises://{host}:{port}/{token}`
* `apprises://{user}@{host}:{port}/{token}`
* `apprises://{user}:{password}@{host}:{port}/{token}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|hostname|Yes|The Web Server’s hostname|
|port|No|The port our Web server is listening on. By default the port is **80** for **apprise://** and **443** for all **apprises://** references.|
|user|No|If you’re system is set up to use HTTP-AUTH, you can provide *username* for authentication to it.|
|password|No|If you’re system is set up to use HTTP-AUTH, you can provide *password* for authentication to it.|
|tags|No|You can optional set the tags you want to supply with your call to the Apprise API server|
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
Send a notification along to an Apprise API server listening on port 80:
Terminal window
```
`
# Assuming our {hostname} is apprise.server.local
# Assuming our {token} is token
apprise -vv --body="Test Message" \\
"apprise://apprise.server.local/token"
`
```
Here is another example where you can call your Apprise server based on Tags provided:
Terminal window
```
`
# Assuming our {hostname} is apprise.server.local
# Assuming our {token} is token
# Assuming we want to trigger any Notification associated with the {tag} email
apprise -vv --body="Test Message" \\
"apprise://apprise.server.local/token?tags=email"
`
```
You can also leverage the Logic of AND and OR when passing Tags:
|`tags=` value|Selected services|
|`TagA`|Has `TagA`|
|`TagA TagB`|Has `TagA`**AND**`TagB`|
|`TagA+TagB`|Has `TagA`**AND**`TagB`|
|`TagA&TagB`|Has `TagA`**AND**`TagB`|
|`TagA,TagB`|Has `TagA`**OR**`TagB`|
|`TagA|TagB`|Has `TagA`**OR**`TagB`|
|`TagA TagC,TagB`|Has (`TagA`**AND**`TagC`) **OR**`TagB`|
Terminal window
```
`
# OR example
apprise -vv --body="Test Message" \\
"apprise://apprise.server.local/token?tags=devops,finance"
# AND example
apprise -vv --body="Test Message" \\
"apprise://apprise.server.local/token?tags=devops alerts"
# Mixed example: (comment AND create) OR admin
apprise -vv --body="Test Message" \\
"apprise://apprise.server.local/token?tags=comment create,admin"
`
```
### Header Manipulation
[Section titled “Header Manipulation”](#header-manipulation)
Some users may require special HTTP headers to be present when they post their data to their server. This can be accomplished by just sticking a plus symbol (**+**) in front of any parameter you specify on your URL string.
Terminal window
```
`
# Below would set the header:
# X-Token: abcdefg
#
# Assuming our {hostname} is localhost
# Assuming our {port} is 8080
# Assuming our {token} is apprise
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"apprise://localhost:8080/apprise/?+X-Token=abcdefg"
# Multiple headers just require more entries defined:
# Below would set the headers:
# X-Token: abcdefg
# X-Apprise: is great
#
# Assuming our {hostname} is localhost
# Assuming our {port} is 8080
# Assuming our {token} is apprise
# In this example we allow for a custom URL path to be defined
# in the event we're hosting our Apprise API here instead
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"apprise://localhost:8080/path/apprise/?+X-Token=abcdefg&+X-Apprise=is%20great"
`
```
**Note:** this service is a little redundant because you can already use the CLI and point its configuration to an existing Apprise API server (using the `--config` on the CLI or `AppriseConfig()` class via its own internal API).
Terminal window
```
`
# A simple example of the Apprise CLI using a Config file instead:
# pulling down previously stored configuration
# Assuming our {hostname} is localhost
# Assuming our {port} is 8080
# Assuming our {token} is apprise
apprise --body="test message" --config=http://localhost:8080/get/apprise
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