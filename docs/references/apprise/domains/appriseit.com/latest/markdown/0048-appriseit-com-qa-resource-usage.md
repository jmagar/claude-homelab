Resource Usage | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Resource Usage
**Is the Apprise API Docker container using more RAM or memory than you expect?**
The table below maps your usage level to the right settings. For most personal and hobbyist deployments, a few environment variables are all it takes.
## Quick Reference
[Section titled “Quick Reference”](#quick-reference)
|Profile|Daily Notifications|`APPRISE\_WORKER\_COUNT`|`APPRISE\_WORKER\_MAX\_REQUESTS`|Expected RAM|
|**Hobbyist**|1 – 50|`1`|`50`|\~150–180 MB|
|**Light**|51 – 500|`1`|`200`|\~180–220 MB|
|**Medium**|501 – 5,000|`2`|`500`|\~330–400 MB|
|**Heavy**|5,001 – 20,000|`3–4`|`1000`*(default)*|\~500–700 MB|
|**High-volume**|20,000+|*(auto)*|`1000`*(default)*|varies|
`APPRISE\_WORKER\_COUNT=1` with `APPRISE\_WORKER\_MAX\_REQUESTS=50` keeps memory use low. **\~150–180 MB is the realistic minimum** for this stack — it is the fixed cost of running Python, Django, and Apprise’s full plugin suite, and cannot be reduced further through tuning alone.
## Applying the Settings
[Section titled “Applying the Settings”](#applying-the-settings)
The following provides an example of how you can apply the settings to your deployment. Choose the tab that matches your setup.
* [ Docker ](#tab-panel-77)
* [ Docker Compose ](#tab-panel-78)
Terminal window
```
`
docker run --name apprise \\
-e APPRISE\_WORKER\_COUNT=1 \\
-e APPRISE\_WORKER\_MAX\_REQUESTS=50 \\
-p 8000:8000 \\
-v ./config:/config \\
-d caronc/apprise:latest
`
```
## Why Is \~150 MB the Minimum?
[Section titled “Why Is \~150 MB the Minimum?”](#why-is-150-mb-the-minimum)
The container always runs three processes regardless of settings:
|Process|RAM|Notes|
|Nginx|\~25 MB|Reverse proxy|
|Supervisord|\~10 MB|Process manager|
|Gunicorn worker|\~115–145 MB|Python + Django + all Apprise plugins|
The worker is the main driver. Apprise loads **all 137 notification services at startup** — even ones you will never use. This is what creates the fixed baseline. The core Python, Django, and service scaffolding always loads; however, optional third-party libraries used only by specific services can be evicted at startup if those services are disabled (see [Reducing Memory Further with Service Filtering](#advanced-reducing-memory-further-with-service-filtering)).
The default worker count is `(2 × CPU cores) + 1`. On a 2-core host that is **5 workers**, which can push usage to 700 MB or more before a single notification is sent. Reducing to `APPRISE\_WORKER\_COUNT=1` has the most effect on memory use.
## Why Does Memory Grow Over Time?
[Section titled “Why Does Memory Grow Over Time?”](#why-does-memory-grow-over-time)
Python’s internal allocator retains freed memory rather than returning it to the OS immediately — this is normal, not a leak. Memory is only fully released when a worker **restarts**.
`APPRISE\_WORKER\_MAX\_REQUESTS` controls how many requests a worker handles before restarting. With the default of `1000` and only a handful of notifications per day, workers may run for months without ever recycling. Setting this to a lower value (e.g., `50`) ensures periodic restarts that keep memory closer to the startup baseline.
## Advanced: Jitter
[Section titled “Advanced: Jitter”](#advanced-jitter)
`APPRISE\_WORKER\_MAX\_REQUESTS\_JITTER` adds a random offset to each worker’s restart threshold to prevent all workers from recycling simultaneously.
* **Single-worker deployments**: jitter has no effect. The default of `50` is harmless, or you can set it to `0`.
* **Multi-worker deployments**: leave jitter at the default `50`, or scale it proportionally if you lower `APPRISE\_WORKER\_MAX\_REQUESTS` significantly (e.g., `MAX\_REQUESTS=50` → `JITTER=10`).
Jitter does not affect memory usage — only `APPRISE\_WORKER\_COUNT` and `APPRISE\_WORKER\_MAX\_REQUESTS` do.
## Related Environment Variables
[Section titled “Related Environment Variables”](#related-environment-variables)
|Variable|Default|Description|
|`APPRISE\_WORKER\_COUNT`|`(2×CPUs) + 1`|Number of Gunicorn workers. Set to `1` for low-resource deployments.|
|`APPRISE\_WORKER\_MAX\_REQUESTS`|`1000`|Requests before a worker restarts and releases accumulated memory.|
|`APPRISE\_WORKER\_MAX\_REQUESTS\_JITTER`|`50`|Random offset per worker to stagger restarts. Irrelevant for single-worker setups.|
|`APPRISE\_WORKER\_TIMEOUT`|`300`|Worker timeout in seconds.|
See the [Environment Variables reference](../reference/environment/) for a full list.
## Advanced: Reducing Memory Further with Service Filtering
[Section titled “Advanced: Reducing Memory Further with Service Filtering”](#advanced-reducing-memory-further-with-service-filtering)
If you only use a small set of notification services, you can reclaim additional memory by telling the API which services you actually need. The Apprise API will evict the optional libraries used exclusively by the disabled plugins from memory at startup.
Terminal window
```
`
APPRISE\_ALLOW\_SERVICES=tgram,ntfy
`
```
Libraries that are no longer needed by any enabled plugin are automatically removed from Python’s module cache (`sys.modules`). The savings compound with `APPRISE\_WORKER\_COUNT=1`:
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
For full details on how this works and configuration examples, see [Memory Impact of Service Filtering](../../api/reference/environment/#memory-impact-of-service-filtering).
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