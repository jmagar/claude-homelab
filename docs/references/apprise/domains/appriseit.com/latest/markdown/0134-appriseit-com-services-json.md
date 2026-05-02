Custom JSON Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Custom JSON Notifications
## Overview
* **Image Support:** Yes
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=json)
## Introduction
[Section titled “Introduction”](#introduction)
This is just a custom Notification that allows you to have this tool post to a web server as a simple JSON string. This is useful for those who want to be notified via their own custom methods.
The format might look something like this:
```
`
{
"version": "1.0",
"title": "Some Great Software Downloaded Successfully",
"message": "Plenty of details here",
"type": "info"
}
`
```
The *type* will be one of the following:
* **info**: An informative type message
* **success**: A successful report
* **failure**: A failure report
* **warning**: A warning report
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `json://{hostname}`
* `json://{hostname}:{port}`
* `json://{user}:{password}@{hostname}`
* `json://{user}:{password}@{hostname}:{port}`
Adding an `s` to the schema (i.e. `jsons://`) switches to a secure HTTPS connection:
* `jsons://{hostname}`
* `jsons://{hostname}:{port}`
* `jsons://{user}:{password}@{hostname}`
* `jsons://{user}:{password}@{hostname}:{port}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|hostname|Yes|The Web Server’s hostname|
|port|No|The port our Web server is listening on. By default the port is **80** for **json://** and **443** for all **jsons://** references.|
|user|No|If you’re system is set up to use HTTP-AUTH, you can provide *username* for authentication to it.|
|password|No|If you’re system is set up to use HTTP-AUTH, you can provide *password* for authentication to it.|
|method|No|Optionally specify the server http method; possible options are `post`, `put`, `get`, `delete`, `patch`, `head`, `update`, and `options`. By default if no method is specified then `post` is used.|
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
Send a JSON notification to our web server listening on port 80:
Terminal window
```
`
# Assuming our {hostname} is json.server.local
apprise json://json.server.local
`
```
### HTTP Method
[Section titled “HTTP Method”](#http-method)
By default all notifications are sent as a `POST` request. Override this with the `method` URL parameter:
Terminal window
```
`
# Send as a PUT request
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"json://localhost/?method=put"
# Send as a DELETE request
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"json://localhost/?method=delete"
# Send as a PATCH request
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"json://localhost/?method=patch"
`
```
The full list of supported methods is: `post` (default), `get`, `put`, `delete`, `patch`, `head`, `update`, and `options`.
>
**> Note:
**> When
`> method=get
`> is used, the JSON body is still sent as a request body. To pass parameters as URL query strings instead, use the
`> -
`> prefix (see
[> GET Parameter Manipulation
](#get-parameter-manipulation)> below).
>
### Payload Manipulation
[Section titled “Payload Manipulation”](#payload-manipulation)
Making use of the `:` on the Apprise URL allows you to alter and add to the content posted upstream to a remote server.
Terminal window
```
`
# Add to the payload delivered to the remote server as if it was part
# the prepared message Apprise would have otherwise put together
#
# Assuming our {hostname} is localhost
# Assuming we want to include "sound": "oceanwave" as part of the existing payload:
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"json://localhost/?:sound=oceanwave"
`
```
The above would post a message such as:
```
`
{
"version": "1.0",
"title": "Test Message Title",
"message": "Test Message Body",
"type": "info",
"sound": "oceanwave"
}
`
```
You can also clear entries from showing by setting their values to being empty:
Terminal window
```
`
# Clear version and type from the payload:
# Assuming our {hostname} is localhost
# Assuming we want to clear both version and type from the output:
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"json://localhost/?:version&:type"
`
```
The above would post a message such as:
```
`
{
"title": "Test Message Title",
"message": "Test Message Body"
}
`
```
Finally, you can re-map values such as having the message go into a `body` tag instead:
Terminal window
```
`
# Add to the payload delivered to the remote server as if it was part
# the prepared message Apprise would have otherwise put together
#
# Assuming our {hostname} is localhost
# Assuming we want to remap the message section to body:
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"json://localhost/?:message=body"
`
```
The above would post a message such as:
```
`
{
"version": "1.0",
"title": "Test Message Title",
"body": "Test Message Body",
"type": "info"
}
`
```
### Header Manipulation
[Section titled “Header Manipulation”](#header-manipulation)
Some users may require special HTTP headers to be present when they post their data to their server. This can be accomplished by just sticking a plus symbol (**+**) in front of any parameter you specify on your URL string.
Terminal window
```
`
# Below would set the header:
# X-Token: abcdefg
#
# Assuming our {hostname} is localhost
# Assuming our {port} is 8080
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"json://localhost:8080/path/?+X-Token=abcdefg"
# Multiple headers just require more entries defined:
# Below would set the headers:
# X-Token: abcdefg
# X-Apprise: is great
#
# Assuming our {hostname} is localhost
# Assuming our {port} is 8080
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"json://localhost:8080/path/?+X-Token=abcdefg&+X-Apprise=is%20great"
`
```
### GET Parameter Manipulation
[Section titled “GET Parameter Manipulation”](#get-parameter-manipulation)
Some users may require GET parameters to be part of their POST. Any parameters you pass onto the Apprise command line are interpreted by Apprise itself as options/actions you wish to perform (such as changing `method=update`, or `cto=3`). To have Apprise ignore what was specified and past the content `as-is` upstream, you just need to prefix your entries with a minus (`-`) symbol.
Terminal window
```
`
# The below for example would post to http://localhost:8000?token=abcdefg
#
# The `-` symbol will get stripped off when the upstream post takes place
# Apprise knows not to do anything with the argument at all and pass it along as is.
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"json://localhost:8080/?-token=abcdefg"
# If you want to pass more then one element, just chain them:
# The below would send a a POST to:
# https://example.ca/my/path?key1=value1&key2=value2
#
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"jsons://example.ca/my/path?-key1=value1&-key2=value2"
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