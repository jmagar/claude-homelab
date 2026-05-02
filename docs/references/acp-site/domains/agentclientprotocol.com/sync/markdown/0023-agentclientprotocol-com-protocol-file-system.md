File System - Agent Client Protocol
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
The filesystem methods allow Agents to read and write text files within the Client’s environment. These methods enable Agents to access unsaved editor state and allow Clients to track file modifications made during agent execution.
##
[​
](#checking-support)
Checking Support
Before attempting to use filesystem methods, Agents **MUST** verify that the Client supports these capabilities by checking the [Client Capabilities](./initialization#client-capabilities) field in the `initialize` response:
```
`{
"jsonrpc": "2.0",
"id": 0,
"result": {
"protocolVersion": 1,
"clientCapabilities": {
"fs": {
"readTextFile": true,
"writeTextFile": true
}
}
}
}
`
```
If `readTextFile` or `writeTextFile` is `false` or not present, the Agent **MUST NOT** attempt to call the corresponding filesystem method.
##
[​
](#reading-files)
Reading Files
The `fs/read\_text\_file` method allows Agents to read text file contents from the Client’s filesystem, including unsaved changes in the editor.
```
`{
"jsonrpc": "2.0",
"id": 3,
"method": "fs/read\_text\_file",
"params": {
"sessionId": "sess\_abc123def456",
"path": "/home/user/project/src/main.py",
"line": 10,
"limit": 50
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
](#param-path)
path
string
required
Absolute path to the file to read
[​
](#param-line)
line
number
Optional line number to start reading from (1-based)
[​
](#param-limit)
limit
number
Optional maximum number of lines to read
The Client responds with the file contents:
```
`{
"jsonrpc": "2.0",
"id": 3,
"result": {
"content": "def hello\_world():\\n print('Hello, world!')\\n"
}
}
`
```
##
[​
](#writing-files)
Writing Files
The `fs/write\_text\_file` method allows Agents to write or update text files in the Client’s filesystem.
```
`{
"jsonrpc": "2.0",
"id": 4,
"method": "fs/write\_text\_file",
"params": {
"sessionId": "sess\_abc123def456",
"path": "/home/user/project/config.json",
"content": "{\\n \\"debug\\": true,\\n \\"version\\": \\"1.0.0\\"\\n}"
}
}
`
```
[​
](#param-session-id-1)
sessionId
SessionId
required
The [Session ID](./session-setup#session-id) for this request
[​
](#param-path-1)
path
string
required
Absolute path to the file to write.The Client **MUST** create the file if it doesn’t exist.
[​
](#param-content)
content
string
required
The text content to write to the file
The Client responds with an empty result on success:
```
`{
"jsonrpc": "2.0",
"id": 4,
"result": null
}
`
```