Error Messages | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Error Messages
## Introduction
[Section titled “Introduction”](#introduction)
Frequently identified error messages can be recorded in this section.
### RuntimeError: asyncio.run() cannot be called from a running event loop
[Section titled “RuntimeError: asyncio.run() cannot be called from a running event loop”](#runtimeerror-asynciorun-cannot-be-called-from-a-running-event-loop)
If your calling program runs its own event loop, then Apprise can cause some commotion when it tries to work with its own. For these circumstances you have 2 options:
1. Do not call `notify()`. Instead `await` the `async\_notify()` call itself. [See here for more details](/qa/#async_notify--leveraging-await-to-send-notifications).
2. Leverage a library that handles this exact case called [nest-asyncio](https://pypi.org/project/nest-asyncio/):
Terminal window
```
`
pip3 install nest-asyncio
`
```
Then from within your python application just import it at the top:
```
`
import nest\_asyncio
# apply it
nest\_asyncio.apply()
`
```
An issue related to FastCGI was brought forth [here](https://github.com/caronc/apprise/issues/610) and solved using this method.
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