Prompts - FastMCP
Documentation
##### Get Started
* [
Welcome!
](/v2/getting-started/welcome)
* [
Installation
](/v2/getting-started/installation)
* [
Quickstart
](/v2/getting-started/quickstart)
* [
Updates
NEW
](/v2/updates)
##### Servers
* [
Overview
](/v2/servers/server)
*
Core Components
*
Advanced Features
*
Authentication
*
Deployment
##### Clients
*
Essentials
*
Core Operations
* [
Tools
](/v2/clients/tools)
* [
Resources
](/v2/clients/resources)
* [
Prompts
](/v2/clients/prompts)
*
Advanced Features
*
Authentication
##### Integrations
*
Authentication
*
Authorization
*
AI Assistants
*
AI SDKs
*
API Integration
##### Patterns
* [
Tool Transformation
](/v2/patterns/tool-transformation)
* [
Decorating Methods
](/v2/patterns/decorating-methods)
* [
CLI
](/v2/patterns/cli)
* [
Contrib Modules
](/v2/patterns/contrib)
* [
Testing
](/v2/patterns/testing)
##### Development
* [
Contributing
](/v2/development/contributing)
* [
Tests
](/v2/development/tests)
* [
Releases
](/v2/development/releases)
* [
Upgrade Guide
NEW
](/v2/development/upgrade-guide)
* [
Changelog
](/v2/changelog)
## > Documentation Index
> Fetch the complete documentation index at:
[> https://gofastmcp.com/llms.txt
](https://gofastmcp.com/llms.txt)
> Use this file to discover all available pages before exploring further.
New in version `2.0.0`
Prompts are reusable message templates exposed by MCP servers. They can accept arguments to generate personalized message sequences for LLM interactions.
##
[​
](#listing-prompts)
Listing Prompts
Use `list\_prompts()` to retrieve all available prompt templates:
```
`async with client:
prompts = await client.list\_prompts()
# prompts -\> list[mcp.types.Prompt]
for prompt in prompts:
print(f"Prompt: {prompt.name}")
print(f"Description: {prompt.description}")
if prompt.arguments:
print(f"Arguments: {[arg.name for arg in prompt.arguments]}")
# Access tags and other metadata
if hasattr(prompt, '\_meta') and prompt.\_meta:
fastmcp\_meta = prompt.\_meta.get('\_fastmcp', {})
print(f"Tags: {fastmcp\_meta.get('tags', [])}")
`
```
###
[​
](#filtering-by-tags)
Filtering by Tags
New in version `2.11.0`
You can use the `meta` field to filter prompts based on their tags:
```
`async with client:
prompts = await client.list\_prompts()
# Filter prompts by tag
analysis\_prompts = [
prompt for prompt in prompts
if hasattr(prompt, '\_meta') and prompt.\_meta and
prompt.\_meta.get('\_fastmcp', {}) and
'analysis' in prompt.\_meta.get('\_fastmcp', {}).get('tags', [])
]
print(f"Found {len(analysis\_prompts)} analysis prompts")
`
```
The `\_meta` field is part of the standard MCP specification. FastMCP servers include tags and other metadata within a `\_fastmcp` namespace (e.g., `\_meta.\_fastmcp.tags`) to avoid conflicts with user-defined metadata. This behavior can be controlled with the server’s `include\_fastmcp\_meta` setting - when disabled, the `\_fastmcp` namespace won’t be included. Other MCP server implementations may not provide this metadata structure.
##
[​
](#using-prompts)
Using Prompts
###
[​
](#basic-usage)
Basic Usage
Request a rendered prompt using `get\_prompt()` with the prompt name and arguments:
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
###
[​
](#prompts-with-arguments)
Prompts with Arguments
Pass arguments as a dictionary to customize the prompt:
```
`async with client:
# Prompt with simple arguments
result = await client.get\_prompt("user\_greeting", {
"name": "Alice",
"role": "administrator"
})
# Access the personalized messages
for message in result.messages:
print(f"Generated message: {message.content}")
`
```
##
[​
](#automatic-argument-serialization)
Automatic Argument Serialization
New in version `2.9.0`
FastMCP automatically serializes complex arguments to JSON strings as required by the MCP specification. This allows you to pass typed objects directly:
```
`from dataclasses import dataclass
@dataclass
class UserData:
name: str
age: int
async with client:
# Complex arguments are automatically serialized
result = await client.get\_prompt("analyze\_user", {
"user": UserData(name="Alice", age=30), # Automatically serialized to JSON
"preferences": {"theme": "dark"}, # Dict serialized to JSON string
"scores": [85, 92, 78], # List serialized to JSON string
"simple\_name": "Bob" # Strings passed through unchanged
})
`
```
The client handles serialization using `pydantic\_core.to\_json()` for consistent formatting. FastMCP servers can automatically deserialize these JSON strings back to the expected types.
###
[​
](#serialization-examples)
Serialization Examples
```
`async with client:
result = await client.get\_prompt("data\_analysis", {
# These will be automatically serialized to JSON strings:
"config": {
"format": "csv",
"include\_headers": True,
"delimiter": ","
},
"filters": [
{"field": "age", "operator": "\>", "value": 18},
{"field": "status", "operator": "==", "value": "active"}
],
# This remains a string:
"report\_title": "Monthly Analytics Report"
})
`
```
##
[​
](#working-with-prompt-results)
Working with Prompt Results
The `get\_prompt()` method returns a `GetPromptResult` object containing a list of messages:
```
`async with client:
result = await client.get\_prompt("conversation\_starter", {"topic": "climate"})
# Access individual messages
for i, message in enumerate(result.messages):
print(f"Message {i + 1}:")
print(f" Role: {message.role}")
print(f" Content: {message.content.text if hasattr(message.content, 'text') else message.content}")
`
```
##
[​
](#raw-mcp-protocol-access)
Raw MCP Protocol Access
For access to the complete MCP protocol objects, use the `\*\_mcp` methods:
```
`async with client:
# Raw MCP method returns full protocol object
prompts\_result = await client.list\_prompts\_mcp()
# prompts\_result -\> mcp.types.ListPromptsResult
prompt\_result = await client.get\_prompt\_mcp("example\_prompt", {"arg": "value"})
# prompt\_result -\> mcp.types.GetPromptResult
`
```
##
[​
](#multi-server-clients)
Multi-Server Clients
When using multi-server clients, prompts are accessible without prefixing (unlike tools):
```
`async with client: # Multi-server client
# Prompts from any server are directly accessible
result1 = await client.get\_prompt("weather\_prompt", {"city": "London"})
result2 = await client.get\_prompt("assistant\_prompt", {"query": "help"})
`
```
##
[​
](#common-prompt-patterns)
Common Prompt Patterns
###
[​
](#system-messages)
System Messages
Many prompts generate system messages for LLM configuration:
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
###
[​
](#conversation-templates)
Conversation Templates
Prompts can generate multi-turn conversation templates:
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
Prompt arguments and their expected types depend on the specific prompt implementation. Check the server’s documentation or use `list\_prompts()` to see available arguments for each prompt.