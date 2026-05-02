Updates - Agent Client Protocol
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
This page is for larger ACP announcements and project updates. For lifecycle changes to Requests for Dialog, see [RFD Updates](/rfds/updates).
[​
](#april-23-2026)
April 23, 2026
Protocol
##
[​
](#session-close-is-stabilized)
Session Close is Stabilized
The Session Close RFD has moved to Completed and the `session/close` method is stabilized.This gives clients a way to tell agents to cancel in-flight work for a session and free the resources tied to it without tearing down the whole ACP process.[Read the full announcement](/announcements/session-close-stabilized).
[​
](#april-22-2026)
April 22, 2026
Protocol
##
[​
](#session-resume-is-stabilized)
Session Resume is Stabilized
The Session Resume RFD has moved to Completed and the `session/resume` method is stabilized.This gives clients a way to reconnect to an existing session without replaying conversation history, and lets proxies and adapters build `session/load` semantics on top of the simpler primitive.[Read the full announcement](/announcements/session-resume-stabilized).
[​
](#april-22-2026-2)
April 22, 2026
Working Groups
##
[​
](#transports-working-group)
Transports Working Group
A new Transports Working Group has been formed to standardize remote agent transports like WebSockets and HTTP.Anna Zhdan (JetBrains / Core Maintainer) and Alex Hancock (Block / Goose) are leading the effort, with a Draft RFD already underway.[Read the full announcement](/announcements/transports-working-group).
[​
](#march-9-2026)
March 9, 2026
Protocol
##
[​
](#acp-registry-is-released)
ACP Registry is Released
The ACP Registry RFD has moved to Completed and the initial version of the registry is released.The registry gives ACP clients a standard way to discover, install, and configure compatible agents without inventing custom integration metadata.[Read the full announcement](/announcements/acp-agent-registry-stabilized).
[​
](#march-9-2026-2)
March 9, 2026
Protocol
##
[​
](#session-info-update-is-stabilized)
Session Info Update is Stabilized
The Session Info Update RFD has moved to Completed and the session\_info\_update notification is stabilized.This lets agents push session metadata updates to clients in real time so titles and related metadata stay current without polling.[Read the full announcement](/announcements/session-info-update-stabilized).
[​
](#march-9-2026-3)
March 9, 2026
Protocol
##
[​
](#session-list-is-stabilized)
Session List is Stabilized
The Session List RFD has moved to Completed and the session/list method is stabilized.This gives clients a standard way to discover existing sessions from an agent for features like history, switching, and cleanup.[Read the full announcement](/announcements/session-list-stabilized).
[​
](#february-18-2026)
February 18, 2026
Governance
##
[​
](#sergey-ignatov-joins-acp-as-lead-maintainer)
Sergey Ignatov joins ACP as Lead Maintainer
Sergey Ignatov from JetBrains is now a Lead Maintainer for ACP.This reflects the growing collaboration between Zed and JetBrains around ACP and recognizes Sergey’s significant contributions to the protocol.[Read the full announcement](/announcements/sergey-ignatov-lead-maintainer).
[​
](#february-4-2026)
February 4, 2026
Protocol
##
[​
](#session-config-options-are-now-stabilized)
Session Config Options are now Stabilized
The Session Config Options RFD has moved to Completed and is stabilized.This gives agents a flexible way to expose session-level configuration such as models, modes, reasoning levels, and other selectors.[Read the full announcement](/announcements/session-config-options-stabilized).
[​
](#october-24-2025)
October 24, 2025
Protocol
##
[​
](#implementation-information-for-agents-and-clients)
Implementation information for agents and clients
ACP now allows agents and clients to share implementation details during initialization using the optional clientInfo and agentInfo fields.This makes it easier to identify which implementation is running, improve compatibility diagnostics, and understand adoption across the ecosystem.[Read the full announcement](/announcements/implementation-information).
FiltersClear
ProtocolWorking GroupsGovernance