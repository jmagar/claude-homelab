AI SDK UI: Chatbot Tool Usage
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
# [Chatbot Tool Usage](#chatbot-tool-usage)
With [`useChat`](/docs/reference/ai-sdk-ui/use-chat) and [`streamText`](/docs/reference/ai-sdk-core/stream-text), you can use tools in your chatbot application.
The AI SDK supports three types of tools in this context:
1. Automatically executed server-side tools
2. Automatically executed client-side tools
3. Tools that require user interaction, such as confirmation dialogs
The flow is as follows:
1. The user enters a message in the chat UI.
2. The message is sent to the API route.
3. In your server side route, the language model generates tool calls during the `streamText` call.
4. All tool calls are forwarded to the client.
5. Server-side tools are executed using their `execute` method and their results are forwarded to the client.
6. Client-side tools that should be automatically executed are handled with the `onToolCall` callback.
You must call `addToolOutput` to provide the tool result.
7. Client-side tool that require user interactions can be displayed in the UI.
The tool calls and results are available as tool invocation parts in the `parts` property of the last assistant message.
8. When the user interaction is done, `addToolOutput` can be used to add the tool result to the chat.
9. The chat can be configured to automatically submit when all tool results are available using `sendAutomaticallyWhen`.
This triggers another iteration of this flow.
The tool calls and tool executions are integrated into the assistant message as typed tool parts.
A tool part is at first a tool call, and then it becomes a tool result when the tool is executed.
The tool result contains all information about the tool call as well as the result of the tool execution.
Tool result submission can be configured using the `sendAutomaticallyWhen`
option. You can use the `lastAssistantMessageIsCompleteWithToolCalls` helper
to automatically submit when all tool results are available. This simplifies
the client-side code while still allowing full control when needed.
## [Example](#example)
In this example, we'll use three tools:
* `getWeatherInformation`: An automatically executed server-side tool that returns the weather in a given city.
* `askForConfirmation`: A user-interaction client-side tool that asks the user for confirmation.
* `getLocation`: An automatically executed client-side tool that returns a random city.
### [API route](#api-route)
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/chat/route.ts
```
`
import { convertToModelMessages, streamText, UIMessage } from 'ai';
import { z } from 'zod';
// Allow streaming responses up to 30 seconds
export const maxDuration = 30;
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: await convertToModelMessages(messages),
tools: {
// server-side tool with execute function:
getWeatherInformation: {
description: 'show the weather in a given city to the user',
inputSchema: z.object({ city: z.string() }),
execute: async ({}: { city: string }) =\> {
const weatherOptions = ['sunny', 'cloudy', 'rainy', 'snowy', 'windy'];
return weatherOptions[
Math.floor(Math.random() \* weatherOptions.length)
];
},
},
// client-side tool that starts user interaction:
askForConfirmation: {
description: 'Ask the user for confirmation.',
inputSchema: z.object({
message: z.string().describe('The message to ask for confirmation.'),
}),
},
// client-side tool that is automatically executed on the client:
getLocation: {
description:
'Get the user location. Always ask for confirmation before using this tool.',
inputSchema: z.object({}),
},
},
});
return result.toUIMessageStreamResponse();
}
`
```
### [Client-side page](#client-side-page)
The client-side page uses the `useChat` hook to create a chatbot application with real-time message streaming.
Tool calls are displayed in the chat UI as typed tool parts.
Please make sure to render the messages using the `parts` property of the message.
There are three things worth mentioning:
1. The [`onToolCall`](/docs/reference/ai-sdk-ui/use-chat#on-tool-call) callback is used to handle client-side tools that should be automatically executed.
In this example, the `getLocation` tool is a client-side tool that returns a random city.
You call `addToolOutput` to provide the result (without `await` to avoid potential deadlocks).
Always check `if (toolCall.dynamic)` first in your `onToolCall` handler.
Without this check, TypeScript will throw an error like: `Type 'string' is not assignable to type '"toolName1" | "toolName2"'` when you try to use
`toolCall.toolName` in `addToolOutput`.
2. The [`sendAutomaticallyWhen`](/docs/reference/ai-sdk-ui/use-chat#send-automatically-when) option with `lastAssistantMessageIsCompleteWithToolCalls` helper automatically submits when all tool results are available.
3. The `parts` array of assistant messages contains tool parts with typed names like `tool-askForConfirmation`.
The client-side tool `askForConfirmation` is displayed in the UI.
It asks the user for confirmation and displays the result once the user confirms or denies the execution.
The result is added to the chat using `addToolOutput` with the `tool` parameter for type safety.
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import {
DefaultChatTransport,
lastAssistantMessageIsCompleteWithToolCalls,
} from 'ai';
import { useState } from 'react';
export default function Chat() {
const { messages, sendMessage, addToolOutput } = useChat({
transport: new DefaultChatTransport({
api: '/api/chat',
}),
sendAutomaticallyWhen: lastAssistantMessageIsCompleteWithToolCalls,
// run client-side tools that are automatically executed:
async onToolCall({ toolCall }) {
// Check if it's a dynamic tool first for proper type narrowing
if (toolCall.dynamic) {
return;
}
if (toolCall.toolName === 'getLocation') {
const cities = ['New York', 'Los Angeles', 'Chicago', 'San Francisco'];
// No await - avoids potential deadlocks
addToolOutput({
tool: 'getLocation',
toolCallId: toolCall.toolCallId,
output: cities[Math.floor(Math.random() \* cities.length)],
});
}
},
});
const [input, setInput] = useState('');
return (
\<\>
{messages?.map(message =\> (
\<div key={message.id}\>
\<strong\>{`${message.role}: `}\</strong\>
{message.parts.map(part =\> {
switch (part.type) {
// render text parts as simple text:
case 'text':
return part.text;
// for tool parts, use the typed tool part names:
case 'tool-askForConfirmation': {
const callId = part.toolCallId;
switch (part.state) {
case 'input-streaming':
return (
\<div key={callId}\>Loading confirmation request...\</div\>
);
case 'input-available':
return (
\<div key={callId}\>
{part.input.message}
\<div\>
\<button
onClick={() =\>
addToolOutput({
tool: 'askForConfirmation',
toolCallId: callId,
output: 'Yes, confirmed.',
})
}
\>
Yes
\</button\>
\<button
onClick={() =\>
addToolOutput({
tool: 'askForConfirmation',
toolCallId: callId,
output: 'No, denied',
})
}
\>
No
\</button\>
\</div\>
\</div\>
);
case 'output-available':
return (
\<div key={callId}\>
Location access allowed: {part.output}
\</div\>
);
case 'output-error':
return \<div key={callId}\>Error: {part.errorText}\</div\>;
}
break;
}
case 'tool-getLocation': {
const callId = part.toolCallId;
switch (part.state) {
case 'input-streaming':
return (
\<div key={callId}\>Preparing location request...\</div\>
);
case 'input-available':
return \<div key={callId}\>Getting location...\</div\>;
case 'output-available':
return \<div key={callId}\>Location: {part.output}\</div\>;
case 'output-error':
return (
\<div key={callId}\>
Error getting location: {part.errorText}
\</div\>
);
}
break;
}
case 'tool-getWeatherInformation': {
const callId = part.toolCallId;
switch (part.state) {
// example of pre-rendering streaming tool inputs:
case 'input-streaming':
return (
\<pre key={callId}\>{JSON.stringify(part, null, 2)}\</pre\>
);
case 'input-available':
return (
\<div key={callId}\>
Getting weather information for {part.input.city}...
\</div\>
);
case 'output-available':
return (
\<div key={callId}\>
Weather in {part.input.city}: {part.output}
\</div\>
);
case 'output-error':
return (
\<div key={callId}\>
Error getting weather for {part.input.city}:{' '}
{part.errorText}
\</div\>
);
}
break;
}
}
})}
\<br /\>
\</div\>
))}
\<form
onSubmit={e =\> {
e.preventDefault();
if (input.trim()) {
sendMessage({ text: input });
setInput('');
}
}}
\>
\<input value={input} onChange={e =\> setInput(e.target.value)} /\>
\</form\>
\</\>
);
}
`
```
### [Error handling](#error-handling)
Sometimes an error may occur during client-side tool execution. Use the `addToolOutput` method with a `state` of `output-error` and `errorText` value instead of `output` record the error.
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import {
DefaultChatTransport,
lastAssistantMessageIsCompleteWithToolCalls,
} from 'ai';
import { useState } from 'react';
export default function Chat() {
const { messages, sendMessage, addToolOutput } = useChat({
transport: new DefaultChatTransport({
api: '/api/chat',
}),
sendAutomaticallyWhen: lastAssistantMessageIsCompleteWithToolCalls,
// run client-side tools that are automatically executed:
async onToolCall({ toolCall }) {
// Check if it's a dynamic tool first for proper type narrowing
if (toolCall.dynamic) {
return;
}
if (toolCall.toolName === 'getWeatherInformation') {
try {
const weather = await getWeatherInformation(toolCall.input);
// No await - avoids potential deadlocks
addToolOutput({
tool: 'getWeatherInformation',
toolCallId: toolCall.toolCallId,
output: weather,
});
} catch (err) {
addToolOutput({
tool: 'getWeatherInformation',
toolCallId: toolCall.toolCallId,
state: 'output-error',
errorText: 'Unable to get the weather information',
});
}
}
},
});
}
`
```
## [Tool Execution Approval](#tool-execution-approval)
Tool execution approval lets you require user confirmation before a server-side tool runs. Unlike [client-side tools](#example) that execute in the browser, tools with approval still execute on the server—but only after the user approves.
Use tool execution approval when you want to:
* Confirm sensitive operations (payments, deletions, external API calls)
* Let users review tool inputs before execution
* Add human oversight to automated workflows
For tools that need to run in the browser (updating UI state, accessing browser APIs), use client-side tools instead.
### [Server Setup](#server-setup)
Enable approval by setting `needsApproval` on your tool. See [Tool Execution Approval](/docs/ai-sdk-core/tools-and-tool-calling#tool-execution-approval) for configuration options including dynamic approval based on input.
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/chat/route.ts
```
`
import { streamText, tool } from 'ai';
import { z } from 'zod';
export async function POST(req: Request) {
const { messages } = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages,
tools: {
getWeather: tool({
description: 'Get the weather in a location',
inputSchema: z.object({
city: z.string(),
}),
needsApproval: true,
execute: async ({ city }) =\> {
const weather = await fetchWeather(city);
return weather;
},
}),
},
});
return result.toUIMessageStreamResponse();
}
`
```
### [Client-Side Approval UI](#client-side-approval-ui)
When a tool requires approval, the tool part state is `approval-requested`. Use `addToolApprovalResponse` to approve or deny:
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
export default function Chat() {
const { messages, addToolApprovalResponse } = useChat();
return (
\<\>
{messages.map(message =\> (
\<div key={message.id}\>
{message.parts.map(part =\> {
if (part.type === 'tool-getWeather') {
switch (part.state) {
case 'approval-requested':
return (
\<div key={part.toolCallId}\>
\<p\>Get weather for {part.input.city}?\</p\>
\<button
onClick={() =\>
addToolApprovalResponse({
id: part.approval.id,
approved: true,
})
}
\>
Approve
\</button\>
\<button
onClick={() =\>
addToolApprovalResponse({
id: part.approval.id,
approved: false,
})
}
\>
Deny
\</button\>
\</div\>
);
case 'output-available':
return (
\<div key={part.toolCallId}\>
Weather in {part.input.city}: {part.output}
\</div\>
);
}
}
// Handle other part types...
})}
\</div\>
))}
\</\>
);
}
`
```
### [Auto-Submit After Approval](#auto-submit-after-approval)
If nothing happens after you approve a tool execution, make sure you either
call `sendMessage` manually or configure `sendAutomaticallyWhen` on the
`useChat` hook.
Use `lastAssistantMessageIsCompleteWithApprovalResponses` to automatically continue the conversation after approvals:
```
`
import { useChat } from '@ai-sdk/react';
import { lastAssistantMessageIsCompleteWithApprovalResponses } from 'ai';
const { messages, addToolApprovalResponse } = useChat({
sendAutomaticallyWhen: lastAssistantMessageIsCompleteWithApprovalResponses,
});
`
```
## [Dynamic Tools](#dynamic-tools)
When using dynamic tools (tools with unknown types at compile time), the UI parts use a generic `dynamic-tool` type instead of specific tool types:
app/page.tsx
```
`
{
message.parts.map((part, index) =\> {
switch (part.type) {
// Static tools with specific (`tool-${toolName}`) types
case 'tool-getWeatherInformation':
return \<WeatherDisplay part={part} /\>;
// Dynamic tools use generic `dynamic-tool` type
case 'dynamic-tool':
return (
\<div key={index}\>
\<h4\>Tool: {part.toolName}\</h4\>
{part.state === 'input-streaming' && (
\<pre\>{JSON.stringify(part.input, null, 2)}\</pre\>
)}
{part.state === 'output-available' && (
\<pre\>{JSON.stringify(part.output, null, 2)}\</pre\>
)}
{part.state === 'output-error' && (
\<div\>Error: {part.errorText}\</div\>
)}
\</div\>
);
}
});
}
`
```
Dynamic tools are useful when integrating with:
* MCP (Model Context Protocol) tools without schemas
* User-defined functions loaded at runtime
* External tool providers
## [Tool call streaming](#tool-call-streaming)
Tool call streaming is **enabled by default** in AI SDK 5.0, allowing you to stream tool calls while they are being generated. This provides a better user experience by showing tool inputs as they are generated in real-time.
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/chat/route.ts
```
`
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: await convertToModelMessages(messages),
// toolCallStreaming is enabled by default in v5
// ...
});
return result.toUIMessageStreamResponse();
}
`
```
With tool call streaming enabled, partial tool calls are streamed as part of the data stream.
They are available through the `useChat` hook.
The typed tool parts of assistant messages will also contain partial tool calls.
You can use the `state` property of the tool part to render the correct UI.
app/page.tsx
```
`
export default function Chat() {
// ...
return (
\<\>
{messages?.map(message =\> (
\<div key={message.id}\>
{message.parts.map(part =\> {
switch (part.type) {
case 'tool-askForConfirmation':
case 'tool-getLocation':
case 'tool-getWeatherInformation':
switch (part.state) {
case 'input-streaming':
return \<pre\>{JSON.stringify(part.input, null, 2)}\</pre\>;
case 'input-available':
return \<pre\>{JSON.stringify(part.input, null, 2)}\</pre\>;
case 'output-available':
return \<pre\>{JSON.stringify(part.output, null, 2)}\</pre\>;
case 'output-error':
return \<div\>Error: {part.errorText}\</div\>;
}
}
})}
\</div\>
))}
\</\>
);
}
`
```
## [Step start parts](#step-start-parts)
When you are using multi-step tool calls, the AI SDK will add step start parts to the assistant messages.
If you want to display boundaries between tool calls, you can use the `step-start` parts as follows:
app/page.tsx
```
`
// ...
// where you render the message parts:
message.parts.map((part, index) =\> {
switch (part.type) {
case 'step-start':
// show step boundaries as horizontal lines:
return index \> 0 ? (
\<div key={index} className="text-gray-500"\>
\<hr className="my-2 border-gray-300" /\>
\</div\>
) : null;
case 'text':
// ...
case 'tool-askForConfirmation':
case 'tool-getLocation':
case 'tool-getWeatherInformation':
// ...
}
});
// ...
`
```
## [Server-side Multi-Step Calls](#server-side-multi-step-calls)
You can also use multi-step calls on the server-side with `streamText`.
This works when all invoked tools have an `execute` function on the server side.
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/chat/route.ts
```
`
import { convertToModelMessages, streamText, UIMessage, stepCountIs } from 'ai';
import { z } from 'zod';
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: await convertToModelMessages(messages),
tools: {
getWeatherInformation: {
description: 'show the weather in a given city to the user',
inputSchema: z.object({ city: z.string() }),
// tool has execute function:
execute: async ({}: { city: string }) =\> {
const weatherOptions = ['sunny', 'cloudy', 'rainy', 'snowy', 'windy'];
return weatherOptions[
Math.floor(Math.random() \* weatherOptions.length)
];
},
},
},
stopWhen: stepCountIs(5),
});
return result.toUIMessageStreamResponse();
}
`
```
## [Errors](#errors)
Language models can make errors when calling tools.
By default, these errors are masked for security reasons, and show up as "An error occurred" in the UI.
To surface the errors, you can use the `onError` function when calling `toUIMessageResponse`.
```
`
export function errorHandler(error: unknown) {
if (error == null) {
return 'unknown error';
}
if (typeof error === 'string') {
return error;
}
if (error instanceof Error) {
return error.message;
}
return JSON.stringify(error);
}
`
```
```
`
const result = streamText({
// ...
});
return result.toUIMessageStreamResponse({
onError: errorHandler,
});
`
```
In case you are using `createUIMessageResponse`, you can use the `onError` function when calling `toUIMessageResponse`:
```
`
const response = createUIMessageResponse({
// ...
async execute(dataStream) {
// ...
},
onError: error =\> `Custom error: ${error.message}`,
});
`
```
On this page
[Chatbot Tool Usage](#chatbot-tool-usage)
[Example](#example)
[API route](#api-route)
[Client-side page](#client-side-page)
[Error handling](#error-handling)
[Tool Execution Approval](#tool-execution-approval)
[Server Setup](#server-setup)
[Client-Side Approval UI](#client-side-approval-ui)
[Auto-Submit After Approval](#auto-submit-after-approval)
[Dynamic Tools](#dynamic-tools)
[Tool call streaming](#tool-call-streaming)
[Step start parts](#step-start-parts)
[Server-side Multi-Step Calls](#server-side-multi-step-calls)
[Errors](#errors)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)