Logout Method - Agent Client Protocol
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
* Author(s): [@anna239](https://github.com/anna239)
##
[​
](#elevator-pitch)
Elevator pitch
>
> What are you proposing to change?
>
Add a `logout` method that allows clients to terminate an authenticated session with an agent. This is the counterpart to the existing `authenticate` method and enables proper session cleanup and credential invalidation.
##
[​
](#status-quo)
Status quo
>
> How do things work today and what problems does this cause? Why would we change things?
>
Currently, ACP provides an `authenticate` method for establishing authenticated sessions, but there is no standardized way to:
* Log out of an authenticated session
* Invalidate credentials or tokens
* Signal to the agent that the user wants to end their authenticated state
Users who want to switch accounts, revoke access, or simply log out must rely on:
* Manually clearing credentials outside of ACP
* Agent-specific workarounds
This creates inconsistent user experiences and potential security concerns when credentials should be invalidated but aren’t.
##
[​
](#shiny-future)
Shiny future
>
> How will things play out once this feature exists?
>
Clients will be able to offer a proper “Log out” button that:
1. Cleanly terminates the authenticated session
2. Allows the agent to invalidate tokens/credentials as needed
3. Returns the connection to an unauthenticated state
4. Enables the user to re-authenticate with different credentials
##
[​
](#implementation-details-and-plan)
Implementation details and plan
>
> Tell me more about your implementation. What is your detailed implementation plan?
>
###
[​
](#new-method-logout)
New Method: `logout`
A new method that terminates the current authenticated session.
####
[​
](#logoutrequest)
LogoutRequest
```
`interface LogoutRequest {
/\*\* Extension metadata \*/
\_meta?: Record\<string, unknown\>;
}
`
```
####
[​
](#logoutresponse)
LogoutResponse
```
`interface LogoutResponse {
/\*\* Extension metadata \*/
\_meta?: Record\<string, unknown\>;
}
`
```
###
[​
](#capability-advertisement)
Capability Advertisement
The `logout` capability should be advertised within a new `auth` object in `AgentCapabilities`:
```
`interface AgentCapabilities {
// ... existing fields ...
/\*\* Authentication-related capabilities \*/
auth?: AgentAuthCapabilities;
}
interface AgentAuthCapabilities {
/\*\* Extension metadata \*/
\_meta?: Record\<string, unknown\>;
/\*\* Agent supports the logout method. Supply `{}` to indicate support. \*/
logout?: LogoutCapabilities;
}
interface LogoutCapabilities {
/\*\* Extension metadata \*/
\_meta?: Record\<string, unknown\>;
}
`
```
###
[​
](#json-schema-additions)
JSON Schema Additions
```
`{
"$defs": {
"AgentAuthCapabilities": {
"description": "Authentication-related capabilities supported by the agent.",
"properties": {
"\_meta": {
"additionalProperties": true,
"type": ["object", "null"]
},
"logout": {
"allOf": [
{
"$ref": "#/$defs/LogoutCapabilities"
}
],
"description": "Whether the agent supports the logout method. Supply `{}` to indicate support."
}
},
"type": "object"
},
"LogoutCapabilities": {
"description": "Logout capabilities supported by the agent. Supply `{}` to indicate support.",
"properties": {
"\_meta": {
"additionalProperties": true,
"type": ["object", "null"]
}
},
"type": "object"
},
"LogoutRequest": {
"description": "Request to terminate the current authenticated session.",
"properties": {
"\_meta": {
"additionalProperties": true,
"type": ["object", "null"]
}
},
"type": "object",
"x-method": "logout",
"x-side": "agent"
},
"LogoutResponse": {
"description": "Response to the logout method.",
"properties": {
"\_meta": {
"additionalProperties": true,
"type": ["object", "null"]
}
},
"type": "object",
"x-method": "logout",
"x-side": "agent"
}
}
}
`
```
###
[​
](#example-exchange)
Example Exchange
**Request:**
```
`{
"jsonrpc": "2.0",
"id": 1,
"method": "logout",
"params": {}
}
`
```
**Response:**
```
`{
"jsonrpc": "2.0",
"id": 1,
"result": {}
}
`
```
###
[​
](#behavior)
Behavior
1. **Pre-condition**: The client should only call `logout` if:
* The agent advertises `auth.logout: {}`
* **Agent responsibilities**:
* Invalidate any stored tokens or credentials as appropriate
* Clean up any session state associated with the authenticated user
* Return the connection to an unauthenticated state
* **Post-condition**: After a successful `logout`:
* Subsequent requests that require authentication should return `auth\_required` error
* The client can call `authenticate` again to establish a new authenticated session
* **Active sessions**: If there are active sessions when `logout` is called, the agent should either:
* Terminate them gracefully
* Throw an `auth\_required` error
##
[​
](#frequently-asked-questions)
Frequently asked questions
>
> What questions have arisen over the course of authoring this document?
>
###
[​
](#should-logout-affect-active-sessions)
Should logout affect active sessions?
This is left as implementation-defined. Some agents may want to:
* Automatically terminate all sessions (strict security)
* Keep sessions running
The RFD intentionally does not mandate a specific behavior to allow flexibility.
##
[​
](#revision-history)
Revision history
* 2026-02-02: Initial draft