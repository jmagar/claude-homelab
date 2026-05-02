Introduction | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Introduction
The name **Apprise** (/əˈpraɪz/) is pronounced like “uh-prise”, similar to *surprise* or *arise*, with emphasis on the second syllable.
**Apprise** is a notification routing library that standardizes how messages are delivered to more than 100+ different services. It takes the complexity out of sending notifications.
It does not replace chat platforms, email providers, or alerting systems. Instead, it provides a single, consistent way to send notifications to them.
Whether you are a system administrator running scripts, a developer building an application, or a DevOps engineer managing distributed services, Apprise removes the need to learn and maintain dozens of vendor-specific APIs.
## One Syntax to Rule Them All
[Section titled “One Syntax to Rule Them All”](#one-syntax-to-rule-them-all)
At the core of Apprise is the **Universal Notification URL**.
Instead of learning a unique payload format for every service, you configure destinations using a single, predictable syntax:
```
`
service://credentials/direction/?parameter=value
`
```
If you later decide to switch from one service to another, your application logic does not change. You simply update the URL configuration.
This makes notifications portable, maintainable, and easy to reason about.
## The Three Pillars of Apprise
[Section titled “The Three Pillars of Apprise”](#the-three-pillars-of-apprise)
Apprise is unique because it isn’t just a library; it is a platform that exists in three complementary forms.
### 1. The Python Library
[Section titled “1. The Python Library”](#1-the-python-library)
*For Developers*
At its core, Apprise is a lightweight Python library. You embed it directly into your application and send notifications in just a few lines of code.
```
`
import apprise
apobj = apprise.Apprise()
# Add a service
apobj.add("tgram://credentials")
# Notification destinations are configured separately
apobj.notify(
body="Hello World",
title="My Notification",
)
`
```
The same code works regardless of which notification services you configure.
### 2. The Command Line Interface (CLI)
[Section titled “2. The Command Line Interface (CLI)”](#2-the-command-line-interface-cli)
*For system administrators and automation*
Apprise ships with a powerful CLI that exposes the same functionality without requiring Python code. This is ideal for cron jobs, backup scripts, monitoring hooks, and CI/CD pipelines.
Terminal window
```
`
# e.g: Send a notification to Discord
apprise -t "Backup Complete" -b "The server is safe" \\
"discord://webhook\_id/webhook\_token"
`
```
### 3. The API Server
[Section titled “3. The API Server”](#3-the-api-server)
*For centralized and networked environments*
Apprise is also available as a stateless, containerized API server. This allows you to operate a centralized “notification gateway” for multiple systems.
You can:
* Send notifications directly with each request (stateless)
* Store configurations server-side and reference them by key (stateful)
This is especially useful for microservices, shared infrastructure, and teams that want centralized control.
## Key Features
[Section titled “Key Features”](#key-features)
* **137 supported services**, from popular chat platforms to specialized gateways
* **Format-aware delivery**, including Markdown, HTML, and plain text
* **Attachment support**, automatically adapted to each service’s capabilities
* **High performance**, with parallel notification delivery
* **Minimal dependencies**, designed to stay lightweight
## Which Approach Should I Use?
[Section titled “Which Approach Should I Use?”](#which-approach-should-i-use)
|If you are…|Start with…|
|Building a Python application|[The Python Library](/library/)|
|Automating scripts or system tasks|[The CLI Tool](/cli/)|
|Centralizing notifications across systems|[The API Server](/api/)|
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