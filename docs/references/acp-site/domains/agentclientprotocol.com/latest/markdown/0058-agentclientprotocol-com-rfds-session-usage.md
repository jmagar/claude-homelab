Session Usage and Context Status - Agent Client Protocol
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
>
> What are you proposing to change?
>
Add standardized usage and context window tracking to the Agent Client Protocol, enabling agents to report token consumption, cost estimates, and context window utilization in a consistent way across implementations.
##
[​
](#status-quo)
Status quo
>
> How do things work today and what problems does this cause? Why would we change things?
>
Currently, the ACP protocol has no standardized way for agents to communicate:
1. **Token usage** - How many tokens were consumed in a turn or cumulatively
2. **Context window status** - How much of the model’s context window is being used
3. **Cost information** - Estimated costs for API usage
4. **Prompt caching metrics** - Cache hits/misses for models that support caching
This creates several problems:
* **No visibility into resource consumption** - Clients can’t show users how much of their context budget is being used
* **No cost transparency** - Users can’t track spending or estimate costs before operations
* **No context management** - Clients can’t warn users when approaching context limits or suggest compaction
* **Inconsistent implementations** - Each agent implements usage tracking differently (if at all)
Industry research shows common patterns across AI coding tools:
* LLM providers return cumulative token counts in API responses
* IDE extensions display context percentage prominently (e.g., radial progress showing “19%”)
* Clients show absolute numbers on hover/detail (e.g., “31.4K of 200K tokens”)
* Tools warn users at threshold percentages (75%, 90%, 95%)
* Auto-compaction features trigger when approaching context limits
* Cost tracking focuses on cumulative session totals rather than per-turn breakdowns
##
[​
](#what-we-propose-to-do-about-it)
What we propose to do about it
>
> What are you proposing to improve the situation?
>
We propose separating usage tracking into two distinct concerns:
1. **Token usage** - Reported in `PromptResponse` after each turn (per-turn data)
2. **Context window and cost** - Reported via `session/update` notifications with `sessionUpdate: "usage\_update"` (session state)
This separation reflects how users consume this information:
* Token counts are tied to specific turns and useful immediately after a prompt
* Context window and cost are cumulative session state that agents push proactively when available
Agents send context updates at appropriate times:
* On `session/new` response (if agent can query usage immediately)
* On `session/load` / `session/resume` (for resumed/forked sessions)
* After each `session/prompt` response (when usage data becomes available)
* Anytime context window state changes significantly
This approach provides flexibility for different agent implementations:
* Agents that support getting current usage without a prompt can immediately send updates when creating, resuming, or forking chats
* Agents that only provide usage when actively prompting can send updates after sending a new prompt
###
[​
](#token-usage-in-promptresponse)
Token Usage in `PromptResponse`
Add a `usage` field to `PromptResponse` for token consumption tracking:
```
`{
"jsonrpc": "2.0",
"id": 1,
"result": {
"sessionId": "sess\_abc123",
"stopReason": "end\_turn",
"usage": {
"total\_tokens": 53000,
"input\_tokens": 35000,
"output\_tokens": 12000,
"thought\_tokens": 5000,
"cached\_read\_tokens": 5000,
"cached\_write\_tokens": 1000
}
}
}
`
```
####
[​
](#usage-fields)
Usage Fields
* `total\_tokens` (number, required) - Sum of all token types across session
* `input\_tokens` (number, required) - Total input tokens across all turns
* `output\_tokens` (number, required) - Total output tokens across all turns
* `thought\_tokens` (number, optional) - Total thought/reasoning tokens
* `cached\_read\_tokens` (number, optional) - Total cache read tokens
* `cached\_write\_tokens` (number, optional) - Total cache write tokens
###
[​
](#context-window-and-cost-via-session/update)
Context Window and Cost via `session/update`
Agents send context window and cost information via `session/update` notifications with `sessionUpdate: "usage\_update"`:
```
`{
"jsonrpc": "2.0",
"method": "session/update",
"params": {
"sessionId": "sess\_abc123",
"update": {
"sessionUpdate": "usage\_update",
"used": 53000,
"size": 200000
}
}
}
`
```
####
[​
](#context-window-fields-required)
Context Window Fields (required)
* `used` (number, required) - Tokens currently in context
* `size` (number, required) - Total context window size in tokens
Note: Clients can compute `remaining` as `size - used` and `percentage` as `used / size \* 100` if needed.
####
[​
](#cost-fields-optional)
Cost Fields (optional)
* `cost` (object, optional) - Cumulative session cost
* `amount` (number, required) - Total cumulative cost for session
* `currency` (string, required) - ISO 4217 currency code (e.g., “USD”, “EUR”)
Example with optional cost:
```
`{
"jsonrpc": "2.0",
"method": "session/update",
"params": {
"sessionId": "sess\_abc123",
"update": {
"sessionUpdate": "usage\_update",
"used": 53000,
"size": 200000,
"cost": {
"amount": 0.045,
"currency": "USD"
}
}
}
}
`
```
###
[​
](#design-principles)
Design Principles
1. **Separation of concerns** - Token usage is per-turn data, context window and cost are session state
2. **Agent-pushed notifications** - Agents proactively send context updates when data becomes available, following the same pattern as other dynamic session properties (`available\_commands\_update`, `current\_mode\_update`, `session\_info\_update`)
3. **Agent calculates, client can verify** - Agent knows its model best and provides calculations, but includes raw data for client verification
4. **Flexible cost reporting** - Cost is optional since not all agents track it. Support any currency, don’t assume USD
5. **Prompt caching support** - Include cache read/write tokens for models that support it
6. **Optional but recommended** - Usage tracking is optional to maintain backward compatibility
7. **Flexible timing** - Agents send updates when they can: immediately for agents with on-demand APIs, or after prompts for agents that only provide usage during active prompting
##
[​
](#shiny-future)
Shiny future
>
> How will things will play out once this feature exists?
>
**For Users:**
* **Visibility**: Users see real-time context window usage with percentage indicators
* **Cost awareness**: Users can track spending and check cumulative cost at any time
* **Better planning**: Users know when to start new sessions or compact context
* **Transparency**: Clear understanding of resource consumption
**For Client Implementations:**
* **Consistent UI**: All clients can show usage in a standard way (progress bars, percentages, warnings)
* **Smart warnings**: Clients can warn users at 75%, 90% context usage
* **Cost controls**: Clients can implement budget limits and alerts
* **Analytics**: Clients can track usage patterns and optimize
* **Reactive updates**: Clients receive context updates reactively via notifications, updating UI immediately when agents push new data
* **No polling needed**: Updates arrive automatically when agents have new information, eliminating the need for clients to poll
**For Agent Implementations:**
* **Standard reporting**: Clear contract for what to report and when
* **Flexibility**: Optional fields allow agents to report what they can calculate
* **Model diversity**: Works with any model (GPT, Claude, Llama, etc.)
* **Caching support**: First-class support for prompt caching
##
[​
](#implementation-details-and-plan)
Implementation details and plan
>
> Tell me more about your implementation. What is your detailed implementation plan?
>
1. **Update schema.json** to add:
* `Usage` type with token fields
* `Cost` type with `amount` and `currency` fields
* `ContextUpdate` type with `used`, `size` (required) and optional `cost` field
* Add optional `usage` field to `PromptResponse`
* Add `UsageUpdate` variant to `SessionUpdate` oneOf array (with `sessionUpdate: "usage\_update"`)
* **Update protocol documentation**:
* Document `usage` field in `/docs/protocol/prompt-turn.mdx`
* Document `session/update` notification with `sessionUpdate: "usage\_update"` variant
* Add examples showing typical usage patterns and when agents send context updates
##
[​
](#frequently-asked-questions)
Frequently asked questions
>
> What questions have arisen over the course of authoring this document or during subsequent discussions?
>
###
[​
](#why-separate-token-usage-from-context-window-and-cost)
Why separate token usage from context window and cost?
Different users care about different things at different times:
* **Token counts**: Relevant immediately after a turn completes to understand the breakdown
* **Context window remaining**: Relevant at any time, especially before issuing a large prompt. “Do I need to handoff or compact?”
* **Cumulative cost**: Session-level state that agents push when available
Separating them allows:
* Cleaner data model where per-turn data stays in turn responses
* Agents to push context updates proactively when data becomes available
* Clients to receive updates reactively without needing to poll
###
[​
](#why-is-cost-in-session/update-instead-of-promptresponse)
Why is cost in session/update instead of PromptResponse?
Cost is cumulative session state, similar to context window:
* Users want to track total spending, not just per-turn costs
* Keeps `PromptResponse` focused on per-turn token breakdown
* Both cost and context window are session-level metrics that belong together
* Cost is optional since not all agents track it
###
[​
](#how-do-users-know-when-to-handoff-or-compact-the-context)
How do users know when to handoff or compact the context?
The context update notification provides everything needed:
* `used` and `size` give absolute numbers for precise tracking
* Clients can compute `remaining` as `size - used` and `percentage` as `used / size \* 100`
* `size` lets clients understand the total budget
**Recommended client behavior:**
|Percentage|Action|
|\< 75%|Normal operation|
|75-90%|Yellow indicator, suggest “Context filling up”|
|90-95%|Orange indicator, recommend “Start new session or summarize”|
|\> 95%|Red indicator, warn “Next prompt may fail - handoff recommended”|
Clients can also:
* Offer “Compact context” or “Summarize conversation” actions
* Auto-suggest starting a new session
* Implement automatic handoff when approaching limits
###
[​
](#why-not-assume-usd-for-cost)
Why not assume USD for cost?
Agents may bill in different currencies:
* European agents might bill in EUR
* Asian agents might bill in JPY or CNY
* Some agents might use credits or points
* Currency conversion rates change
Better to report actual billing currency and let clients convert if needed.
###
[​
](#what-if-the-agent-can’t-calculate-some-fields)
What if the agent can’t calculate some fields?
All fields except the basic token counts are optional. Agents report what they can calculate. Clients handle missing fields gracefully.
###
[​
](#how-does-this-work-with-streaming-responses)
How does this work with streaming responses?
* During streaming: Agents may send progressive context updates via `session/update` notifications as usage changes
* Final response: Include complete token usage in `PromptResponse`
* Context window and cost: Agents send `session/update` notifications with `sessionUpdate: "usage\_update"` when data becomes available (after prompt completion, on session creation/resume, or when context state changes significantly)
###
[​
](#what-about-models-without-fixed-context-windows)
What about models without fixed context windows?
* Report effective context window size
* For models with dynamic windows, report current limit
* Update size if it changes
* Set to `null` if truly unlimited (rare)
###
[​
](#what-about-rate-limits-and-quotas)
What about rate limits and quotas?
This RFD focuses on token usage and context windows. Rate limits and quotas are a separate concern that could be addressed in a future RFD. However, the cost tracking here helps users understand their usage against quota limits.
###
[​
](#should-cached-tokens-count-toward-context-window)
Should cached tokens count toward context window?
Yes, cached tokens still occupy context window space. They’re just cheaper to process. The context window usage should include all tokens (regular + cached).
###
[​
](#why-notification-instead-of-request)
Why notification instead of request?
Using `session/update` notifications instead of a `session/status` request provides several benefits:
1. **Consistency**: Follows the same pattern as other dynamic session properties (`available\_commands\_update`, `current\_mode\_update`, `session\_info\_update`)
2. **Agent flexibility**: Agents can send updates when they have data available, whether that’s immediately (for agents with on-demand APIs) or after prompts (for agents that only provide usage during active prompting)
3. **No polling**: Clients receive updates reactively without needing to poll
4. **Real-time updates**: Updates flow naturally as part of the session lifecycle
###
[​
](#what-if-the-client-connects-mid-session)
What if the client connects mid-session?
When a client connects to an existing session (via `session/load` or `session/resume`), agents **SHOULD** send a context update notification if they have current usage data available. This ensures the client UI can immediately display accurate context window and cost information.
For agents that only provide usage during active prompting, the client UI may not show usage until after the first prompt is sent, which is acceptable given the agent’s capabilities.
###
[​
](#what-alternative-approaches-did-you-consider-and-why-did-you-settle-on-this-one)
What alternative approaches did you consider, and why did you settle on this one?
**Alternatives considered:**
1. **Everything in PromptResponse** - Simpler, but context window and cost are session state that users may want to track independently of turns.
2. **Request/response (`session/status`)** - Requires clients to poll, and some agents don’t have APIs to query current status without a prompt. The notification approach is more flexible and consistent with other dynamic session properties.
3. **Client calculates everything** - Rejected because client doesn’t know model’s tokenizer, exact context window size, or pricing.
4. **Only percentage, no raw tokens** - Rejected because users want absolute numbers, clients can’t verify calculations, and it’s less transparent.
##
[​
](#revision-history)
Revision history
* 2025-12-07: Initial draft
* 2025-12-13: Changed from `session/status` request method to `session/update` notification with `sessionUpdate: "context\_update"`. Made `cost` optional and removed `remaining` field (clients can compute as `size - used`). This approach provides more flexibility for agents and follows the same pattern as other dynamic session properties.
* 2025-12-17: Renamed `reasoning\_tokens` to `thought\_tokens` for consistency with ACP terminology. Removed `percentage` field (clients can compute as `used / size \* 100`).
* 2025-12-19: Renamed `sessionUpdate: "context\_update"` to `sessionUpdate: "usage\_update"` to better reflect the payload semantics (includes both context window info and cumulative cost).