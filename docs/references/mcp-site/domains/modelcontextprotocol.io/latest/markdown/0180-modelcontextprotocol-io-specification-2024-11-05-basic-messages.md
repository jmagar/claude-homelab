Messages - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
All messages in MCP **MUST** follow the
[JSON-RPC 2.0](https://www.jsonrpc.org/specification) specification. The protocol defines
three types of messages:
##
[​
](#requests)
Requests
Requests are sent from the client to the server or vice versa.
```
`{
jsonrpc: "2.0";
id: string | number;
method: string;
params?: {
[key: string]: unknown;
};
}
`
```
* Requests **MUST** include a string or integer ID.
* Unlike base JSON-RPC, the ID **MUST NOT** be `null`.
* The request ID **MUST NOT** have been previously used by the requestor within the same
session.
##
[​
](#responses)
Responses
Responses are sent in reply to requests.
```
`{
jsonrpc: "2.0";
id: string | number;
result?: {
[key: string]: unknown;
}
error?: {
code: number;
message: string;
data?: unknown;
}
}
`
```
* Responses **MUST** include the same ID as the request they correspond to.
* Either a `result` or an `error` **MUST** be set. A response **MUST NOT** set both.
* Error codes **MUST** be integers.
##
[​
](#notifications)
Notifications
Notifications are sent from the client to the server or vice versa. They do not expect a
response.
```
`{
jsonrpc: "2.0";
method: string;
params?: {
[key: string]: unknown;
};
}
`
```
* Notifications **MUST NOT** include an ID.