Client Commands - FastMCP
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
New in version `3.0.0`
The CLI can act as an MCP client — connecting to any server (local or remote) to list what it exposes and call its tools directly. This is useful for development, debugging, scripting, and giving shell-capable LLM agents access to MCP servers.
##
[​
](#listing-tools)
Listing Tools
`fastmcp list` connects to a server and prints its tools as function signatures, showing parameter names, types, and descriptions at a glance:
```
`fastmcp list http://localhost:8000/mcp
fastmcp list server.py
fastmcp list weather # name-based resolution
`
```
When you need the full JSON Schema for a tool’s inputs or outputs — for understanding nested objects, enum constraints, or complex types — opt in with `--input-schema` or `--output-schema`:
```
`fastmcp list server.py --input-schema
`
```
###
[​
](#resources-and-prompts)
Resources and Prompts
By default, only tools are shown. Add `--resources` or `--prompts` to include those:
```
`fastmcp list server.py --resources --prompts
`
```
###
[​
](#machine-readable-output)
Machine-Readable Output
The `--json` flag switches to structured JSON with full schemas included. This is the format to use when feeding tool definitions to an LLM or building automation:
```
`fastmcp list server.py --json
`
```
###
[​
](#options)
Options
|Option|Flag|Description|
|Command|`--command`|Connect via stdio (e.g., `'npx -y @mcp/server'`)|
|Transport|`--transport`, `-t`|Force `http` or `sse` for URL targets|
|Resources|`--resources`|Include resources in output|
|Prompts|`--prompts`|Include prompts in output|
|Input Schema|`--input-schema`|Show full input schemas|
|Output Schema|`--output-schema`|Show full output schemas|
|JSON|`--json`|Structured JSON output|
|Timeout|`--timeout`|Connection timeout in seconds|
|Auth|`--auth`|`oauth` (default for HTTP), a bearer token, or `none`|
##
[​
](#calling-tools)
Calling Tools
`fastmcp call` invokes a single tool on a server. Pass arguments as `key=value` pairs — the CLI fetches the tool’s schema and coerces your string values to the right types automatically:
```
`fastmcp call server.py greet name=World
fastmcp call http://localhost:8000/mcp search query=hello limit=5
`
```
Type coercion is schema-driven: `"5"` becomes the integer `5` when the schema expects an integer. Booleans accept `true`/`false`, `yes`/`no`, and `1`/`0`. Arrays and objects are parsed as JSON.
###
[​
](#complex-arguments)
Complex Arguments
For tools with nested or structured parameters, `key=value` syntax gets awkward. Pass a single JSON object instead:
```
`fastmcp call server.py create\_item '{"name": "Widget", "tags": ["sale"], "metadata": {"color": "blue"}}'
`
```
Or use `--input-json` to provide a base dictionary, then override individual keys with `key=value` pairs:
```
`fastmcp call server.py search --input-json '{"query": "hello", "limit": 5}' limit=10
`
```
###
[​
](#error-handling)
Error Handling
If you misspell a tool name, the CLI suggests corrections via fuzzy matching. Missing required arguments produce a clear message with the tool’s signature as a reminder. Tool execution errors are printed with a non-zero exit code, making the CLI straightforward to use in scripts.
###
[​
](#structured-output)
Structured Output
`--json` emits the raw result including content blocks, error status, and structured content:
```
`fastmcp call server.py get\_weather city=London --json
`
```
###
[​
](#interactive-elicitation)
Interactive Elicitation
Some tools request additional input during execution through MCP’s elicitation mechanism. When this happens, the CLI prompts you in the terminal — showing each field’s name, type, and whether it’s required. You can type `decline` to skip a question or `cancel` to abort the call entirely.
###
[​
](#options-2)
Options
|Option|Flag|Description|
|Command|`--command`|Connect via stdio|
|Transport|`--transport`, `-t`|Force `http` or `sse`|
|Input JSON|`--input-json`|Base arguments as JSON (merged with `key=value`)|
|JSON|`--json`|Raw JSON output|
|Timeout|`--timeout`|Connection timeout in seconds|
|Auth|`--auth`|`oauth`, a bearer token, or `none`|
##
[​
](#discovering-configured-servers)
Discovering Configured Servers
`fastmcp discover` scans your machine for MCP servers configured in editors and tools. It checks:
* **Claude Desktop** — `claude\_desktop\_config.json`
* **Claude Code** — `\~/.claude.json`
* **Cursor** — `.cursor/mcp.json` (walks up from current directory)
* **Gemini CLI** — `\~/.gemini/settings.json`
* **Goose** — `\~/.config/goose/config.yaml`
* **Project** — `./mcp.json` in the current directory
```
`fastmcp discover
`
```
The output groups servers by source, showing each server’s name and transport. Filter by source or get machine-readable output:
```
`fastmcp discover --source claude-code
fastmcp discover --source cursor --source gemini --json
`
```
Any server that appears here can be used by name with `list`, `call`, and other commands — so you can go from “I have a server in Claude Code” to querying it without copying URLs or paths.
##
[​
](#llm-agent-integration)
LLM Agent Integration
For LLM agents that can execute shell commands but don’t have native MCP support, the CLI provides a clean bridge. The agent calls `fastmcp list --json` to discover available tools with full schemas, then `fastmcp call --json` to invoke them with structured results.
Because the CLI handles connection management, transport selection, and type coercion internally, the agent doesn’t need to understand MCP protocol details — it just reads JSON and constructs shell commands.