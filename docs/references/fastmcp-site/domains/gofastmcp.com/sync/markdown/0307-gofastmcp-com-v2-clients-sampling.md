LLM Sampling - FastMCP
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
*
Advanced Features
* [
Elicitation
](/v2/clients/elicitation)
* [
Logging
](/v2/clients/logging)
* [
Progress
](/v2/clients/progress)
* [
Sampling
](/v2/clients/sampling)
* [
Background Tasks
NEW
](/v2/clients/tasks)
* [
Messages
](/v2/clients/messages)
* [
Roots
](/v2/clients/roots)
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
MCP servers can request LLM completions from clients. The client handles these requests through a sampling handler callback.
##
[​
](#sampling-handler)
Sampling Handler
Provide a `sampling\_handler` function when creating the client:
```
`from fastmcp import Client
from fastmcp.client.sampling import (
SamplingMessage,
SamplingParams,
RequestContext,
)
async def sampling\_handler(
messages: list[SamplingMessage],
params: SamplingParams,
context: RequestContext
) -\> str:
# Your LLM integration logic here
# Extract text from messages and generate a response
return "Generated response based on the messages"
client = Client(
"my\_mcp\_server.py",
sampling\_handler=sampling\_handler,
)
`
```
###
[​
](#handler-parameters)
Handler Parameters
The sampling handler receives three parameters:
## Sampling Handler Parameters
[​
](#param-sampling-message)
SamplingMessage
Sampling Message Object
Show attributes
[​
](#param-role)
role
Literal["user", "assistant"]
The role of the message.
[​
](#param-content)
content
TextContent | ImageContent | AudioContent
The content of the message.TextContent is most common, and has a `.text` attribute.
[​
](#param-sampling-params)
SamplingParams
Sampling Parameters Object
Show attributes
[​
](#param-messages)
messages
list[SamplingMessage]
The messages to sample from
[​
](#param-model-preferences)
modelPreferences
ModelPreferences | None
The server’s preferences for which model to select. The client MAY ignore
these preferences.
Show attributes
[​
](#param-hints)
hints
list[ModelHint] | None
The hints to use for model selection.
[​
](#param-cost-priority)
costPriority
float | None
The cost priority for model selection.
[​
](#param-speed-priority)
speedPriority
float | None
The speed priority for model selection.
[​
](#param-intelligence-priority)
intelligencePriority
float | None
The intelligence priority for model selection.
[​
](#param-system-prompt)
systemPrompt
str | None
An optional system prompt the server wants to use for sampling.
[​
](#param-include-context)
includeContext
IncludeContext | None
A request to include context from one or more MCP servers (including the caller), to
be attached to the prompt.
[​
](#param-temperature)
temperature
float | None
The sampling temperature.
[​
](#param-max-tokens)
maxTokens
int
The maximum number of tokens to sample.
[​
](#param-stop-sequences)
stopSequences
list[str] | None
The stop sequences to use for sampling.
[​
](#param-metadata)
metadata
dict[str, Any] | None
Optional metadata to pass through to the LLM provider.
[​
](#param-tools)
tools
list[Tool] | None
Optional list of tools the LLM can use during sampling. See [Using the OpenAI Handler](#using-the-openai-handler).
[​
](#param-tool-choice)
toolChoice
ToolChoice | None
Optional control over tool usage behavior (`auto`, `required`, or `none`).
[​
](#param-request-context)
RequestContext
Request Context Object
Show attributes
[​
](#param-request-id)
request\_id
RequestId
Unique identifier for the MCP request
##
[​
](#basic-example)
Basic Example
```
`from fastmcp import Client
from fastmcp.client.sampling import SamplingMessage, SamplingParams, RequestContext
async def basic\_sampling\_handler(
messages: list[SamplingMessage],
params: SamplingParams,
context: RequestContext
) -\> str:
# Extract message content
conversation = []
for message in messages:
content = message.content.text if hasattr(message.content, 'text') else str(message.content)
conversation.append(f"{message.role}: {content}")
# Use the system prompt if provided
system\_prompt = params.systemPrompt or "You are a helpful assistant."
# Here you would integrate with your preferred LLM service
# This is just a placeholder response
return f"Response based on conversation: {' | '.join(conversation)}"
client = Client(
"my\_mcp\_server.py",
sampling\_handler=basic\_sampling\_handler
)
`
```
If the client doesn’t provide a sampling handler, servers can optionally configure a fallback handler. See [Server Sampling](/v2/servers/sampling#sampling-fallback-handler) for details.
##
[​
](#sampling-capabilities)
Sampling Capabilities
When you provide a `sampling\_handler`, FastMCP automatically advertises full sampling capabilities to the server, including tool support. To disable tool support (for simpler handlers that don’t support tools), pass `sampling\_capabilities` explicitly:
```
`from mcp.types import SamplingCapability
client = Client(
"my\_mcp\_server.py",
sampling\_handler=basic\_handler,
sampling\_capabilities=SamplingCapability(), # No tool support
)
`
```
##
[​
](#built-in-handlers)
Built-in Handlers
FastMCP provides built-in sampling handlers for OpenAI and Anthropic APIs. These handlers support the full sampling API including tool use, handling message conversion and response formatting automatically.
###
[​
](#openai-handler)
OpenAI Handler
New in version `2.11.0`
The OpenAI handler works with OpenAI’s API and any OpenAI-compatible provider:
```
`from fastmcp import Client
from fastmcp.client.sampling.handlers.openai import OpenAISamplingHandler
client = Client(
"my\_mcp\_server.py",
sampling\_handler=OpenAISamplingHandler(default\_model="gpt-4o"),
)
`
```
For OpenAI-compatible APIs (like local models), pass a custom client:
```
`from openai import AsyncOpenAI
client = Client(
"my\_mcp\_server.py",
sampling\_handler=OpenAISamplingHandler(
default\_model="llama-3.1-70b",
client=AsyncOpenAI(base\_url="http://localhost:8000/v1"),
),
)
`
```
Install the OpenAI handler with `pip install fastmcp[openai]`.
###
[​
](#anthropic-handler)
Anthropic Handler
New in version `2.14.1`
The Anthropic handler uses Claude models via the Anthropic API:
```
`from fastmcp import Client
from fastmcp.client.sampling.handlers.anthropic import AnthropicSamplingHandler
client = Client(
"my\_mcp\_server.py",
sampling\_handler=AnthropicSamplingHandler(default\_model="claude-sonnet-4-5"),
)
`
```
You can pass a custom client for advanced configuration:
```
`from anthropic import AsyncAnthropic
client = Client(
"my\_mcp\_server.py",
sampling\_handler=AnthropicSamplingHandler(
default\_model="claude-sonnet-4-5",
client=AsyncAnthropic(), # Uses ANTHROPIC\_API\_KEY env var
),
)
`
```
Install the Anthropic handler with `pip install fastmcp[anthropic]`.
###
[​
](#tool-execution)
Tool Execution
Tool execution happens on the server side. The client’s role is to pass tools to the LLM and return the LLM’s response (which may include tool use requests). The server then executes the tools and may send follow-up sampling requests with tool results.
To implement a custom sampling handler, see the [handler source code](https://github.com/PrefectHQ/fastmcp/tree/main/src/fastmcp/client/sampling/handlers) as a reference.