Opsgenie Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Opsgenie Notifications
## Overview
* **Source:** [https://www.opsgenie.com](https://www.opsgenie.com)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 15000
* [ Build Your Apprise URL](/url-builder/?schema=opsgenie)
## Account Setup
[Section titled “Account Setup”](#account-setup)
1. Visit [https://www.opsgenie.com](https://www.opsgenie.com) to create your account.
2. [Generate your Integration API Key](https://app.opsgenie.com/settings/integration/add/API/)
You must generate an Integration API Key; this is not to be confused with the Opsgenie Management API Key.
Opsgenie is being retired by Atlassian. Consider migrating to [Jira Service Management](../jira/) which provides the same functionality. See the [Atlassian migration guide](https://support.atlassian.com/jira-service-management-cloud/docs/merge-opsgenie-with-jira-service-management/) for details.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `opsgenie://{apikey}/`
* `opsgenie://{apikey}/@{user}`
* `opsgenie://{apikey}/@{user1}/@{user2}/@{userN}`
* `opsgenie://{apikey}/\*{schedule}`
* `opsgenie://{apikey}/\*{schedule1}/\*{schedule2}/\*{scheduleN}`
* `opsgenie://{apikey}/^{escalation}`
* `opsgenie://{apikey}/^{escalation1}/^{escalation2}/^{escalationN}`
* `opsgenie://{apikey}/#{team}`
* `opsgenie://{apikey}/#{team1}/#{team2}/#{teamN}`
If no prefix character is specified, then the target is presumed to be a user (an `@` symbol is presumed to be in front of it).
You can also mix/match the targets:
* `opsgenie://{apikey}/@{user}/#{team}/\*{schedule}/^{escalation}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|apikey|Yes|This is the API Key associated with your Opsgenie account.|
|user|No|The user you wish to notify; this can be a `username`, `email`, or `uuid4`. This is the assumed default target type to notify, but it is advised you prefix all users with a `@` symbol to eliminate any ambiguity.|
|team|No|The team you wish to notify; this can be the team name itself, or a `uuid4` associated with it.
**Note:** Teams must be prefixed with a `#` symbol.|
|schedule|No|The schedule you wish to notify; this can be the schedule name itself, or a `uuid4` associated with it.
**Note:** Schedules must be prefixed with a `\*` symbol.|
|escalation|No|The escalation you wish to notify; this can be the escalation name itself, or a `uuid4` associated with it.
**Note:** Escalations must be prefixed with a `^` symbol.|
|region|No|The 2 character region code. By default this is set to `us` if not specified. Europeans must set this to `eu` to work correctly.|
|batch|No|Set it to **Yes** if you want all identified targets to be notified in batches (instead of individually). By default this is set to **No**.|
|tags|No|A comma separated list of tags you can associate with your Opsgenie message|
|priority|No|The priority to associate with the message. It is on a scale between 1 and 5. The default value is `3` if not specified.|
|alias|No|The alias to associate with the message.|
|entity|No|The entity to associate with the message.|
|action|No|The action to perform. See [Alert Actions](#alert-actions) below. By default this is set to `map`.|
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
## Alert Actions
[Section titled “Alert Actions”](#alert-actions)
The `action` parameter controls what Opsgenie operation is performed when a notification is sent. The following actions are supported:
|Action|Description|
|`map`|**(default)** Automatically choose an action based on the Apprise notification type. See the table below.|
|`new`|Always create a new alert, regardless of notification type.|
|`close`|Close a previously opened alert (requires a stored request ID from a prior `new` action).|
|`acknowledge`|Acknowledge a previously opened alert (requires a stored request ID from a prior `new` action).|
|`note`|Add a note to a previously opened alert (requires a stored request ID from a prior `new` action).|
|`delete`|Delete a previously opened alert (requires a stored request ID from a prior `new` action).|
When `action=map` (the default), the following mapping is applied:
|Apprise Type|Default Action|Rationale|
|`failure`|`new`|Something went wrong — open a new alert.|
|`warning`|`new`|Something may go wrong — open a new alert.|
|`success`|`close`|Issue resolved — close the associated alert.|
|`info`|`note`|Informational context — annotate an existing alert.|
Actions other than `new` require a stored request ID from a prior `new` notification with the same `entity`, `alias`, or title. Apprise caches these IDs automatically for up to 60 days.
### Custom Action Mapping
[Section titled “Custom Action Mapping”](#custom-action-mapping)
You can override the default type-to-action mapping using `:key=value` URL parameters:
* `opsgenie://{apikey}/?:failure=new&:warning=new&:success=close&:info=note`
For example, to make `info` notifications create a new alert instead of adding a note:
Terminal window
```
`
apprise -vv -t "Test Title" -b "Test Body" \\
"opsgenie://a6k4ABnck26hDh8AA3EDHoOVdDEUlw3nty/?:info=new"
`
```
## Examples
[Section titled “Examples”](#examples)
Send a Opsgenie notification to all devices associated with a project:
Terminal window
```
`
# Assuming our {apikey} is a6k4ABnck26hDh8AA3EDHoOVdDEUlw3nty
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
opsgenie://a6k4ABnck26hDh8AA3EDHoOVdDEUlw3nty
`
```
### Include Details (Key/Value Pairs)
[Section titled “Include Details (Key/Value Pairs)”](#include-details-keyvalue-pairs)
Opsgenie allows you to provide details composed of key/value pairs you can set with messages. This can be accomplished by just sticking a plus symbol (**+**) in front of any parameter you specify on your URL string.
Terminal window
```
`
# Below would set the key/value pair of foo=bar:
# Assuming our {apikey} is a6k4ABnck26hDh8AA3EDHoOVdDEUlw3nty
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"opsgenie://a6k4ABnck26hDh8AA3EDHoOVdDEUlw3nty/?+foo=bar"
# Multiple key/value pairs just require more entries:
# Below would set the key/value pairs of:
# foo=bar
# apprise=awesome
#
# Assuming our {apikey} is a6k4ABnck26hDh8AA3EDHoOVdDEUlw3nty
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"opsgenie://a6k4ABnck26hDh8AA3EDHoOVdDEUlw3nty/?+foo=bar&+apprise=awesome"
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