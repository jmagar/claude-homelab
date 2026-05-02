Triggers and Events Charter - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
##
[​
](#group-type)
Group Type
**Working Group**
##
[​
](#mission-statement)
Mission Statement
The Triggers and Events Working Group exists to define how MCP servers proactively notify clients of state changes. Today, clients learn about server-side updates by polling or holding an SSE connection open. This WG will specify a standardized callback mechanism—webhooks or similar—that lets servers push notifications when new data is available, with defined ordering guarantees that hold across all transports.
##
[​
](#scope)
Scope
###
[​
](#in-scope)
In Scope
* **Specification Work**: SEPs defining the trigger/callback mechanism, subscription lifecycle, delivery semantics, and event ordering guarantees.
* **Reference Implementations**: SDK components demonstrating server-initiated notifications and client-side callback handling.
* **Cross-Cutting Concerns**: Coordination with the Transports WG on transport-specific delivery behavior, and with the Agents WG where task completion notifications intersect with event triggers.
* **Documentation**: Specification sections covering event-driven patterns and migration guidance from polling-based approaches.
###
[​
](#out-of-scope)
Out of Scope
* Changes to the transport wire format or session model (owned by the Transports WG).
* General-purpose pub/sub infrastructure beyond what the MCP protocol requires.
* Modifications to existing notification primitives (`notifications/resources/updated`, `notifications/tools/list\_changed`, etc.) that do not relate to proactive server-initiated delivery.
###
[​
](#related-groups)
Related Groups
* **Transports WG** — delivery and ordering guarantees depend on transport capabilities; callback semantics must be coherent across stdio, Streamable HTTP, and future transports.
* **Agents WG** — [SEP-1686 (Tasks)](https://github.com/modelcontextprotocol/modelcontextprotocol/issues/1686) identifies webhook-style task completion notifications as a future consideration; this WG owns that mechanism.
##
[​
](#leadership)
Leadership
|Role|Name|Organization|GitHub|Term|
|Lead|Clare Liguori|Amazon Web Services|[@clareliguori](https://github.com/clareliguori)|Initial|
|Lead|Peter Alexander|Anthropic|[@pja-ant](https://github.com/pja-ant)|Initial|
##
[​
](#authority-&amp;-decision-rights)
Authority & Decision Rights
|Decision Type|Authority Level|
|Meeting logistics & scheduling|WG Leads (autonomous)|
|Proposal prioritization within WG|WG Leads (autonomous)|
|SEP triage & closure (in scope)|WG Leads (autonomous, with documented rationale)|
|Technical design within scope|WG consensus|
|Spec changes (additive)|WG consensus → Core Maintainer approval|
|Spec changes (breaking/fundamental)|WG consensus → Core Maintainer approval + wider review|
|Scope expansion|Core Maintainer approval required|
|WG Member approval|WG Member sponsors|
##
[​
](#operations)
Operations
|Meeting|Frequency|Duration|Purpose|
|Working Session|Weekly|30 min|Technical discussion, proposal review|
##
[​
](#deliverables-&amp;-success-metrics)
Deliverables & Success Metrics
###
[​
](#active-work-items)
Active Work Items
|Item|Status|Target Date|Champion|
|SEP: Events in MCP v1 RFC|Ideating|End April|TBD|
|Reference implementation in Tier-1 SDKs|—|End April|TBD|
###
[​
](#success-criteria)
Success Criteria
* An accepted SEP defining the trigger/callback mechanism and its subscription lifecycle.
* Reference implementations in at least two Tier-1 SDKs.
* Conformance test coverage for the new primitives.
##
[​
](#changelog)
Changelog
|Date|Change|
|2026-03-24|Initial charter|