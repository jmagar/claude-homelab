Session Info Update - Agent Client Protocol
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
* Author(s): [@ignatov](https://github.com/ignatov)
##
[​
](#elevator-pitch)
Elevator pitch
Add a `session\_info\_update` variant to the existing `SessionUpdate` notification type that allows agents to update session metadata (particularly title/name), enabling dynamic session identification in client UIs without requiring a new endpoint.
##
[​
](#status-quo)
Status quo
Currently, the ACP protocol provides session management through `session/new`, `session/load`, and `session/list` (unstable). The `session/list` endpoint returns `SessionInfo` objects that include an optional `title` field for displaying session names in client UIs.
However, there are several problems:
1. **No way to communicate title updates** - The `title` field in `SessionInfo` is static in the list response. Agents cannot dynamically update it as the session evolves.
2. **No mechanism for real-time metadata updates** - Unlike commands (`available\_commands\_update`) or modes (`current\_mode\_update`), there’s no way for agents to:
* Auto-generate titles after the first meaningful exchange
* Update titles as conversation context shifts
* Provide custom metadata that reflects session state
* **Inconsistent with protocol patterns** - Other dynamic session properties use `session/update` notifications (commands, modes, plans), but metadata has no equivalent mechanism.
The current workaround is for clients to:
* Maintain their own title mapping (doesn’t persist or sync)
* Only show static metadata from `session/list`
* Have no way to receive agent-generated titles in real-time
##
[​
](#what-we-propose-to-do-about-it)
What we propose to do about it
Add a new `session\_info\_update` variant to the existing `SessionUpdate` discriminated union that allows agents to notify clients about metadata changes. This update would:
1. **Follow the existing `SessionUpdate` pattern**:
* Uses the same notification mechanism as `available\_commands\_update`, `current\_mode\_update`, etc.
* Sent via `session/update` method
* Agent-initiated, no request/response needed
* **Align with `SessionInfo` structure**:
* Contains the same fields as `SessionInfo` from `session/list`
* All fields are optional (partial updates)
* Enables incremental metadata updates
* **Important**: `SessionInfoUpdate` must stay aligned with `SessionInfo` - when new fields are added to `SessionInfo`, they should also be added to `SessionInfoUpdate` as optional fields
* **Support common use cases**:
* Agent auto-generates title after first prompt
* Agent updates title as conversation context shifts
* Agent provides custom metadata for client features (tags, status, etc.)
* User explicitly requests title change (agent responds with update notification)
* **Integrate seamlessly**:
* No new capability required (uses existing `session/update` mechanism)
* Compatible with `session/list` - metadata should persist and be reflected in list responses
* Works during active sessions
###
[​
](#notification-structure)
Notification Structure
The agent sends a `session/update` notification with `sessionUpdate: "session\_info\_update"`:
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
###
[​
](#sessioninfoupdate-type)
SessionInfoUpdate Type
The update type mirrors `SessionInfo` but with all fields optional:
```
`{
sessionUpdate: "session\_info\_update",
title?: string | null, // Update or clear the title
updatedAt?: string | null, // ISO 8601 timestamp (usually agent sets this)
\_meta?: object | null // Custom metadata (merged with existing)
}
`
```
**Note:** `sessionId` and `cwd` are NOT included since:
* `sessionId` is already in the notification’s `params`
* `cwd` is immutable and set during `session/new`
###
[​
](#examples)
Examples
####
[​
](#update-title-and-working-directory-metadata)
Update title and working directory metadata
After the user sends their first meaningful prompt, the agent can generate and send a title along with metadata about the working directory:
```
`{
"jsonrpc": "2.0",
"method": "session/update",
"params": {
"sessionId": "sess\_abc123def456",
"update": {
"sessionUpdate": "session\_info\_update",
"title": "Debug authentication timeout",
"\_meta": {
"projectName": "api-server",
"branch": "main"
}
}
}
}
`
```
####
[​
](#update-title-as-conversation-evolves)
Update title as conversation evolves
As the conversation shifts focus:
```
`{
"jsonrpc": "2.0",
"method": "session/update",
"params": {
"sessionId": "sess\_abc123def456",
"update": {
"sessionUpdate": "session\_info\_update",
"title": "Debug authentication timeout → Add retry logic"
}
}
}
`
```
##
[​
](#shiny-future)
Shiny future
Once this feature exists:
1. **Dynamic session identification** - Agents can:
* Auto-generate meaningful titles from conversation content
* Update titles as conversations evolve
* Provide rich metadata for better organization
* **Improved client UIs** - Clients can:
* Show real-time title updates in session lists
* Display session status, tags, or other metadata
* Update UI immediately without polling `session/list`
* **Consistent protocol patterns** - Session metadata updates work like other dynamic session properties (commands, modes), creating a unified model
* **Bidirectional workflows** - Combined with a potential future request method:
* User renames session → client sends request → agent acknowledges with `session\_info\_update` notification
* Agent auto-generates title → sends `session\_info\_update` notification → client displays it
* **Enhanced use cases**:
* Session templates that auto-set titles and tags
* Progress indicators via `\_meta`
* Integration with external tools via metadata
* Rich session browsing and filtering
##
[​
](#implementation-details-and-plan)
Implementation details and plan
###
[​
](#phase-1-schema-changes)
Phase 1: Schema Changes
1. **Update `schema.unstable.json`**:
* Add `SessionInfoUpdate` type definition
* Add new variant to `SessionUpdate` oneOf array
* Align fields with `SessionInfo` but make all optional
```
`{
"SessionInfoUpdate": {
"description": "\*\*UNSTABLE\*\*\\n\\nThis capability is not part of the spec yet, and may be removed or changed at any point.\\n\\nUpdate to session metadata. All fields are optional to support partial updates.",
"properties": {
"\_meta": {
"description": "Extension point for implementations"
},
"title": {
"description": "Human-readable title for the session",
"type": ["string", "null"]
},
"updatedAt": {
"description": "ISO 8601 timestamp of last activity",
"type": ["string", "null"]
}
},
"type": "object"
}
}
`
```
Add to `SessionUpdate` oneOf:
```
`{
"allOf": [
{
"$ref": "#/$defs/SessionInfoUpdate"
}
],
"description": "\*\*UNSTABLE\*\*\\n\\nThis capability is not part of the spec yet, and may be removed or changed at any point.\\n\\nUpdate to session metadata",
"properties": {
"sessionUpdate": {
"const": "session\_info\_update",
"type": "string"
}
},
"required": ["sessionUpdate"],
"type": "object"
}
`
```
###
[​
](#phase-2-protocol-documentation)
Phase 2: Protocol Documentation
1. **Create documentation** in `/docs/protocol/session-metadata.mdx`:
* Explain the notification mechanism
* Provide examples of common patterns
* Document merge semantics for `\_meta`
* Clarify relationship with `session/list`
* **Update existing docs**:
* Reference in `/docs/protocol/session-setup.mdx`
* Add to `/docs/protocol/prompt-turn.mdx` session update section
###
[​
](#phase-3-sdk-implementation)
Phase 3: SDK Implementation
1. **Implement in Rust SDK**:
* Add `SessionInfoUpdate` struct
* Add variant to `SessionUpdate` enum
* Update notification handling in agent and client traits
* Add helper methods for common patterns
* **Implement in TypeScript SDK** (if applicable):
* Add TypeScript types
* Update notification handlers
* Add helper methods
###
[​
](#phase-4-example-implementation)
Phase 4: Example Implementation
1. **Update example agents**:
* Demonstrate auto-generating title from first prompt
* Show updating metadata during session
* Example of using `\_meta` for custom fields
###
[​
](#compatibility-considerations)
Compatibility Considerations
* **Fully backward compatible**: This adds a new notification variant to an existing mechanism
* **No breaking changes**: Existing agents and clients continue working
* **Graceful degradation**: Clients that don’t handle this notification simply ignore it
* **No new capability needed**: Uses existing `session/update` infrastructure
###
[​
](#design-decisions)
Design Decisions
**Why notification instead of request/response?**
* Consistent with existing `SessionUpdate` patterns (`available\_commands\_update`, `current\_mode\_update`)
* Agents initiate updates based on conversation state
* Simpler than bidirectional request/response
* Enables real-time updates without polling
**Why make all fields optional?**
* Allows partial updates (only update what changed)
* More efficient - don’t resend unchanged data
* Flexible for different use cases
* Mirrors partial update patterns in other protocols
**Why not include `sessionId` and `cwd` in the update?**
* `sessionId` is already in the notification params
* `cwd` is immutable (set in `session/new`, never changes)
* Keeps update focused on mutable metadata
**How do `\_meta` updates work?**
* **Merge semantics**: New `\_meta` fields are merged with existing ones
* To clear a specific field: `"\_meta": { "fieldName": null }`
* To clear all custom metadata: `"\_meta": null`
###
[​
](#security-considerations)
Security Considerations
* **No additional security concerns**: Uses existing session authentication
* **Input validation**:
* Agents should validate title length (recommend 500 chars max)
* Sanitize metadata to prevent injection
* Validate `\_meta` structure based on agent requirements
* **Resource limits**: Agents should limit update frequency and metadata size
##
[​
](#frequently-asked-questions)
Frequently asked questions
###
[​
](#why-not-create-a-new-endpoint-like-session/update-metadata)
Why not create a new endpoint like `session/update-metadata`?
The notification pattern is more appropriate because:
1. **Consistency**: Other dynamic session properties (commands, modes) use notifications
2. **Agent-initiated**: Agents typically generate titles from conversation context
3. **Real-time**: No request/response overhead, updates flow naturally
4. **Simpler**: Reuses existing `session/update` infrastructure
###
[​
](#how-does-this-work-with-session/list)
How does this work with `session/list`?
The updated metadata should persist and be reflected in subsequent `session/list` calls. The notification provides real-time updates to connected clients, while `session/list` provides the current state for discovery.
###
[​
](#can-clients-trigger-title-updates)
Can clients trigger title updates?
This RFD covers agent-initiated updates. Client-initiated updates could work by:
1. Client sends a prompt asking to rename session
2. Agent updates its internal state
3. Agent sends `session\_info\_update` notification
4. Client receives and displays the update
A future RFD could add explicit request/response for this if needed.
###
[​
](#what-if-multiple-updates-are-sent-in-quick-succession)
What if multiple updates are sent in quick succession?
Clients should apply updates incrementally in order. Each notification represents a delta, not a full replacement (except for fields explicitly set to `null`).
###
[​
](#should-updatedat-be-automatically-set-by-the-agent)
Should `updatedAt` be automatically set by the agent?
Yes, typically the agent should update this timestamp when any session activity occurs, not just when metadata changes. However, including it in `session\_info\_update` allows agents to explicitly control it if needed.
###
[​
](#do-agents-need-a-new-capability-for-this)
Do agents need a new capability for this?
No. All agents that support `session/update` notifications can send this variant. Clients that don’t recognize it will ignore it (standard JSON-RPC behavior).
###
[​
](#how-does-this-interact-with-session/fork)
How does this interact with `session/fork`?
When forking, the parent session’s metadata could be copied (implementation choice). The forked session would have its own `sessionId` and could receive separate `session\_info\_update` notifications.
###
[​
](#what-happens-if-title-is-too-long)
What happens if title is too long?
This is an implementation choice. Agents MAY:
* Truncate long titles
* Reject updates (though this is a notification, so no error response)
* Set a reasonable limit (e.g., 500 characters)
Clients SHOULD handle long titles gracefully (truncate in UI, show tooltip, etc.).
###
[​
](#can-meta-have-nested-objects)
Can `\_meta` have nested objects?
Yes, `\_meta` is an arbitrary object. Agents define its structure. The merge semantics apply recursively - nested objects are merged, not replaced entirely.
###
[​
](#what-alternative-approaches-did-you-consider-and-why-did-you-settle-on-this-one)
What alternative approaches did you consider, and why did you settle on this one?
Several alternatives were considered:
1. **Add a new request/response endpoint (`session/update-metadata`)** - This would be inconsistent with how other dynamic session properties (commands, modes) are handled. The notification pattern is more appropriate for agent-initiated updates.
2. **Add title parameter to `session/new`** - Only allows setting title at creation time, doesn’t support dynamic updates as the conversation evolves.
3. **Client-side only metadata tracking** - Doesn’t work across devices, can get out of sync, and duplicates storage. This is the current workaround and has significant limitations.
4. **Generic `session/update` request for all properties** - Could conflict with immutable properties (sessionId, cwd) and has unclear semantics about what can be updated.
The proposed notification-based approach:
* **Consistent** with existing protocol patterns
* **Flexible** for both agent-initiated and user-initiated updates
* **Simple** to implement and understand
* **Extensible** via `\_meta` field
##
[​
](#revision-history)
Revision history
* **2025-11-28**: Initial draft proposal