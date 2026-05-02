Session Close is stabilized - Agent Client Protocol
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
**Published:** April 23, 2026
The [Session Close RFD](/rfds/session-close) has moved to Completed and the `session/close` method is stabilized.
When advertised via `sessionCapabilities.close`, Clients can now ask Agents to cancel any ongoing work for a session and free the resources associated with it, without having to terminate the whole ACP process. This lets long-running Clients keep memory, threads, and subprocesses under control as users accumulate sessions over time.
For the protocol documentation, see [Closing Active Sessions](/protocol/session-setup#closing-active-sessions).