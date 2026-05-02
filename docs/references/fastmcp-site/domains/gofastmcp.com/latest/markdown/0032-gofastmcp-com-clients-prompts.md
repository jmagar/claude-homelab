Getting Prompts - FastMCP
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
* [
Tools
](/clients/tools)
* [
Resources
](/clients/resources)
* [
Prompts
](/clients/prompts)
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
New in version `2.0.0`
Use this when you need to retrieve server-defined message templates for LLM interactions.
Prompts are reusable message templates exposed by MCP servers. They can accept arguments to generate personalized message sequences for LLM interactions.
##
[​
](#basic-usage)
Basic Usage
Request a rendered prompt with `get\_prompt()`:
```
`async with client:
# Simple prompt without arguments
result = await client.get\_prompt("welcome\_message")
# result -\> mcp.types.GetPromptResult
# Access the generated messages
for message in result.messages:
print(f"Role: {message.role}")
print(f"Content: {message.content}")
`
```
Pass arguments to customize the prompt:
```
`async with client:
result = await client.get\_prompt("user\_greeting", {
"name": "Alice",
"role": "administrator"
})
for message in result.messages:
print(f"Generated message: {message.content}")
`
```
##
[​
](#argument-serialization)
Argument Serialization
New in version `2.9.0`
FastMCP automatically serializes complex arguments to JSON strings as required by the MCP specification. You can pass typed objects directly:
```
`from dataclasses import dataclass
@dataclass
class UserData:
name: str
age: int
async with client:
result = await client.get\_prompt("analyze\_user", {
"user": UserData(name="Alice", age=30), # Automatically serialized
"preferences": {"theme": "dark"}, # Dict serialized
"scores": [85, 92, 78], # List serialized
"simple\_name": "Bob" # Strings unchanged
})
`
```
The client handles serialization using `pydantic\_core.to\_json()` for consistent formatting. FastMCP servers automatically deserialize these JSON strings back to the expected types.
##
[​
](#working-with-results)
Working with Results
The `get\_prompt()` method returns a `GetPromptResult` containing a list of messages:
```
`async with client:
result = await client.get\_prompt("conversation\_starter", {"topic": "climate"})
for i, message in enumerate(result.messages):
print(f"Message {i + 1}:")
print(f" Role: {message.role}")
print(f" Content: {message.content.text if hasattr(message.content, 'text') else message.content}")
`
```
Prompts can generate different message types. System messages configure LLM behavior:
```
`async with client:
result = await client.get\_prompt("system\_configuration", {
"role": "helpful assistant",
"expertise": "python programming"
})
# Access the returned messages
message = result.messages[0]
print(f"Prompt: {message.content}")
`
```
Conversation templates generate multi-turn flows:
```
`async with client:
result = await client.get\_prompt("interview\_template", {
"candidate\_name": "Alice",
"position": "Senior Developer"
})
# Multiple messages for a conversation flow
for message in result.messages:
print(f"{message.role}: {message.content}")
`
```
##
[​
](#version-selection)
Version Selection
New in version `3.0.0`
When a server exposes multiple versions of a prompt, you can request a specific version:
```
`async with client:
# Get the highest version (default)
result = await client.get\_prompt("summarize", {"text": "..."})
# Get a specific version
result\_v1 = await client.get\_prompt("summarize", {"text": "..."}, version="1.0")
`
```
See [Metadata](/servers/versioning#version-discovery) for how to discover available versions.
##
[​
](#multi-server-clients)
Multi-Server Clients
When using multi-server clients, prompts are accessible directly without prefixing:
```
`async with client: # Multi-server client
result1 = await client.get\_prompt("weather\_prompt", {"city": "London"})
result2 = await client.get\_prompt("assistant\_prompt", {"query": "help"})
`
```
##
[​
](#raw-protocol-access)
Raw Protocol Access
For complete control, use `get\_prompt\_mcp()` which returns the full MCP protocol object:
```
`async with client:
result = await client.get\_prompt\_mcp("example\_prompt", {"arg": "value"})
# result -\> mcp.types.GetPromptResult
`
```