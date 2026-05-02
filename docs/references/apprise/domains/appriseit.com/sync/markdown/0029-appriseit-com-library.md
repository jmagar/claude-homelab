Apprise Python (Core) Library | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Apprise Python (Core) Library
The Apprise library allows you to send notifications to almost all of the most popular notification services available today (Telegram, Discord, Slack, Email, etc.) using a single, unified Python API.
For common helpers used across plugins, see the [Utilities Reference](./utilities/).
## Installation
[Section titled “Installation”](#installation)
Apprise is available on PyPI and can be installed via pip.
Terminal window
```
`
pip install apprise
`
```
## Hello World
[Section titled “Hello World”](#hello-world)
The core of the library is the `Apprise` object. You instantiate it, add URLs, and trigger notifications.
```
`
import apprise
# 1. Instantiate the Apprise Object
apobj = apprise.Apprise()
# 2. Add one or more service URLs
apobj.add('mailto://myuser:mypass@hotmail.com')
apobj.add('tgram://123456789:ABCDefghIJKLmnOPqrstUVwxyz')
# 3. Send a notification to all added services
apobj.notify(
body='What a great notification service!',
title='My Notification Title',
)
`
```
## Why use the Library?
[Section titled “Why use the Library?”](#why-use-the-library)
* **Unified Syntax**: One URL format for **137** services.
* **Asynchronous**: Sending notifications is non-blocking (optional).
* **Tagging**: Group services (e.g., `devops`, `billing`) and notify them selectively.
* **Attachments**: Send files and images effortlessly.
* **Rich Text**: Support Emojis and handle HTML, TEXT, and Markdown
* **Configuration**: Load URLs from YAML/Text files or API endpoints.
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