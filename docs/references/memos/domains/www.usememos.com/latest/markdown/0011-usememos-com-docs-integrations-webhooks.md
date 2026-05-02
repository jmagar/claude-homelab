Webhooks - Memos
[Memos](/)
Search
⌘K
Documentation
[Documentation](/docs)
Getting Started
Deploy
Configuration
Usage
Operations
Development
Integrations
[Integrations](/docs/integrations)[RSS](/docs/integrations/rss)[Telegram Bot](/docs/integrations/telegram-bot)[Webhooks](/docs/integrations/webhooks)
Admin
Troubleshooting
[FAQ](/docs/faq)
[](https://github.com/usememos/memos)
Integrations
# Webhooks
Receive events when memos are created, updated, or deleted.
Memos can send webhooks when memos change. Webhooks are configured per user in the Settings page.
## [Events](#events)
Webhooks are dispatched on:
* Memo created
* Memo updated
* Memo deleted
## [Payload](#payload)
Memos sends a JSON payload with the event type and memo data. The exact schema is versioned with the API.
Refer to the [API reference](/docs/api) for the current webhook-related endpoints.
[
Telegram Bot
Sync Telegram messages and images into Memos with Memogram.
](/docs/integrations/telegram-bot)[
Admin
Instance administration and user management.
](/docs/admin)
### On this page
[Events](#events)[Payload](#payload)