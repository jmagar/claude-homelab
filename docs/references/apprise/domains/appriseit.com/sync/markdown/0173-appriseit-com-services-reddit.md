Reddit Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Reddit Notifications
## Overview
* **Source:** [https://reddit.com](https://reddit.com)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 6000
* [ Build Your Apprise URL](/url-builder/?schema=reddit)
## Account Setup
[Section titled “Account Setup”](#account-setup)
1. Visit [https://old.reddit.com/prefs/apps](https://old.reddit.com/prefs/apps) and scroll to the bottom
2. Click on the button that reads ‘**are you a developer? create an app…**’
3. Set the mode to `script`,
4. Provide a `name`, `description`, and `redirect uri` (it can be anything).
5. Save your configuration:
6. Once the bot is saved, you’ll be given a ID (next to the the bot name) and a Secret.
* The **App ID** will look something like this: `YWARPXajkk645m`
* The **App Secret** will look something like this: `YZGKc5YNjq3BsC-bf7oBKalBMeb1xA`
* The App will also have a location where you can identify the users/developers who can also use this key. By default it’s already configured to be yours. You will need to use the user/pass of one of the accounts identified here as well to use the posting capabilities.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `reddit://{user}:{pass}@{app\_id}/{app\_secret}/{subreddit}`
* `reddit://{user}:{pass}@{app\_id}/{app\_secret}/{subreddit\_1}/{subreddit\_2}/{subreddit\_N}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|app\_id|Yes|The App ID generated for your **script** application you created on the [Reddit Apps](https://old.reddit.com/prefs/apps) page.|
|app\_secret|Yes|The App Secret generated for your **script** application you created on the [Reddit Apps](https://old.reddit.com/prefs/apps) page.|
|user|Yes|The Reddit UserID associated with one of the developers attached to your application you generated. By default this is just the same user account you used to create the Reddit app in the first place.|
|pass|Yes|The Reddit password associated with the UserID defined above.|
|subreddit|Yes|The Subreddit you wish to post your message to. You must specify at least 1 of these.|
|kind|No|The message kind can be set to either `self`, `link`, or `auto`.
Set this to `self` to imply you’re posting a general/common post to the subreddit. Otherwise, set this to `link` if the message body you provide (as part of your Apprise payload) only contains a hyperlink/URI to a website. The `auto` setting (*also the default*) will parse the *message body* and set the `self`/`link` kind accordingly based on what was detected.|
|ad|No|Specify whether or not what you are posting is an advertisement. By default this is set to **No**.|
|nsfw|No|The *Not Safe For Work* (NSFW) flag. By default this is set to **No**.|
|replies|No|Send all replies of the thread to your (Reddit) inbox? By default this is set to **Yes**.|
|resubmit|No|Let Reddit know this is a re-post. Some subreddits block the re-posting of content; setting this flag to `yes` can enforce that the content be accepted even if this is the case. Some subreddits will even flag the message differently when you identify it as a re-post up front. This may or may not be what you want. By default this is set to **No** so that all messages are treated by the upstream server.|
|spoiler|No|Mark your post with the **spoiler** flag. By default this is set to **No**.|
|flair\_id|No|Provide the `flair\_id` you want to associate with your post. By default this is not passed upstream unless identified.|
|flair\_text|No|Provide the `flair\_text` you want to associate with your post. By default this is not passed upstream unless identified.|
Reddit always requires a `title` to go with its `body`. Reddit will deny your post (upstream) if you don’t provide both.
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
Send a Reddit Notification
Terminal window
```
`
# Assuming our {user} is sstark
# Assuming our {pass} is notAFanOfLannisters
# Assuming our {app\_id} is YWARPXajkk645m
# Assuming our {app\_secret} is YZGKc5YNjq3BsC-bf7oBKalBMeb1xA
# Assuming we want to post to the {subreddit} Apprise
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
reddit://sstark:notAFanOfLannisters@YWARPXajkk645m/YZGKc5YNjq3BsC-bf7oBKalBMeb1xA/Apprise
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