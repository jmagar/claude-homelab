Apprise API | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Apprise API
The **Apprise API** is a web-based gateway to the Apprise library. It provides a RESTful interface to send notifications, allowing you to centralize your notification configuration and trigger alerts from systems that might not support Python or the CLI directly.
## Why use the API?
[Section titled “Why use the API?”](#why-use-the-api)
* **Microservices:** Provide a single notification endpoint for all your applications.
* **Stateless and Stateful:** Send notifications on the fly or reference pre-saved configurations by key.
* **Web interface:** Includes a built-in dashboard to manage configurations and test notifications. The UI can be disabled with `APPRISE\_API\_ONLY=yes`.
* **Extensible:** Runs as a lightweight container compatible with Docker, Kubernetes, and more.
* **Centralized configuration:** Use one server as the configuration source for multiple apps and environments.
## Getting Started
[Section titled “Getting Started”](#getting-started)
The Apprise API is designed to be run as a container.
1. **Deploy it:** Set up the container using [Docker or Kubernetes](/api/deployment/).
2. **Configure it:** Save your URLs and assign them a key (for example, `my-alerts`).
3. **Notify:** Trigger your alerts using a simple HTTP request.
Terminal window
```
`
curl -X POST -d "body=Test Message" \\
http://localhost:8000/notify/my-alerts
`
```
If your server can be accessed by more than one person, or it is exposed to the internet, generate a new obfuscated key that isolates your environment from others. If you are using the web UI, you can press **New Configuration** in the left menu.
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