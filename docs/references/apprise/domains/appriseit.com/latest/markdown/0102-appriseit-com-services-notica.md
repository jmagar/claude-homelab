Notica Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Notica Notifications
## Overview
* **Source:** [https://notica.us/](https://notica.us/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=notica)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Notica doesn’t require you to create an account at all. You just have to visit [their website](https://notica.us/) at least once to both:
1. Get your token
2. Enable Browser Notifications (to be sent from the Notica website)
The website will generate you a URL to post to that looks like this:
`https://notica.us/?abc123`
This effectively equates to: `https://notica.us/?{token}`
Note: *disregard the question mark on the URL as it is not part of the token*.
From here you have two options, you can directly pass the Notica URL into apprise exactly how it is shown to you from the website, or you can reconstruct the URL into an Apprised based one (which equates to *slightly* faster load times) as: `notica://{token}`
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `https://notica.us/?{token}`
* `notica://{token}`
For self hosted solutions, you can use the following:
* `notica://{host}/{token}`
* `notica://{host}:{port}/{token}`
* `notica://{user}@{host}/{token}`
* `notica://{user}@{host}:{port}/{token}`
* `notica://{user}:{password}@{host}/{token}`
* `notica://{user}:{password}@{host}:{port}/{token}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|token|Yes|The Token that was generated for you after visiting their [website](https://notica.us/). Alternatively this should be the token used by your self hosted solution.|
A self hosted solution allows for a few more parameters:
|Variable|Required|Description|
|hostname|Yes|The Web Server’s hostname.|
|port|No|The port our Web server is listening on. By default the port is **80** for **notica://** and **443** for all **noticas://** references.|
|user|No|If you’re system is set up to use HTTP-AUTH, you can provide *username* for authentication to it.|
|password|No|If you’re system is set up to use HTTP-AUTH, you can provide *password* for authentication to it.|
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
Send a notica notification:
Terminal window
```
`
# Assuming our {token} is abc123
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
notica://abc123
`
```
### Header Manipulation
[Section titled “Header Manipulation”](#header-manipulation)
Self-hosted solutions may require users to set special HTTP headers when they post their data to their server. This can be accomplished by just sticking a hyphen (**-**) in front of any parameter you specify on your URL string.
Terminal window
```
`
# Below would set the header:
# X-Token: abcdefg
#
# Assuming our {hostname} is localhost
# Assuming our {token} is abc123
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"notica://localhost/abc123/?-X-Token=abcdefg"
# Multiple headers just require more entries defined with a hyphen in front:
# Below would set the headers:
# X-Token: abcdefg
# X-Apprise: is great
#
# Assuming our {hostname} is localhost
# Assuming our {token} is abc123
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"notica://localhost/abc123/?-X-Token=abcdefg&-X-Apprise=is%20great"
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