Session Modes - Agent Client Protocol
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
You can now use [Session Config Options](./session-config-options). Dedicated
session mode methods will be removed in a future version of the protocol.
Until then, you can offer both to clients for backwards compatibility.
Agents can provide a set of modes they can operate in. Modes often affect the system prompts used, the availability of tools, and whether they request permission before running.
##
[​
](#initial-state)
Initial state
During [Session Setup](./session-setup) the Agent **MAY** return a list of modes it can operate in and the currently active mode:
```
`{
"jsonrpc": "2.0",
"id": 1,
"result": {
"sessionId": "sess\_abc123def456",
"modes": {
"currentModeId": "ask",
"availableModes": [
{
"id": "ask",
"name": "Ask",
"description": "Request permission before making any changes"
},
{
"id": "architect",
"name": "Architect",
"description": "Design and plan software systems without implementation"
},
{
"id": "code",
"name": "Code",
"description": "Write and modify code with full tool access"
}
]
}
}
}
`
```
[​
](#param-modes)
modes
SessionModeState
The current mode state for the session
###
[​
](#sessionmodestate)
SessionModeState
[​
](#param-current-mode-id)
currentModeId
SessionModeId
required
The ID of the mode that is currently active
[​
](#param-available-modes)
availableModes
SessionMode[]
required
The set of modes that the Agent can operate in
###
[​
](#sessionmode)
SessionMode
[​
](#param-id)
id
SessionModeId
required
Unique identifier for this mode
[​
](#param-name)
name
string
required
Human-readable name of the mode
[​
](#param-description)
description
string
Optional description providing more details about what this mode does
##
[​
](#setting-the-current-mode)
Setting the current mode
The current mode can be changed at any point during a session, whether the Agent is idle or generating a response.
###
[​
](#from-the-client)
From the Client
Typically, Clients display the available modes to the user and allow them to change the current one, which they can do by calling the [`session/set\_mode`](./schema#session/set-mode) method.
```
`{
"jsonrpc": "2.0",
"id": 2,
"method": "session/set\_mode",
"params": {
"sessionId": "sess\_abc123def456",
"modeId": "code"
}
}
`
```
[​
](#param-session-id)
sessionId
SessionId
required
The ID of the session to set the mode for
[​
](#param-mode-id)
modeId
SessionModeId
required
The ID of the mode to switch to. Must be one of the modes listed in
`availableModes`
###
[​
](#from-the-agent)
From the Agent
The Agent can also change its own mode and let the Client know by sending the `current\_mode\_update` session notification:
```
`{
"jsonrpc": "2.0",
"method": "session/update",
"params": {
"sessionId": "sess\_abc123def456",
"update": {
"sessionUpdate": "current\_mode\_update",
"modeId": "code"
}
}
}
`
```
####
[​
](#exiting-plan-modes)
Exiting plan modes
A common case where an Agent might switch modes is from within a special “exit mode” tool that can be provided to the language model during plan/architect modes. The language model can call this tool when it determines it’s ready to start implementing a solution.
This “switch mode” tool will usually request permission before running, which it can do just like any other tool:
```
`{
"jsonrpc": "2.0",
"id": 3,
"method": "session/request\_permission",
"params": {
"sessionId": "sess\_abc123def456",
"toolCall": {
"toolCallId": "call\_switch\_mode\_001",
"title": "Ready for implementation",
"kind": "switch\_mode",
"status": "pending",
"content": [
{
"type": "text",
"text": "## Implementation Plan..."
}
]
},
"options": [
{
"optionId": "code",
"name": "Yes, and auto-accept all actions",
"kind": "allow\_always"
},
{
"optionId": "ask",
"name": "Yes, and manually accept actions",
"kind": "allow\_once"
},
{
"optionId": "reject",
"name": "No, stay in architect mode",
"kind": "reject\_once"
}
]
}
}
`
```
When an option is chosen, the tool runs, setting the mode and sending the `current\_mode\_update` notification mentioned above.
##
Learn more about permission requests