mcp\_config - FastMCP
SDK Reference
* [Python SDK](/python-sdk/fastmcp-decorators)
* [
decorators
](/python-sdk/fastmcp-decorators)
* [
dependencies
](/python-sdk/fastmcp-dependencies)
* [
exceptions
](/python-sdk/fastmcp-exceptions)
* [
mcp\_config
](/python-sdk/fastmcp-mcp_config)
* [
settings
](/python-sdk/fastmcp-settings)
* [
telemetry
](/python-sdk/fastmcp-telemetry)
* [
types
](/python-sdk/fastmcp-types)
##### fastmcp.apps
* [
\_\_init\_\_
](/python-sdk/fastmcp-apps-__init__)
* [
app
](/python-sdk/fastmcp-apps-app)
* [
approval
](/python-sdk/fastmcp-apps-approval)
* [
choice
](/python-sdk/fastmcp-apps-choice)
* [
config
](/python-sdk/fastmcp-apps-config)
* [
file\_upload
](/python-sdk/fastmcp-apps-file_upload)
* [
form
](/python-sdk/fastmcp-apps-form)
* [
generative
](/python-sdk/fastmcp-apps-generative)
##### fastmcp.cli
* [
\_\_init\_\_
](/python-sdk/fastmcp-cli-__init__)
* [
apps\_dev
](/python-sdk/fastmcp-cli-apps_dev)
* [
auth
](/python-sdk/fastmcp-cli-auth)
* [
cimd
](/python-sdk/fastmcp-cli-cimd)
* [
cli
](/python-sdk/fastmcp-cli-cli)
* [
client
](/python-sdk/fastmcp-cli-client)
* [
discovery
](/python-sdk/fastmcp-cli-discovery)
* [
generate
](/python-sdk/fastmcp-cli-generate)
*
install
* [
run
](/python-sdk/fastmcp-cli-run)
* [
tasks
](/python-sdk/fastmcp-cli-tasks)
##### fastmcp.client
* [
\_\_init\_\_
](/python-sdk/fastmcp-client-__init__)
*
auth
* [
client
](/python-sdk/fastmcp-client-client)
* [
elicitation
](/python-sdk/fastmcp-client-elicitation)
* [
logging
](/python-sdk/fastmcp-client-logging)
* [
messages
](/python-sdk/fastmcp-client-messages)
*
mixins
* [
oauth\_callback
](/python-sdk/fastmcp-client-oauth_callback)
* [
progress
](/python-sdk/fastmcp-client-progress)
* [
roots
](/python-sdk/fastmcp-client-roots)
*
sampling
* [
tasks
](/python-sdk/fastmcp-client-tasks)
* [
telemetry
](/python-sdk/fastmcp-client-telemetry)
*
transports
##### fastmcp.experimental
* [
\_\_init\_\_
](/python-sdk/fastmcp-experimental-__init__)
*
sampling
*
transforms
##### fastmcp.prompts
* [
\_\_init\_\_
](/python-sdk/fastmcp-prompts-__init__)
* [
base
](/python-sdk/fastmcp-prompts-base)
* [
function\_prompt
](/python-sdk/fastmcp-prompts-function_prompt)
##### fastmcp.resources
* [
\_\_init\_\_
](/python-sdk/fastmcp-resources-__init__)
* [
base
](/python-sdk/fastmcp-resources-base)
* [
function\_resource
](/python-sdk/fastmcp-resources-function_resource)
* [
template
](/python-sdk/fastmcp-resources-template)
* [
types
](/python-sdk/fastmcp-resources-types)
##### fastmcp.server
* [
\_\_init\_\_
](/python-sdk/fastmcp-server-__init__)
* [
app
](/python-sdk/fastmcp-server-app)
* [
apps
](/python-sdk/fastmcp-server-apps)
*
auth
* [
context
](/python-sdk/fastmcp-server-context)
* [
dependencies
](/python-sdk/fastmcp-server-dependencies)
* [
elicitation
](/python-sdk/fastmcp-server-elicitation)
* [
event\_store
](/python-sdk/fastmcp-server-event_store)
* [
http
](/python-sdk/fastmcp-server-http)
* [
lifespan
](/python-sdk/fastmcp-server-lifespan)
* [
low\_level
](/python-sdk/fastmcp-server-low_level)
*
middleware
*
mixins
*
openapi
*
providers
* [
proxy
](/python-sdk/fastmcp-server-proxy)
*
sampling
* [
server
](/python-sdk/fastmcp-server-server)
*
tasks
* [
telemetry
](/python-sdk/fastmcp-server-telemetry)
*
transforms
##### fastmcp.tools
* [
\_\_init\_\_
](/python-sdk/fastmcp-tools-__init__)
* [
base
](/python-sdk/fastmcp-tools-base)
* [
function\_parsing
](/python-sdk/fastmcp-tools-function_parsing)
* [
function\_tool
](/python-sdk/fastmcp-tools-function_tool)
* [
tool\_transform
](/python-sdk/fastmcp-tools-tool_transform)
##### fastmcp.utilities
* [
\_\_init\_\_
](/python-sdk/fastmcp-utilities-__init__)
* [
async\_utils
](/python-sdk/fastmcp-utilities-async_utils)
* [
auth
](/python-sdk/fastmcp-utilities-auth)
* [
cli
](/python-sdk/fastmcp-utilities-cli)
* [
components
](/python-sdk/fastmcp-utilities-components)
* [
exceptions
](/python-sdk/fastmcp-utilities-exceptions)
* [
http
](/python-sdk/fastmcp-utilities-http)
* [
inspect
](/python-sdk/fastmcp-utilities-inspect)
* [
json\_schema
](/python-sdk/fastmcp-utilities-json_schema)
* [
json\_schema\_type
](/python-sdk/fastmcp-utilities-json_schema_type)
* [
lifespan
](/python-sdk/fastmcp-utilities-lifespan)
* [
logging
](/python-sdk/fastmcp-utilities-logging)
*
mcp\_server\_config
* [
mime
](/python-sdk/fastmcp-utilities-mime)
*
openapi
* [
pagination
](/python-sdk/fastmcp-utilities-pagination)
* [
skills
](/python-sdk/fastmcp-utilities-skills)
* [
tests
](/python-sdk/fastmcp-utilities-tests)
* [
timeout
](/python-sdk/fastmcp-utilities-timeout)
* [
token\_cache
](/python-sdk/fastmcp-utilities-token_cache)
* [
types
](/python-sdk/fastmcp-utilities-types)
* [
ui
](/python-sdk/fastmcp-utilities-ui)
* [
version\_check
](/python-sdk/fastmcp-utilities-version_check)
* [
versions
](/python-sdk/fastmcp-utilities-versions)
## > Documentation Index
> Fetch the complete documentation index at:
[> https://gofastmcp.com/llms.txt
](https://gofastmcp.com/llms.txt)
> Use this file to discover all available pages before exploring further.
#
[​
](#fastmcp-mcp_config)
`fastmcp.mcp\_config`
Canonical MCP Configuration Format.
This module defines the standard configuration format for Model Context Protocol (MCP) servers.
It provides a client-agnostic, extensible format that can be used across all MCP implementations.
The configuration format supports both stdio and remote (HTTP/SSE) transports, with comprehensive
field definitions for server metadata, authentication, and execution parameters.
Example configuration:
```
`{
"mcpServers": {
"my-server": {
"command": "npx",
"args": ["-y", "@my/mcp-server"],
"env": {"API\_KEY": "secret"},
"timeout": 30000,
"description": "My MCP server"
}
}
}
`
```
##
[​
](#functions)
Functions
###
[​
](#infer_transport_type_from_url)
`infer\_transport\_type\_from\_url` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/mcp_config.py#L56)
```
`infer\_transport\_type\_from\_url(url: str | AnyUrl) -\> Literal['http', 'sse']
`
```
Infer the appropriate transport type from the given URL.
###
[​
](#update_config_file)
`update\_config\_file` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/mcp_config.py#L345)
```
`update\_config\_file(file\_path: Path, server\_name: str, server\_config: CanonicalMCPServerTypes) -\> None
`
```
Update an MCP configuration file from a server object, preserving existing fields.
This is used for updating the mcpServer configurations of third-party tools so we do not
worry about transforming server objects here.
##
[​
](#classes)
Classes
###
[​
](#stdiomcpserver)
`StdioMCPServer` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/mcp_config.py#L155)
MCP server configuration for stdio transport.
This is the canonical configuration format for MCP servers using stdio transport.
**Methods:**
####
[​
](#to_transport)
`to\_transport` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/mcp_config.py#L188)
```
`to\_transport(self) -\> StdioTransport
`
```
###
[​
](#transformingstdiomcpserver)
`TransformingStdioMCPServer` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/mcp_config.py#L200)
A Stdio server with tool transforms.
###
[​
](#remotemcpserver)
`RemoteMCPServer` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/mcp_config.py#L204)
MCP server configuration for HTTP/SSE transport.
This is the canonical configuration format for MCP servers using remote transports.
**Methods:**
####
[​
](#to_transport-2)
`to\_transport` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/mcp_config.py#L240)
```
`to\_transport(self) -\> StreamableHttpTransport | SSETransport
`
```
###
[​
](#transformingremotemcpserver)
`TransformingRemoteMCPServer` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/mcp_config.py#L265)
A Remote server with tool transforms.
###
[​
](#mcpconfig)
`MCPConfig` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/mcp_config.py#L276)
A configuration object for MCP Servers that conforms to the canonical MCP configuration format
while adding additional fields for enabling FastMCP-specific features like tool transformations
and filtering by tags.
For an MCPConfig that is strictly canonical, see the `CanonicalMCPConfig` class.
**Methods:**
####
[​
](#wrap_servers_at_root)
`wrap\_servers\_at\_root` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/mcp_config.py#L290)
```
`wrap\_servers\_at\_root(cls, values: dict[str, Any]) -\> dict[str, Any]
`
```
If there’s no mcpServers key but there are server configs at root, wrap them.
####
[​
](#add_server)
`add\_server` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/mcp_config.py#L303)
```
`add\_server(self, name: str, server: MCPServerTypes) -\> None
`
```
Add or update a server in the configuration.
####
[​
](#from_dict)
`from\_dict` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/mcp_config.py#L308)
```
`from\_dict(cls, config: dict[str, Any]) -\> Self
`
```
Parse MCP configuration from dictionary format.
####
[​
](#to_dict)
`to\_dict` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/mcp_config.py#L312)
```
`to\_dict(self) -\> dict[str, Any]
`
```
Convert MCPConfig to dictionary format, preserving all fields.
####
[​
](#write_to_file)
`write\_to\_file` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/mcp_config.py#L316)
```
`write\_to\_file(self, file\_path: Path) -\> None
`
```
Write configuration to JSON file.
####
[​
](#from_file)
`from\_file` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/mcp_config.py#L322)
```
`from\_file(cls, file\_path: Path) -\> Self
`
```
Load configuration from JSON file.
###
[​
](#canonicalmcpconfig)
`CanonicalMCPConfig` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/mcp_config.py#L330)
Canonical MCP configuration format.
This defines the standard configuration format for Model Context Protocol servers.
The format is designed to be client-agnostic and extensible for future use cases.
**Methods:**
####
[​
](#add_server-2)
`add\_server` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/mcp_config.py#L340)
```
`add\_server(self, name: str, server: CanonicalMCPServerTypes) -\> None
`
```
Add or update a server in the configuration.