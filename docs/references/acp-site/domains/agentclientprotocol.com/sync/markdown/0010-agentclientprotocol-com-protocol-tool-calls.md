Tool Calls - Agent Client Protocol
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
Tool calls represent actions that language models request Agents to perform during a [prompt turn](./prompt-turn). When an LLM determines it needs to interact with external systems—like reading files, running code, or fetching data—it generates tool calls that the Agent executes on its behalf.
Agents report tool calls through [`session/update`](./prompt-turn#3-agent-reports-output) notifications, allowing Clients to display real-time progress and results to users.
While Agents handle the actual execution, they may leverage Client capabilities like [permission requests](#requesting-permission) or [file system access](./file-system) to provide a richer, more integrated experience.
##
[​
](#creating)
Creating
When the language model requests a tool invocation, the Agent **SHOULD** report it to the Client:
```
`{
"jsonrpc": "2.0",
"method": "session/update",
"params": {
"sessionId": "sess\_abc123def456",
"update": {
"sessionUpdate": "tool\_call",
"toolCallId": "call\_001",
"title": "Reading configuration file",
"kind": "read",
"status": "pending"
}
}
}
`
```
[​
](#param-tool-call-id)
toolCallId
ToolCallId
required
A unique identifier for this tool call within the session
[​
](#param-title)
title
string
required
A human-readable title describing what the tool is doing
[​
](#param-kind)
kind
ToolKind
The category of tool being invoked.
Show kinds
* `read` - Reading files or data - `edit` - Modifying files or content -
`delete` - Removing files or data - `move` - Moving or renaming files -
`search` - Searching for information - `execute` - Running commands or code -
`think` - Internal reasoning or planning - `fetch` - Retrieving external data
* `other` - Other tool types (default)
Tool kinds help Clients choose appropriate icons and optimize how they display tool execution progress.
[​
](#param-status)
status
ToolCallStatus
The current [execution status](#status) (defaults to `pending`)
[​
](#param-content)
content
ToolCallContent[]
[Content produced](#content) by the tool call
[​
](#param-locations)
locations
ToolCallLocation[]
[File locations](#following-the-agent) affected by this tool call
[​
](#param-raw-input)
rawInput
object
The raw input parameters sent to the tool
[​
](#param-raw-output)
rawOutput
object
The raw output returned by the tool
##
[​
](#updating)
Updating
As tools execute, Agents send updates to report progress and results.
Updates use the `session/update` notification with `tool\_call\_update`:
```
`{
"jsonrpc": "2.0",
"method": "session/update",
"params": {
"sessionId": "sess\_abc123def456",
"update": {
"sessionUpdate": "tool\_call\_update",
"toolCallId": "call\_001",
"status": "in\_progress",
"content": [
{
"type": "content",
"content": {
"type": "text",
"text": "Found 3 configuration files..."
}
}
]
}
}
}
`
```
All fields except `toolCallId` are optional in updates. Only the fields being changed need to be included.
##
[​
](#requesting-permission)
Requesting Permission
The Agent **MAY** request permission from the user before executing a tool call by calling the `session/request\_permission` method:
```
`{
"jsonrpc": "2.0",
"id": 5,
"method": "session/request\_permission",
"params": {
"sessionId": "sess\_abc123def456",
"toolCall": {
"toolCallId": "call\_001"
},
"options": [
{
"optionId": "allow-once",
"name": "Allow once",
"kind": "allow\_once"
},
{
"optionId": "reject-once",
"name": "Reject",
"kind": "reject\_once"
}
]
}
}
`
```
[​
](#param-session-id)
sessionId
SessionId
required
The session ID for this request
[​
](#param-tool-call)
toolCall
ToolCallUpdate
required
The tool call update containing details about the operation
[​
](#param-options)
options
PermissionOption[]
required
Available [permission options](#permission-options) for the user to choose
from
The Client responds with the user’s decision:
```
`{
"jsonrpc": "2.0",
"id": 5,
"result": {
"outcome": {
"outcome": "selected",
"optionId": "allow-once"
}
}
}
`
```
Clients **MAY** automatically allow or reject permission requests according to the user settings.
If the current prompt turn gets [cancelled](./prompt-turn#cancellation), the Client **MUST** respond with the `"cancelled"` outcome:
```
`{
"jsonrpc": "2.0",
"id": 5,
"result": {
"outcome": {
"outcome": "cancelled"
}
}
}
`
```
[​
](#param-outcome)
outcome
RequestPermissionOutcome
required
The user’s decision, either: - `cancelled` - The [prompt turn was
cancelled](./prompt-turn#cancellation) - `selected` with an `optionId` - The
ID of the selected permission option
###
[​
](#permission-options)
Permission Options
Each permission option provided to the Client contains:
[​
](#param-option-id)
optionId
string
required
Unique identifier for this option
[​
](#param-name)
name
string
required
Human-readable label to display to the user
[​
](#param-kind-1)
kind
PermissionOptionKind
required
A hint to help Clients choose appropriate icons and UI treatment for each option.
* `allow\_once` - Allow this operation only this time
* `allow\_always` - Allow this operation and remember the choice
* `reject\_once` - Reject this operation only this time
* `reject\_always` - Reject this operation and remember the choice
##
[​
](#status)
Status
Tool calls progress through different statuses during their lifecycle:
[​
](#param-pending)
pending
The tool call hasn’t started running yet because the input is either streaming
or awaiting approval
[​
](#param-in-progress)
in\_progress
The tool call is currently running
[​
](#param-completed)
completed
The tool call completed successfully
[​
](#param-failed)
failed
The tool call failed with an error
##
[​
](#content)
Content
Tool calls can produce different types of content:
###
[​
](#regular-content)
Regular Content
Standard [content blocks](./content) like text, images, or resources:
```
`{
"type": "content",
"content": {
"type": "text",
"text": "Analysis complete. Found 3 issues."
}
}
`
```
###
[​
](#diffs)
Diffs
File modifications shown as diffs:
```
`{
"type": "diff",
"path": "/home/user/project/src/config.json",
"oldText": "{\\n \\"debug\\": false\\n}",
"newText": "{\\n \\"debug\\": true\\n}"
}
`
```
[​
](#param-path)
path
string
required
The absolute file path being modified
[​
](#param-old-text)
oldText
string
The original content (null for new files)
[​
](#param-new-text)
newText
string
required
The new content after modification
###
[​
](#terminals)
Terminals
Live terminal output from command execution:
```
`{
"type": "terminal",
"terminalId": "term\_xyz789"
}
`
```
[​
](#param-terminal-id)
terminalId
string
required
The ID of a terminal created with `terminal/create`
When a terminal is embedded in a tool call, the Client displays live output as it’s generated and continues to display it even after the terminal is released.
##
Learn more about Terminals
##
[​
](#following-the-agent)
Following the Agent
Tool calls can report file locations they’re working with, enabling Clients to implement “follow-along” features that track which files the Agent is accessing or modifying in real-time.
```
`{
"path": "/home/user/project/src/main.py",
"line": 42
}
`
```
[​
](#param-path-1)
path
string
required
The absolute file path being accessed or modified
[​
](#param-line)
line
number
Optional line number within the file