Mastodon Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Mastodon Notifications
## Overview
* **Source:** [https://joinmastodon.org](https://joinmastodon.org)
* **Image Support:** No
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 500
* [ Build Your Apprise URL](/url-builder/?schema=mastodon)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Sign up for any Mastodon based service. [Here are a few you can choose from today](https://joinmastodon.org/servers).
In the **Settings** of your account, you can access the **Development** tab and create an **Application**. This is what Apprise will use to send your notifications.
At the bare minimum you need to grant the following scopes on your application:
* `write:statuses`: So Apprise can post a message
* `write:media`: So Apprise can send an attachment
* `read:accounts`: If you want to be able to send a DM to yourself
**Note**: If you change/add/remove scope entries associated with your Mastodon Application, you **MUST** regenerate your **Access Token** or your app will not take in effect the scope changes.
After you create your Application, revisit its configuration as it will now provide you with a `key`, `secret`, and `access\_token`. You ONLY need the **Access Token** to have Apprise work.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `mastodon://{token}@{host}`
* `mastodons://{token}@{host}`
* `toot://{token}@{host}`
* `toots://{token}@{host}`
* `mastodon://{token}@{host}/{targets}`
* `mastodons://{token}@{host}/{targets}`
* `toot://{token}@{host}/{targets}`
* `toots://{token}@{host}/{targets}`
Simply use `mastodon://` or `toot://` if access in an insecure server and `mastodons://` or `toots://` if accessing a secure one (https).
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|token|Yes|The Access Token associated with the Application you created (in Mastodon’s Account Settings). Your token MUST have at the bare minimum `write:statuses` access. Additionally provide `write:media` if you intend to provide attachments.|
|visibility|No|The Mastodon visibility you want to operate in. Possible values are
`direct` for Private Direct Messages)
`private` for posts that will be visible only to followers
`unlisted` for posts that will be public but not appear on the public timeline
`public` for public posts
`default` for post visibility based on the accounts *default-visiblity* setting.
By default if `toot://` is used, it is presumed you want a public post (unless you explicitly specify the `visibility=` flag. However if you use `mastodon://` then your post by default will take on the *default-visibility* associated with your account unless explicitly over-ridden here with the `visibility=`.|
|batch|No|By default images are batched together. However if you want your attachments to be posted 1 toot per attachment, set this to False.|
|sensitive|No|If this is set to `Yes` then any attachments provided will be marked as sensitive. By default this is set to `No`|
|spoiler|No|Optionally provide *spoiler text* that should be associated with the status message posted.|
|language|No|Optionally provide a ISO 639 language code with your status post. E.g. `en`, `fr`, etc.|
|key|No|Prevent duplicate submissions of the same status. Idempotency keys are stored for up to 1 hour, and can be any arbitrary string. Consider using a hash or UUID generated client-side.|
|ping|No|Optionally append one or more Mastodon mentions or hashtags to the status. Mentions must begin with `@` (for example `@caronc` or `@alice@example.com`) and hashtags must begin with `#` (for example `#apprise`). Bare values such as `apprise` are ignored to avoid ambiguity.|
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
### Mentions and Hashtags
[Section titled “Mentions and Hashtags”](#mentions-and-hashtags)
Mastodon resolves mentions and hashtags from the final status text. You can include them directly in the message body, provide path entries, or use `ping=` to append fixed mentions and hashtags from the Apprise URL.
User and hashtag path entries are preserved when the URL is rebuilt. Since `#` has special meaning in URLs, rebuilt URLs encode hashtag path entries as `%23tag`. Path entries and `ping=` entries are appended to the final status text when they are not already present, including when sending plain text.
The `ping=` value accepts comma, space, semicolon, slash, or pipe separated entries. Mention entries must start with `@`, and hashtag entries must start with `#`:
* `ping=@caronc` appends `@caronc`
* `ping=@alice@example.com` appends `@alice@example.com`
* `ping=#apprise,#notifications` appends `#apprise #notifications`
* `/@caronc/%23apprise` appends `@caronc #apprise`
* `/%23apprise/%23notifications` appends `#apprise #notifications`
Bare values such as `ping=apprise` are ignored because they do not identify whether the value is intended to be a mention or a hashtag. Duplicate entries from the message body, hashtag path entries, and `ping=` are collapsed in the final status text. Hashtags must contain at least one non-numeric character.
### Smart Processing
[Section titled “Smart Processing”](#smart-processing)
With Mastodon, routing of `direct` messages entirely depends on the `@users` identified in the message body. For this reason it’s possible to post a status message like:
Terminal window
```
`
apprise -b "Hey guys, this message was sent from Apprise" \\
"mastodon://accesskey/host/@caronc?visibility=direct"
`
```
This will cause the message body to be created as
```
`
Hey guys, this message was sent from Apprise @caronc
`
```
It’s important to state that if you identify `/@users` entries on your Apprise URL, they will be appended into the message so they are notified. However, that said, if you prepare a URL for `direct` visibility and do not provide a user. Apprise will look up your own credentials automatically and send the message to yourself.
Terminal window
```
`
# Here is an example where we're specifying a `direct` message
# as our intentions are to create a DM. This will cause Apprise to look
# ourselves up and notify our own account. You MUST have the
# 'read:accounts' scope enabled on your Mastodon application or this
# will not work.
#
# Also consider there is overhead with this call as it requires an
# extra hit on the website to get your data. For efficiency, it's
# ideal that you specify your @user if this is your intention.
apprise -b "Hey guys, this message was sent from Apprise" \\
"mastodon://accesskey/host/?visibility=direct"
`
```
Apprise is also smart enough to pre-scan the message being posted and if it finds a `@user` identified in the body that is also identified in the URL, it will NOT be added to the end of the body. Hence; consider a status message that reads:
Terminal window
```
`
apprise -b "Hey @caronc, Thanks for showing me the Apprise plugin!" \\
"mastodon://accesskey/host/@caronc?visibility=direct"
`
```
In the above case, `@caronc` is identified as both a target to be delivered to AND also already exists in the status message being sent. As a result, no `@caronc` will be appended at the end and the message will be sent as is.
```
`
Hey @caronc, Thanks for showing me the Apprise plugin!
`
```
Let’s do one more example just to show other cases:
Consider the following:
Terminal window
```
`
apprise -b "Hey @caronc, Thanks for showing me the Apprise plugin!" \\
"mastodon://accesskey/host/@caronc/@joe/@sam?visibility=direct"
`
```
The following has 3 people set up as targets, but it has already identified 1 of them in the message. The other 2 are automatically appended to the end of your status message:
```
`
Hey @caronc, Thanks for showing me the Apprise plugin! @joe @sam
`
```
## Examples
[Section titled “Examples”](#examples)
Send a Mastodon toot:
Terminal window
```
`
# Assuming our {AccessKey} is T1JJ3T3L2
# Assuming our {Host} is noc.social
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"mastodons://T1JJ3T3L2@noc.social"
`
```
Send a Mastodon toot with path entries:
Terminal window
```
`
# Assuming our {AccessKey} is T1JJ3T3L2
# Assuming our {Host} is noc.social
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"mastodons://T1JJ3T3L2@noc.social/@caronc/%23apprise"
`
```
Send a Mastodon toot with fixed pings appended:
Terminal window
```
`
# Assuming our {AccessKey} is T1JJ3T3L2
# Assuming our {Host} is noc.social
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"mastodons://T1JJ3T3L2@noc.social?ping=#apprise,#notifications"
`
```
Send a Mastodon DM to `@testaccount`:
Terminal window
```
`
# Assuming our {AccessKey} is T1JJ3T3L2
# Assuming our {Host} is noc.social
# our user is @testaccount
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"mastodons://T1JJ3T3L2@noc.social/@testaccount?visibility=direct"
`
```
Send a Mastodon DM to ourselves using the built in smart-detection:
Terminal window
```
`
# Assuming our {AccessKey} is T1JJ3T3L2
# Assuming our {Host} is noc.social
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"mastodons://T1JJ3T3L2@noc.social/?visibility=direct"
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