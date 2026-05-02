Notification Manager | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Notification Manager
## Introduction
[Section titled “Introduction”](#introduction)
Working with the Notification Manager allows you to:
* Replacing a built-in notification service with a custom implementation.
* Disabling one or more notification services at runtime.
* Discovering which schemas and plugins are currently available.
* Safely handling schema conflicts caused by decorators or import order.
If you are trying to **override a built-in service (for example, Discord)**, the recommended solution is:
```
`
from apprise.plugins import N\_MGR
N\_MGR.add(MyCustomNotify, schemas="discord", force=True)
`
```
Using `force=True` avoids import-order problems and does not unload previously imported modules.
The **Notification Manager** is the central registry responsible for discovering, registering,
and resolving notification plugins within Apprise.
It maps notification URL schemas such as `schema://...` to their corresponding Python
implementation and controls whether those implementations are enabled, disabled, or overridden.
The manager is a singleton and is typically accessed via:
```
`
from apprise.plugins import N\_MGR
`
```
## Core Concepts
[Section titled “Core Concepts”](#core-concepts)
### Schema Mapping
[Section titled “Schema Mapping”](#schema-mapping)
A **schema** maps to exactly one notify implementation at a time.
* Any URL beginning with `schema://` routes to the notify class registered for that schema.
* Schemas are case-insensitive and normalized internally.
* By default, schema collisions are rejected to prevent accidental overrides.
### Lazy Loading
[Section titled “Lazy Loading”](#lazy-loading)
The manager uses lazy loading:
* Built-in plugins are discovered only when needed.
* Most operations trigger discovery automatically.
* Calling `load\_modules()` forces immediate discovery.
You do not need to call `load\_modules()` manually; it is automatically called once on the first `import apprise` or relative references to it.
### Custom Plugin Loading
[Section titled “Custom Plugin Loading”](#custom-plugin-loading)
Custom notification plugins can be introduced in two ways:
1. Python classes discovered via plugin search paths.
2. Decorator-based custom notifications created using the `@notify` decorator.
Decorator-based notifications are wrapped and registered through the same manager APIs as class-based plugins.
## API Reference
[Section titled “API Reference”](#api-reference)
### add()
[Section titled “add()”](#add)
Registers a notification plugin or decorator wrapper for one or more schemas.
Definition:
```
`
add(plugin, \*, schemas=None, force=False)
`
```
Behaviour:
* Fails if a schema already exists.
* Supports registering multiple schemas at once.
* Does not modify existing mappings unless explicitly forced.
Example:
```
`
N\_MGR.add(MyNotifyClass, schemas="schema")
`
```
Use `force=True` when intentionally replacing an existing service.
### remove()
[Section titled “remove()”](#remove)
Removes one or more schema mappings from the registry.
Definition:
```
`
remove(\*schemas, unload=True)
`
```
Behaviour:
* By default, removes the schema mapping and may unload unused modules.
* Supports removing multiple schemas in a single call.
Example:
```
`
N\_MGR.remove("schema1", "schema2")
`
```
### disable()
[Section titled “disable()”](#disable)
Disables one or more notification services without removing their schema mappings.
Definition:
```
`
disable(\*schemas)
`
```
Behaviour:
* Prevents usage while preserving registration state.
* Supports disabling multiple schemas at once.
Example:
```
`
N\_MGR.disable("schema1", "schema2")
`
```
### enable()
[Section titled “enable()”](#enable)
Re-enables previously disabled notification services.
Definition:
```
`
enable(\*schemas)
`
```
Behaviour:
* Restores availability of disabled schemas.
* Has no effect if a schema was not disabled.
### enable\_only()
[Section titled “enable\_only()”](#enable_only)
Enables only the specified schemas and disables everything else.
Definition:
```
`
enable\_only(\*schemas)
`
```
Behaviour:
* Every registered service not in the list is disabled.
* Services in the list are (re-)enabled.
* If `evict\_on\_disable` is set, libraries whose last dependent service was disabled are evicted from memory (see [Library Eviction](#library-eviction)).
Example:
```
`
# Only Telegram and NTFY remain active; all others are disabled
N\_MGR.enable\_only("tgram", "ntfy")
`
```
### load\_modules()
[Section titled “load\_modules()”](#load_modules)
Forces immediate discovery of built-in notification plugins.
Definition:
```
`
load\_modules()
`
```
This is rarely required because the manager loads plugins lazily.
## Library Eviction
[Section titled “Library Eviction”](#library-eviction)
When a notification service is disabled, any optional third-party library it depends on may no longer be needed. If every service that uses a given library is disabled, the manager can evict that library from Python’s module cache (`sys.modules`), freeing the memory it occupies.
### Opting In
[Section titled “Opting In”](#opting-in)
Eviction is **off by default** to preserve backward compatibility for third-party code that may import Apprise alongside its own use of those libraries. To enable it:
```
`
from apprise.plugins import N\_MGR
N\_MGR.evict\_on\_disable = True
`
```
Once set, eviction happens automatically whenever `disable()` or `enable\_only()` brings a library’s reference count to zero.
### Declaring Dependencies — `runtime\_deps()`
[Section titled “Declaring Dependencies — runtime\_deps()”](#declaring-dependencies--runtime_deps)
Each notification service class can advertise its optional runtime dependencies by overriding the `runtime\_deps()` static method on `NotifyBase`:
```
`
from apprise.plugins import NotifyBase
class NotifyMyService(NotifyBase):
protocol = "myservice"
@staticmethod
def runtime\_deps():
return ("mylibrary",)
# ...
`
```
The return value is a tuple of **top-level importable package names** (the same string you would pass to `import`). The manager uses these at load time to build a reference counter across all enabled services. When the counter for a library reaches zero, that library — and all of its submodules — is removed from `sys.modules`.
Native C extensions (for example, `cryptography`’s OpenSSL backend) release their Python wrapper objects when evicted, but the underlying shared library (`.so`) remains mapped by the OS for the lifetime of the process. This is a Python / OS constraint, not an Apprise limitation.
### How the Reference Counter Works
[Section titled “How the Reference Counter Works”](#how-the-reference-counter-works)
1. After all built-in plugins are loaded, the manager counts how many **enabled** services declare each library in `runtime\_deps()`.
2. When a service is disabled, its libraries are decremented.
3. When a library’s count reaches zero **and** `evict\_on\_disable` is `True`, the manager removes every matching entry from `sys.modules` (e.g., `slixmpp`, `slixmpp.stanza`, `slixmpp.xmlstream`, …).
4. When a service is re-enabled, its libraries are incremented back. Re-import happens automatically the next time that service’s code path runs.
Eviction attempts are always made for the full `runtime\_deps()` tuple, in order. A missing entry (e.g., a library that was never imported) is skipped with a trace-level log and does not interrupt the remaining evictions.
### Known Evictable Libraries
[Section titled “Known Evictable Libraries”](#known-evictable-libraries)
The following built-in services declare `runtime\_deps()` and benefit from eviction:
|Library|Services|Memory Freed|
|`slixmpp`|`xmpp://`|\~20 MB|
|`paho`|`mqtt://`|\~4 MB|
|`gntp`|`growl://`|\~2 MB|
|`smpplib`|`smpp://`, `smpps://`|\~2 MB|
|`cryptography`|`simplepush://`, `fcm://`, `vapid://`|partial†|
†`cryptography` uses a native OpenSSL backend. Python wrapper objects are freed; the shared library remains OS-mapped.
## Behavioural Notes
[Section titled “Behavioural Notes”](#behavioural-notes)
### Unmap vs Unload
[Section titled “Unmap vs Unload”](#unmap-vs-unload)
Removing a schema can mean:
1. **Unmap only**
The schema mapping is removed, but imported Python modules remain loaded.
2. **Unmap and unload**
The schema mapping is removed and unused modules may be removed from memory.
Unloading modules can affect third-party code that imports or subclasses notify classes.
Use unmap-only behaviour when class identity stability matters.
### Force Overrides
[Section titled “Force Overrides”](#force-overrides)
Using `force=True` when calling `add()`:
* Removes any existing mapping for the schema.
* Does not unload previously imported modules.
* Registers the new implementation atomically.
This is the recommended way to replace built-in services.
### Import Order and Decorators
[Section titled “Import Order and Decorators”](#import-order-and-decorators)
Decorator-based notifications may register schemas at import time.
If ordering is uncertain, `force=True` ensures predictable behaviour regardless of when modules are loaded.
## Examples
[Section titled “Examples”](#examples)
### Replace a Built-in Service
[Section titled “Replace a Built-in Service”](#replace-a-built-in-service)
```
`
N\_MGR.add(MyCustomNotify, schemas="discord", force=True)
`
```
### Disable vs Remove
[Section titled “Disable vs Remove”](#disable-vs-remove)
```
`
# Disable schema - can be enabled again using N\_MGR.enable("schema")
N\_MGR.disable("schema")
# Remove completely
N\_MGR.remove("schema")
`
```
### Multiple Schema Operations
[Section titled “Multiple Schema Operations”](#multiple-schema-operations)
```
`
N\_MGR.disable("schema1", "schema2")
N\_MGR.remove("schema3", "schema4", unload=False)
`
```
## Troubleshooting
[Section titled “Troubleshooting”](#troubleshooting)
### Schema Already Defined
[Section titled “Schema Already Defined”](#schema-already-defined)
If a schema already exists, registration will fail unless explicitly overridden. Consider:
1. Choosing a unique schema.
2. Use `add(..., force=True)` for intentional overrides.
### Import-Order Issues
[Section titled “Import-Order Issues”](#import-order-issues)
If schemas are registered during module import, conflicts may occur before manual intervention.
Using `force=True` avoids these timing issues.
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