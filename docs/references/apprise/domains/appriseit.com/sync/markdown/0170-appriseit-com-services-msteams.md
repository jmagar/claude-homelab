Microsoft Teams Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Microsoft Teams Notifications
## Overview
* **Source:** [https://teams.microsoft.com](https://teams.microsoft.com)
* **Image Support:** Yes
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 1000
* [ Build Your Apprise URL](/url-builder/?schema=msteams)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Create a free account at [https://teams.microsoft.com](https://teams.microsoft.com).
You will need to create an **Incoming Webhook** to attach Apprise. This can be accomplished through the **the app store** (bottom left hand side of slack like interface); don’t worry, it’s free. From within the app store, search for **Incoming Webhook**. Once you click on it you can associate it with your team. You can also assign it a name, and an avatar. Finally you will have to assign it to a channel.
Alternatively, go to the channel where you want to add the webhook and select ••• icon (More options) from the top navigation bar. Search for **Incoming Webhook** and select **Add**.
When you’ve completed this, it will generate you a URL that looks like:
```
`
https://team-name.office.com/webhook/ \\
abcdefgf8-2f4b-4eca-8f61-225c83db1967@abcdefg2-5a99-4849-8efc-\\
c9e78d28e57d/IncomingWebhook/291289f63a8abd3593e834af4d79f9fe/\\
a2329f43-0ffb-46ab-948b-c9abdad9d643
`
```
Yes… The URL is that big… but at the end of the day this effectively equates to:
`https://{team}.office.com/webhook/{tokenA}/IncomingWebhook/{tokenB}/{tokenC}`
Hence:
The team name can be found in the generated webhook which looks like:
```
`
# https://TEAM-NAME.office.com/webhook/ABCD/IncomingWebhook/DEFG/HIJK
# ^ ^ ^ ^
# | | | |
# These are important \<----------------^--------------------^----^
`
```
vs the legacy URL which looked like (always stating `outlook` as the team name):
```
`
# https://outlook.office.com/webhook/ABCD/IncomingWebhook/DEFG/HIJK
# ^ ^ ^ ^
# | | | |
# legacy team reference: 'outlook' | | |
# | | |
# These are important \<--------------^--------------------^----^
`
```
So as you can see, we have is 3 separate tokens. These are what you need to build your apprise URL with. In the above example the tokens are as follows:
1. **TokenA** is `ABCD@WXYZ`
2. **TokenB** is `DEFG`
3. **TokenC** is `HIJK`
**Note:** Apprise supports this URL *as-is* (*as of v0.7.7*); you no longer need to parse the URL any further. However there is slightly more overhead (internally) if you do use it this way.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `https://team-name.office.com/webhook/{tokenA}/IncomingWebhook/{tokenB}/{tokenC}`
* `msteams://{team}/{tokenA}/{tokenB}/{tokenC}/`
The Legacy format is also still supported. The below URL would automatically set the team name to `outlook`
* `msteams://{tokenA}/{tokenB}/{tokenC}/`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|team|Yes|Extracted from the *incoming-webhook*.|
|tokenA|Yes|The first part of 3 tokens provided to you after creating a *incoming-webhook*|
|tokenB|Yes|The second part of 3 tokens provided to you after creating a *incoming-webhook*|
|tokenC|Yes|The last part of 3 tokens provided to you after creating a *incoming-webhook*|
|template|No|Optionally point to your own custom JSON formatted Microsoft Teams **MessageCard**; [See here for details on their formatting](https://docs.microsoft.com/en-us/microsoftteams/platform/webhooks-and-connectors/how-to/connectors-using).|
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
Send a Microsoft Teams notification:
Terminal window
```
`
# Assuming our {team} is Apprise
# Assuming our {tokenA} is T1JJ3T3L2@DEFK543
# Assuming our {tokenB} is A1BRTD4JD
# Assuming our {tokenC} is TIiajkdnlazkcOXrIdevi7F
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
msteams:///Apprise/T1JJ3T3L2@DEFK543/A1BRTD4JD/TIiajkdnlazkcOXrIdevi7F/
`
```
## Templating
[Section titled “Templating”](#templating)
### The `template` URL Argument
[Section titled “The template URL Argument”](#the-template-url-argument)
Define a `?template=` argument that points to a predefined **MessageCard** you’ve already prepared for Microsoft Teams. The `template` parameter can either point to a local file or a web based URL. Its contents must be JSON (or you’ll get an error trying to process it), and it at the very minimum must have the basic pattern:
```
`
{
"@type": "MessageCard",
"@context": "https://schema.org/extensions"
}
`
```
#### The Template Tokens
[Section titled “The Template Tokens”](#the-template-tokens)
The `template=` you point to, can either be fully populate and ready to go as is (up to the MSTeams chat server), or you can dynamically populate it on the fly each time you call Apprise. You do this by using the double curly brace `{{` and `}}` to surround a keyword that you invent; here is an example:
```
`
{
"@type": "MessageCard",
"@context": "https://schema.org/extensions",
"summary": "{{app\_id}}",
"sections": [
{
"activityImage": "{{app\_image\_url}}",
"activityTitle": "{{app\_title}}",
"text": "Hello {{ target }}, how are you {{ whence }}?"
}
]
}
`
```
In the above example, we introduce several tokens… `app\_id`, `app\_title`, `target` and `whence`. There are a few entries that will ALWAYS be set and you can not over-ride them. They are:
* **app\_id**: The Application identifier; usually set to `Apprise`, but developers of custom applications may choose to over-ride this and place their name here. this is how you acquire this value.
* **app\_desc**: Similar the the Application Identifier, this is the Application Description. It’s usually just a slightly more descriptive alternative to the *app\_id*. This is usually set to `Apprise Notification` unless it has been over-ridden by a developer.
* **app\_color**: A hex code that identifies a colour associate with a message. For instance, `info` type messages are generally blue where as `warning` ones are orange, etc.
* **app\_type**: The message type itself; it may be `info`, `warning`, `success`, etc
* **app\_title**: The actual title (`--title` or `-t` if from the command line) that was passed into the apprise notification when called.
* **app\_body**: The actual body (`--body` or `-b` if from the command line) that was passed into the apprise notification when called.
* **app\_image\_url**: The image URL associated with the message type (`info`, `warning`, etc) if one exists and/or was not specified to be turned off from the URL (`image=no`)
* **app\_url**: The URL associated with the Apprise instance (found in the **AppriseAsset()** object). Unless this has been over-ridden by a developer, its value will be `https://github.com/caronc/apprise`.
Anything you invent outside of that is yours. So lets get back to the `target` and `whence` that was define. Template tokens can be dynamically set by using the colon `:` operator before any URL argument you identify. For example we can set these values on our Apprise URL like so:
* `msteams://credentials/?template=/path/to/template.json&:target=Chris&:whence=this%20afternoon`
* `msteams://credentials/?template=http://host/to/template.json&:target=Chris&:whence=this%20afternoon`
A notification like so:
Terminal window
```
`
# using colons, we can set our target and whence dynamically from the
# command line:
apprise -t "My Title" -b "This is Ignored" \\
"msteams://credentials/?template=http://host/to/template.json&:target=Chris&:whence=this%20afternoon"
`
```
Would post to MSTeams (with respect to our template above):
```
`
{
"@type": "MessageCard",
"@context": "https://schema.org/extensions",
"summary": "Apprise",
"sections": [
{
"activityImage": null,
"activityTitle": "My Title",
"text": "Hello Chris, how are you this afternoon?"
}
]
}
`
```
The default Apprise template today (and still has no change even after this commit looks like this):
```
`
# Prepare our payload
payload = {
"@type": "MessageCard",
"@context": "https://schema.org/extensions",
"summary": "{{app\_desc}}",
"themeColor": "{{app\_color}}",
"sections": [
{
"activityImage": null,
"activityTitle": "{{app\_title}}",
"text": "{{app\_body}}"
}
]
}
`
```
#### Other Template Examples
[Section titled “Other Template Examples”](#other-template-examples)
```
`
{
"@type": "MessageCard",
"@context": "https://schema.org/extensions",
"summary": "{{app\_desc}}",
"themeColor": "{{app\_color}}",
"sections": [
{
"activityImage": null,
"activityTitle": "{{app\_title}}",
"text": "{{app\_body}}"
}
],
"potentialAction": [
{
"@type": "ActionCard",
"name": "Add a comment",
"inputs": [
{
"@type": "TextInput",
"id": "comment",
"isMultiline": false,
"title": "Add a comment here for this task"
}
],
"actions": [
{
"@type": "HttpPOST",
"name": "Add comment",
"target": "{{ target }}"
}
]
}
]
}
`
```
#### Additional Template Notes
[Section titled “Additional Template Notes”](#additional-template-notes)
* Tokens can have white space around them for readability if you like. Hence `{{ token }}` is no different then `{{token}}`.
* All tokens are escaped properly, so don’t worry if your defined token has a double quote in it (`"`); it would be correctly escaped before it is sent upstream.
* Tokens ARE case sensitive, so `{{Token}}` NEEDS to be populated with a `:Token=` value on your URL.
* Tokens that are not matched correctly simply are not swapped and the {{keyword}} will remain as is in the message.
* Apprise always requires you to specify a `--body` (`-b`) at a very minimum which can be optionally referenced as `{{app\_body}}` in your template. Even if you choose not to use this token, you must still pass in something (anything) just to satisfy this requirement and make use of the template calls.
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