Lifecycle - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
The Model Context Protocol (MCP) defines a rigorous lifecycle for client-server
connections that ensures proper capability negotiation and state management.
1. **Initialization**: Capability negotiation and protocol version agreement
2. **Operation**: Normal protocol communication
3. **Shutdown**: Graceful termination of the connection
##
[​
](#lifecycle-phases)
Lifecycle Phases
###
[​
](#initialization)
Initialization
The initialization phase **MUST** be the first interaction between client and server.
During this phase, the client and server:
* Establish protocol version compatibility
* Exchange and negotiate capabilities
* Share implementation details
The client **MUST** initiate this phase by sending an `initialize` request containing:
* Protocol version supported
* Client capabilities
* Client implementation information
```
`{
"jsonrpc": "2.0",
"id": 1,
"method": "initialize",
"params": {
"protocolVersion": "2025-03-26",
"capabilities": {
"roots": {
"listChanged": true
},
"sampling": {}
},
"clientInfo": {
"name": "ExampleClient",
"version": "1.0.0"
}
}
}
`
```
The initialize request **MUST NOT** be part of a JSON-RPC
[batch](https://www.jsonrpc.org/specification#batch), as other requests and notifications
are not possible until initialization has completed. This also permits backwards
compatibility with prior protocol versions that do not explicitly support JSON-RPC
batches.
The server **MUST** respond with its own capabilities and information:
```
`{
"jsonrpc": "2.0",
"id": 1,
"result": {
"protocolVersion": "2025-03-26",
"capabilities": {
"logging": {},
"prompts": {
"listChanged": true
},
"resources": {
"subscribe": true,
"listChanged": true
},
"tools": {
"listChanged": true
}
},
"serverInfo": {
"name": "ExampleServer",
"version": "1.0.0"
},
"instructions": "Optional instructions for the client"
}
}
`
```
After successful initialization, the client **MUST** send an `initialized` notification
to indicate it is ready to begin normal operations:
```
`{
"jsonrpc": "2.0",
"method": "notifications/initialized"
}
`
```
* The client **SHOULD NOT** send requests other than
[pings](/specification/2025-03-26/basic/utilities/ping) before the server has responded to the
`initialize` request.
* The server **SHOULD NOT** send requests other than
[pings](/specification/2025-03-26/basic/utilities/ping) and
[logging](/specification/2025-03-26/server/utilities/logging) before receiving the `initialized`
notification.
####
[​
](#version-negotiation)
Version Negotiation
In the `initialize` request, the client **MUST** send a protocol version it supports.
This **SHOULD** be the *latest* version supported by the client.
If the server supports the requested protocol version, it **MUST** respond with the same
version. Otherwise, the server **MUST** respond with another protocol version it
supports. This **SHOULD** be the *latest* version supported by the server.
If the client does not support the version in the server’s response, it **SHOULD**
disconnect.
####
[​
](#capability-negotiation)
Capability Negotiation
Client and server capabilities establish which optional protocol features will be
available during the session.
Key capabilities include:
|Category|Capability|Description|
|Client|`roots`|Ability to provide filesystem [roots](/specification/2025-03-26/client/roots)|
|Client|`sampling`|Support for LLM [sampling](/specification/2025-03-26/client/sampling) requests|
|Client|`experimental`|Describes support for non-standard experimental features|
|Server|`prompts`|Offers [prompt templates](/specification/2025-03-26/server/prompts)|
|Server|`resources`|Provides readable [resources](/specification/2025-03-26/server/resources)|
|Server|`tools`|Exposes callable [tools](/specification/2025-03-26/server/tools)|
|Server|`logging`|Emits structured [log messages](/specification/2025-03-26/server/utilities/logging)|
|Server|`completions`|Supports argument [autocompletion](/specification/2025-03-26/server/utilities/completion)|
|Server|`experimental`|Describes support for non-standard experimental features|
Capability objects can describe sub-capabilities like:
* `listChanged`: Support for list change notifications (for prompts, resources, and
tools)
* `subscribe`: Support for subscribing to individual items’ changes (resources only)
###
[​
](#operation)
Operation
During the operation phase, the client and server exchange messages according to the
negotiated capabilities.
Both parties **SHOULD**:
* Respect the negotiated protocol version
* Only use capabilities that were successfully negotiated
###
[​
](#shutdown)
Shutdown
During the shutdown phase, one side (usually the client) cleanly terminates the protocol
connection. No specific shutdown messages are defined—instead, the underlying transport
mechanism should be used to signal connection termination:
####
[​
](#stdio)
stdio
For the stdio [transport](/specification/2025-03-26/basic/transports), the client **SHOULD** initiate
shutdown by:
1. First, closing the input stream to the child process (the server)
2. Waiting for the server to exit, or sending `SIGTERM` if the server does not exit
within a reasonable time
3. Sending `SIGKILL` if the server does not exit within a reasonable time after `SIGTERM`
The server **MAY** initiate shutdown by closing its output stream to the client and
exiting.
####
[​
](#http)
HTTP
For HTTP [transports](/specification/2025-03-26/basic/transports), shutdown is indicated by closing the
associated HTTP connection(s).
##
[​
](#timeouts)
Timeouts
Implementations **SHOULD** establish timeouts for all sent requests, to prevent hung
connections and resource exhaustion. When the request has not received a success or error
response within the timeout period, the sender **SHOULD** issue a [cancellation
notification](/specification/2025-03-26/basic/utilities/cancellation) for that request and stop waiting for
a response.
SDKs and other middleware **SHOULD** allow these timeouts to be configured on a
per-request basis.
Implementations **MAY** choose to reset the timeout clock when receiving a [progress
notification](/specification/2025-03-26/basic/utilities/progress) corresponding to the request, as this
implies that work is actually happening. However, implementations **SHOULD** always
enforce a maximum timeout, regardless of progress notifications, to limit the impact of a
misbehaving client or server.
##
[​
](#error-handling)
Error Handling
Implementations **SHOULD** be prepared to handle these error cases:
* Protocol version mismatch
* Failure to negotiate required capabilities
* Request [timeouts](#timeouts)
Example initialization error:
```
`{
"jsonrpc": "2.0",
"id": 1,
"error": {
"code": -32602,
"message": "Unsupported protocol version",
"data": {
"supported": ["2024-11-05"],
"requested": "1.0.0"
}
}
}
`
```