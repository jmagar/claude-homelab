Server Card Charter - Model Context Protocol
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
The Server Card Working Group exists to define mechanisms that facilitate discovery and usage of MCP servers via common discovery mechanisms, and to provide guidance on how this fits into broader AI standardization efforts around discovery. Concretely, the WG will define what constitutes an MCP Server Card, the standardized document format a Server Card must follow, and how clients discover a Server Card for a given server.
##
[​
](#scope)
Scope
###
[​
](#in-scope)
In Scope
* **Specification Work**: SEPs or extensions defining what constitutes an MCP Server Card and the specific format of the Server Card document.
* **Discovery Mechanism**: Specification of how an MCP Server Card document is discovered (well-known URL, resource-based discovery, etc.).
* **Cross-Ecosystem Coordination**: A recommendation to the [AI Card](https://github.com/Agent-Card/ai-card) effort on how to interact with MCP Server Cards.
* **Documentation**: Specification sections and guidance covering Server Card authoring and consumption.
###
[​
](#out-of-scope)
Out of Scope
* Changes to the MCP initialization handshake or transport layer.
* A general-purpose MCP server registry or catalog (owned by the Registry WG).
* Internationalization of Server Card content until an MCP-wide i18n approach is defined.
###
[​
](#related-groups)
Related Groups
* **Registry WG** — Server Card format should stay as close as possible to a subset of `server.json`; coordination required to avoid divergence.
* **AI Card effort** (external) — ongoing discussion on whether and how an AI Catalog can link directly to an MCP Server Card.
##
[​
](#leadership)
Leadership
|Role|Name|Organization|GitHub|Term|
|Lead|David Soria Parra|Anthropic|[@dsp-ant](https://github.com/dsp-ant)|6 months (ends Aug 14, 2026)|
|Lead|Sam Morrow Drums|GitHub|[@SamMorrowDrums](https://github.com/SamMorrowDrums)|6 months (ends Aug 14, 2026)|
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
](#membership)
Membership
|Name|Organization|GitHub|Discord|Level|
|David Soria Parra|Anthropic|[@dsp-ant](https://github.com/dsp-ant)||Lead|
|Sam Morrow Drums|GitHub|[@SamMorrowDrums](https://github.com/SamMorrowDrums)||Lead|
|Tadas Antanavicius||[@tadasant](https://github.com/tadasant)||WG Member|
##
[​
](#operations)
Operations
|Meeting|Frequency|Duration|Purpose|
|Working Session|Weekly|60 min|Technical discussion, proposal review|
Discord: [#server-card-wg](https://discord.com/channels/1358869848138059966/1399986204405141534)
##
[​
](#deliverables-&amp;-success-metrics)
Deliverables & Success Metrics
###
[​
](#active-work-items)
Active Work Items
|Item|Status|Target Date|Champion|
|[SEP-2127: MCP Server Card](https://github.com/modelcontextprotocol/modelcontextprotocol/pull/2127)|Draft|Apr 3, 2026|[@dsp-ant](https://github.com/dsp-ant)|
###
[​
](#success-criteria)
Success Criteria
###
[​
](#active-work-items-2)
Active Work Items
|Item|Status|Target Date|Champion|
|SEP 2127: MCP Server Cards|Draft|End March|@dsp-ant|
|Reference implementation in Tier-1 SDKs|—|End April|TBD|
###
[​
](#success-criteria-2)
Success Criteria
* Spec changes accepted by Core Maintainers.
* SDK implementations available.
* Real-world clients with reach implementing the proposal.
* Real-world servers with reach implementing the proposal.
##
[​
](#changelog)
Changelog
|Date|Change|
|2026-03-26|Initial charter|