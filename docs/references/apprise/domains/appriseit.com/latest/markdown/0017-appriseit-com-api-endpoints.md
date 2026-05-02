API Endpoints | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# API Endpoints
This section details the available endpoints for the Apprise API.
## Health Checks
[Section titled “Health Checks”](#health-checks)
You can perform status or health checks on your server configuration.
|Path|Method|Description|
|`/status`|`GET`|Returns a server status. The server HTTP response code is `200` if working correctly, or `417` if there is an issue.|
**Response Examples:**
* **Text**: `OK` (if healthy) or `ATTACH\_PERMISSION\_ISSUE`, `CONFIG\_PERMISSION\_ISSUE`.
* **JSON**:
```
`
{
"attach\_lock": false,
"config\_lock": false,
"status": {
"persistent\_storage": true,
"can\_write\_config": true,
"can\_write\_attach": true,
"details": ["OK"]
}
}
`
```
## Stateless Notifications
[Section titled “Stateless Notifications”](#stateless-notifications)
Send notifications without using persistent storage.
|Path|Method|Description|
|`/notify/`|`POST`|Sends one or more notifications to the URLs identified in the payload or via `APPRISE\_STATELESS\_URLS`.|
**Payload Parameters:**
* `urls`: (Required) One or more URLs to send to.
* `body`: (Required) The message body.
* `title`: (Optional) The message title.
* `type`: (Optional) Message type: `info` (default), `success`, `warning`, `failure`.
* `format`: (Optional) Text format: `text` (default), `markdown`, `html`.
## Persistent (Stateful) Endpoints
[Section titled “Persistent (Stateful) Endpoints”](#persistent-stateful-endpoints)
Manage and use saved configurations associated with a `{KEY}`.
|Path|Method|Description|
|`/add/{KEY}`|`POST`|Saves Apprise configuration to the persistent store. Payload: `urls`, `config`, `format`.|
|`/del/{KEY}`|`POST`|Removes Apprise configuration from the persistent store.|
|`/get/{KEY}`|`POST`|Returns the Apprise configuration. Alias: `/cfg/{KEY}` (web UI uses this).|
|`/notify/{KEY}`|`POST`|Sends notifications to endpoints associated with `{KEY}`. Payload: `body` (required), `title`, `type`, `tag`, `format`.|
|`/json/urls/{KEY}`|`GET`|Returns a JSON object containing all URLs and tags associated with the key.|
## Observability
[Section titled “Observability”](#observability)
|Path|Method|Description|
|`/details`|`GET`|Retrieve a JSON object containing all supported Apprise URLs (send `Accept: application/json`).|
|`/metrics`|`GET`|Prometheus endpoint for basic metrics collection.|
## Response codes
[Section titled “Response codes”](#response-codes)
For a full list (including UI-only codes and common error responses), see [Response Codes](/api/reference/response-codes/).
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