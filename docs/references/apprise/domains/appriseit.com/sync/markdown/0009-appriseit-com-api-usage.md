API Usage | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# API Usage
This guide covers the core functionality of the Apprise API: sending notifications. You can send notifications in two ways:
1. **Stateless:** You provide the configuration URLs in the request payload.
2. **Stateful:** You reference a pre-saved configuration Key.
## Response Formats
[Section titled “Response Formats”](#response-formats)
By default, endpoints return `text/plain`. If you prefer JSON, send `Accept: application/json`.
For notification endpoints (`/notify` and `/notify/{KEY}`), you can also request a simple HTML log view by sending `Accept: text/html`. This is mainly useful for human testing in a browser.
## Stateless Notifications
[Section titled “Stateless Notifications”](#stateless-notifications)
Stateless notifications are ideal for “sidecar” usage where you don’t want to manage persistent configuration on the server. You must provide the `urls` parameter in every request.
### Basic JSON Request
[Section titled “Basic JSON Request”](#basic-json-request)
The most common method is sending a JSON payload to `/notify`.
**Endpoint:** `POST /notify`
Terminal window
```
`
curl -X POST \\
-H "Content-Type: application/json" \\
-d '{
"urls": "mailto://user:pass@gmail.com",
"body": "Backup completed successfully.",
"title": "System Status"
}' \\
http://localhost:8000/notify
`
```
### File Attachments
[Section titled “File Attachments”](#file-attachments)
To send attachments, use `multipart/form-data`. The API accepts standard file uploads or remote URLs. You can use `attach` (recommended) or `attachment` as the field name.
Terminal window
```
`
# Upload a local file
curl -X POST \\
-F "urls=discord://webhook\_id/token" \\
-F "body=See attached log." \\
-F "attach=@/var/log/syslog" \\
http://localhost:8000/notify
# Reference a remote URL (Apprise will download and forward it)
curl -X POST \\
-F "urls=discord://webhook\_id/token" \\
-F "body=Security Camera Snapshot" \\
-F "attach=http://camera-ip/snapshot.jpg" \\
http://localhost:8000/notify
`
```
## Stateful Notifications
[Section titled “Stateful Notifications”](#stateful-notifications)
Stateful notifications allow you to simplify your client code. You store the complex URLs on the server once, assigned to a **Key**, and your client simply references that Key.
**Endpoint:** `POST /notify/{KEY}`
### Sending to a Key
[Section titled “Sending to a Key”](#sending-to-a-key)
If you have saved a configuration under the key `my-alerts`:
Terminal window
```
`
curl -X POST \\
-H "Content-Type: application/json" \\
-d '{
"body": "Database connection failed",
"type": "warning"
}' \\
http://localhost:8000/notify/my-alerts
`
```
### Tagging
[Section titled “Tagging”](#tagging)
Stateful configurations support tagging, allowing you to notify specific subgroups of your saved URLs.
The value passed in the `tag` field follows these rules:
|`tag` value|Selected services|
|`"TagA"`|Has `TagA`|
|`"TagA TagB"`|Has `TagA`**AND**`TagB`|
|`"TagA+TagB"`|Has `TagA`**AND**`TagB`|
|`"TagA&TagB"`|Has `TagA`**AND**`TagB`|
|`"TagA,TagB"`|Has `TagA`**OR**`TagB`|
|`"TagA|TagB"`|Has `TagA`**OR**`TagB`|
|`"TagA TagC,TagB"`|Has (`TagA`**AND**`TagC`) **OR**`TagB`|
Terminal window
```
`
# Notify services tagged "devops" OR "admin"
curl -X POST -d '{"tag": "devops,admin", "body": "..."}' ...
# Notify services tagged "devops" AND "critical"
curl -X POST -d '{"tag": "devops critical", "body": "..."}' ...
# Notify services matching ('comment' AND 'create') OR 'admin'
curl -X POST -d '{"tag": "comment create,admin", "body": "..."}' ...
`
```
## Payload Mapping (Hooks)
[Section titled “Payload Mapping (Hooks)”](#payload-mapping-hooks)
Sometimes you cannot change the payload format sent by a third-party tool (e.g., Grafana, Prometheus). Apprise API allows you to map incoming fields to Apprise-compatible fields using query parameters prefixed with a colon (`:`).
Mapping keys are passed in the query string and must be URL encoded if they contain special characters.
### Mapping Rules
[Section titled “Mapping Rules”](#mapping-rules)
|Syntax|Effect|
|`?:incoming\_field=apprise\_field`|Rename `incoming\_field` to the Apprise field|
|`?:incoming\_field=`|Remove `incoming\_field` from the payload|
|`?:apprise\_field=literal value`|Hard-code `apprise\_field` to a fixed string|
**Example** — your tool sends `{"message": "Server Down", "severity": "high"}`, but Apprise expects `body` and `type`:
Terminal window
```
`
curl -X POST \\
-d '{"message": "Server Down", "severity": "high"}' \\
"http://localhost:8000/notify/my-alerts?:message=body&:severity=type"
`
```
### Nested Field Mapping
[Section titled “Nested Field Mapping”](#nested-field-mapping)
When the incoming payload uses nested objects or arrays, reference them on the source side of the rule using **dot-notation** for nested objects and **bracket-notation** for array elements. Both can be freely combined.
#### Nested Objects (Dot-Notation)
[Section titled “Nested Objects (Dot-Notation)”](#nested-objects-dot-notation)
Use a dot-separated path to walk into nested dictionaries:
Terminal window
```
`
# Payload from a monitoring tool:
# { "event": { "title": "CPU spike", "state": "critical" },
# "component": { "name": "web-server-01" } }
curl -X POST \\
-H "Content-Type: application/json" \\
-d '{"event":{"title":"CPU spike","state":"critical"},"component":{"name":"web-server-01"}}' \\
"http://localhost:8000/notify/my-alerts?:event.title=title&:event.state=type&:component.name=body"
`
```
#### Array Elements (Bracket-Notation)
[Section titled “Array Elements (Bracket-Notation)”](#array-elements-bracket-notation)
Append `[N]` directly after the key name to dereference index `N` of that array. Multiple subscripts and mixing with dot-notation are both supported:
Terminal window
```
`
# Payload from a forum / project-management webhook (e.g. Scoold / Para):
# { "items": [ { "title": "New post", "objectURI": "https://example.com/q/1234" } ] }
curl -g -X POST \\
-H "Content-Type: application/json" \\
-d '{"items":[{"title":"New post","objectURI":"https://example.com/q/1234"}]}' \\
"http://localhost:8000/notify/my-alerts?:items[0].title=title&:items[0].objectURI=body"
`
```
`curl` treats brackets in URLs as globbing syntax, so `-g` (or `--globoff`) is required when using mapping paths such as `items[0].title`. Keep the URL quoted so your shell passes it through unchanged.
Chained subscripts traverse nested arrays:
```
`
# Source key What it resolves to
items[0] first element of the items array
items[0].objectURI .objectURI of the first element
matrix[0][1] row 0, column 1 of a 2-D array
a[0][1][2].value[3] nested arrays -\> dict -\> array
`
```
**Rules and limits:**
* Only the **source** side may use path notation; the target must be a flat Apprise field (`title`, `body`, `type`, `format`, `tag`, etc.).
* `N` in `[N]` must be a non-negative integer. Both `key[abc]` (non-integer) and `key[0` / `key0]` (unmatched bracket) are rejected with a `WARNING`.
* If any step in the path cannot be resolved (missing key, index out of range, or a non-list node encountered at an index step), the server returns **400** and logs a `WARNING` — no notification is sent. This lets you catch misconfigured rules without silently dropping messages.
* **Depth** is counted as the total number of individual traversal operations — each dict-key lookup *and* each array-index dereference counts as one step. For example, `items[0].objectURI` is **3** steps (`items` -\> `[0]` -\> `objectURI`), and `a[0][1][2].b[3]` is **6** steps.
* The maximum traversal depth defaults to **5**. Adjust it with the `APPRISE\_WEBHOOK\_MAPPING\_MAX\_DEPTH` environment variable.
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