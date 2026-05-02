Assets & Branding | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Assets & Branding
`AppriseAsset` defines the **global execution context** for an Apprise session.
It is not limited to branding or theming. An asset instance influences behaviour across:
* All notification plugins
* All delivery threads
* Persistent storage and key material
* Global safety boundaries (log redaction and recursion protection)
Under usual conditions, an asset is created once and then passed into `Apprise(...)` during its instantiation.
```
`
from apprise import Apprise, AppriseAsset
asset = AppriseAsset(app\_id="My Application", theme="default")
apobj = Apprise(asset=asset)
`
```
If no asset is provided, Apprise creates a default one.
## Lifecycle and Scope
[Section titled “Lifecycle and Scope”](#lifecycle-and-scope)
* Created once, typically at application startup
* Shared across all loaded plugins and configuration processing
* Intended to be treated as immutable for the lifetime of an `Apprise` instance
Mutating an asset after it has been bound to `Apprise` can produce inconsistent results across plugins.
## Object Initialization
[Section titled “Object Initialization”](#object-initialization)
`AppriseAsset.\_\_init\_\_()` accepts a small number of explicit arguments, plus `\*\*kwargs`.
* The explicit arguments (`plugin\_paths`, `storage\_\*`, `timezone`) are validated and normalised.
* `\*\*kwargs` can override any *existing* asset attribute, and will raise if an invalid key is provided.
This is intentional. It prevents configuration files from quietly setting unknown fields and it keeps the surface area strict.
## Defaults and Field Reference
[Section titled “Defaults and Field Reference”](#defaults-and-field-reference)
This table documents the **actual defaults** from the implementation, plus where each field is used.
Fields prefixed with `\_` or `\_\_` are intentionally **not** configuration-file addressable.
### Identity and Presentation
[Section titled “Identity and Presentation”](#identity-and-presentation)
|Field|Type|Default|Used by|Notes|
|`app\_id`|`str`|`Apprise`|Plugin headers, key generation names|Used as a human-facing application identifier and as a default name in PGP key generation.|
|`app\_desc`|`str`|`Apprise Notifications`|Metadata / Presentation|Used by tooling and services that display an application description.|
|`app\_url`|`str`|`https://github.com/caronc/apprise`|Metadata / Presentation|Provider URL exposed in docs and some plugin metadata.|
|`theme`|`str`|`default`|Icon URL/path resolution|Drives `{THEME}` substitution for icon lookup.|
|`default\_extension`|`str`|`.png`|Icon URL/path resolution|Used when `extension` is not provided to `image\_url()` or `image\_path()`.|
|`default\_image\_size`|`NotifyImageSize`|`XY\_256`|Icon URL resolution|Used when size is omitted.|
|`image\_url\_mask`|`str`|GitHub raw URL|`image\_url()`|Produces a themed image URL for `NotifyType` + size.|
|`image\_url\_logo`|`str`|GitHub raw URL|`image\_url(logo=True)`|Used for the application logo.|
|`image\_path\_mask`|`str`|local `assets/themes/...`|`image\_path()` / `image\_raw()`|Used for local icon resolution and raw bytes loading.|
### Type Mapping Helpers
[Section titled “Type Mapping Helpers”](#type-mapping-helpers)
|Field|Type|Default|Used by|Notes|
|`html\_notify\_map`|`dict[NotifyType,str]`|type→hex map|`color()`|Default colour mapping for HTML-capable services.|
|`default\_html\_color`|`str`|`#888888`|`color()`|Used when a mapping is missing.|
|`ascii\_notify\_map`|`dict[NotifyType,str]`|type→token map|`ascii()`|Default ASCII tokens for text-only contexts.|
|`default\_ascii\_chars`|`str`|`[?]`|`ascii()`|Used when a mapping is missing.|
### Content Interpretation
[Section titled “Content Interpretation”](#content-interpretation)
|Field|Type|Default|Used by|Notes|
|`body\_format`|`NotifyFormat`|`None`|`None`|Formatting pipeline If `None`, no pre-formatting is applied by default.|
|`interpret\_emojis`|`bool`|`None`|`None`|Message pre-processing. If `None`, it defers to per-service configuration (for example, `emojis=yes` at the URL level).|
|`interpret\_escapes`|`bool`|`False`|Message pre-processing|Enables `\\n`, `\\t`, etc. prior to sending.|
|`encoding`|`str`|`utf-8`|Encoding|Used when encoding internal strings for processing. Plays a roll in how some services output their content upstream. It is advised to leave this at `utf-8`|
### Concurrency and Delivery
[Section titled “Concurrency and Delivery”](#concurrency-and-delivery)
|Field|Type|Default|Used by|Notes|
|`async\_mode`|`bool`|`True`|Delivery orchestration|Controls concurrent vs sequential dispatch.|
### Plugin Discovery
[Section titled “Plugin Discovery”](#plugin-discovery)
|Field|Type|Default|Used by|Notes|
|`plugin\_paths`|`list[str]`|`[]`|Custom plugin loading|Triggers module detection at asset initialisation time.|
### Persistent Storage
[Section titled “Persistent Storage”](#persistent-storage)
|Field|Type|Default|Used by|Notes|
|`storage\_path`|`str|None`|`None`|PersistentStore root. If unset, Apprise operates memory-only for storage-backed features.|
|`storage\_mode`|`PersistentStoreMode`|`auto`|PersistentStore behaviour|`auto`, `flush`, `memory`.|
|`storage\_idlen`|`int`|`8`|Namespace generation|Controls how long generated namespace directories are.|
|`storage\_salt`|`bytes`|`b""`|Namespace generation|Provides optional salting for namespace generation, string values are encoded using `encoding`.|
### Key Material Management
[Section titled “Key Material Management”](#key-material-management)
|Field|Type|Default|Used by|Notes|
|`pgp\_autogen`|`bool`|`True`|PGP controller|Enables auto-generation of PGP keys when storage allows it and no key is provided.|
|`pem\_autogen`|`bool`|`True`|PEM controller|Enables auto-generation of PEM keys when storage allows it and no key is provided.|
### Safety Boundaries
[Section titled “Safety Boundaries”](#safety-boundaries)
|Field|Type|Default|Used by|Notes|
|`secure\_logging`|`bool`|`True`|Logging pipeline|Adds overhead to redact secrets from logs, recommended to keep enabled.|
|`\_recursion`|`int`|`0`|Apprise API recursion guard|Prevents loops when one Apprise API instance calls another.|
|`\_uid`|`str`|random UUID4|Correlation / identity|Internal identifier, intended for internal correlation.|
|`\_tzinfo`|`tzinfo`|system tz|Time-based behaviour|The resolved timezone object used by plugins that need localised timestamps.|
## Common Usage Patterns
[Section titled “Common Usage Patterns”](#common-usage-patterns)
* [ Identity & Branding ](#tab-panel-51)
* [ Concurrency ](#tab-panel-52)
* [ Custom Plugins ](#tab-panel-53)
* [ Persistent Storage ](#tab-panel-54)
* [ Timezone Control ](#tab-panel-55)
Configures the Apprise instance to use an altered branding.
```
`
from apprise import AppriseAsset
asset = AppriseAsset(
app\_id="StatsBot",
app\_desc="Metrics Aggregation Service",
app\_url="https://example.com",
)
`
```
## Icon and Image Resolution
[Section titled “Icon and Image Resolution”](#icon-and-image-resolution)
Apprise resolves icons using configurable masks.
```
`
asset = AppriseAsset(
image\_path\_mask="/icons/{THEME}/{TYPE}-{XY}{EXTENSION}",
image\_url\_mask="https://cdn.example.com/{TYPE}-{XY}{EXTENSION}",
)
`
```
|Token|Description|
|`{THEME}`|Active theme|
|`{TYPE}`|info, success, warning, failure|
|`{XY}`|Image size|
|`{EXTENSION}`|File extension|
## Security and Safety Controls
[Section titled “Security and Safety Controls”](#security-and-safety-controls)
### Secure Logging
[Section titled “Secure Logging”](#secure-logging)
When enabled, secrets are redacted from all logging output.
```
`
asset = AppriseAsset(secure\_logging=True)
`
```
Disabling this is strongly discouraged outside isolated environments.
### Recursion Protection
[Section titled “Recursion Protection”](#recursion-protection)
The asset internally tracks recursion depth to prevent notification loops,
particularly when Apprise instances interact with one another.
## Configuration File Boundaries
[Section titled “Configuration File Boundaries”](#configuration-file-boundaries)
The following fields **cannot** be set via configuration files:
* `plugin\_paths`
* `storage\_\*`
* Internal flags prefixed with `\_`
These must be provided programmatically to prevent untrusted code execution.
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