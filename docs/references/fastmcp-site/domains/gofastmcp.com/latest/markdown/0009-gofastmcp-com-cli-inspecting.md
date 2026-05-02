Inspecting Servers - FastMCP
Documentation
##### Get Started
* [
Welcome!
](/getting-started/welcome)
* [
Installation
](/getting-started/installation)
* [
Quickstart
](/getting-started/quickstart)
##### Servers
* [
Overview
](/servers/server)
*
Core Components
*
FeaturesUPDATED
*
Providers
*
Transforms
*
Auth
*
Deployment
##### Apps
* [
Overview
NEW
](/apps/overview)
* [
Quickstart
NEW
](/apps/quickstart)
* [
Examples
NEW
](/apps/examples)
*
Building AppsNEW
*
ProvidersNEW
*
AdvancedNEW
##### Clients
* [
Overview
](/clients/client)
* [
Transports
](/clients/transports)
*
Core Operations
*
HandlersUPDATED
*
AuthenticationUPDATED
##### Integrations
*
Auth
*
Web Frameworks
*
AI Assistants
*
AI SDKs
* [
MCP.json
](/integrations/mcp-json-configuration)
##### CLI
* [
Overview
](/cli/overview)
* [
Running
](/cli/running)
* [
Install MCPs
](/cli/install-mcp)
* [
Inspecting
](/cli/inspecting)
* [
Client
](/cli/client)
* [
Generate CLI
](/cli/generate-cli)
* [
Auth
](/cli/auth)
##### More
* [
Settings
](/more/settings)
*
Upgrading
*
Development
*
What's New
## > Documentation Index
> Fetch the complete documentation index at:
[> https://gofastmcp.com/llms.txt
](https://gofastmcp.com/llms.txt)
> Use this file to discover all available pages before exploring further.
New in version `2.9.0`
`fastmcp inspect` loads a server and reports what it contains — its tools, resources, prompts, version, and metadata. The default output is a human-readable summary:
```
`fastmcp inspect server.py
`
```
```
`Server: MyServer
Instructions: A helpful MCP server
Version: 1.0.0
Components:
Tools: 5
Prompts: 2
Resources: 3
Templates: 1
Environment:
FastMCP: 2.0.0
MCP: 1.0.0
Use --format [fastmcp|mcp] for complete JSON output
`
```
##
[​
](#json-output)
JSON Output
For programmatic use, two JSON formats are available:
**FastMCP format** (`--format fastmcp`) includes everything FastMCP knows about the server — tool tags, enabled status, output schemas, annotations, and custom metadata. Field names use `snake\_case`. This is the format for debugging and introspecting FastMCP servers.
**MCP protocol format** (`--format mcp`) shows exactly what MCP clients see through the protocol — only standard MCP fields, `camelCase` names, no FastMCP-specific extensions. This is the format for verifying client compatibility and debugging what clients actually receive.
```
`# Full FastMCP metadata to stdout
fastmcp inspect server.py --format fastmcp
# MCP protocol view saved to file
fastmcp inspect server.py --format mcp -o manifest.json
`
```
##
[​
](#options)
Options
|Option|Flag|Description|
|Format|`--format`, `-f`|`fastmcp` or `mcp` (required when using `-o`)|
|Output File|`--output`, `-o`|Save to file instead of stdout|
##
[​
](#entrypoints)
Entrypoints
The `inspect` command supports the same local entrypoints as [`fastmcp run`](/cli/running): inferred instances, explicit entrypoints, factory functions, and `fastmcp.json` configs.
```
`fastmcp inspect server.py # inferred instance
fastmcp inspect server.py:my\_server # explicit entrypoint
fastmcp inspect server.py:create\_server # factory function
fastmcp inspect fastmcp.json # config file
`
```
`inspect` only works with local files and `fastmcp.json` — it doesn’t connect to remote URLs or standard MCP config files.