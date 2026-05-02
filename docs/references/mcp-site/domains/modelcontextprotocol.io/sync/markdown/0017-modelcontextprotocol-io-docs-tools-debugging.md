Debugging - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
Effective debugging is essential when developing MCP servers or integrating
them with applications. This guide covers the debugging tools and approaches
available in the MCP ecosystem.
##
[​
](#debugging-tools-overview)
Debugging tools overview
MCP provides several tools for debugging at different levels:
1. **[MCP Inspector](/docs/tools/inspector)**: interactive, transport-agnostic
testing UI. Connect to stdio or Streamable HTTP servers, invoke
[tools](/specification/latest/server/tools),
[prompts](/specification/latest/server/prompts), and
[resources](/specification/latest/server/resources), and watch the
notification stream. This should be your first stop.
2. **Server logging**: structured logs to stderr (stdio transport) or via
[`notifications/message`](/specification/latest/server/utilities/logging#log-message-notifications)
(all transports).
3. **Client developer tools**: most MCP clients expose logs and connection
state. See [Debugging in Claude Desktop](#debugging-in-claude-desktop)
below for one example, or consult your client’s documentation.
##
[​
](#implementing-logging)
Implementing logging
###
[​
](#server-side-logging)
Server-side logging
When building a server that uses the local
[stdio transport](/specification/latest/basic/transports#stdio), all messages
logged to stderr (standard error) will be captured by the host application
automatically.
Local MCP servers should not log messages to stdout (standard out), as this
will interfere with protocol operation.
For servers using the
[Streamable HTTP transport](/specification/latest/basic/transports#streamable-http),
stderr is not captured by the client. Use the log message notifications below,
your own server-side log aggregation, or standard HTTP tooling (curl, browser
DevTools Network panel) to inspect requests,
[`Mcp-Session-Id` headers](/specification/latest/basic/transports#session-management),
and SSE streams.
For all [transports](/specification/latest/basic/transports), you can also
provide logging to the client by sending a log message notification:
Python
TypeScript
```
`@server.tool()
async def my\_tool(ctx: Context) -\> str:
await ctx.session.send\_log\_message(
level="info",
data="Server started successfully",
)
return "done"
`
```
MCP defines eight
[RFC 5424 severity levels](/specification/latest/server/utilities/logging#log-levels)
(`debug` through `emergency`). Clients can adjust the minimum level at runtime
via the
[`logging/setLevel`](/specification/latest/server/utilities/logging#setting-log-level)
request.
Important events to log:
* Initialization steps
* Resource access
* Tool execution
* Error conditions
* Performance metrics
##
[​
](#common-issues)
Common issues
The examples below use Claude Desktop’s
[`claude\_desktop\_config.json`](/docs/develop/connect-local-servers); the same
principles apply to any stdio-based MCP client.
###
[​
](#working-directory)
Working directory
When an MCP client launches a stdio server:
* The working directory for servers launched via the client’s config may be
undefined (like `/` on macOS) since the client could be started from
anywhere
* Always use absolute paths in your configuration and `.env` files to ensure
reliable operation
* For testing servers directly via command line, the working directory will be
where you run the command
For example in `claude\_desktop\_config.json`, use:
```
`{
"mcpServers": {
"filesystem": {
"command": "npx",
"args": [
"-y",
"@modelcontextprotocol/server-filesystem",
"/Users/username/data"
]
}
}
}
`
```
Instead of relative paths like `./data`
###
[​
](#environment-variables)
Environment variables
MCP servers launched over stdio inherit only a limited subset of environment
variables automatically (the exact set is platform-dependent).
To override the default variables or provide your own, you can specify an
`env` key in `claude\_desktop\_config.json`:
```
`{
"mcpServers": {
"myserver": {
"command": "mcp-server-myapp",
"env": {
"MYAPP\_API\_KEY": "some\_key"
}
}
}
}
`
```
###
[​
](#server-initialization)
Server initialization
Common initialization problems:
1. **Path Issues**
* Incorrect server executable path
* Missing required files
* Permission problems
* Try using an absolute path for `command`
* **Configuration Errors**
* Invalid JSON syntax
* Missing required fields
* Type mismatches
* **Environment Problems**
* Missing environment variables
* Incorrect variable values
* Permission restrictions
###
[​
](#connection-problems)
Connection problems
When servers fail to connect:
1. Check client logs
2. Verify server process is running
3. Test standalone with [Inspector](/docs/tools/inspector)
4. Verify
[protocol compatibility](/specification/latest/basic/lifecycle#version-negotiation)
5. Check
[capability negotiation](/specification/latest/basic/lifecycle#capability-negotiation):
error [`-32602`](/specification/latest/basic/lifecycle#error-handling) is
the standard JSON-RPC “Invalid params” code and is returned in many
contexts. One common cause is a server sending
[sampling](/specification/latest/client/sampling) or
[elicitation](/specification/latest/client/elicitation) requests to a
client that hasn’t declared that capability. Inspect the
[`initialize` exchange](/specification/latest/basic/lifecycle#initialization)
to verify both sides declared what you expect
##
[​
](#debugging-in-claude-desktop)
Debugging in Claude Desktop
Claude Desktop is [one of many MCP clients](/clients). It is available on
macOS and Windows.
###
[​
](#checking-server-status)
Checking server status
Click the “Add files, connectors, and more” plus icon in the chat input, then
hover over the **Connectors** menu to see connected servers and available
tools.
###
[​
](#viewing-logs)
Viewing logs
Log files are written to:
* macOS: `\~/Library/Logs/Claude`
* Windows: `%APPDATA%\\Claude\\logs`
macOS
Windows
```
`tail -n 20 -F \~/Library/Logs/Claude/mcp\*.log
`
```
The logs capture:
* Server connection events
* Configuration issues
* Runtime errors
* Message exchanges
###
[​
](#using-chrome-devtools)
Using Chrome DevTools
Access Chrome’s developer tools inside Claude Desktop to investigate
client-side errors:
1. Create a `developer\_settings.json` file with `allowDevTools` set to true:
macOS
Windows
```
`echo '{"allowDevTools": true}' \> \~/Library/Application\\ Support/Claude/developer\_settings.json
`
```
1. Open DevTools: `Command-Option-I` (macOS) or `Ctrl+Alt+I` (Windows)
Note: You’ll see two DevTools windows:
* Main content window
* App title bar window
Use the Console panel to inspect client-side errors.
Use the Network panel to inspect:
* Message payloads
* Connection timing
##
[​
](#debugging-workflow)
Debugging workflow
###
[​
](#development-cycle)
Development cycle
1. Initial Development
* Use [Inspector](/docs/tools/inspector) for basic testing
* Implement core functionality
* Add logging points
* Integration Testing
* Test in your target MCP client
* Monitor logs
* Check error handling
###
[​
](#testing-changes)
Testing changes
To test changes efficiently:
* **Configuration changes**: Restart the MCP client
* **Server code changes**: Restart the client (for Claude Desktop, fully quit
and reopen; closing the window is not enough)
* **Quick iteration**: Use [Inspector](/docs/tools/inspector) during
development
##
[​
](#best-practices)
Best practices
###
[​
](#logging-strategy)
Logging strategy
1. **Structured Logging**
* Use consistent formats
* Include context
* Add timestamps
* Track request IDs
* **Error Handling**
* Log stack traces
* Include error context
* Track error patterns
* Monitor recovery
* **Performance Tracking**
* Log operation timing
* Monitor resource usage
* Track message sizes
* Measure latency
###
[​
](#security-considerations)
Security considerations
When debugging:
1. **Sensitive Data**
* Sanitize logs
* Protect credentials
* Mask personal information
* **Access Control**
* Verify permissions
* Check authentication
* Monitor access patterns
For a full treatment of MCP attack vectors and mitigations, see
[Security Best Practices](/docs/tutorials/security/security_best_practices).
##
[​
](#getting-help)
Getting help
When encountering issues:
1. **First Steps**
* Check server logs
* Test with [Inspector](/docs/tools/inspector)
* Review configuration
* Verify environment
* **Support Channels**
* [GitHub issues](https://github.com/modelcontextprotocol/modelcontextprotocol/issues)
* [GitHub discussions](https://github.com/modelcontextprotocol/modelcontextprotocol/discussions)
* **Providing Information**
* Log excerpts
* Configuration files
* Steps to reproduce
* Environment details
##
[​
](#next-steps)
Next steps
## MCP Inspector
Learn to use the MCP Inspector
## Build an MCP server
Walk through building a server from scratch
## Connect local servers
Full claude\_desktop\_config.json reference and troubleshooting