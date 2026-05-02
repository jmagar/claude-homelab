Integrations | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Integrations
Apprise API is meant to be a single notification gateway.
Instead of building direct webhooks to Discord, Slack, email, and SMS in every project, send to Apprise API and let it route the message.
## Endpoints
[Section titled “Endpoints”](#endpoints)
**Apprise does not require you to add Python in your application.**
Apprise itself is written in Python, but most integrations interact with it purely over HTTP using the Apprise API. Applications in any language can send notifications without embedding Python or managing notification logic locally.
|If you want to…|Recommended Approach|
|Avoid embedding Python in your application|Apprise API (Stateful or Stateless)|
|Keep notification logic out of your codebase|Apprise API (Stateful)|
|Use Apprise as a simple HTTP gateway|Apprise API (Stateless)|
|Send notifications from scripts or the command line|[Apprise CLI](../../cli/getting-started/) or [Apprise Python Library](../../library/getting-started/)|
### Stateless
[Section titled “Stateless”](#stateless)
If you cannot (or do not want to) store configuration server-side, you can also use
stateless notifications:
* `POST /notify`
Stateless calls include the destination Apprise URLs in the request payload.
See the endpoint reference for the full list of supported paths.
### Stateful
[Section titled “Stateful”](#stateful)
For stateful notifications (recommended for most integrations), you call one endpoint:
* `POST /notify/{KEY}`
Where `{KEY}` identifies a configuration saved on the server.
Your client code stays small and stable, while the Apprise API instance holds the actual
notification URLs and any routing tags.
## Build the Request URL
[Section titled “Build the Request URL”](#build-the-request-url)
Given:
* `scheme`: `http` or `https`
* `host`: the Apprise API hostname or IP
* `port`: optional, omit for 80 (http) or 443 (https)
* `key`: your saved configuration key
Construct:
* `BASE = {scheme}://{host}`
* If a non-default port is used: `BASE = {scheme}://{host}:{port}`
* `NOTIFY = {BASE}/notify/{key}`
If your Apprise API is hosted behind a reverse proxy under a subpath, you may need to
prefix your base URL with that path (for example, `https://example.com/apprise`).
## Common Payload Fields
[Section titled “Common Payload Fields”](#common-payload-fields)
Apprise API accepts both form and JSON payloads in many cases.
For integrations, JSON is usually easiest.
* `body` (required): message content
* `title` (optional): message title
* `type` (optional): `info` (default), `success`, `warning`, or `failure`
* `format` (optional): `text` (default), `markdown`, or `html`
* `tag` (optional, stateful): route to a subset of saved URLs
### Tags
[Section titled “Tags”](#tags)
Tags are only meaningful for stateful calls (`/notify/{KEY}`), because the server already
knows which URLs belong to that key.
The `tag` value follows these rules:
|`tag` value|Selected services|
|`"TagA"`|Has `TagA`|
|`"TagA TagB"`|Has `TagA`**AND**`TagB`|
|`"TagA+TagB"`|Has `TagA`**AND**`TagB`|
|`"TagA&TagB"`|Has `TagA`**AND**`TagB`|
|`"TagA,TagB"`|Has `TagA`**OR**`TagB`|
|`"TagA|TagB"`|Has `TagA`**OR**`TagB`|
|`"TagA TagC,TagB"`|Has (`TagA`**AND**`TagC`) **OR**`TagB`|
## Attachments
[Section titled “Attachments”](#attachments)
To send attachments, use `multipart/form-data`.
* Use `attach` (recommended) or `attachment` as the field name
* The attachment value can be:
* a local file upload
* a remote URL that Apprise API downloads and forwards
## Payload Mapping Hooks
[Section titled “Payload Mapping Hooks”](#payload-mapping-hooks)
If a third-party tool cannot change its JSON keys, Apprise API can map incoming fields
to Apprise fields using query parameters prefixed with a colon (`:`).
### Mapping Rules
[Section titled “Mapping Rules”](#mapping-rules)
|Syntax|Effect|
|`?:incoming\_field=apprise\_field`|Rename `incoming\_field` to `apprise\_field`|
|`?:incoming\_field=`|Remove `incoming\_field` from the payload|
|`?:apprise\_field=literal value`|Hard-code `apprise\_field` to a fixed string|
**Flat field example** — a tool sends `{"message": "Server Down"}`:
```
`
POST /notify/{KEY}?:message=body
`
```
### Nested / Subfield Mapping
[Section titled “Nested / Subfield Mapping”](#nested--subfield-mapping)
When a third-party payload contains nested objects or arrays, Apprise API can reach into
them using **dot-notation** for nested objects and **bracket-notation** for array elements.
Both syntaxes can be freely mixed on the source side of the mapping rule.
#### Nested Objects (Dot-Notation)
[Section titled “Nested Objects (Dot-Notation)”](#nested-objects-dot-notation)
Walk into nested dictionaries with a dot-separated path:
Terminal window
```
`
# Payload from a monitoring tool:
# {
# "event": { "title": "CPU spike", "state": "critical" },
# "component": { "name": "web-server-01" }
# }
curl -X POST \\
-H "Content-Type: application/json" \\
-d '{"event":{"title":"CPU spike","state":"critical"},"component":{"name":"web-server-01"}}' \\
"http://apprise-host/notify/{KEY}?:event.title=title&:event.state=type&:component.name=body"
`
```
#### Array Elements (Bracket-Notation)
[Section titled “Array Elements (Bracket-Notation)”](#array-elements-bracket-notation)
Append `[N]` after a key name to dereference index `N` of that array. Multiple subscripts
and mixing with dot-notation are both supported:
Terminal window
```
`
# Payload from a forum / project-management webhook (e.g. Scoold / Para):
# {
# "items": [ { "title": "New post", "objectURI": "https://example.com/q/1234" } ]
# }
curl -g -X POST \\
-H "Content-Type: application/json" \\
-d '{"items":[{"title":"New post","objectURI":"https://example.com/q/1234"}]}' \\
"http://apprise-host/notify/{KEY}?:items[0].title=title&:items[0].objectURI=body"
`
```
`curl` treats brackets in URLs as globbing syntax, so `-g` (or `--globoff`) is required when using mapping paths such as `items[0].title`. Keep the URL quoted so your shell passes it through unchanged.
Quick-reference for path expressions:
|Source key|Resolves to|
|`items[0]`|First element of `items`|
|`items[0].objectURI`|`.objectURI` property of the first element|
|`matrix[0][1]`|Row 0, column 1 of a 2-D array|
|`a[0][1][2].value[3]`|Nested arrays -\> dict -\> array (6 traversal steps)|
**Rules and limits:**
* Only the **source** side of the rule may use path notation; the target must be a flat
Apprise field (`title`, `body`, `type`, `format`, `tag`, etc.).
* `N` in `[N]` must be a non-negative integer. Both `key[abc]` (non-integer) and
`key[0` / `key0]` (unmatched bracket) are rejected immediately.
* If any step is unresolvable — missing key, index out of range, or a non-list node at
an index step — the server returns **400** and logs a `WARNING`. No notification is sent,
so misconfigured rules are visible in logs rather than silently dropped.
* **Depth** is the total number of traversal operations: each dict-key lookup *and* each
array-index dereference counts as one step. `items[0].objectURI` = 3 steps;
`a[0][1][2].value[3]` = 6 steps.
* The maximum traversal depth defaults to **5**. Set
`APPRISE\_WEBHOOK\_MAPPING\_MAX\_DEPTH` to change this limit.
## Examples
[Section titled “Examples”](#examples)
* [ Stateless Examples ](#tab-panel-28)
* [ Stateful Examples ](#tab-panel-29)
* [ curl ](#tab-panel-6)
* [ Python ](#tab-panel-7)
* [ TypeScript ](#tab-panel-8)
* [ JavaScript ](#tab-panel-9)
* [ PHP ](#tab-panel-10)
* [ Go ](#tab-panel-11)
* [ Java ](#tab-panel-12)
* [ C# (.NET) ](#tab-panel-13)
* [ PowerShell ](#tab-panel-14)
* [ Ruby ](#tab-panel-15)
* [ Rust ](#tab-panel-16)
Terminal window
```
`
# Minimal stateless notification using curl
curl -X POST "http://localhost:8000/notify" \\
-H "Content-Type: application/json" \\
-d '{
"urls": [
"discord://TOKEN/CHANNEL",
"mailto://user:pass@example.com"
],
"body": "Hello from Apprise (stateless)"
}'
`
```
Terminal window
```
`
# Stateless notification with an attachment
curl -X POST "http://localhost:8000/notify" \\
-F 'payload={
"urls": ["discord://TOKEN/CHANNEL"],
"title": "Build Complete",
"body": "Artifact attached"
};type=application/json' \\
-F "attach=@/path/to/file.txt"
`
```
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