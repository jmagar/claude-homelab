Lark (Feishu) Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Lark (Feishu) Notifications
## Overview
* **Source:** [https://open.larksuite.com/](https://open.larksuite.com/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 20000
* [ Build Your Apprise URL](/url-builder/?schema=lark)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Lark (also known as Feishu in China) allows you to create **custom bots** that can send notifications to groups and chats using **incoming webhooks**.
1. Visit the [Lark Developer Console](https://open.larksuite.com/) and create or access your app.
2. Under **Features**, enable **Bot** and turn on the **Custom Bot** feature.
3. From the app’s **Bot settings**, generate a **Webhook URL**.
4. Copy the webhook — it will look like this:
```
`
https://open.larksuite.com/open-apis/bot/v2/hook/abcdef1234567890abcdef1234567890
`
```
This webhook contains a single unique token at the end. This is all Apprise needs to deliver messages.
While you can use the full webhook URL directly, Apprise also supports a simplified form using the `lark://` schema.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `https://open.larksuite.com/open-apis/bot/v2/hook/{token}`
* `lark://{token}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|token|Yes|The 32-character integration key at the end of your webhook URL.|
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
Using the simplified Apprise URL:
Terminal window
```
`
# Assuming our token is abcdef1234567890abcdef1234567890
apprise -vv -t "Lark Title" -b "Body of message" \\
lark://abcdef1234567890abcdef1234567890
`
```
Using the full native URL as-is:
Terminal window
```
`
apprise -vv -t "Lark Title" -b "Body of message" \\
https://open.larksuite.com/open-apis/bot/v2/hook/abcdef1234567890abcdef1234567890
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