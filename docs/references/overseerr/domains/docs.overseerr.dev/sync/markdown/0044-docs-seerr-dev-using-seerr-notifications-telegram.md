Telegram | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
info
Users can optionally configure personal notifications in their user settings.
User notifications are separate from system notifications, and the available notification types are dependent on user permissions.
## Configuration[​](#configuration)
info
In order to configure Telegram notifications, you first need to [create a bot](https://telegram.me/BotFather).
Bots **cannot** initiate conversations with users, so users must have your bot added to a conversation in order to receive notifications.
### Bot Username (optional)[​](#bot-username-optional)
If this value is configured, users will be able to click a link to start a chat with your bot and configure their own personal notifications.
The bot username should end with `\_bot`, and the `@` prefix should be omitted.
### Bot Authentication Token[​](#bot-authentication-token)
At the end of the bot creation process, [@BotFather](https://telegram.me/botfather) will provide an authentication token.
### Chat ID[​](#chat-id)
To obtain your chat ID, simply create a new group chat, add [@get\_id\_bot](https://telegram.me/get_id_bot), and issue the `/my\_id` command.
### Send Silently (optional)[​](#send-silently-optional)
Optionally, notifications can be sent silently. Silent notifications send messages without notification sounds.
* [Configuration](#configuration)
* [Bot Username (optional)](#bot-username-optional)
* [Bot Authentication Token](#bot-authentication-token)
* [Chat ID](#chat-id)
* [Send Silently (optional)](#send-silently-optional)