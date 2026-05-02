Session List - Agent Client Protocol
[Protocol
](/get-started/introduction)[RFDs
](/rfds/about)[Community
](/community/communication)[Publications
](/publications)[Updates
](/updates)[Brand
](/brand)
## > Documentation Index
> Fetch the complete documentation index at:
[> https://agentclientprotocol.com/llms.txt
](https://agentclientprotocol.com/llms.txt)
> Use this file to discover all available pages before exploring further.
The `session/list` method allows Clients to discover sessions known to an Agent. Clients can use this to display session history and switch between sessions.
Agents can also push session metadata updates to Clients in real-time via the `session\_info\_update` notification, keeping session titles and metadata in sync without polling.
Before listing sessions, Clients **MUST** first complete the [initialization](./initialization) phase to verify the Agent supports this capability.
##
[​
](#checking-support)
Checking Support
Before attempting to list sessions, Clients **MUST** verify that the Agent supports this capability by checking the `sessionCapabilities.list` field in the `initialize` response:
```
`{
"jsonrpc": "2.0",
"id": 0,
"result": {
"protocolVersion": 1,
"agentCapabilities": {
"sessionCapabilities": {
"list": {}
}
}
}
}
`
```
If `sessionCapabilities.list` is not present, the Agent does not support listing sessions and Clients **MUST NOT** attempt to call `session/list`.
##
[​
](#listing-sessions)
Listing Sessions
Clients discover existing sessions by calling the `session/list` method with optional filtering and pagination parameters:
```
`{
"jsonrpc": "2.0",
"id": 2,
"method": "session/list",
"params": {
"cwd": "/home/user/project",
"cursor": "eyJwYWdlIjogMn0="
}
}
`
```
All parameters are optional. A request with an empty `params` object returns the first page of sessions.
[​
](#param-cwd)
cwd
string
Filter sessions by working directory. Must be an absolute path. Only sessions
with a matching `cwd` are returned.
[​
](#param-cursor)
cursor
string
Opaque cursor token from a previous response’s `nextCursor` field for
cursor-based pagination. See [Pagination](#pagination).
The Agent **MUST** respond with a list of sessions and optional pagination metadata:
```
`{
"jsonrpc": "2.0",
"id": 2,
"result": {
"sessions": [
{
"sessionId": "sess\_abc123def456",
"cwd": "/home/user/project",
"title": "Implement session list API",
"updatedAt": "2025-10-29T14:22:15Z",
"\_meta": {
"messageCount": 12,
"hasErrors": false
}
},
{
"sessionId": "sess\_xyz789ghi012",
"cwd": "/home/user/another-project",
"title": "Debug authentication flow",
"updatedAt": "2025-10-28T16:45:30Z"
},
{
"sessionId": "sess\_uvw345rst678",
"cwd": "/home/user/project",
"updatedAt": "2025-10-27T15:30:00Z"
}
],
"nextCursor": "eyJwYWdlIjogM30="
}
}
`
```
[​
](#param-sessions)
sessions
SessionInfo[]
required
Array of session information objects.
Show SessionInfo
[​
](#param-session-id)
sessionId
string
required
Unique identifier for the session.
[​
](#param-cwd-1)
cwd
string
required
Working directory for the session. Always an absolute path.
[​
](#param-title)
title
string
Human-readable title for the session. May be auto-generated from the first prompt.
[​
](#param-updated-at)
updatedAt
string
ISO 8601 timestamp of the last activity in the session.
[​
](#param-meta)
\_meta
object
Agent-specific metadata. See [Extensibility](./extensibility).
[​
](#param-next-cursor)
nextCursor
string
Opaque cursor token. If present, pass this in the next request’s `cursor`
parameter to fetch the next page. If absent, there are no more results.
When no sessions match the criteria, the Agent **MUST** return an empty `sessions` array.
`session/list` uses cursor-based pagination. The request includes an optional `cursor`, and the response includes `nextCursor` when more results are available.
* Clients **MUST** treat a missing `nextCursor` as the end of results
* Clients **MUST** treat cursors as opaque tokens — do not parse, modify, or persist them
* Agents **SHOULD** return an error if the cursor is invalid
* Agents **SHOULD** enforce reasonable page sizes internally
##
[​
](#updating-session-metadata)
Updating Session Metadata
Agents can update session metadata in real-time by sending a `session\_info\_update` notification via `session/update`. This follows the same pattern as other session notifications like [`available\_commands\_update`](./slash-commands) and [`current\_mode\_update`](./session-modes).
```
`{
"jsonrpc": "2.0",
"method": "session/update",
"params": {
"sessionId": "sess\_abc123def456",
"update": {
"sessionUpdate": "session\_info\_update",
"title": "Implement user authentication",
"\_meta": {
"tags": ["feature", "auth"],
"priority": "high"
}
}
}
}
`
```
All fields are optional. Only include fields that have changed — omitted fields are left unchanged.
[​
](#param-title-1)
title
string | null
Human-readable title for the session. Set to `null` to clear.
[​
](#param-updated-at-1)
updatedAt
string | null
ISO 8601 timestamp of last activity. Set to `null` to clear.
[​
](#param-meta-1)
\_meta
object
Agent-specific metadata. See [Extensibility](./extensibility).
The `sessionId` and `cwd` fields are **not** included in the update — `sessionId` is already in the notification’s `params`, and `cwd` is immutable (set during [`session/new`](./session-setup#creating-a-session)). Agents typically send this notification after the first meaningful exchange to auto-generate a title.
##
[​
](#interaction-with-other-session-methods)
Interaction with Other Session Methods
`session/list` is a discovery mechanism only — it does **not** restore or modify sessions:
1. Client calls `session/list` to discover available sessions
2. User selects a session from the list
3. Client calls [`session/load`](./session-setup#loading-sessions) with the chosen `sessionId` to resume the conversation