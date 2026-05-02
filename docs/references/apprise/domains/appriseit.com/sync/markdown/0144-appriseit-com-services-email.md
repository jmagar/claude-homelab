Email Notifications | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Email Notifications
## Overview
* **Image Support:** No
* **Attachment Support:** Yes
* **Message Character Limits:**
* Body: 32768
* [ Build Your Apprise URL](/url-builder/?schema=mailto)
## Syntax
[Section titled “Syntax”](#syntax)
Valid syntax is as follows:
* `mailto://{user}:{password}@{domain}`
* `mailto://{user}:{password}@{domain}:{port}`
* `mailto://{domain}?user={user}&pass={password}`
* `mailto://{user}:{password}@{domain}/{to\_email}`
* `mailto://{user}:{password}@{domain}/{to\_email1}/{to\_email2}/{to\_emailN}`
Adding an `s` to the schema (i.e. `mailtos://`) switches to a secure STARTTLS connection (port 587 by default):
* `mailtos://{user}:{password}@{domain}`
* `mailtos://{user}:{password}@{domain}:{port}`
* `mailtos://{domain}?user={user}&pass={password}`
* `mailtos://{user}:{password}@{domain}/{to\_email}`
* `mailtos://{user}:{password}@{domain}/{to\_email1}/{to\_email2}/{to\_emailN}`
## Built-In Provider Support
[Section titled “Built-In Provider Support”](#built-in-provider-support)
Apprise automatically detects many email providers based on the **From** address derived from your URL.
When a provider is recognized, Apprise automatically configures:
* SMTP host
* Port
* Secure mode (SSL or STARTTLS)
* Login format (full email vs user id)
In most cases, you only need to provide your email and password.
|Provider|Example URL|Notes|
|**Google (Gmail)**|`mailto://user:app-password@gmail.com`|If 2-Step Verification is enabled, generate an App Password: [https://security.google.com/settings/security/apppasswords](https://security.google.com/settings/security/apppasswords)|
|**Yahoo**|`mailto://user:app-password@yahoo.com`|Requires an App Password: [https://help.yahoo.com/kb/SLN15241.html](https://help.yahoo.com/kb/SLN15241.html)|
|**Fastmail**|`mailto://user:app-password@fastmail.com`|App Password must permit SMTP. See supported domains [here](./fastmail/).|
|**GMX**|`mailto://user:password@gmx.net`|Also supports `gmx.com`, `gmx.de`, `gmx.at`, `gmx.ch`, `gmx.fr`.|
|**Zoho**|`mailto://user:password@zoho.com`|Provider defaults are applied automatically.|
|**Yandex**|`mailto://user:password@yandex.com`|Login may be user-id based depending on domain rules.|
|**SendGrid (SMTP)**|`mailto://apikey:password@sendgrid.com?from=noreply@yourdomain.com`|`from=` must use a validated sender identity.|
|**QQ / Foxmail**|`mailto://user:password@qq.com`|Provider defaults are applied automatically.|
|**163.com**|`mailto://user:password@163.com`|Provider defaults are applied automatically.|
|**Microsoft (Outlook, Hotmail, Office 365)**|*Use `azure://` instead*|Microsoft disabled SMTP basic authentication. Use the [`azure://` plugin](/services/office365/).|
>
> This is not an exhaustive list. Additional domains are automatically detected when supported.
>
When a supported provider is detected, Apprise automatically enforces secure connections using the correct TLS mode and port.
Even if you use `mailto://`, secure mode is applied when the provider template defines it.
If you explicitly specify `smtp=`, Apprise assumes you are overriding provider detection.
## Email Address Formatting
[Section titled “Email Address Formatting”](#email-address-formatting)
Email addresses may be written as:
* `user@example.com`
* `Optional Name\<user@example.com\>`
This syntax works in:
* URL targets
* `from=`
* `cc=`
* `bcc=`
* `reply=`
If you need spaces inside a URL, encode them as `%20`.
Example:
```
`
from=Optional%20Name\<noreply@example.com\>
`
```
## Recipient Behaviour
[Section titled “Recipient Behaviour”](#recipient-behaviour)
|What you specify|What happens|
|No targets and no `to=`|Apprise sends the email to the sender address (the derived From email).|
|Targets in the URL path|Each target becomes a recipient.|
|`to=` in the query string|Treated as an additional recipient (same as adding a target).|
|`cc=` / `bcc=`|Applied to each generated email.|
|`reply=`|Sets the Reply-To header (can be multiple).|
## Using Custom SMTP Servers
[Section titled “Using Custom SMTP Servers”](#using-custom-smtp-servers)
If your provider is not automatically detected, configure SMTP manually.
Defaults:
* `mailto://`: defaults to port **25**
* `mailtos://`: defaults to port **587** using STARTTLS
Most public providers require TLS. Prefer `mailtos://` for external servers.
### Authenticated SMTP Examples
[Section titled “Authenticated SMTP Examples”](#authenticated-smtp-examples)
Send using a custom SMTP host:
* `mailtos://user:password@server.com?smtp=smtp.server.com&from=noreply@server.com`
Include a From display name:
* `mailtos://user:password@server.com?smtp=smtp.server.com&from=Optional%20Name\<noreply@server.com\>`
Force SSL (usually port 465):
* `mailtos://user:password@server.com:465?smtp=smtp.server.com&mode=ssl&from=noreply@server.com`
## Local Relay (No Authentication Required)
[Section titled “Local Relay (No Authentication Required)”](#local-relay-no-authentication-required)
If you run Postfix, Exim, or another internal relay that does not require authentication, omit `user` and `pass`.
```
`
mailto://localhost?from=john@example.ca
`
```
Internal relay host:
```
`
mailto://relay-server?from=noreply@example.com&to=alerts@example.com
`
```
If the SMTP host differs from the URL host:
```
`
mailto://server.com?smtp=smtp.server.com&from=noreply@server.com
`
```
## From Name vs From Address
[Section titled “From Name vs From Address”](#from-name-vs-from-address)
If you want to set a display name, you can use either:
* `from=Optional%20Name\<noreply@example.com\>` (preferred)
* `name=Optional%20Name&from=noreply@example.com`
If both are provided, the name embedded in `from=` takes precedence.
## Header Manipulation
[Section titled “Header Manipulation”](#header-manipulation)
Email supports custom header injection by prefixing query keys with a plus symbol (**+**).
This is useful for mail filters, internal routing, and tagging.
### One Header
[Section titled “One Header”](#one-header)
Set:
* `X-Token: abcdefg`
Terminal window
```
`
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"mailto://localhost?to=john@example.ca&+X-Token=abcdefg"
`
```
### Multiple Headers
[Section titled “Multiple Headers”](#multiple-headers)
If you need to control some of the headers being sent to the mail server, you can simply generate keyword arguments that are prefixed with the plus (`+`) symbol.
For example, assuming you wanted to also pass along the following email headers (in your payload):
* `X-Token: abcdefg`
* `X-Apprise: is great`
You would structure your email like so:
Terminal window
```
`
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"mailto://localhost?to=john@example.ca&+X-Token=abcdefg&+X-Apprise=is%20great"
`
```
### Notes
[Section titled “Notes”](#notes)
* Header values must be URL-encoded when they contain spaces.
* Apprise automatically sets `X-Application` and merges in any headers you define.
## Multiple Recipients
[Section titled “Multiple Recipients”](#multiple-recipients)
By default, `mailto://user:pass@domain` sends to `user@domain` unless `to=` is specified.
Send to multiple recipients using either query form or path form:
* `mailto://user:pass@domain/?to=target@example.com,target2@example.com`
* `mailto://user:pass@domain/target@example.com/target2@example.com`
* `mailto://user:pass@domain/Accounting\<accounting@example.com\>/Billing\<billing@example.com\>`
There is no hard-coded limit to recipient count, though your SMTP server may impose one.
`cc=` and `bcc=` apply to every email sent. If you notify 3 recipients, the same cc and bcc lists are used for each generated email.
## Attachments
[Section titled “Attachments”](#attachments)
Attachments are fully supported.
SMTP provider limits may apply. Apprise does not impose attachment size restrictions.
## Parameter Breakdown
[Section titled “Parameter Breakdown”](#parameter-breakdown)
|Variable|Required|Description|
|user|Yes\*|SMTP username. May be a user id or a full email address. Can also be specified as `?user=`.|
|pass|Yes\*|SMTP password. Can also be specified as `?pass=`.|
|domain|Yes|Domain portion of the URL host. For `mailto://user:pass@example.com`, the domain is `example.com`.|
|port|No|SMTP port. Defaults to 25 (mailto) and 587 (mailtos) unless provider defaults are applied.|
|smtp|No|Override the SMTP host. If set, provider detection is bypassed.|
|from|No|From address. Supports `Optional Name\<email@example.com\>`. Maps to the email From header.|
|name|No|Legacy alias for the From name. If both `from=` and `name=` are provided, `from=` takes precedence.|
|to|No|Recipient override. Also supported via URL path targets.|
|cc|No|Carbon Copy recipients. Comma separated. Name formatting is supported.|
|bcc|No|Blind Carbon Copy recipients. Comma separated. Name formatting is supported.|
|reply|No|Reply-To recipients. Comma separated. Name formatting is supported.|
|mode|No|Secure mode: `ssl` or `starttls`. When using `mailto://`, specifying `mode=` upgrades to a secure connection.|
|pgp|No|Enable PGP encryption (`yes` or `no`). Defaults to `no`.|
|pgpkey|No|Path to a PGP public key (input key: `pgpkey`). Treated as sensitive.|
|+Header|No|Add custom email headers by prefixing keys with `+`. Example: `?+X-Team=Ops`.|
**\*** Not required for anonymous relays.
To avoid ambiguity, any URL parameter (`?key=value`) overrides values in the main URL:
* `mailto://usera:pass123@domain.com?user=foobar`: the user of `foobar` would over-ride the user `usera` specified. However since the password was not over-ridden, the password of `pass123` would be used still.
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
Built-in provider example:
Terminal window
```
`
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
mailto:///example:mypassword@gmail.com
`
```
Send an email to a custom provider; since no `smtp=` was identified, the host `example.com` is also assumed to be the SMTP server.
Terminal window
```
`
# Assuming the {domain} is example.com
# Assuming the {user} is george
# Assuming the {password} is pass123
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
mailto://george:pass123@example.com
# The above URL could also have been written like:
# mailto://example.com?user=george&pass=pass123
`
```
If the SMTP Server differs from the domain (which is usually the case), your URL should include the `?smtp=` keyword argument:
Terminal window
```
`
# Assuming the {domain} is example.com
# Assuming the {user} is george
# Assuming the {password} is pass123
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
mailto://george:pass123@example.com?smtp=smtp.example.com
`
```
In some cases, the `{user}` is an email address. In this case you can place this information in the URL parameters instead:
Terminal window
```
`
# Assuming the {domain} is example.com
# Assuming the {user} is george@example.com
# Assuming the {password} is pass123
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"mailto://example.com?user=george@example.com&pass=pass123"
# Note that the ampersand (&) that is used in the URL to separate
# one argument from another is also interpreted by the CLI as
# run in the background. Wrap your URL in quotes.
# Send an email to a smtp relay server you are hosting:
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
mailto://localhost?from=john@example.ca
`
```
Users with custom SMTP Servers will require a slightly more complicated configuration:
Terminal window
```
`
# Assuming the {smtp\_server} is mail.example.com
# Assuming the {send\_from} is joe@example.com
# Assuming the {login} is user1@example.com
# Assuming the {password} is pass123
# Assuming you want to use starttls (port 587)
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"mailtos://\_?user=user1@example.com&pass=pass123&smtp=mail.example.com&from=joe@example.com"
# Notes (for above URL):
# - Since no `to=` was specified above, the `from` address is notified
# - mailtos:// defaults to starttls on 587; if you want to use port 465 (SSL)
# you would just need to add `mode=ssl` to the parameter of your URL.
`
```
Here is a more complicated example where you want to use `ssl` and a custom port
Terminal window
```
`
# Assuming the {smtp\_server} is mail.example.com
# Assuming the {send\_from} is joe@example.com
# Assuming the {login} is user1@example.com
# Assuming the {password} is pass123
# Assuming you want to use ssl on port 12522
# Assuming you want your email to go to bob@example.com and jane@yahoo.ca
apprise -vv -t "Test Message Title" -b "Test Message Body" \\
"mailtos://example.com:12522?user=user1@example.com&pass=pass123&smtp=mail.example.com&from=joe@example.com&to=bob@example.com,jane@yahoo.ca&mode=ssl"
Local relay:
```bash
apprise -t "Test Title" -b "Test Body" \\
mailto://localhost?to=john@example.com
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