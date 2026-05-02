AI SDK Core: Event Callbacks
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
# [Event Callbacks](#event-callbacks)
The AI SDK provides per-call event callbacks that you can pass to `generateText` and `streamText` to observe lifecycle events. This is useful for building observability tools, logging systems, analytics, and debugging utilities.
## [Basic Usage](#basic-usage)
Pass callbacks directly to `generateText` or `streamText`:
```
`
import { generateText } from 'ai';
const result = await generateText({
model: openai('gpt-4o'),
prompt: 'What is the weather in San Francisco?',
experimental\_onStart: event =\> {
console.log('Generation started:', event.model.modelId);
},
onFinish: event =\> {
console.log('Generation finished:', event.totalUsage);
},
});
`
```
## [Available Callbacks](#available-callbacks)
### experimental\_onStart:
(event: OnStartEvent) =\> void | Promise\<void\>
### experimental\_onStepStart:
(event: OnStepStartEvent) =\> void | Promise\<void\>
### experimental\_onToolCallStart:
(event: OnToolCallStartEvent) =\> void | Promise\<void\>
### experimental\_onToolCallFinish:
(event: OnToolCallFinishEvent) =\> void | Promise\<void\>
### onStepFinish:
(event: OnStepFinishEvent) =\> void | Promise\<void\>
### onFinish:
(event: OnFinishEvent) =\> void | Promise\<void\>
## [Event Reference](#event-reference)
### [`experimental\_onStart`](#experimental_onstart)
Called when the generation operation begins, before any LLM calls are made.
```
`
const result = await generateText({
model: openai('gpt-4o'),
prompt: 'Hello!',
experimental\_onStart: event =\> {
console.log('Model:', event.model.modelId);
console.log('Temperature:', event.temperature);
},
});
`
```
### model:
{ provider: string; modelId: string }
### system:
string | SystemModelMessage | Array\<SystemModelMessage\> | undefined
### prompt:
string | Array\<ModelMessage\> | undefined
### messages:
Array\<ModelMessage\> | undefined
### tools:
ToolSet | undefined
### toolChoice:
ToolChoice | undefined
### activeTools:
Array\<keyof TOOLS\> | undefined
### maxOutputTokens:
number | undefined
### temperature:
number | undefined
### topP:
number | undefined
### topK:
number | undefined
### presencePenalty:
number | undefined
### frequencyPenalty:
number | undefined
### stopSequences:
string[] | undefined
### seed:
number | undefined
### maxRetries:
number
### timeout:
TimeoutConfiguration | undefined
### headers:
Record\<string, string | undefined\> | undefined
### providerOptions:
ProviderOptions | undefined
### stopWhen:
StopCondition | Array\<StopCondition\> | undefined
### output:
Output | undefined
### abortSignal:
AbortSignal | undefined
### include:
{ requestBody?: boolean; responseBody?: boolean } | undefined
### functionId:
string | undefined
### metadata:
Record\<string, unknown\> | undefined
### experimental\_context:
unknown
### [`experimental\_onStepStart`](#experimental_onstepstart)
Called before each step (LLM call) begins. Useful for tracking multi-step generations.
```
`
const result = await generateText({
model: openai('gpt-4o'),
prompt: 'Hello!',
experimental\_onStepStart: event =\> {
console.log('Step:', event.stepNumber);
console.log('Messages:', event.messages.length);
},
});
`
```
### stepNumber:
number
### model:
{ provider: string; modelId: string }
### system:
string | SystemModelMessage | Array\<SystemModelMessage\> | undefined
### messages:
Array\<ModelMessage\>
### tools:
ToolSet | undefined
### toolChoice:
LanguageModelV3ToolChoice | undefined
### activeTools:
Array\<keyof TOOLS\> | undefined
### steps:
ReadonlyArray\<StepResult\>
### providerOptions:
ProviderOptions | undefined
### timeout:
TimeoutConfiguration | undefined
### headers:
Record\<string, string | undefined\> | undefined
### stopWhen:
StopCondition | Array\<StopCondition\> | undefined
### output:
Output | undefined
### abortSignal:
AbortSignal | undefined
### include:
{ requestBody?: boolean; responseBody?: boolean } | undefined
### functionId:
string | undefined
### metadata:
Record\<string, unknown\> | undefined
### experimental\_context:
unknown
### [`experimental\_onToolCallStart`](#experimental_ontoolcallstart)
Called before a tool's `execute` function runs.
```
`
const result = await generateText({
model: openai('gpt-4o'),
prompt: 'What is the weather?',
tools: { getWeather },
experimental\_onToolCallStart: event =\> {
console.log('Tool:', event.toolCall.toolName);
console.log('Input:', event.toolCall.input);
},
});
`
```
### stepNumber:
number | undefined
### model:
{ provider: string; modelId: string } | undefined
### toolCall:
TypedToolCall
TypedToolCall
### type:
'tool-call'
### toolCallId:
string
### toolName:
string
### input:
unknown
### messages:
Array\<ModelMessage\>
### abortSignal:
AbortSignal | undefined
### functionId:
string | undefined
### metadata:
Record\<string, unknown\> | undefined
### experimental\_context:
unknown
### [`experimental\_onToolCallFinish`](#experimental_ontoolcallfinish)
Called after a tool's `execute` function completes or errors. Uses a discriminated union on the `success` field.
```
`
const result = await generateText({
model: openai('gpt-4o'),
prompt: 'What is the weather?',
tools: { getWeather },
experimental\_onToolCallFinish: event =\> {
console.log('Tool:', event.toolCall.toolName);
console.log('Duration:', event.durationMs, 'ms');
if (event.success) {
console.log('Output:', event.output);
} else {
console.error('Error:', event.error);
}
},
});
`
```
### stepNumber:
number | undefined
### model:
{ provider: string; modelId: string } | undefined
### toolCall:
TypedToolCall
TypedToolCall
### type:
'tool-call'
### toolCallId:
string
### toolName:
string
### input:
unknown
### messages:
Array\<ModelMessage\>
### abortSignal:
AbortSignal | undefined
### durationMs:
number
### functionId:
string | undefined
### metadata:
Record\<string, unknown\> | undefined
### experimental\_context:
unknown
### success:
boolean
### output:
unknown
### error:
unknown
### [`onStepFinish`](#onstepfinish)
Called after each step (LLM call) completes. Provides the full `StepResult`.
```
`
const result = await generateText({
model: openai('gpt-4o'),
prompt: 'Hello!',
onStepFinish: event =\> {
console.log('Step:', event.stepNumber);
console.log('Finish reason:', event.finishReason);
console.log('Tokens:', event.usage.totalTokens);
},
});
`
```
### stepNumber:
number
### model:
{ provider: string; modelId: string }
### finishReason:
'stop' | 'length' | 'content-filter' | 'tool-calls' | 'error' | 'other'
### usage:
LanguageModelUsage
LanguageModelUsage
### inputTokens:
number | undefined
### outputTokens:
number | undefined
### totalTokens:
number | undefined
### text:
string
### toolCalls:
Array\<TypedToolCall\>
### toolResults:
Array\<TypedToolResult\>
### content:
Array\<ContentPart\>
### reasoning:
Array\<ReasoningPart\>
### reasoningText:
string | undefined
### files:
Array\<GeneratedFile\>
### sources:
Array\<Source\>
### warnings:
CallWarning[] | undefined
### request:
LanguageModelRequestMetadata
### response:
LanguageModelResponseMetadata
### functionId:
string | undefined
### metadata:
Record\<string, unknown\> | undefined
### experimental\_context:
unknown
### providerMetadata:
ProviderMetadata | undefined
### [`onFinish`](#onfinish)
Called when the entire generation completes (all steps finished). Includes aggregated data.
```
`
const result = await generateText({
model: openai('gpt-4o'),
prompt: 'Hello!',
onFinish: event =\> {
console.log('Total steps:', event.steps.length);
console.log('Total tokens:', event.totalUsage.totalTokens);
console.log('Final text:', event.text);
},
});
`
```
### steps:
Array\<StepResult\>
### totalUsage:
LanguageModelUsage
LanguageModelUsage
### inputTokens:
number | undefined
### outputTokens:
number | undefined
### totalTokens:
number | undefined
### stepNumber:
number
### model:
{ provider: string; modelId: string }
### finishReason:
'stop' | 'length' | 'content-filter' | 'tool-calls' | 'error' | 'other'
### usage:
LanguageModelUsage
### text:
string
### toolCalls:
Array\<TypedToolCall\>
### toolResults:
Array\<TypedToolResult\>
### content:
Array\<ContentPart\>
### reasoning:
Array\<ReasoningPart\>
### reasoningText:
string | undefined
### files:
Array\<GeneratedFile\>
### sources:
Array\<Source\>
### warnings:
CallWarning[] | undefined
### request:
LanguageModelRequestMetadata
### response:
LanguageModelResponseMetadata
### functionId:
string | undefined
### metadata:
Record\<string, unknown\> | undefined
### experimental\_context:
unknown
### providerMetadata:
ProviderMetadata | undefined
## [Use Cases](#use-cases)
### [Logging and Debugging](#logging-and-debugging)
```
`
import { generateText } from 'ai';
const result = await generateText({
model: openai('gpt-4o'),
prompt: 'Hello!',
experimental\_onStart: event =\> {
console.log(`[${new Date().toISOString()}] Generation started`, {
model: event.model.modelId,
provider: event.model.provider,
});
},
onStepFinish: event =\> {
console.log(
`[${new Date().toISOString()}] Step ${event.stepNumber} finished`,
{
finishReason: event.finishReason,
tokens: event.usage.totalTokens,
},
);
},
onFinish: event =\> {
console.log(`[${new Date().toISOString()}] Generation complete`, {
totalSteps: event.steps.length,
totalTokens: event.totalUsage.totalTokens,
});
},
});
`
```
### [Tool Execution Monitoring](#tool-execution-monitoring)
```
`
import { generateText } from 'ai';
const result = await generateText({
model: openai('gpt-4o'),
prompt: 'What is the weather?',
tools: { getWeather },
experimental\_onToolCallStart: event =\> {
console.log(`Tool "${event.toolCall.toolName}" starting...`);
},
experimental\_onToolCallFinish: event =\> {
if (event.success) {
console.log(
`Tool "${event.toolCall.toolName}" completed in ${event.durationMs}ms`,
);
} else {
console.error(`Tool "${event.toolCall.toolName}" failed:`, event.error);
}
},
});
`
```
## [Error Handling](#error-handling)
Errors thrown inside callbacks are caught and do not break the generation flow. This ensures that monitoring code cannot disrupt your application:
```
`
const result = await generateText({
model: openai('gpt-4o'),
prompt: 'Hello!',
experimental\_onStart: () =\> {
throw new Error('This error is caught internally');
// Generation continues normally
},
});
`
```
On this page
[Event Callbacks](#event-callbacks)
[Basic Usage](#basic-usage)
[Available Callbacks](#available-callbacks)
[Event Reference](#event-reference)
[experimental\_onStart](#experimental_onstart)
[experimental\_onStepStart](#experimental_onstepstart)
[experimental\_onToolCallStart](#experimental_ontoolcallstart)
[experimental\_onToolCallFinish](#experimental_ontoolcallfinish)
[onStepFinish](#onstepfinish)
[onFinish](#onfinish)
[Use Cases](#use-cases)
[Logging and Debugging](#logging-and-debugging)
[Tool Execution Monitoring](#tool-execution-monitoring)
[Error Handling](#error-handling)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)