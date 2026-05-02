Terminals - Agent Client Protocol
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
The terminal methods allow Agents to execute shell commands within the Client’s environment. These methods enable Agents to run build processes, execute scripts, and interact with command-line tools while providing real-time output streaming and process control.
##
[​
](#checking-support)
Checking Support
Before attempting to use terminal methods, Agents **MUST** verify that the Client supports this capability by checking the [Client Capabilities](./initialization#client-capabilities) field in the `initialize` response:
```
`{
"jsonrpc": "2.0",
"id": 0,
"result": {
"protocolVersion": 1,
"clientCapabilities": {
"terminal": true
}
}
}
`
```
If `terminal` is `false` or not present, the Agent **MUST NOT** attempt to call any terminal methods.
##
[​
](#executing-commands)
Executing Commands
The `terminal/create` method starts a command in a new terminal:
```
`{
"jsonrpc": "2.0",
"id": 5,
"method": "terminal/create",
"params": {
"sessionId": "sess\_abc123def456",
"command": "npm",
"args": ["test", "--coverage"],
"env": [
{
"name": "NODE\_ENV",
"value": "test"
}
],
"cwd": "/home/user/project",
"outputByteLimit": 1048576
}
}
`
```
[​
](#param-session-id)
sessionId
SessionId
required
The [Session ID](./session-setup#session-id) for this request
[​
](#param-command)
command
string
required
The command to execute
[​
](#param-args)
args
string[]
Array of command arguments
[​
](#param-env)
env
EnvVariable[]
Environment variables for the command.Each variable has:
* `name`: The environment variable name
* `value`: The environment variable value
[​
](#param-cwd)
cwd
string
Working directory for the command (absolute path)
[​
](#param-output-byte-limit)
outputByteLimit
number
Maximum number of output bytes to retain. Once exceeded, earlier output is
truncated to stay within this limit.When the limit is exceeded, the Client truncates from the beginning of the output
to stay within the limit.The Client **MUST** ensure truncation happens at a character boundary to maintain valid
string output, even if this means the retained output is slightly less than the
specified limit.
The Client returns a Terminal ID immediately without waiting for completion:
```
`{
"jsonrpc": "2.0",
"id": 5,
"result": {
"terminalId": "term\_xyz789"
}
}
`
```
This allows the command to run in the background while the Agent performs other operations.
After creating the terminal, the Agent can use the `terminal/wait\_for\_exit` method to wait for the command to complete.
The Agent **MUST** release the terminal using `terminal/release` when it’s no
longer needed.
##
[​
](#embedding-in-tool-calls)
Embedding in Tool Calls
Terminals can be embedded directly in [tool calls](./tool-calls) to provide real-time output to users:
```
`{
"jsonrpc": "2.0",
"method": "session/update",
"params": {
"sessionId": "sess\_abc123def456",
"update": {
"sessionUpdate": "tool\_call",
"toolCallId": "call\_002",
"title": "Running tests",
"kind": "execute",
"status": "in\_progress",
"content": [
{
"type": "terminal",
"terminalId": "term\_xyz789"
}
]
}
}
}
`
```
When a terminal is embedded in a tool call, the Client displays live output as it’s generated and continues to display it even after the terminal is released.
##
[​
](#getting-output)
Getting Output
The `terminal/output` method retrieves the current terminal output without waiting for the command to complete:
```
`{
"jsonrpc": "2.0",
"id": 6,
"method": "terminal/output",
"params": {
"sessionId": "sess\_abc123def456",
"terminalId": "term\_xyz789"
}
}
`
```
The Client responds with the current output and exit status (if the command has finished):
```
`{
"jsonrpc": "2.0",
"id": 6,
"result": {
"output": "Running tests...\\n✓ All tests passed (42 total)\\n",
"truncated": false,
"exitStatus": {
"exitCode": 0,
"signal": null
}
}
}
`
```
[​
](#param-output)
output
string
required
The terminal output captured so far
[​
](#param-truncated)
truncated
boolean
required
Whether the output was truncated due to byte limits
[​
](#param-exit-status)
exitStatus
TerminalExitStatus
Present only if the command has exited. Contains:
* `exitCode`: The process exit code (may be null)
* `signal`: The signal that terminated the process (may be null)
##
[​
](#waiting-for-exit)
Waiting for Exit
The `terminal/wait\_for\_exit` method returns once the command completes:
```
`{
"jsonrpc": "2.0",
"id": 7,
"method": "terminal/wait\_for\_exit",
"params": {
"sessionId": "sess\_abc123def456",
"terminalId": "term\_xyz789"
}
}
`
```
The Client responds once the command exits:
```
`{
"jsonrpc": "2.0",
"id": 7,
"result": {
"exitCode": 0,
"signal": null
}
}
`
```
[​
](#param-exit-code)
exitCode
number
The process exit code (may be null if terminated by signal)
[​
](#param-signal)
signal
string
The signal that terminated the process (may be null if exited normally)
##
[​
](#killing-commands)
Killing Commands
The `terminal/kill` method terminates a command without releasing the terminal:
```
`{
"jsonrpc": "2.0",
"id": 8,
"method": "terminal/kill",
"params": {
"sessionId": "sess\_abc123def456",
"terminalId": "term\_xyz789"
}
}
`
```
After killing a command, the terminal remains valid and can be used with:
* `terminal/output` to get the final output
* `terminal/wait\_for\_exit` to get the exit status
The Agent **MUST** still call `terminal/release` when it’s done using it.
###
[​
](#building-a-timeout)
Building a Timeout
Agents can implement command timeouts by combining terminal methods:
1. Create a terminal with `terminal/create`
2. Start a timer for the desired timeout duration
3. Concurrently wait for either the timer to expire or `terminal/wait\_for\_exit` to return
4. If the timer expires first:
* Call `terminal/kill` to terminate the command
* Call `terminal/output` to retrieve any final output
* Include the output in the response to the model
* Call `terminal/release` when done
##
[​
](#releasing-terminals)
Releasing Terminals
The `terminal/release` kills the command if still running and releases all resources:
```
`{
"jsonrpc": "2.0",
"id": 9,
"method": "terminal/release",
"params": {
"sessionId": "sess\_abc123def456",
"terminalId": "term\_xyz789"
}
}
`
```
After release the terminal ID becomes invalid for all other `terminal/\*` methods.
If the terminal was added to a tool call, the client **SHOULD** continue to display its output after release.