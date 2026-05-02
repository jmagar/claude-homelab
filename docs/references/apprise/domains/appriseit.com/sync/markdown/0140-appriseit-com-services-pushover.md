Pushover Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Pushover Notifications
## Overview
* **Source:** [https://pushover.net/](https://pushover.net/)
* **Image Support:** No
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 512
* [ Build Your Apprise URL](/url-builder/?schema=pover)
## Account Setup
[Section titled “Account Setup”](#account-setup)
There isn’t too much configuration for Pushover notifications. The message is basically just passed to your online Pushover account and then gets relayed to your device(s) you’ve setup from there.
### Getting Your User Key
[Section titled “Getting Your User Key”](#getting-your-user-key)
Once you log into [the website](https://pushover.net/), your dashboard will present your **{user\_key}** in front of you.
### Getting Your API Token
[Section titled “Getting Your API Token”](#getting-your-api-token)
On the dashboard after logging in, if you scroll down you’ll have the ability to generate an application. Upon doing so, you will be provided an API Token to associate with this application you generated. This will become your **{token}**.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `pover://{user\_key}@{token}`
* `pover://{user\_key}@{token}/{device\_id}`
* `pover://{user\_key}@{token}/{device\_id1}/{device\_id2}/{device\_idN}`
* `pover://{user\_key}@{token}/#{group\_key}`
* `pover://{user\_key}@{token}/{device\_id}/#{group\_key}`
* `pover://{user\_key}@{token}?priority={priority}`
* `pover://{user\_key}@{token}?priority=emergency&expire={expire}&retry={retry}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|user\_key|Yes|The user key identifier associated with your Pushover account. This is NOT your email address. The key can be acquired from your Pushover dashboard.|
|token|Yes|The token associated with your Pushover account.|
|device\_id|No|The device identifier to send your notification to. By default if one isn’t specified then all of devices associated with your account are notified.|
|group\_key|No|A Pushover [delivery group](https://pushover.net/api/groups) key, prefixed with `#`. Group keys look identical to user keys and allow broadcasting a message to all members of a group with a single key. Multiple groups may be specified. Groups and devices can be mixed in the same URL.|
|priority|No|Can be **low**, **moderate**, **normal**, **high**, or **emergency**; the default is **normal** if a priority isn’t specified.
To send an emergency-priority notification, the `retry` and `expire` parameters *should* be supplied. You may also set the priorities as documented on the [Pushover API](https://pushover.net/api#priority) where `-2` is **low**, `-1` is **moderate**, `0` is **normal**, `1` is **high** and `2` is **emergency**|
|expire|No|The expire parameter specifies how many seconds your notification will continue to be retried for (every `retry` seconds). If the notification has not been acknowledged in `expire` seconds, it will be marked as expired and will stop being sent to the user. Note that the notification is still shown to the user after it is expired, but it will not prompt the user for acknowledgement. This parameter has a maximum value of at most 10800 seconds (3 hours). The default is 3600 seconds (1 hr) if nothing is otherwise specified.|
|retry|No|The retry parameter specifies how often (in seconds) the Pushover servers will send the same notification to the user. In a situation where your user might be in a noisy environment or sleeping, retrying the notification (with sound and vibration) will help get his or her attention. This parameter must have a value of at least 30 seconds between retries. The default is 900 seconds (15 minutes) if nothing is otherwise specified.|
|sound|No|Can optionally identify one of the optional sound effects identified [here](https://pushover.net/api#sounds). The default sound is **pushover**.|
|url|No|Can optionally provide a Supplementary URL to go with your message|
|url\_title|No|Can optionally provide a Supplementary URL Title to go with your message|
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
## Custom Sounds
[Section titled “Custom Sounds”](#custom-sounds)
Pushover integration constrains notification sounds to a predefined list. This change adds support for custom sound in notifications, which must be uploaded and given a name. This change updates the pushover integration to allow for that name to be specified instead of throwing an error.
1. Go to Settings -\> Alert Settings -\> Manage custom sounds -\> Upload a sound
2. Upload a sound and specify a name (e.g. “mysound”).
3. Validate the sound is accessible and present in the sounds list for your app via [https://api.pushover.net/1/sounds.json?token={app-token}](https://api.pushover.net/1/sounds.json?token={app-token})
4. Specify a sound in your pover call, i.e. apprise -vv -t “title” -b “test message” pover://user@app?sound=mysound
You should hear your custom sound on the notification. In cases where the custom sound name is not found, the default pushover notification sound will play.
## Examples
[Section titled “Examples”](#examples)
Send a Pushover notification to all of our configured devices:
Terminal window
```
`
# Assuming our {user\_key} is 435jdj3k78435jdj3k78435jdj3k78
# Assuming our {token} is abcdefghijklmnop-abcdefg
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
pover://435jdj3k78435jdj3k78435jdj3k78@abcdefghijklmnop-abcdefg
`
```
Send a Pushover notification to a delivery group:
Terminal window
```
`
# Assuming our {user\_key} is 435jdj3k78435jdj3k78435jdj3k78
# Assuming our {token} is abcdefghijklmnop-abcdefg
# Assuming our {group\_key} is gznej3rKEVAvPUxu9vvNnqpmZpokzF
# The # prefix identifies it as a group key
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"pover://435jdj3k78435jdj3k78435jdj3k78@abcdefghijklmnop-abcdefg/#gznej3rKEVAvPUxu9vvNnqpmZpokzF"
`
```
Send a Pushover notification with the Emergency Priority:
Terminal window
```
`
# Emergency priority advises you to also specify the expire and
# retry values.
# Assuming our {user\_key} is 435jdj3k78435jdj3k78435jdj3k78
# Assuming our {token} is abcdefghijklmnop-abcdefg
# The following will set a 1hr expiry and attempt to resend
# the message every 10 minutes:
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
pover://435jdj3k78435jdj3k78435jdj3k78@abcdefghijklmnop-abcdefg?priority=emergency&retry=600&expire=3600
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