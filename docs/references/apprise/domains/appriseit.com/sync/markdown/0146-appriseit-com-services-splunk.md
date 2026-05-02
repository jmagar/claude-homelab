Splunk/VictorOps Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Splunk/VictorOps Notifications
## Overview
* **Source:** [https://www.splunk.com/en\_us/products/on-call.html](https://www.splunk.com/en_us/products/on-call.html)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=splunk)
## Account Setup
[Section titled “Account Setup”](#account-setup)
1. [Create an account with Splunk On-Call](https://www.splunk.com/en_us/sign-up.html?redirecturl=https://www.splunk.com/en_us/products/on-call.html) (previously VictorOps). Then set up your REST endoint
2. Access your API Key from [this link](https://portal.victorops.com/dash/apprise#/advanced/rest).
It will look something like this:
```
`
https://alert.victorops.com/integrations/generic/20131114/alert/1234abcd-c11c-1ad1-a1a1-12345678abcd/$routing\_key
^ ^ ^ ^
|------------ apikey --------------| | |
| routing |
/ key \\
| placeholder |
|-------------|
`
```
3. Finally you will need to define a `routing\_key` which can be done from **Settings** -\> **Route Keys**
4. The `entity\_id` is used to ensure your message can be triggered and acknowledged. It’s effectively a key. If you don’t provide one then Apprise will generate one for you (the same one every time).
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `splunk://{routing\_key}@{apikey}`
* `splunk://{routing\_key}@{apikey}/{entity\_id}`
* `victorops://{routing\_key}@{apikey}`
* `victorops://{routing\_key}@{apikey}/{entity\_id}`
* `https://alert.victorops.com/integrations/generic/20131114/ alert/{apikey}/{routing\_key}`
* `https://alert.victorops.com/integrations/generic/20131114/ alert/{apikey}/{routing\_key}/{entity\_id}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|apikey|**Yes**|The REST API key associated with your Splunk account|
|routing\_key|**Yes**|One of the `routing\_key` values you associated within your Splunk account|
|entity\_id|No|A key you wish to generate your trigger from. Keys allow you to alert, ackowledge and/or resolve the same notification later on.|
|action|No|The action you wish to perform with your Splunk/VictorOps Apprise notification. the following options are available to you:
⚪ `map`: Use Apprise (or custom) action mappings based on the Notification Type. Hence a `warning` from Apprise triggers a `WARNING` on Splunk, while a `failure` triggers a `CRITICAL` Splunk message (triggering an incident). Finally a `success` triggers a `RECOVERY` Spunk message (clearing an incident). **`map` is the default action if nothing is specified.**
⚪ `warning`: Reguardless of the Apprise notification, ALWAYS trigger a Splunk `WARNING` message.
⚪ `critical`: Reguardless of the Apprise notification, ALWAYS trigger a Splunk `CRITICAL` message.
⚪ `acknowledgement`: Reguardless of the Apprise notification, ALWAYS trigger a Splunk `ACKNOWLEDGEMENT` message.
⚪ `info`: Reguardless of the Apprise notification, ALWAYS trigger a Splunk `INFO` message.
⚪ `recovery`: Reguardless of the Apprise notification, ALWAYS trigger a Splunk `RECOVERY` message.|
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
## Custom Splunk/On-Call Event Mapping
[Section titled “Custom Splunk/On-Call Event Mapping”](#custom-splunkon-call-event-mapping)
You can have Apprise take a unique Splunk/On-Call action depending on the notification that is triggered if you use the (default) `action` of `map` with this integration.
First consider that Splunk supports the following settings:
1. `CRITICAL`: Triggers an incident
2. `WARNING`: May trigger an incident, depending on your settings
3. `ACKNOWLEDGEMENT`: Acks an incident
4. `INFO`: Creates a timeline event but does not trigger an incident
5. `RECOVERY`: Resolves an incident
By default if the `action` is set to `map`, then Apprise maps itself to the following:
* Apprise `info` 👉 Splunk `INFO`
* Apprise `warning` 👉 Splunk `WARNING`
* Apprise `failure` 👉 Splunk `CRITICAL`
* Apprise `success` 👉 Splunk `RECOVERY`
If you wish to map these differently, you simply need to use the `:` (colon) when over-riding an apprise variable. Hence, if you wanted to map the (Apprise) `info` to (Splunk) `ACKNOWLEDGEMENT` instead, your URL would have `?:info=acknowledgement`. You can also short-form it like `?i=a` if you wanted to as well (same effect).
You can add as many re-mappings as you want. Just be certain to add a colon (`:`) infront of the Apprise notificaiton type first.
## Testing
[Section titled “Testing”](#testing)
Send a Spunk On-Call alert to fail our database service:
Terminal window
```
`
# Assuming we want to trigger a Splunk CRITICAL message (we send a Apprise Failure)
# Assuming our {apikey} is 134b8gh0-eba0-4fa9-ab9c-257ced0e8221
# Assuming our {route\_key} is database
apprise -vv -t "Test Message Title" -b "Test Message Body" -n failure \\
splunk://database@134b8gh0-eba0-4fa9-ab9c-257ced0e8221
`
```
We can recover from the failure above by just doing the following:
Terminal window
```
`
# Assuming we want to trigger a Splunk ACKNOWLEDGEMENT message (we send a Apprise Success)
# Assuming our {apikey} is 134b8gh0-eba0-4fa9-ab9c-257ced0e8221
# Assuming our {route\_key} is database
apprise -vv -t "Test Message Title" -b "Test Message Body" -n success \\
splunk://database@134b8gh0-eba0-4fa9-ab9c-257ced0e8221
`
```
Send a Spunk message while re-mapping our keys around:
Terminal window
```
`
# Assuming we want the (Apprise) `info` to to trigger a Splunk RECOVERY
# Assuming we want the (Apprise) `warning` to always trigger a Splunk CRITICAL
# Assuming our {apikey} is 134b8gh0-eba0-4fa9-ab9c-257ced0e8221
# Assuming our {route\_key} is database
# In this example we'll send a warning message (which will be a CRITICAL)
apprise -vv -t "Test Message Title" -b "Test Message Body" -n warning \\
splunk://database@134b8gh0-eba0-4fa9-ab9c-257ced0e8221?:info=rec&:warn=crit
`
```
Reguardless of what message type we sent, we always set it as RECOVERY:
Terminal window
```
`
# Assuming we always trigger a recovery
# Assuming our {apikey} is 134b8gh0-eba0-4fa9-ab9c-257ced0e8221
# Assuming our {route\_key} is database
# In this example we'll send a failure message (which will be a RECOVERY due to our settings)
apprise -vv -t "Test Message Title" -b "Test Message Body" -n failure \\
splunk://database@134b8gh0-eba0-4fa9-ab9c-257ced0e8221?:action=recovery
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