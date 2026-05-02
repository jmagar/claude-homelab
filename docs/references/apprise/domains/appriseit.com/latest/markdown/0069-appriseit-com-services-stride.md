Stride Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Stride Notifications
## Service End Reason
[Section titled “Service End Reason”](#service-end-reason)
The creators of Stride ([Atlassian](https://www.atlassian.com)) performed partnership with [Slack](https://slack.com) and therefore are discontinuing both *Stride* and *Hipchat* services. [See their official announcement here](https://www.atlassian.com/blog/announcements/new-atlassian-slack-partnership). This was what was displayed on their website when looking up info on these products:
.
💡The Service was removed from Apprise in [apprise/56](https://github.com/caronc/apprise/issues/56)
## Overview
* **Source:** [https://www.stride.com/](https://www.stride.com/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 2000
* [ Build Your Apprise URL](/url-builder/?schema=stride)
## Account Setup
[Section titled “Account Setup”](#account-setup)
*Stride* is the successor to *Hipchat*. It requires you to create a custom app and assign it to your channel you create.
Let’s start from the beginning:
1. When you sign-up with stride.com, the site will ask if you want to join a group or creating your own. Brand new users will start their own while companies might have already formed a group you want to join.
2. Once you get set up, you’ll have the option of creating a channel (or if you joined your companies group, you might already see channels you can join in front of you). Either way, you need to be in a channel before you get to the next step.
3. Once you’re in a channel you’ll want to connect *apprise* (this notification service) up. To do this, you need to go to the App Manager (on right hand side in your browser) an choose to ‘*Connect your own app*’.
* It will ask you to provide a ‘*token name*’ which can be whatever you want. This will be used for reference later. Click the *Create* button when you’re done.
* When it completes it will generate a token that looks something like:
`HQFtq4pF8rKFOlKTm9Th`
This is important and we’ll referenced it as your **{auth\_token}**.
* If you scroll down it will also generate you a conversation URL that might look like:
`https://api.atlassian.com/site/ce171c45-09ae-4fac-a73d-5a4b7a322872/conversation/a54a80b3-eaad-4524-9a3a-f6653bcfb100/message`
Think of this URL like this:
`https://api.atlassian.com/site/{cloud\_id}/conversation/{convo\_id}/message`. Specifically pay close attention to the **{cloud\_id}** and **{convo\_id}** because you will need this to build your custom URL with.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `stride://{auth\_token}/{cloud\_id}/{convo\_id}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|auth\_token|Yes|The Authorization token that is created for you once you create your Custom App (that you associate with your channel).|
|cloud\_id|Yes|This is extracted from the URL that is created for you when you create your Custom App (the same one that is identified above).
**Note**: This is the first part of the conversation URL:
[https://api.atlassian.com/site/](https://api.atlassian.com/site/)**{cloud\_id}**/conversation/{convo\_id}/message|
|convo\_id|Yes|This is extracted from the URL that is created for you when you create your Custom App (the same one that is identified above).
**Note**: This is the second part of the conversation URL:
[https://api.atlassian.com/site/{cloud\_id}/conversation/](https://api.atlassian.com/site/{cloud_id}/conversation/)**{convo\_id}**/message|
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
Send a Stride notification:
Terminal window
```
`
# Assuming our {auth\_token} is HQFtq4pF8rKFOlKTm9Th
# Assuming our {cloud\_id} is ce171c45-09ae-4fac-a73d-5a4b7a322872
# Assuming our {convo\_id} is a54a80b3-eaad-4524-9a3a-f6653bcfb100
apprise stride://HQFtq4pF8rKFOlKTm9Th/ce171c45-09ae-4fac-a73d-5a4b7a322872/a54a80b3-eaad-4524-9a3a-f6653bcfb100
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