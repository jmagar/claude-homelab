AI SDK Core: Tool Calling
[](https://vercel.com/oss)
Menu
v6 (Latest)
AI SDK 6.x
[AI SDK by Vercel](/docs/introduction)
[Foundations](/docs/foundations)
[Overview](/docs/foundations/overview)
[Providers and Models](/docs/foundations/providers-and-models)
[Prompts](/docs/foundations/prompts)
[Tools](/docs/foundations/tools)
[Streaming](/docs/foundations/streaming)
[Provider Options](/docs/foundations/provider-options)
[Getting Started](/docs/getting-started)
[Choosing a Provider](/docs/getting-started/choosing-a-provider)
[Navigating the Library](/docs/getting-started/navigating-the-library)
[Next.js App Router](/docs/getting-started/nextjs-app-router)
[Next.js Pages Router](/docs/getting-started/nextjs-pages-router)
[Svelte](/docs/getting-started/svelte)
[Vue.js (Nuxt)](/docs/getting-started/nuxt)
[Node.js](/docs/getting-started/nodejs)
[Expo](/docs/getting-started/expo)
[TanStack Start](/docs/getting-started/tanstack-start)
[Coding Agents](/docs/getting-started/coding-agents)
[Agents](/docs/agents)
[Overview](/docs/agents/overview)
[Building Agents](/docs/agents/building-agents)
[Workflow Patterns](/docs/agents/workflows)
[Loop Control](/docs/agents/loop-control)
[Configuring Call Options](/docs/agents/configuring-call-options)
[Memory](/docs/agents/memory)
[Subagents](/docs/agents/subagents)
[AI SDK Core](/docs/ai-sdk-core)
[Overview](/docs/ai-sdk-core/overview)
[Generating Text](/docs/ai-sdk-core/generating-text)
[Generating Structured Data](/docs/ai-sdk-core/generating-structured-data)
[Tool Calling](/docs/ai-sdk-core/tools-and-tool-calling)
[Model Context Protocol (MCP)](/docs/ai-sdk-core/mcp-tools)
[Prompt Engineering](/docs/ai-sdk-core/prompt-engineering)
[Settings](/docs/ai-sdk-core/settings)
[Embeddings](/docs/ai-sdk-core/embeddings)
[Reranking](/docs/ai-sdk-core/reranking)
[Image Generation](/docs/ai-sdk-core/image-generation)
[Transcription](/docs/ai-sdk-core/transcription)
[Speech](/docs/ai-sdk-core/speech)
[Video Generation](/docs/ai-sdk-core/video-generation)
[Language Model Middleware](/docs/ai-sdk-core/middleware)
[Provider & Model Management](/docs/ai-sdk-core/provider-management)
[Error Handling](/docs/ai-sdk-core/error-handling)
[Testing](/docs/ai-sdk-core/testing)
[Telemetry](/docs/ai-sdk-core/telemetry)
[DevTools](/docs/ai-sdk-core/devtools)
[Event Callbacks](/docs/ai-sdk-core/event-listeners)
[AI SDK UI](/docs/ai-sdk-ui)
[Overview](/docs/ai-sdk-ui/overview)
[Chatbot](/docs/ai-sdk-ui/chatbot)
[Chatbot Message Persistence](/docs/ai-sdk-ui/chatbot-message-persistence)
[Chatbot Resume Streams](/docs/ai-sdk-ui/chatbot-resume-streams)
[Chatbot Tool Usage](/docs/ai-sdk-ui/chatbot-tool-usage)
[Generative User Interfaces](/docs/ai-sdk-ui/generative-user-interfaces)
[Completion](/docs/ai-sdk-ui/completion)
[Object Generation](/docs/ai-sdk-ui/object-generation)
[Streaming Custom Data](/docs/ai-sdk-ui/streaming-data)
[Error Handling](/docs/ai-sdk-ui/error-handling)
[Transport](/docs/ai-sdk-ui/transport)
[Reading UIMessage Streams](/docs/ai-sdk-ui/reading-ui-message-streams)
[Message Metadata](/docs/ai-sdk-ui/message-metadata)
[Stream Protocols](/docs/ai-sdk-ui/stream-protocol)
[AI SDK RSC](/docs/ai-sdk-rsc)
[Advanced](/docs/advanced)
[Reference](/docs/reference)
[AI SDK Core](/docs/reference/ai-sdk-core)
[AI SDK UI](/docs/reference/ai-sdk-ui)
[AI SDK RSC](/docs/reference/ai-sdk-rsc)
[AI SDK Errors](/docs/reference/ai-sdk-errors)
[Migration Guides](/docs/migration-guides)
[Troubleshooting](/docs/troubleshooting)
Copy markdown
# [Tool Calling](#tool-calling)
As covered under Foundations, [tools](/docs/foundations/tools) are objects that can be called by the model to perform a specific task.
AI SDK Core tools contain several core elements:
* **`description`**: An optional description of the tool that can influence when the tool is picked.
* **`inputSchema`**: A [Zod schema](/docs/foundations/tools#schemas) or a [JSON schema](/docs/reference/ai-sdk-core/json-schema) that defines the input parameters. The schema is consumed by the LLM, and also used to validate the LLM tool calls.
* **`execute`**: An optional async function that is called with the inputs from the tool call. It produces a value of type `RESULT` (generic type). It is optional because you might want to forward tool calls to the client or to a queue instead of executing them in the same process.
* **`strict`**: *(optional, boolean)* Enables strict tool calling when supported by the provider
You can use the [`tool`](/docs/reference/ai-sdk-core/tool) helper function to
infer the types of the `execute` parameters.
The `tools` parameter of `generateText` and `streamText` is an object that has the tool names as keys and the tools as values:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { z } from 'zod';
import { generateText, tool, stepCountIs } from 'ai';
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
tools: {
weather: tool({
description: 'Get the weather in a location',
inputSchema: z.object({
location: z.string().describe('The location to get the weather for'),
}),
execute: async ({ location }) =\> ({
location,
temperature: 72 + Math.floor(Math.random() \* 21) - 10,
}),
}),
},
stopWhen: stepCountIs(5),
prompt: 'What is the weather in San Francisco?',
});
`
```
When a model uses a tool, it is called a "tool call" and the output of the
tool is called a "tool result".
Tool calling is not restricted to only text generation.
You can also use it to render user interfaces (Generative UI).
## [Strict Mode](#strict-mode)
When enabled, language model providers that support strict tool calling will only generate tool calls that are valid according to your defined `inputSchema`.
This increases the reliability of tool calling.
However, not all schemas may be supported in strict mode, and what is supported depends on the specific provider.
By default, strict mode is disabled. You can enable it per-tool by setting `strict: true`:
```
`
tool({
description: 'Get the weather in a location',
inputSchema: z.object({
location: z.string(),
}),
strict: true, // Enable strict validation for this tool
execute: async ({ location }) =\> ({
// ...
}),
});
`
```
Not all providers or models support strict mode. For those that do not, this
option is ignored.
## [Input Examples](#input-examples)
You can specify example inputs for your tools to help guide the model on how input data should be structured.
When supported by providers, input examples can help when JSON schema itself does not fully specify the intended
usage or when there are optional values.
```
`
tool({
description: 'Get the weather in a location',
inputSchema: z.object({
location: z.string().describe('The location to get the weather for'),
}),
inputExamples: [
{ input: { location: 'San Francisco' } },
{ input: { location: 'London' } },
],
execute: async ({ location }) =\> {
// ...
},
});
`
```
Only the Anthropic providers supports tool input examples natively. Other
providers ignore the setting.
## [Tool Execution Approval](#tool-execution-approval)
By default, tools with an `execute` function run automatically as the model calls them. You can require approval before execution by setting `needsApproval`:
```
`
import { tool } from 'ai';
import { z } from 'zod';
const runCommand = tool({
description: 'Run a shell command',
inputSchema: z.object({
command: z.string().describe('The shell command to execute'),
}),
needsApproval: true,
execute: async ({ command }) =\> {
// your command execution logic here
},
});
`
```
This is useful for tools that perform sensitive operations like executing commands, processing payments, modifying data, and more potentially dangerous actions.
### [How It Works](#how-it-works)
When a tool requires approval, `generateText` and `streamText` don't pause execution. Instead, they complete and return `tool-approval-request` parts in the result content. This means the approval flow requires two calls to the model: the first returns the approval request, and the second (after receiving the approval response) either executes the tool or informs the model that approval was denied.
Here's the complete flow:
1. Call `generateText` with a tool that has `needsApproval: true`
2. Model generates a tool call
3. `generateText` returns with `tool-approval-request` parts in `result.content`
4. Your app requests an approval and collects the user's decision
5. Add a `tool-approval-response` to the messages array
6. Call `generateText` again with the updated messages
7. If approved, the tool runs and returns a result. If denied, the model sees the denial and responds accordingly.
### [Handling Approval Requests](#handling-approval-requests)
After calling `generateText` or `streamText`, check `result.content` for `tool-approval-request` parts:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { type ModelMessage, generateText } from 'ai';
const messages: ModelMessage[] = [
{ role: 'user', content: 'Remove the most recent file' },
];
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
tools: { runCommand },
messages,
});
messages.push(...result.response.messages);
for (const part of result.content) {
if (part.type === 'tool-approval-request') {
console.log(part.approvalId); // Unique ID for this approval request
console.log(part.toolCall); // Contains toolName, input, etc.
}
}
`
```
To respond, create a `tool-approval-response` and add it to your messages:
```
`
import { type ToolApprovalResponse } from 'ai';
const approvals: ToolApprovalResponse[] = [];
for (const part of result.content) {
if (part.type === 'tool-approval-request') {
const response: ToolApprovalResponse = {
type: 'tool-approval-response',
approvalId: part.approvalId,
approved: true, // or false to deny
reason: 'User confirmed the command', // Optional context for the model
};
approvals.push(response);
}
}
// add approvals to messages
messages.push({ role: 'tool', content: approvals });
`
```
Then call `generateText` again with the updated messages. If approved, the tool executes. If denied, the model receives the denial and can respond accordingly.
When a tool execution is denied, consider adding a system instruction like
"When a tool execution is not approved, do not retry it" to prevent the model
from attempting the same call again.
### [Dynamic Approval](#dynamic-approval)
You can make approval decisions based on tool input by providing an async function:
```
`
const paymentTool = tool({
description: 'Process a payment',
inputSchema: z.object({
amount: z.number(),
recipient: z.string(),
}),
needsApproval: async ({ amount }) =\> amount \> 1000,
execute: async ({ amount, recipient }) =\> {
return await processPayment(amount, recipient);
},
});
`
```
In this example, only transactions over $1000 require approval. Smaller transactions execute automatically.
### [Tool Execution Approval with useChat](#tool-execution-approval-with-usechat)
When using `useChat`, the approval flow is handled through UI state. See [Chatbot Tool Usage](/docs/ai-sdk-ui/chatbot-tool-usage#tool-execution-approval) for details on handling approvals in your UI with `addToolApprovalResponse`.
## [Multi-Step Calls (using stopWhen)](#multi-step-calls-using-stopwhen)
With the `stopWhen` setting, you can enable multi-step calls in `generateText` and `streamText`. When `stopWhen` is set and the model generates a tool call, the AI SDK will trigger a new generation passing in the tool result until there are no further tool calls or the stopping condition is met.
The AI SDK provides several built-in stopping conditions:
* `stepCountIs(count)` — stops after a specified number of steps (default: `stepCountIs(20)`)
* `hasToolCall(toolName)` — stops when a specific tool is called
* `isLoopFinished()` — never triggers, letting the loop run until naturally finished
You can also combine multiple conditions in an array or create custom conditions. See [Loop Control](/docs/agents/loop-control) for more details.
The `stopWhen` conditions are only evaluated when the last step contains tool
results.
By default, when you use `generateText` or `streamText`, it triggers a single generation. This works well for many use cases where you can rely on the model's training data to generate a response. However, when you provide tools, the model now has the choice to either generate a normal text response, or generate a tool call. If the model generates a tool call, its generation is complete and that step is finished.
You may want the model to generate text after the tool has been executed, either to summarize the tool results in the context of the users query. In many cases, you may also want the model to use multiple tools in a single response. This is where multi-step calls come in.
You can think of multi-step calls in a similar way to a conversation with a human. When you ask a question, if the person does not have the requisite knowledge in their common knowledge (a model's training data), the person may need to look up information (use a tool) before they can provide you with an answer. In the same way, the model may need to call a tool to get the information it needs to answer your question where each generation (tool call or text generation) is a step.
### [Example](#example)
In the following example, there are two steps:
1. **Step 1**
1. The prompt `'What is the weather in San Francisco?'` is sent to the model.
2. The model generates a tool call.
3. The tool call is executed.
4. **Step 2**
1. The tool result is sent to the model.
2. The model generates a response considering the tool result.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { z } from 'zod';
import { generateText, tool, stepCountIs } from 'ai';
const { text, steps } = await generateText({
model: "anthropic/claude-sonnet-4.5",
tools: {
weather: tool({
description: 'Get the weather in a location',
inputSchema: z.object({
location: z.string().describe('The location to get the weather for'),
}),
execute: async ({ location }) =\> ({
location,
temperature: 72 + Math.floor(Math.random() \* 21) - 10,
}),
}),
},
stopWhen: stepCountIs(5), // stop after a maximum of 5 steps if tools were called
prompt: 'What is the weather in San Francisco?',
});
`
```
You can use `streamText` in a similar way.
### [Steps](#steps)
To access intermediate tool calls and results, you can use the `steps` property in the result object
or the `streamText` `onFinish` callback.
It contains all the text, tool calls, tool results, and more from each step.
#### [Example: Extract tool results from all steps](#example-extract-tool-results-from-all-steps)
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText } from 'ai';
const { steps } = await generateText({
model: "anthropic/claude-sonnet-4.5",
stopWhen: stepCountIs(10),
// ...
});
// extract all tool calls from the steps:
const allToolCalls = steps.flatMap(step =\> step.toolCalls);
`
```
### [`onStepFinish` callback](#onstepfinish-callback)
When using `generateText` or `streamText`, you can provide an `onStepFinish` callback that
is triggered when a step is finished,
i.e. all text deltas, tool calls, and tool results for the step are available.
When you have multiple steps, the callback is triggered for each step.
The callback receives a `stepNumber` (zero-based) to identify which step just completed:
```
`
import { generateText } from 'ai';
const result = await generateText({
// ...
onStepFinish({
stepNumber,
text,
toolCalls,
toolResults,
finishReason,
usage,
}) {
console.log(`Step ${stepNumber} finished (${finishReason})`);
// your own logic, e.g. for saving the chat history or recording usage
},
});
`
```
### [Tool execution lifecycle callbacks](#tool-execution-lifecycle-callbacks)
You can use `experimental\_onToolCallStart` and `experimental\_onToolCallFinish` to observe tool execution.
These callbacks are called right before and after each tool's `execute` function, giving you
visibility into tool execution timing, inputs, outputs, and errors:
```
`
import { generateText } from 'ai';
const result = await generateText({
// ... model, tools, prompt
experimental\_onToolCallStart({ toolName, toolCallId, input }) {
console.log(`Calling tool: ${toolName}`, { toolCallId, input });
},
experimental\_onToolCallFinish({
toolName,
toolCallId,
output,
error,
durationMs,
}) {
if (error) {
console.error(`Tool ${toolName} failed after ${durationMs}ms:`, error);
} else {
console.log(`Tool ${toolName} completed in ${durationMs}ms`, { output });
}
},
});
`
```
Errors thrown inside these callbacks are silently caught and do not break the generation flow.
### [`prepareStep` callback](#preparestep-callback)
The `prepareStep` callback is called before a step is started.
It is called with the following parameters:
* `model`: The model that was passed into `generateText`.
* `stopWhen`: The stopping condition that was passed into `generateText`.
* `stepNumber`: The number of the step that is being executed.
* `steps`: The steps that have been executed so far.
* `messages`: The messages that will be sent to the model for the current step.
* `experimental\_context`: The context passed via the `experimental\_context` setting (experimental).
You can use it to provide different settings for a step, including modifying the input messages.
```
`
import { generateText } from 'ai';
const result = await generateText({
// ...
prepareStep: async ({ model, stepNumber, steps, messages }) =\> {
if (stepNumber === 0) {
return {
// use a different model for this step:
model: modelForThisParticularStep,
// force a tool choice for this step:
toolChoice: { type: 'tool', toolName: 'tool1' },
// limit the tools that are available for this step:
activeTools: ['tool1'],
};
}
// when nothing is returned, the default settings are used
},
});
`
```
#### [Message Modification for Longer Agentic Loops](#message-modification-for-longer-agentic-loops)
In longer agentic loops, you can use the `messages` parameter to modify the input messages for each step. This is particularly useful for prompt compression:
```
`
prepareStep: async ({ stepNumber, steps, messages }) =\> {
// Compress conversation history for longer loops
if (messages.length \> 20) {
return {
messages: messages.slice(-10),
};
}
return {};
},
`
```
#### [Provider Options for Step Configuration](#provider-options-for-step-configuration)
You can use `providerOptions` in `prepareStep` to pass provider-specific configuration for each step. This is useful for features like Anthropic's code execution container persistence:
```
`
import { forwardAnthropicContainerIdFromLastStep } from '@ai-sdk/anthropic';
// Propagate container ID from previous step for code execution continuity
prepareStep: forwardAnthropicContainerIdFromLastStep,
`
```
## [Response Messages](#response-messages)
Adding the generated assistant and tool messages to your conversation history is a common task,
especially if you are using multi-step tool calls.
Both `generateText` and `streamText` have a `response.messages` property that you can use to
add the assistant and tool messages to your conversation history.
It is also available in the `onFinish` callback of `streamText`.
The `response.messages` property contains an array of `ModelMessage` objects that you can add to your conversation history:
```
`
import { generateText, ModelMessage } from 'ai';
const messages: ModelMessage[] = [
// ...
];
const { response } = await generateText({
// ...
messages,
});
// add the response messages to your conversation history:
messages.push(...response.messages); // streamText: ...((await response).messages)
`
```
## [Dynamic Tools](#dynamic-tools)
AI SDK Core supports dynamic tools for scenarios where tool schemas are not known at compile time. This is useful for:
* MCP (Model Context Protocol) tools without schemas
* User-defined functions at runtime
* Tools loaded from external sources
### [Using dynamicTool](#using-dynamictool)
The `dynamicTool` helper creates tools with unknown input/output types:
```
`
import { dynamicTool } from 'ai';
import { z } from 'zod';
const customTool = dynamicTool({
description: 'Execute a custom function',
inputSchema: z.object({}),
execute: async input =\> {
// input is typed as 'unknown'
// You need to validate/cast it at runtime
const { action, parameters } = input as any;
// Execute your dynamic logic
return { result: `Executed ${action}` };
},
});
`
```
### [Type-Safe Handling](#type-safe-handling)
When using both static and dynamic tools, use the `dynamic` flag for type narrowing:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
tools: {
// Static tool with known types
weather: weatherTool,
// Dynamic tool
custom: dynamicTool({
/\* ... \*/
}),
},
onStepFinish: ({ toolCalls, toolResults }) =\> {
// Type-safe iteration
for (const toolCall of toolCalls) {
if (toolCall.dynamic) {
// Dynamic tool: input is 'unknown'
console.log('Dynamic:', toolCall.toolName, toolCall.input);
continue;
}
// Static tool: full type inference
switch (toolCall.toolName) {
case 'weather':
console.log(toolCall.input.location); // typed as string
break;
}
}
},
});
`
```
## [Preliminary Tool Results](#preliminary-tool-results)
You can return an `AsyncIterable` over multiple results.
In this case, the last value from the iterable is the final tool result.
This can be used in combination with generator functions to e.g. stream status information
during the tool execution:
```
`
tool({
description: 'Get the current weather.',
inputSchema: z.object({
location: z.string(),
}),
async \*execute({ location }) {
yield {
status: 'loading' as const,
text: `Getting weather for ${location}`,
weather: undefined,
};
await new Promise(resolve =\> setTimeout(resolve, 3000));
const temperature = 72 + Math.floor(Math.random() \* 21) - 10;
yield {
status: 'success' as const,
text: `The weather in ${location} is ${temperature}°F`,
temperature,
};
},
});
`
```
## [Tool Choice](#tool-choice)
You can use the `toolChoice` setting to influence when a tool is selected.
It supports the following settings:
* `auto` (default): the model can choose whether and which tools to call.
* `required`: the model must call a tool. It can choose which tool to call.
* `none`: the model must not call tools
* `{ type: 'tool', toolName: string (typed) }`: the model must call the specified tool
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { z } from 'zod';
import { generateText, tool } from 'ai';
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
tools: {
weather: tool({
description: 'Get the weather in a location',
inputSchema: z.object({
location: z.string().describe('The location to get the weather for'),
}),
execute: async ({ location }) =\> ({
location,
temperature: 72 + Math.floor(Math.random() \* 21) - 10,
}),
}),
},
toolChoice: 'required', // force the model to call a tool
prompt: 'What is the weather in San Francisco?',
});
`
```
## [Tool Execution Options](#tool-execution-options)
When tools are called, they receive additional options as a second parameter.
### [Tool Call ID](#tool-call-id)
The ID of the tool call is forwarded to the tool execution.
You can use it e.g. when sending tool-call related information with stream data.
```
`
import {
streamText,
tool,
createUIMessageStream,
createUIMessageStreamResponse,
} from 'ai';
export async function POST(req: Request) {
const { messages } = await req.json();
const stream = createUIMessageStream({
execute: ({ writer }) =\> {
const result = streamText({
// ...
messages,
tools: {
myTool: tool({
// ...
execute: async (args, { toolCallId }) =\> {
// return e.g. custom status for tool call
writer.write({
type: 'data-tool-status',
id: toolCallId,
data: {
name: 'myTool',
status: 'in-progress',
},
});
// ...
},
}),
},
});
writer.merge(result.toUIMessageStream());
},
});
return createUIMessageStreamResponse({ stream });
}
`
```
### [Messages](#messages)
The messages that were sent to the language model to initiate the response that contained the tool call are forwarded to the tool execution.
You can access them in the second parameter of the `execute` function.
In multi-step calls, the messages contain the text, tool calls, and tool results from all previous steps.
```
`
import { generateText, tool } from 'ai';
const result = await generateText({
// ...
tools: {
myTool: tool({
// ...
execute: async (args, { messages }) =\> {
// use the message history in e.g. calls to other language models
return { ... };
},
}),
},
});
`
```
### [Abort Signals](#abort-signals)
The abort signals from `generateText` and `streamText` are forwarded to the tool execution.
You can access them in the second parameter of the `execute` function and e.g. abort long-running computations or forward them to fetch calls inside tools.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { z } from 'zod';
import { generateText, tool } from 'ai';
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
abortSignal: myAbortSignal, // signal that will be forwarded to tools
tools: {
weather: tool({
description: 'Get the weather in a location',
inputSchema: z.object({ location: z.string() }),
execute: async ({ location }, { abortSignal }) =\> {
return fetch(
`https://api.weatherapi.com/v1/current.json?q=${location}`,
{ signal: abortSignal }, // forward the abort signal to fetch
);
},
}),
},
prompt: 'What is the weather in San Francisco?',
});
`
```
### [Context (experimental)](#context-experimental)
You can pass in arbitrary context from `generateText` or `streamText` via the `experimental\_context` setting.
This context is available in the `experimental\_context` tool execution option.
```
`
const result = await generateText({
// ...
tools: {
someTool: tool({
// ...
execute: async (input, { experimental\_context: context }) =\> {
const typedContext = context as { example: string }; // or use type validation library
// ...
},
}),
},
experimental\_context: { example: '123' },
});
`
```
## [Tool Input Lifecycle Hooks](#tool-input-lifecycle-hooks)
The following tool input lifecycle hooks are available:
* **`onInputStart`**: Called when the model starts generating the input (arguments) for the tool call
* **`onInputDelta`**: Called for each chunk of text as the input is streamed
* **`onInputAvailable`**: Called when the complete input is available and validated
`onInputStart` and `onInputDelta` are only called in streaming contexts (when using `streamText`). They are not called when using `generateText`.
### [Example](#example-1)
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { streamText, tool } from 'ai';
import { z } from 'zod';
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
tools: {
getWeather: tool({
description: 'Get the weather in a location',
inputSchema: z.object({
location: z.string().describe('The location to get the weather for'),
}),
execute: async ({ location }) =\> ({
temperature: 72 + Math.floor(Math.random() \* 21) - 10,
}),
onInputStart: () =\> {
console.log('Tool call starting');
},
onInputDelta: ({ inputTextDelta }) =\> {
console.log('Received input chunk:', inputTextDelta);
},
onInputAvailable: ({ input }) =\> {
console.log('Complete input:', input);
},
}),
},
prompt: 'What is the weather in San Francisco?',
});
`
```
## [Types](#types)
Modularizing your code often requires defining types to ensure type safety and reusability.
To enable this, the AI SDK provides several helper types for tools, tool calls, and tool results.
You can use them to strongly type your variables, function parameters, and return types
in parts of the code that are not directly related to `streamText` or `generateText`.
Each tool call is typed with `ToolCall\<NAME extends string, ARGS\>`, depending
on the tool that has been invoked.
Similarly, the tool results are typed with `ToolResult\<NAME extends string, ARGS, RESULT\>`.
The tools in `streamText` and `generateText` are defined as a `ToolSet`.
The type inference helpers `TypedToolCall\<TOOLS extends ToolSet\>`
and `TypedToolResult\<TOOLS extends ToolSet\>` can be used to
extract the tool call and tool result types from the tools.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { TypedToolCall, TypedToolResult, generateText, tool } from 'ai';
import { z } from 'zod';
const myToolSet = {
firstTool: tool({
description: 'Greets the user',
inputSchema: z.object({ name: z.string() }),
execute: async ({ name }) =\> `Hello, ${name}!`,
}),
secondTool: tool({
description: 'Tells the user their age',
inputSchema: z.object({ age: z.number() }),
execute: async ({ age }) =\> `You are ${age} years old!`,
}),
};
type MyToolCall = TypedToolCall\<typeof myToolSet\>;
type MyToolResult = TypedToolResult\<typeof myToolSet\>;
async function generateSomething(prompt: string): Promise\<{
text: string;
toolCalls: Array\<MyToolCall\>; // typed tool calls
toolResults: Array\<MyToolResult\>; // typed tool results
}\> {
return generateText({
model: "anthropic/claude-sonnet-4.5",
tools: myToolSet,
prompt,
});
}
`
```
## [Handling Errors](#handling-errors)
The AI SDK has three tool-call related errors:
* [`NoSuchToolError`](/docs/reference/ai-sdk-errors/ai-no-such-tool-error): the model tries to call a tool that is not defined in the tools object
* [`InvalidToolInputError`](/docs/reference/ai-sdk-errors/ai-invalid-tool-input-error): the model calls a tool with inputs that do not match the tool's input schema
* [`ToolCallRepairError`](/docs/reference/ai-sdk-errors/ai-tool-call-repair-error): an error that occurred during tool call repair
When tool execution fails (errors thrown by your tool's `execute` function), the AI SDK adds them as `tool-error` content parts to enable automated LLM roundtrips in multi-step scenarios.
### [`generateText`](#generatetext)
`generateText` throws errors for tool schema validation issues and other errors, and can be handled using a `try`/`catch` block. Tool execution errors appear as `tool-error` parts in the result steps:
```
`
try {
const result = await generateText({
//...
});
} catch (error) {
if (NoSuchToolError.isInstance(error)) {
// handle the no such tool error
} else if (InvalidToolInputError.isInstance(error)) {
// handle the invalid tool inputs error
} else {
// handle other errors
}
}
`
```
Tool execution errors are available in the result steps:
```
`
const { steps } = await generateText({
// ...
});
// check for tool errors in the steps
const toolErrors = steps.flatMap(step =\>
step.content.filter(part =\> part.type === 'tool-error'),
);
toolErrors.forEach(toolError =\> {
console.log('Tool error:', toolError.error);
console.log('Tool name:', toolError.toolName);
console.log('Tool input:', toolError.input);
});
`
```
### [`streamText`](#streamtext)
`streamText` sends errors as part of the full stream. Tool execution errors appear as `tool-error` parts, while other errors appear as `error` parts.
When using `toUIMessageStreamResponse`, you can pass an `onError` function to extract the error message from the error part and forward it as part of the stream response:
```
`
const result = streamText({
// ...
});
return result.toUIMessageStreamResponse({
onError: error =\> {
if (NoSuchToolError.isInstance(error)) {
return 'The model tried to call a unknown tool.';
} else if (InvalidToolInputError.isInstance(error)) {
return 'The model called a tool with invalid inputs.';
} else {
return 'An unknown error occurred.';
}
},
});
`
```
## [Tool Call Repair](#tool-call-repair)
The tool call repair feature is experimental and may change in the future.
Language models sometimes fail to generate valid tool calls,
especially when the input schema is complex or the model is smaller.
If you use multiple steps, those failed tool calls will be sent back to the LLM
in the next step to give it an opportunity to fix it.
However, you may want to control how invalid tool calls are repaired without requiring
additional steps that pollute the message history.
You can use the `experimental\_repairToolCall` function to attempt to repair the tool call
with a custom function.
You can use different strategies to repair the tool call:
* Use a model with structured outputs to generate the inputs.
* Send the messages, system prompt, and tool schema to a stronger model to generate the inputs.
* Provide more specific repair instructions based on which tool was called.
### [Example: Use a model with structured outputs for repair](#example-use-a-model-with-structured-outputs-for-repair)
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { openai } from '@ai-sdk/openai';
import { generateText, NoSuchToolError, Output, tool } from 'ai';
const result = await generateText({
model,
tools,
prompt,
experimental\_repairToolCall: async ({
toolCall,
tools,
inputSchema,
error,
}) =\> {
if (NoSuchToolError.isInstance(error)) {
return null; // do not attempt to fix invalid tool names
}
const tool = tools[toolCall.toolName as keyof typeof tools];
const { output: repairedArgs } = await generateText({
model: "anthropic/claude-sonnet-4.5",
output: Output.object({ schema: tool.inputSchema }),
prompt: [
`The model tried to call the tool "${toolCall.toolName}"` +
` with the following inputs:`,
JSON.stringify(toolCall.input),
`The tool accepts the following schema:`,
JSON.stringify(inputSchema(toolCall)),
'Please fix the inputs.',
].join('\\n'),
});
return { ...toolCall, input: JSON.stringify(repairedArgs) };
},
});
`
```
### [Example: Use the re-ask strategy for repair](#example-use-the-re-ask-strategy-for-repair)
```
`
import { openai } from '@ai-sdk/openai';
import { generateText, NoSuchToolError, tool } from 'ai';
const result = await generateText({
model,
tools,
prompt,
experimental\_repairToolCall: async ({
toolCall,
tools,
error,
messages,
system,
}) =\> {
const result = await generateText({
model,
system,
messages: [
...messages,
{
role: 'assistant',
content: [
{
type: 'tool-call',
toolCallId: toolCall.toolCallId,
toolName: toolCall.toolName,
input: toolCall.input,
},
],
},
{
role: 'tool' as const,
content: [
{
type: 'tool-result',
toolCallId: toolCall.toolCallId,
toolName: toolCall.toolName,
output: error.message,
},
],
},
],
tools,
});
const newToolCall = result.toolCalls.find(
newToolCall =\> newToolCall.toolName === toolCall.toolName,
);
return newToolCall != null
? {
type: 'tool-call' as const,
toolCallId: toolCall.toolCallId,
toolName: toolCall.toolName,
input: JSON.stringify(newToolCall.input),
}
: null;
},
});
`
```
## [Active Tools](#active-tools)
Language models can only handle a limited number of tools at a time, depending on the model.
To allow for static typing using a large number of tools and limiting the available tools to the model at the same time,
the AI SDK provides the `activeTools` property.
It is an array of tool names that are currently active.
By default, the value is `undefined` and all tools are active.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { openai } from '@ai-sdk/openai';
import { generateText } from 'ai';
const { text } = await generateText({
model: "anthropic/claude-sonnet-4.5",
tools: myToolSet,
activeTools: ['firstTool'],
});
`
```
## [Multi-modal Tool Results](#multi-modal-tool-results)
Multi-modal tool results are experimental and supported by Anthropic, OpenAI,
and Google (Gemini 3 models).
For Google, use base64 media parts (`image-data` / `file-data`) or base64
`data:` URLs in URL-style parts. Remote HTTP(S) URLs in tool-result URL parts
are not supported.
In order to send multi-modal tool results, e.g. screenshots, back to the model,
they need to be converted into a specific format.
AI SDK Core tools have an optional `toModelOutput` function
that converts the tool result into a content part.
Here is an example for converting a screenshot into a content part:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
tools: {
computer: anthropic.tools.computer\_20241022({
// ...
async execute({ action, coordinate, text }) {
switch (action) {
case 'screenshot': {
return {
type: 'image',
data: fs
.readFileSync('./data/screenshot-editor.png')
.toString('base64'),
};
}
default: {
return `executed ${action}`;
}
}
},
// map to tool result content for LLM consumption:
toModelOutput({ output }) {
return {
type: 'content',
value:
typeof output === 'string'
? [{ type: 'text', text: output }]
: [{ type: 'media', data: output.data, mediaType: 'image/png' }],
};
},
}),
},
// ...
});
`
```
## [Extracting Tools](#extracting-tools)
Once you start having many tools, you might want to extract them into separate files.
The `tool` helper function is crucial for this, because it ensures correct type inference.
Here is an example of an extracted tool:
tools/weather-tool.ts
```
`
import { tool } from 'ai';
import { z } from 'zod';
// the `tool` helper function ensures correct type inference:
export const weatherTool = tool({
description: 'Get the weather in a location',
inputSchema: z.object({
location: z.string().describe('The location to get the weather for'),
}),
execute: async ({ location }) =\> ({
location,
temperature: 72 + Math.floor(Math.random() \* 21) - 10,
}),
});
`
```
## [MCP Tools](#mcp-tools)
The AI SDK supports connecting to Model Context Protocol (MCP) servers to access their tools.
MCP enables your AI applications to discover and use tools across various services through a standardized interface.
For detailed information about MCP tools, including initialization, transport options, and usage patterns, see the [MCP Tools documentation](/docs/ai-sdk-core/mcp-tools).
### [AI SDK Tools vs MCP Tools](#ai-sdk-tools-vs-mcp-tools)
In most cases, you should define your own AI SDK tools for production applications. They provide full control, type safety, and optimal performance. MCP tools are best suited for rapid development iteration and scenarios where users bring their own tools.
|Aspect|AI SDK Tools|MCP Tools|
|**Type Safety**|Full static typing end-to-end|Dynamic discovery at runtime|
|**Execution**|Same process as your request (low latency)|Separate server (network overhead)|
|**Prompt Control**|Full control over descriptions and schemas|Controlled by MCP server owner|
|**Schema Control**|You define and optimize for your model|Controlled by MCP server owner|
|**Version Management**|Full visibility over updates|Can update independently (version skew risk)|
|**Authentication**|Same process, no additional auth required|Separate server introduces additional auth complexity|
|**Best For**|Production applications requiring control and performance|Development iteration, user-provided tools|
## [Examples](#examples)
You can see tools in action using various frameworks in the following examples:
[
Learn to use tools in Node.js
](/cookbook/node/call-tools)[
Learn to use tools in Next.js with Route Handlers
](/cookbook/next/call-tools)[
Learn to use MCP tools in Node.js
](/cookbook/node/mcp-tools)
On this page
[Tool Calling](#tool-calling)
[Strict Mode](#strict-mode)
[Input Examples](#input-examples)
[Tool Execution Approval](#tool-execution-approval)
[How It Works](#how-it-works)
[Handling Approval Requests](#handling-approval-requests)
[Dynamic Approval](#dynamic-approval)
[Tool Execution Approval with useChat](#tool-execution-approval-with-usechat)
[Multi-Step Calls (using stopWhen)](#multi-step-calls-using-stopwhen)
[Example](#example)
[Steps](#steps)
[Example: Extract tool results from all steps](#example-extract-tool-results-from-all-steps)
[onStepFinish callback](#onstepfinish-callback)
[Tool execution lifecycle callbacks](#tool-execution-lifecycle-callbacks)
[prepareStep callback](#preparestep-callback)
[Message Modification for Longer Agentic Loops](#message-modification-for-longer-agentic-loops)
[Provider Options for Step Configuration](#provider-options-for-step-configuration)
[Response Messages](#response-messages)
[Dynamic Tools](#dynamic-tools)
[Using dynamicTool](#using-dynamictool)
[Type-Safe Handling](#type-safe-handling)
[Preliminary Tool Results](#preliminary-tool-results)
[Tool Choice](#tool-choice)
[Tool Execution Options](#tool-execution-options)
[Tool Call ID](#tool-call-id)
[Messages](#messages)
[Abort Signals](#abort-signals)
[Context (experimental)](#context-experimental)
[Tool Input Lifecycle Hooks](#tool-input-lifecycle-hooks)
[Example](#example-1)
[Types](#types)
[Handling Errors](#handling-errors)
[generateText](#generatetext)
[streamText](#streamtext)
[Tool Call Repair](#tool-call-repair)
[Example: Use a model with structured outputs for repair](#example-use-a-model-with-structured-outputs-for-repair)
[Example: Use the re-ask strategy for repair](#example-use-the-re-ask-strategy-for-repair)
[Active Tools](#active-tools)
[Multi-modal Tool Results](#multi-modal-tool-results)
[Extracting Tools](#extracting-tools)
[MCP Tools](#mcp-tools)
[AI SDK Tools vs MCP Tools](#ai-sdk-tools-vs-mcp-tools)
[Examples](#examples)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)