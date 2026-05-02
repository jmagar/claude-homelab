Migration Guides: Migrate AI SDK 4.x to 5.0
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
[Versioning](/docs/migration-guides/versioning)
[Migrate AI SDK 5.x to 6.0](/docs/migration-guides/migration-guide-6-0)
[Migrate Your Data to AI SDK 5.0](/docs/migration-guides/migration-guide-5-0-data)
[Migrate AI SDK 4.x to 5.0](/docs/migration-guides/migration-guide-5-0)
[Migrate AI SDK 4.1 to 4.2](/docs/migration-guides/migration-guide-4-2)
[Migrate AI SDK 4.0 to 4.1](/docs/migration-guides/migration-guide-4-1)
[Migrate AI SDK 3.4 to 4.0](/docs/migration-guides/migration-guide-4-0)
[Migrate AI SDK 3.3 to 3.4](/docs/migration-guides/migration-guide-3-4)
[Migrate AI SDK 3.2 to 3.3](/docs/migration-guides/migration-guide-3-3)
[Migrate AI SDK 3.1 to 3.2](/docs/migration-guides/migration-guide-3-2)
[Migrate AI SDK 3.0 to 3.1](/docs/migration-guides/migration-guide-3-1)
[Troubleshooting](/docs/troubleshooting)
Copy markdown
# [Migrate AI SDK 4.x to 5.0](#migrate-ai-sdk-4x-to-50)
## [Recommended Migration Process](#recommended-migration-process)
1. Backup your project. If you use a versioning control system, make sure all previous versions are committed.
2. Upgrade to AI SDK 5.0.
3. Automatically migrate your code using one of these approaches:
* Use the [AI SDK 5 Migration MCP Server](#ai-sdk-5-migration-mcp-server) for AI-assisted migration in Cursor or other MCP-compatible coding agents
* Use [codemods](#codemods) to automatically transform your code
* Follow the breaking changes guide below.
* Verify your project is working as expected.
* Commit your changes.
## [AI SDK 5 Migration MCP Server](#ai-sdk-5-migration-mcp-server)
The [AI SDK 5 Migration Model Context Protocol (MCP) Server](https://github.com/vercel-labs/ai-sdk-5-migration-mcp-server) provides an automated way to migrate your project using a coding agent. This server has been designed for Cursor, but should work with any coding agent that supports MCP.
To get started, create or edit `.cursor/mcp.json` in your project:
```
`
{
"mcpServers": {
"ai-sdk-5-migration": {
"url": "https://ai-sdk-5-migration-mcp-server.vercel.app/api/mcp"
}
}
}
`
```
After saving, open the command palette (Cmd+Shift+P on macOS, Ctrl+Shift+P on Windows/Linux) and search for "View: Open MCP Settings". Verify the new server appears and is toggled on.
Then use this prompt:
```
`
Please migrate this project to AI SDK 5 using the ai-sdk-5-migration mcp server. Start by creating a checklist.
`
```
For more information, see the [AI SDK 5 Migration MCP Server repository](https://github.com/vercel-labs/ai-sdk-5-migration-mcp-server).
## [AI SDK 5.0 Package Versions](#ai-sdk-50-package-versions)
You need to update the following packages to the following versions in your `package.json` file(s):
* `ai` package: `5.0.0`
* `@ai-sdk/provider` package: `2.0.0`
* `@ai-sdk/provider-utils` package: `3.0.0`
* `@ai-sdk/\*` packages: `2.0.0` (other `@ai-sdk` packages)
Additionally, you need to update the following peer dependencies:
* `zod` package: `4.1.8` or later (recommended to avoid TypeScript performance issues)
An example upgrade command would be:
```
`
npm install ai @ai-sdk/react @ai-sdk/openai zod@^4.1.8
`
```
If you encounter TypeScript performance issues after upgrading, ensure you're
using Zod 4.1.8 or later. If the issue persists, update your `tsconfig.json`
to use `moduleResolution: "nodenext"`. See the [TypeScript performance
troubleshooting guide](/docs/troubleshooting/typescript-performance-zod) for
more details.
## [Codemods](#codemods)
The AI SDK provides Codemod transformations to help upgrade your codebase when a
feature is deprecated, removed, or otherwise changed.
Codemods are transformations that run on your codebase automatically. They
allow you to easily apply many changes without having to manually go through
every file.
Codemods are intended as a tool to help you with the upgrade process. They may
not cover all of the changes you need to make. You may need to make additional
changes manually.
You can run all codemods provided as part of the 5.0 upgrade process by running
the following command from the root of your project:
```
`
npx @ai-sdk/codemod upgrade
`
```
To run only the v5 codemods (v4 → v5 migration):
```
`
npx @ai-sdk/codemod v5
`
```
Individual codemods can be run by specifying the name of the codemod:
```
`
npx @ai-sdk/codemod \<codemod-name\> \<path\>
`
```
For example, to run a specific v5 codemod:
```
`
npx @ai-sdk/codemod v5/rename-format-stream-part src/
`
```
See also the [table of codemods](#codemod-table). In addition, the latest set of
codemods can be found in the
[`@ai-sdk/codemod`](https://github.com/vercel/ai/tree/main/packages/codemod/src/codemods)
repository.
## [AI SDK Core Changes](#ai-sdk-core-changes)
### [generateText and streamText Changes](#generatetext-and-streamtext-changes)
#### [Maximum Output Tokens](#maximum-output-tokens)
The `maxTokens` parameter has been renamed to `maxOutputTokens` for clarity.
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 4.0
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
maxTokens: 1024,
prompt: 'Hello, world!',
});
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5.0
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
maxOutputTokens: 1024,
prompt: 'Hello, world!',
});
`
```
### [Message and Type System Changes](#message-and-type-system-changes)
#### [Core Type Renames](#core-type-renames)
##### [`CoreMessage` → `ModelMessage`](#coremessage--modelmessage)
AI SDK 4.0
```
`
import { CoreMessage } from 'ai';
`
```
AI SDK 5.0
```
`
import { ModelMessage } from 'ai';
`
```
##### [`Message` → `UIMessage`](#message--uimessage)
AI SDK 4.0
```
`
import { Message, CreateMessage } from 'ai';
`
```
AI SDK 5.0
```
`
import { UIMessage, CreateUIMessage } from 'ai';
`
```
##### [`convertToCoreMessages` → `convertToModelMessages`](#converttocoremessages--converttomodelmessages)
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 4.0
```
`
import { convertToCoreMessages, streamText } from 'ai';
const result = await streamText({
model: "anthropic/claude-sonnet-4.5",
messages: convertToCoreMessages(messages),
});
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5.0
```
`
import { convertToModelMessages, streamText } from 'ai';
const result = await streamText({
model: "anthropic/claude-sonnet-4.5",
messages: convertToModelMessages(messages),
});
`
```
For more information about model messages, see the [Model Message
reference](/docs/reference/ai-sdk-core/model-message).
### [UIMessage Changes](#uimessage-changes)
#### [Content → Parts Array](#content--parts-array)
For `UIMessage`s (previously called `Message`), the `.content` property has been replaced with a `parts` array structure.
AI SDK 4.0
```
`
import { type Message } from 'ai'; // v4 Message type
// Messages (useChat) - had content property
const message: Message = {
id: '1',
role: 'user',
content: 'Bonjour!',
};
`
```
AI SDK 5.0
```
`
import { type UIMessage, type ModelMessage } from 'ai';
// UIMessages (useChat) - now use parts array
const uiMessage: UIMessage = {
id: '1',
role: 'user',
parts: [{ type: 'text', text: 'Bonjour!' }],
};
`
```
#### [Data Role Removed](#data-role-removed)
The `data` role has been removed from UI messages.
AI SDK 4.0
```
`
const message = {
role: 'data',
content: 'Some content',
data: { customField: 'value' },
};
`
```
AI SDK 5.0
```
`
// V5: Use UI message streams with custom data parts
const stream = createUIMessageStream({
execute({ writer }) {
// Write custom data instead of message annotations
writer.write({
type: 'data-custom',
id: 'custom-1',
data: { customField: 'value' },
});
},
});
`
```
#### [UIMessage Reasoning Structure](#uimessage-reasoning-structure)
The reasoning property on UI messages has been moved to parts.
AI SDK 4.0
```
`
const message: Message = {
role: 'assistant',
content: 'Hello',
reasoning: 'I will greet the user',
};
`
```
AI SDK 5.0
```
`
const message: UIMessage = {
role: 'assistant',
parts: [
{
type: 'reasoning',
text: 'I will greet the user',
},
{
type: 'text',
text: 'Hello',
},
],
};
`
```
#### [Reasoning Part Property Rename](#reasoning-part-property-rename)
The `reasoning` property on reasoning UI parts has been renamed to `text`.
AI SDK 4.0
```
`
{
message.parts.map((part, index) =\> {
if (part.type === 'reasoning') {
return (
\<div key={index} className="reasoning-display"\>
{part.reasoning}
\</div\>
);
}
});
}
`
```
AI SDK 5.0
```
`
{
message.parts.map((part, index) =\> {
if (part.type === 'reasoning') {
return (
\<div key={index} className="reasoning-display"\>
{part.text}
\</div\>
);
}
});
}
`
```
### [File Part Changes](#file-part-changes)
File parts now use `.url` instead of `.data` and `.mimeType`.
AI SDK 4.0
```
`
{
messages.map(message =\> (
\<div key={message.id}\>
{message.parts.map((part, index) =\> {
if (part.type === 'text') {
return \<div key={index}\>{part.text}\</div\>;
} else if (part.type === 'file' && part.mimeType.startsWith('image/')) {
return (
\<img
key={index}
src={`data:${part.mimeType};base64,${part.data}`}
/\>
);
}
})}
\</div\>
));
}
`
```
AI SDK 5.0
```
`
{
messages.map(message =\> (
\<div key={message.id}\>
{message.parts.map((part, index) =\> {
if (part.type === 'text') {
return \<div key={index}\>{part.text}\</div\>;
} else if (
part.type === 'file' &&
part.mediaType.startsWith('image/')
) {
return \<img key={index} src={part.url} /\>;
}
})}
\</div\>
));
}
`
```
### [Stream Data Removal](#stream-data-removal)
The `StreamData` class has been completely removed and replaced with UI message streams for custom data.
AI SDK 4.0
```
`
import { StreamData } from 'ai';
const streamData = new StreamData();
streamData.append('custom-data');
streamData.close();
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5.0
```
`
import { createUIMessageStream, createUIMessageStreamResponse } from 'ai';
const stream = createUIMessageStream({
execute({ writer }) {
// Write custom data parts
writer.write({
type: 'data-custom',
id: 'custom-1',
data: 'custom-data',
});
// Can merge with LLM streams
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages,
});
writer.merge(result.toUIMessageStream());
},
});
return createUIMessageStreamResponse({ stream });
`
```
### [Custom Data Streaming: writeMessageAnnotation/writeData Removed](#custom-data-streaming-writemessageannotationwritedata-removed)
The `writeMessageAnnotation` and `writeData` methods from `DataStreamWriter` have been removed. Instead, use custom data parts with the new `UIMessage` stream architecture.
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 4.0
```
`
import { createDataStreamResponse, streamText } from 'ai';
export async function POST(req: Request) {
const { messages } = await req.json();
return createDataStreamResponse({
execute: dataStream =\> {
// Write general data
dataStream.writeData('call started');
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages,
onChunk() {
// Write message annotations
dataStream.writeMessageAnnotation({
status: 'streaming',
timestamp: Date.now(),
});
},
onFinish() {
// Write final annotations
dataStream.writeMessageAnnotation({
id: generateId(),
completed: true,
});
dataStream.writeData('call completed');
},
});
result.mergeIntoDataStream(dataStream);
},
});
}
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5.0
```
`
import {
createUIMessageStream,
createUIMessageStreamResponse,
streamText,
generateId,
} from 'ai';
export async function POST(req: Request) {
const { messages } = await req.json();
const stream = createUIMessageStream({
execute: ({ writer }) =\> {
const statusId = generateId();
// Write general data (transient - not added to message history)
writer.write({
type: 'data-status',
id: statusId,
data: { status: 'call started' },
});
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages,
onChunk() {
// Write data parts that update during streaming
writer.write({
type: 'data-status',
id: statusId,
data: {
status: 'streaming',
timestamp: Date.now(),
},
});
},
onFinish() {
// Write final data parts
writer.write({
type: 'data-status',
id: statusId,
data: {
status: 'completed',
},
});
},
});
writer.merge(result.toUIMessageStream());
},
});
return createUIMessageStreamResponse({ stream });
}
`
```
For more detailed information about streaming custom data in v5, see the
[Streaming Data guide](/docs/ai-sdk-ui/streaming-data).
##### [Provider Metadata → Provider Options](#provider-metadata--provider-options)
The `providerMetadata` input parameter has been renamed to `providerOptions`. Note that the returned metadata in results is still called `providerMetadata`.
AI SDK 4.0
```
`
const result = await generateText({
model: 'openai/gpt-5',
prompt: 'Hello',
providerMetadata: {
openai: { store: false },
},
});
`
```
AI SDK 5.0
```
`
const result = await generateText({
model: 'openai/gpt-5',
prompt: 'Hello',
providerOptions: {
// Input parameter renamed
openai: { store: false },
},
});
// Returned metadata still uses providerMetadata:
console.log(result.providerMetadata?.openai);
`
```
#### [Tool Definition Changes (parameters → inputSchema)](#tool-definition-changes-parameters--inputschema)
Tool definitions have been updated to use `inputSchema` instead of `parameters` and error classes have been renamed.
AI SDK 4.0
```
`
import { tool } from 'ai';
const weatherTool = tool({
description: 'Get the weather for a city',
parameters: z.object({
city: z.string(),
}),
execute: async ({ city }) =\> {
return `Weather in ${city}`;
},
});
`
```
AI SDK 5.0
```
`
import { tool } from 'ai';
const weatherTool = tool({
description: 'Get the weather for a city',
inputSchema: z.object({
city: z.string(),
}),
execute: async ({ city }) =\> {
return `Weather in ${city}`;
},
});
`
```
#### [Tool Result Content: experimental\_toToolResultContent → toModelOutput](#tool-result-content-experimental_totoolresultcontent--tomodeloutput)
The `experimental\_toToolResultContent` option has been renamed to `toModelOutput` and is no longer experimental.
AI SDK 4.0
```
`
const screenshotTool = tool({
description: 'Take a screenshot',
parameters: z.object({}),
execute: async () =\> {
const imageData = await takeScreenshot();
return imageData; // base64 string
},
experimental\_toToolResultContent: result =\> [{ type: 'image', data: result }],
});
`
```
AI SDK 5.0
```
`
const screenshotTool = tool({
description: 'Take a screenshot',
inputSchema: z.object({}),
execute: async () =\> {
const imageData = await takeScreenshot();
return imageData;
},
toModelOutput: result =\> ({
type: 'content',
value: [{ type: 'media', mediaType: 'image/png', data: result }],
}),
});
`
```
### [Tool Property Changes (args/result → input/output)](#tool-property-changes-argsresult--inputoutput)
Tool call and result properties have been renamed for better consistency with schemas.
AI SDK 4.0
```
`
// Tool calls used "args" and "result"
for await (const part of result.fullStream) {
switch (part.type) {
case 'tool-call':
console.log('Tool args:', part.args);
break;
case 'tool-result':
console.log('Tool result:', part.result);
break;
}
}
`
```
AI SDK 5.0
```
`
// Tool calls now use "input" and "output"
for await (const part of result.fullStream) {
switch (part.type) {
case 'tool-call':
console.log('Tool input:', part.input);
break;
case 'tool-result':
console.log('Tool output:', part.output);
break;
}
}
`
```
### [Tool Execution Error Handling](#tool-execution-error-handling)
The `ToolExecutionError` class has been removed. Tool execution errors now appear as `tool-error` content parts in the result steps, enabling automated LLM roundtrips in multi-step scenarios.
AI SDK 4.0
```
`
import { ToolExecutionError } from 'ai';
try {
const result = await generateText({
// ...
});
} catch (error) {
if (error instanceof ToolExecutionError) {
console.log('Tool execution failed:', error.message);
console.log('Tool name:', error.toolName);
console.log('Tool input:', error.toolInput);
}
}
`
```
AI SDK 5.0
```
`
// Tool execution errors now appear in result steps
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
For streaming scenarios, tool execution errors appear as `tool-error` parts in the stream, while other errors appear as `error` parts.
### [Tool Call Streaming Now Default (toolCallStreaming Removed)](#tool-call-streaming-now-default-toolcallstreaming-removed)
The `toolCallStreaming` option has been removed in AI SDK 5.0. Tool call streaming is now always enabled by default.
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 4.0
```
`
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages,
toolCallStreaming: true, // Optional parameter to enable streaming
tools: {
weatherTool,
searchTool,
},
});
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5.0
```
`
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: convertToModelMessages(messages),
// toolCallStreaming removed - streaming is always enabled
tools: {
weatherTool,
searchTool,
},
});
`
```
### [Tool Part Type Changes (UIMessage)](#tool-part-type-changes-uimessage)
In v5, UI tool parts use typed naming: `tool-${toolName}` instead of generic types.
AI SDK 4.0
```
`
// Generic tool-invocation type
{
message.parts.map(part =\> {
if (part.type === 'tool-invocation') {
return \<div\>{part.toolInvocation.toolName}\</div\>;
}
});
}
`
```
AI SDK 5.0
```
`
// Type-safe tool parts with specific names
{
message.parts.map(part =\> {
switch (part.type) {
case 'tool-getWeatherInformation':
return \<div\>Getting weather...\</div\>;
case 'tool-askForConfirmation':
return \<div\>Asking for confirmation...\</div\>;
}
});
}
`
```
### [Dynamic Tools Support](#dynamic-tools-support)
AI SDK 5.0 introduces dynamic tools for handling tools with unknown types at development time, such as MCP tools without schemas or user-defined functions at runtime.
#### [New dynamicTool Helper](#new-dynamictool-helper)
The new `dynamicTool` helper function allows you to define tools where the input and output types are not known at compile time.
AI SDK 5.0
```
`
import { dynamicTool } from 'ai';
import { z } from 'zod';
// Define a dynamic tool
const runtimeTool = dynamicTool({
description: 'A tool defined at runtime',
inputSchema: z.object({}),
execute: async input =\> {
// Input and output are typed as 'unknown'
return { result: `Processed: ${input.query}` };
},
});
`
```
#### [MCP Tools Without Schemas](#mcp-tools-without-schemas)
MCP tools that don't provide schemas are now automatically treated as dynamic tools:
AI SDK 5.0
```
`
import { MCPClient } from 'ai';
const client = new MCPClient({
/\* ... \*/
});
const tools = await client.getTools();
// Tools without schemas are now 'dynamic' type
// and won't break type inference when mixed with static tools
`
```
#### [Type-Safe Handling with Mixed Tools](#type-safe-handling-with-mixed-tools)
When using both static and dynamic tools together, use the `dynamic` flag for type narrowing:
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5.0
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
tools: {
// Static tool with known types
weather: weatherTool,
// Dynamic tool with unknown types
customDynamicTool: dynamicTool({
/\* ... \*/
}),
},
onStepFinish: step =\> {
// Handle tool calls with type safety
for (const toolCall of step.toolCalls) {
if (toolCall.dynamic) {
// Dynamic tool: input/output are 'unknown'
console.log('Dynamic tool called:', toolCall.toolName);
continue;
}
// Static tools have full type inference
switch (toolCall.toolName) {
case 'weather':
// TypeScript knows the exact types
console.log(toolCall.input.location); // string
break;
}
}
},
});
`
```
#### [New dynamic-tool UI Part](#new-dynamic-tool-ui-part)
UI messages now include a `dynamic-tool` part type for rendering dynamic tool invocations:
AI SDK 5.0
```
`
{
message.parts.map((part, index) =\> {
switch (part.type) {
// Static tools use specific types
case 'tool-weather':
return \<div\>Weather: {part.input.city}\</div\>;
// Dynamic tools use the generic dynamic-tool type
case 'dynamic-tool':
return (
\<div\>
Dynamic tool: {part.toolName}
\<pre\>{JSON.stringify(part.input, null, 2)}\</pre\>
\</div\>
);
}
});
}
`
```
#### [Breaking Change: Type Narrowing Required for Tool Calls and Results](#breaking-change-type-narrowing-required-for-tool-calls-and-results)
When iterating over `toolCalls` and `toolResults`, you now need to check the `dynamic` flag first for proper type narrowing:
AI SDK 4.0
```
`
// Direct type checking worked without dynamic flag
onStepFinish: step =\> {
for (const toolCall of step.toolCalls) {
switch (toolCall.toolName) {
case 'weather':
console.log(toolCall.input.location); // typed as string
break;
case 'search':
console.log(toolCall.input.query); // typed as string
break;
}
}
};
`
```
AI SDK 5.0
```
`
// Must check dynamic flag first for type narrowing
onStepFinish: step =\> {
for (const toolCall of step.toolCalls) {
// Check if it's a dynamic tool first
if (toolCall.dynamic) {
console.log('Dynamic tool:', toolCall.toolName);
console.log('Input:', toolCall.input); // typed as unknown
continue;
}
// Now TypeScript knows it's a static tool
switch (toolCall.toolName) {
case 'weather':
console.log(toolCall.input.location); // typed as string
break;
case 'search':
console.log(toolCall.input.query); // typed as string
break;
}
}
};
`
```
### [Tool UI Part State Changes](#tool-ui-part-state-changes)
Tool UI parts now use more granular states that better represent the streaming lifecycle and error handling.
AI SDK 4.0
```
`
// Old states
{
message.parts.map(part =\> {
if (part.type === 'tool-invocation') {
switch (part.toolInvocation.state) {
case 'partial-call':
return \<div\>Loading...\</div\>;
case 'call':
return (
\<div\>
Tool called with {JSON.stringify(part.toolInvocation.args)}
\</div\>
);
case 'result':
return \<div\>Result: {part.toolInvocation.result}\</div\>;
}
}
});
}
`
```
AI SDK 5.0
```
`
// New granular states
{
message.parts.map(part =\> {
switch (part.type) {
case 'tool-getWeatherInformation':
switch (part.state) {
case 'input-streaming':
return \<pre\>{JSON.stringify(part.input, null, 2)}\</pre\>;
case 'input-available':
return \<div\>Getting weather for {part.input.city}...\</div\>;
case 'output-available':
return \<div\>Weather: {part.output}\</div\>;
case 'output-error':
return \<div\>Error: {part.errorText}\</div\>;
}
}
});
}
`
```
**State Changes:**
* `partial-call` → `input-streaming` (tool input being streamed)
* `call` → `input-available` (tool input complete, ready to execute)
* `result` → `output-available` (tool execution successful)
* New: `output-error` (tool execution failed)
#### [Rendering Tool Invocations (Catch-All Pattern)](#rendering-tool-invocations-catch-all-pattern)
In v4, you typically rendered tool invocations using a catch-all `tool-invocation` type. In v5, the **recommended approach is to handle each tool specifically using its typed part name (e.g., `tool-getWeather`)**. However, if you need a catch-all pattern for rendering all tool invocations the same way, you can use the `isToolUIPart` and `getToolName` helper functions as a fallback.
AI SDK 4.0
```
`
{
message.parts.map((part, index) =\> {
switch (part.type) {
case 'text':
return \<div key={index}\>{part.text}\</div\>;
case 'tool-invocation':
const { toolInvocation } = part;
return (
\<details key={`tool-${toolInvocation.toolCallId}`}\>
\<summary\>
\<span\>{toolInvocation.toolName}\</span\>
{toolInvocation.state === 'result' ? (
\<span\>Click to expand\</span\>
) : (
\<span\>calling...\</span\>
)}
\</summary\>
{toolInvocation.state === 'result' ? (
\<div\>
\<pre\>{JSON.stringify(toolInvocation.result, null, 2)}\</pre\>
\</div\>
) : null}
\</details\>
);
}
});
}
`
```
AI SDK 5.0
```
`
import { isToolUIPart, getToolName } from 'ai';
{
message.parts.map((part, index) =\> {
switch (part.type) {
case 'text':
return \<div key={index}\>{part.text}\</div\>;
default:
if (isToolUIPart(part)) {
const toolInvocation = part;
return (
\<details key={`tool-${toolInvocation.toolCallId}`}\>
\<summary\>
\<span\>{getToolName(toolInvocation)}\</span\>
{toolInvocation.state === 'output-available' ? (
\<span\>Click to expand\</span\>
) : (
\<span\>calling...\</span\>
)}
\</summary\>
{toolInvocation.state === 'output-available' ? (
\<div\>
\<pre\>{JSON.stringify(toolInvocation.output, null, 2)}\</pre\>
\</div\>
) : null}
\</details\>
);
}
}
});
}
`
```
#### [Media Type Standardization](#media-type-standardization)
`mimeType` has been renamed to `mediaType` for consistency. Both image and file types are supported in model messages.
AI SDK 4.0
```
`
const result = await generateText({
model: someModel,
messages: [
{
role: 'user',
content: [
{ type: 'text', text: 'What do you see?' },
{
type: 'image',
image: new Uint8Array([0, 1, 2, 3]),
mimeType: 'image/png',
},
{
type: 'file',
data: contents,
mimeType: 'application/pdf',
},
],
},
],
});
`
```
AI SDK 5.0
```
`
const result = await generateText({
model: someModel,
messages: [
{
role: 'user',
content: [
{ type: 'text', text: 'What do you see?' },
{
type: 'image',
image: new Uint8Array([0, 1, 2, 3]),
mediaType: 'image/png',
},
{
type: 'file',
data: contents,
mediaType: 'application/pdf',
},
],
},
],
});
`
```
### [Reasoning Support](#reasoning-support)
#### [Reasoning Text Property Rename](#reasoning-text-property-rename)
The `.reasoning` property has been renamed to `.reasoningText` for multi-step generations.
AI SDK 4.0
```
`
for (const step of steps) {
console.log(step.reasoning);
}
`
```
AI SDK 5.0
```
`
for (const step of steps) {
console.log(step.reasoningText);
}
`
```
#### [Generate Text Reasoning Property Changes](#generate-text-reasoning-property-changes)
In `generateText()` and `streamText()` results, reasoning properties have been renamed.
AI SDK 4.0
```
`
const result = await generateText({
model: anthropic('claude-sonnet-4-20250514'),
prompt: 'Explain your reasoning',
});
console.log(result.reasoning); // String reasoning text
console.log(result.reasoningDetails); // Array of reasoning details
`
```
AI SDK 5.0
```
`
const result = await generateText({
model: anthropic('claude-sonnet-4-20250514'),
prompt: 'Explain your reasoning',
});
console.log(result.reasoningText); // String reasoning text
console.log(result.reasoning); // Array of reasoning details
`
```
### [Continuation Steps Removal](#continuation-steps-removal)
The `experimental\_continueSteps` option has been removed from `generateText()`.
AI SDK 4.0
```
`
const result = await generateText({
experimental\_continueSteps: true,
// ...
});
`
```
AI SDK 5.0
```
`
const result = await generateText({
// experimental\_continueSteps has been removed
// Use newer models with higher output token limits instead
// ...
});
`
```
### [Image Generation Changes](#image-generation-changes)
Image model settings have been moved to `providerOptions`.
AI SDK 4.0
```
`
await generateImage({
model: luma.image('photon-flash-1', {
maxImagesPerCall: 5,
pollIntervalMillis: 500,
}),
prompt,
n: 10,
});
`
```
AI SDK 5.0
```
`
await generateImage({
model: luma.image('photon-flash-1'),
prompt,
n: 10,
maxImagesPerCall: 5,
providerOptions: {
luma: { pollIntervalMillis: 500 },
},
});
`
```
### [Step Result Changes](#step-result-changes)
#### [Step Type Removal](#step-type-removal)
The `stepType` property has been removed from step results.
AI SDK 4.0
```
`
steps.forEach(step =\> {
switch (step.stepType) {
case 'initial':
console.log('Initial step');
break;
case 'tool-result':
console.log('Tool result step');
break;
case 'done':
console.log('Final step');
break;
}
});
`
```
AI SDK 5.0
```
`
steps.forEach((step, index) =\> {
if (index === 0) {
console.log('Initial step');
} else if (step.toolResults.length \> 0) {
console.log('Tool result step');
} else {
console.log('Final step');
}
});
`
```
### [Step Control: maxSteps → stopWhen](#step-control-maxsteps--stopwhen)
For core functions like `generateText` and `streamText`, the `maxSteps` parameter has been replaced with `stopWhen`, which provides more flexible control over multi-step execution. The `stopWhen` parameter defines conditions for stopping the generation **when the last step contains tool results**. When multiple conditions are provided as an array, the generation stops if any condition is met.
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 4.0
```
`
// V4: Simple numeric limit
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages,
maxSteps: 5, // Stop after a maximum of 5 steps
});
// useChat with maxSteps
const { messages } = useChat({
maxSteps: 3, // Stop after a maximum of 3 steps
});
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5.0
```
`
import { stepCountIs, hasToolCall } from 'ai';
// V5: Server-side - flexible stopping conditions with stopWhen
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages,
// Only triggers when last step has tool results
stopWhen: stepCountIs(5), // Stop at step 5 if tools were called
});
// Server-side - stop when specific tool is called
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages,
stopWhen: hasToolCall('finalizeTask'), // Stop when finalizeTask tool is called
});
`
```
**Common stopping patterns:**
AI SDK 5.0
```
`
// Stop after N steps (equivalent to old maxSteps)
// Note: Only applies when the last step has tool results
stopWhen: stepCountIs(5);
// Stop when specific tool is called
stopWhen: hasToolCall('finalizeTask');
// Multiple conditions (stops if ANY condition is met)
stopWhen: [
stepCountIs(10), // Maximum 10 steps
hasToolCall('submitOrder'), // Or when order is submitted
];
// Custom condition based on step content
stopWhen: ({ steps }) =\> {
const lastStep = steps[steps.length - 1];
// Custom logic - only triggers if last step has tool results
return lastStep?.text?.includes('COMPLETE');
};
`
```
**Important:** The `stopWhen` conditions are only evaluated when the last step contains tool results.
#### [Usage vs Total Usage](#usage-vs-total-usage)
Usage properties now distinguish between single step and total usage.
AI SDK 4.0
```
`
// usage contained total token usage across all steps
console.log(result.usage);
`
```
AI SDK 5.0
```
`
// usage contains token usage from the final step only
console.log(result.usage);
// totalUsage contains total token usage across all steps
console.log(result.totalUsage);
`
```
## [AI SDK UI Changes](#ai-sdk-ui-changes)
### [Package Structure Changes](#package-structure-changes)
### [`@ai-sdk/rsc` Package Extraction](#ai-sdkrsc-package-extraction)
The `ai/rsc` export has been extracted to a separate package `@ai-sdk/rsc`.
AI SDK 4.0
```
`
import { createStreamableValue } from 'ai/rsc';
`
```
AI SDK 5.0
```
`
import { createStreamableValue } from '@ai-sdk/rsc';
`
```
Don't forget to install the new package: `npm install @ai-sdk/rsc`
### [React UI Hooks Moved to `@ai-sdk/react`](#react-ui-hooks-moved-to-ai-sdkreact)
The deprecated `ai/react` export has been removed in favor of `@ai-sdk/react`.
AI SDK 4.0
```
`
import { useChat } from 'ai/react';
`
```
AI SDK 5.0
```
`
import { useChat } from '@ai-sdk/react';
`
```
Don't forget to install the new package: `npm install @ai-sdk/react`
### [useChat Changes](#usechat-changes)
The `useChat` hook has undergone significant changes in v5, with new transport architecture, removal of managed input state, and more.
#### [maxSteps Removal](#maxsteps-removal)
The `maxSteps` parameter has been removed from `useChat`. You should now use server-side `stopWhen` conditions for multi-step tool execution control, and manually submit tool results and trigger new messages for client-side tool calls.
AI SDK 4.0
```
`
const { messages, sendMessage } = useChat({
maxSteps: 5, // Automatic tool result submission
});
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5.0
```
`
// Server-side: Use stopWhen for multi-step control
import { streamText, convertToModelMessages, stepCountIs } from 'ai';
const result = await streamText({
model: "anthropic/claude-sonnet-4.5",
messages: convertToModelMessages(messages),
stopWhen: stepCountIs(5), // Stop after 5 steps with tool calls
});
// Client-side: Configure automatic submission
import { useChat } from '@ai-sdk/react';
import {
DefaultChatTransport,
lastAssistantMessageIsCompleteWithToolCalls,
} from 'ai';
const { messages, sendMessage, addToolOutput } = useChat({
// Automatically submit when all tool results are available
sendAutomaticallyWhen: lastAssistantMessageIsCompleteWithToolCalls,
async onToolCall({ toolCall }) {
const result = await executeToolCall(toolCall);
// Important: Don't await addToolOutput inside onToolCall to avoid deadlocks
addToolOutput({
tool: toolCall.toolName,
toolCallId: toolCall.toolCallId,
output: result,
});
},
});
`
```
Important: When using `sendAutomaticallyWhen`, don't use `await` with
`addToolOutput` inside `onToolCall` as it can cause deadlocks. The `await` is
useful when you're not using automatic submission and need to ensure the
messages are updated before manually calling `sendMessage()`.
This change provides more flexibility for handling tool calls and aligns client behavior with server-side multi-step execution patterns.
For more details on the new tool submission approach, see the [Tool Result Submission Changes](#tool-result-submission-changes) section below.
#### [Initial Messages Renamed](#initial-messages-renamed)
The `initialMessages` option has been renamed to `messages`.
AI SDK 4.0
```
`
import { useChat, type Message } from '@ai-sdk/react';
function ChatComponent({ initialMessages }: { initialMessages: Message[] }) {
const { messages } = useChat({
initialMessages: initialMessages,
// ...
});
// your component
}
`
```
AI SDK 5.0
```
`
import { useChat, type UIMessage } from '@ai-sdk/react';
function ChatComponent({ initialMessages }: { initialMessages: UIMessage[] }) {
const { messages } = useChat({
messages: initialMessages,
// ...
});
// your component
}
`
```
#### [Sharing Chat Instances](#sharing-chat-instances)
In v4, you could share chat state between components by using the same `id` parameter in multiple `useChat` hooks.
AI SDK 4.0
```
`
// Component A
const { messages } = useChat({
id: 'shared-chat',
api: '/api/chat',
});
// Component B - would share the same chat state
const { messages } = useChat({
id: 'shared-chat',
api: '/api/chat',
});
`
```
In v5, you need to explicitly share chat instances by passing a shared `Chat` instance.
AI SDK 5.0
```
`
// e.g. Store Chat instance in React Context and create a custom hook
// Component A
const { chat } = useSharedChat(); // Custom hook that accesses shared Chat from context
const { messages, sendMessage } = useChat({
chat, // Pass the shared chat instance
});
// Component B - shares the same chat instance
const { chat } = useSharedChat(); // Same hook to access shared Chat from context
const { messages } = useChat({
chat, // Same shared chat instance
});
`
```
For a complete example of sharing chat state across components, see the [Share Chat State Across Components](/cookbook/next/use-shared-chat-context) recipe.
#### [Chat Transport Architecture](#chat-transport-architecture)
Configuration is now handled through transport objects instead of direct API options.
AI SDK 4.0
```
`
import { useChat } from '@ai-sdk/react';
const { messages } = useChat({
api: '/api/chat',
credentials: 'include',
headers: { 'Custom-Header': 'value' },
});
`
```
AI SDK 5.0
```
`
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport } from 'ai';
const { messages } = useChat({
transport: new DefaultChatTransport({
api: '/api/chat',
credentials: 'include',
headers: { 'Custom-Header': 'value' },
}),
});
`
```
#### [Removed Managed Input State](#removed-managed-input-state)
The `useChat` hook no longer manages input state internally. You must now manage input state manually.
AI SDK 4.0
```
`
import { useChat } from '@ai-sdk/react';
export default function Page() {
const { messages, input, handleInputChange, handleSubmit } = useChat({
api: '/api/chat',
});
return (
\<form onSubmit={handleSubmit}\>
\<input value={input} onChange={handleInputChange} /\>
\<button type="submit"\>Send\</button\>
\</form\>
);
}
`
```
AI SDK 5.0
```
`
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport } from 'ai';
import { useState } from 'react';
export default function Page() {
const [input, setInput] = useState('');
const { messages, sendMessage } = useChat({
transport: new DefaultChatTransport({ api: '/api/chat' }),
});
const handleSubmit = e =\> {
e.preventDefault();
sendMessage({ text: input });
setInput('');
};
return (
\<form onSubmit={handleSubmit}\>
\<input value={input} onChange={e =\> setInput(e.target.value)} /\>
\<button type="submit"\>Send\</button\>
\</form\>
);
}
`
```
#### [Message Sending: `append` → `sendMessage`](#message-sending-append--sendmessage)
The `append` function has been replaced with `sendMessage` and requires structured message format.
AI SDK 4.0
```
`
const { append } = useChat();
// Simple text message
append({ role: 'user', content: 'Hello' });
// With custom body
append(
{
role: 'user',
content: 'Hello',
},
{ body: { imageUrl: 'https://...' } },
);
`
```
AI SDK 5.0
```
`
const { sendMessage } = useChat();
// Simple text message (most common usage)
sendMessage({ text: 'Hello' });
// Or with explicit parts array
sendMessage({
parts: [{ type: 'text', text: 'Hello' }],
});
// With custom body (via request options)
sendMessage(
{ role: 'user', parts: [{ type: 'text', text: 'Hello' }] },
{ body: { imageUrl: 'https://...' } },
);
`
```
#### [Message Regeneration: `reload` → `regenerate`](#message-regeneration-reload--regenerate)
The `reload` function has been renamed to `regenerate` with enhanced functionality.
AI SDK 4.0
```
`
const { reload } = useChat();
// Regenerate last message
reload();
`
```
AI SDK 5.0
```
`
const { regenerate } = useChat();
// Regenerate last message
regenerate();
// Regenerate specific message
regenerate({ messageId: 'message-123' });
`
```
#### [onResponse Removal](#onresponse-removal)
The `onResponse` callback has been removed from `useChat` and `useCompletion`.
AI SDK 4.0
```
`
const { messages } = useChat({
onResponse(response) {
// handle response
},
});
`
```
AI SDK 5.0
```
`
const { messages } = useChat({
// onResponse is no longer available
});
`
```
#### [Send Extra Message Fields Default](#send-extra-message-fields-default)
The `sendExtraMessageFields` option has been removed and is now the default behavior.
AI SDK 4.0
```
`
const { messages } = useChat({
sendExtraMessageFields: true,
});
`
```
AI SDK 5.0
```
`
const { messages } = useChat({
// sendExtraMessageFields is now the default
});
`
```
#### [Keep Last Message on Error Removal](#keep-last-message-on-error-removal)
The `keepLastMessageOnError` option has been removed as it's no longer needed.
AI SDK 4.0
```
`
const { messages } = useChat({
keepLastMessageOnError: true,
});
`
```
AI SDK 5.0
```
`
const { messages } = useChat({
// keepLastMessageOnError is no longer needed
});
`
```
#### [Chat Request Options Changes](#chat-request-options-changes)
The `data` and `allowEmptySubmit` options have been removed from `ChatRequestOptions`.
AI SDK 4.0
```
`
handleSubmit(e, {
data: { imageUrl: 'https://...' },
body: { custom: 'value' },
allowEmptySubmit: true,
});
`
```
AI SDK 5.0
```
`
sendMessage(
{
/\* yourMessage \*/
},
{
body: {
custom: 'value',
imageUrl: 'https://...', // Move data to body
},
},
);
`
```
#### [Request Options Type Rename](#request-options-type-rename)
`RequestOptions` has been renamed to `CompletionRequestOptions`.
AI SDK 4.0
```
`
import type { RequestOptions } from 'ai';
`
```
AI SDK 5.0
```
`
import type { CompletionRequestOptions } from 'ai';
`
```
#### [addToolResult Renamed to addToolOutput](#addtoolresult-renamed-to-addtooloutput)
The `addToolResult` method has been renamed to `addToolOutput`. Additionally, the `result` parameter has been renamed to `output` for consistency with other tool-related APIs.
AI SDK 4.0
```
`
const { addToolResult } = useChat();
// Add tool result with 'result' parameter
addToolResult({
toolCallId: 'tool-call-123',
result: 'Weather: 72°F, sunny',
});
`
```
AI SDK 5.0
```
`
const { addToolOutput } = useChat();
// Add tool output with 'output' parameter and 'tool' name for type safety
addToolOutput({
tool: 'getWeather',
toolCallId: 'tool-call-123',
output: 'Weather: 72°F, sunny',
});
`
```
`addToolResult` is still available but deprecated. It will be removed in
version 6.
#### [Tool Result Submission Changes](#tool-result-submission-changes)
The automatic tool result submission behavior has been updated in `useChat` and the `Chat` component. You now have more control and flexibility over when tool results are submitted.
* `onToolCall` no longer supports returning values to automatically submit tool results
* You must explicitly call `addToolOutput` to provide tool results
* Use `sendAutomaticallyWhen` with `lastAssistantMessageIsCompleteWithToolCalls` helper for automatic submission
* Important: Don't use `await` with `addToolOutput` inside `onToolCall` to avoid deadlocks
* The `maxSteps` parameter has been removed from the `Chat` component and `useChat` hook
* For multi-step tool execution, use server-side `stopWhen` conditions instead (see [maxSteps Removal](#maxsteps-removal))
AI SDK 4.0
```
`
const { messages, sendMessage, addToolResult } = useChat({
maxSteps: 5, // Removed in v5
// Automatic submission by returning a value
async onToolCall({ toolCall }) {
if (toolCall.toolName === 'getLocation') {
const cities = ['New York', 'Los Angeles', 'Chicago', 'San Francisco'];
return cities[Math.floor(Math.random() \* cities.length)];
}
},
});
`
```
AI SDK 5.0
```
`
import { useChat } from '@ai-sdk/react';
import {
DefaultChatTransport,
lastAssistantMessageIsCompleteWithToolCalls,
} from 'ai';
const { messages, sendMessage, addToolOutput } = useChat({
// Automatic submission with helper
sendAutomaticallyWhen: lastAssistantMessageIsCompleteWithToolCalls,
async onToolCall({ toolCall }) {
if (toolCall.toolName === 'getLocation') {
const cities = ['New York', 'Los Angeles', 'Chicago', 'San Francisco'];
// Important: Don't await inside onToolCall to avoid deadlocks
addToolOutput({
tool: 'getLocation',
toolCallId: toolCall.toolCallId,
output: cities[Math.floor(Math.random() \* cities.length)],
});
}
},
});
`
```
#### [Loading State Changes](#loading-state-changes)
The deprecated `isLoading` helper has been removed in favor of `status`.
AI SDK 4.0
```
`
const { isLoading } = useChat();
`
```
AI SDK 5.0
```
`
const { status } = useChat();
// Use state instead of isLoading for more granular control
`
```
#### [Resume Stream Support](#resume-stream-support)
The resume functionality has been moved from `experimental\_resume` to `resumeStream`.
AI SDK 4.0
```
`
// Resume was experimental
const { messages } = useChat({
experimental\_resume: true,
});
`
```
AI SDK 5.0
```
`
const { messages } = useChat({
resumeStream: true, // Resume interrupted streams
});
`
```
#### [Dynamic Body Values](#dynamic-body-values)
In v4, the `body` option in useChat configuration would dynamically update with component state changes. In v5, the `body` value is only captured at the first render and remains static throughout the component lifecycle.
AI SDK 4.0
```
`
const [temperature, setTemperature] = useState(0.7);
const { messages } = useChat({
api: '/api/chat',
body: {
temperature, // This would update dynamically in v4
},
});
`
```
AI SDK 5.0
```
`
const [temperature, setTemperature] = useState(0.7);
// Option 1: Use request-level configuration (Recommended)
const { messages, sendMessage } = useChat({
transport: new DefaultChatTransport({ api: '/api/chat' }),
});
// Pass dynamic values at request time
sendMessage(
{ text: input },
{
body: {
temperature, // Current temperature value at request time
},
},
);
// Option 2: Use function configuration with useRef
const temperatureRef = useRef(temperature);
temperatureRef.current = temperature;
const { messages } = useChat({
transport: new DefaultChatTransport({
api: '/api/chat',
body: () =\> ({
temperature: temperatureRef.current,
}),
}),
});
`
```
For more details on request configuration, see the [Chatbot guide](/docs/ai-sdk-ui/chatbot#request-configuration).
#### [Usage Information](#usage-information)
In v4, usage information was directly accessible through the `onFinish` callback's options parameter. In v5, usage data is attached as metadata to individual messages using the `messageMetadata` function in `toUIMessageStreamResponse`.
AI SDK 4.0
```
`
const { messages } = useChat({
onFinish(message, options) {
const usage = options.usage;
console.log('Usage:', usage);
},
});
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5.0
```
`
import {
convertToModelMessages,
streamText,
UIMessage,
type LanguageModelUsage,
} from 'ai';
// Create a new metadata type (optional for type-safety)
type MyMetadata = {
totalUsage: LanguageModelUsage;
};
// Create a new custom message type with your own metadata
export type MyUIMessage = UIMessage\<MyMetadata\>;
export async function POST(req: Request) {
const { messages }: { messages: MyUIMessage[] } = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: convertToModelMessages(messages),
});
return result.toUIMessageStreamResponse({
originalMessages: messages,
messageMetadata: ({ part }) =\> {
// Send total usage when generation is finished
if (part.type === 'finish') {
return { totalUsage: part.totalUsage };
}
},
});
}
`
```
Then, on the client, you can access the message-level metadata.
AI SDK 5.0 - Client
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import type { MyUIMessage } from './api/chat/route';
import { DefaultChatTransport } from 'ai';
export default function Chat() {
// Use custom message type defined on the server (optional for type-safety)
const { messages } = useChat\<MyUIMessage\>({
transport: new DefaultChatTransport({
api: '/api/chat',
}),
});
return (
\<div className="flex flex-col w-full max-w-md py-24 mx-auto stretch"\>
{messages.map(m =\> (
\<div key={m.id} className="whitespace-pre-wrap"\>
{m.role === 'user' ? 'User: ' : 'AI: '}
{m.parts.map(part =\> {
if (part.type === 'text') {
return part.text;
}
})}
{/\* Render usage via metadata \*/}
{m.metadata?.totalUsage && (
\<div\>Total usage: {m.metadata?.totalUsage.totalTokens} tokens\</div\>
)}
\</div\>
))}
\</div\>
);
}
`
```
You can also access your metadata from the `onFinish` callback of `useChat`:
AI SDK 5.0 - onFinish
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import type { MyUIMessage } from './api/chat/route';
import { DefaultChatTransport } from 'ai';
export default function Chat() {
// Use custom message type defined on the server (optional for type-safety)
const { messages } = useChat\<MyUIMessage\>({
transport: new DefaultChatTransport({
api: '/api/chat',
}),
onFinish: ({ message }) =\> {
// Access message metadata via onFinish callback
console.log(message.metadata?.totalUsage);
},
});
}
`
```
#### [Request Body Preparation: experimental\_prepareRequestBody → prepareSendMessagesRequest](#request-body-preparation-experimental_preparerequestbody--preparesendmessagesrequest)
The `experimental\_prepareRequestBody` option has been replaced with `prepareSendMessagesRequest` in the transport configuration.
AI SDK 4.0
```
`
import { useChat } from '@ai-sdk/react';
const { messages } = useChat({
api: '/api/chat',
// Only send the last message to the server:
experimental\_prepareRequestBody({ messages, id }) {
return { message: messages[messages.length - 1], id };
},
});
`
```
AI SDK 5.0
```
`
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport } from 'ai';
const { messages } = useChat({
transport: new DefaultChatTransport({
api: '/api/chat',
// Only send the last message to the server:
prepareSendMessagesRequest({ messages, id }) {
return { body: { message: messages[messages.length - 1], id } };
},
}),
});
`
```
### [`@ai-sdk/vue` Changes](#ai-sdkvue-changes)
The Vue.js integration has been completely restructured, replacing the `useChat` composable with a `Chat` class.
#### [useChat Replaced with Chat Class](#usechat-replaced-with-chat-class)
@ai-sdk/vue v1
```
`
\<script setup\>
import { useChat } from '@ai-sdk/vue';
const { messages, input, handleSubmit } = useChat({
api: '/api/chat',
});
\</script\>
`
```
@ai-sdk/vue v2
```
`
\<script setup\>
import { Chat } from '@ai-sdk/vue';
import { DefaultChatTransport } from 'ai';
import { ref } from 'vue';
const input = ref('');
const chat = new Chat({
transport: new DefaultChatTransport({ api: '/api/chat' }),
});
const handleSubmit = (e: Event) =\> {
e.preventDefault();
chat.sendMessage({ text: input.value });
input.value = '';
};
\</script\>
`
```
#### [Message Structure Changes](#message-structure-changes)
Messages now use a `parts` array instead of a `content` string.
@ai-sdk/vue v1
```
`
\<template\>
\<div v-for="message in messages" :key="message.id"\>
\<div\>{{ message.role }}: {{ message.content }}\</div\>
\</div\>
\</template\>
`
```
@ai-sdk/vue v2
```
`
\<template\>
\<div v-for="message in chat.messages" :key="message.id"\>
\<div\>{{ message.role }}:\</div\>
\<div v-for="part in message.parts" :key="part.type"\>
\<span v-if="part.type === 'text'"\>{{ part.text }}\</span\>
\</div\>
\</div\>
\</template\>
`
```
### [`@ai-sdk/svelte` Changes](#ai-sdksvelte-changes)
The Svelte integration has also been updated with new constructor patterns and readonly properties.
#### [Constructor API Changes](#constructor-api-changes)
@ai-sdk/svelte v1
```
`
import { Chat } from '@ai-sdk/svelte';
const chatInstance = Chat({
api: '/api/chat',
});
`
```
@ai-sdk/svelte v2
```
`
import { Chat } from '@ai-sdk/svelte';
import { DefaultChatTransport } from 'ai';
const chatInstance = Chat(() =\> ({
transport: new DefaultChatTransport({ api: '/api/chat' }),
}));
`
```
##### [Properties Made Readonly](#properties-made-readonly)
Properties are now readonly and must be updated using setter methods.
@ai-sdk/svelte v1
```
`
// Direct property mutation was allowed
chatInstance.messages = [...chatInstance.messages, newMessage];
`
```
@ai-sdk/svelte v2
```
`
// Must use setter methods
chatInstance.setMessages([...chatInstance.messages, newMessage]);
`
```
##### [Removed Managed Input](#removed-managed-input)
Like React and Vue, input management has been removed from the Svelte integration.
@ai-sdk/svelte v1
```
`
// Input was managed internally
const { messages, input, handleSubmit } = chatInstance;
`
```
@ai-sdk/svelte v2
```
`
// Must manage input state manually
let input = '';
const { messages, sendMessage } = chatInstance;
const handleSubmit = () =\> {
sendMessage({ text: input });
input = '';
};
`
```
#### [`@ai-sdk/ui-utils` Package Removal](#ai-sdkui-utils-package-removal)
The `@ai-sdk/ui-utils` package has been removed and its exports moved to the main `ai` package.
AI SDK 4.0
```
`
import { getTextFromDataUrl } from '@ai-sdk/ui-utils';
`
```
AI SDK 5.0
```
`
import { getTextFromDataUrl } from 'ai';
`
```
**Note**: `processDataStream` was removed entirely in v5.0. Use `readUIMessageStream` instead for processing UI message streams, or use the more configurable Chat/useChat APIs for most use cases.
### [useCompletion Changes](#usecompletion-changes)
The `data` property has been removed from the `useCompletion` hook.
AI SDK 4.0
```
`
const {
completion,
handleSubmit,
data, // No longer available
} = useCompletion();
`
```
AI SDK 5.0
```
`
const {
completion,
handleSubmit,
// data property removed entirely
} = useCompletion();
`
```
### [useAssistant Removal](#useassistant-removal)
The `useAssistant` hook has been removed.
AI SDK 4.0
```
`
import { useAssistant } from '@ai-sdk/react';
`
```
AI SDK 5.0
```
`
// useAssistant has been removed
// Use useChat with appropriate configuration instead
`
```
For an implementation of the assistant functionality with AI SDK v5, see this [example repository](https://github.com/vercel-labs/ai-sdk-openai-assistants-api).
#### [Attachments → File Parts](#attachments--file-parts)
The `experimental\_attachments` property has been replaced with the parts array.
AI SDK 4.0
```
`
{
messages.map(message =\> (
\<div className="flex flex-col gap-2"\>
{message.content}
\<div className="flex flex-row gap-2"\>
{message.experimental\_attachments?.map((attachment, index) =\>
attachment.contentType?.includes('image/') ? (
\<img src={attachment.url} alt={attachment.name} /\>
) : attachment.contentType?.includes('text/') ? (
\<div className="w-32 h-24 p-2 overflow-hidden text-xs border rounded-md ellipsis text-zinc-500"\>
{getTextFromDataUrl(attachment.url)}
\</div\>
) : null,
)}
\</div\>
\</div\>
));
}
`
```
AI SDK 5.0
```
`
{
messages.map(message =\> (
\<div\>
{message.parts.map((part, index) =\> {
if (part.type === 'text') {
return \<div key={index}\>{part.text}\</div\>;
}
if (part.type === 'file' && part.mediaType?.startsWith('image/')) {
return (
\<div key={index}\>
\<img src={part.url} /\>
\</div\>
);
}
})}
\</div\>
));
}
`
```
Some models do not support text files (text/plain, text/markdown, text/csv,
etc.) as file parts. For text files, you can read and send the context as a text part
instead:
```
`
// Instead of this:
{ type: 'file', data: buffer, mediaType: 'text/plain' }
// Do this:
{ type: 'text', text: buffer.toString('utf-8') }
`
```
### [Embedding Changes](#embedding-changes)
#### [Provider Options for Embeddings](#provider-options-for-embeddings)
Embedding model settings now use provider options instead of model parameters.
AI SDK 4.0
```
`
const { embedding } = await embed({
model: openai('text-embedding-3-small', {
dimensions: 10,
}),
});
`
```
AI SDK 5.0
```
`
const { embedding } = await embed({
model: openai('text-embedding-3-small'),
providerOptions: {
openai: {
dimensions: 10,
},
},
});
`
```
#### [Raw Response → Response](#raw-response--response)
The `rawResponse` property has been renamed to `response`.
AI SDK 4.0
```
`
const { rawResponse } = await embed(/\* \*/);
`
```
AI SDK 5.0
```
`
const { response } = await embed(/\* \*/);
`
```
#### [Parallel Requests in embedMany](#parallel-requests-in-embedmany)
`embedMany` now makes parallel requests with a configurable `maxParallelCalls` option.
AI SDK 5.0
```
`
const { embeddings, usage } = await embedMany({
maxParallelCalls: 2, // Limit parallel requests
model: 'openai/text-embedding-3-small',
values: [
'sunny day at the beach',
'rainy afternoon in the city',
'snowy night in the mountains',
],
});
`
```
#### [LangChain Adapter Moved to `@ai-sdk/langchain`](#langchain-adapter-moved-to-ai-sdklangchain)
The `LangChainAdapter` has been moved to `@ai-sdk/langchain` and the API has been updated to use UI message streams.
AI SDK 4.0
```
`
import { LangChainAdapter } from 'ai';
const response = LangChainAdapter.toDataStreamResponse(stream);
`
```
AI SDK 5.0
```
`
import { toUIMessageStream } from '@ai-sdk/langchain';
import { createUIMessageStreamResponse } from 'ai';
const response = createUIMessageStreamResponse({
stream: toUIMessageStream(stream),
});
`
```
Don't forget to install the new package: `npm install @ai-sdk/langchain`
#### [LlamaIndex Adapter Moved to `@ai-sdk/llamaindex`](#llamaindex-adapter-moved-to-ai-sdkllamaindex)
The `LlamaIndexAdapter` has been extracted to a separate package `@ai-sdk/llamaindex` and follows the same UI message stream pattern.
AI SDK 4.0
```
`
import { LlamaIndexAdapter } from 'ai';
const response = LlamaIndexAdapter.toDataStreamResponse(stream);
`
```
AI SDK 5.0
```
`
import { toUIMessageStream } from '@ai-sdk/llamaindex';
import { createUIMessageStreamResponse } from 'ai';
const response = createUIMessageStreamResponse({
stream: toUIMessageStream(stream),
});
`
```
Don't forget to install the new package: `npm install @ai-sdk/llamaindex`
## [Streaming Architecture](#streaming-architecture)
The streaming architecture has been completely redesigned in v5 to support better content differentiation, concurrent streaming of multiple parts, and improved real-time UX.
### [Stream Protocol Changes](#stream-protocol-changes)
#### [Stream Protocol: Single Chunks → Start/Delta/End Pattern](#stream-protocol-single-chunks--startdeltaend-pattern)
The fundamental streaming pattern has changed from single chunks to a three-phase pattern with unique IDs for each content block.
AI SDK 4.0
```
`
for await (const chunk of result.fullStream) {
switch (chunk.type) {
case 'text-delta': {
process.stdout.write(chunk.textDelta);
break;
}
}
}
`
```
AI SDK 5.0
```
`
for await (const chunk of result.fullStream) {
switch (chunk.type) {
case 'text-start': {
// New: Initialize a text block with unique ID
console.log(`Starting text block: ${chunk.id}`);
break;
}
case 'text-delta': {
// Changed: Now includes ID and uses 'delta' property
process.stdout.write(chunk.delta); // Changed from 'textDelta'
break;
}
case 'text-end': {
// New: Finalize the text block
console.log(`Completed text block: ${chunk.id}`);
break;
}
}
}
`
```
#### [Reasoning Streaming Pattern](#reasoning-streaming-pattern)
Reasoning content now follows the same start/delta/end pattern:
AI SDK 4.0
```
`
for await (const chunk of result.fullStream) {
switch (chunk.type) {
case 'reasoning': {
// Single chunk with full reasoning text
console.log('Reasoning:', chunk.text);
break;
}
}
}
`
```
AI SDK 5.0
```
`
for await (const chunk of result.fullStream) {
switch (chunk.type) {
case 'reasoning-start': {
console.log(`Starting reasoning block: ${chunk.id}`);
break;
}
case 'reasoning-delta': {
process.stdout.write(chunk.delta);
break;
}
case 'reasoning-end': {
console.log(`Completed reasoning block: ${chunk.id}`);
break;
}
}
}
`
```
#### [Tool Input Streaming](#tool-input-streaming)
Tool inputs can now be streamed as they're being generated:
AI SDK 5.0
```
`
for await (const chunk of result.fullStream) {
switch (chunk.type) {
case 'tool-input-start': {
console.log(`Starting tool input for ${chunk.toolName}: ${chunk.id}`);
break;
}
case 'tool-input-delta': {
// Stream the JSON input as it's being generated
process.stdout.write(chunk.delta);
break;
}
case 'tool-input-end': {
console.log(`Completed tool input: ${chunk.id}`);
break;
}
case 'tool-call': {
// Final tool call with complete input
console.log('Tool call:', chunk.toolName, chunk.input);
break;
}
}
}
`
```
#### [onChunk Callback Changes](#onchunk-callback-changes)
The `onChunk` callback now receives the new streaming chunk types with IDs and the start/delta/end pattern.
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 4.0
```
`
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Write a story',
onChunk({ chunk }) {
switch (chunk.type) {
case 'text-delta': {
// Single property with text content
console.log('Text delta:', chunk.textDelta);
break;
}
}
},
});
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5.0
```
`
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Write a story',
onChunk({ chunk }) {
switch (chunk.type) {
case 'text-delta': {
// Text chunks now use single 'text' type
console.log('Text chunk:', chunk.text);
break;
}
case 'reasoning': {
// Reasoning chunks use single 'reasoning' type
console.log('Reasoning chunk:', chunk.text);
break;
}
case 'source': {
console.log('Source chunk:', chunk);
break;
}
case 'tool-call': {
console.log('Tool call:', chunk.toolName, chunk.input);
break;
}
case 'tool-input-start': {
console.log(
`Tool input started for ${chunk.toolName}:`,
chunk.toolCallId,
);
break;
}
case 'tool-input-delta': {
console.log(`Tool input delta for ${chunk.toolCallId}:`, chunk.delta);
break;
}
case 'tool-result': {
console.log('Tool result:', chunk.output);
break;
}
case 'raw': {
console.log('Raw chunk:', chunk);
break;
}
}
},
});
`
```
#### [File Stream Parts Restructure](#file-stream-parts-restructure)
File parts in streams have been flattened.
AI SDK 4.0
```
`
for await (const chunk of result.fullStream) {
switch (chunk.type) {
case 'file': {
console.log('Media type:', chunk.file.mediaType);
console.log('File data:', chunk.file.data);
break;
}
}
}
`
```
AI SDK 5.0
```
`
for await (const chunk of result.fullStream) {
switch (chunk.type) {
case 'file': {
console.log('Media type:', chunk.mediaType);
console.log('File data:', chunk.data);
break;
}
}
}
`
```
#### [Source Stream Parts Restructure](#source-stream-parts-restructure)
Source stream parts have been flattened.
AI SDK 4.0
```
`
for await (const part of result.fullStream) {
if (part.type === 'source' && part.source.sourceType === 'url') {
console.log('ID:', part.source.id);
console.log('Title:', part.source.title);
console.log('URL:', part.source.url);
}
}
`
```
AI SDK 5.0
```
`
for await (const part of result.fullStream) {
if (part.type === 'source' && part.sourceType === 'url') {
console.log('ID:', part.id);
console.log('Title:', part.title);
console.log('URL:', part.url);
}
}
`
```
#### [Finish Event Changes](#finish-event-changes)
Stream finish events have been renamed for consistency.
AI SDK 4.0
```
`
for await (const part of result.fullStream) {
switch (part.type) {
case 'step-finish': {
console.log('Step finished:', part.finishReason);
break;
}
case 'finish': {
console.log('Usage:', part.usage);
break;
}
}
}
`
```
AI SDK 5.0
```
`
for await (const part of result.fullStream) {
switch (part.type) {
case 'finish-step': {
// Renamed from 'step-finish'
console.log('Step finished:', part.finishReason);
break;
}
case 'finish': {
console.log('Total Usage:', part.totalUsage); // Changed from 'usage'
break;
}
}
}
`
```
### [Stream Protocol Changes](#stream-protocol-changes-1)
#### [Proprietary Protocol -\> Server-Sent Events](#proprietary-protocol---server-sent-events)
The data stream protocol has been updated to use Server-Sent Events.
AI SDK 4.0
```
`
import { createDataStream, formatDataStreamPart } from 'ai';
const dataStream = createDataStream({
execute: writer =\> {
writer.writeData('initialized call');
writer.write(formatDataStreamPart('text', 'Hello'));
writer.writeSource({
type: 'source',
sourceType: 'url',
id: 'source-1',
url: 'https://example.com',
title: 'Example Source',
});
},
});
`
```
AI SDK 5.0
```
`
import { createUIMessageStream } from 'ai';
const stream = createUIMessageStream({
execute: ({ writer }) =\> {
writer.write({ type: 'data', value: ['initialized call'] });
writer.write({ type: 'text', value: 'Hello' });
writer.write({
type: 'source-url',
value: {
type: 'source',
id: 'source-1',
url: 'https://example.com',
title: 'Example Source',
},
});
},
});
`
```
#### [Data Stream Response Helper Functions Renamed](#data-stream-response-helper-functions-renamed)
The streaming API has been completely restructured from data streams to UI message streams.
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 4.0
```
`
// Express/Node.js servers
app.post('/stream', async (req, res) =\> {
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Generate content',
});
result.pipeDataStreamToResponse(res);
});
// Next.js API routes
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Generate content',
});
return result.toDataStreamResponse();
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5.0
```
`
// Express/Node.js servers
app.post('/stream', async (req, res) =\> {
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Generate content',
});
result.pipeUIMessageStreamToResponse(res);
});
// Next.js API routes
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Generate content',
});
return result.toUIMessageStreamResponse();
`
```
#### [Stream Transform Function Renaming](#stream-transform-function-renaming)
Various stream-related functions have been renamed for consistency.
AI SDK 4.0
```
`
import { DataStreamToSSETransformStream } from 'ai';
`
```
AI SDK 5.0
```
`
import { JsonToSseTransformStream } from 'ai';
`
```
#### [Error Handling: getErrorMessage → onError](#error-handling-geterrormessage--onerror)
The `getErrorMessage` option in `toDataStreamResponse` has been replaced with `onError` in `toUIMessageStreamResponse`, providing more control over error forwarding to the client.
By default, error messages are NOT sent to the client to prevent leaking sensitive information. The `onError` callback allows you to explicitly control what error information is forwarded to the client.
AI SDK 4.0
```
`
return result.toDataStreamResponse({
getErrorMessage: error =\> {
// Return sanitized error data to send to client
// Only return what you want the client to see!
return {
errorCode: 'STREAM\_ERROR',
message: 'An error occurred while processing your request',
// In production, avoid sending error.message directly to prevent information leakage
};
},
});
`
```
AI SDK 5.0
```
`
return result.toUIMessageStreamResponse({
onError: error =\> {
// Return sanitized error data to send to client
// Only return what you want the client to see!
return {
errorCode: 'STREAM\_ERROR',
message: 'An error occurred while processing your request',
// In production, avoid sending error.message directly to prevent information leakage
};
},
});
`
```
### [Utility Changes](#utility-changes)
#### [ID Generation Changes](#id-generation-changes)
The `createIdGenerator()` function now requires a `size` argument.
AI SDK 4.0
```
`
const generator = createIdGenerator({ prefix: 'msg' });
const id = generator(16); // Custom size at call time
`
```
AI SDK 5.0
```
`
const generator = createIdGenerator({ prefix: 'msg', size: 16 });
const id = generator(); // Fixed size from creation
`
```
#### [IDGenerator → IdGenerator](#idgenerator--idgenerator)
The type name has been updated.
AI SDK 4.0
```
`
import { IDGenerator } from 'ai';
`
```
AI SDK 5.0
```
`
import { IdGenerator } from 'ai';
`
```
### [Provider Interface Changes](#provider-interface-changes)
#### [Language Model V2 Import](#language-model-v2-import)
`LanguageModelV3` must now be imported from `@ai-sdk/provider`.
AI SDK 4.0
```
`
import { LanguageModelV3 } from 'ai';
`
```
AI SDK 5.0
```
`
import { LanguageModelV3 } from '@ai-sdk/provider';
`
```
#### [Middleware Rename](#middleware-rename)
`LanguageModelV1Middleware` has been renamed and moved.
AI SDK 4.0
```
`
import { LanguageModelV1Middleware } from 'ai';
`
```
AI SDK 5.0
```
`
import { LanguageModelV3Middleware } from '@ai-sdk/provider';
`
```
#### [Usage Token Properties](#usage-token-properties)
Token usage properties have been renamed for consistency.
AI SDK 4.0
```
`
// In language model implementations
{
usage: {
promptTokens: 10,
completionTokens: 20
}
}
`
```
AI SDK 5.0
```
`
// In language model implementations
{
usage: {
inputTokens: 10,
outputTokens: 20,
totalTokens: 30 // Now required
}
}
`
```
#### [Stream Part Type Changes](#stream-part-type-changes)
The `LanguageModelV3StreamPart` type has been expanded to support the new streaming architecture with start/delta/end patterns and IDs.
AI SDK 4.0
```
`
// V4: Simple stream parts
type LanguageModelV3StreamPart =
| { type: 'text-delta'; textDelta: string }
| { type: 'reasoning'; text: string }
| { type: 'tool-call'; toolCallId: string; toolName: string; input: string };
`
```
AI SDK 5.0
```
`
// V5: Enhanced stream parts with IDs and lifecycle events
type LanguageModelV3StreamPart =
// Text blocks with start/delta/end pattern
| {
type: 'text-start';
id: string;
providerMetadata?: SharedV2ProviderMetadata;
}
| {
type: 'text-delta';
id: string;
delta: string;
providerMetadata?: SharedV2ProviderMetadata;
}
| {
type: 'text-end';
id: string;
providerMetadata?: SharedV2ProviderMetadata;
}
// Reasoning blocks with start/delta/end pattern
| {
type: 'reasoning-start';
id: string;
providerMetadata?: SharedV2ProviderMetadata;
}
| {
type: 'reasoning-delta';
id: string;
delta: string;
providerMetadata?: SharedV2ProviderMetadata;
}
| {
type: 'reasoning-end';
id: string;
providerMetadata?: SharedV2ProviderMetadata;
}
// Tool input streaming
| {
type: 'tool-input-start';
id: string;
toolName: string;
providerMetadata?: SharedV2ProviderMetadata;
}
| {
type: 'tool-input-delta';
id: string;
delta: string;
providerMetadata?: SharedV2ProviderMetadata;
}
| {
type: 'tool-input-end';
id: string;
providerMetadata?: SharedV2ProviderMetadata;
}
// Enhanced tool calls
| {
type: 'tool-call';
toolCallId: string;
toolName: string;
input: string;
providerMetadata?: SharedV2ProviderMetadata;
}
// Stream lifecycle events
| { type: 'stream-start'; warnings: Array\<SharedV3Warning\> }
| {
type: 'finish';
usage: LanguageModelV3Usage;
finishReason: LanguageModelV3FinishReason;
providerMetadata?: SharedV2ProviderMetadata;
};
`
```
#### [Raw Response → Response](#raw-response--response-1)
Provider response objects have been updated.
AI SDK 4.0
```
`
// In language model implementations
{
rawResponse: {
/\* ... \*/
}
}
`
```
AI SDK 5.0
```
`
// In language model implementations
{
response: {
/\* ... \*/
}
}
`
```
#### [`wrapLanguageModel` now stable](#wraplanguagemodel-now-stable)
AI SDK 4.0
```
`
import { experimental\_wrapLanguageModel } from 'ai';
`
```
AI SDK 5.0
```
`
import { wrapLanguageModel } from 'ai';
`
```
#### [`activeTools` No Longer Experimental](#activetools-no-longer-experimental)
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 4.0
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages,
tools: { weatherTool, locationTool },
experimental\_activeTools: ['weatherTool'],
});
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5.0
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages,
tools: { weatherTool, locationTool },
activeTools: ['weatherTool'], // No longer experimental
});
`
```
#### [`prepareStep` No Longer Experimental](#preparestep-no-longer-experimental)
The `experimental\_prepareStep` option has been promoted and no longer requires the experimental prefix.
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 4.0
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages,
tools: { weatherTool, locationTool },
experimental\_prepareStep: ({ steps, stepNumber, model }) =\> {
console.log('Preparing step:', stepNumber);
return {
activeTools: ['weatherTool'],
system: 'Be helpful and concise.',
};
},
});
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5.0
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages,
tools: { weatherTool, locationTool },
prepareStep: ({ steps, stepNumber, model }) =\> {
console.log('Preparing step:', stepNumber);
return {
activeTools: ['weatherTool'],
system: 'Be helpful and concise.',
// Can also configure toolChoice, model, etc.
};
},
});
`
```
The `prepareStep` function receives `{ steps, stepNumber, model }` and can return:
* `model`: Different model for this step
* `activeTools`: Which tools to make available
* `toolChoice`: Tool selection strategy
* `system`: System message for this step
* `undefined`: Use default settings
### [Temperature Default Removal](#temperature-default-removal)
Temperature is no longer set to `0` by default.
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 4.0
```
`
await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Write a creative story',
// Implicitly temperature: 0
});
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5.0
```
`
await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Write a creative story',
temperature: 0, // Must explicitly set
});
`
```
## [Message Persistence Changes](#message-persistence-changes)
If you have persisted messages in a database, see the [Data Migration
Guide](/docs/migration-guides/migration-guide-5-0-data) for comprehensive
guidance on migrating your stored message data to the v5 format.
In v4, you would typically use helper functions like `appendResponseMessages` or `appendClientMessage` to format messages in the `onFinish` callback of `streamText`:
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 4.0
```
`
import {
streamText,
convertToModelMessages,
appendClientMessage,
appendResponseMessages,
} from 'ai';
const updatedMessages = appendClientMessage({
messages,
message: lastUserMessage,
});
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: updatedMessages,
experimental\_generateMessageId: () =\> generateId(), // ID generation on streamText
onFinish: async ({ responseMessages, usage }) =\> {
// Use helper functions to format messages
const finalMessages = appendResponseMessages({
messages: updatedMessages,
responseMessages,
});
// Save formatted messages to database
await saveMessages(finalMessages);
},
});
`
```
In v5, message persistence is now handled through the `toUIMessageStreamResponse` method, which automatically formats response messages in the `UIMessage` format:
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5.0
```
`
import { streamText, convertToModelMessages, UIMessage } from 'ai';
const messages: UIMessage[] = [
// Your existing messages in UIMessage format
];
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: convertToModelMessages(messages),
// experimental\_generateMessageId removed from here
});
return result.toUIMessageStreamResponse({
originalMessages: messages, // IMPORTANT: Required to prevent duplicate messages
generateMessageId: () =\> generateId(), // IMPORTANT: Required for proper message ID generation
onFinish: ({ messages, responseMessage }) =\> {
// messages contains all messages (original + response) in UIMessage format
saveChat({ chatId, messages });
// responseMessage contains just the generated message in UIMessage format
saveMessage({ chatId, message: responseMessage });
},
});
`
```
**Important:** When using `toUIMessageStreamResponse`, you should always
provide both `originalMessages` and `generateMessageId` parameters. Without
these, you may experience duplicate or repeated assistant messages in your UI.
For more details, see [Troubleshooting: Repeated Assistant
Messages](/docs/troubleshooting/repeated-assistant-messages).
### [Message ID Generation](#message-id-generation)
The `experimental\_generateMessageId` option has been moved from `streamText` configuration to `toUIMessageStreamResponse`, as it's designed for use with `UIMessage`s rather than `ModelMessage`s.
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 4.0
```
`
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages,
experimental\_generateMessageId: () =\> generateId(),
});
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5.0
```
`
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: convertToModelMessages(messages),
});
return result.toUIMessageStreamResponse({
generateMessageId: () =\> generateId(), // No longer experimental
// ...
});
`
```
For more details on message IDs and persistence, see the [Chatbot Message Persistence guide](/docs/ai-sdk-ui/chatbot-message-persistence#message-ids).
### [Using createUIMessageStream](#using-createuimessagestream)
For more complex scenarios, especially when working with data parts, you can use `createUIMessageStream`:
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5.0 - Advanced
```
`
import {
createUIMessageStream,
createUIMessageStreamResponse,
streamText,
convertToModelMessages,
UIMessage,
} from 'ai';
const stream = createUIMessageStream({
originalMessages: messages,
generateId: generateId, // Required for proper message ID generation
execute: ({ writer }) =\> {
// Write custom data parts
writer.write({
type: 'data',
data: { status: 'processing', timestamp: Date.now() },
});
// Stream the AI response
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: convertToModelMessages(messages),
});
writer.merge(result.toUIMessageStream());
},
onFinish: ({ messages }) =\> {
// messages contains all messages (original + response + data parts) in UIMessage format
saveChat({ chatId, messages });
},
});
return createUIMessageStreamResponse({ stream });
`
```
## [Provider & Model Changes](#provider--model-changes)
### [OpenAI](#openai)
#### [Default Provider Instance Uses Responses API](#default-provider-instance-uses-responses-api)
In AI SDK 5, the default OpenAI provider instance uses the Responses API, while AI SDK 4 used the Chat Completions API. The Chat Completions API remains fully supported and you can use it with `openai.chat(...)`.
AI SDK 4.0
```
`
import { openai } from '@ai-sdk/openai';
const defaultModel = openai('gpt-4.1-mini'); // Chat Completions API
`
```
AI SDK 5.0
```
`
import { openai } from '@ai-sdk/openai';
const defaultModel = openai('gpt-4.1-mini'); // Responses API
// Specify a specific API when needed:
const chatCompletionsModel = openai.chat('gpt-4.1-mini');
const responsesModel = openai.responses('gpt-4.1-mini');
`
```
The Responses and Chat Completions APIs have different behavior and defaults.
If you depend on the Chat Completions API, switch your model instance to
`openai.chat(...)` and audit your configuration.
#### [Strict Schemas (`strictSchemas`) with Responses API](#strict-schemas-strictschemas-with-responses-api)
In AI SDK 4.0, you could set the `strictSchemas` option on Responses models (which defaulted to `true`). This option has been renamed to `strictJsonSchema` in AI SDK 5.0 and now defaults to `false`.
AI SDK 4.0
```
`
import { z } from 'zod';
import { generateObject } from 'ai';
import { openai, type OpenAIResponsesProviderOptions } from '@ai-sdk/openai';
const result = await generateObject({
model: openai.responses('gpt-4.1'),
schema: z.object({
// ...
}),
providerOptions: {
openai: {
strictSchemas: true, // default behavior in AI SDK 4
} satisfies OpenAIResponsesProviderOptions,
},
});
`
```
AI SDK 5.0
```
`
import { z } from 'zod';
import { generateObject } from 'ai';
import { openai, type OpenAIResponsesProviderOptions } from '@ai-sdk/openai';
const result = await generateObject({
model: openai('gpt-4.1-2024'), // uses Responses API
schema: z.object({
// ...
}),
providerOptions: {
openai: {
strictJsonSchema: true, // defaults to false, opt back in to the AI SDK 4 strict behavior
} satisfies OpenAIResponsesProviderOptions,
},
});
`
```
If you call `openai.chat(...)` to use the Chat Completions API directly, you can type it with `OpenAIChatLanguageModelOptions`. AI SDK 5 adds the same `strictJsonSchema` option there as well.
#### [Structured Outputs](#structured-outputs)
The `structuredOutputs` option is now configured using provider options rather than as a setting on the model instance.
AI SDK 4.0
```
`
import { z } from 'zod';
import { generateObject } from 'ai';
import { openai } from '@ai-sdk/openai';
const result = await generateObject({
model: openai('gpt-4.1', { structuredOutputs: true }), // use Chat Completions API
schema: z.object({ name: z.string() }),
});
`
```
AI SDK 5.0 (Chat Completions API)
```
`
import { z } from 'zod';
import { generateObject } from 'ai';
import { openai, type OpenAIChatLanguageModelOptions } from '@ai-sdk/openai';
const result = await generateObject({
model: openai.chat('gpt-4.1'), // use Chat Completions API
schema: z.object({ name: z.string() }),
providerOptions: {
openai: {
structuredOutputs: true,
} satisfies OpenAIChatLanguageModelOptions,
},
});
`
```
#### [Compatibility Option Removal](#compatibility-option-removal)
The `compatibility` option has been removed; strict compatibility mode is now the default.
AI SDK 4.0
```
`
const openai = createOpenAI({
compatibility: 'strict',
});
`
```
AI SDK 5.0
```
`
const openai = createOpenAI({
// strict compatibility is now the default
});
`
```
#### [Legacy Function Calls Removal](#legacy-function-calls-removal)
The `useLegacyFunctionCalls` option has been removed.
AI SDK 4.0
```
`
const result = streamText({
model: openai('gpt-4.1', { useLegacyFunctionCalls: true }),
});
`
```
AI SDK 5.0
```
`
const result = streamText({
model: openai('gpt-4.1'),
});
`
```
#### [Simulate Streaming](#simulate-streaming)
The `simulateStreaming` model option has been replaced with middleware.
AI SDK 4.0
```
`
const result = generateText({
model: openai('gpt-4.1', { simulateStreaming: true }),
prompt: 'Hello, world!',
});
`
```
AI SDK 5.0
```
`
import { simulateStreamingMiddleware, wrapLanguageModel } from 'ai';
const model = wrapLanguageModel({
model: openai('gpt-4.1'),
middleware: simulateStreamingMiddleware(),
});
const result = generateText({
model,
prompt: 'Hello, world!',
});
`
```
### [Google](#google)
#### [Search Grounding is now a provider defined tool](#search-grounding-is-now-a-provider-defined-tool)
Search Grounding is now called "Google Search" and is now a provider defined tool.
AI SDK 4.0
```
`
const { text, providerMetadata } = await generateText({
model: google('gemini-1.5-pro', {
useSearchGrounding: true,
}),
prompt: 'List the top 5 San Francisco news from the past week.',
});
`
```
AI SDK 5.0
```
`
import { google } from '@ai-sdk/google';
const { text, sources, providerMetadata } = await generateText({
model: google('gemini-1.5-pro'),
prompt:
'List the top 5 San Francisco news from the past week.'
tools: {
google\_search: google.tools.googleSearch({}),
},
});
`
```
### [Amazon Bedrock](#amazon-bedrock)
#### [Snake Case → Camel Case](#snake-case--camel-case)
Provider options have been updated to use camelCase.
AI SDK 4.0
```
`
const result = await generateText({
model: bedrock('amazon.titan-tg1-large'),
prompt: 'Hello, world!',
providerOptions: {
bedrock: {
reasoning\_config: {
/\* ... \*/
},
},
},
});
`
```
AI SDK 5.0
```
`
const result = await generateText({
model: bedrock('amazon.titan-tg1-large'),
prompt: 'Hello, world!',
providerOptions: {
bedrock: {
reasoningConfig: {
/\* ... \*/
},
},
},
});
`
```
### [Provider-Utils Changes](#provider-utils-changes)
Deprecated `CoreTool\*` types have been removed.
AI SDK 4.0
```
`
import {
CoreToolCall,
CoreToolResult,
CoreToolResultUnion,
CoreToolCallUnion,
CoreToolChoice,
} from '@ai-sdk/provider-utils';
`
```
AI SDK 5.0
```
`
import {
ToolCall,
ToolResult,
TypedToolResult,
TypedToolCall,
ToolChoice,
} from '@ai-sdk/provider-utils';
`
```
## [Troubleshooting](#troubleshooting)
### [TypeScript Performance Issues with Zod](#typescript-performance-issues-with-zod)
If you experience TypeScript server crashes, slow type checking, or errors like "Type instantiation is excessively deep and possibly infinite" when using Zod with AI SDK 5.0:
1. **First, ensure you're using Zod 4.1.8 or later** - this version includes a fix for module resolution issues that cause TypeScript performance problems.
2. If the issue persists, update your `tsconfig.json` to use `moduleResolution: "nodenext"`:
```
`
{
"compilerOptions": {
"moduleResolution": "nodenext"
// ... other options
}
}
`
```
This resolves the TypeScript performance issues while allowing you to continue using the standard Zod import. If this doesn't resolve the issue, you can try using a version-specific import path as an alternative solution. For detailed troubleshooting steps, see [TypeScript performance issues with Zod](/docs/troubleshooting/typescript-performance-zod).
## [Codemod Table](#codemod-table)
The following table lists available codemods for the AI SDK 5.0 upgrade
process.
For more information, see the [Codemods](#codemods) section.
|Change|Codemod|
|**AI SDK Core Changes**||
|Flatten streamText file properties|`v5/flatten-streamtext-file-properties`|
|ID Generation Changes|`v5/require-createIdGenerator-size-argument`|
|IDGenerator → IdGenerator|`v5/rename-IDGenerator-to-IdGenerator`|
|Import LanguageModelV3 from provider package|`v5/import-LanguageModelV3-from-provider-package`|
|Migrate to data stream protocol v2|`v5/migrate-to-data-stream-protocol-v2`|
|Move image model maxImagesPerCall|`v5/move-image-model-maxImagesPerCall`|
|Move LangChain adapter|`v5/move-langchain-adapter`|
|Move maxSteps to stopWhen|`v5/move-maxsteps-to-stopwhen`|
|Move provider options|`v5/move-provider-options`|
|Move React to AI SDK|`v5/move-react-to-ai-sdk`|
|Move UI utils to AI|`v5/move-ui-utils-to-ai`|
|Remove experimental wrap language model|`v5/remove-experimental-wrap-language-model`|
|Remove experimental activeTools|`v5/remove-experimental-activetools`|
|Remove experimental prepareStep|`v5/remove-experimental-preparestep`|
|Remove experimental continueSteps|`v5/remove-experimental-continuesteps`|
|Remove experimental temperature|`v5/remove-experimental-temperature`|
|Remove experimental truncate|`v5/remove-experimental-truncate`|
|Remove experimental OpenAI compatibility|`v5/remove-experimental-openai-compatibility`|
|Remove experimental OpenAI legacy function calls|`v5/remove-experimental-openai-legacy-function-calls`|
|Remove experimental OpenAI structured outputs|`v5/remove-experimental-openai-structured-outputs`|
|Remove experimental OpenAI store|`v5/remove-experimental-openai-store`|
|Remove experimental OpenAI user|`v5/remove-experimental-openai-user`|
|Remove experimental OpenAI parallel tool calls|`v5/remove-experimental-openai-parallel-tool-calls`|
|Remove experimental OpenAI response format|`v5/remove-experimental-openai-response-format`|
|Remove experimental OpenAI logit bias|`v5/remove-experimental-openai-logit-bias`|
|Remove experimental OpenAI logprobs|`v5/remove-experimental-openai-logprobs`|
|Remove experimental OpenAI seed|`v5/remove-experimental-openai-seed`|
|Remove experimental OpenAI service tier|`v5/remove-experimental-openai-service-tier`|
|Remove experimental OpenAI top logprobs|`v5/remove-experimental-openai-top-logprobs`|
|Remove experimental OpenAI transform|`v5/remove-experimental-openai-transform`|
|Remove experimental OpenAI stream options|`v5/remove-experimental-openai-stream-options`|
|Remove experimental OpenAI prediction|`v5/remove-experimental-openai-prediction`|
|Remove experimental Anthropic caching|`v5/remove-experimental-anthropic-caching`|
|Remove experimental Anthropic computer use|`v5/remove-experimental-anthropic-computer-use`|
|Remove experimental Anthropic PDF support|`v5/remove-experimental-anthropic-pdf-support`|
|Remove experimental Anthropic prompt caching|`v5/remove-experimental-anthropic-prompt-caching`|
|Remove experimental Google search grounding|`v5/remove-experimental-google-search-grounding`|
|Remove experimental Google code execution|`v5/remove-experimental-google-code-execution`|
|Remove experimental Google cached content|`v5/remove-experimental-google-cached-content`|
|Remove experimental Google custom headers|`v5/remove-experimental-google-custom-headers`|
|Rename format stream part|`v5/rename-format-stream-part`|
|Rename parse stream part|`v5/rename-parse-stream-part`|
|Replace image type with file type|`v5/replace-image-type-with-file-type`|
|Replace LlamaIndex adapter|`v5/replace-llamaindex-adapter`|
|Replace onCompletion with onFinal|`v5/replace-oncompletion-with-onfinal`|
|Replace provider metadata with provider options|`v5/replace-provider-metadata-with-provider-options`|
|Replace rawResponse with response|`v5/replace-rawresponse-with-response`|
|Replace redacted reasoning type|`v5/replace-redacted-reasoning-type`|
|Replace simulate streaming|`v5/replace-simulate-streaming`|
|Replace textDelta with text|`v5/replace-textdelta-with-text`|
|Replace usage token properties|`v5/replace-usage-token-properties`|
|Restructure file stream parts|`v5/restructure-file-stream-parts`|
|Restructure source stream parts|`v5/restructure-source-stream-parts`|
|RSC package|`v5/rsc-package`|
## [Changes Between v5 Beta Versions](#changes-between-v5-beta-versions)
This section documents breaking changes between different beta versions of AI SDK 5.0. If you're upgrading from an earlier v5 beta version to a later one, check this section for any changes that might affect your code.
### [fullStream Type Rename: text/reasoning → text-delta/reasoning-delta](#fullstream-type-rename-textreasoning--text-deltareasoning-delta)
The chunk types in `fullStream` have been renamed for consistency with UI streams and language model streams.
AI SDK 5.0 (before beta.26)
```
`
for await (const chunk of result.fullStream) {
switch (chunk.type) {
case 'text-delta': {
process.stdout.write(chunk.text);
break;
}
case 'reasoning': {
console.log('Reasoning:', chunk.text);
break;
}
}
}
`
```
AI SDK 5.0 (beta.26 and later)
```
`
for await (const chunk of result.fullStream) {
switch (chunk.type) {
case 'text-delta': {
process.stdout.write(chunk.text);
break;
}
case 'reasoning-delta': {
console.log('Reasoning:', chunk.text);
break;
}
}
}
`
```
On this page
[Migrate AI SDK 4.x to 5.0](#migrate-ai-sdk-4x-to-50)
[Recommended Migration Process](#recommended-migration-process)
[AI SDK 5 Migration MCP Server](#ai-sdk-5-migration-mcp-server)
[AI SDK 5.0 Package Versions](#ai-sdk-50-package-versions)
[Codemods](#codemods)
[AI SDK Core Changes](#ai-sdk-core-changes)
[generateText and streamText Changes](#generatetext-and-streamtext-changes)
[Maximum Output Tokens](#maximum-output-tokens)
[Message and Type System Changes](#message-and-type-system-changes)
[Core Type Renames](#core-type-renames)
[CoreMessage → ModelMessage](#coremessage--modelmessage)
[Message → UIMessage](#message--uimessage)
[convertToCoreMessages → convertToModelMessages](#converttocoremessages--converttomodelmessages)
[UIMessage Changes](#uimessage-changes)
[Content → Parts Array](#content--parts-array)
[Data Role Removed](#data-role-removed)
[UIMessage Reasoning Structure](#uimessage-reasoning-structure)
[Reasoning Part Property Rename](#reasoning-part-property-rename)
[File Part Changes](#file-part-changes)
[Stream Data Removal](#stream-data-removal)
[Custom Data Streaming: writeMessageAnnotation/writeData Removed](#custom-data-streaming-writemessageannotationwritedata-removed)
[Provider Metadata → Provider Options](#provider-metadata--provider-options)
[Tool Definition Changes (parameters → inputSchema)](#tool-definition-changes-parameters--inputschema)
[Tool Result Content: experimental\_toToolResultContent → toModelOutput](#tool-result-content-experimental_totoolresultcontent--tomodeloutput)
[Tool Property Changes (args/result → input/output)](#tool-property-changes-argsresult--inputoutput)
[Tool Execution Error Handling](#tool-execution-error-handling)
[Tool Call Streaming Now Default (toolCallStreaming Removed)](#tool-call-streaming-now-default-toolcallstreaming-removed)
[Tool Part Type Changes (UIMessage)](#tool-part-type-changes-uimessage)
[Dynamic Tools Support](#dynamic-tools-support)
[New dynamicTool Helper](#new-dynamictool-helper)
[MCP Tools Without Schemas](#mcp-tools-without-schemas)
[Type-Safe Handling with Mixed Tools](#type-safe-handling-with-mixed-tools)
[New dynamic-tool UI Part](#new-dynamic-tool-ui-part)
[Breaking Change: Type Narrowing Required for Tool Calls and Results](#breaking-change-type-narrowing-required-for-tool-calls-and-results)
[Tool UI Part State Changes](#tool-ui-part-state-changes)
[Rendering Tool Invocations (Catch-All Pattern)](#rendering-tool-invocations-catch-all-pattern)
[Media Type Standardization](#media-type-standardization)
[Reasoning Support](#reasoning-support)
[Reasoning Text Property Rename](#reasoning-text-property-rename)
[Generate Text Reasoning Property Changes](#generate-text-reasoning-property-changes)
[Continuation Steps Removal](#continuation-steps-removal)
[Image Generation Changes](#image-generation-changes)
[Step Result Changes](#step-result-changes)
[Step Type Removal](#step-type-removal)
[Step Control: maxSteps → stopWhen](#step-control-maxsteps--stopwhen)
[Usage vs Total Usage](#usage-vs-total-usage)
[AI SDK UI Changes](#ai-sdk-ui-changes)
[Package Structure Changes](#package-structure-changes)
[@ai-sdk/rsc Package Extraction](#ai-sdkrsc-package-extraction)
[React UI Hooks Moved to @ai-sdk/react](#react-ui-hooks-moved-to-ai-sdkreact)
[useChat Changes](#usechat-changes)
[maxSteps Removal](#maxsteps-removal)
[Initial Messages Renamed](#initial-messages-renamed)
[Sharing Chat Instances](#sharing-chat-instances)
[Chat Transport Architecture](#chat-transport-architecture)
[Removed Managed Input State](#removed-managed-input-state)
[Message Sending: append → sendMessage](#message-sending-append--sendmessage)
[Message Regeneration: reload → regenerate](#message-regeneration-reload--regenerate)
[onResponse Removal](#onresponse-removal)
[Send Extra Message Fields Default](#send-extra-message-fields-default)
[Keep Last Message on Error Removal](#keep-last-message-on-error-removal)
[Chat Request Options Changes](#chat-request-options-changes)
[Request Options Type Rename](#request-options-type-rename)
[addToolResult Renamed to addToolOutput](#addtoolresult-renamed-to-addtooloutput)
[Tool Result Submission Changes](#tool-result-submission-changes)
[Loading State Changes](#loading-state-changes)
[Resume Stream Support](#resume-stream-support)
[Dynamic Body Values](#dynamic-body-values)
[Usage Information](#usage-information)
[Request Body Preparation: experimental\_prepareRequestBody → prepareSendMessagesRequest](#request-body-preparation-experimental_preparerequestbody--preparesendmessagesrequest)
[@ai-sdk/vue Changes](#ai-sdkvue-changes)
[useChat Replaced with Chat Class](#usechat-replaced-with-chat-class)
[Message Structure Changes](#message-structure-changes)
[@ai-sdk/svelte Changes](#ai-sdksvelte-changes)
[Constructor API Changes](#constructor-api-changes)
[Properties Made Readonly](#properties-made-readonly)
[Removed Managed Input](#removed-managed-input)
[@ai-sdk/ui-utils Package Removal](#ai-sdkui-utils-package-removal)
[useCompletion Changes](#usecompletion-changes)
[useAssistant Removal](#useassistant-removal)
[Attachments → File Parts](#attachments--file-parts)
[Embedding Changes](#embedding-changes)
[Provider Options for Embeddings](#provider-options-for-embeddings)
[Raw Response → Response](#raw-response--response)
[Parallel Requests in embedMany](#parallel-requests-in-embedmany)
[LangChain Adapter Moved to @ai-sdk/langchain](#langchain-adapter-moved-to-ai-sdklangchain)
[LlamaIndex Adapter Moved to @ai-sdk/llamaindex](#llamaindex-adapter-moved-to-ai-sdkllamaindex)
[Streaming Architecture](#streaming-architecture)
[Stream Protocol Changes](#stream-protocol-changes)
[Stream Protocol: Single Chunks → Start/Delta/End Pattern](#stream-protocol-single-chunks--startdeltaend-pattern)
[Reasoning Streaming Pattern](#reasoning-streaming-pattern)
[Tool Input Streaming](#tool-input-streaming)
[onChunk Callback Changes](#onchunk-callback-changes)
[File Stream Parts Restructure](#file-stream-parts-restructure)
[Source Stream Parts Restructure](#source-stream-parts-restructure)
[Finish Event Changes](#finish-event-changes)
[Stream Protocol Changes](#stream-protocol-changes-1)
[Proprietary Protocol -\> Server-Sent Events](#proprietary-protocol---server-sent-events)
[Data Stream Response Helper Functions Renamed](#data-stream-response-helper-functions-renamed)
[Stream Transform Function Renaming](#stream-transform-function-renaming)
[Error Handling: getErrorMessage → onError](#error-handling-geterrormessage--onerror)
[Utility Changes](#utility-changes)
[ID Generation Changes](#id-generation-changes)
[IDGenerator → IdGenerator](#idgenerator--idgenerator)
[Provider Interface Changes](#provider-interface-changes)
[Language Model V2 Import](#language-model-v2-import)
[Middleware Rename](#middleware-rename)
[Usage Token Properties](#usage-token-properties)
[Stream Part Type Changes](#stream-part-type-changes)
[Raw Response → Response](#raw-response--response-1)
[wrapLanguageModel now stable](#wraplanguagemodel-now-stable)
[activeTools No Longer Experimental](#activetools-no-longer-experimental)
[prepareStep No Longer Experimental](#preparestep-no-longer-experimental)
[Temperature Default Removal](#temperature-default-removal)
[Message Persistence Changes](#message-persistence-changes)
[Message ID Generation](#message-id-generation)
[Using createUIMessageStream](#using-createuimessagestream)
[Provider & Model Changes](#provider--model-changes)
[OpenAI](#openai)
[Default Provider Instance Uses Responses API](#default-provider-instance-uses-responses-api)
[Strict Schemas (strictSchemas) with Responses API](#strict-schemas-strictschemas-with-responses-api)
[Structured Outputs](#structured-outputs)
[Compatibility Option Removal](#compatibility-option-removal)
[Legacy Function Calls Removal](#legacy-function-calls-removal)
[Simulate Streaming](#simulate-streaming)
[Google](#google)
[Search Grounding is now a provider defined tool](#search-grounding-is-now-a-provider-defined-tool)
[Amazon Bedrock](#amazon-bedrock)
[Snake Case → Camel Case](#snake-case--camel-case)
[Provider-Utils Changes](#provider-utils-changes)
[Troubleshooting](#troubleshooting)
[TypeScript Performance Issues with Zod](#typescript-performance-issues-with-zod)
[Codemod Table](#codemod-table)
[Changes Between v5 Beta Versions](#changes-between-v5-beta-versions)
[fullStream Type Rename: text/reasoning → text-delta/reasoning-delta](#fullstream-type-rename-textreasoning--text-deltareasoning-delta)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)