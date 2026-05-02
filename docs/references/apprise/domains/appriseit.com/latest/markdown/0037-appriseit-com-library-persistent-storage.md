Persistent Storage | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Persistent Storage
Persistent storage allows Apprise plugins to safely retain **small amounts of state** between executions.
This feature is intended **for plugin authors**, and exists to prevent unnecessary or repeated requests to upstream services when the information can be reused locally.
Persistent storage is **opportunistic and best-effort**. If disk storage is unavailable or unsafe, Apprise automatically degrades to memory-only operation without failing notifications.
Persistent storage is:
* A lightweight **key/value store**
* Namespaced per plugin
* Expiry-aware
* Crash-resilient
* Safe in both short-lived and long-running processes
Persistent storage is **not**:
* A general database
* A user-facing cache
* A replacement for application state
* A guaranteed long-term persistence layer
It is intentionally scoped to **small, frequently reused metadata**, such as:
* Capability discovery results
* Negotiated API endpoints
* Remote identifiers
* Authentication or feature flags
* Cached service metadata
## How Persistent Storage Is Enabled
[Section titled “How Persistent Storage Is Enabled”](#how-persistent-storage-is-enabled)
Persistent storage is controlled by the **Apprise Asset Configuration**, not by the plugin directly.
The `AppriseAsset` object defines:
* Where persistent data may be written
* Whether disk persistence is allowed
* How Apprise behaves if storage is unavailable
If no storage path is available, Apprise transparently falls back to **memory-only** storage.
Plugins do **not** need to handle this fallback themselves.
### Plugin opt-in (`storage\_mode`)
[Section titled “Plugin opt-in (storage\_mode)”](#plugin-opt-in-storage_mode)
Persistent storage is always available through `self.store`, but **disk persistence is opt-in per plugin**.
By default, plugins treat the store as **memory-only**. To allow Apprise to reuse cached state across executions (when the active `AppriseAsset` permits it), set a class-level `storage\_mode` on your plugin:
```
`
from apprise.common import PersistentStoreMode
from apprise.plugins import NotifyBase
class MyPlugin(NotifyBase):
# Allow persistent storage to use disk when available.
# Without this, the store behaves as memory-only for the plugin.
storage\_mode = PersistentStoreMode.AUTO
`
```
The final behaviour is still constrained by the active `AppriseAsset` (storage path and allowed mode). If disk storage is unavailable, Apprise degrades safely to memory.
## Persistent Storage Modes
[Section titled “Persistent Storage Modes”](#persistent-storage-modes)
|Mode|Behaviour|When to Use|
|`MEMORY`|In-memory only, no disk usage|Ephemeral or restricted environments; This is the default for all plugins unless overriden with the `storage\_mode` variable during its class initialzation|
|`AUTO`|Disk when available, otherwise memory|Flushes to disk only when the plugin is destroyed (at end) **Recommended default**|
|`FLUSH`|Flush to disk aggressively|Trades higher I/O for more durability. Long-running daemons with critical metadata|
`AUTO` is the safest and most portable choice across containers, CI, and system services.
## Accessing Persistent Storage in a Plugin
[Section titled “Accessing Persistent Storage in a Plugin”](#accessing-persistent-storage-in-a-plugin)
Each plugin receives a ready-to-use store via `self.store`.
```
`
# Inside a NotifyBase plugin
store = self.store
`
```
The store behaves like a dictionary, but with expiry, persistence, and safety semantics layered on top.
## Cache Identity and `url\_identifier`
[Section titled “Cache Identity and url\_identifier”](#cache-identity-and-url_identifier)
Persistent storage is scoped using a plugin’s **URL identity**. The identity is derived from what your plugin returns in `url\_identifier`.
When you think of the [Universal URL Syntax](../../getting-started/universal-syntax/), you are ONLY building a url\_identifier using the `service://` and `credentials`, for the best results, e.g:
```
`
service://credentials/direction/?parameter=value
| |
| |
| |
| @property |
| url\_identifier() |
`
```
It should **not** include:
* recipient or target routing (anything that belongs in the URL path for delivery)
* direction-like components used only to choose a destination
* optional query-string settings that do not change the upstream identity
This allows you to run many notifications targeting different recipients while still sharing cached state for the same upstream server, such as OAuth tokens, discovery results, and resolved identifiers.
## Key / Value Usage Patterns
[Section titled “Key / Value Usage Patterns”](#key--value-usage-patterns)
* [ Basic ](#tab-panel-64)
* [ With Expiry ](#tab-panel-65)
* [ Non-Persistent ](#tab-panel-66)
### Setting and Reading Values
[Section titled “Setting and Reading Values”](#setting-and-reading-values)
```
`
# Store a value
self.store['server\_version'] = '1.8.2'
# Retrieve a value
version = self.store.get('server\_version')
if version:
...
`
```
* Values may be any JSON-serialisable type
* Retrieval returns `None` if missing or expired
* Disk persistence is automatic when enabled
## Understanding Expiry Semantics
[Section titled “Understanding Expiry Semantics”](#understanding-expiry-semantics)
A stored value:
* Exists in memory until expired or cleared
* May remain on disk after expiry
* Is treated as **invalid** once expired
* Evaluates as `False` when expired
```
`
if 'key' in self.store:
# Only true if key exists AND has not expired
`
```
Expiry is **always enforced**, even if the file still exists on disk.
## File-Based Storage (Advanced)
[Section titled “File-Based Storage (Advanced)”](#file-based-storage-advanced)
Persistent storage also supports **direct file access** for plugin-specific data.
* [ Write / Read ](#tab-panel-67)
* [ Custom Keys ](#tab-panel-68)
* [ open() API ](#tab-panel-69)
```
`
# Write raw data
self.store.write(b'my binary content')
# Read it back
content = self.store.read()
`
```
* Content is returned as `bytes`
* Files may be compressed by default
* Useful for certificates, tokens, or blobs
## Cache Maintenance and Cleanup
[Section titled “Cache Maintenance and Cleanup”](#cache-maintenance-and-cleanup)
### Clearing Entries
[Section titled “Clearing Entries”](#clearing-entries)
```
`
# Remove specific keys
self.store.clear('key1', 'key2')
# Remove everything
self.store.clear()
`
```
### Deleting Persistent Files
[Section titled “Deleting Persistent Files”](#deleting-persistent-files)
```
`
self.store.delete('key')
self.store.delete('key1', 'key2')
`
```
### Pruning Expired Entries
[Section titled “Pruning Expired Entries”](#pruning-expired-entries)
```
`
self.store.prune()
`
```
Expired entries are removed from memory and flagged for disk cleanup.
## Disk-Level Operations (Advanced)
[Section titled “Disk-Level Operations (Advanced)”](#disk-level-operations-advanced)
These operations are optional and primarily useful for long-running services.
```
`
# Remove expired persistent files
PersistentStore.disk\_prune(path)
# Scan for namespaces
PersistentStore.disk\_scan(path)
`
```
These functions operate **outside** of a plugin instance and should be used cautiously.
## Automatic Safety Guarantees
[Section titled “Automatic Safety Guarantees”](#automatic-safety-guarantees)
Persistent storage is designed to **never block notifications**.
If disk access fails due to:
* Permissions
* Read-only filesystems
* Corruption
* Container restrictions
Apprise automatically degrades to `MEMORY` mode and continues operating.
No plugin-side error handling is required.
## Best Practices for Plugin Authors
[Section titled “Best Practices for Plugin Authors”](#best-practices-for-plugin-authors)
* Treat persistent storage as an **optimisation**, not a dependency
* Store **small** values only
* Always handle missing or expired data gracefully
* Prefer expiry over manual invalidation
* Use clear, plugin-specific keys
* Assume storage may be unavailable at runtime
## Plugins That Use Persistent Storage
[Section titled “Plugins That Use Persistent Storage”](#plugins-that-use-persistent-storage)
The following core plugins already leverage:
* [**Matrix**](https://github.com/caronc/apprise/blob/master/apprise/plugins/matrix.py): Uses persistent storage to cache Matrix session and discovery metadata, including the `access\_token`, `home\_server`, and `user\_id` obtained during login or registration. It also stores a `transaction\_id` to prevent duplicate message handling, caches room alias resolution results (mapping aliases to resolved `room\_id` and `home\_server`), and persists `.well-known` discovery results. This avoids repeated authentication, discovery, and room resolution calls across executions.
* [**Nextcloud**](https://github.com/caronc/apprise/blob/master/apprise/plugins/nextcloud.py): Uses persistent storage to cache recipient discovery results. Group name resolution and “all users” lookups are cached to avoid repeated API calls when the same groups are referenced frequently. Cache lifetime is controlled via the plugin’s group discovery cache configuration.
* [**Office365**](https://github.com/caronc/apprise/blob/master/apprise/plugins/office365.py): Uses persistent storage to cache resolved sender identity metadata. When the configured sender is not a fully qualified email address, the plugin resolves the correct `from` address and display name via Microsoft Graph and stores the result so subsequent notifications do not need to repeat the lookup.
* [**Opsgenie**](https://github.com/caronc/apprise/blob/master/apprise/plugins/opsgenie.py): Uses persistent storage to cache Opsgenie alert request identifiers returned when alerts are created. These identifiers are indexed under a stable, derived key and retained for an extended period, allowing follow-up actions such as acknowledge, close, note, or delete to operate on previously created alerts without requiring the user to supply the alert ID again.
* [**SendPulse**](https://github.com/caronc/apprise/blob/master/apprise/plugins/sendpulse.py): Uses persistent storage to cache OAuth access tokens. Tokens are stored with an expiry derived from the upstream `expires\_in` value (with a safety buffer), allowing subsequent notifications to reuse the token and avoid unnecessary re-authentication requests.
* [**Telegram**](https://github.com/caronc/apprise/blob/master/apprise/plugins/telegram.py): Uses persistent storage to cache a detected bot owner user ID when automatic owner detection is enabled. Once discovered, the owner ID is reused for future notifications so detection does not need to be repeated on subsequent runs.
Feel free to use these examples to help shape your own design or improve on a plugin that exists already that could really benifit from the Persistent Store.
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