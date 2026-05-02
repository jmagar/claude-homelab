Inspector V2 Working Group Charter - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
##
[​
](#group-type)
Group Type
Working Group
##
[​
](#mission-statement)
Mission Statement
The Inspector V2 Working Group is building Inspector V2, a new web-based MCP inspector redesigned from the ground up for maintainability and reliability. The group delivers a shared Inspector Core architecture that maximizes code reuse across Web, CLI, and TUI implementations, together with a comprehensive testing apparatus. This effort requires cross-maintainer collaboration because it spans UI, protocol tooling, and test infrastructure that no single maintainer owns today.
##
[​
](#scope)
Scope
###
[​
](#in-scope)
In Scope
* The `modelcontextprotocol/inspector` repository, including:
* **Inspector Core** — a new shared-code architecture that provides common MCP and protocol interfaces for all Inspector front-ends.
* **Web Inspector UI** — browser-based inspector built on Mantine and TypeScript.
* **CLI Inspector** — command-line interface sharing Inspector Core.
* **TUI Inspector** — terminal UI sharing Inspector Core.
* **Testing apparatus** — shared test harnesses, fixtures, and integration tests across all Inspector surfaces.
* Deprecation and migration of the existing Inspector on `main` to a `v1.x` maintenance branch.
* Adoption of MCP TypeScript SDK V2 inside Inspector Core once available.
###
[​
](#out-of-scope)
Out of Scope
* The core MCP specification.
* MCP SDK maintenance (TypeScript, Python, or any other language SDK).
* MCP server implementations.
###
[​
](#related-groups)
Related Groups
* **SDK WG** — Inspector Core consumes the TypeScript SDK; coordination required for SDK V2 adoption.
* **MCP Apps WG** — shared surface area around client/app ergonomics and inspection workflows.
* **Auth WG** — authentication flows exercised by Inspector when connecting to protected servers.
* **Registry WG** — discovery and metadata surfaces that Inspector presents to users.
##
[​
](#leadership)
Leadership
|Role|Name|Organization|GitHub|Term|
|WG Lead|Cliff Hall|Futurescale|[@cliffhall](https://github.com/cliffhall)|Ongoing|
|WG Lead|Ola Hungerford|Nordstrom|[@olaservo](https://github.com/olaservo)|Ongoing|
|WG Lead|Bob Dickinson|TeamSpark.ai|[@BobDickinson](https://github.com/BobDickinson)|Ongoing|
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
|Cliff Hall|Futurescale|[@cliffhall](https://github.com/cliffhall)|seaofarrows|Maintainer|
|Ola Hungerford|Nordstrom|[@olaservo](https://github.com/olaservo)|olaservo|Maintainer|
|Bob Dickinson|TeamSpark.ai|[@BobDickinson](https://github.com/BobDickinson)|rddthree|Maintainer|
|Tobin South|Anthropic|[@tobinsouth](https://github.com/tobinsouth)|tobinsouth|Member|
##
[​
](#operations)
Operations
|Meeting|Frequency|Duration|Purpose|
|Working Session|Weekly, Wednesdays 11:00 America/New\_York|60 minutes|Technical discussion, proposal review|
Meetings are held at [meet.modelcontextprotocol.io/tag/inspector-v2-wg](https://meet.modelcontextprotocol.io/tag/inspector-v2-wg). Agendas are posted at least 7 days in advance per current MCP meeting policy. Meeting notes are published to the [Meeting Notes — Inspector V2 WG](https://github.com/modelcontextprotocol/modelcontextprotocol/discussions/categories/meeting-notes-inspector-v2-wg) discussion category in the `modelcontextprotocol/modelcontextprotocol` repository.
**Communication channels**
* Primary channel: `#inspector-v2-wg` on the MCP Discord.
* Async discussion: GitHub Discussions in `modelcontextprotocol/inspector`.
* Quarterly updates: posted to the WG’s GitHub Discussions category.
##
[​
](#deliverables-&amp;-success-metrics)
Deliverables & Success Metrics
###
[​
](#active-work-items)
Active Work Items
|Work Item|Status|Owner(s)|
|Web Inspector UI (Mantine / TypeScript) — dumb components with real MCP/Core interfaces|In Progress|Cliff Hall, Ola Hungerford|
|Inspector Core shared-code architecture|In Progress|Bob Dickinson|
|CLI Inspector and TUI Inspector|In Progress|Bob Dickinson|
|Migration of existing Inspector on `main` to `v1.x` maintenance branch|Planning|WG Leads|
|Testing apparatus across Core, Web, CLI, and TUI|Planning|WG Leads|
|Inspector Core adoption of MCP TypeScript SDK V2|Blocked (gated by TS SDK WG)|Bob Dickinson|
###
[​
](#success-criteria)
Success Criteria
1. **End of Q1** — Web UI complete with “dumb” components wired to real MCP/Inspector Core interfaces.
2. **End of Q1** — Inspector Core architecture finalized.
3. **End of Q2** — Inspector Core merged to `v2/main` and working end-to-end with the Web UI.
4. **End of Q2** — CLI and TUI Inspectors merged to `v2/main` and working end-to-end with Inspector Core.
5. **End of Q2** — Existing Inspector on `main` moved to the `v1.x` branch and officially deprecated.
6. **End of Q2** — New Inspector family (Web, CLI, TUI) published and generally available.
7. **End of Q3** — Inspector Core running on MCP TypeScript SDK V2 (gated by the TypeScript SDK WG’s delivery schedule).
##
[​
](#changelog)
Changelog
|Date|Change|Author|
|2026-04-11|Initial charter adopted for SEP-2149 compliance.|Cliff Hall (Co-Lead)|