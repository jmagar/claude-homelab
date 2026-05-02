Bluesky Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Bluesky Notifications
## Overview
* **Source:** [https://bsky.app/](https://bsky.app/)
* **Image Support:** No
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 280
* [ Build Your Apprise URL](/url-builder/?schema=bluesky)
## Account Setup
[Section titled “Account Setup”](#account-setup)
1. Create a BlueSky account
2. Access Settings -\> Privacy and Security
3. Generate an App Password
4. Assemble your Apprise URL like:
* bluesky://handle@you-token-here
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `bluesky://user@app\_pw`
* `bluesky://user.host@app\_pw`
* This is only required if the `host` is not `bsky.social`
## Examples
[Section titled “Examples”](#examples)
Send a public message:
Terminal window
```
`
# Assuming our {Handle} is @John
# Assuming our {AppID} is abcd-1234-efghi-6789
# our user is @testaccount
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"bluesky://John@abcd-1234-efghi-6789"
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