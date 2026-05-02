Discord | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
The Discord notification agent enables you to post notifications to a channel in a server you manage.
info
Users can optionally opt-in to being mentioned in Discord notifications by configuring their [Discord user ID](https://support.discord.com/hc/en-us/articles/206346498-Where-can-I-find-my-User-Server-Message-ID-) in their user settings.
## Configuration[​](#configuration)
### Webhook URL[​](#webhook-url)
You can find the webhook URL in the Discord application, at **Server Settings → Integrations → Webhooks**.
### Notification Role ID (optional)[​](#notification-role-id-optional)
If a role ID is specified, it will be included in the webhook message. See [Discord role ID](https://support.discord.com/hc/en-us/articles/206346498-Where-can-I-find-my-User-Server-Message-ID).
### Bot Username (optional)[​](#bot-username-optional)
If you would like to override the name you configured for your bot in Discord, you may set this value to whatever you like!
### Bot Avatar URL (optional)[​](#bot-avatar-url-optional)
Similar to the bot username, you can override the avatar for your bot.
### Use Notification Recipient Locale[​](#use-notification-recipient-locale)
When enabled, notifications will be sent in the language of the user who triggered the notification (e.g., the user who made the request or reported the issue) based on their display language setting. When disabled, the **Notification Language** setting below is used instead.
### Notification Language[​](#notification-language)
Sets the language for all notifications sent to this Discord channel. This option is only available when **Use Notification Recipient Locale** is disabled.
* [Configuration](#configuration)
* [Webhook URL](#webhook-url)
* [Notification Role ID (optional)](#notification-role-id-optional)
* [Bot Username (optional)](#bot-username-optional)
* [Bot Avatar URL (optional)](#bot-avatar-url-optional)
* [Use Notification Recipient Locale](#use-notification-recipient-locale)
* [Notification Language](#notification-language)