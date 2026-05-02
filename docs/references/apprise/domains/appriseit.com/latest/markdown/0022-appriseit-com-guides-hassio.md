Home Assistant (HASS.IO) Integration with Apprise | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Home Assistant (HASS.IO) Integration with Apprise
This guide explains how to integrate **Apprise** with **[Home Assistant](https://www.home-assistant.io/)** using the built-in Apprise notification platform. This approach allows you to centralize all notification logic in a single configuration file (or Apprise API source) while letting Home Assistant focus purely on automation logic.
This guide covers using Apprise **from within** Home Assistant to deliver
notifications to external services. If you want to use Apprise to send
notifications **to** Home Assistant (persistent dashboard alerts or
direct service calls), see the
[Home Assistant service plugin](/services/homeassistant/) (`hassio://`).
## Why Use Apprise with Home Assistant
[Section titled “Why Use Apprise with Home Assistant”](#why-use-apprise-with-home-assistant)
Using Apprise provides several benefits:
* A single configuration file for all notification services
* Support for dozens of providers (email, Telegram, ntfy, Kodi, and more)
* Tag-based routing for flexible notification targeting
* No vendor lock-in at the automation level
Home Assistant remains unaware of provider details. It simply sends messages to Apprise and lets Apprise do the rest.
## 1. Installation
[Section titled “1. Installation”](#1-installation)
Apprise is built into Home Assistant Core. You do not need to install a custom component or add-on. It is available immediately via the `notify` platform.
## 2. Configuration
[Section titled “2. Configuration”](#2-configuration)
Choose the configuration method that best fits your needs.
* [ Method 1: Inline (Quick Start) ](#tab-panel-48)
* [ Method 2: Local Config (Standard) ](#tab-panel-49)
* [ Method 3: Remote Config (API) ](#tab-panel-50)
This method is best if you only have a **single** notification service or want to get up and running quickly without creating extra files.
**Edit `configuration.yaml`**
Add the following entry to your configuration file. Replace the URL with your specific service URL.
/config/configuration.yaml
```
`
notify:
- name: apprise\_quick
platform: apprise
# Define the Apprise URL directly here
url: tgram://123456789:ABCDefghIJKLmnOPqrstUVwxyz
`
```
## 3. Usage in Automations
[Section titled “3. Usage in Automations”](#3-usage-in-automations)
Once configured and Home Assistant is restarted, you can send notifications using the `notify` service.
### Example: Using Method 1 (Inline)
[Section titled “Example: Using Method 1 (Inline)”](#example-using-method-1-inline)
If you used **Method 1**, your service is likely named `notify.apprise\_quick`. You do not need to provide a `target` because the destination is hardcoded in your configuration.
```
`
- alias: "[Interactive] - Sunset Notice"
trigger:
platform: sun
event: sunset
action:
# Matches the 'name' you gave in configuration.yaml
service: notify.apprise\_quick
data:
title: "Good evening"
message: "The sun is setting."
`
```
### Example: Using Methods 2 & 3 (Config Based)
[Section titled “Example: Using Methods 2 & 3 (Config Based)”](#example-using-methods-2--3-config-based)
If you used **Method 2** or **Method 3**, you can control exactly who gets notified by using the `target` field to match the tags defined in your YAML file (or API configuration).
```
`
- alias: "[Interactive] - Sunset Notice"
trigger:
platform: sun
event: sunset
action:
service: notify.apprise
data:
# This 'target' matches the 'tag' in your config
target: email
title: "Good evening"
message: "The sun is setting."
`
```
### Advanced Tagging Logic
[Section titled “Advanced Tagging Logic”](#advanced-tagging-logic)
You can combine tags in your `target` field to create powerful notification groups on the fly.
|Target Value|Logic|Description|
|`target: devops`|**Simple**|Notifies everything tagged `devops`.|
|`target: [devops, alarm]`|**OR**|Notifies everything tagged `devops`**OR**`alarm`.|
|`target: "devops alarm"`|**AND**|Notifies only services that have **BOTH** tags.|
## 4. Testing Your Configuration
[Section titled “4. Testing Your Configuration”](#4-testing-your-configuration)
Before wiring Apprise into automations, verify it works from the
command line:
Terminal window
```
`
apprise -vv -t "Test" -b "Hello from the CLI" \\
tgram://YOUR\_BOT\_TOKEN/YOUR\_CHAT\_ID
`
```
Then confirm Home Assistant can reach the same service by triggering
the `notify.apprise` service manually from **Developer Tools →
Services**.
## 5. Discovering Available Notify Services
[Section titled “5. Discovering Available Notify Services”](#5-discovering-available-notify-services)
If you want Apprise to call back into Home Assistant itself (for
example, to push to a mobile device registered in the HA companion
app), you can use the `hassio://` plugin in your Apprise URLs. To find
the exact service name:
1. In Home Assistant, open **Developer Tools → Services**.
2. Filter by domain **notify** — you will see entries like
`notify.mobile\_app\_johns\_phone`.
3. The portion after `notify.` is the service name to use in the
Apprise URL:
Terminal window
```
`
apprise -vv -t "Alert" -b "Test push" \\
'hassio://ha.local/YOUR\_TOKEN/notify.mobile\_app\_johns\_phone'
`
```
See the [Home Assistant service plugin](/services/homeassistant/) for
the full `hassio://` URL reference.
## 6. Debugging & Logging
[Section titled “6. Debugging & Logging”](#6-debugging--logging)
If your notifications aren’t sending, you can enable debug logging specifically for the Apprise component in Home Assistant. Add this to your `configuration.yaml`:
```
`
logger:
default: info
logs:
homeassistant.components.apprise: debug
`
```
After restarting, check your Home Assistant logs. You will see Apprise attempting to load your configuration and dispatch messages, which will help identify invalid URLs or network issues.
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