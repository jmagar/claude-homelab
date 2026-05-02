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
* [
Composition
](/v2/servers/composition)
* [
Context
](/v2/servers/context)
* [
Elicitation
NEW
](/v2/servers/elicitation)
* [
Icons
NEW
](/v2/servers/icons)
* [
Logging
](/v2/servers/logging)
* [
Middleware
NEW
](/v2/servers/middleware)
* [
Progress
](/v2/servers/progress)
* [
Proxy Servers
](/v2/servers/proxy)
* [
Sampling
NEW
](/v2/servers/sampling)
* [
Storage Backends
NEW
](/v2/servers/storage-backends)
* [
Background Tasks
NEW
](/v2/servers/tasks)
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
LLM sampling allows your MCP tools to request text generation from an LLM during execution. This enables tools to leverage AI capabilities for analysis, generation, reasoning, and more—without the client needing to orchestrate multiple calls.
By default, sampling requests are routed to the client’s LLM. You can also configure a fallback handler to use a specific provider (like OpenAI) when the client doesn’t support sampling, or to always use your own LLM regardless of client capabilities.
##
[​
](#method-reference)
Method Reference
## ctx.sample()
[​
](#param-ctx-sample)
ctx.sample
async method
Request text generation from the LLM, running to completion automatically.
Show Parameters
[​
](#param-messages)
messages
str | list[str | SamplingMessage]
The prompt to send. Can be a simple string or a list of messages for multi-turn conversations.
[​
](#param-system-prompt)
system\_prompt
str | None
default:"None"
Instructions that establish the LLM’s role and behavior.
[​
](#param-temperature)
temperature
float | None
default:"None"
Controls randomness (0.0 = deterministic, 1.0 = creative).
[​
](#param-max-tokens)
max\_tokens
int | None
default:"512"
Maximum tokens to generate.
[​
](#param-model-preferences)
model\_preferences
str | list[str] | None
default:"None"
Hints for which model the client should use.
[​
](#param-tools)
tools
list[Callable] | None
default:"None"
Functions the LLM can call during sampling.
[​
](#param-result-type)
result\_type
type[T] | None
default:"None"
A type for validated structured output. Supports Pydantic models, dataclasses, and basic types like `int`, `list[str]`, or `dict[str, int]`.
[​
](#param-mask-error-details)
mask\_error\_details
bool | None
default:"None"
If True, mask detailed error messages from tool execution. When None (default), uses the global `settings.mask\_error\_details` value. Tools can raise `ToolError` to bypass masking and provide specific error messages to the LLM.
Show Response
[​
](#param-sampling-resultt)
SamplingResult[T]
dataclass
* `.text`: The raw text response (or JSON for structured output)
* `.result`: The typed result—same as `.text` for plain text, or a validated Pydantic object for structured output
* `.history`: All messages exchanged during sampling
## ctx.sample\_step()
[​
](#param-ctx-sample-step)
ctx.sample\_step
async method
Make a single LLM sampling call. Use this for fine-grained control over the sampling loop.
Show Parameters
Same as `sample()`, plus:
[​
](#param-tool-choice)
tool\_choice
str | None
default:"None"
Controls tool usage: `"auto"`, `"required"`, or `"none"`.
[​
](#param-execute-tools)
execute\_tools
bool
default:"True"
If True, execute tool calls and append results to history. If False, return immediately with tool calls available for manual execution.
[​
](#param-mask-error-details-1)
mask\_error\_details
bool | None
default:"None"
If True, mask detailed error messages from tool execution. When None (default), uses the global `settings.mask\_error\_details` value. Tools can raise `ToolError` to bypass masking.
Show Response
[​
](#param-sample-step)
SampleStep
dataclass
* `.response`: The raw LLM response
* `.history`: Messages including input, assistant response, and tool results
* `.is\_tool\_use`: True if the LLM requested tool execution
* `.tool\_calls`: List of tool calls (if any)
* `.text`: The text content (if any)
##
[​
](#basic-sampling)
Basic Sampling
The simplest use of sampling is passing a prompt string to `ctx.sample()`. The method sends the prompt to the LLM, waits for the complete response, and returns a `SamplingResult`. You can access the generated text through the `.text` attribute.
```
`from fastmcp import FastMCP, Context
mcp = FastMCP()
@mcp.tool
async def summarize(content: str, ctx: Context) -\> str:
"""Generate a summary of the provided content."""
result = await ctx.sample(f"Please summarize this:\\n\\n{content}")
return result.text or ""
`
```
The `SamplingResult` also provides `.result` (identical to `.text` for plain text responses) and `.history` containing the full message exchange—useful if you need to continue the conversation or debug the interaction.
###
[​
](#system-prompts)
System Prompts
System prompts let you establish the LLM’s role and behavioral guidelines before it processes your request. This is useful for controlling tone, enforcing constraints, or providing context that shouldn’t clutter the user-facing prompt.
```
`@mcp.tool
async def generate\_code(concept: str, ctx: Context) -\> str:
"""Generate a Python code example for a concept."""
result = await ctx.sample(
messages=f"Write a Python example demonstrating '{concept}'.",
system\_prompt=(
"You are an expert Python programmer. "
"Provide concise, working code without explanations."
),
temperature=0.7,
max\_tokens=300
)
return f"```python\\n{result.text}\\n```"
`
```
The `temperature` parameter controls randomness—higher values (up to 1.0) produce more varied outputs, while lower values make responses more deterministic. The `max\_tokens` parameter limits response length.
###
[​
](#model-preferences)
Model Preferences
Model preferences let you hint at which LLM the client should use for a request. You can pass a single model name or a list of preferences in priority order. These are hints rather than requirements—the actual model used depends on what the client has available.
```
`@mcp.tool
async def technical\_analysis(data: str, ctx: Context) -\> str:
"""Analyze data using a reasoning-focused model."""
result = await ctx.sample(
messages=f"Analyze this data:\\n\\n{data}",
model\_preferences=["claude-opus-4-5", "gpt-5-2"],
temperature=0.2,
)
return result.text or ""
`
```
Use model preferences when different tasks benefit from different model characteristics. Creative writing might prefer faster models with higher temperature, while complex analysis might benefit from larger reasoning-focused models.
###
[​
](#multi-turn-conversations)
Multi-Turn Conversations
For requests that need conversational context, construct a list of `SamplingMessage` objects representing the conversation history. Each message has a `role` (“user” or “assistant”) and `content` (a `TextContent` object).
```
`from mcp.types import SamplingMessage, TextContent
@mcp.tool
async def contextual\_analysis(query: str, data: str, ctx: Context) -\> str:
"""Analyze data with conversational context."""
messages = [
SamplingMessage(
role="user",
content=TextContent(type="text", text=f"Here's my data: {data}"),
),
SamplingMessage(
role="assistant",
content=TextContent(type="text", text="I see the data. What would you like to know?"),
),
SamplingMessage(
role="user",
content=TextContent(type="text", text=query),
),
]
result = await ctx.sample(messages=messages)
return result.text or ""
`
```
The LLM receives the full conversation thread and responds with awareness of the preceding context.
##
[​
](#structured-output)
Structured Output
New in version `2.14.1`
When you need validated, typed data instead of free-form text, use the `result\_type` parameter. FastMCP ensures the LLM returns data matching your type, handling validation and retries automatically. The `result\_type` parameter accepts Pydantic models, dataclasses, and basic types like `int`, `list[str]`, or `dict[str, int]`.
```
`from pydantic import BaseModel
from fastmcp import FastMCP, Context
mcp = FastMCP()
class SentimentResult(BaseModel):
sentiment: str
confidence: float
reasoning: str
@mcp.tool
async def analyze\_sentiment(text: str, ctx: Context) -\> SentimentResult:
"""Analyze text sentiment with structured output."""
result = await ctx.sample(
messages=f"Analyze the sentiment of: {text}",
result\_type=SentimentResult,
)
return result.result # A validated SentimentResult object
`
```
When you call this tool, the LLM returns a structured response that FastMCP validates against your Pydantic model. You access the validated object through `result.result`, while `result.text` contains the JSON representation.
When you pass `result\_type`, `sample()` automatically creates a
`final\_response` tool that the LLM calls to provide its response. If
validation fails, the error is sent back to the LLM for retry. This automatic
handling only applies to `sample()`—with `sample\_step()`, you must manage
structured output yourself.
##
[​
](#sampling-with-tools)
Sampling with Tools
New in version `2.14.1`
Sampling with tools enables agentic workflows where the LLM can call functions to gather information before responding. This implements [SEP-1577](https://github.com/modelcontextprotocol/modelcontextprotocol/issues/1577), allowing the LLM to autonomously orchestrate multi-step operations.
Pass Python functions to the `tools` parameter, and FastMCP handles the execution loop automatically—calling tools, returning results to the LLM, and continuing until the LLM provides a final response.
###
[​
](#defining-tools)
Defining Tools
Define regular Python functions with type hints and docstrings. FastMCP extracts the function’s name, docstring, and parameter types to create tool schemas that the LLM can understand.
```
`from fastmcp import FastMCP, Context
def search(query: str) -\> str:
"""Search the web for information."""
return f"Results for: {query}"
def get\_time() -\> str:
"""Get the current time."""
from datetime import datetime
return datetime.now().strftime("%H:%M:%S")
mcp = FastMCP()
@mcp.tool
async def research(question: str, ctx: Context) -\> str:
"""Answer questions using available tools."""
result = await ctx.sample(
messages=question,
tools=[search, get\_time],
)
return result.text or ""
`
```
The LLM sees each function’s signature and docstring, using this information to decide when and how to call them. Tool errors are caught and sent back to the LLM, allowing it to recover gracefully. An internal safety limit prevents infinite loops.
###
[​
](#tool-error-handling)
Tool Error Handling
By default, when a sampling tool raises an exception, the error message (including details) is sent back to the LLM so it can attempt recovery. To prevent sensitive information from leaking to the LLM, use the `mask\_error\_details` parameter:
```
`result = await ctx.sample(
messages=question,
tools=[search],
mask\_error\_details=True, # Generic error messages only
)
`
```
When `mask\_error\_details=True`, tool errors become generic messages like `"Error executing tool 'search'"` instead of exposing stack traces or internal details.
To intentionally provide specific error messages to the LLM regardless of masking, raise `ToolError`:
```
`from fastmcp.exceptions import ToolError
def search(query: str) -\> str:
"""Search for information."""
if not query.strip():
raise ToolError("Search query cannot be empty")
return f"Results for: {query}"
`
```
`ToolError` messages always pass through to the LLM, making it the escape hatch for errors you want the LLM to see and handle.
For custom names or descriptions, use `SamplingTool.from\_function()`:
```
`from fastmcp.server.sampling import SamplingTool
tool = SamplingTool.from\_function(
my\_func,
name="custom\_name",
description="Custom description"
)
result = await ctx.sample(messages="...", tools=[tool])
`
```
###
[​
](#combining-with-structured-output)
Combining with Structured Output
Combine tools with `result\_type` for agentic workflows that return validated, structured data. The LLM uses your tools to gather information, then returns a response matching your type.
```
`result = await ctx.sample(
messages="Research Python async patterns",
tools=[search, fetch\_url],
result\_type=ResearchResult,
)
`
```
##
[​
](#loop-control)
Loop Control
New in version `2.14.1`
While `sample()` handles the tool execution loop automatically, some scenarios require fine-grained control over each step. The `sample\_step()` method makes a single LLM call and returns a `SampleStep` containing the response and updated history.
Unlike `sample()`, `sample\_step()` is stateless—it doesn’t remember previous calls. You control the conversation by passing the full message history each time. The returned `step.history` includes all messages up through the current response, making it easy to continue the loop.
Use `sample\_step()` when you need to:
* Inspect tool calls before they execute
* Implement custom termination conditions
* Add logging, metrics, or checkpointing between steps
* Build custom agentic loops with domain-specific logic
###
[​
](#using-sample_step)
Using sample\_step()
By default, `sample\_step()` executes any tool calls and includes the results in the history. Call it in a loop, passing the updated history each time, until a stop condition is met.
```
`from mcp.types import SamplingMessage
@mcp.tool
async def controlled\_agent(question: str, ctx: Context) -\> str:
"""Agent with manual loop control."""
messages: list[str | SamplingMessage] = [question] # strings auto-convert
while True:
step = await ctx.sample\_step(
messages=messages,
tools=[search, get\_time],
)
if step.is\_tool\_use:
# Tools already executed (execute\_tools=True by default)
# Log what was called before continuing
for call in step.tool\_calls:
print(f"Called tool: {call.name}")
if not step.is\_tool\_use:
return step.text or ""
# Continue with updated history
messages = step.history
`
```
###
[​
](#samplestep-properties)
SampleStep Properties
Each `SampleStep` provides information about what the LLM returned:
* `step.is\_tool\_use` — True if the LLM requested tool calls
* `step.tool\_calls` — List of tool calls requested (if any)
* `step.text` — The text content (if any)
* `step.history` — All messages exchanged so far
The contents of `step.history` depend on `execute\_tools`:
* **`execute\_tools=True`** (default): Includes tool results, ready for the next iteration
* **`execute\_tools=False`**: Includes the assistant’s tool request, but you add results yourself
###
[​
](#manual-tool-execution)
Manual Tool Execution
Set `execute\_tools=False` to handle tool execution yourself. When disabled, `step.history` contains the user message and the assistant’s response with tool calls—but no tool results. You execute the tools and append the results as a user message.
```
`from mcp.types import SamplingMessage, ToolResultContent, TextContent
from fastmcp import FastMCP, Context
mcp = FastMCP()
@mcp.tool
async def research(question: str, ctx: Context) -\> str:
"""Research with manual tool handling."""
def search(query: str) -\> str:
return f"Results for: {query}"
def get\_time() -\> str:
return "12:00 PM"
# Map tool names to functions
tools = {"search": search, "get\_time": get\_time}
messages: list[SamplingMessage] = [question] # strings are converted automatically
while True:
step = await ctx.sample\_step(
messages=messages,
tools=list(tools.values()),
execute\_tools=False,
)
if not step.is\_tool\_use:
return step.text or ""
# Execute tools and collect results
tool\_results = []
for call in step.tool\_calls:
fn = tools[call.name]
result = fn(\*\*call.input)
tool\_results.append(
ToolResultContent(
type="tool\_result",
toolUseId=call.id,
content=[TextContent(type="text", text=result)],
)
)
messages = list(step.history)
messages.append(SamplingMessage(role="user", content=tool\_results))
`
```
####
[​
](#error-handling)
Error Handling
To report an error, set `isError=True`. The LLM will see the error and can decide how to proceed:
```
`tool\_result = ToolResultContent(
type="tool\_result",
toolUseId=call.id,
content=[TextContent(type="text", text="Permission denied")],
isError=True,
)
`
```
##
[​
](#fallback-handlers)
Fallback Handlers
Client support for sampling is optional—some clients may not implement it. To ensure your tools work regardless of client capabilities, configure a `sampling\_handler` that sends requests directly to an LLM provider.
FastMCP provides built-in handlers for [OpenAI and Anthropic APIs](/v2/clients/sampling#built-in-handlers). These handlers support the full sampling API including tools, automatically converting your Python functions to each provider’s format.
Install handlers with `pip install fastmcp[openai]` or `pip install fastmcp[anthropic]`.
```
`from fastmcp import FastMCP
from fastmcp.client.sampling.handlers.openai import OpenAISamplingHandler
server = FastMCP(
name="My Server",
sampling\_handler=OpenAISamplingHandler(default\_model="gpt-4o-mini"),
sampling\_handler\_behavior="fallback",
)
`
```
Or with Anthropic:
```
`from fastmcp import FastMCP
from fastmcp.client.sampling.handlers.anthropic import AnthropicSamplingHandler
server = FastMCP(
name="My Server",
sampling\_handler=AnthropicSamplingHandler(default\_model="claude-sonnet-4-5"),
sampling\_handler\_behavior="fallback",
)
`
```
###
[​
](#behavior-modes)
Behavior Modes
The `sampling\_handler\_behavior` parameter controls when the handler is used:
* **`"fallback"`** (default): Use the handler only when the client doesn’t support sampling. This lets capable clients use their own LLM while ensuring your tools still work with clients that lack sampling support.
* **`"always"`**: Always use the handler, bypassing the client entirely. Use this when you need guaranteed control over which LLM processes requests—for cost control, compliance requirements, or when specific model characteristics are essential.
Sampling with tools requires the client to advertise the `sampling.tools`
capability. FastMCP clients do this automatically. For external clients that
don’t support tool-enabled sampling, configure a fallback handler with
`sampling\_handler\_behavior="always"`.