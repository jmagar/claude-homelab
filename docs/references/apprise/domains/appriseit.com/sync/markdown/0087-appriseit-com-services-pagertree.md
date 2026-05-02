PagerTree Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# PagerTree Notifications
## Overview
* **Source:** [https://pagertree.com](https://pagertree.com)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=pagertree)
## Account Setup
[Section titled “Account Setup”](#account-setup)
1. For this to work, you’ll need to signup for a [PagerTree](https://pagertree.com) account (free trial is fine). Make sure you follow the setup wizard (you’ll want to be on-call for the team the integration is pointed to in Step 2)
2. Create a [webhook integration](https://pagertree.com/docs/integration-guides/webhook) and point it to the team (default: “Devops Team”)
3. From the integration page, copy the integration Prefix ID (used for the apprise url)
4. Use the Prefix ID for the apprise URL `./bin/apprise -t test -b message "pagertree://int\_xxxxxxxxxx"`
You need to have an account with [PagerTree](https://pagertree.com) and create a [webhook integration](https://pagertree.com/docs/integration-guides/webhook).
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `pagertree://{integration}`
* `pagertree://{integration}?action=resolve&thirdparty\_id=abc123`
* `pagertree://{integration}?+pagertree-token=123&:env=prod&-incident=true&-incident\_severity=SEV-1&-incident-message=Please join the bridge&tags=prod,server,outage`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|integration|Yes|This is the Prefix ID of your webhook integration. Found at the top of the integration page.|
|action|No|The action for the webhook. Possible values are `create`, `acknowledge`, and `resolve`. When using acknowledge or resolve, please use the `thirdparty\_id` parameter to indicate to PagerTree which alert should be actioned.|
|thirdparty|No|An Id PagerTree uses to map thirdparty applications to alerts. You can specify your own, or if not, a random UUID will be generated for you.|
|urgency|No|Urgency of the alert to be generated. Possible values `silent`, `low`, `medium`, `high`, or `critical`. If not provided, PagerTree will use the integration’s default.|
|tags|No|Comma seperated list of tags. (ex: “prod,server,outage”)|
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
Send a PagerTree create command.
Terminal window
```
`
# Assuming our {integration\_id} is int\_0123456789
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"pagertree://int\_0123456789"
`
```
### Payload Manipulation
[Section titled “Payload Manipulation”](#payload-manipulation)
Making use of the `:` on the Apprise URL allows you to alter and add to the body content posted upstream to PagerTree. This is useful when using the [Capture Additional Data feature](https://pagertree.com/docs/integration-guides/webhook#integration-options).
Terminal window
```
`
# Add to the payload delivered to PagerTree
#
# Assuming our {integration\_id} is int\_xxxxxxxxxx
# Assuming we want to include "server": "blue-ranger-2" as part of the existing payload:
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"pagertree://int\_xxxxxxxxxx/?:server=blue-ranger-2"
`
```
The above would post a message such as:
```
`
{
"id": "0f85aa1c-711e-4873-95b6-e441c291537d",
"action": "create",
"title": "Test Message Title",
"message": "Test Message Body",
"server": "blue-ranger-2"
}
`
```
### Header Manipulation
[Section titled “Header Manipulation”](#header-manipulation)
Some users may require special HTTP headers to be present when they post their data to PagerTree. This can be accomplished by just sticking a plus symbol (**+**) in front of any parameter you specify on your URL string. This is useful when making use of the [PagerTree Token feature](https://pagertree.com/docs/integration-guides/webhook#integration-options).
Terminal window
```
`
# Below would set the header:
# pagertree-token: abcdefg
#
# Assuming our {integration\_id} is int\_xxxxxxxxxx
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"pagertree://int\_xxxxxxxxxx?+pagertree-token=abcdefg"
`
```
### Meta Manipulation
[Section titled “Meta Manipulation”](#meta-manipulation)
Some PagerTree functionality (like incidents) lives in the `meta` property of the payload. To add to the meta property you just need to prefix your entries with a minus (`-`) symbol. [See example.](https://pagertree.com/docs/integration-guides/webhook#example-request-2)
Terminal window
```
`
# Indicate to PagerTree this alert should be marked as an incident
# The `-` symbol will get stripped off when the upstream post takes place
# Apprise knows not to do anything with the argument at all and pass it along as is.
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"pagertree://int\_xxxxxxxxxx?-incident=true&-incident\_severity=SEV-1&-incident\_message=Join the war room"
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