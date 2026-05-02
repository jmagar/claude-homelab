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
* Author(s): [@ahmedhesham6](https://github.com/ahmedhesham6)
* Champion: [@benbrandt](https://github.com/benbrandt)
##
[​
](#elevator-pitch)
Elevator pitch
Add a `session/list` endpoint to the ACP protocol that allows clients to query and enumerate existing sessions from an agent, enabling session management features like session history, session switching, and session cleanup.
##
[​
](#status-quo)
Status quo
Currently, the ACP protocol provides session management through `session/new` and `session/load` endpoints. However, there is no way for clients to:
1. **Discover existing sessions** - Clients cannot query what sessions exist on an agent
2. **Display session history** - Users cannot see a list of their past conversations
3. **Manage multiple sessions** - Switching between sessions requires clients to track session IDs themselves
4. **Clean up old sessions** - No way to discover stale or abandoned sessions for cleanup
This creates several problems:
* **Poor user experience** - Users cannot browse their conversation history or resume previous sessions easily
* **Client-side complexity** - Each client must implement its own session tracking and persistence
* **Inconsistent behavior** - Different clients handle session management differently, leading to fragmented experiences
The current workaround is for clients to maintain their own session registry, but this:
* Requires persistent storage on the client side
* Can get out of sync if sessions are created/destroyed outside the client
* Doesn’t work across different client instances or devices
* Cannot leverage agent-side session metadata or state
##
[​
](#what-we-propose-to-do-about-it)
What we propose to do about it
Add a new `session/list` JSON-RPC method to the protocol that returns metadata about sessions known to the agent. This endpoint would:
1. **Return a list of sessions** with essential metadata:
* `sessionId` - Unique identifier
* `cwd` - Working directory for the session
* `title` - Optional human-readable title (could be auto-generated from first prompt)
* `updatedAt` - Timestamp of last update to the session
* `\_meta` - Optional agent-specific metadata
* **Support filtering and pagination**:
* Filter by working directory
* Agent provides an optional cursor for retrieving the next page of results
* **Be an optional capability**:
* Agents advertise `sessionCapabilities: { list: {} }` in initialization if they support this feature
* Clients check for this capability before attempting to call `session/list`
* Agents without persistent session storage don’t need to implement this
###
[​
](#json-rpc-request)
JSON-RPC Request
The client calls `session/list` with optional filtering and pagination parameters:
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
####
[​
](#request-parameters)
Request Parameters
All parameters are optional:
* `cwd` (string) - Filter sessions by working directory
* `cursor` (string) - Opaque cursor token from a previous response’s `nextCursor` field for cursor-based pagination
####
[​
](#minimal-request-example)
Minimal Request Example
A request with no filters returns all sessions with default sorting:
```
`{
"jsonrpc": "2.0",
"id": 2,
"method": "session/list",
"params": {}
}
`
```
###
[​
](#json-rpc-response)
JSON-RPC Response
The agent responds with a list of sessions and cursor pagination metadata:
```
`{
"jsonrpc": "2.0",
"id": 2,
"result": {
"sessions": [
{
"sessionId": "sess\_abc123def456",
"updatedAt": "2025-10-29T14:22:15Z",
"cwd": "/home/user/project",
"title": "Implement session list API",
"\_meta": {
"messageCount": 12,
"hasErrors": false
}
},
{
"sessionId": "sess\_xyz789ghi012",
"updatedAt": "2025-10-28T16:45:30Z",
"cwd": "/home/user/another-project",
"title": "Debug authentication flow"
},
{
"sessionId": "sess\_uvw345rst678",
"updatedAt": "2025-10-27T15:30:00Z",
"cwd": "/home/user/project"
}
],
"nextCursor": "eyJwYWdlIjogM30="
}
}
`
```
####
[​
](#response-fields)
Response Fields
**Response object:**
* `sessions` (array) - Array of session information objects
* `nextCursor` (string, optional) - Opaque cursor token. If present, pass this in the next request’s `cursor` parameter to fetch the next page. If absent, there are no more results.
**SessionInfo object:**
* `sessionId` (string, required) - Unique identifier for the session
* `cwd` (string, required) - Working directory for the session
* `title` (string, optional) - Human-readable title (may be auto-generated from first prompt)
* `updatedAt` (string, optional) - ISO 8601 timestamp of last activity
* `\_meta` (object, optional) - Agent-specific metadata (e.g., message count, error status, tags)
####
[​
](#empty-result-example)
Empty Result Example
When no sessions match the criteria:
```
`{
"jsonrpc": "2.0",
"id": 2,
"result": {
"sessions": []
}
}
`
```
##
[​
](#shiny-future)
Shiny future
Once this feature exists:
1. **Clients can build session browsers** - Users can view a list of all their conversations, sorted by recency or relevance
2. **Session switching becomes seamless** - Users can easily switch between ongoing conversations
3. **Better resource management** - Clients can identify and clean up old or inactive sessions
4. **Cross-device continuity** - Users could potentially access their sessions from different devices (if agent supports it)
5. **Improved UX patterns**:
* “Recent conversations” sidebar
* Search through past sessions
* Archive/delete old sessions
* Resume interrupted work easily
Agents that implement this feature gain:
* Better visibility into active sessions
* Opportunity to implement session lifecycle policies
* Foundation for future features like session sharing or collaboration
##
[​
](#implementation-details-and-plan)
Implementation details and plan
###
[​
](#phase-1-core-protocol-changes)
Phase 1: Core Protocol Changes
1. **Update schema.json** to add:
* `session/list` method definition
* `ListSessionsRequest` and `ListSessionsResponse` types
* `SessionInfo` type
* `sessionCapabilities/list` capability flag
* **Update protocol documentation** in `/docs/protocol/session-setup.mdx`:
* Document the new endpoint
* Explain when to use it vs. maintaining client-side session tracking
* Provide examples of common use cases
###
[​
](#phase-2-reference-implementation)
Phase 2: Reference Implementation
1. **Implement in Rust SDK** (`src/agent.rs` and `src/client.rs`):
* Add `list\_sessions` method to agent trait
* Provide default implementation (empty list) for agents without persistence
* Add client method to call `session/list`
* **Add to TypeScript SDKs** (if applicable):
* Update TypeScript types
* Add client methods
###
[​
](#phase-3-example-implementation)
Phase 3: Example Implementation
1. **Create example agent** that demonstrates:
* In-memory session registry
* Automatic title generation from first prompt
* Session lifecycle management (cleanup after N days)
* Pagination and filtering
###
[​
](#compatibility-considerations)
Compatibility Considerations
* **Backward compatible**: Existing agents continue working without implementing this
* **Capability-based**: Clients check for `sessionCapabilities.list` capability before using
* **No breaking changes**: No modifications to existing endpoints
###
[​
](#security-considerations)
Security Considerations
* **Session isolation**: Agents must ensure sessions are only listed for the authenticated client
* **Resource limits**: Agents should enforce reasonable page sizes internally to prevent abuse
##
[​
](#frequently-asked-questions)
Frequently asked questions
###
[​
](#what-alternative-approaches-did-you-consider-and-why-did-you-settle-on-this-one)
What alternative approaches did you consider, and why did you settle on this one?
Several alternatives were considered:
1. **Client-side session tracking only** - This is the current approach, but it has limitations:
* Doesn’t work across devices
* Can get out of sync
* Adds complexity to every client implementation
* **Session events/notifications** - Push notifications when sessions are created/destroyed:
* More complex to implement
* Requires long-lived connections
* Still requires client-side state management
* Better suited as a future enhancement, not a replacement
* **File-based session manifest** - Agent writes session list to a file that clients read:
* Couples agent and client file system access
* Doesn’t work for remote agents
* No standard format
The proposed RPC approach is:
* **Consistent with existing protocol design** - Uses same RPC patterns as other endpoints
* **Flexible** - Supports filtering, pagination, and agent-specific metadata
* **Optional** - Agents can opt-in based on their architecture
* **Simple** - Single request/response pattern, easy to implement and use
###
[​
](#why-not-make-this-mandatory-for-all-agents)
Why not make this mandatory for all agents?
Many agents may not have persistent storage or multi-session capabilities. Making this optional:
* Allows simple, stateless agents to remain compliant
* Reduces implementation burden
* Lets agents evolve session management over time
###
[​
](#how-does-this-interact-with-session/load)
How does this interact with `session/load`?
`session/load` remains the mechanism to actually restore a session. `session/list` is for discovery only:
1. Client calls `session/list` to get available sessions
2. User selects a session
3. Client calls `session/load` with the chosen `sessionId`
Agents may support `session/list` without supporting `session/load` (e.g., for read-only session browsing).
###
[​
](#should-we-include-session-content-in-the-list-response)
Should we include session content in the list response?
No, for several reasons:
* **Performance** - Full conversation history could be large
* **Privacy** - Listing sessions might be less sensitive than exposing full content
* **Separation of concerns** - Use `session/load` to get full session content
###
[​
](#what-about-session-deletion)
What about session deletion?
Session deletion is intentionally left out of this RFD to keep scope focused. A future `session/delete` endpoint could be proposed separately. For now, agents can implement their own lifecycle policies.
###
[​
](#how-should-pagination-work-for-large-session-lists)
How should pagination work for large session lists?
We use cursor-based pagination:
* Request includes an optional `cursor`
* Response includes `nextCursor` when more results are available
* Clients should treat a missing `nextCursor` as the end of results
* Clients MUST treat cursors as opaque tokens: don’t parse, modify, or persist them across sessions
* The cursor MUST be a string; never send a raw JSON object as the cursor
* Servers SHOULD provide stable cursors and handle invalid cursors gracefully
Good request example:
```
`{
"jsonrpc": "2.0",
"id": 2,
"method": "session/list",
"params": {
"cwd": "/home/user/project",
"createdAfter": "2025-10-20T00:00:00Z",
"cursor": "eyJwYWdlIjogMn0=",
"search": "auth"
}
}
`
```
Corresponding response example:
```
`{
"jsonrpc": "2.0",
"id": 2,
"result": {
"sessions": [
/\* ... \*/
],
"nextCursor": "eyJwYWdlIjogM30="
}
}
`
```
##
[​
](#revision-history)
Revision history
* **2025-10-29**: Initial draft proposal
* **2025-10-30**: Update to use `\_meta` field for agent-specific metadata
* **2025-10-30**: Switch from offset-based to cursor-based pagination using continuation tokens
* **2025-10-30**: Rename `lastAccessedAt` to `updatedAt` for consistency
* **2025-10-30**: Remove `preview` field from SessionInfo (out of scope)
* **2025-10-30**: Remove session orphaning from problem statement
* **2025-10-30**: Replace `sortBy`/`sortOrder` with `search` parameter; remove `total` count from response
* **2025-10-31**: Update pagination: `continuationToken` → `cursor`, `nextContinuationToken` → `nextCursor`, remove `hasMore`
* **2025-11-11**: Remove `createdAt`, `updatedAt`, and `search` filters from the request parameters
* **2025-11-23**: Remove `limit` parameter from request; make `createdAt` and `updatedAt` optional in SessionInfo
* **2025-11-24**: Update capabilities schema, consolidate to single `updatedAt` timestamp