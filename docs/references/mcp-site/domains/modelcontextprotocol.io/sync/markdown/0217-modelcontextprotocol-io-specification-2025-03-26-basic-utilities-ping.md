Ping - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
The Model Context Protocol includes an optional ping mechanism that allows either party
to verify that their counterpart is still responsive and the connection is alive.
##
[​
](#overview)
Overview
The ping functionality is implemented through a simple request/response pattern. Either
the client or server can initiate a ping by sending a `ping` request.
##
[​
](#message-format)
Message Format
A ping request is a standard JSON-RPC request with no parameters:
```
`{
"jsonrpc": "2.0",
"id": "123",
"method": "ping"
}
`
```
##
[​
](#behavior-requirements)
Behavior Requirements
1. The receiver **MUST** respond promptly with an empty response:
```
`{
"jsonrpc": "2.0",
"id": "123",
"result": {}
}
`
```
1. If no response is received within a reasonable timeout period, the sender **MAY**:
* Consider the connection stale
* Terminate the connection
* Attempt reconnection procedures
##
[​
](#usage-patterns)
Usage Patterns
##
[​
](#implementation-considerations)
Implementation Considerations
* Implementations **SHOULD** periodically issue pings to detect connection health
* The frequency of pings **SHOULD** be configurable
* Timeouts **SHOULD** be appropriate for the network environment
* Excessive pinging **SHOULD** be avoided to reduce network overhead
##
[​
](#error-handling)
Error Handling
* Timeouts **SHOULD** be treated as connection failures
* Multiple failed pings **MAY** trigger connection reset
* Implementations **SHOULD** log ping failures for diagnostics