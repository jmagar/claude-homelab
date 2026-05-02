Formatting & Attachments | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Formatting & Attachments
Apprise can deliver **plain text**, **Markdown**, **HTML**, and **attachments**, then adapt what you send to what each service can actually accept. For example, a service that only supports text will still receive your notification, but any rich formatting will be reduced appropriately.
## Message Formats
[Section titled “Message Formats”](#message-formats)
Apprise does **not** automatically guess your content type. Instead, you tell Apprise **what kind of content you are providing**, and Apprise uses that knowledge to make intelligent, per-service delivery decisions.
Apprise recognises four **input format states**:
|State|Description|
|*(implicit)***none**|No format declared. Content is passed through unchanged.|
|**text**|Plain text input. Apprise may simplify content for text-only services.|
|**markdown**|Markdown input. Apprise may convert or simplify as needed.|
|**html**|HTML input. Apprise may strip or convert markup as required.|
* The `none` state is implicit. It is used automatically when no format is provided.
* The `none` state cannot be explicitly set via the CLI, Library, or API.
**In short**: Apprise preserves your content whenever possible, and only adapts it when a destination cannot support what you provided.
### Declaring Input vs Transforming Output
[Section titled “Declaring Input vs Transforming Output”](#declaring-input-vs-transforming-output)
When you specify a format (such as `text`, `markdown`, or `html`), you are **describing your input**, not forcing a specific output format.
Apprise uses this information to determine **whether any transformation is necessary** for a given destination.
* If the destination service natively supports the declared format, content is passed through unchanged
* If the destination cannot support the declared format, Apprise performs the minimal conversion required
* If no conversion is required, no transformation occurs
In other words, Apprise only intervenes **when there is a mismatch** between the declared input format and what the upstream provider can support. It can only do this when you have provided an input format to work with.
For example:
* An **HTML** message sent to Email may be delivered as rich HTML
* The **same HTML** message sent to SMS will be converted to readable plain text
* A **Markdown** message sent to a chat service may retain formatting
* That **same Markdown** message sent to a text-only service will be simplified automatically
This makes destinations more compatible *without* requiring you to manually tailor content per service.
### What Happens if you do not Specify a Format?
[Section titled “What Happens if you do not Specify a Format?”](#what-happens-if-you-do-not-specify-a-format)
If you do **not** specify a format, Apprise assumes slightly different states depending on which component you’re using:
|Interface|Default input format|
|[CLI](../../cli/)|`text`|
|[Python API](../../library/)|`none` - content passed as is unless `body\_format` is provided in the `notify()` call or preset in the `AppriseAsset()` object|
|[Apprise-API](../../api/)|`none` - content passed as is unless `format` is provided in `/notify/` payload|
With the exception of the CLI, if no `input\_format` is specified:
* Content is passed **as-is**
* No conversion or sanitisation occurs within Apprise
* Any markup (HTML, Markdown, etc.) is treated as literal text
This behaviour is intentional and useful when:
* You already know the destination is text-only
* You want exact control over what is sent
Declaring the correct input format is optional, but doing so allows Apprise to assist more effectively across mixed destinations.
## CLI Examples
[Section titled “CLI Examples”](#cli-examples)
Use `--input-format` to tell Apprise how to interpret your body content.
Terminal window
```
`
# Markdown body
apprise -t "Release" -b "\*\*v1.2.3\*\* is now live" \\
--input-format=markdown \\
"discord://..."
# HTML body
apprise -t "Build Report" -b "\<b\>Success\</b\>: artifacts uploaded" \\
--input-format=html \\
"mailto://user:pass@example.com"
`
```
## Python Library Examples
[Section titled “Python Library Examples”](#python-library-examples)
Use `body\_format` to specify the message format you are providing.
```
`
from apprise import Apprise
from apprise import NotifyFormat
apobj = Apprise()
apobj.add("discord://...")
# Markdown input
apobj.notify(
title="Status",
body="\*\*All checks passed\*\*",
body\_format=NotifyFormat.MARKDOWN,
)
# HTML input
apobj.notify(
title="Build Report",
body="\<b\>Success\</b\>: artifacts uploaded",
body\_format=NotifyFormat.HTML,
)
`
```
## Apprise-API Examples
[Section titled “Apprise-API Examples”](#apprise-api-examples)
For JSON payloads, use the `format` field:
Terminal window
```
`
# Stateless Example
curl -X POST http://localhost:8000/notify/ \\
-d 'urls=["discord://..."]' \\
-d 'title=Status' \\
-d 'body=\*\*All checks passed\*\*' \\
-d 'format=markdown'
# Stateful Example
curl -X POST http://localhost:8000/notify/team-alerts/\\
-d 'tags=outage' \\
-d 'type=failure' \\
-d 'title=Outage Report' \\
-d 'body=\<strong\>File Server is no longer responding\</strong\>' \\
-d 'format=html'
`
```
If you’re using Apprise already, consider just using the [Apprise API Service](../../services/apprise_api/) to simplify Stateful queries:
Terminal window
```
`
# --config= allows you to source an upstream Apprise API for your
# configuration.
apprise --config=http://localhost:8000/cfg/team-alerts/ \\
--tag=outage \\
--input-format=html \\
--notification-type=failure \\
--title "Outage Report" \\
--body "\<strong\>File Server is no longer responding\</strong\>"
`
```
If you are already using the API heavily (especially for multi-language examples and multipart uploads), the [API Integrations](../../api/integrations/) page is the canonical reference.
Provided the Apprise API server has not enabled the `APPRISE\_CONFIG\_LOCK`, you can put your Apprise API configuration URL in one of the default configuations the Apprise CLI looks for to make your query even easier to use:
\~/.config/apprise/apprise.yaml
```
`
include http://localhost:8000/cfg/team-alerts/
`
```
Now your CLI command simplifies significantly:
Terminal window
```
`
apprise --tag=outage --input-format=html --notification-type=failure \\
--title "Outage Report" \\
--body "\<strong\>File Server is no longer responding\</strong\>"
`
```
## Selecting an Output Format (Upstream Delivery)
[Section titled “Selecting an Output Format (Upstream Delivery)”](#selecting-an-output-format-upstream-delivery)
In addition to declaring the **input format**, some services allow you to select how content is delivered **upstream** by specifying a `format=` parameter directly in the service URL.
This does **not** describe the input you are providing. Instead, it instructs the service plugin which delivery route or representation to use, *if supported*.
### How Input and Output Formats Work Together
[Section titled “How Input and Output Formats Work Together”](#how-input-and-output-formats-work-together)
* **Input format** (`body\_format`, `--input-format`, API `format`)
Tells Apprise *what kind of content you are providing*
* **Output format** (`?format=` on a service URL)
Tells the service plugin *how to deliver that content upstream*
When both are specified, Apprise will correctly adapt the content as needed before handing it off to the selected upstream delivery route.
If the upstream service does **not** support the requested output format, it is silently ignored and the service’s default behaviour is used instead.
### Examples
[Section titled “Examples”](#examples)
#### Email
[Section titled “Email”](#email)
Email supports multiple delivery formats.
```
`
# Default behaviour (HTML email)
mailto://user:pass@example.com
# Force plain-text email delivery
mailto://user:pass@example.com?format=text
`
```
In this case:
* `format=html` is unnecessary because HTML is the default
* `format=text` explicitly selects the plain-text delivery route
* `format=markdown` is ignored because email does not support Markdown delivery
#### Services with Multiple Endpoints
[Section titled “Services with Multiple Endpoints”](#services-with-multiple-endpoints)
Some services expose different API endpoints depending on format support.
In these cases, setting `format=` may:
* Select a different upstream endpoint
* Change how content is rendered by the service
* Bypass formatting transformations entirely
This behaviour is **plugin-specific** and only applies when the service explicitly supports multiple output formats.
### When Is This Useful?
[Section titled “When Is This Useful?”](#when-is-this-useful)
Specifying an output format is useful when:
* You want to force a specific delivery type (for example, text-only email)
* The service supports multiple content representations
* You are sending content *as-is* and need to route it through a specific upstream path
If a service does not support the requested output format, Apprise safely falls back to the default behaviour.
## Attachments
[Section titled “Attachments”](#attachments)
Attachments let you send files such as images, logs, PDFs, and artifacts alongside your message. Whether they arrive as true attachments depends on what the destination service supports.
### CLI attachments
[Section titled “CLI attachments”](#cli-attachments)
Use `--attach` one or more times:
Terminal window
```
`
apprise -t "System Alert" -b "See attached log" \\
--attach /var/log/syslog \\
"mailto://user:pass@example.com"
apprise -b "Here are the files" \\
--attach /tmp/photo1.jpg \\
--attach /tmp/photo2.jpg \\
"tgram://..."
`
```
### Python Attachments
[Section titled “Python Attachments”](#python-attachments)
Pass a single path or a list of paths via `attach`:
```
`
from apprise import Apprise
apobj = Apprise()
apobj.add("tgram://...")
# Single attachment
apobj.notify(body="See attached", attach="/path/to/file.txt")
# Multiple attachments
apobj.notify(
body="Artifacts attached",
attach=[
"/path/to/build.log",
"/path/to/report.pdf",
],
)
`
```
### Remote Attachments (URLs)
[Section titled “Remote Attachments (URLs)”](#remote-attachments-urls)
You can also provide a URL and Apprise will fetch it before delivering:
```
`
# Apprise will download this image and send it to the destination
# if you provide a user/pass combo, it will even authenticate for you
# prior to retrieving the attachment
apobj.notify(
body="Security Camera Snapshot",
attach="http://admin:pass@example.local/cam/snapshot.jpg"
)
`
```
If a remote attachment URL includes credentials, treat it like a secret. Avoid committing it into repositories or logs.
### In-Memory Attachments (AttachMemory)
[Section titled “In-Memory Attachments (AttachMemory)”](#in-memory-attachments-attachmemory)
When you generate content on the fly — rendered HTML, chart images, CSVs, PDFs — you can pass it directly as an `AttachMemory` object without writing anything to disk.
* [ CSV (general) ](#tab-panel-36)
* [ Pillow (image) ](#tab-panel-37)
* [ Matplotlib (chart) ](#tab-panel-38)
Pass a string or `bytes` directly — no temporary file is created:
```
`
import apprise
from apprise.attachment import AttachMemory
apobj = apprise.Apprise()
apobj.add("discord://webhook\_id/webhook\_token/")
apobj.notify(
body="Today's readings are attached.",
attach=AttachMemory(
content="date,value\\n2026-03-20,42\\n2026-03-21,38\\n",
name="readings.csv",
mimetype="text/csv",
),
)
`
```
`str` content is encoded to UTF-8 automatically. Use `bytes` if you already have binary data.
For full details on all three attachment types (`AttachFile`, `AttachHTTP`, `AttachMemory`) and plugin-author guidance, see the [Attachments reference](../../library/attachments/).
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