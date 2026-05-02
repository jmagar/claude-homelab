Apprise URL Builder | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Apprise URL Builder
Assemble any of the [**137** supported services](../services/) in real-time with ease.
Instructions
1. **Search** for a notification service by name or schema (e.g., `discord`, `email`, `slack`)
2. **Configure** the required settings through the provided form fields:
* **Required fields** are marked with an asterisk (`\*`) and must be completed before the URL is valid
* **Sensitive fields** (tokens, passwords, API keys) are masked by default — click the eye icon to reveal
* **Copy** the assembled URL to your clipboard and paste it into any Apprise-powered configuration
For details on URL syntax, see the [Universal URL Syntax](../getting-started/universal-syntax/) guide.
Loading service metadata...
How the URL Builder Handles Data
The Apprise URL Builder is designed to prioritize your privacy while reducing accidental exposure of secrets.
* **Client-Side Assembly:** All logic runs locally in your browser, so Apprise URLs are assembled on your machine rather than on our servers.
* **Safe Sharing:** The page URL can preserve non-sensitive builder settings for bookmarking and sharing, but sensitive fields are intentionally excluded from the address bar.
* **Standard Logging:** Like most websites, standard web server logs may capture basic request metadata such as IP address and timestamps, but the builder is designed not to place sensitive credentials into shareable URLs or normal page requests.
* **Local Responsibility:** Because private credentials are not kept in shared links, they must be re-entered locally by the person completing the configuration.
## Support Apprise
Apprise makes notification integration easy and keeps it free for everyone. If this project has saved you time or improved your workflow, consider a one-time or monthly contribution to keep it growing.
[ GitHub Sponsors ](https://github.com/sponsors/caronc) [ PayPal ](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E)
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