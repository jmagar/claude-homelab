Custom Notification Decorator | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Custom Notification Decorator
Apprise supports **lightweight, file-based notification handlers** via the `@notify()` decorator.
This is ideal when you want a quick integration without creating and publishing a full Apprise plugin.
The decorator system works by importing a Python module and collecting any functions registered with `@notify()`.
Those functions are then exposed as Apprise schemas.
## When to use a decorator
[Section titled “When to use a decorator”](#when-to-use-a-decorator)
Use a decorator-based handler when:
* You need a quick, local integration for personal or controlled environments.
* You want to glue Apprise to local automation, scripts, or a private service.
* You do not want to maintain a full plugin lifecycle (tests, packaging, release cadence).
Avoid a decorator-based handler when:
* You want to ship a service to Apprise itself (upstream contribution).
* You need strict parsing, templates, native URL reversal, batching, or robust retry logic.
* You require long-term stability, public distribution, or third-party usage.
## Critical Security Note
[Section titled “Critical Security Note”](#critical-security-note)
The decorator system requires importing a Python module to discover the decorated functions.
**Importing a module executes code at import time.**
That means:
* Any code at module scope will run, not just the decorated function.
* Any imports inside that module will execute.
* Any side effects, file access, network calls, or subprocess calls can occur during load.
Only use decorator-based handlers for **trusted code** in **controlled environments**.
Do not point Apprise at a shared or untrusted filesystem location.
## Decorator vs Full Plugin
[Section titled “Decorator vs Full Plugin”](#decorator-vs-full-plugin)
Here is the practical decision rule.
|Capability|`@notify()` Decorator|Full Apprise Plugin|
|Time to implement|Minutes|Hours to days|
|Packaging and distribution|Local file|PyPI, distro packages, upstream|
|URL templates and validation|Minimal|Built-in patterns (tokens, args, and strict parsing)|
|Privacy handling in `url()`|Manual|Standardized (`PrivacyMode.Secret`)|
|Native URL reversal|Rare|Expected when feasible|
|Attachments support|You implement|Built-in patterns (`AppriseAttachment`)|
|Throttling, retry patterns|You implement|Standardized (`throttle()`, request helpers)|
|Testability|Ad-hoc|Built-in patterns (`AppriseURLTester`, and error paths)|
|Best for|Private automation|Upstream services and public use|
If your handler is likely to be reused by other people, becomes business-critical, or needs strong URL parsing, an Apprise plugin is usually more appropriate.
## Basic Usage
[Section titled “Basic Usage”](#basic-usage)
At minimum, you must define a **unique schema** and a Python function.
```
`
from apprise.decorators import notify
# Maps 'foobar://' to this function and prints to stdout
@notify(on="foobar")
def my\_wrapper(body, title, notify\_type, \*args, \*\*kwargs):
print(f"{notify\_type}: {title} - {body}")
`
```
Once loaded, Apprise can trigger this function using:
Terminal window
```
`
apprise -b "Hello world" foobar://
`
```
### Return Values
[Section titled “Return Values”](#return-values)
A decorated function should return:
* `True` to indicate success
* `False` to indicate failure
* `None` (or no return), which is treated as success
Failures propagate back to Apprise and affect overall notification status.
## Function Signature
[Section titled “Function Signature”](#function-signature)
Your wrapper function may accept the following parameters.
|Parameter|Required|Description|
|`body`|Yes|Notification body|
|`title`|No|Notification title|
|`notify\_type`|No|One of `info`, `success`, `warning`, `failure`|
|`body\_format`|No|`text`, `html`, or `markdown`|
|`meta`|No|Parsed and merged URL metadata|
|`attach`|No|List of `AppriseAttachment` objects
See [Attachments](../attachments/) for how to read, validate, and forward files from decorators.|
|`\*args`|Yes|Required for forward compatibility|
|`\*\*kwargs`|Yes|Required for forward compatibility|
\*\*Always include `\*args` and `\*\*kwargs`\*\* to remain compatible with future Apprise releases.
A minimal wrapper may look like:
```
`
from apprise.decorators import notify
@notify(on="foobar")
def my\_wrapper(body, \*args, \*\*kwargs):
print(body)
`
```
## The `meta` dictionary
[Section titled “The meta dictionary”](#the-meta-dictionary)
The `meta` parameter provides a fully parsed and merged view of:
1. The decorator declaration URL
2. The user-supplied initialization URL
Example structure:
```
`
{
"schema": "foobar",
"url": "foobar://user:pass@host:80/path?key=value",
"host": "host",
"user": "user",
"password": "pass",
"port": 80,
"path": "/",
"fullpath": "/path",
"query": "key=value",
"qsd": {"key": "value"},
"asset": AppriseAsset(),
"tag": set(),
}
`
```
Only fields present in the URL are included. At minimum, `schema`, `url`, `asset`, and `tag` are always present.
## Complex Declarations
[Section titled “Complex Declarations”](#complex-declarations)
The decorator can preload defaults by specifying a full URL.
```
`
@notify(on="foobar://localhost:234?notify\_on\_complete=0")
def my\_wrapper(body, meta, \*args, \*\*kwargs):
pass
`
```
Users may override these values at runtime:
Terminal window
```
`
apprise -b "override" foobar://example.com?notify\_on\_complete=1
`
```
Merged result:
```
`
{
"schema": "foobar",
"url": "foobar://example.com:234?notify\_on\_complete=1",
"host": "example.com",
"port": 234,
"qsd": {
"notify\_on\_complete": "1"
}
}
`
```
## Plugin Examples
[Section titled “Plugin Examples”](#plugin-examples)
* [ Simple Logger ](#tab-panel-158)
* [ Web Request ](#tab-panel-159)
* [ Shell Triggers ](#tab-panel-160)
* [ PostgreSQL Write ](#tab-panel-161)
This example appends a time to the end of a file when called
**Usage:** `demo://`
apprise/plugins/mylogger.py
```
`
from apprise.decorators import notify
import logging
@notify(on="demo")
def my\_wrapper(body, title, notify\_type, \*args, \*\*kwargs):
# Configure the logging system
logging.basicConfig(
filename='/tmp/my-demo.log',
level=logging.DEBUG, filemode='w',
format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')
# Create a logger instance
logger = logging.getLogger(\_\_name\_\_)
# Log a simple message at the INFO level
logger.info("f{title} - {body}")
`
```
The examples will show that Apprise can extend well beyond simple notifications; it can also be used to automate and trigger workflows you perform every day.
Defaults defined in the decorator persist unless explicitly overridden.
## Plugin Registration Behaviour
[Section titled “Plugin Registration Behaviour”](#plugin-registration-behaviour)
Internally, the decorator:
* Registers a dynamic `NotifyBase` wrapper
* Binds your function to the schema
* Enforces schema uniqueness
* Supports attachments and persistent storage automatically
If a schema already exists, Apprise logs a warning and skips registration.
## Loading Custom Decorators
[Section titled “Loading Custom Decorators”](#loading-custom-decorators)
### Apprise CLI
[Section titled “Apprise CLI”](#apprise-cli)
By default, Apprise scans:
* Linux and macOS:
* `\~/.apprise/plugins`
* `\~/.config/apprise/plugins`
* Windows:
* `%APPDATA%/Apprise/plugins`
* `%LOCALAPPDATA%/Apprise/plugins`
Override using:
Terminal window
```
`
apprise -P /custom/plugin/path -b "test" foobar://
`
```
### Python API
[Section titled “Python API”](#python-api)
Provide plugin paths through `AppriseAsset`:
```
`
from apprise import Apprise, AppriseAsset
asset = AppriseAsset(plugin\_paths=[
"/path/to/plugins",
"/path/to/plugin.py",
])
aobj = Apprise(asset=asset)
aobj.add("foobar://")
aobj.notify("Hello")
`
```
Directory scanning rules:
* Hidden files and directories are ignored
* A directory with `\_\_init\_\_.py` loads only that file
* Directories without `\_\_init\_\_.py` load all `.py` files at that level
* Scanning is non-recursive
## Restrictions and Best Practices
[Section titled “Restrictions and Best Practices”](#restrictions-and-best-practices)
* Schemas must be unique
* Keep modules import-safe.
Do not perform network calls or long-running work at import time.
* Validate and sanitize `meta` values before using them.
* Prefer allowlists over dynamic execution.
* Put secrets in environment variables or secret stores, not in URLs.
* If you need strong parsing, batching, attachments, or upstream contribution, write a full plugin instead.
## Summary
[Section titled “Summary”](#summary)
The Apprise decorator API provides a fast, flexible way to extend Apprise with custom logic while preserving the familiar `schema://` interface. It is ideal for internal workflows, automation hooks, and tightly integrated systems.
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