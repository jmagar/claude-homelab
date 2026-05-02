Pushsafer Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Pushsafer Notifications
## Overview
* **Source:** [https://www.pushsafer.com](https://www.pushsafer.com)
* **Image Support:** No
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=psafer)
## Account Setup
[Section titled “Account Setup”](#account-setup)
There isn’t too much effort requires to use PushSafer notifications. The message is basically just passed to your online PushSafer account and then gets relayed to your device(s) you’ve setup from there.
### Getting Your Private Key
[Section titled “Getting Your Private Key”](#getting-your-private-key)
Once you log into their official [website](https://www.pushsafer.com/), you can find the **{private\_key}** on your [dashboard](https://www.pushsafer.com/dashboard/).
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `psafers://{private\_key}`
* `psafers://{private\_key}/{device\_id}`
* `psafers://{private\_key}/{device\_id1}/{device\_id2}/{device\_idN}`
* `psafers://{private\_key}?priority={priority}`
* `psafers://{private\_key}?priority=emergency&sound=okay`
* `psafers://{private\_key}?vibrate=2`
If no device is specified, the `a` reserved device is used by default. the `a` notifies **all** of your devices currently associated with your account.
Secure connections are always made when you use `psafers://` however `psafer://` also works if you wish to use an unencrypted connection.
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|private\_key|Yes|The private key associated with your PushSafer account. This can be found on your [dashboard](https://www.pushsafer.com/dashboard/) after successfully logging in.|
|device\_id|No|The device identifier to send your notification to. By default if one isn’t specified then all of devices associated with your account are notified.|
|priority|No|Can be **low**, **moderate**, **normal**, **high**, or **emergency**; the default is to use whatever the default setting is for the device being notified.|
|sound|No|Can optionally identify one of the optional sound effects identified [here](https://www.pushsafer.com/en/pushapi#api-sound). By default this variable isn’t set at all.|
|vibration|No|Android and iOS devices can be set to vibrate upon the reception of a notification. By setting this, you’re effectively setting the strength of the vibration. You can set this to **1**, **2** or **3** where 3 is a maximum vibration setting and 1 causes a lighter vibration. By default this variable isn’t set at all causing your device default settings to take effect.|
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
Send a PushSafer notification to all of our configured devices:
Terminal window
```
`
# Assuming our {private\_key} is 435jdj3k78435jdj3k78435jdj3k78
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
psafers://435jdj3k78435jdj3k78435jdj3k78
`
```
Send a PushSafer notification with the Emergency Priority:
Terminal window
```
`
# Emergency priority advises you to also specify the expire and
# retry values.
# Assuming our {user\_key} is 435jdj3k78435jdj3k78435jdj3k78
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
psafers://435jdj3k78435jdj3k78435jdj3k78?priority=emergency
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