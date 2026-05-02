Advanced Usage | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Advanced Usage
## Asynchronous Notifications
[Section titled “Asynchronous Notifications”](#asynchronous-notifications)
If you are running inside an `asyncio` event loop, you can use `async\_notify()` to send notifications without blocking.
```
`
import asyncio
import apprise
async def main():
apobj = apprise.Apprise()
apobj.add('mailto://user:pass@example.com')
# Await the notification delivery
await apobj.async\_notify(
title='Async Test',
body='This was sent asynchronously',
)
asyncio.run(main())
`
```
## Serialization (Pickle)
[Section titled “Serialization (Pickle)”](#serialization-pickle)
Apprise objects can be serialized (pickled). This allows you to configure an Apprise object once, save it to disk (or a database), and reload it later with all services configured.
```
`
import apprise
import pickle
# 1. Setup
apobj = apprise.Apprise()
apobj.add("json://localhost")
# 2. Serialize
serialized\_data = pickle.dumps(apobj)
# ... later in your code ...
# 3. Restore
restored\_obj = pickle.loads(serialized\_data)
restored\_obj.notify("I am back!")
`
```
## Low-Level: The Apprise Notification Object
[Section titled “Low-Level: The Apprise Notification Object”](#low-level-the-apprise-notification-object)
When you call `Apprise.notify()`, it handles tagging, configuration, and logging for you. If you need to bypass this and interact directly with a specific notification object:
```
`
import apprise
# Instantiate a single notification object directly
# (Bypassing the Apprise() manager)
obj = apprise.Apprise.instantiate('glib://')
# Send raw content
obj.send(
body="Raw message",
title="Raw title"
)
`
```
Using `send()` directly bypasses many of the safeguards and features (like tagging and attachment processing) provided by the main `notify()` method.
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