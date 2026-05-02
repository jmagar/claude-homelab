LLM Sampling - FastMCP
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
* [
Notifications
](/clients/notifications)
* [
Sampling
](/clients/sampling)
* [
Elicitation
](/clients/elicitation)
* [
Tasks
NEW
](/clients/tasks)
* [
Progress
](/clients/progress)
* [
Logging
](/clients/logging)
* [
Roots
](/clients/roots)
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
Use this when you need to respond to server requests for LLM completions.
MCP servers can request LLM completions from clients during tool execution. This enables servers to delegate AI reasoning to the client, which controls which LLM is used and how requests are made.
##
[​
](#handler-template)
Handler Template
```
`from fastmcp import Client
from fastmcp.client.sampling import SamplingMessage, SamplingParams, RequestContext
async def sampling\_handler(
messages: list[SamplingMessage],
params: SamplingParams,
context: RequestContext
) -\> str:
"""
Handle server requests for LLM completions.
Args:
messages: Conversation messages to send to the LLM
params: Sampling parameters (temperature, max\_tokens, etc.)
context: Request context with metadata
Returns:
Generated text response from your LLM
"""
# Extract message content
conversation = []
for message in messages:
content = message.content.text if hasattr(message.content, 'text') else str(message.content)
conversation.append(f"{message.role}: {content}")
# Use the system prompt if provided
system\_prompt = params.systemPrompt or "You are a helpful assistant."
# Integrate with your LLM service here
return "Generated response based on the messages"
client = Client(
"my\_mcp\_server.py",
sampling\_handler=sampling\_handler,
)
`
```
##
[​
](#handler-parameters)
Handler Parameters
## SamplingMessage
[​
](#param-role)
role
Literal["user", "assistant"]
The role of the message
[​
](#param-content)
content
TextContent | ImageContent | AudioContent
The content of the message. TextContent has a `.text` attribute.
## SamplingParams
[​
](#param-system-prompt)
systemPrompt
str | None
Optional system prompt the server wants to use
[​
](#param-model-preferences)
modelPreferences
ModelPreferences | None
Server preferences for model selection (hints, cost/speed/intelligence priorities)
[​
](#param-temperature)
temperature
float | None
Sampling temperature
[​
](#param-max-tokens)
maxTokens
int
Maximum tokens to generate
[​
](#param-stop-sequences)
stopSequences
list[str] | None
Stop sequences for sampling
[​
](#param-tools)
tools
list[Tool] | None
Tools the LLM can use during sampling
[​
](#param-tool-choice)
toolChoice
ToolChoice | None
Tool usage behavior (`auto`, `required`, or `none`)
##
[​
](#built-in-handlers)
Built-in Handlers
FastMCP provides built-in handlers for OpenAI, Anthropic, and Google Gemini APIs that support the full sampling API including tool use.
###
[​
](#openai-handler)
OpenAI Handler
New in version `2.11.0`
```
`from fastmcp import Client
from fastmcp.client.sampling.handlers.openai import OpenAISamplingHandler
client = Client(
"my\_mcp\_server.py",
sampling\_handler=OpenAISamplingHandler(default\_model="gpt-4o"),
)
`
```
For OpenAI-compatible APIs (like local models):
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
```
`from fastmcp import Client
from fastmcp.client.sampling.handlers.anthropic import AnthropicSamplingHandler
client = Client(
"my\_mcp\_server.py",
sampling\_handler=AnthropicSamplingHandler(default\_model="claude-sonnet-4-5"),
)
`
```
Install the Anthropic handler with `pip install fastmcp[anthropic]`.
###
[​
](#google-gemini-handler)
Google Gemini Handler
New in version `3.1.0`
```
`from fastmcp import Client
from fastmcp.client.sampling.handlers.google\_genai import GoogleGenAISamplingHandler
client = Client(
"my\_mcp\_server.py",
sampling\_handler=GoogleGenAISamplingHandler(default\_model="gemini-2.0-flash"),
)
`
```
Install the Google Gemini handler with `pip install fastmcp[gemini]`.
##
[​
](#sampling-capabilities)
Sampling Capabilities
When you provide a `sampling\_handler`, FastMCP automatically advertises full sampling capabilities to the server, including tool support. To disable tool support for simpler handlers:
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
](#tool-execution)
Tool Execution
Tool execution happens on the server side. The client’s role is to pass tools to the LLM and return the LLM’s response (which may include tool use requests). The server then executes the tools and may send follow-up sampling requests with tool results.
To implement a custom sampling handler, see the [handler source code](https://github.com/PrefectHQ/fastmcp/tree/main/src/fastmcp/client/sampling/handlers) as a reference.