Environment Variables | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Environment Variables
The Apprise API container is highly configurable via environment variables.
## Runtime Configuration
[Section titled “Runtime Configuration”](#runtime-configuration)
|Variable|Default|Description|
|`APPRISE\_STATEFUL\_MODE`|`hash`|Controls the persistent storage backend.
`simple`: Saves configs as human-readable files (`/config/{KEY}.yaml`). Recommended for most users.
`hash`: Saves configs as indexed hashes. Efficient for high-volume.
`disabled`: Disables persistent storage entirely (Stateless only).|
|`APPRISE\_WORKER\_COUNT`|*(Auto)*|Number of Gunicorn workers. Defaults to `(2 \* CPUs) + 1`. Set to `1` for low-resource environments.|
|`APPRISE\_WORKER\_MAX\_REQUESTS`|`1000`|Number of requests a worker handles before being recycled. Recycling releases accumulated memory. Lower this (e.g., `100`) if workers are long-lived and memory growth is a concern.|
|`APPRISE\_WORKER\_MAX\_REQUESTS\_JITTER`|`50`|Random offset added to `APPRISE\_WORKER\_MAX\_REQUESTS` to stagger worker restarts and avoid a thundering herd.|
|`APPRISE\_WORKER\_TIMEOUT`|`300`|Worker timeout in seconds.|
|`APPRISE\_BASE\_URL`|*(None)*|Set this if running behind a reverse proxy under a subpath (e.g., `/apprise`).|
|`APPRISE\_ADMIN`|`no`|Set to `yes` to enable the `/cfg` endpoint, allowing you to list all saved keys in the Web UI. This **ONLY** works however if `APPRISE\_STATEFUL\_MODE` is set to `simple`.|
## Security & Access
[Section titled “Security & Access”](#security--access)
|Variable|Default|Description|
|`APPRISE\_CONFIG\_LOCK`|`no`|Set to `yes` to make the configuration read-only. Prevents adding or modifying keys via API.|
|`ALLOWED\_HOSTS`|`\*`|Space-delimited list of allowed `Host` headers.|
|`APPRISE\_DENY\_SERVICES`|*(Default List)*|Comma-separated list of schemas to block (e.g., `dbus`, `windows`, `macosx`, `gnome`, `syslog` are blocked by default in Docker).|
|`APPRISE\_ALLOW\_SERVICES`|*(All)*|Comma-separated list of allowed schemas. If set, only these services will work.|
### Memory Impact of Service Filtering
[Section titled “Memory Impact of Service Filtering”](#memory-impact-of-service-filtering)
`APPRISE\_ALLOW\_SERVICES` and `APPRISE\_DENY\_SERVICES` do more than toggle which schemas are active. The Apprise API automatically **evicts optional libraries from memory** when every plugin that depends on them is disabled.
Each notification plugin that requires a heavy optional dependency declares it internally. When the last plugin using a given library is disabled, that library is removed from the Python runtime (`sys.modules`), freeing its associated objects. This happens at startup, before the first request is served.
The libraries subject to eviction and their estimated savings:
|Library|Used By|Freed Memory|
|`slixmpp`|`xmpp://`|\~20 MB|
|`paho`|`mqtt://`|\~4 MB|
|`gntp`|`growl://`|\~2 MB|
|`smpplib`|`smpp://`, `smpps://`|\~2 MB|
|`hid`|`blink1://`|\~2 MB|
|`pgpy`|`mailto://`, `mailtos://` (PGP only)|\~10 MB|
|`cryptography`|`simplepush://`, `fcm://`, `vapid://`|partial†|
†`cryptography` links against OpenSSL natively. The Python wrapper objects are
released, but the underlying shared library remains mapped by the OS for the
process lifetime.
**Example** — a deployment that only needs Telegram and NTFY:
Terminal window
```
`
APPRISE\_ALLOW\_SERVICES=tgram,ntfy
`
```
This disables every other plugin, causing `slixmpp`, `paho`, `gntp`, `smpplib`, and the `cryptography` wrappers to be evicted. Combined with `APPRISE\_WORKER\_COUNT=1`, this brings a single-worker container from the typical \~180 MB baseline down to approximately **\~145 MB**.
This eviction behaviour is specific to the **Apprise API**. The Apprise Python library used directly or embedded in third-party projects does not evict libraries — disabled plugins simply become inactive, leaving all loaded modules intact.
For a full guide on reducing container memory and RAM usage, see [Resource Usage](/qa/resource-usage/).
## Storage & Limits
[Section titled “Storage & Limits”](#storage--limits)
|Variable|Default|Description|
|`APPRISE\_ATTACH\_SIZE`|`200`|Maximum attachment size in MB. Set to `0` to disable attachments.|
|`APPRISE\_UPLOAD\_MAX\_MEMORY\_SIZE`|`3`|Maximum size (MB) of request body kept in memory before spilling to disk.|
|`APPRISE\_CONFIG\_MAX\_LENGTH`|`512`|Maximum configuration payload size in KB. Cannot exceed `APPRISE\_UPLOAD\_MAX\_MEMORY\_SIZE`.|
|`APPRISE\_RECURSION\_MAX`|`1`|Max recursion depth for `apprise://` calls to other servers.|
## Network
[Section titled “Network”](#network)
|Variable|Default|Description|
|`HTTP\_PORT`|`8000`|Internal container port.|
|`PUID`|`1000`|User ID to run the service as.|
|`PGID`|`1000`|Group ID to run the service as.|
|`IPV4\_ONLY`|`no`|Force IPv4 only.|
|`IPV6\_ONLY`|`no`|Force IPv6 only.|
## Additional Apprise API Settings
[Section titled “Additional Apprise API Settings”](#additional-apprise-api-settings)
The container also supports the following variables, which map directly to the server settings.
`\<BASE\_DIR\>` is **not** an environment variable — it refers to the directory where the Apprise API application is installed and running from (its working directory). Relative paths you set for any of these variables are also resolved from that same directory. If you need to store data outside the install directory, use an absolute path (e.g. `/data/apprise/config`).
|Variable|Default|Description|
|`APPRISE\_DEFAULT\_CONFIG\_ID`|`apprise`|Default configuration key used by the web UI.|
|`APPRISE\_WEBHOOK\_URL`|*(Empty)*|Optional webhook that receives a POST payload after each notification attempt.|
|`APPRISE\_CONFIG\_DIR`|`\<BASE\_DIR\>/var/config`|Directory storing configurations. Relative to `\<BASE\_DIR\>` unless an absolute path is given.|
|`APPRISE\_STORAGE\_DIR`|`\<APPRISE\_CONFIG\_DIR\>/store`|Directory storing persistent storage.|
|`APPRISE\_STORAGE\_MODE`|`auto`|Persistent storage mode. Values: `memory`, `auto`, `flush`.|
|`APPRISE\_STORAGE\_PRUNE\_DAYS`|`30`|Number of days before persistent storage is pruned.|
|`APPRISE\_STORAGE\_UID\_LENGTH`|`8`|Default URL id length used by persistent storage.|
|`APPRISE\_ATTACH\_DIR`|`\<BASE\_DIR\>/var/attach`|Directory storing uploaded attachments. Relative to `\<BASE\_DIR\>` unless an absolute path is given.|
|`APPRISE\_ATTACH\_SIZE`|`200`|Maximum attachment size in MB. Set to `0` to disable attachments.|
|`APPRISE\_CONFIG\_MAX\_LENGTH`|`512`|Maximum configuration payload size in KB accepted by form and API configuration updates. Independent of the upload body limit. Cannot exceed `APPRISE\_UPLOAD\_MAX\_MEMORY\_SIZE`.|
|`APPRISE\_MAX\_ATTACHMENTS`|`6`|Maximum number of attachments per request. Set to `0` to disable the limit.|
|`APPRISE\_WEBHOOK\_MAPPING\_MAX\_DEPTH`|`5`|Maximum traversal depth for nested field mapping rules. Depth counts every individual step — each dict-key lookup and each array-index dereference (`[N]`). For example, `items[0].objectURI` is 3 steps and `a[0][1][2].value[3]` is 6 steps. See [Payload Mapping Hooks](/api/usage/#payload-mapping-hooks).|
|`APPRISE\_ATTACH\_ALLOW\_URL`|`\*`|Allow list for remote attachment URLs.|
|`APPRISE\_ATTACH\_REJECT\_URL`|`127.0.\* localhost\*`|Deny list for remote attachment URLs.|
|`APPRISE\_STATELESS\_URLS`|*(Empty)*|Default URLs used by stateless `/notify/` requests when no `urls` are supplied.|
|`APPRISE\_STATELESS\_STORAGE`|`no`|Allow stateless requests to use persistent storage when enabled.|
|`APPRISE\_DENY\_SERVICES`|*(Platform list)*|Comma-separated list of schemas to disable.|
|`APPRISE\_ALLOW\_SERVICES`|*(Empty)*|Exclusive allow list. If set, anything not in this list is disabled.|
|`APPRISE\_PLUGIN\_PATHS`|`\<BASE\_DIR\>/var/plugin`|Comma-separated list of plugin paths to scan. Relative to `\<BASE\_DIR\>` unless absolute paths are given.|
|`APPRISE\_API\_ONLY`|`no`|Disable the web UI and allow only the API endpoints.|
|`APPRISE\_DEFAULT\_THEME`|`light`|Default theme for the web UI. Values: `light`, `dark`.|
|`APPRISE\_INTERPRET\_EMOJIS`|*(Unset)*|If set, overrides emoji interpretation. Values: yes or no.|
## Django and Logging
[Section titled “Django and Logging”](#django-and-logging)
|Variable|Default|Description|
|`SECRET\_KEY`|*(Bundled default)*|Django secret key. Always override this in production.|
|`DEBUG`|`no`|Enable debug mode. Supports `yes`, `1`, `true`, and similar.|
|`LOG\_LEVEL`|`INFO`|Log level for both Django and Apprise logs.|
|`TZ`|`Etc/UTC`|Timezone for all log timestamps. Applies to both Nginx and the application, since both run inside the same container. Any IANA timezone name is accepted (e.g. `America/New\_York`, `Europe/London`). See the [list of tz database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) for valid values.|
|`ALLOWED\_HOSTS`|`\*`|Space-delimited allowed host list.|
|`APPRISE\_UPLOAD\_MAX\_MEMORY\_SIZE`|`3`|Maximum request body size (MB) stored in memory before Django raises `RequestDataTooBig`.|
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