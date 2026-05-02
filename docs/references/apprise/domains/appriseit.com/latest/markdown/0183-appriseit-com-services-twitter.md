X (Formerly Twitter) Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# X (Formerly Twitter) Notifications
## Overview
* **Source:** [https://x.com/](https://x.com/)
* **Image Support:** No
* **Attachment Support:** Yes
* **Message Character Limits:**
* Private Message: 25000
* Tweet: 280
* [ Build Your Apprise URL](/url-builder/?schema=x)
## Account Setup
[Section titled “Account Setup”](#account-setup)
You need to register to X developer account at [developer.x.com](https://developer.x.com/en).
X Direct Messages are slightly more complicated then some of the other notification services, so here is quick breakdown of what you need to know and do in order to send Notifications through it using this tool:
### If there are Project and App
[Section titled “If there are Project and App”](#if-there-are-project-and-app)
When you registered to X developer account, you may have already created a default project and app. You can use this app and it’s through an X App we will be able to send our DMs.
1. First off, you’ll need to **regenerate the API Keys**. This is done by accessing the app name under **Projects & Apps** (on left menu), then under the **Consumer Keys** from the “*Keys and tokens*” Tab. Once generated, copy it to a safe place. This is **Consumer Keys**.
2. Next, grant the appropriate access permissions so that you can post or send DMs. After clicking on the app name under **Projects & Apps** (on left menu), click on **Set up** under the **User authentication settings** section.
On the **User authentication settings** page, set the following
* **App permissions**
Select **Read and write** if you want to post only. If you want to send DMs, select **Read and write and Direct message**.
* **Type of App**
Select **Web App, Automated App or Bot**
* **App info**
Enter any URL for **Callback URI / Redirect URL** and **Website URL**. If you are using Apprise to send posts or DMs, it doesn’t matter what you enter.
Once you entered them all, click **Save**.
* Lastly, you’ll need to **regenerate the Access Tokens**. This is done under the **Authentication Tokens** from the “*Keys and tokens*” Tab. Once generated, copy it to a safe place.
### If there is no Project and App
[Section titled “If there is no Project and App”](#if-there-is-no-project-and-app)
1. First off, you need to create a project and an X App (not Standalone apps) from [developer.x.com](https://developer.x.com/en/portal/projects-and-apps). It’s through an X App we will be able to send our DMs.
X asks you to justify why you need it as long as you specify the purpose of your app in detail.
2. Once you created the app, you’ll see the **API Tokens** on the screen, so copy it to a safe place. This is **Consumer Keys**.
3. Next, grant the appropriate access permissions so that you can post or send DMs. After clicking on the app name under **Projects & Apps** (on left menu), click on **Set up** under the **User authentication settings** section.
On the **User authentication settings** page, set the following
* **App permissions**
Select **Read and write** if you want to post only. If you want to send DMs, select **Read and write and Direct message**.
* **Type of App**
Select **Web App, Automated App or Bot**
* **App info**
Enter any URL for **Callback URI / Redirect URL** and **Website URL**. If you are using Apprise to send posts or DMs, it doesn’t matter what you enter.
Once you entered them all, click **Save**.
* Lastly, you’ll need to **generate the Access Tokens**. This is done under the **Authentication Tokens** from the “*Keys and tokens*” Tab. Once generated, copy it to a safe place.
You should now have the following 4 tokens ready to use.
* A Consumer Key (An API Key)
* A Consumer Secret (An API Secret)
* An Access Token
* An Access Token Secret
From here you’re ready to go. You can post public posts or simply create DMs through the use of the `mode=` variable. By default Direct Messaging (DM) is used.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows (`x://`, `twitter://`, and `tweet://` are all accepted aliases):
* `x://{ConsumerKey}/{ConsumerSecret}/{AccessToken}/{AccessSecret}`
* `x://{ScreenName}@{ConsumerKey}/{ConsumerSecret}/{AccessToken}/{AccessSecret}`
If you know the targets you wish to identify; they can be targeted by their X Screen Name:
* `x://{ConsumerKey}/{ConsumerSecret}/{AccessToken}/{AccessSecret}/{ScreenName}`
* `x://{ConsumerKey}/{ConsumerSecret}/{AccessToken}/{AccessSecret}/{ScreenName1}/{ScreenName2}/{ScreenNameN}`
>
> [!NOTE]If no ScreenName is specified, then by default the Direct Message is sent to your own account.
>
A Public post can be referenced like so:
* `x://{ConsumerKey}/{ConsumerSecret}/{AccessToken}/{AccessSecret}?mode=tweet`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|ScreenName|Yes|The UserID of your account such as *l2gnux* (if your id is @l2gnux). You must specify a `{userid}`*or* an `{ownerid}`.|
|ConsumerKey|Yes|The Consumer Key (API Key)|
|ConsumerSecret|Yes|The Consumer Secret Key (API Secret Key)|
|AccessToken|Yes|The Access Token; you would have had to generate this one from your X App Configuration.|
|AccessSecret|Yes|The Access Secret; you would have had to generate this one from your X App Configuration.|
|Mode|No|The X mode you want to operate in. Possible values are `dm` (for Private Direct Messages) and `tweet` to make a public post. By default this is set to `dm`|
|batch|No|By default images are batched together. However if you want your attachments to be posted 1 post per attachment, set this to False.|
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
Send a X DM to @testaccount:
Terminal window
```
`
# Assuming our {ConsumerKey} is T1JJ3T3L2
# Assuming our {ConsumerSecret} is A1BRTD4JD
# Assuming our {AccessToken} is TIiajkdnlazkcOXrIdevi7F
# Assuming our {AccessSecret} is FDVJaj4jcl8chG3
# our user is @testaccount
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
twitter://testaccount@T1JJ3T3L2/A1BRTD4JD/TIiajkdnlazkcOXrIdevi7F/FDVJaj4jcl8chG3
`
```
Or
Terminal window
```
`
# Assuming our {ConsumerKey} is T1JJ3T3L2
# Assuming our {ConsumerSecret} is A1BRTD4JD
# Assuming our {AccessToken} is TIiajkdnlazkcOXrIdevi7F
# Assuming our {AccessSecret} is FDVJaj4jcl8chG3
# our user is @testaccount
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
x://testaccount@T1JJ3T3L2/A1BRTD4JD/TIiajkdnlazkcOXrIdevi7F/FDVJaj4jcl8chG3
`
```
Send a public post:
Terminal window
```
`
# Assuming our {ConsumerKey} is T1JJ3T3L2
# Assuming our {ConsumerSecret} is A1BRTD4JD
# Assuming our {AccessToken} is TIiajkdnlazkcOXrIdevi7F
# Assuming our {AccessSecret} is FDVJaj4jcl8chG3
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
twitter://testaccount@T1JJ3T3L2/A1BRTD4JD/TIiajkdnlazkcOXrIdevi7F/FDVJaj4jcl8chG3?mode=tweet
`
```
Or
Terminal window
```
`
# Assuming our {ConsumerKey} is T1JJ3T3L2
# Assuming our {ConsumerSecret} is A1BRTD4JD
# Assuming our {AccessToken} is TIiajkdnlazkcOXrIdevi7F
# Assuming our {AccessSecret} is FDVJaj4jcl8chG3
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
x://testaccount@T1JJ3T3L2/A1BRTD4JD/TIiajkdnlazkcOXrIdevi7F/FDVJaj4jcl8chG3?mode=tweet
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