Universal URL Syntax | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Universal URL Syntax
## The Blueprint
[Section titled “The Blueprint”](#the-blueprint)
Apprise uses a standardized URL schema to identify where notifications should be sent. No matter which service you are using, the format remains consistent:
```
`
service://credentials/direction/?parameter=value
`
```
## Breakdown
[Section titled “Breakdown”](#breakdown)
### 1. The Schema (`service://`)
[Section titled “1. The Schema (service://)”](#1-the-schema-service)
The `schema` determines which plugin Apprise loads.
* **`mailto://`** → Email
* **`tgram://`** → Telegram
* **`slack://`** → Slack
[View the full list of supported services](/services/).
### 2. Credentials & Host
[Section titled “2. Credentials & Host”](#2-credentials--host)
Most services require authentication. Apprise maps these standard URL parts to the service’s API requirements.
* **User/Pass:** `service://user:password@...`
* **API Tokens:** `service://token@...`
* **Hostnames:** `service://hostname`
### 3. The Target (`/direction`)
[Section titled “3. The Target (/direction)”](#3-the-target-direction)
The `direction` (or path) tells Apprise **where** to send the message once authenticated. This varies by service but always represents the final destination.
* **Channels:** `slack://.../#general`
* **Phone Numbers:** `twilio://.../15555555555`
* **Chat IDs:** `tgram://.../123456789`
### 4. Parameters (`?key=value`)
[Section titled “4. Parameters (?key=value)”](#4-parameters-keyvalue)
Parameters allow you to tune the behavior of a specific notification. They are appended to the end of the URL starting with a `?`.
Parameters are unique to each service. For example, you can enable Text-to-Speech in Discord (`?tts=yes`) or add a CC recipient to an email (`?cc=user@example.ca`).
**Example:**
Sending an email to two people, in HTML format:
```
`
mailto://user:pass@gmail.com/?to=jane@example.com&format=html
`
```
## Contextual Usage
[Section titled “Contextual Usage”](#contextual-usage)
You will use these URLs everywhere in Apprise:
1. **CLI arguments:** `apprise "service://..."`
2. **Configuration files:** Listed in your YAML or TEXT files.
3. **API calls:** Sent in the JSON payload.
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