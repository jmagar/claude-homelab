Prompts as Tools - FastMCP
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
* [
Overview
NEW
](/servers/transforms/transforms)
* [
Namespace
NEW
](/servers/transforms/namespace)
* [
Tool Transformation
NEW
](/servers/transforms/tool-transformation)
* [
Visibility
NEW
](/servers/visibility)
* [
Code Mode
NEW
](/servers/transforms/code-mode)
* [
Tool Search
NEW
](/servers/transforms/tool-search)
* [
Resources as Tools
NEW
](/servers/transforms/resources-as-tools)
* [
Prompts as Tools
NEW
](/servers/transforms/prompts-as-tools)
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
Some MCP clients only support tools. They cannot list or get prompts directly because they lack prompt protocol support. The `PromptsAsTools` transform bridges this gap by generating tools that provide access to your server’s prompts.
When you add `PromptsAsTools` to a server, it creates two tools that clients can call instead of using the prompt protocol:
* **`list\_prompts`** returns JSON describing all available prompts and their arguments
* **`get\_prompt`** renders a specific prompt with provided arguments
This means any client that can call tools can now access prompts, even if the client has no native prompt support.
##
[​
](#basic-usage)
Basic Usage
Pass your FastMCP server to `PromptsAsTools` when adding the transform. The generated tools route through the server at runtime, which means all server middleware — auth, visibility, rate limiting — applies to prompt operations automatically, exactly as it would for direct `prompts/get` calls.
`PromptsAsTools` (and `ResourcesAsTools`) should be applied to a FastMCP server instance, not a raw Provider. The generated tools call back into the server’s middleware chain at runtime, so they need a server to route through. If you want to expose only a subset of prompts, create a dedicated FastMCP server for those prompts and apply the transform there.
```
`from fastmcp import FastMCP
from fastmcp.server.transforms import PromptsAsTools
mcp = FastMCP("My Server")
@mcp.prompt
def analyze\_code(code: str, language: str = "python") -\> str:
"""Analyze code for potential issues."""
return f"Analyze this {language} code:\\n{code}"
@mcp.prompt
def explain\_concept(concept: str) -\> str:
"""Explain a programming concept."""
return f"Explain: {concept}"
# Add the transform - creates list\_prompts and get\_prompt tools
mcp.add\_transform(PromptsAsTools(mcp))
`
```
Clients now see three items: whatever tools you defined directly, plus `list\_prompts` and `get\_prompt`.
##
[​
](#listing-prompts)
Listing Prompts
The `list\_prompts` tool returns JSON with metadata for each prompt, including its arguments.
```
`result = await client.call\_tool("list\_prompts", {})
prompts = json.loads(result.data)
# [
# {
# "name": "analyze\_code",
# "description": "Analyze code for potential issues.",
# "arguments": [
# {"name": "code", "description": null, "required": true},
# {"name": "language", "description": null, "required": false}
# ]
# },
# {
# "name": "explain\_concept",
# "description": "Explain a programming concept.",
# "arguments": [
# {"name": "concept", "description": null, "required": true}
# ]
# }
#]
`
```
Each argument includes:
* `name`: The argument name
* `description`: Optional description from type hints or docstrings
* `required`: Whether the argument must be provided
##
[​
](#getting-prompts)
Getting Prompts
The `get\_prompt` tool accepts a prompt name and optional arguments dict. It returns the rendered prompt as JSON with a messages array.
```
`# Prompt with required and optional arguments
result = await client.call\_tool(
"get\_prompt",
{
"name": "analyze\_code",
"arguments": {
"code": "x = 1\\nprint(x)",
"language": "python"
}
}
)
response = json.loads(result.data)
# {
# "messages": [
# {
# "role": "user",
# "content": "Analyze this python code:\\nx = 1\\nprint(x)"
# }
# ]
# }
`
```
If a prompt has no arguments, you can omit the `arguments` field or pass an empty dict:
```
`result = await client.call\_tool(
"get\_prompt",
{"name": "simple\_prompt"}
)
`
```
##
[​
](#message-format)
Message Format
Rendered prompts return a messages array following the standard MCP format. Each message includes:
* `role`: The message role (“user” or “assistant”)
* `content`: The message text content
Multi-message prompts are supported - the array will contain all messages in order.
##
[​
](#binary-content)
Binary Content
Unlike resources, prompts always return text content. There is no binary encoding needed.