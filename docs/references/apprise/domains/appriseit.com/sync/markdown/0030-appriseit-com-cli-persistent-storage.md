Persistent Storage | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Persistent Storage
Persistent Storage allows Apprise to cache data locally. This greatly reduces the number of API transactions between you and the service(s) you are using.
## Why use Persistent Storage?
[Section titled “Why use Persistent Storage?”](#why-use-persistent-storage)
Some services require complex authentication handshakes or resource lookups that are “expensive” to perform every time you send a notification.
* **Matrix:** Login information is cached locally to avoid re-authenticating with the homeserver on every request.
* **Telegram:** User account details are cached to save extra fetches to the service.
## Storage Locations
[Section titled “Storage Locations”](#storage-locations)
Apprise stores all of its persistent data in a directory unique to the Apprise URL you create.
* **File Extension:** `.psdata`
* **Directory Name:** A generated 8-character alphanumeric string (UID).
By default, files are written to:
* **Windows:** `%APPDATA%/Apprise/cache`
* **Linux:** `\~/.local/share/apprise/cache`
## Managing Storage via CLI
[Section titled “Managing Storage via CLI”](#managing-storage-via-cli)
### Viewing Cache IDs (UIDs)
[Section titled “Viewing Cache IDs (UIDs)”](#viewing-cache-ids-uids)
Every Apprise URL you define has a unique URL ID (`uid`) generated against it. To see which UIDs have been assigned to your configuration, use the `--dry-run` flag combined with `--tag=all`:
Terminal window
```
`
apprise --dry-run --tag=all
`
```
**Example Output:**
*Note how some plugins (like `dbus://`) display `- n/a -`, indicating they do not use persistent storage.*
### Listing Active Storage
[Section titled “Listing Active Storage”](#listing-active-storage)
You can inspect the current state of your persistent storage using the `storage` command:
Terminal window
```
`
apprise storage
`
```
**Example Output:**
The output shows:
1. **Grouping:** Multiple URLs sharing the same credentials share the same storage endpoint.
2. **Disk Usage:** The amount of space currently occupied.
3. **Status:**
* `active`: The plugin has data cached on disk.
* `unused`: The plugin is not currently occupying space.
* `stale`: A plugin previously wrote data here, but it is no longer referenced by your current configuration.
### Cleaning Up
[Section titled “Cleaning Up”](#cleaning-up)
To remove all accumulated persistent storage generated through the CLI tool:
Terminal window
```
`
apprise storage clean
`
```
You can be more specific by targeting a specific UID or tag:
Terminal window
```
`
# Clean a specific UID (e.g. found via 'apprise storage')
apprise storage clean abc123xy
# Clean all URLs associated with the 'family' tag
apprise storage clean --tag family
`
```
## Storage Modes
[Section titled “Storage Modes”](#storage-modes)
The CLI tool enables Persistent Storage by default using the `auto` mode. You can change this behavior using the `--storage-mode` switch.
|Mode|Description|
|**`auto`**|(Default) Persistent storage is used when applicable. Only plugins that require it will write to the local cache.|
|**`flush`**|Similar to `auto`, but changes are immediately flushed to disk. This ensures data is always current but increases I/O operations.|
|**`memory`**|Disables persistent storage. No data is written to disk. This mimics the behavior of older Apprise versions.|
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