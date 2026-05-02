Agent Extensions via ACP Proxies - Agent Client Protocol
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
Author(s): [nikomatsakis](https://github.com/nikomatsakis)
##
[​
](#elevator-pitch)
Elevator pitch
>
> What are you proposing to change?
>
Enable a universal agent extension mechanism via ACP proxies, components that sit between a client and an agent. Proxies can intercept and transform messages, enabling composable architectures where techniques like context injection, tool coordination, and response filtering can be extracted into reusable components.
##
[​
](#status-quo)
Status quo
>
> How do things work today and what problems does this cause? Why would we change things?
>
The AI agent ecosystem has developed many extension mechanisms: AGENTS.md files, Claude Code plugins, rules files, hooks, MCP servers, etc. Of these, only MCP servers have achieved real standardization across the ecosystem.
However, MCP servers are fundamentally limited because they sit “behind” the agent. They can provide tools and respond to function calls, but they cannot:
* **Inject or modify prompts** before they reach the agent
* **Add global context** that persists across conversations
* **Transform responses** before they reach the user
* **Coordinate between multiple agents** or manage conversation flow
As a result, valuable techniques like context management and response processing remain locked within individual agent implementations, with no way to extract and reuse them across different agents.
##
[​
](#what-we-propose-to-do-about-it)
What we propose to do about it
>
> What are you proposing to improve the situation?
>
We propose implementing *agent extensions* via ACP *proxies*, a new kind of component that sits between the client and the agent, forwarding (and potentially altering or introducing) messages. Because proxies can do anything a client could do, they serve as a universal extension mechanism that can subsume AGENTS.md, hooks, MCP servers, etc.
Proxies are limited to the customizations exposed by ACP itself, so they would benefit from future ACP extensions like mechanisms to customize system prompts. However, they can already handle the majority of common extension use cases through message interception and transformation.
###
[​
](#proxying-in-theory)
Proxying in theory
Conceptually, proxies work like a chain where messages flow through each component:
###
[​
](#proxying-in-practice-the-role-of-the-conductor)
Proxying in practice: the role of the conductor
To allow for proxy isolation, our design does not have proxies communicate directly with their successor in the chain. Instead, there is a central *conductor* component that orchestrates messages moving between components.
We add one ACP method for proxy communication:
* **`proxy/successor`**: Used bidirectionally - proxies send it to forward messages to their successor, and the conductor sends it to deliver messages from the successor back to the proxy
Here’s how a single message flows through the system:
##
[​
](#shiny-future)
Shiny future
>
> How will things play out once this feature exists?
>
###
[​
](#user-experience-and-editor-integration)
User experience and editor integration
We expect editors to expose the ability to install proxies in the same way they currently support adding MCP servers - in fact, the distinction probably doesn’t matter to users. Both are “extensions” that add capabilities to their AI workflow.
When proxies are installed, editors would not start the agent directly, but instead invoke the conductor with the configured proxy chain. From the user’s perspective, they’re just getting enhanced agent capabilities - the proxy chain architecture remains transparent.
###
[​
](#language-specific-proxy-ecosystems)
Language-specific proxy ecosystems
The monolithic nature of agent development has meant that most of the “action” happens within agents. We wish to invert this, with agents trending towards simple agentic loops, and the creativity being pushed outwards into the broader ecosystem.
The Symposium project is one example exploring this concept, with a focus on Rust. The idea is to give Rust users an automatic set of extensions based on the dependencies they are using. These extensions would be packaged up as SACP proxies using WebAssembly for portability and sandboxing.
Symposium aims to become the standard “Rust ACP experience” by providing both core Rust tooling and a framework for Rust libraries to contribute their own proxy components.
###
[​
](#standardized-ide-capabilities)
Standardized IDE capabilities
Proxy infrastructure could also enable editors to expose standardized IDE capabilities (diagnostics, file system access, terminal APIs) to agents via MCP servers provided by proxies. This keeps the core ACP protocol focused on agent communication while allowing rich IDE integration through the proxy layer.
##
[​
](#implementation-details-and-plan)
Implementation details and plan
>
> Tell me more about your implementation. What is your detailed implementation plan?
>
###
[​
](#component-roles)
Component roles
Each ACP proxy chain forms a sequence of components:
The **client** and **agent** are *terminal* roles - the client has only a successor (no predecessor), and the agent has only a predecessor (no successor). Proxies are *non-terminal* - they have both a predecessor and a successor, forwarding messages between them.
The **conductor** is a special component that orchestrates proxy chains. It spawns and manages proxy components, routes messages between them, and handles initialization. From the client’s perspective, the conductor appears to be an ordinary agent:
We provide a canonical conductor implementation in Rust (`sacp-conductor`). Most editors would use this conductor directly to host proxies and agents, though they could also reimplement conductor functionality if needed.
ACP defines client and agent as superroles, each with two specializations:
**Example Architecture:**
###
[​
](#proxy-initialization-protocol)
Proxy initialization protocol
Components discover their role from the initialization method they receive:
* **Proxies** receive `proxy/initialize` - they have a successor and should forward messages
* **Agents** receive `initialize` - they are terminal (no successor) and process messages directly
The `proxy/initialize` request has the same parameters as `initialize` and expects a standard `InitializeResponse`. The only difference is the method name, which signals to the component that it should operate as a proxy.
**Conductor behavior:**
* The conductor MUST send `proxy/initialize` to all proxy components
* The conductor MUST send `initialize` to the final agent component (if any)
* When a proxy forwards an `initialize` via `proxy/successor`, the conductor determines whether the successor is another proxy or the agent, and sends `proxy/initialize` or `initialize` respectively.
**Proxy behavior:**
* A proxy that receives `proxy/initialize` knows it has a successor
* The proxy SHOULD forward requests it does not understand
* The proxy SHOULD preserve metadata fields when forwarding messages
Note: A conductor can be configured to run in either terminal mode (expecting `initialize`) or proxy mode (expecting `proxy/initialize`), enabling nested proxy chains.
###
[​
](#mcp-over-acp-support)
MCP-over-ACP support
Proxies that provide MCP servers use the [MCP-over-ACP transport](./mcp-over-acp) mechanism. The conductor always advertises `mcpCapabilities.acp: true` to proxies and handles bridging for agents that don’t support native ACP transport.
All proxies MUST respond to `proxy/initialize` with the MCP-over-ACP capability enabled. When the conductor sends `proxy/initialize`, proxies should be prepared to handle `mcp/connect`, `mcp/message`, and `mcp/disconnect` messages for any MCP servers they provide.
###
[​
](#message-reference)
Message reference
**Initialization:**
```
`// Conductor initializes a proxy (proxy knows it has a successor)
{"method": "proxy/initialize", "params": \<INITIALIZE\_REQUEST\_PARAMS\>}
// Conductor initializes the agent (standard ACP)
{"method": "initialize", "params": \<INITIALIZE\_REQUEST\_PARAMS\>}
`
```
Both methods use the same parameters as the standard ACP `InitializeRequest` and expect a standard `InitializeResponse`.
**Proxy messages:**
```
`// Proxy sends message to successor, or conductor delivers message from successor
// (same method, direction determined by sender)
{
"method": "proxy/successor",
"params": {
"method": "\<INNER\_METHOD\>",
"params": \<INNER\_PARAMS\>,
"meta": { ... } // optional metadata
}
}
`
```
The inner message fields (`method`, `params`) are flattened into the params object. Whether the wrapped message is a request or notification is determined by the presence of an `id` field in the outer JSON-RPC envelope, following JSON-RPC conventions.
###
[​
](#examples-non-normative)
Examples (non-normative)
The following sequence diagrams illustrate common proxy chain scenarios for implementers.
####
[​
](#initialization-of-a-4-component-proxy-chain)
Initialization of a 4-component proxy chain
This shows the initialization flow for: Terminal Client → Conductor → Context Proxy → Tool Filter Proxy → Terminal Agent
####
[​
](#context-providing-proxy-with-session-notifications)
Context-providing proxy with session notifications
This example shows how a proxy can handle initialization and forward session notifications. Sparkle (a collaborative AI framework) runs an embodiment sequence during session creation.
This demonstrates how proxies can run initialization sequences during session creation while transparently forwarding all session notifications back to the client.
##
[​
](#frequently-asked-questions)
Frequently asked questions
>
> What questions have arisen over the course of authoring this document or during subsequent discussions?
>
###
[​
](#why-use-a-separate-proxy/initialize-method-instead-of-a-capability)
Why use a separate `proxy/initialize` method instead of a capability?
Earlier designs used a `"proxy": true` capability in the `InitializeRequest` and required proxies to echo it back in the response. This felt awkward because it wasn’t really a capability negotiation - it was more of a “you must operate as a proxy” directive.
Using a distinct method makes the contract clearer: if you receive `proxy/initialize`, you’re a proxy with a successor; if you receive `initialize`, you’re the terminal agent. There’s no capability dance, no risk of misconfiguration, and components know their role immediately from the method name.
###
[​
](#how-do-proxies-subsume-existing-agent-extension-mechanisms)
How do proxies subsume existing agent extension mechanisms?
Because proxies sit between the client and agent, they can replicate the functionality of existing extension mechanisms:
* **AGENTS.md files**: Proxies can inject context and instructions into prompts before they reach the agent
* **Claude Code plugins/skills**: Proxies can add contextual data for available skills and provide MCP resources with detailed skill instructions that are provided on-demand when requested by the agent
* **MCP servers**: Proxies can provide tools via [MCP-over-ACP](./mcp-over-acp) and handle tool callbacks
* **Subagents**: Proxies can create “subagents” by initiating new sessions and coordinating between multiple agent instances
* **Hooks and steering files**: Proxies can modify conversation flow by intercepting requests and responses
* **System prompt customization**: Proxies can switch between predefined session modes or prepend system messages to prompts
The key advantage is that proxy-based extensions work with any ACP-compatible agent without requiring agent-specific integration or modification.
###
[​
](#how-do-proxies-work-with-mcp-servers)
How do proxies work with MCP servers?
Proxies can provide MCP servers via [MCP-over-ACP transport](./mcp-over-acp), enabling a single proxy to add context, provide tools, and handle callbacks with full awareness of the conversation state.
The conductor always advertises `mcpCapabilities.acp: true` to proxies, regardless of whether the downstream agent supports it natively. When the agent doesn’t support ACP transport, the conductor handles bridging transparently - spawning stdio shims or HTTP servers that the agent connects to normally, then relaying messages to/from the proxy’s ACP channel.
This means proxy authors don’t need to worry about agent compatibility - they implement MCP-over-ACP, and the conductor handles the rest.
###
[​
](#are-there-any-limitations-to-what-proxies-can-do)
Are there any limitations to what proxies can do?
Yes, proxies are limited to what is available through the ACP protocol itself. They can intercept and transform any ACP message, but they cannot access capabilities that ACP doesn’t expose.
For example, proxies cannot directly modify an agent’s system prompt or context window - they can only switch between predefined session modes (which may affect system prompts) or prepend additional messages to prompts. Similarly, proxies cannot access internal agent state, model parameters, or other implementation details that aren’t exposed through ACP messages.
This is actually a feature - it ensures that proxy-based extensions remain portable across different agent implementations and don’t rely on agent-specific internals.
###
[​
](#why-not-just-cascade-acp-commands-without-protocol-changes)
Why not just cascade ACP commands without protocol changes?
One alternative is to make proxies be ordinary agents that internally create and manage their successors. This works (HTTP proxies operate this way) but requires each proxy to understand the full chain and know how to start its successors.
This couples proxies to transport mechanisms, process management, and chain configuration. Changing transports, reordering the chain, or inserting a new proxy requires modifying predecessor configurations.
The conductor design decouples proxies from their successors. Proxies send messages “to successor” and receive messages “from successor” without knowing who that successor is, how it’s started, or what transport it uses. This enables:
* Changing transport protocols or process management without recompiling proxies
* Shipping proxies as low-capability WASM containers that need only a single communication channel
* Reordering, adding, or removing proxies through configuration rather than code changes
The tradeoff is protocol complexity, but this complexity lives in the conductor (implemented once) rather than being duplicated across proxy implementations.
###
[​
](#why-do-all-messages-go-through-the-conductor-instead-of-direct-proxy-to-proxy-communication)
Why do all messages go through the conductor instead of direct proxy-to-proxy communication?
Even with a conductor, proxies could communicate directly with their successors after the conductor sets up connections. Routing all messages through the conductor further minimizes proxy responsibilities to a single communication channel.
This supports running proxies as isolated WebAssembly components with minimal capabilities. It also removes redundant logic: without the conductor routing messages, each proxy would need to manage connections to its successor.
The conductor handles process management, capability negotiation, and message routing, allowing proxies to focus on transformation logic.
###
[​
](#how-does-the-standard-conductor-implementation-work)
How does the standard conductor implementation work?
The `sacp-conductor` reference implementation can form trees of proxy chains. It can be configured to run in proxy mode (expecting `proxy/initialize`) or terminal mode (expecting `initialize`). When the last proxy in its managed chain sends a message to its successor, the conductor forwards that message to its own parent conductor (if in proxy mode) or to the final agent (if in terminal mode).
This enables hierarchical structures like:
```
`client → conductor1 → final-agent
↓ manages
proxy-a → conductor2 → proxy-d
↓ manages
proxy-b → proxy-c
`
```
The conductor handles process management, capability negotiation, and message routing, but these are implementation details - the protocol only specifies the message formats and capability requirements.
###
[​
](#what-about-security-concerns-with-proxy-chains)
What about security concerns with proxy chains?
Proxy components can intercept and modify all communication, so trust is essential - similar to installing any software. Users are responsible for the components they choose to run.
We plan to explore WebAssembly-based proxies which will offer some measure of sandboxing but such components could still modify prompts in unknown or malicious ways.
###
[​
](#what-about-performance-implications-of-the-proxy-chain)
What about performance implications of the proxy chain?
Our architecture does introduce additional message passing - each proxy in the chain adds extra hops as messages flow through the conductor. However, these messages are typically small and inexpensive, particularly when compared to the latency of actual LLM inference.
For messages that contain significant quantities of data (large file contents, extensive context), we may wish to have the conductor store that data centrally and introduce a “reference” mechanism so that most proxies don’t have to inspect or copy large payloads unless they specifically need to transform them.
The benefits of composability typically outweigh the minimal latency costs for human-paced development interactions.
###
[​
](#what-happens-when-proxy-components-crash-or-misbehave)
What happens when proxy components crash or misbehave?
The conductor manages component lifecycles:
* Failed components are restarted automatically where possible
* Component crashes don’t affect the rest of the chain
* Graceful degradation by bypassing failed components
* Clear error reporting to help users debug configuration issues
###
[​
](#can-proxy-chains-be-nested-or-form-trees)
Can proxy chains be nested or form trees?
Yes! The conductor can itself run in proxy mode, enabling hierarchical structures:
```
`client → proxy1 → conductor (proxy mode) → final-agent
↓ manages
p1 → p2 → p3
`
```
This enables complex compositions while maintaining clean interfaces.
###
[​
](#how-could-proxy-chains-support-multi-agent-scenarios-in-the-future)
How could proxy chains support multi-agent scenarios in the future?
The current design assumes a linear chain where each proxy has a single successor. To support M:N topologies where a proxy communicates with multiple peers (e.g., a research coordinator dispatching to multiple specialized agents), we could extend `proxy/successor` with an optional `peer` field:
```
`{
"method": "proxy/successor",
"params": {
"method": "prompt",
"params": { ... },
"peer": "research-agent"
}
}
`
```
When `peer` is omitted, the message goes to the default successor (backwards compatible with the current linear chain model). When present, it specifies which peer the message is intended for. The `proxy/initialize` response could be extended to enumerate available peers, enabling proxies to discover and coordinate between multiple downstream components.
###
[​
](#what’s-the-current-implementation-status)
What’s the current implementation status?
A prototype version of this proposal has been implemented and is available on crates.io as the crates:
* `sacp` — base ACP protocol SDK
* `sacp-tokio` — adds specific utilities for use with the `tokio` runtime
* `sacp-proxy` — extensions for implementing a proxy
* `sacp-rmcp` — adds specific proxy extension traits for bridging to the rmcp crate
* `sacp-conductor` — reference conductor implementation
The canonical sources for those crates is currently the [symposium-dev/symposium-acp] repository. However, copies have been upstreamed to the [agentclientprotocol/rust-sdk](https://github.com/agentclientprotocol/rust-sdk/tree/main/src/sacp-conductor) repository and, if and when this RFD is accepted, that will become the canonical home.
##
[​
](#revision-history)
Revision history
* Initial draft based on working implementation in symposium-acp repository.
* Split MCP-over-ACP transport into [separate RFD](./mcp-over-acp) to enable independent use by any ACP component.