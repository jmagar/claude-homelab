Office 365 / Outlook / Hotmail | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Office 365 / Outlook / Hotmail
## Overview
* **Image Support:** No
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=o365)
## Which Setup Should I Use?
[Section titled “Which Setup Should I Use?”](#which-setup-should-i-use)
Choose **Personal** if you send from a consumer Microsoft mailbox such as
`@outlook.com`, `@hotmail.com`, `@live.com`, or `@msn.com`. This path uses a
one-time sign-in to obtain a `refresh\_token`, which Apprise then rotates
automatically during normal use.
Choose **Organizational** if you send from a work or school Microsoft 365
tenant backed by Exchange Online. This path uses an Azure app registration plus
the `client\_credentials` flow with your `tenant\_id`, `client\_id`, and
`client\_secret`.
* [ Personal ](#tab-panel-165)
* [ Organizational ](#tab-panel-166)
Personal consumer accounts — `@outlook.com`, `@hotmail.com`, `@live.com`,
`@msn.com`, and regional Hotmail/Live variants — use a **refresh token** flow
instead of the organizational client credentials flow.
This involves two phases:
* **One-time setup:** register a public-client app in Azure, then run a short
script to sign in and capture your `refresh\_token`.
* **Ongoing:** Apprise uses the stored `refresh\_token` to obtain short-lived
access tokens automatically. Every successful send silently rotates the
refresh token, so it stays alive as long as Apprise is used at least once
every 90 days.
## App Registration
[Section titled “App Registration”](#app-registration)
1. Go to [**App Registrations**](https://portal.azure.com/#view/Microsoft_AAD_RegisteredApps/ApplicationsListBlade)
in the Azure portal and click **Register an application**.
* Give it a name (e.g. `Apprise Personal`).
* Under **Supported account types**, select **Personal Microsoft accounts
only**.
* Under **Redirect URI**, choose **Public client / native (mobile &
desktop)** and set the URI to:
```
`
https://login.microsoftonline.com/common/oauth2/nativeclient
`
```
* Click **Register**.
* From the **Overview** panel, copy the **Application (client) ID** - this
is your `client\_id`.
* Under **Manage -\> Authentication**, scroll to **Advanced settings** and set
**Allow public client flows** to **Yes**, then click **Save**. This enables
the device code flow used to obtain the initial token.
* Under **Manage -\> API permissions**:
* Click **Add a permission** -\> **Microsoft Graph** -\>
**Delegated Permissions**
* Search for and check **Mail.Send**, then click **Add permissions**
`offline\_access` (required to receive a rotating refresh token) is included
automatically - you do not need to add it separately.
No admin consent step is required for delegated permissions on personal
accounts.
## Getting Your Refresh Token
[Section titled “Getting Your Refresh Token”](#getting-your-refresh-token)
This is a **one-time step**. The scripts below use Microsoft’s
[Device Code Flow](https://learn.microsoft.com/en-us/entra/identity-platform/v2-oauth2-device-code):
your script prints a short code and a link; you open that link in any browser
and sign in; the script captures your `refresh\_token` automatically.
The whole process typically takes under two minutes.
* [ Python ](#tab-panel-162)
* [ Bash · curl ](#tab-panel-163)
* [ PowerShell ](#tab-panel-164)
Only `requests` is required - already installed if you have Apprise.
Edit the `CLIENT\_ID` line, then copy and paste the entire block into your
terminal.
```
`
import time, requests
# - Edit this line
CLIENT\_ID = "your-client-id-here" # Application (client) ID from Azure
# -
DEVICE\_URL = "https://login.microsoftonline.com/consumers/oauth2/v2.0/devicecode"
TOKEN\_URL = "https://login.microsoftonline.com/consumers/oauth2/v2.0/token"
SCOPE = "Mail.Send offline\_access"
# Step 1 - request a device code
r = requests.post(DEVICE\_URL, data={"client\_id": CLIENT\_ID, "scope": SCOPE})
r.raise\_for\_status()
d = r.json()
# Step 2 - the script prints a link and a short code; open the link in a
# browser and enter the code to sign in with your Microsoft account
print("\\n" + d["message"] + "\\n")
# Step 3 - poll quietly until you finish signing in (usually under 60 sec)
interval = d.get("interval", 5)
while True:
time.sleep(interval)
r = requests.post(TOKEN\_URL, data={
"client\_id": CLIENT\_ID,
"grant\_type": "urn:ietf:params:oauth:grant-type:device\_code",
"device\_code": d["device\_code"],
})
t = r.json()
if "refresh\_token" in t:
print("Your refresh\_token (use this in your Apprise URL):\\n")
print(t["refresh\_token"])
break
if t.get("error") == "slow\_down":
interval += 5
elif t.get("error") != "authorization\_pending":
print("Error:", t.get("error\_description", t))
break
`
```
Microsoft’s refresh tokens expire if unused for **90 days**. As long as Apprise
sends at least one notification within that window, the token renews itself
automatically on every successful send. If it does expire, simply re-run any
of the scripts above.
## Personal Syntax
[Section titled “Personal Syntax”](#personal-syntax)
Valid syntax is as follows (both `o365://` and `azure://` are accepted aliases):
* `o365://{source}/{client\_id}/{refresh\_token}/`
* `o365://{source}/{client\_id}/{refresh\_token}/{targets}`
Apprise automatically detects personal mode when `source` is a known consumer
domain (`outlook.com`, `hotmail.com`, `live.com`, `msn.com`, and regional
variants). Use `?mode=personal` to force personal mode on any other domain.
## Personal Parameters
[Section titled “Personal Parameters”](#personal-parameters)
|Variable|Required|Description|
|source|\*Yes|Your consumer email address (e.g. `user@outlook.com`). Used as the sender and, when no `targets` are given, also as the recipient.|
|client\_id|\*Yes|The **Application (client) ID** from your Azure app registration.|
|refresh\_token|\*Yes|The refresh token from the one-time setup above. Apprise rotates this automatically on each successful send.|
|targets|No|One or more recipient email addresses. If omitted, email is sent to `source`.|
|to|No|Alias for `targets`. Useful in YAML configuration.|
|cc|No|One or more **Carbon Copy** addresses. Accepts comma-separated values and named addresses (e.g. `Name \<email@example.com\>`).|
|bcc|No|One or more **Blind Carbon Copy** addresses. Accepts comma-separated values and named addresses (e.g. `Name \<email@example.com\>`).|
|reply\_to|No|One or more **Reply-To** addresses. When a recipient replies, their reply goes here instead of to `source`. Accepts comma-separated values and named addresses.|
|mode|No|Force personal mode on a non-standard domain: `?mode=personal`.|
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
Query-style aliases are also supported: `oauth\_id` for `client\_id` and
`oauth\_secret` for `refresh\_token`.
The `refresh\_token` is a long string that often contains characters (`+`, `=`,
`/`) that conflict with URL parsing. If Apprise cannot parse your URL correctly,
URL-encode the token first using [this site](https://www.url-encode-decode.com/)
or replace characters manually:
* `+` -\> `%2B`
* `=` -\> `%3D`
* `/` -\> `%2F`
## Personal Examples
[Section titled “Personal Examples”](#personal-examples)
Send from a personal Outlook account (mode is auto-detected from the domain):
Terminal window
```
`
# source: you@outlook.com
# client\_id: aa-bb-cc-dd-ee
# refresh\_token: (from the script above)
apprise -vv -t "Test Title" -b "Test Body" \\
"o365://you@outlook.com/aa-bb-cc-dd-ee/your-refresh-token-here/"
`
```
Send to a different recipient from your Hotmail account:
Terminal window
```
`
apprise -vv -t "Hello" -b "Message body" \\
"o365://me@hotmail.com/aa-bb-cc-dd-ee/your-refresh-token-here/friend@example.com"
`
```
Force personal mode on a non-standard domain:
Terminal window
```
`
apprise -vv -t "Hello" -b "Message body" \\
"o365://me@custom.com/aa-bb-cc-dd-ee/your-refresh-token-here/?mode=personal"
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