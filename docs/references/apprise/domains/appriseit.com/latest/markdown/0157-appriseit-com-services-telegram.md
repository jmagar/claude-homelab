Telegram Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Telegram Notifications
## Overview
* **Source:** [https://telegram.org/](https://telegram.org/)
* **Image Support:** Yes
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 4096
* [ Build Your Apprise URL](/url-builder/?schema=tgram)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Telegram is slightly more complicated then some of the other notification services, so here is quick breakdown of what you need to know and do in order to send Notifications through it using this tool.
At the very start (if you don’t have an account already), you will need to connect with a phone. The site uses your phone number as its credential to let you into your account. So download and install the phone app first via [Android](https://telegram.org/dl/android) or [Apple](https://telegram.org/dl/ios).
Once you’re set up, it can be a bit easier to just use their web interface [here](https://telegram.org/dl/webogram) with a PC (especially for development); but this part is up to you.
### Bot Setup
[Section titled “Bot Setup”](#bot-setup)
Telegram notifications require you to [create a bot](https://api.telegram.org). It’s only after this is done that you will gain a vital piece of information Apprise needs called the **Token Identifier** (or **bot\_token**).
To do this you will have to open a communication (inside Telegram) to the **[BotFather](https://botsfortelegram.com/project/the-bot-father/)**. He is available to all users signed up to the platform. Once you’ve got a dialog box open to him:
1. Type: `/newbot`
2. Answer the questions it asks after doing this (which get the name of it, etc).
3. When you’ve completed step 2, you will be provided a *bot\_token* that looks something like this: `123456789:alphanumeric\_characters`.
4. Type `/start` now in the same dialog box to enable and instantiate your brand new bot.
The good news is this process only has to be done once. Once you get your **bot\_token**, hold on to it and no longer worry about having to repeat this process again. It’s through this bot that Apprise is able to send notifications onto Telegram to different users.
### Chat ID Conundrum
[Section titled “Chat ID Conundrum”](#chat-id-conundrum)
**2021.12.23 Update**: Recently the developers of Telegram have made it easier to acquire this ID using their own built in tool [explained here](https://www.alphr.com/find-chat-id-telegram/). Thank you `@mattpackwood` for this tip!
Behind the scenes, Telegram notifies users by their **{chat\_id}** and not their *easy-to-remember* user name.
Unfortunately (at this time) Telegram doesn’t make it intuitive to get this **{chat\_id}** without simple tricks and workarounds that can be found through Googling or just simply talking to their support team.
However, Apprise can make this task a bit easier if the intention is to just private message yourself. If this is the case, simply send a private message to this new bot you just created (above). That’s it!
By doing this, Apprise is able to automatically to detect *your* **{chat\_id}** from the message sent to the bot.
* **tgram**://**{bot\_token}**/
When using the short form of the Telegram/Apprise URL and the bot owner (probably you) is successfully detected, the **{chat\_id}** it detected will appear in the logs after the notification is sent. Note that the **Telegram API keeps incoming messages for 24 hours only**. Thus, you should update your Apprise URL to explicitly reference this in the future.
* **tgram**://**{bot\_token}**/**{chat\_id}**
**Note**: you can also just go ahead and acquire the **{chat\_id}** yourself after first messaging yourself as per the instructions above. Afterwards, you just need to visit `https://api.telegram.org/bot{bot\_token}/getUpdates`.
* *Note:* the keyword `bot` must sit in-front of the actual **{bot\_token}** that you were given by the BotFather.
* The result will contain the message you sent; in addition to this there is a section entitled `chat` with the `id` identified here. This is the **{chat\_id}** you can use to directly message using Apprise.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `tgram://{bot\_token}/`
* **Note**: As already identified above: Apprise is clever enough to determine the chat*id of the bot owner (you) \_only if you’ve sent it at least 1 private message to it* first.
* `tgram://{bot\_token}/{chat\_id}/`
* `tgram://{bot\_token}/{chat\_id1}/{chat\_id2}/{chat\_id3}/`
* `tgram://{bot\_token}/{chat\_id}:{topic}/`
* `tgram://{bot\_token}/{chat\_id1}:topic1}/{chat\_id2}:{topic2}/{chat\_id3}:{topic3}/`
If you want to see the icon/image associated with the notification, you can have it come through by adding a **?image=yes** to your URL string like so:
* `tgram://{bot\_token}/?image=Yes`
* `tgram://{bot\_token}/{chat\_id}/?image=Yes`
* `tgram://{bot\_token}/{chat\_id1}/{chat\_id2}/{chat\_id3}/?image=Yes`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|bot\_token|Yes|The token that identifies the bot you created through the *[BotFather](https://botsfortelegram.com/project/the-bot-father/)*|
|chat\_id|Yes|Identify the users you want your bot to deliver your notifications to. You must specify at least 1 *chat\_id*. If you do not specify a chat\_id, the notification script will attempt to detect the bot owner’s (you) chat\_id and use that.|
|image|No|You can optionally append the argument of **?image=Yes** to the end of your URL to have a Telegram message generated before the actual notice which uploads the image associated with it. Due to the services limitations, Telegram doesn’t allow you to post an image inline with a text message. But you can send a message that just contains an image. If this flag is set to true, *apprise* will send an image notification followed by the notice itself. Since receiving 2 messages for every 1 notice could be annoying to some, this has been made an option that defaults to being disabled.|
|format|No|The default value of this is *text*. But if you plan on managing the format yourself, you can optionally set this to *markdown* or *html* as well.|
|silent|No|A `yes/no` flag allowing you to send the notification in a silent fashion. By default this is set to `no`.|
|preview|No|A `yes/no` flag allowing you to display webpage previews of your post. By default this is set to `no`.|
|mdv|No|Optionally set the `markdown` version to use; can be set to either `v1` or `v2` and defaults to `v2` if not set. This value is only referenced when `?format=markdown` has also been set.|
|topic|No|The Topic Thread ID you wish your message to be posted to. [Here is a StackOverflow post on acquiring the Topic Thread ID](https://stackoverflow.com/questions/74773675/how-to-get-topic-id-for-telegram-group-chat)|
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
Send a telegram notification to lead2gold:
Terminal window
```
`
# Assuming our {bot\_token} is 123456789:abcdefg\_hijklmnop
# Assuming the {chat\_id} belonging to lead2gold is 12315544
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
tgram://123456789:abcdefg\_hijklmnop/12315544/
`
```
Want to use the Telegram Markdown features; do this instead:
Terminal window
```
`
# Assuming our {bot\_token} is 123456789:abcdefg\_hijklmnop
# Assuming the {chat\_id} belonging to lead2gold is 12315544
# We enforce the output format to be markown in this example
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
tgram://123456789:abcdefg\_hijklmnop/12315544/?format=markdown
`
```
Got a specific topic you want to notify?
Terminal window
```
`
# Assuming our {bot\_token} is 123456789:abcdefg\_hijklmnop
# Assuming the {chat\_id} belonging to lead2gold is 12315544
# Assuming the {topic\_id} is 1234567
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
tgram://123456789:abcdefg\_hijklmnop/12315544/?topic=1234567
`
```
Topics can also be assigned per chat id:
Terminal window
```
`
# Assuming our {bot\_token} is 123456789:abcdefg\_hijklmnop
# Assuming the {chat\_id} belonging to lead2gold is 12315544
# Assuming the {topic\_id} is 1234567
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
tgram://123456789:abcdefg\_hijklmnop/12315544:1234567/
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