MSG91 Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# MSG91 Notifications
## Overview
* **Source:** [https://msg91.com](https://msg91.com)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 160
* [ Build Your Apprise URL](/url-builder/?schema=msg91)
## Account Setup
[Section titled “Account Setup”](#account-setup)
To use MSG91, you will need to acquire your *Authentication Key*. This is accessible via the [MSG91 Dashboard](https://control.msg91.com). In addition to this, you will need to prepare a template and assign a `body`, `title`, and `type` variable to it so that Apprise can relay its information through here.
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `msg91://{TemplateID}@{AuthKey}/{PhoneNo}`
* `msg91://{TemplateID}@{AuthKey}/{PhoneNo1}/{PhoneNo2}/{PhoneNoN}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|AuthKey|Yes|The *Authentication Key* associated with your MSG91 account. This is available to you via the [MSG91 Dashboard](https://control.msg91.com/).|
|TemplateID|Yes|The *Template ID* associated with your MSG91 account. This is available to you via the [MSG91 Dashboard](https://control.msg91.com/).|
|PhoneNo|Yes|A phone number MUST include the country codes dialing prefix as well when placed. This field is also very friendly and supports brackets, spaces and hyphens in the event you want to format the number in an easy to read fashion|
|short\_url|No|A boolean (defaults) to `No` whether the SMS messages should use the Short URL notation.|
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
### Template Variables
[Section titled “Template Variables”](#template-variables)
The templates you generate allow you to specify your own key mappings. B
The following keys are automatically passed from Apprise to the MSG91 Template system should you chose to use them or not.
* `##body##`: The Apprise Message Body (Title is prefixed into this if defined)
* `##type##`: The Apprise Message Type (e.g. `warning`, `info`, `failure`, or `success`)
If you wish to assign new types to `body` or `type` from Apprise, these special keywords are specified instead with the `:` (colon) prefix providing the mapping/over-ride. For example: `?:body=msg` would remap the default message body from apprise to the `msg` keyword instead.
If you wish to remove the `type` from being passed, you simply define it in the URL but do not assign it to anything such as: `?:type`.
Finally if you wish to define your own arguments, just define them as such `?:key=value` would assign a `key` the contents of `value` when being passed into your template.
## Examples
[Section titled “Examples”](#examples)
Send a MSG91 Notification as an SMS:
Terminal window
```
`
# Assuming our {TemplateID} is 12345
# Assuming our {AuthKey} is gank339l7jk3cjaE
# Assuming our {PhoneNo} - is in the US somewhere making our country code +1
# - identifies as 800-555-1223
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
msg91://12345@gank339l7jk3cjaE/18005551223
# the following would also have worked (spaces, brackets,
# dashes are accepted in a phone no field):
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"msg91://12345@gank339l7jk3cjaE/1-(800) 555-1223"
`
```
Here is a templating example:
Send a MSG91 Notification as an SMS:
Terminal window
```
`
# Assuming our {TemplateID} is 12345
# Assuming our {AuthKey} is gank339l7jk3cjaE
# Assuming our {PhoneNo} - is in the US somewhere making our country code +1
# Assuming we want to map our `body` tag (sent from Apprise to `payload` instead
# Assuming we want to make sure Apprise does not pass along the `type`
# Assuming we want to define our Foobar Inc company name as the template token `company`:
# - identifies as 800-555-1223
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"msg91://12345@gank339l7jk3cjaE/18005551223?:body=payload&:type&company=Foobar%20Inc"
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