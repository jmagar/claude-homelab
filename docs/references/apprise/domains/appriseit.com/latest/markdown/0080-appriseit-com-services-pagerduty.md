PagerDuty Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# PagerDuty Notifications
## Overview
* **Source:** [https://www.pagerduty.com](https://www.pagerduty.com)
* **Image Support:** No
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=pagerduty)
## Account Setup
[Section titled “Account Setup”](#account-setup)
You need to have an account with [PagerDuty](https://www.pagerduty.com) and generate/access your API key.
From there you can define an API V2 Integration.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `pagerduty://{integration\_key}@{api\_key}`
* `pagerduty://{integration\_key}@{api\_key}/{source}`
* `pagerduty://{integration\_key}@{api\_key}/{source}/{component}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|integration\_key|Yes|This is provided to you on the Events API V2 integration’s detail page. This can also be referred to as a Routing Key.|
|api\_key|Yes|The API Key associated with your setup|
|group|No|Provide a group (string) as part of the payload|
|class|No|Provide a class (string) as part of the payload|
|region|No|By default this takes on the value of **us**. But you can optionally set it to **eu** as well.|
|source|No|Provide a source (string) as part of the payload; the default is **Apprise** if one isn’t specified.|
|component|No|Provide a component (string) as part of the payload; the default is **Notification** if one isn’t specified.|
|click|No|Provide a clickable URL to associate with the notice.|
|image|No|Associate the notification status via a represented icon. You can set this value to `no` if you do not want this to occur.|
|severity|No|The notification severity is otherwise detected on its own, however if you wish to force a specific mode always, you can do so by providing this as part of the URL. Possible values are: `info`, `warning`, `critical`, and `error`.|
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
Send a Pager Duty trigger to our **source** `node01.local` and the **component** `drive\_sda`
Terminal window
```
`
# Assuming our {integration\_key} is A1BRTD4JD
# Assuming our {api\_key} is TIiajkdnlazkcOXrIdevi7F
# Assuming our {source} is node01.local
# Assuming our {component} is drive\_sda
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"pagerduty://A1BRTD4JD@TIiajkdnlazkcOXrIdevi7F/node01.local/drive\_sda/"
`
```
### Custom Details
[Section titled “Custom Details”](#custom-details)
You can provide custom details as part of the payload as well. This can be accomplished by just sticking a plus symbol (**+**) in front of any parameter you specify on your URL string.
Terminal window
```
`
# Below would pass along in the `custom\_details` payload of the API
# "disk\_space\_left": "145GB"
#
# Assuming our {integration\_key} is abc123
# Assuming our {api\_key} is 98754
# Assuming our {source} is node01.local
# Assuming our {component} is drive\_sda
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"pagerduty://abc123@98754/node01.local/drive\_sda/?+disk\_space\_left=145GB"
# Multiple details just require more entries defined:
# Below would set the custom details to:
# "disk\_space\_left": "145GB"
# "disk\_space\_total": "500GB"
#
# Assuming our {integration\_key} is abc123
# Assuming our {api\_key} is 98754
# Assuming our {source} is node01.local
# Assuming our {component} is drive\_sda
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"pagerduty://abc123@98754/node01.local/drive\_sda/?+disk\_space\_left=145GB&+disk\_space\_total=500GB"
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