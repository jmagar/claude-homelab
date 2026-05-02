Session Setup - Agent Client Protocol
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
Sessions represent a specific conversation or thread between the [Client](/protocol/overview#client) and [Agent](/protocol/overview#agent). Each session maintains its own context, conversation history, and state, allowing multiple independent interactions with the same Agent.
Before creating a session, Clients **MUST** first complete the [initialization](/protocol/initialization) phase to establish protocol compatibility and capabilities.
##
[​
](#creating-a-session)
Creating a Session
Clients create a new session by calling the `session/new` method with:
* The [working directory](#working-directory) for the session
* A list of [MCP servers](#mcp-servers) the Agent should connect to
```
`{
"jsonrpc": "2.0",
"id": 1,
"method": "session/new",
"params": {
"cwd": "/home/user/project",
"mcpServers": [
{
"name": "filesystem",
"command": "/path/to/mcp-server",
"args": ["--stdio"],
"env": []
}
]
}
}
`
```
The Agent **MUST** respond with a unique [Session ID](#session-id) that identifies this conversation:
```
`{
"jsonrpc": "2.0",
"id": 1,
"result": {
"sessionId": "sess\_abc123def456"
}
}
`
```
##
[​
](#loading-sessions)
Loading Sessions
Agents that support the `loadSession` capability allow Clients to resume previous conversations. This feature enables persistence across restarts and sharing sessions between different Client instances.
###
[​
](#checking-support)
Checking Support
Before attempting to load a session, Clients **MUST** verify that the Agent supports this capability by checking the `loadSession` field in the `initialize` response:
```
`{
"jsonrpc": "2.0",
"id": 0,
"result": {
"protocolVersion": 1,
"agentCapabilities": {
"loadSession": true
}
}
}
`
```
If `loadSession` is `false` or not present, the Agent does not support loading sessions and Clients **MUST NOT** attempt to call `session/load`.
###
[​
](#loading-a-session)
Loading a Session
To load an existing session, Clients **MUST** call the `session/load` method with:
* The [Session ID](#session-id) to resume
* [MCP servers](#mcp-servers) to connect to
* The [working directory](#working-directory)
```
`{
"jsonrpc": "2.0",
"id": 1,
"method": "session/load",
"params": {
"sessionId": "sess\_789xyz",
"cwd": "/home/user/project",
"mcpServers": [
{
"name": "filesystem",
"command": "/path/to/mcp-server",
"args": ["--mode", "filesystem"],
"env": []
}
]
}
}
`
```
The Agent **MUST** replay the entire conversation to the Client in the form of `session/update` notifications (like `session/prompt`).
For example, a user message from the conversation history:
```
`{
"jsonrpc": "2.0",
"method": "session/update",
"params": {
"sessionId": "sess\_789xyz",
"update": {
"sessionUpdate": "user\_message\_chunk",
"content": {
"type": "text",
"text": "What's the capital of France?"
}
}
}
}
`
```
Followed by the agent’s response:
```
`{
"jsonrpc": "2.0",
"method": "session/update",
"params": {
"sessionId": "sess\_789xyz",
"update": {
"sessionUpdate": "agent\_message\_chunk",
"content": {
"type": "text",
"text": "The capital of France is Paris."
}
}
}
}
`
```
When **all** the conversation entries have been streamed to the Client, the Agent **MUST** respond to the original `session/load` request.
```
`{
"jsonrpc": "2.0",
"id": 1,
"result": null
}
`
```
The Client can then continue sending prompts as if the session was never interrupted.
##
[​
](#resuming-sessions)
Resuming Sessions
Agents that advertise `sessionCapabilities.resume` allow Clients to reconnect to an existing session without replaying the conversation history.
###
[​
](#checking-support-2)
Checking Support
Before attempting to resume a session, Clients **MUST** verify that the Agent supports this capability by checking for the `sessionCapabilities.resume` field in the `initialize` response:
```
`{
"jsonrpc": "2.0",
"id": 0,
"result": {
"protocolVersion": 1,
"agentCapabilities": {
"sessionCapabilities": {
"resume": {}
}
}
}
}
`
```
If `sessionCapabilities.resume` is not present, the Agent does not support resuming sessions and Clients **MUST NOT** attempt to call `session/resume`.
###
[​
](#resuming-a-session)
Resuming a Session
To resume an existing session without replaying prior messages, Clients **MUST** call the `session/resume` method with:
* The [Session ID](#session-id) to resume
* [MCP servers](#mcp-servers) to connect to
* The [working directory](#working-directory)
```
`{
"jsonrpc": "2.0",
"id": 2,
"method": "session/resume",
"params": {
"sessionId": "sess\_789xyz",
"cwd": "/home/user/project",
"mcpServers": [
{
"name": "filesystem",
"command": "/path/to/mcp-server",
"args": ["--mode", "filesystem"],
"env": []
}
]
}
}
`
```
Unlike `session/load`, the Agent **MUST NOT** replay the conversation history via `session/update` notifications before responding. Instead, it restores the session context, reconnects to the requested MCP servers, and returns once the session is ready to continue.
```
`{
"jsonrpc": "2.0",
"id": 2,
"result": {}
}
`
```
The response **MAY** also include initial mode, model, or session configuration state when those features are supported by the Agent.
##
[​
](#closing-active-sessions)
Closing Active Sessions
Agents that advertise `sessionCapabilities.close` allow Clients to tell the Agent to cancel any ongoing work for a session and free any resources associated with that active session.
###
[​
](#checking-support-3)
Checking Support
Before attempting to close a session, Clients **MUST** verify that the Agent supports this capability by checking the `sessionCapabilities.close` field in the `initialize` response:
```
`{
"jsonrpc": "2.0",
"id": 0,
"result": {
"protocolVersion": 1,
"agentCapabilities": {
"sessionCapabilities": {
"close": {}
}
}
}
}
`
```
If `sessionCapabilities.close` is not present, the Agent does not support closing sessions and Clients **MUST NOT** attempt to call `session/close`.
###
[​
](#closing-a-session)
Closing a Session
To close an active session, Clients **MUST** call the `session/close` method with the session ID:
```
`{
"jsonrpc": "2.0",
"id": 2,
"method": "session/close",
"params": {
"sessionId": "sess\_789xyz"
}
}
`
```
[​
](#param-session-id)
sessionId
SessionId
required
The ID of the active session to close.
The Agent **MUST** cancel any ongoing work for that session as if [`session/cancel`](/protocol/prompt-turn#cancellation) had been called, then free the resources associated with the session.
On success, the Agent responds with an empty result object:
```
`{
"jsonrpc": "2.0",
"id": 2,
"result": {}
}
`
```
Agents MAY return an error if the session does not exist or is not currently active.
##
[​
](#session-id)
Session ID
The session ID returned by `session/new` is a unique identifier for the conversation context.
Clients use this ID to:
* Send prompt requests via `session/prompt`
* Cancel ongoing operations via `session/cancel`
* Load previous sessions via `session/load` (if the Agent supports the `loadSession` capability)
* Resume previous sessions via `session/resume` (if the Agent supports the `sessionCapabilities.resume` capability)
* Close active sessions via `session/close` (if the Agent supports the `sessionCapabilities.close` capability)
##
[​
](#working-directory)
Working Directory
The `cwd` (current working directory) parameter establishes the file system context for the session. This directory:
* **MUST** be an absolute path
* **MUST** be used for the session regardless of where the Agent subprocess was spawned
* **SHOULD** serve as a boundary for tool operations on the file system
##
[​
](#mcp-servers)
MCP Servers
The [Model Context Protocol (MCP)](https://modelcontextprotocol.io) allows Agents to access external tools and data sources. When creating a session, Clients **MAY** include connection details for MCP servers that the Agent should connect to.
MCP servers can be connected to using different transports. All Agents **MUST** support the stdio transport, while HTTP and SSE transports are optional capabilities that can be checked during initialization.
While they are not required to by the spec, new Agents **SHOULD** support the HTTP transport to ensure compatibility with modern MCP servers.
###
[​
](#transport-types)
Transport Types
####
[​
](#stdio-transport)
Stdio Transport
All Agents **MUST** support connecting to MCP servers via stdio (standard input/output). This is the default transport mechanism.
[​
](#param-name)
name
string
required
A human-readable identifier for the server
[​
](#param-command)
command
string
required
The absolute path to the MCP server executable
[​
](#param-args)
args
array
required
Command-line arguments to pass to the server
[​
](#param-env)
env
EnvVariable[]
Environment variables to set when launching the server
Show EnvVariable
[​
](#param-name-1)
name
string
The name of the environment variable.
[​
](#param-value)
value
string
The value of the environment variable.
Example stdio transport configuration:
```
`{
"name": "filesystem",
"command": "/path/to/mcp-server",
"args": ["--stdio"],
"env": [
{
"name": "API\_KEY",
"value": "secret123"
}
]
}
`
```
####
[​
](#http-transport)
HTTP Transport
When the Agent supports `mcpCapabilities.http`, Clients can specify MCP servers configurations using the HTTP transport.
[​
](#param-type)
type
string
required
Must be `"http"` to indicate HTTP transport
[​
](#param-name-2)
name
string
required
A human-readable identifier for the server
[​
](#param-url)
url
string
required
The URL of the MCP server
[​
](#param-headers)
headers
HttpHeader[]
required
HTTP headers to include in requests to the server
Show HttpHeader
[​
](#param-name-3)
name
string
The name of the HTTP header.
[​
](#param-value-1)
value
string
The value to set for the HTTP header.
Example HTTP transport configuration:
```
`{
"type": "http",
"name": "api-server",
"url": "https://api.example.com/mcp",
"headers": [
{
"name": "Authorization",
"value": "Bearer token123"
},
{
"name": "Content-Type",
"value": "application/json"
}
]
}
`
```
####
[​
](#sse-transport)
SSE Transport
When the Agent supports `mcpCapabilities.sse`, Clients can specify MCP servers configurations using the SSE transport.
This transport was deprecated by the MCP spec.
[​
](#param-type-1)
type
string
required
Must be `"sse"` to indicate SSE transport
[​
](#param-name-4)
name
string
required
A human-readable identifier for the server
[​
](#param-url-1)
url
string
required
The URL of the SSE endpoint
[​
](#param-headers-1)
headers
HttpHeader[]
required
HTTP headers to include when establishing the SSE connection
Show HttpHeader
[​
](#param-name-5)
name
string
The name of the HTTP header.
[​
](#param-value-2)
value
string
The value to set for the HTTP header.
Example SSE transport configuration:
```
`{
"type": "sse",
"name": "event-stream",
"url": "https://events.example.com/mcp",
"headers": [
{
"name": "X-API-Key",
"value": "apikey456"
}
]
}
`
```
###
[​
](#checking-transport-support)
Checking Transport Support
Before using HTTP or SSE transports, Clients **MUST** verify the Agent’s capabilities during initialization:
```
`{
"jsonrpc": "2.0",
"id": 0,
"result": {
"protocolVersion": 1,
"agentCapabilities": {
"mcpCapabilities": {
"http": true,
"sse": true
}
}
}
}
`
```
If `mcpCapabilities.http` is `false` or not present, the Agent does not support HTTP transport.
If `mcpCapabilities.sse` is `false` or not present, the Agent does not support SSE transport.
Agents **SHOULD** connect to all MCP servers specified by the Client.
Clients **MAY** use this ability to provide tools directly to the underlying language model by including their own MCP server.