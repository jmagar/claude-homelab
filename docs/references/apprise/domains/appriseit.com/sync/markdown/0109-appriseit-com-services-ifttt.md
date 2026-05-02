IFTTT (If This Then That) Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# IFTTT (If This Then That) Notifications
## Overview
* **Source:** [https://ifttt.com/](https://ifttt.com/)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=ifttt)
## Account Setup
[Section titled “Account Setup”](#account-setup)
Creating a IFTTT account is easy. Visit there website and create your free account.
Once you’re hooked up, you’ll want to visit [this URL](https://ifttt.com/services/maker_webhooks/settings) on Webhooks. This will be the gateway Apprise will use to signal any Applets you create. When you visit this page it will give you your API key in the form of a URL.
The URL might something like this:
`https://maker.ifttt.com/use/b1lUk7b9LpGakJARKBwRIZ`
This effectively equates to:
`https://maker.ifttt.com/use/{WebhookID}`
In the above example the **WebhookID** is `b1lUk7b9LpGakJARKBwRIZ`. You will need this value!
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `https://maker.ifttt.com/use/{WebhookID}`
* `ifttt://{WebhookID}@{Event}/`
* `ifttt://{WebhookID}@{Event1}/{Event2}/{EventN}/`
* `ifttt://{WebhookID}@{Event}/?+NewArg=ArgValue`
* `ifttt://{WebhookID}@{Event}/?-value3`
By default these are the the assign default template entries:
* **{value1}** : The **title** will go here
* **{value2}** : The **body** will go here
* **{value3}** : The **message type** will go here (it will read either *info*, *warning*, *critical*, or *success*)
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|WebhookID|Yes|Your webhooks API Key you got from [the settings area of the webhooks service itself](https://ifttt.com/services/maker_webhooks)|
|Event|Yes|This is the **Event Name** you assigned to the Applet you created. You must at least pass in one of these. This is the event plan on triggering through the webhook.|
|+Arg=Val|No|Add an additional **{Arg}** into the payload and assign it the value of **{Val}**. It’s very important that your argument starts with a plus (**+**) symbol in order to use this option.|
|-Arg|No|This is useful if you want to eliminate one of the pre-defined arguments discussed below. You might want to include **?-value1&-value2** to just pass **value3** in the payload. It’s very important that your argument starts with a hyphen/minus (**-**) symbol in order to use this option. As mentioned above, your payload will ALWAYS include **value1**, **value2**, and **value3** in it unless you specify otherwise.|
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
Send a IFTTT notification:
Terminal window
```
`
# Assuming our {WebhookID} is b1lUk7b9LpGakJARKBwRIZ
# Assuming our {Event} is sms\_message
# Assuming you want {value1} to read "My Title"
# Assuming you want {value2} to read "My Body"
# Assuming you want {value3} to read "info"
apprise -vv -t "My Title" -b "My Value" \\
ifttt:///b1lUk7b9LpGakJARKBwRIZ@sms\_message
`
```
Now I realize not everyone will want to use the default **{valueX}** entries defined. In fact, you may want to just use apprise to turn on a light switch and set some complete different value like **{switch}** to ‘*on*’. Here is how you could accomplish this:
Terminal window
```
`
# Send {switch} a value of 'on'
# Assuming our {WebhookID} is b1lUk7b9LpGakJARKBwRIZ
# Assuming our {Event} is my\_light
# Any argument prefixed with a minus/hyphen (-) eliminates an
# argument from our payload. Since we know value1, value2, and
# value3 are present in every payload, we eliminate them.
#
# Now we use a plus (+) symbol in front of an argument to tell
# the remote server we want to include a new option called
# switch and set its value to 'on'
apprise -vv -b "" ifttt:///b1lUk7b9LpGakJARKBwRIZ@my\_light/?-value1&-value2&-value3&+switch=on
`
```
**Thoughts**: The +/- options are relatively new, but it still feels like this plugin could be made even easier to use. If you have any idea’s please open a ticket and let me know your ideas!
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