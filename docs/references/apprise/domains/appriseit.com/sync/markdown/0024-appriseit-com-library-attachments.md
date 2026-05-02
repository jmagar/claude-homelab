Attachments | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Attachments
When you pass `attach=` into `Apprise.notify()`, Apprise normalizes every entry into an
`AppriseAttachment` object (internally backed by `AttachBase`
implementations). Plugins that opt in (by setting
`attachment\_support = True`) receive a list of attachment objects through
the `attach` argument of `send()`.
From a plugin author perspective, an attachment is a small, uniform API
that lets you:
* Validate availability (`if not attachment: ...`)
* Read from disk (`attachment.path`, `attachment.open()`, `attachment.chunk()`)
* Get metadata (`attachment.name`, `attachment.mimetype`, `len(attachment)`)
* Convert to base64 (`attachment.base64()`), for APIs that require inline payloads
* Control privacy in logs (`attachment.url(privacy=True)`)
## What Plugins Receive
[Section titled “What Plugins Receive”](#what-plugins-receive)
When a plugin declares attachment support:
```
`
class NotifyFooBar(NotifyBase):
# Declare awareness to the Apprise library that this service supports
# attachments
attachment\_support = True
def send(self, body, title="", notify\_type=NotifyType.INFO, attach=None, \*\*kwargs):
# Add 'attach' into your send() call as it will be populated when one
# or more attachments exist.
if attach:
for a in attach:
# ...
pass
`
```
`attach` is either:
* `None` or an empty list when no attachments were provided
* A list of `AttachBase` objects (for example: `AttachFile`, `AttachHTTP`,
`AttachMemory`)
A quick rule of thumb:
* `if not a:` means the attachment is not currently usable.
* `a.path` triggers a download or validation step when needed.
* `len(a)` returns the attachment size in bytes, when known.
## Attachment Sources
[Section titled “Attachment Sources”](#attachment-sources)
Apprise supports multiple attachment sources. These are all normalized to
the same API surface.
* [ Local File (file://) ](#tab-panel-56)
* [ Hosted URL (http://, https://) ](#tab-panel-57)
* [ In-Memory (memory://) ](#tab-panel-58)
**`AttachFile`** — local files reference server-side paths. The simplest usage is passing a path string directly — Apprise converts it to a `file://` URL internally:
```
`
# Single path — Apprise wraps it in AttachFile automatically
apobj.notify(body="See log", attach="/var/log/syslog")
# Multiple paths
apobj.notify(
body="Build artifacts",
attach=["/var/log/syslog", "/tmp/report.pdf"],
)
`
```
`file://` is the default schema if one isn’t provided. The path `/var/log/syslog` is treated identically to `file:///var/log/syslog`.
**Direct constructor** — use `AttachFile` when you need to override the filename or MIME type presented to the upstream service without renaming the file on disk:
```
`
from apprise.attachment import AttachFile
# Override the filename and MIME type the service sees
a = AttachFile(
"/var/log/app.log",
name="2026-03-20-app.log", # presented name, not a rename
mimetype="text/plain",
)
apobj.notify(body="Nightly log", attach=a)
`
```
**Key Behaviours:**
* Content is validated in-place — it is not copied or moved.
* `name=` and `mimetype=` override what the plugin sends upstream; the file on disk is unchanged.
* Size limits are enforced via `max\_file\_size` (defaults to 1 GB).
* `attachment.path` returns the absolute path to the file.
* `attachment.open()` returns a readable file handle and is the correct way to stream content in plugins.
### Content Location Modes
[Section titled “Content Location Modes”](#content-location-modes)
Attachment handling is governed by content location rules:
|Value|Description|
|`LOCAL`|Allows local files, memory attachments, and hosted content.|
|`HOSTED`|Intended for hosted services. Local file and memory attachments are rejected.|
|`INACCESSIBLE`|Attachments are disabled entirely. All downloads fail and attachments evaluate to `False`.|
## URL Parameters Shared by Attachment Types
[Section titled “URL Parameters Shared by Attachment Types”](#url-parameters-shared-by-attachment-types)
|Value|Description|
|`mime`|Attachment URLs support a small set of common query parameters.
Forces the attachment MIME type, bypassing detection. This is useful when the upstream API chooses behaviour based on MIME type.|
|`name`|Forces the filename presented to the plugin. This does not rename local files, it only changes the metadata (`attachment.name`) and what the plugin might send upstream.|
## Working with Attachments in Plugins
[Section titled “Working with Attachments in Plugins”](#working-with-attachments-in-plugins)
### Validate Access
[Section titled “Validate Access”](#validate-access)
Always verify attachments are available before using them:
```
`
for attachment in attach:
if not attachment:
self.logger.error(
"Could not access attachment %s.",
attachment.url(privacy=True),
)
return False
`
```
An attachment can fail because it is missing, exceeds size limits, is inaccessible for the current runtime location, or could not be downloaded.
### Prefer `attachment.open()` for upload APIs
[Section titled “Prefer attachment.open() for upload APIs”](#prefer-attachmentopen-for-upload-apis)
Many services require multipart uploads. Use `attachment.open()` to get a file-like object — this works correctly for **all** attachment types, including `AttachMemory` which has no path on disk:
```
`
filename = attachment.name
mimetype = attachment.mimetype
fh = attachment.open()
try:
files = {"file": (filename, fh, mimetype)}
r = requests.post(url, files=files, ...)
finally:
fh.close()
`
```
Or using the context manager form:
```
`
with attachment as f:
files = {"file": (attachment.name, f, attachment.mimetype)}
r = requests.post(url, files=files, ...)
`
```
Do **not** call `open(attachment.path, "rb")` directly. `attachment.path` returns `None` for remote attachments that have not yet been downloaded, and returns only a bare filename (not a full path) for `AttachMemory` objects — both will raise an `OSError`. Always use `attachment.open()` or `with attachment as f:` instead.
### Base64 When The Upstream Requires It
[Section titled “Base64 When The Upstream Requires It”](#base64-when-the-upstream-requires-it)
All attachment types support Base64 export. Some APIs require base64 encoded attachments. Use `attachment.base64()`:
```
`
encoded = attachment.base64() # returns a str by default
payload["base64\_attachments"].append(encoded)
`
```
* `base64()` returns a string
* `base64(encoding=None)` returns raw bytes
If the attachment cannot be read, `base64()` raises an Apprise exception. Catch it and fail gracefully.
This is commonly used by APIs that do not support multipart uploads.
### Stream in Chunks When Needed
[Section titled “Stream in Chunks When Needed”](#stream-in-chunks-when-needed)
If you must avoid reading a full file into memory, use `attachment.chunk()`:
```
`
for chunk in attachment.chunk(size=5 \* 1024 \* 1024):
# upload / write chunk
...
`
```
### Cleanup and Lifecycle
[Section titled “Cleanup and Lifecycle”](#cleanup-and-lifecycle)
Plugins do not usually need to manually delete downloaded temporary files. Attachment objects manage their own cleanup through `invalidate()` and destructors.
If you hold on to attachment objects beyond `send()`, you are responsible for understanding the lifecycle. In general, treat attachments as ephemeral.
## Limits and Safety
[Section titled “Limits and Safety”](#limits-and-safety)
* Size limits are enforced by `AttachBase.max\_file\_size`. If your service has a smaller limit, enforce it in your plugin using `len(attachment)` and fail early.
* Attachment support is opt-in per plugin using `attachment\_support = True`. If your service cannot accept files, leave this disabled.
* Use `attachment.url(privacy=True)` in logs. This ensures any embedded secrets are redacted.
## Guidance For Plugin Authors
[Section titled “Guidance For Plugin Authors”](#guidance-for-plugin-authors)
Plugins should validate attachment size and count early and handle inaccessible
attachments gracefully
## Practical Examples in Core Plugins
[Section titled “Practical Examples in Core Plugins”](#practical-examples-in-core-plugins)
The core project includes common patterns you can copy.
* Uploading attachments as files (multipart) with MIME-based selection.
* Converting attachments to base64 for JSON APIs.
* Iterating attachments and reporting partial failure.
See the [Telegram](https://github.com/caronc/apprise/blob/master/apprise/plugins/telegram.py) and [Signal API](https://github.com/caronc/apprise/blob/master/apprise/plugins/signal_api.py) plugins for real-world implementations of both patterns.
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