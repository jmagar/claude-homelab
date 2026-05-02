Quick Start Guide | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Quick Start Guide
Now that you have Apprise installed, let’s send your first notification. Choose your preferred method below.
* [ CLI ](#tab-panel-39)
* [ Python ](#tab-panel-40)
* [ API Server ](#tab-panel-41)
The quickest way to test Apprise is via the command line.
Terminal window
```
`
# Send a notification to a specific service
apprise -t "Hello" -b "World" \\
"discord://webhook\_id/webhook\_token"
`
```
## Next Steps
[Section titled “Next Steps”](#next-steps)
* **Learn the Syntax:** Understand how [Apprise URLs](/getting-started/universal-syntax/) work.
* **Configure It:** Learn how to use [Configuration Files](/getting-started/configuration/) to manage your URLs.
* **Find Services:** Browse the [Supported Services](/services/) catalog.
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