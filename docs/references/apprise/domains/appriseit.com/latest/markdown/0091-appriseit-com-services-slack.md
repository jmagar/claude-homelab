Slack Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Slack Notifications
## Overview
* **Source:** [https://slack.com/](https://slack.com/)
* **Image Support:** Yes
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 35000
* [ Build Your Apprise URL](/url-builder/?schema=slack)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Slack is slightly more complicated then some of the other notification services, so here is quick breakdown of what you need to know and do in order to send Notifications through it using this tool:
### Method 1: Incoming Webhook
[Section titled “Method 1: Incoming Webhook”](#method-1-incoming-webhook)
First off, Slack notifications require an *incoming-webhook* it can connect to.
1. You can create this webhook from [here](https://my.slack.com/services/new/incoming-webhook/). Just follow the wizard to pre-determine the channel(s) you want your message to broadcast to.
2. Or you can create a Slack App [here](https://api.slack.com/slack-apps) and associate it with one of your Slack Workspaces. From here there are just a few extra steps needed to get your webhook URL (all done through the App’s configuration screen):
* You must **Activate** the **Incoming Webhook** *Feature* if not already.
* On this same configuration screen, you can create a webhook and assign it to a channel/user.
Regardless of what option you choose (above), both will result in giving you a webhook URL that looks something like this:
`https://hooks.slack.com/services/T1JJ3T3L2/A1BRTD4JD/TIiajkdnlazkcOXrIdevi7F`
This URL effectively equates to:
`https://hooks.slack.com/services/{tokenA}/{tokenB}/{tokenC}`
**Note:** Apprise supports this URL *as-is* (*as of v0.7.7*); you no longer need to parse the URL any further. However there is slightly less overhead (internally) if you do.
If you want to convert this to an Apprise URL, do the following:
The last part of the URL you’re given make up the 3 tokens you need to send notifications with It’s very important to pay attention. In the above example the tokens are as follows:
1. **TokenA** is `T1JJ3T3L2`
2. **TokenB** is `A1BRTD4JD`
3. **TokenC** is `TIiajkdnlazkcOXrIdevi7F8`
### Method 2: Create a Bot
[Section titled “Method 2: Create a Bot”](#method-2-create-a-bot)
Bots offer you slightly more flexibility then Webhooks do. The main difference is *Slack Bots* can support attachments allowing you to leverage this in Apprise!
1. First create your [Slack App here](https://api.slack.com/apps?new_app=1).
2. Pick an App Name (such as *Apprise*) and select your workspace; click on the **Create App**
3. You’ll be able to click on **Bots** menu selection from here where you can then choose to add a **Bot User**. Give it a name and then choose \**Add Bot User*.
4. You’ll need to provide the proper OAuth permissions:
5. Now choose **Install App** to which you can choose **Install App to Workspace**.
6. You will need to authorize the app which you get prompted to do; so this step is easy.
7. Finally you’ll get some very important information you will need for Apprise. From this point on you can either used the **OAuth Access Token** or the **Bot User OAuth Access Token** using the syntax `slack://{OAuth Access Token}`.
Your Apprise Slack URL (for accessing your Bot) might look something like:
* `slack://xoxp-1234-1234-1234-4ddbc191d40ee098cbaae6f3523ada2d`
* `slack://xoxb-1234-1234-4ddbc191d40ee098cbaae6f3523ada2d`
Both OAuth tokens you are provided have the ability to post text to channels and provide attachments. So it’s up to you which of the two you choose to use.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `slack://{tokenA}/{tokenB}/{tokenC}`
* `https://hooks.slack.com/services/{tokenA}/{tokenB}/{tokenC}`
* `slack://{OAuthToken}/`
* A Bot has no default channel configurable through Slack like Webhooks do. If no channel is specified, then the channel `#general` is used.
Now if you’re using the legacy webhook method (and not going through the App), you’re granted a bit more freedom. As a result, the following URLs will also work for you through Apprise:
* `slack://{tokenA}/{tokenB}/{tokenC}/#{channel}`
* `slack://{tokenA}/{tokenB}/{tokenC}/#{channel1}/#{channel2}/#{channelN}`
* `slack://{OAuthToken}/#{channel}`
* `slack://{botname}@{OAuthToken}/#{channel1}/#{channel2}/#{channelN}`
If you know the *Encoded-ID* of the channel you wish to access, you can use the plus (+) symbol to identify these separately from channels in the url. Valid syntax is as follows:
* `slack://{botname}@{tokenA}/{tokenB}/{tokenC}/+{encoded\_id}`
* `slack://{botname}@{tokenA}/{tokenB}/{tokenC}/+{encoded\_id1}/+{encoded\_id2}/+{encoded\_id3}`
* `slack://{botname}@{OAuthToken}/+{encoded\_id}`
* `slack://{botname}@{OAuthToken}/+{encoded\_id1}/+{encoded\_id2}/+{encoded\_id3}`
If you know the user\_id you wish to transmit your slack notification to (instead of a channel), you can use the at symbol (@) to do this with. Valid syntax is as follows:
* `slack://{botname}@{tokenA}/{tokenB}/{tokenC}/@{user\_id}`
* `slack://{botname}@{tokenA}/{tokenB}/{tokenC}/@{user\_id1}/@{user\_id2}/@{user\_id3}`
* `slack://{botname}@{OAuthToken}/@{user\_id}`
* `slack://{botname}@{OAuthToken}/@{user\_id1}/@{user\_id2}/@{user\_id3}`
You can freely mix and match all of the combinations in any order as well:
* `slack://\*\*{botname}@{tokenA}/{tokenB}/{tokenC}/@{user\_id}/#{channel}/+{encoded\_id}`
* `slack://{botname}@{OAuthToken}/@{user\_id}/#{channel}/+{encoded\_id}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|tokenA|Yes|The first part of 3 tokens provided to you after creating a *incoming-webhook*. The OAuthToken is not required if using the Slack Webhook.|
|tokenB|Yes|The second part of 3 tokens provided to you after creating a *incoming-webhook*. The OAuthToken is not required if using the Slack Webhook.|
|tokenC|Yes|The last part of 3 tokens provided to you after creating a *incoming-webhook*. The OAuthToken is not required if using the Slack Webhook.|
|OAuthToken|Yes|The OAuth Token provided to you through the Slack App when using a a *Bot* instead of a Webhook. Token A, B and C are not used when using Bots.|
|channel|No|Channels must be prefixed with a hash tag **#**! You can specify as many channels as you want by delimiting each of them by a forward slash (/) in the url.|
|encoded\_id|No|Slack allows you to represent channels and private channels by an *encoded\_id*. If you know what they are, you can use this instead of the channel to send your notifications to. All encoded\_id’s must be prefixed with a plus symbol **+**!|
|user\_id|No|Users must be prefixed with an at symbol **@**! You can specify as many users as you want by delimiting each of them by a forward slash (/) in the url.|
|botname|No|Identify the name of the bot that should issue the message. If one isn’t specified then the default is to just use your account (associated with the *incoming-webhook*).|
|footer|No|Identify whether or not you want the Apprise Footer icon to show with each message. By default this is set to **yes**.|
|image|No|Identify whether or not you want the Apprise image (showing status color) to display with every message or not. By default this is set to **yes**.|
|mode|No|Optionally enforce the mode the Slack plugin should operate in. This is detected by default, but possible options are `hook` (webhook mode) `gov-hook` (government webhook mode), and `bot` to have the service interact through the slack bot api|
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
Send a Slack notification to the channel `#nuxref`:
Terminal window
```
`
# Assuming our {tokenA} is T1JJ3T3L2
# Assuming our {tokenB} is A1BRTD4JD
# Assuming our {tokenC} is TIiajkdnlazkcOXrIdevi7F
# our channel nuxref is represented by #nuxref
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
slack:///T1JJ3T3L2/A1BRTD4JD/TIiajkdnlazkcOXrIdevi7F/#nuxref
`
```
Alternatively, if you’re using the Bot; a Slack notification sent to the channel `#general` might look like this:
Terminal window
```
`
# Assuming our {OAuthToken} is xoxb-1234-1234-4ddbc191d40ee098cbaae6f3523ada2d
# our channel general is represented by #general
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
slack://xoxb-1234-1234-4ddbc191d40ee098cbaae6f3523ada2d/#general
`
```
Perhaps you want to disable the footer, you can do so like so:
Terminal window
```
`
# Assuming our {OAuthToken} is xoxb-1234-1234-4ddbc191d40ee098cbaae6f3523ada2d
# we want to send it to our #general channel; %23 is the encoded way of representing the #
# we set footer to no as well
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
slack://xoxb-1234-1234-4ddbc191d40ee098cbaae6f3523ada2d/%23general?footer=no
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