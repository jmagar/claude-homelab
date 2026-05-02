Line Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Line Notifications
## Overview
* **Source:** [https://line.me](https://line.me)
* **Image Support:** Yes
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 5000
* [ Build Your Apprise URL](/url-builder/?schema=line)
## Account Setup
[Section titled “Account Setup”](#account-setup)
1. First download Line in order to use it via [Google Play](https://play.google.com/store/apps/details?id=jp.naver.line.android) or [Apple](https://apps.apple.com/us/app/line/id443904275).
2. Once installed, you need to open up the software on your mobile device and access the ⚙️ icon and click on **Accounts**. From here you need to associate an Email address with your account if you haven’t done so already. There is a validation process you must complete.
### Generate a Token
[Section titled “Generate a Token”](#generate-a-token)
In order to generate a token, you need to have associated an email address with your account so that you can log into the [developer console here](https://developers.line.biz/console/).
1. Create a **Provider** if you haven’t done so already; when prompted you want to create a **Messaging API**
2. Next you’ll need to create a **Channel**.
* On the **Basic settings** tab you can acquire your BOT **User ID**. This is suggested to become your `{user}` Apprise field.
* On the **Messaging API** tab you can **Issue** a Long Lived **Channel access token**. This will become your `{token}` Apprise field.
* In your Channel settings under the **Message API** tab:
1. you may want to optionally turn off **Greeting messages**; I personally find it annoying but you may not. So this is up to you.
2. On your mobile device, you will want to chose to add a friend and scan the QR Code under this **Message API** tab (near the top)
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `line://{token}/{user}`
* `line://{token}/{user1}/{user2}/{userN}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|token|Yes|This is the **Long Lived Access Token** generated from the [Line](https://line.me) console (under the Message API section of your channel). This is a very long token that ends with an equal sign `=`. This token also contains numerous forward slashes in it `/`. Apprise is able to detect the API and distinguish it apart from the one or more users you’ve added. So you can safely paste the entire token **as is** straight into the URL.|
|user|Yes|The Line users (separated by forward slash `/`) that you wish to notify. This is NOT the `@userid` you can acquire from your mobile device. It is instead the Line User ID (which usually starts with the letter `U`). For example, you can acquire your Line BOT User ID from the [developer console](https://developers.line.biz/console/) within your channel settings under the **Basic settings** tab (at the bottom).|
|image|No|Associate the notification status via a represented icon. You can set this value to `no` if you do not want this to occur.|
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
Send a line notification:
Terminal window
```
`
# Assuming our {token} is 4174216298
# Assuming our {user} is U1234567
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
line://4174216298/U1234567
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