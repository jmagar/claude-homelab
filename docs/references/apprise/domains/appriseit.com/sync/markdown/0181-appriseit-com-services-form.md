Custom FORM Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Custom FORM Notifications
## Overview
* **Image Support:** Yes
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=form)
## Introduction
[Section titled “Introduction”](#introduction)
This is just a custom Notification that allows you to have this tool post to a web server as a simple FORM (`application/x-www-form-urlencoded`). This is useful for those who want to be notified via their own custom methods.
The payload will include a `body`, `title`, `version`, and `type` in its response. You can add more (see below for details).
The *type* will be one of the following:
* **info**: An informative type message
* **success**: A successful report
* **failure**: A failure report
* **warning**: A warning report
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `form://{hostname}`
* `form://{hostname}:{port}`
* `form://{user}:@{hostname}`
* `form://{user}:@{hostname}:{port}`
* `form://{user}:{password}@{hostname}`
* `form://{user}:{password}@{hostname}:{port}`
Adding an `s` to the schema (i.e. `forms://`) switches to a secure HTTPS connection:
* `forms://{hostname}`
* `forms://{hostname}:{port}`
* `forms://{user}:@{hostname}`
* `forms://{user}:@{hostname}:{port}`
* `forms://{user}:{password}@{hostname}`
* `forms://{user}:{password}@{hostname}:{port}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|hostname|Yes|The Web Server’s hostname|
|port|No|The port our Web server is listening on. By default the port is **80** for **form://** and **443** for all **forms://** references.|
|user|No|If you’re system is set up to use HTTP-AUTH, you can provide *username* for authentication to it.|
|password|No|If you’re system is set up to use HTTP-AUTH, you can provide *password* for authentication to it.|
|method|No|Optionally specify the server http method; possible options are `post`, `put`, `get`, `delete`, `patch`, `head`, `update`, and `options`. By default if no method is specified then `post` is used.|
|attach-as|No|Optionally override the meta filename set when there are attachments. Each attachment by default gets posted as `file01`, `file02`, etc. There have been use-cases where someone’s end point expects the meta name (where the file is found on the HTTP request) to be named something specific such as `document`. Utilize this over-ride to accomplish such a feat. Also use the `\*` character to allow the numbering. Hence `?attach-as=meta\*` would cause Apprise to store the files as `meta01`, `meta02`, etc.|
**Note:**: If you include file attachments; each one is concatenated into the same single post to the upstream server. The `Content-Type` header request also changes from `application/x-www-form-urlencoded` to `multipart/form-data` in this case.
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
Send a FORM Based web request to our web server listening on port 80:
Terminal window
```
`
# Assuming our {hostname} is my.server.local
apprise form://my.server.local
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
"form://localhost/?method=put"
# Send as a DELETE request
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"form://localhost/?method=delete"
# Send as a PATCH request
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"form://localhost/?method=patch"
`
```
The full list of supported methods is: `post` (default), `get`, `put`, `delete`, `patch`, `head`, `update`, and `options`.
>
**> Note:
**> When
`> method=get
`> is used, the form payload fields (
`> version
`> ,
`> title
`> ,
`> message
`> ,
`> type
`> ) are appended as URL query parameters rather than sent as a request body. The
`> Content-Type
`> header is not set for GET requests. File attachments are not compatible with GET.
>
### Payload Manipulation
[Section titled “Payload Manipulation”](#payload-manipulation)
Making use of the `:` on the Apprise URL allows you to alter and add to the form fields posted upstream to a remote server.
Terminal window
```
`
# Add to the payload delivered to the remote server as if it was part
# the prepared message Apprise would have otherwise put together
#
# Assuming our {hostname} is localhost
# Assuming we want to include "sound=oceanwave" as part of the existing payload:
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"form://localhost/?:sound=oceanwave"
`
```
The above would POST the following form fields:
```
`
version=1.0
title=Test Message Title
message=Test Message Body
type=info
sound=oceanwave
`
```
You can also remove built-in fields by setting their value to empty:
Terminal window
```
`
# Remove version and type from the payload:
# Assuming our {hostname} is localhost
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"form://localhost/?:version&:type"
`
```
The above would POST:
```
`
title=Test Message Title
message=Test Message Body
`
```
Finally, you can remap a built-in field to a different key name:
Terminal window
```
`
# Remap the "message" field to "body":
# Assuming our {hostname} is localhost
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"form://localhost/?:message=body"
`
```
The above would POST:
```
`
version=1.0
title=Test Message Title
body=Test Message Body
type=info
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
"form://localhost:8080/path/?+X-Token=abcdefg"
# Multiple headers just require more entries defined:
# Below would set the headers:
# X-Token: abcdefg
# X-Apprise: is great
#
# Assuming our {hostname} is localhost
# Assuming our {port} is 8080
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"form://localhost:8080/path/?+X-Token=abcdefg&+X-Apprise=is%20great"
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
"form://localhost:8080/?-token=abcdefg"
# If you want to pass more then one element, just chain them:
# The below would send a a POST to:
# https://example.ca/my/path?key1=value1&key2=value2
#
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"forms://example.ca/my/path?-key1=value1&-key2=value2"
`
```
### Attach-As Over-Ride Options
[Section titled “Attach-As Over-Ride Options”](#attach-as-over-ride-options)
This section expands further on the `?attach-as=` override option.
Simply add this to the URL: such as:
Terminal window
```
`
# apply the override of `file{:02d}` to be `document`
bin/apprise -vvvv 'forms://webhook.site/\<webhook\>?attach-as=document' \\
--attach test/var/apprise-test.png -b test
`
```
In order to support other variations, you can do :
Terminal window
```
`
# Set the file array object in the request as `{:02d}meta`
bin/apprise -vvvv 'forms://webhook.site/\<webhook\>?attach-as=\*meta' \\
--attach test/var/apprise-test.png -b test
# Set the file array object in the request as `meta{:02d}`
bin/apprise -vvvv 'forms://webhook.site/\<webhook\>?attach-as=meta\*' \\
--attach test/var/apprise-test.png -b test
# Set the file array object in the request as `meta{:02d}file`
bin/apprise -vvvv 'forms://webhook.site/\<webhook\>?attach-as=meta\*file' \\
--attach test/var/apprise-test.png -b test
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