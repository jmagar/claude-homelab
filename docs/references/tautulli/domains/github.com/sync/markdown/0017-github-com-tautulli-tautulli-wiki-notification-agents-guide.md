Notification Agents Guide · Tautulli/Tautulli Wiki · GitHub
[Skip to content](#start-of-content)
{{ message }}
[
Tautulli
](/Tautulli)
/
**
[Tautulli](/Tautulli/Tautulli)
**
Public
*
* [ Notifications
](/login?return_to=/Tautulli/Tautulli) You must be signed in to change notification settings
* [ Fork
623
](/login?return_to=/Tautulli/Tautulli)
*
[
Star
6.5k
](/login?return_to=/Tautulli/Tautulli)
# Notification Agents Guide
[Jump to bottom](#wiki-pages-box)
JonnyWong16 edited this page Sep 22, 2024
&middot;
[53 revisions](/Tautulli/Tautulli/wiki/Notification-Agents-Guide/_history)
### Notification Agents:
[](#notification-agents)
* [Notification Agents:](#notification-agents)
* [Browser](#browser)
* [Boxcar](#boxcar)
* [Discord](#discord)
* [Email](#email)
* [Gmail](#gmail)
* [Outlook.com](#outlookcom)
* [Facebook](#facebook)
* [Gotify](#gotify)
* [GroupMe](#groupme)
* [Growl](#growl)
* [Hipchat](#hipchat)
* [IFTTT](#ifttt)
* [Join](#join)
* [Kodi](#kodi)
* [macOS Notification Center](#macos-notification-center)
* [Microsoft Teams](#microsoft-teams)
* [MQTT](#mqtt)
* [Notify My Android](#notify-my-android)
* [Plex Home Theater](#plex-home-theater)
* [Plex Android / iOS App](#plex-android--ios-app)
* [Prowl](#prowl)
* [Pushbullet](#pushbullet)
* [Pushover](#pushover)
* [Script](#script)
* [Slack](#slack)
* [Tautulli Remote Android App](#tautulli-remote-android-app)
* [Telegram](#telegram)
* [Twitter](#twitter)
* [Webhook](#webhook)
* [Zapier](#zapier)
### Browser
[](#browser)
1. Click on `Allow Notifications` and give permission for Tautulli to send notifications through your browser.
### Boxcar
[](#boxcar)
1. Go to the Settings page in your Boxcar app.
2. Copy the **Access Token** and fill in the Tautulli setting.
### Discord
[](#discord)
1. Go to Discord, and click on **Edit Channel** for the channel where you want the notifications to be sent.
2. Go to the **Webhooks** tab and click on **Create Webhook**.
3. Give your webhook bot a **Name** and **Icon**. This can be changed in the Tautulli settings instead if you wish.
4. Copy the **Webhook URL** and fill in the Tautulli setting.
### Email
[](#email)
* **Note:** Some anti-virus software have "Email protection" which may prevent sending emails via SMTP from a script. This will either need to be disabled or add an exception for Tautulli to send emails.
#### Gmail
[](#gmail)
* **Note:** All Google accounts require an [app specific password](https://security.google.com/settings/security/apppasswords).
```
`SMTP Server: smtp.gmail.com
SMTP Port: 587 or 465
SMTP User: YourEmail@gmail.com or Username
SMTP Password: Your Google app password
Encryption: TLS/STARTTLS (587) or SSL/TLS (465)
`
```
#### Outlook.com
[](#outlookcom)
* **Note:** All Outlook accounts require an [app specific password](https://account.live.com/proofs/AppPassword).
```
`SMTP Server: smtp.office365.com
SMTP Port: 587
SMTP User: YourEmail@outlook.com
SMTP Password: Your Outlook app password
Encryption: TLS/STARTTLS (587)
`
```
### Facebook
[](#facebook)
Facebook has blocked all non-approved applications from posting to a group programmatically. Although Tautulli shouldn't be against their terms, they are refusing to approve any app that can do this.
There only currently known workaround is that Zapier also allows posting to Facebook, see [their agent guide](Notification-Agents-Guide#zapier) for how to set this up. See [here](https://i.imgur.com/rcWtoZk.png) for an example Facebook configuration within Zapier.
Old, non-working instructions
[This script](https://gist.github.com/spuniun/56624e1464c621c91e52f88e03321582) by [@spuniun](https://github.com/spuniun) could be used to post directly, however, Facebook has started banning accounts using it so it has been removed from the recommended methods. See the [Custom Scripts](Custom-Scripts) page for help setting it up.
**Note:** Facebook has [redone their app approval process](https://developers.facebook.com/blog/post/2018/05/01/enhanced-developer-app-review-and-graph-api-3.0-now-live/), as such **all** apps *must* go through the approval process fully before they will work again. To work around this you can send notifications via email to the group's secret email address from an account that is in the group.
**Note:** As of March 2018, all new Facebook apps require HTTPS for authorization. If Tautulli is not running with HTTPS, the easiest method would be to check "Enable HTTPS" under the Web Interface tab (show advanced). This can be disabled after authorizing with Facebook.
1. Go to [Facebook Developers](https://developers.facebook.com/apps) and click `Add a New App`.
2. Click Add Product on the left, then click `Set Up` for Facebook Login.
3. Skip the Quickstart and go to Facebook Login \> Settings on the left, and fill in the **Valid OAuth redirect URIs** with the one provided by Tautulli.
4. Go to Settings \> Basic on the left, and fill in a **Privacy Policy URL**.
5. On the same page, get your **App ID** and **App Secret** and fill in the respective Tautulli settings.
6. Go to App Review on the left, and toggle your app to toggle "Make Public" to `Yes`.
7. Click the `Request Authorization` button in Tautulli to allow it to access your Facebook account. Make sure the app visibility is set to `Public` or `Friends` (`Only Me` will not work).
8. Copy the **Access Token** and fill in the Tautulli setting if it is not filled in automatically.
9. Get your **Group ID** from the URL of your group page (e.g. `https://www.facebook.com/groups/\<GROUP\_ID\>`) and fill in the Tautulli setting. If you have customized the URL and no longer have easy access to the Group ID, see [this answer](https://stackoverflow.com/questions/8957340/how-do-i-find-my-facebook-group-id) for how to obtain it. *Note:* You should *only* put the ID in the setting for Tautulli, not the full URL.
### Gotify
[](#gotify)
1. Go to your Gotify server and click **Apps** at the top.
2. Click `Create Application`.
3. Give your application a **Name** and click `Create`.
4. Copy the **App Token** and fill in the Tautulli setting.
### GroupMe
[](#groupme)
1. Go to [GroupMe Developers](https://dev.groupme.com) and click **Access Token** at the top. Copy the token and fill in the Tautulli setting.
2. Go to the **Bots** tab at the top and click **Create Bot**.
3. Select the group chat where you want the notifications to be sent, give your bot a **Name** and **Avatar**, and click `Submit`. All other fields can be left at their default values.
4. Copy the **Bot ID** and fill in the Tautulli setting.
### Growl
[](#growl)
1. Open Growl and go to the General tab to make sure Growl is turned `On` and running.
2. Optional: Go to the Security tab to set up a **Password**. Check "Allow network notifications" if Growl is running on a separate machine than Tautulli.
3. Fill in the **Host** for the machine running Growl (e.g. `localhost` or `192.168.0.100`) in the Tautulli settings.
4. Fill in the **Password**, if required, in the Tautulli settings.
### Hipchat
[](#hipchat)
1. Go to [Hipchat Integrations](https://www.hipchat.com/addons/), select the room where you want the notifications to be sent, and click **Build your own integration**.
2. Give your integration a **Name** and click `Create`.
3. Copy the **Integration URL** and fill in the Tautulli setting.
### IFTTT
[](#ifttt)
1. Go to IFTTT and set up your [Webhooks](https://ifttt.com/maker_webhooks) service.
2. Click on **Documentation** to get your **Webhook Key** and fill in the Tautulli setting.
3. Create a [New Applet](https://ifttt.com/create), with "this" as "Webhooks", and the trigger "Receive a web request".
4. Fill in the **Event Name** with the one that matches the Tautulli setting.
* **Tip:** You can create different IFTTT events (e.g. `tautulli\_play`, `tautulli\_stop`, `tautulli\_created`, etc.) by adding `{action}` to the Event Name in Tautulli (e.g. `tautulli\_{action}`).
* Select "that" as whichever service you want.
* Fill in the settings of your service by adding the ingredients `Value1`, `Value2`, and `Value3`.
* `Value1` will be the subject line in your notification text settings.
* `Value2` will be the body text in your notification text settings.
* (Optional) `Value3` can be anything you select (e.g. Poster URL).
### Join
[](#join)
1. Go to [Join App](https://joinjoaomgcd.appspot.com), and click on `Join API`, then `Show`.
2. Copy the **API Key** and fill in the Tautulli setting.
### Kodi
[](#kodi)
1. From within Kodi, go to Settings \> Service settings \> Control, and make sure "Allow remote control via HTTP" is checked.
2. Optional: Set the **Port**, **Username**, and **Password** for the Kodi Webserver. The default port is `8080`.
3. Enter in the **Host Address** for the machine running Kodi (e.g. `http://localhost:8080`) in the Tautulli settings.
4. Fill in the **Username** and **Password**, if required, in the Tautulli settings.
### macOS Notification Center
[](#macos-notification-center)
**Note:** macOS Notification Center notifications will only work on the machine where Tautulli is installed.
1. Fill in the path to your Tautulli application. The default is `/Applications/Tautulli`.
2. Click the `Register App` button to register Tautulli with the Notification Center.
### Microsoft Teams
[](#microsoft-teams)
1. In the channel where you want the notifications to be sent, click the overflow menu (`...`), select **Connectors**, and add a new **Incoming Webhook** connector.
2. Configure a new incoming webhook, give it a name and image, and click `Create`.
3. Copy the **Webhook URL** and fill in the Tautulli setting.
### MQTT
[](#mqtt)
1. Fill in the settings from your MQTT broker.
### Notify My Android
[](#notify-my-android)
1. Go to [Notify My Android](https://notifymyandroid.appspot.com/account.jsp) and click `Generate New Key`.
2. Copy the **API Key** and fill in the Tautulli setting.
### Plex Home Theater
[](#plex-home-theater)
**Note:** Plex Home Theater notifications only work with [OpenPHT](https://forums.plex.tv/discussion/264209/release-openpht-1-8-0/p1) or [RasPlex](https://forums.plex.tv/discussion/264208/release-rasplex-1-8-0/p1).
1. From within OpenPHT/RasPlex, go to Preferences \> System \> Services, and make sure "Allow remote control via HTTP" is checked.
2. Enter in the **Host Address** for the machine running OpenPHT or RasPlex with the port `3005` (e.g. `http://localhost:3005`).
3. Fill in the **Username** and **Password**, if required, in the Tautulli settings.
### Plex Android / iOS App
[](#plex-android--ios-app)
**Note:** Plex Pass is required to send notifications to the Plex mobile apps.
1. Open the Plex Android or iOS app, go to Settings \> Notifications and enable the following notifications matching the triggers in the Tautulli notification agent:
1. **New Content Added to Library** - Tautulli trigger: Recently Added
* Note: Make sure to *uncheck* all libraries for the server connected to Tautulli.
* **Playback Started** - Tautulli trigger: Playback Start
* Note: Make sure to *uncheck* the server and all users connected to Tautulli.
* **New Devices** - Tautulli trigger: User New Device
* Note: Make sure to *uncheck* the server connected to Tautulli.
* Send a Test Notification from Tautulli and you should receive one test notification *for each notification* you have enabled in the Plex App.
**Note:** The user(s) receiving the notifications must have notifications enabled for the matching Tautulli triggers in their Plex mobile app.
**Note:** The user(s) must *uncheck* all the servers, libraries, and users connected to Tautulli in the Plex mobile app settings otherwise they may receive duplicate notifications from Plex and Tautulli. Use the [custom notification agent conditions](Custom-Notification-Conditions) in Tautulli to filter the notifications instead.
**Note:** Push notifications do not need to be enabled in your Plex server Settings \> General page. However, you may leave it enabled to receive the other notifications types from Plex (new server shared with you, new item on deck, database corruption detected, database backed up, etc.).
### Prowl
[](#prowl)
1. Go to [Prowl](https://www.prowlapp.com/api_settings.php), and generate a new API key by clicking `Generate Key`.
2. Copy the **API Key** and fill in the Tautulli Setting.
### Pushbullet
[](#pushbullet)
1. Go to [Pushbullet Account Settings](https://www.pushbullet.com/#settings/account), and click `Create Access Token`.
2. Copy the **Access Token** and fill in the Tautulli Setting.
### Pushover
[](#pushover)
1. Go to Pushover, and [Create a New Application](https://pushover.net/apps/build).
2. Give your application a **Name** and **Icon**, and click `Create Application`.
3. Copy the **API Token** and fill in the Tautulli Setting.
4. Go back to the [Pushover homepage](https://pushover.net).
* If you want to send notifications to yourself, copy your **User Key** and fill in the Tautulli setting.
* If you want to send notifications to a group, go to [Create a New Group](https://pushover.net/groups/build). Copy the **Group Key** and fill in the Tautulli setting.
### Script
[](#script)
* Please see the [Custom Scripts Wiki Page](/Tautulli/Tautulli/wiki/Custom-Scripts).
### Slack
[](#slack)
1. Go to Slack, and create a new [Incoming Webhook](https://my.slack.com/services/new/incoming-webhook).
2. Select the slack channel where you want the notifications to be sent, and click `Add Incoming Webhooks` integration.
3. Copy your **Webhook URL** and fill in the Tautulli setting.
4. Scroll down to Integration Settings, and give your integration a **Name** and **Icon**. This can be changed in the Tautulli settings instead if you wish.
### Tautulli Remote Android App
[](#tautulli-remote-android-app)
* Please see the [Tautulli Remote Wiki](https://github.com/Tautulli/Tautulli-Remote/wiki/Registering-a-Tautulli-server) on how to register your [Tautulli Remote Android App](https://play.google.com/store/apps/details?id=com.tautulli.tautulli_remote).
### Telegram
[](#telegram)
1. Message [`@BotFather`](https://telegram.me/BotFather) on Telegram with the command `/newbot` to create a new bot.
2. Follow the instructions to give your bot a display name and a bot username.
3. Copy the **Bot Token** and fill in the Tautulli setting.
**Sending Messages to Yourself**
1. Create a new chat with your bot.
2. Message [`@myidbot`](https://telegram.me/myidbot) on Telegram with the command `/getid` to get your **Chat ID**.
3. Copy the **Chat ID** and fill in the Tautulli setting.
**Sending Messages to a Group**
1. Create a new group chat with your bot *in the group* and [`@myidbot`](https://telegram.me/myidbot).
2. Message [`@myidbot`](https://telegram.me/myidbot) in the group with the command `/getgroupid` to get your **Group ID**.
3. Copy the **Group ID** and fill in the Tautulli setting. Don't forget the hyphen (`-`) in the Group ID.
* For a group topic, append `/topicID` to the group ID (e.g. `-1000000000000/2`).
**Sending Messages to a Channel**
***Public Channel***
1. Create a new Public Channel in Telegram.
2. Fill in the Public Link to your channel. This is your channel username (e.g. `t.me/\<CHANNEL\_USERNAME\>`).
3. Go to Manage Channel and add your bot to the Administrators.
4. Copy the **Channel Username** and fill in the Tautulli setting. Don't forget the `@` sign (`@\<CHANNEL\_USERNAME\>`) in the Channel Username.
***Private Channel***
1. Create a new Private Channel in Telegram.
2. Go to Manage Channel and add your bot and [`@myidbot`](https://telegram.me/myidbot) to the Administrators.
3. Message [`@myidbot`](https://telegram.me/myidbot) in the channel with the command `/getgroupid` to get your **Channel ID**.
4. Copy the **Channel ID** and fill in the Tautulli setting. Don't forget the hyphen (`-`) in the Channel ID.
### Twitter
[](#twitter)
1. Go to [Twitter Apps](https://developer.twitter.com/apps) and click `Create New App`.
2. Give your app a **Name**, **Description**, and **Website**. A valid website is not required.
3. Go to the "Keys and Access Tokens" tab to get your **Consumer Key** and **Consumer Secret**, and fill in the respective Tautulli settings.
4. Click on `Create my access token` to get your **Access Token** and **Access Token Secret**, and fill in the respective Tautulli settings.
### Webhook
[](#webhook)
1. Find the **Webhook URL** for the service you are going to be using and fill in the Tautulli setting. Some examples:
* Discord: [Intro to Webhooks](https://support.discordapp.com/hc/en-us/articles/228383668-Intro-to-Webhooks)
* Slack: [Incoming Webhooks](https://api.slack.com/incoming-webhooks)
* Pick the appropriate HTTP request method for your **Webhook Method**. Generally, you want to select `POST` here.
* Customize the raw **JSON Data** sent to the webhook on the **Data** tab.
JSON Data Examples:
* [ntfy](../issues/2160#issuecomment-1741240302)
### Zapier
[](#zapier)
1. Go to Zapier and [`Make a Zap`](https://zapier.com/app/editor).
2. For "When this happens...", Choose App as "Webhooks by Zapier", and Choose Trigger as "Catch Hook", then click `Continue`.
3. Copy the **Custom Webhook URL** and fill in the Tautulli setting, then click `Continue` in Zapier.
4. Click `Test & Review` in Zapier, then click the `Send Test Data` button in Tautulli. A new hook will show up in Zapier with test data from Tautulli. Once everything is okay, click `Done Editing`.
5. For "Do this...", Choose App as whichever service you want, and follow the instructions to connect the service.
6. Set Up Template using the values `Body`, `Subject`, `Action`, `Provider Name`, `Provider Link`, `Plex URL`, and `Poster URL`. These values will all be filled in by Tatutulli.
7. Make sure your Zap is turned `on` in the top right.
* [Home](/Tautulli/Tautulli/wiki/Home)
* [Installation](/Tautulli/Tautulli/wiki/Installation)
* [Upgrading to Python 3 (Tautulli v2.5)](/Tautulli/Tautulli/wiki/Upgrading-to-Python-3-(Tautulli-v2.5))
* [Asking for Support](/Tautulli/Tautulli/wiki/Asking-for-Support)
* [Frequently Asked Questions](/Tautulli/Tautulli/wiki/Frequently-Asked-Questions)
* [Notification Agents Guide](/Tautulli/Tautulli/wiki/Notification-Agents-Guide)
* [Custom Notification Conditions](/Tautulli/Tautulli/wiki/Custom-Notification-Conditions)
* [Exporter Guide](/Tautulli/Tautulli/wiki/Exporter-Guide)
* [3rd Party APIs Guide](/Tautulli/Tautulli/wiki/3rd-Party-APIs-Guide)
* [Debugging](/Tautulli/Tautulli/wiki/Debugging)
* [Custom Scripts](/Tautulli/Tautulli/wiki/Custom-Scripts)
* [Tautulli API Reference](/Tautulli/Tautulli/wiki/Tautulli-API-Reference)
### Clone this wiki locally