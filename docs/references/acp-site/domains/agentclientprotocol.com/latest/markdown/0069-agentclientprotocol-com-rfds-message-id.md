Message ID - Agent Client Protocol
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
* Author(s): [@michelTho](https://github.com/michelTho), [@nemtecl](https://github.com/nemtecl)
* Champion: [@benbrandt](https://github.com/benbrandt)
##
[​
](#elevator-pitch)
Elevator pitch
Add a `messageId` field to `agent\_message\_chunk`, `user\_message\_chunk`, `agent\_thought\_chunk` session updates and `session/prompt` requests, and a `userMessageId` field to `session/prompt` responses, to uniquely identify individual messages within a conversation. Both clients and agents can generate message IDs using UUID format. This enables clients to distinguish between different messages beyond changes in update type and lays the groundwork for future capabilities like message editing and session deduplication.
##
[​
](#status-quo)
Status quo
Currently, when an Agent sends message chunks via `session/update` notifications, there is no explicit identifier for the message being streamed:
```
`{
"jsonrpc": "2.0",
"method": "session/update",
"params": {
"sessionId": "sess\_abc123def456",
"update": {
"sessionUpdate": "agent\_message\_chunk",
"content": {
"type": "text",
"text": "Let me analyze your code..."
}
}
}
}
`
```
This creates several limitations:
1. **Ambiguous message boundaries** - When the Agent sends multiple messages in sequence (e.g., alternating between agent and user messages, or multiple agent messages), Clients can only infer message boundaries by detecting a change in the `sessionUpdate` type. If an Agent sends consecutive messages of the same type, Clients cannot distinguish where one message ends and another begins.
2. **Non-standard workarounds** - Currently, implementations rely on the `\_meta` field to work around this limitation. While functional, this approach is not standardized and each implementation may use different conventions.
3. **Limited future capabilities** - Without stable message identifiers, it’s difficult to build features like:
* Message editing or updates
* Message-specific metadata or annotations
* Message threading or references
* Undo/redo functionality
As an example, consider this sequence where a Client cannot reliably determine message boundaries:
```
`// First agent message chunk
{ "sessionUpdate": "agent\_message\_chunk", "content": { "type": "text", "text": "Analyzing..." } }
// More chunks... but is this still the same message or a new one?
{ "sessionUpdate": "agent\_message\_chunk", "content": { "type": "text", "text": "Found issues." } }
// Tool call happens
{ "sessionUpdate": "tool\_call", ... }
// Another agent message - definitely a new message
{ "sessionUpdate": "agent\_message\_chunk", "content": { "type": "text", "text": "Fixed the issues." } }
`
```
##
[​
](#what-we-propose-to-do-about-it)
What we propose to do about it
Add a `messageId` field to `AgentMessageChunk`, `UserMessageChunk`, `AgentThoughtChunk` session updates and `PromptRequest`, and a `userMessageId` field to `PromptResponse`. These fields would:
1. **Provide stable message identification** - Each message gets a unique identifier that remains constant across all chunks of that message.
2. **Enable reliable message boundary detection** - Clients can definitively determine when a new message starts by observing a change in `messageId`.
3. **Create an extension point for future features** - Message IDs can be referenced in future protocol enhancements.
###
[​
](#proposed-structure)
Proposed Structure
When the Client sends a user message via `session/prompt`, it can optionally include a `messageId`:
```
`{
"jsonrpc": "2.0",
"id": 2,
"method": "session/prompt",
"params": {
"sessionId": "sess\_abc123def456",
"messageId": "4c12d49b-729c-4086-bfed-5b82e9a53400",
"prompt": [
{
"type": "text",
"text": "Can you analyze this code?"
}
]
}
}
`
```
The Agent echoes this as `userMessageId` in the response (or assigns one if the client didn’t provide it):
```
`{
"jsonrpc": "2.0",
"id": 2,
"result": {
"userMessageId": "4c12d49b-729c-4086-bfed-5b82e9a53400",
"stopReason": "end\_turn"
}
}
`
```
For agent message chunks, the Agent generates and includes a `messageId`:
```
`{
"jsonrpc": "2.0",
"method": "session/update",
"params": {
"sessionId": "sess\_abc123def456",
"update": {
"sessionUpdate": "agent\_message\_chunk",
"messageId": "ea87d0e7-beb8-484a-a404-94a30b78a5a8",
"content": {
"type": "text",
"text": "Let me analyze your code..."
}
}
}
}
`
```
If the Agent sends `user\_message\_chunk` updates (e.g., during `session/load`), it uses the user message ID:
```
`{
"jsonrpc": "2.0",
"method": "session/update",
"params": {
"sessionId": "sess\_abc123def456",
"update": {
"sessionUpdate": "user\_message\_chunk",
"messageId": "4c12d49b-729c-4086-bfed-5b82e9a53400",
"content": {
"type": "text",
"text": "Can you..."
}
}
}
}
`
```
The `messageId` field would be:
* **Optional** on `agent\_message\_chunk`, `user\_message\_chunk`, `agent\_thought\_chunk` updates and `session/prompt` requests (as `messageId`)
* **Optional** in `session/prompt` responses (as `userMessageId`)
* **UUID format** - Both clients and agents MUST use UUID format to ensure collision avoidance
* **Unique per message** within a session
* **Stable across chunks** - all chunks belonging to the same message share the same `messageId`
* **Opaque** - Implementations treat it as an identifier without parsing its structure
* **Dual-origin** - Clients generate IDs for user messages, agents generate IDs for agent messages
###
[​
](#message-id-acknowledgment)
Message ID Acknowledgment
When a Client includes `messageId` in a `session/prompt` request, the Agent’s response behavior indicates whether message IDs are supported:
* **If the Agent supports message IDs** and records the client-provided ID, it MUST include `userMessageId` in the response with the same value.
* **If the Agent assigns its own ID** (when the client didn’t provide one), it SHOULD include `userMessageId` in the response so the client knows the assigned ID.
* **If the Agent does not support message IDs** or chooses not to record it, it MUST omit `userMessageId` from the response.
Clients MUST interpret the absence of `userMessageId` in the response as confirmation that the message ID was **not recorded**. Clients SHOULD NOT rely on that ID for subsequent operations (e.g., message editing, truncation, or forking) when `userMessageId` is absent.
This creates predictable behavior: the presence of `userMessageId` in the response is an explicit acknowledgment that the Agent recorded the ID and will recognize it in future operations.
##
[​
](#shiny-future)
Shiny future
Once this feature exists:
1. **Clear message boundaries** - Clients can reliably render distinct message bubbles in the UI, even when multiple messages of the same type are sent consecutively.
2. **Better streaming UX** - Clients know exactly which message element to append chunks to, enabling smoother visual updates.
3. **Foundation for editing** - With stable message identifiers, future protocol versions could add:
* `message/edit` - Agent updates the content of a previously sent message
* `message/delete` - Agent removes a message from the conversation
* `message/replace` - Agent replaces an entire message with new content
* **Message metadata** - Future capabilities could reference messages by ID:
* Annotations or reactions to specific messages
* Citation or cross-reference between messages
* Tool calls that reference which message triggered them
* **Enhanced debugging** - Implementations can trace message flow more easily with explicit IDs in logs and debugging tools.
Example future editing capability:
```
`{
"jsonrpc": "2.0",
"method": "session/update",
"params": {
"sessionId": "sess\_abc123def456",
"update": {
"sessionUpdate": "message\_update",
"messageId": "ea87d0e7-beb8-484a-a404-94a30b78a5a8",
"updateType": "replace",
"content": {
"type": "text",
"text": "Actually, let me correct that analysis..."
}
}
}
}
`
```
##
[​
](#implementation-details-and-plan)
Implementation details and plan
###
[​
](#phase-1-core-protocol-changes)
Phase 1: Core Protocol Changes
1. **Update schema** (`schema/schema.json`):
* Add optional `messageId` field (type: `string`) to `ContentChunk` (used by `AgentMessageChunk`, `UserMessageChunk`, `AgentThoughtChunk`)
* Add optional `messageId` field (type: `string`) to `PromptRequest` (client-provided)
* Add optional `userMessageId` field (type: `string`) to `PromptResponse` (echoed or agent-assigned)
* **Update Rust SDK** (`rust/client.rs` and `rust/agent.rs`):
* Add `message\_id: Option\<String\>` field to `ContentChunk` struct
* Add `message\_id: Option\<String\>` field to `PromptRequest` struct
* Add `user\_message\_id: Option\<String\>` field to `PromptResponse` struct
* Update serialization to include `messageId`/`userMessageId` in JSON output when present
* **Update TypeScript SDK** (if applicable):
* Add `messageId` field to corresponding types
* **Update documentation** (`docs/protocol/prompt-turn.mdx`):
* Document the `messageId` and `userMessageId` fields and their semantics
* Clarify that clients can provide `messageId` for user messages in prompt requests
* Clarify that agents echo the ID as `userMessageId` in prompt responses
* Clarify that agents generate `messageId` for agent messages in chunks
* Add examples showing message boundaries
* Explain that `messageId` changes indicate new messages
###
[​
](#phase-2-reference-implementation)
Phase 2: Reference Implementation
1. **Update example agents**:
* Modify example agents to generate and include `messageId` in chunks
* Use simple ID generation (e.g., incrementing counter, UUID)
* Demonstrate consistent IDs across chunks of the same message
* **Update example clients**:
* Update clients to consume `messageId` field
* Use IDs to properly group chunks into messages
* Demonstrate clear message boundary rendering
###
[​
](#backward-compatibility)
Backward Compatibility
The `messageId` field is **optional** to ensure this is a non-breaking change. Agents SHOULD include the `messageId` field, but it is not required for v1 compatibility. Features that rely on `messageId` (such as future message editing capabilities) will implicitly require the field to be present - Agents that don’t provide it simply won’t support those features.
Making this field required will be considered for a future v2 version of the protocol after wide adoption.
##
[​
](#frequently-asked-questions)
Frequently asked questions
###
[​
](#what-alternative-approaches-did-you-consider-and-why-did-you-settle-on-this-one)
What alternative approaches did you consider, and why did you settle on this one?
1. **Continue using `\_meta` field** - This is the current workaround but:
* Not standardized across implementations
* Doesn’t signal semantic importance
* Easy to overlook or implement inconsistently
* **Detect message boundaries heuristically** - Clients could infer boundaries from timing, content types, or session state:
* Unreliable and fragile
* Doesn’t work for all scenarios (e.g., consecutive same-type messages)
* Creates inconsistent behavior across implementations
* **Use explicit “message start/end” markers** - Wrap messages with begin/end notifications:
* More complex protocol interaction
* Requires additional notifications
* More state to track on both sides
* **Agent-only message IDs** - Have the Agent generate all IDs (including for user messages):
* Consistent with protocol patterns (`sessionId`, `terminalId`, `toolCallId`)
* But creates complexity for returning user message IDs (response comes after streaming)
* Not all agents support passing user message IDs through
* Clients may need IDs immediately for deduplication or multi-client scenarios
The proposed approach with `messageId` is:
* **Simple** - Just one new field with clear semantics
* **Flexible** - Enables future capabilities without further protocol changes
* **Practical** - Clients generate IDs for their messages, agents for theirs
* **Collision-safe** - UUID format ensures uniqueness across both sides
###
[​
](#who-generates-message-ids)
Who generates message IDs?
**Both clients and agents can generate message IDs**, each for their own messages:
* **For user messages**: The Client generates a UUID and includes it as `messageId` in the `session/prompt` request. The Agent echoes this ID as `userMessageId` in the response to confirm it was recorded. If the client doesn’t provide one, the Agent MAY assign one and return it in the response so the client knows the assigned ID.
* **For agent messages**: The Agent generates the UUID when creating its response and includes it in session update chunks.
This differs from other protocol identifiers (`sessionId`, `terminalId`, `toolCallId`) which are agent-generated, but provides practical benefits:
* **Immediate availability** - Clients have the ID as soon as they send the message, without waiting for a response
* **Deduplication** - Clients can use IDs to deduplicate messages on `session/load` or when echoing to multiple clients
* **Collision-safe** - UUID format ensures uniqueness without coordination
* **Adapter-friendly** - Adapters for agents that don’t support message IDs can simply not pass them through
###
[​
](#should-this-field-be-required-or-optional)
Should this field be required or optional?
The field is **optional** for v1 to ensure backward compatibility. Agents SHOULD include `messageId`, but it is not required. Features that depend on `messageId` (such as message editing) will implicitly require it - if an Agent doesn’t provide `messageId`, those features simply won’t be available.
Making this field required will be considered for a future v2 version of the protocol.
###
[​
](#what-format-should-message-ids-use)
What format should message IDs use?
Both clients and agents **MUST** use UUID format for message IDs. This is required because both sides can generate IDs, and UUID format ensures:
* **No collisions** - UUIDs are globally unique without coordination between client and agent
* **Interoperability** - Both sides use the same format, so either side can rely on uniqueness guarantees
* **Simplicity** - Standard libraries available in all languages
While `messageId` values are UUIDs, implementations **SHOULD** treat them as opaque strings when reading/comparing them, and not parse or interpret their internal structure.
###
[​
](#what-about-message-ids-across-session-loads)
What about message IDs across session loads?
When a session is loaded via `session/load`, the Agent may:
* Preserve original message IDs if replaying the conversation history
* Generate new message IDs if only exposing current state
The protocol doesn’t require message IDs to be stable across session loads, though Agents MAY choose to make them stable if their implementation supports it.
###
[​
](#does-this-apply-to-other-session-updates-like-tool-calls-or-plan-updates)
Does this apply to other session updates like tool calls or plan updates?
This RFD addresses `agent\_message\_chunk`, `user\_message\_chunk`, and `agent\_thought\_chunk` updates.
Other session update types (like `tool\_call`, `plan`) already have their own identification mechanisms:
* Tool calls use `toolCallId`
* Plan entries can be tracked by their position in the `entries` array
Future RFDs may propose extending `messageId` to other update types if use cases emerge.
##
[​
](#revision-history)
Revision history
* **2026-02-17**: Added “Message ID Acknowledgment” section to clarify that presence/absence of `userMessageId` in response indicates whether the Agent recorded the ID; clarified that UUID format is MUST (not SHOULD) since both sides generate IDs; renamed response field to `userMessageId` for clarity (request keeps `messageId`)
* **2026-01-29**: Updated to allow both clients and agents to generate message IDs using UUID format
* **2025-11-09**: Initial draft