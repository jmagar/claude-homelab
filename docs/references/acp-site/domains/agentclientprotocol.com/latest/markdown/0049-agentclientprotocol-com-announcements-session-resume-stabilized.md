Session Resume is stabilized - Agent Client Protocol
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
**Published:** April 22, 2026
The Session Resume RFD has moved to Completed and the `session/resume` method is stabilized.
Unlike `session/load`, `session/resume` reconnects clients to an existing session without replaying the conversation history. This is a simpler primitive for agents that can restore context but don’t implement full history replay, and it gives proxies and adapters a foundation they can build `session/load` semantics on top of.
For the shipped protocol, see [Resuming Sessions](/protocol/session-setup#resuming-sessions). For the design history, see the [Session Resume RFD](/rfds/session-resume).