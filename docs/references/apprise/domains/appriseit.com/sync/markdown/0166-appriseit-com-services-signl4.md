SIGNL4 Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# SIGNL4 Notifications
## Overview
* **Source:** [https://www.signl4.com](https://www.signl4.com)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=signl4)
## Account Setup
[Section titled “Account Setup”](#account-setup)
You need to have an account with [SIGNL4](https://www.signl4.com) and use your SIGNL4 team or integration secret.
[SIGNL4](https://www.signl4.com) sends actionable mobile alerts to the responsible users or teams. It provides a powerful set of features including a mobile app, push notifications, SMS, voice calls, automated escalations, and duty scheduling. This ensures that critical alerts are delivered instantly and reliably to the right people – anytime, anywhere.
1. Visit [signl4.com](https://www.signl4.com/) and sign up if you do not already have an account.
2. Once logged in, get your SIGNL4 team or integration secret as described [here](https://support.signl4.com/hc/en-us/articles/360015827597-Where-is-my-team-secret).
3. Your SIGNL4 team or integration secret is the hostname in your Apprise URL.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `signl4://{secret}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|secret|Yes|The “secret” is your SIGNL4 team or integration secret.|
|service|No|Assigns the alert to the service/system category with the specified name.|
|location|No|Transmit location information (‘latitude, longitude’) with your event and display a map in the mobile app.|
|alerting\_scenario|No|If this event triggers an alert, allows to control how SIGNL4 notifies the team. **single\_ack**: Only one person needs to acknowledge this alert. **multi\_ack**: The alert must be confirmed by the number of people who are on duty at the time this alert is created. **emergency**: All people in the team are notified regardless of their duty status and must acknowledge the alert, which is also assigned to the built-in emergency category.|
|filtering|No|Specify a boolean value of true or false to apply event filtering for this event, or not. If set to true, the event will only trigger a notification to the team, if it contains at least one keyword from one of your services and system categories (i.e. it is whitelisted).|
|external\_id|No|If the event originates from a record in a 3rd party system, use this parameter to pass the unique ID of that record. That ID will be communicated in outbound webhook notifications from SIGNL4, which is great for correlation/synchronization of that record with the alert.|
|status|No|If you want to resolve an existing alert by an external id (external\_id), you can add this status parameter. It has three possible values: **new**: Default value which means that this event triggers a new alert. **acknowledged**: If you want to acknowledge a previously triggered alert (e.g. someone responded in the 3rd party system and not in the mobile app during business hours), set the “status” to “acknowledged” and provide an external ID via the “external\_id” parameter for the alert you want to acknowledge. It is only possible to acknowledge an alert with a provided external id that initially triggered it. **resolved**: If you want to resolve a previously triggered alert (e.g. monitoring system has auto-closed the event), make sure to set the X-S4-Status to ‘resolved’ and provide an external ID via the “external\_id” parameter for the alert(s) you want to resolve. It is only possible to resolve a alert with a provided external id that initially triggered it.|
You can find more information [here](https://docs.signl4.com/integrations/webhook/webhook.html).
### Global Parameters
[Section titled “Global Parameters”](#global-parameters)
|Variable|Description|
|overflow|This parameter can be set to either `split`, `truncate`, or `upstream`. This determines how Apprise delivers the message you pass it. By default this is set to `upstream`
👉 `upstream`: Do nothing at all; pass the message exactly as you received it to the service.
👉 `truncate`: Ensure that the message will fit within the service’s documented upstream message limit. If more information was passed then the defined limit, the overhead information is truncated.
👉 `split`: similar to truncate except if the message doesn’t fit within the service’s documented upstream message limit, it is split into smaller chunks and they are all delivered sequentially there-after.|
|format|This parameter can be set to either `text`, `html`, or `markdown`. Some services support the ability to post content by several different means. The default of this varies (it can be one of the 3 mentioned at any time depending on which service you choose). You can optionally force this setting to stray from the defaults if you wish. If the service doesn’t support different types of transmission formats, then this field is ignored.|
|verify|External requests made to secure locations (such as through the use of `https`) will have certificates associated with them. By default, Apprise will verify that these certificates are valid; if they are not then no notification will be sent to the source. In some occasions, a user might not have a certificate authority to verify the key against or they trust the source; in this case you will want to set this flag to `no`. By default it is set to `yes`.|
|cto|This stands for Socket Connect Timeout. This is the number of seconds Requests will wait for your client to establish a connection to a remote machine (corresponding to the *connect()*) call on the socket. The default value is 4.0 seconds.|
|rto|This stands for Socket Read Timeout. This is the number of seconds the client will wait for the server to send a response. The default value is 4.0 seconds.|
|emojis|Enable Emoji support (such as providing `:+1:` would translate to 👍). By default this is set to `no`.
**Note:** Depending on server side settings, the administrator has the power to disable emoji support at a global level; but default this is not the case.|
|tz|Identify the IANA Time Zone Database you wish to operate as. By default this is detected based on the configuration the server hosting Apprise is running on. You can set this to things like `America/Toronto`, or any other properly formated Timezone describing your area.|
## Examples
[Section titled “Examples”](#examples)
Sends a simple SIGNL4 alert:
Terminal window
```
`
apprise -vv \\
--title 'Alert from Apprise' \\
--body 'Hello world.' \\
'signl4://secret'
`
```
Here is another example:
Terminal window
```
`
apprise -vv --title 'Alert from Apprise' \\
--body 'Hello world.' \\
'signl4://secret?service=IoT&location=52.3984235,13.0544149&external\_id=a2&status=new'
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