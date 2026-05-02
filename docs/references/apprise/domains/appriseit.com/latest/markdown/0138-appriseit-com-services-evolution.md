Evolution API Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Evolution API Notifications
## Overview
* **Source:** [https://github.com/EvolutionAPI/evolution-api](https://github.com/EvolutionAPI/evolution-api)
* **Image Support:** No
* **Attachment Support:** No
* **Message Character Limits:**
* Body: 65536
* [ Build Your Apprise URL](/url-builder/?schema=evolution)
## Account Setup
[Section titled “Account Setup”](#account-setup)
[Evolution API](https://github.com/EvolutionAPI/evolution-api) is a self-hosted WhatsApp gateway that exposes a REST API on top of the WhatsApp Web protocol.
### 1. Deploy Evolution API
[Section titled “1. Deploy Evolution API”](#1-deploy-evolution-api)
The recommended way is via Docker:
Terminal window
```
`
docker run -d \\
-p 8080:8080 \\
--name evolution-api \\
atendai/evolution-api:latest
`
```
Full deployment instructions and docker-compose examples are available in the [official repository](https://github.com/EvolutionAPI/evolution-api).
### 2. Create and connect an instance
[Section titled “2. Create and connect an instance”](#2-create-and-connect-an-instance)
1. Open the Evolution API dashboard (e.g. `http://yourserver:8080`).
2. Create a new **instance** and give it a name (e.g. `MyInstance`).
3. Scan the **QR code** shown in the dashboard with the WhatsApp mobile app to link your account.
4. Once connected, the instance status will change to **open**.
### 3. Obtain your API key
[Section titled “3. Obtain your API key”](#3-obtain-your-api-key)
The API key is displayed in the instance settings page of the dashboard. Copy it — you will use it as `{apikey}` in the Apprise URL.
### Phone number format
[Section titled “Phone number format”](#phone-number-format)
All phone numbers must be supplied in **international format without the leading `+`**, e.g.:
|Country|Number|Format for Apprise|
|Brazil|+55 11 99999-9999|`5511999999999`|
|USA|+1 (555) 123-4567|`15551234567`|
|Germany|+49 30 12345678|`493012345678`|
## Syntax
[Section titled “Syntax”](#syntax)
Plain HTTP (default port 80):
* `evolution://{apikey}@{host}/{instance}/{phoneNo}`
* `evolution://{apikey}@{host}:{port}/{instance}/{phoneNo}`
HTTPS (default port 443):
* `evolutions://{apikey}@{host}/{instance}/{phoneNo}`
* `evolutions://{apikey}@{host}:{port}/{instance}/{phoneNo}`
Multiple recipients:
* `evolution://{apikey}@{host}/{instance}/{phoneNo1}/{phoneNo2}/{phoneNoN}`
Extra recipients via query parameter:
* `evolution://{apikey}@{host}/{instance}/{phoneNo}?to={phoneNo2}`
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|apikey|Yes|The API Key shown in your Evolution API instance settings.|
|host|Yes|The hostname or IP address where Evolution API is running.|
|port|No|The port Evolution API listens on. Defaults to **80** for `evolution://` and **443** for `evolutions://`.|
|instance|Yes|The name of the WhatsApp instance you created in the Evolution API dashboard.|
|phoneNo|Yes|One or more destination phone numbers in international format without the leading `+`. Delimit multiple numbers with a forward slash `/` in the URL.|
|to|No|Alias for `phoneNo`. Can be used as a query parameter (`?to=`) to specify additional recipients.|
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
Send a WhatsApp message over HTTP:
Terminal window
```
`
# Assuming our {apikey} is abc123secret
# Assuming our Evolution API is running at myserver.local:8080
# Assuming our instance name is MyInstance
# Assuming the destination number is +55 11 99999-9999
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"evolution://abc123secret@myserver.local:8080/MyInstance/5511999999999"
`
```
Send over HTTPS (Evolution API behind a reverse proxy with TLS):
Terminal window
```
`
# Assuming our {apikey} is abc123secret
# Assuming our Evolution API is reachable at api.example.com (HTTPS)
# Assuming our instance name is MyInstance
apprise -vv -t "Alert" -b "Server is down!" \\
"evolutions://abc123secret@api.example.com/MyInstance/5511999999999"
`
```
Send to multiple recipients:
Terminal window
```
`
# Notify two numbers in a single command
apprise -vv -t "Broadcast" -b "Maintenance window starts in 30 minutes" \\
"evolution://abc123secret@myserver.local:8080/MyInstance/5511999999999/5521888888888"
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