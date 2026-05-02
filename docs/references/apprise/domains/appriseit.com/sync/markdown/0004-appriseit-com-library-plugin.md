Plugin Development | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Plugin Development
## Introduction
[Section titled “Introduction”](#introduction)
Apprise plugins, also called **services**, are Python classes that inherit from `NotifyBase`. The fastest way to build a new one is to start from a working plugin that resembles your target integration, then adapt its URL shape, parsing, and send logic.
* [ Basic plugin ](#tab-panel-70)
* [ HTTP plugin ](#tab-panel-71)
* [ Boilerplate plugin ](#tab-panel-72)
This pattern is ideal for:
* Writing to a local destination (stdout, file, syslog)
* Prototyping a URL schema before adding networking
apprise/plugins/demo.py
```
`
from .base import NotifyBase
from ..common import NotifyType
from ..locale import gettext\_lazy as \_
class NotifyDemo(NotifyBase):
service\_name = \_("Apprise Demo Notification")
protocol = "demo"
setup\_url = "https://appriseit.com/services/demo/"
# Disable throttling for a purely local plugin
request\_rate\_per\_sec = 0
templates = (
"{schema}://",
)
def url(self, \*args, \*\*kwargs):
params = self.url\_parameters(\*args, \*\*kwargs)
return "{schema}://?{params}".format(
schema=self.protocol,
params=self.urlencode(params),
)
def send(self, body, title="", notify\_type=NotifyType.INFO, \*\*kwargs):
self.throttle()
print(f"{notify\_type} - {title} - {body}")
return True
@staticmethod
def parse\_url(url):
# demo:// has no host, so verify\_host must be False
return NotifyBase.parse\_url(url, verify\_host=False)
`
```
## Model Overview
[Section titled “Model Overview”](#model-overview)
### URL Parsing
[Section titled “URL Parsing”](#url-parsing)
Apprise determines what the `schema://` it has been provided and then launches the Notification Plugin’s `YourPlugin.parse\_url()` call to do the rest.
Usually the first call made in your `parse\_url()` function is to call the parent one (from `NotifyBase`). Doing so allows Apprise to extract further common URL parts such as `schema`, `host`, `port`, `user`, `password`, and `fullpath`. Your `parse\_url()` should focus on the pieces that are specific to your service, then return a `dict` whose keys match your `\_\_init\_\_()` signature.
A key rule that the unit tests enforce is that your template metadata must map cleanly to `\_\_init\_\_()` arguments, either directly (same name) or through `map\_to`.
### Throttling, Verification, and Timeouts
[Section titled “Throttling, Verification, and Timeouts”](#throttling-verification-and-timeouts)
`URLBase` defines common SSL verification and socket timeouts as URL arguments:
* `verify` controls `verify\_certificate`
* `rto` controls the socket read timeout
* `cto` controls the socket connect timeout
## url\_identifier
[Section titled “url\_identifier”](#url_identifier)
The `url\_identifier` property exists to uniquely identify one configuration from another so cached or persistent data does not clobber different configurations. It is also how Apprise generates a consistent, stable unique id from a URL.
* **Include** scheme or protocol, credentials, and upstream connection identity.
* **Exclude** targets (channels, recipients, endpoints).
* **Exclude** most GET parameters. Only include a GET parameter if it fundamentally changes how the upstream communication works.
If two URLs describe the same effective configuration, they should generate the same `url\_identifier`, and therefore the same `url\_id()`.
Also note the storage switch:
* If `store=no` is set, `url\_id()` returns `None`, and `url()` should preserve `store=no` in its output.
Example:
```
`
@property
def url\_identifier(self):
return (
self.secure\_protocol if self.secure else self.protocol,
self.user,
self.password,
self.host,
self.port if self.port else (443 if self.secure else 80),
)
`
```
the `url\_identifier` effectively gives the URL you defined a destinct reusable unique key to identify by. This same key is used in choosing a unique file location for the Persistent Storage engine to store cached information which avoids clobbering cache from another instance.
## Persistent storage opt-in (`storage\_mode`)
[Section titled “Persistent storage opt-in (storage\_mode)”](#persistent-storage-opt-in-storage_mode)
If your plugin performs repeated upstream lookups (OAuth tokens, discovery calls, resolved identifiers, capability checks), you should consider enabling persistent storage. It will save you from doing the check down the road and make your plugin that much faster!
To opt in, set a class-level `storage\_mode`:
```
`
from apprise.common import PersistentStoreMode
class NotifyMyService(NotifyBase):
# ...
storage\_mode = PersistentStoreMode.AUTO
`
```
Guidance:
* Use `PersistentStoreMode.AUTO` for most plugins.
* Use `PersistentStoreMode.FLUSH` only when the cached data is expensive to recompute and you want stronger durability.
* Leave the default behaviour (memory-only) if your plugin should never persist state, or if caching provides little benefit.
When combined with a well-formed `url\_identifier` (configuration identity only), multiple instances targeting different recipients can reuse the same cache for the same upstream configuration.
## Targets and \_\_len\_\_
[Section titled “Targets and \_\_len\_\_”](#targets-and-__len__)
`\_\_len\_\_()` allows authors and tooling to identify how many targets are loaded into a plugin.
* If you do not override it, the base implementation returns `1`.
* Override it in plugins that support multiple targets, usually returning `len(self.targets)` with a minimum of `1`.
## Requirements and Optional Dependencies
[Section titled “Requirements and Optional Dependencies”](#requirements-and-optional-dependencies)
If your plugin needs extra packages, declare them in `requirements` so Apprise can report what is required or recommended.
```
`
from ..locale import gettext\_lazy as \_
requirements = {
"details": \_("This plugin requires cryptography for message signing."),
"packages\_required": ["cryptography\>=42"],
"packages\_recommended": ["orjson\>=3"],
}
`
```
### `runtime\_deps()` — Memory Eviction Hint
[Section titled “runtime\_deps() — Memory Eviction Hint”](#runtime_deps--memory-eviction-hint)
If your plugin **conditionally imports a heavy third-party library**, also override `runtime\_deps()` to tell the plugin manager which top-level package names it loaded.
```
`
class NotifyMyService(NotifyBase):
# ...
@staticmethod
def runtime\_deps():
return ("mylibrary",)
`
```
The return value is a **tuple of importable top-level package names** — the same string you would pass to `import`, not the pip install name (e.g. `"paho"` for `paho-mqtt`).
The [Notification Manager](./extending/notification-manager/#library-eviction) tracks a reference count for each declared library. When every plugin that uses a given library is disabled and `N\_MGR.evict\_on\_disable` is `True`, the manager removes that library — and all of its submodules — from `sys.modules`, releasing the associated Python objects from memory.
* Return the base-class default `()` (an empty tuple) if your plugin has no optional runtime dependencies worth evicting.
* Submodules are handled automatically; declare only the top-level name.
* This is separate from `requirements`, which names pip packages for human-readable dependency reporting. `runtime\_deps()` names importable packages for runtime memory management.
`runtime\_deps()` is only useful when the library is loaded conditionally (imported only if the plugin is active). If your plugin always imports the library at module load time, eviction has no practical effect because the module is already resident.
## Plugin Base Defaults
[Section titled “Plugin Base Defaults”](#plugin-base-defaults)
The following identifies the default values of variables defined in your plugin automatically if not otherwise overridden.
## URLBase Defaults
[Section titled “URLBase Defaults”](#urlbase-defaults)
`NotifyBase` inherits from the `URLBase` object which sets these defaults:
|Attribute|Default|Purpose|When To Override|
|`request\_rate\_per\_sec`|`0`|Base throttle interval (seconds). `0` disables throttling at the URLBase level.|Typically override at `NotifyBase` or your plugin, not at URLBase.|
|`socket\_connect\_timeout`|`4.0`|Default connect timeout, used when `cto` is not provided.|If your service routinely needs longer TCP handshakes.|
|`socket\_read\_timeout`|`4.0`|Default read timeout, used when `rto` is not provided.|If your service returns slowly or streams responses.|
|`verify\_certificate`|`True`|SSL certificate verification, used when `verify` is not provided.|Only if your service runs in controlled networks with self-signed certs and you are comfortable allowing `verify=no`.|
|`templates`|`()`|Documentation templates.|Almost always, so tooling and docs can describe the plugin accurately.|
|`template\_tokens`|`{}`|Metadata describing URL path tokens.|Almost always, for non-trivial schemas.|
|`template\_args`|`{ verify, rto, cto }`|Common URL args and their defaults.|Usually extend rather than replace.|
|`template\_kwargs`|`{}`|Metadata for prefixed key/value arguments.|If you support `+headers`, `:payload`, `-params`, etc.|
### NotifyBase Defaults
[Section titled “NotifyBase Defaults”](#notifybase-defaults)
Your plugin should be configured to inherit from `NotifyBase` granting you these defaults
|Attribute|Default|Purpose|When To Override|
|`enabled`|`True`|If `False`, the plugin is not used.|Disable for platform-specific or dependency-specific reasons.|
|`category`|`"native"`|Classifies plugin origin (`native` vs `custom`).|Usually leave as-is.|
|`requirements.details`|`None`|Human-friendly requirements text.|If you need to explain optional or required packages.|
|`requirements.packages\_required`|`[]`|Required packages for full function.|If your plugin requires extra libraries.|
|`requirements.packages\_recommended`|`[]`|Optional packages that improve function.|If you can run without them, but benefit from them.|
|`service\_url`|`None`|Vendor or upstream product URL.|For public services, set this.|
|`setup\_url`|`None`|Apprise setup page for your service.|Set this to your `appriseit.com/services/\<service\>/` page.|
|`request\_rate\_per\_sec`|`5.5`|Default throttle interval (seconds).|Tune for vendor rate limits, or set to `0` for local-only.|
|`image\_size`|`None`|Preferred image size, for attachment pre-scaling.|Set when your service expects a specific size.|
|`body\_maxlen`|`32768`|Max body characters before truncation.|Set based on upstream constraints.|
|`title\_maxlen`|`250`|Max title characters. Set `0` if titles are not supported.|Set to `0` for title-less endpoints, or tune to vendor constraints.|
|`body\_max\_line\_count`|`0`|Max number of lines to keep. `0` disables line truncation.|If upstream is line-sensitive.|
|`persistent\_storage`|`True`|Allows the persistent store to be used.|If your plugin must never store identifiers or state.|
|`storage\_mode`|`memory`|Default persistent store mode.|Rare, but can be tuned for special behaviours.|
|`timezone`|`None`|Uses server-detected timezone when `None`.|If your service must always operate in a specific timezone.|
|`notify\_format`|`text`|Default message format.|If your service is Markdown or HTML-first.|
|`overflow\_mode`|`upstream`|Default overflow strategy.|If you want Apprise to split, truncate, or alter overflow behaviour.|
|`interpret\_emojis`|`False`|Emoji interpretation.|If the upstream service benefits from emoji conversion.|
|`attachment\_support`|`False`|Attachment enablement.|Set to `True` if you accept attachments.|
|`default\_html\_tag\_id`|`"b"`|Used to inject title into body for title-less services.|Rare, unless you want different formatting.|
## Templates and Metadata
[Section titled “Templates and Metadata”](#templates-and-metadata)
## Template types
[Section titled “Template types”](#template-types)
Apprise validates types using a strict pattern: `((choice|list):)?(string|bool|int|float)`.
|Type|Where used|Meaning|Required directives|Notes|
|`string`|tokens, args|A single string|none|Common for hostnames, tokens, and names.|
|`int`|tokens, args|A single integer|none|Use `min` and `max` to bound port values, counts, etc.|
|`float`|tokens, args|A single float|none|Use `min` and `max` for bounds.|
|`bool`|tokens, args|A boolean flag|`default` (required for args)|Boolean args must provide a default.|
|`choice:string`|tokens, args|One value from a fixed set|`values`|Choice entries must provide `values`, and `default` must be one of them if specified.|
|`choice:int`|tokens, args|One integer from a fixed set|`values`|Use for mode selectors or enumerations.|
|`choice:float`|tokens, args|One float from a fixed set|`values`|Rare, but supported.|
|`list:string`|tokens, args|A list of strings|`delim`|List entries must provide delimiters.|
|`list:int`|tokens, args|A list of integers|`delim`|Split and then coerce to int.|
|`list:float`|tokens, args|A list of floats|`delim`|Split and then coerce to float.|
Additional rules that matter:
* `choice:bool` is not allowed, use `bool` instead.
* `regex` must be a 2-tuple `(pattern, option)`, and patterns must start with `^` and end with `$`. |
* If `required` or `private` are not provided, they default to `False`.
* If `values` is a dictionary, it is converted to a list of keys.
## Template layout patterns
[Section titled “Template layout patterns”](#template-layout-patterns)
These examples focus only on how template metadata, `\_\_init\_\_()`, and `parse\_url()` connect.
* [ No tokens ](#tab-panel-73)
* [ Built-in tokens only ](#tab-panel-74)
* [ Tokens and args ](#tab-panel-75)
* [ Multiple target tokens ](#tab-panel-76)
No tokens are required when the templates do not include custom `{token}` entries.
```
`
class MyPlugin(NotifyBase):
## Plugin variables here (intentionally omitted)
secure\_protocol = "foobar"
templates = ("{schema}://",)
def \_\_init\_\_(self, \*args, \*\*kwargs):
# Rest of code here
super().\_\_init\_\_(\*args, \*\*kwargs)
`
```
### Template directives Reference
[Section titled “Template directives Reference”](#template-directives-reference)
The unit tests enforce allowed keys and type constraints.
|Directive|Where used|Meaning|
|`name`|tokens, args, kwargs|Human-friendly label, usually wrapped in `gettext\_lazy()`.|
|`type`|tokens, args|Value type, validated by the strict type regex.|
|`required`|tokens, args|Marks an entry as mandatory. If omitted, defaults to `False`.|
|`private`|tokens, args|Marks an entry as sensitive. If omitted, defaults to `False`.|
|`default`|args|Default used when the URL does not specify a value. Required for `bool` args.|
|`values`|choice types|Allowed values for choice types, required for any `choice:\*` type.|
|`min`, `max`|int, float|Bounds for numeric types.|
|`regex`|tokens, args|Validation regex, always `(pattern, option)` with `^...$` anchoring.|
|`delim`|list types|Delimiters used for list splitting, required for `list:\*` types.|
|`prefix`|kwargs|Required for kwargs, must be one of `:`, `+`, or `-`.|
|`map\_to`|tokens, args, kwargs|Maps a key to a different `\_\_init\_\_()` argument name. Tests enforce it maps to a function argument (or a framework keyword).|
|`alias\_of`|args, kwargs|Declares an alias for an existing token or arg, often used to make YAML configuration easier.|
|`group`|tokens|Used for grouping when multiple tokens map into a list-style entry.|
Framework-recognized map targets include common URL fields and shared arguments, even if they are not in your plugin `\_\_init\_\_()`, such as `user`, `password`, `host`, `port`, `schema`, `fullpath`, `format`, `overflow`, `emojis`, `tz`, `verify`, `cto`, `rto`, and `store`.
### Mapping Rules
[Section titled “Mapping Rules”](#mapping-rules)
Apprise uses your template metadata as a contract, and tests enforce consistency:
* Every item in `template\_tokens` must map to a real `\_\_init\_\_()` argument, either directly (same key name) or using `map\_to`.
* Aliases (`alias\_of`) are allowed in args and kwargs, not in tokens.
* Every `alias\_of` must point to a real token or arg, and cannot just point to itself unless it also exists in tokens.
* For kwargs entries, `prefix` is required, and must be one of `:`, `+`, or `-`.
### alias\_of Inheritance Rule
[Section titled “alias\_of Inheritance Rule”](#alias_of-inheritance-rule)
Alias entries must **never** redeclare properties that are inherited from the target. The following keys are forbidden on any entry that contains `alias\_of`:
`private`, `type`, `required`, `regex`, `default`, `min`, `max`, `map\_to`, `prefix`, `group`
These are resolved at runtime by following the alias chain — consumers such as the [URL Builder](../url-builder/) read them from the target, not from the alias itself. The only permitted extras alongside `alias\_of` are:
|Extra key|When allowed|
|`name`|Required when `alias\_of` lists **multiple** targets, to provide a grouping label for the UI.|
|`delim`|Allowed when the aliased target is a `list:\*` type, to override the delimiter character(s).|
Valid approaches:
1. Single alias — only alias\_of
```
`
"t": {"alias\_of": "token"},
`
```
2. Multiple aliases — alias\_of + name for grouping label
```
`
"tok": {
"name": \_("Token"),
"alias\_of": ("access\_token", "token\_a", "token\_b"),
},
`
```
3. List alias with delimiter override
```
`
"to": {
"alias\_of": "targets",
"delim": (",", " "),
},
`
```
Additional tokens outside of what was identified above can not be used. For example, the following is not valid:
```
`
# do NOT redeclare inherited properties
"t": {
"alias\_of": "token",
"private": True, # \<-- This should have been defined in what is being inherited
},
`
```
### Round-Trip Requirements
[Section titled “Round-Trip Requirements”](#round-trip-requirements)
Two functions should work together:
* `parse\_url()` should extract every argument you expose through `template\_args` and `template\_kwargs`.
* `url()` should emit a URL that can recreate the same object, and should generate the same `url\_identifier` when re-instantiated.
## Template Schema Reference
[Section titled “Template Schema Reference”](#template-schema-reference)
This table documents the most common directives supported by `template\_tokens`, `template\_args`, and `template\_kwargs`.
|Directive|Where used|Meaning|
|`name`|tokens, args, kwargs|Human-friendly label, usually wrapped in `gettext\_lazy()`.|
|`type`|tokens, args|Value type, such as `string`, `int`, `bool`, `choice:string`, `list:string`.|
|`required`|tokens, args|Marks an entry as mandatory for initialization or validation.|
|`default`|args|Default used when the URL does not specify a value. Required for `bool` types.|
|`private`|tokens, args|Marks a value as sensitive and should be hidden or masked in privacy views.|
|`regex`|tokens, args|A 2-tuple `(pattern, flags)` used to validate values. Patterns should be anchored with `^` and `$`.|
|`values`|choice types|Allowed values for `choice:\*` types. If a `default` is provided, it must be in `values`.|
|`delim`|list types|Allowed delimiters for `list:\*` types.|
|`prefix`|kwargs|Required for kwargs entries, defines injection prefix `:`, `+`, or `-`.|
|`map\_to`|tokens, args, kwargs|Maps the directive key to a different `\_\_init\_\_()` argument name.|
|`alias\_of`|args, kwargs|Provides an alternative name that behaves exactly like another token or argument.|
### templates
[Section titled “templates”](#templates)
* A tuple of URL patterns (strings) showing valid forms.
* Use `{schema}` in templates, and keep tokens consistent across templates.
It is documentation and structured metadata that can be used by tooling to describe supported URL shapes.
### template\_tokens
[Section titled “template\_tokens”](#template_tokens)
Variables taken from the URL core structure such:
```
`
schema://credentials/direction/?options=
| |
| variables here |
`
```
### template\_args
[Section titled “template\_args”](#template_args)
Args describe query string arguments. `NotifyBase` already provides `format`, `overflow`, `emojis`, `store`, and `tz`. `URLBase` already provides `verify`, `rto`, and `cto`.
Common patterns:
* Use `alias\_of` to add synonyms.
* Use `map\_to` to map user-facing arg names onto your `\_\_init\_\_()` parameter names.
* Use a `default` to clearly document behaviour.
### template\_kwargs
[Section titled “template\_kwargs”](#template_kwargs)
Kwargs are for prefixed arguments that can appear multiple times, typically used for key/value injection:
* `+` is often used for headers
* `-` is often used for URL parameters
* `:` is often used for payload extras
Each `template\_kwargs` entry requires a `prefix` and a `name`, and those are also surfaced in the [URL Builder](../url-builder/) as a **Custom Parameters** table where users can add any number of key/value rows.
```
`
template\_kwargs = dict(
NotifyBase.template\_kwargs,
\*\*{
"headers": {
"name": \_("HTTP Header"),
"prefix": "+",
},
"params": {
"name": \_("GET Parameter"),
"prefix": "-",
},
"payload": {
"name": \_("Payload Extra"),
"prefix": ":",
},
},
)
`
```
In a URL these look like: `?+X-Custom-Header=foo&-debug=1&:extra=bar`
## Requirements And Optional Dependencies
[Section titled “Requirements And Optional Dependencies”](#requirements-and-optional-dependencies-1)
If your plugin needs extra packages, declare them in `requirements` so Apprise can report what is required or recommended.
Example:
```
`
from ..locale import gettext\_lazy as \_
requirements = {
"details": \_("This plugin requires cryptography for message signing."),
"packages\_required": ["cryptography\>=42"],
"packages\_recommended": ["orjson\>=3"],
}
`
```
## Attachment Support
[Section titled “Attachment Support”](#attachment-support)
Plugins that support file attachments **must** explicitly declare support by
setting the following class attribute:
```
`
class NotifyExample(NotifyBase):
attachment\_support = True
`
```
When enabled, attachments are provided to the plugin as a list of
`AppriseAttachment` objects. These objects abstract file access and may be
backed by local files, in-memory data, or remote HTTP resources.
Full details on attachment handling, lifecycle management, size limits, and
common implementation patterns are documented here:
* [Attachments](./attachments.mdx)
Authors are strongly encouraged to review the attachment documentation before
implementing support, as incorrect handling can easily lead to excessive memory
usage or failed deliveries.
## URL Builder Integration
[Section titled “URL Builder Integration”](#url-builder-integration)
The [Apprise URL Builder](../url-builder/) generates its form entirely from the metadata exported by your plugin. Well-formed metadata leads to a polished, user-friendly experience.
### Checklist for URL Builder quality
[Section titled “Checklist for URL Builder quality”](#checklist-for-url-builder-quality)
|What to set|Why it matters|
|`service\_name`|Shown as the service display name in search results.|
|`service\_url`|Powers the “Service website” link next to the form.|
|`setup\_url`|Powers the “Setup guide” link for step-by-step instructions.|
|`name` on every token/arg|Appears as the form field label. Without it the raw key name is shown.|
|`private: True` on secrets|Renders the field as a password input with a reveal toggle, and prevents the value from leaking into the browser address bar.|
|`required: True` on mandatory tokens|Marks fields with an asterisk (`\*`) and blocks URL generation until filled.|
|`regex` on validated tokens|Provides client-side format hints (not enforced in the browser, but surfaced in schema metadata).|
|`default` on optional args|Shown as the placeholder in dropdowns and number inputs.|
|`templates` ordered simple → complex|The URL Builder defaults to the most complex template so all fields are visible from the start.|
### template ordering
[Section titled “template ordering”](#template-ordering)
The URL Builder picks the **most complex** template by default (the one with the most `{token}` slots). As the user fills fields it switches to the simplest template that covers every filled token.
Order your `templates` tuple from simplest to most complex:
```
`
templates = (
"{schema}://{token}", # simplest — no targets
"{schema}://{token}/{targets}", # adds optional targets
"{schema}://{botname}@{token}/{targets}", # most complex
)
`
```
### private flag matters
[Section titled “private flag matters”](#private-flag-matters)
Mark every API key, token, password, or secret with `"private": True` in both `template\_tokens` and `template\_args`. The URL Builder:
1. Renders the input as a password field with an eye-toggle button.
2. Shows `••••••` in the assembled URL display instead of the real value.
3. Excludes the value from the browser address bar (share links never expose secrets).
Alias entries (`alias\_of`) **inherit** the `private` flag from their target — do not redeclare it on the alias.
### service\_url vs setup\_url
[Section titled “service\_url vs setup\_url”](#service_url-vs-setup_url)
|Attribute|Purpose|
|`service\_url`|Links to the upstream vendor or product landing page (e.g. `https://discord.com/`). Shown in the URL Builder as “Service website”.|
|`setup\_url`|Links to the Apprise-specific integration guide on `appriseit.com` (e.g. `https://appriseit.com/services/discord/`). Shown as “Setup guide”.|
Both should always be set. Generic or local-only plugins (e.g. MQTT, Windows notifications) may omit `service\_url` if there is no applicable upstream URL.
## Format and Overflow
[Section titled “Format and Overflow”](#format-and-overflow)
Also note that `NotifyBase` provides URL-level behaviour flags like `format`, `overflow`, `emojis`, and persistent storage (`store`).
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