AI SDK Core: Generating Text
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
# [Generating and Streaming Text](#generating-and-streaming-text)
Large language models (LLMs) can generate text in response to a prompt, which can contain instructions and information to process.
For example, you can ask a model to come up with a recipe, draft an email, or summarize a document.
The AI SDK Core provides two functions to generate text and stream it from LLMs:
* [`generateText`](#generatetext): Generates text for a given prompt and model.
* [`streamText`](#streamtext): Streams text from a given prompt and model.
Advanced LLM features such as [tool calling](./tools-and-tool-calling) and [structured data generation](./generating-structured-data) are built on top of text generation.
## [`generateText`](#generatetext)
You can generate text using the [`generateText`](/docs/reference/ai-sdk-core/generate-text) function. This function is ideal for non-interactive use cases where you need to write text (e.g. drafting email or summarizing web pages) and for agents that use tools.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText } from 'ai';
const { text } = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Write a vegetarian lasagna recipe for 4 people.',
});
`
```
You can use more [advanced prompts](./prompts) to generate text with more complex instructions and content:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText } from 'ai';
const { text } = await generateText({
model: "anthropic/claude-sonnet-4.5",
system:
'You are a professional writer. ' +
'You write simple, clear, and concise content.',
prompt: `Summarize the following article in 3-5 sentences: ${article}`,
});
`
```
The result object of `generateText` contains several promises that resolve when all required data is available:
* `result.content`: The content that was generated in the last step.
* `result.text`: The generated text.
* `result.reasoning`: The full reasoning that the model has generated in the last step.
* `result.reasoningText`: The reasoning text of the model (only available for some models).
* `result.files`: The files that were generated in the last step.
* `result.sources`: Sources that have been used as references in the last step (only available for some models).
* `result.toolCalls`: The tool calls that were made in the last step.
* `result.toolResults`: The results of the tool calls from the last step.
* `result.finishReason`: The reason the model finished generating text.
* `result.rawFinishReason`: The raw reason why the generation finished (from the provider).
* `result.usage`: The usage of the model during the final step of text generation.
* `result.totalUsage`: The total usage across all steps (for multi-step generations).
* `result.warnings`: Warnings from the model provider (e.g. unsupported settings).
* `result.request`: Additional request information.
* `result.response`: Additional response information, including response messages and body.
* `result.providerMetadata`: Additional provider-specific metadata.
* `result.steps`: Details for all steps, useful for getting information about intermediate steps.
* `result.output`: The generated structured output using the `output` specification.
### [Accessing response headers & body](#accessing-response-headers--body)
Sometimes you need access to the full response from the model provider,
e.g. to access some provider-specific headers or body content.
You can access the raw response headers and body using the `response` property:
```
`
import { generateText } from 'ai';
const result = await generateText({
// ...
});
console.log(JSON.stringify(result.response.headers, null, 2));
console.log(JSON.stringify(result.response.body, null, 2));
`
```
### [`onFinish` callback](#onfinish-callback)
When using `generateText`, you can provide an `onFinish` callback that is triggered after the last step is finished (
[API Reference](/docs/reference/ai-sdk-core/generate-text#on-finish)
).
It contains the text, usage information, finish reason, messages, steps, total usage, and more:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText } from 'ai';
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Invent a new holiday and describe its traditions.',
onFinish({ text, finishReason, usage, response, steps, totalUsage }) {
// your own logic, e.g. for saving the chat history or recording usage
const messages = response.messages; // messages that were generated
},
});
`
```
### [Lifecycle callbacks (experimental)](#lifecycle-callbacks-experimental)
Experimental callbacks are subject to breaking changes in incremental package
releases.
`generateText` provides several experimental lifecycle callbacks that let you hook into different phases of the generation process.
These are useful for logging, observability, debugging, and custom telemetry.
Errors thrown inside these callbacks are silently caught and do not break the generation flow.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText } from 'ai';
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'What is the weather in San Francisco?',
tools: {
// ... your tools
},
experimental\_onStart({ model, settings, functionId }) {
console.log('Generation started', { model, functionId });
},
experimental\_onStepStart({ stepNumber, model, promptMessages }) {
console.log(`Step ${stepNumber} starting`, { model: model.modelId });
},
experimental\_onToolCallStart({ toolName, toolCallId, input }) {
console.log(`Tool call starting: ${toolName}`, { toolCallId });
},
experimental\_onToolCallFinish({ toolName, durationMs, error }) {
console.log(`Tool call finished: ${toolName} (${durationMs}ms)`, {
success: !error,
});
},
onStepFinish({ stepNumber, finishReason, usage }) {
console.log(`Step ${stepNumber} finished`, { finishReason, usage });
},
});
`
```
The available lifecycle callbacks are:
* **`experimental\_onStart`**: Called once when the `generateText` operation begins, before any LLM calls. Receives model info, prompt, settings, and telemetry metadata.
* **`experimental\_onStepStart`**: Called before each step (LLM call). Receives the step number, model, prompt messages being sent, tools, and prior steps.
* **`experimental\_onToolCallStart`**: Called right before a tool's `execute` function runs. Receives the tool name, call ID, and input.
* **`experimental\_onToolCallFinish`**: Called right after a tool's `execute` function completes or errors. Receives the tool name, call ID, input, output (or undefined on error), error (or undefined on success), and `durationMs`.
* **`onStepFinish`**: Called after each step finishes. Now also includes `stepNumber` (zero-based index of the completed step).
## [`streamText`](#streamtext)
Depending on your model and prompt, it can take a large language model (LLM) up to a minute to finish generating its response. This delay can be unacceptable for interactive use cases such as chatbots or real-time applications, where users expect immediate responses.
AI SDK Core provides the [`streamText`](/docs/reference/ai-sdk-core/stream-text) function which simplifies streaming text from LLMs:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { streamText } from 'ai';
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Invent a new holiday and describe its traditions.',
});
// example: use textStream as an async iterable
for await (const textPart of result.textStream) {
console.log(textPart);
}
`
```
`result.textStream` is both a `ReadableStream` and an `AsyncIterable`.
`streamText` immediately starts streaming and suppresses errors to prevent
server crashes. Use the `onError` callback to log errors.
You can use `streamText` on its own or in combination with [AI SDK
UI](/examples/next-pages/basics/streaming-text-generation) and [AI SDK
RSC](/examples/next-app/basics/streaming-text-generation).
The result object contains several helper functions to make the integration into [AI SDK UI](/docs/ai-sdk-ui) easier:
* `result.toUIMessageStreamResponse()`: Creates a UI Message stream HTTP response (with tool calls etc.) that can be used in a Next.js App Router API route.
* `result.pipeUIMessageStreamToResponse()`: Writes UI Message stream delta output to a Node.js response-like object.
* `result.toTextStreamResponse()`: Creates a simple text stream HTTP response.
* `result.pipeTextStreamToResponse()`: Writes text delta output to a Node.js response-like object.
`streamText` is using backpressure and only generates tokens as they are
requested. You need to consume the stream in order for it to finish.
It also provides several promises that resolve when the stream is finished:
* `result.content`: The content that was generated in the last step.
* `result.text`: The generated text.
* `result.reasoning`: The full reasoning that the model has generated.
* `result.reasoningText`: The reasoning text of the model (only available for some models).
* `result.files`: Files that have been generated by the model in the last step.
* `result.sources`: Sources that have been used as references in the last step (only available for some models).
* `result.toolCalls`: The tool calls that have been executed in the last step.
* `result.toolResults`: The tool results that have been generated in the last step.
* `result.finishReason`: The reason the model finished generating text.
* `result.rawFinishReason`: The raw reason why the generation finished (from the provider).
* `result.usage`: The usage of the model during the final step of text generation.
* `result.totalUsage`: The total usage across all steps (for multi-step generations).
* `result.warnings`: Warnings from the model provider (e.g. unsupported settings).
* `result.steps`: Details for all steps, useful for getting information about intermediate steps.
* `result.request`: Additional request information from the last step.
* `result.response`: Additional response information from the last step.
* `result.providerMetadata`: Additional provider-specific metadata from the last step.
### [`onError` callback](#onerror-callback)
`streamText` immediately starts streaming to enable sending data without waiting for the model.
Errors become part of the stream and are not thrown to prevent e.g. servers from crashing.
To log errors, you can provide an `onError` callback that is triggered when an error occurs.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { streamText } from 'ai';
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Invent a new holiday and describe its traditions.',
onError({ error }) {
console.error(error); // your error logging logic here
},
});
`
```
### [`onChunk` callback](#onchunk-callback)
When using `streamText`, you can provide an `onChunk` callback that is triggered for each chunk of the stream.
It receives the following chunk types:
* `text`
* `reasoning`
* `source`
* `tool-call`
* `tool-input-start`
* `tool-input-delta`
* `tool-result`
* `raw`
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { streamText } from 'ai';
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Invent a new holiday and describe its traditions.',
onChunk({ chunk }) {
// implement your own logic here, e.g.:
if (chunk.type === 'text') {
console.log(chunk.text);
}
},
});
`
```
### [`onFinish` callback](#onfinish-callback-1)
When using `streamText`, you can provide an `onFinish` callback that is triggered when the stream is finished (
[API Reference](/docs/reference/ai-sdk-core/stream-text#on-finish)
).
It contains the text, usage information, finish reason, messages, steps, total usage, and more:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { streamText } from 'ai';
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Invent a new holiday and describe its traditions.',
onFinish({ text, finishReason, usage, response, steps, totalUsage }) {
// your own logic, e.g. for saving the chat history or recording usage
const messages = response.messages; // messages that were generated
},
});
`
```
### [Lifecycle callbacks (experimental)](#lifecycle-callbacks-experimental-1)
Experimental callbacks are subject to breaking changes in incremental package
releases.
`streamText` provides several experimental lifecycle callbacks that let you hook into different phases of the streaming process.
These are useful for logging, observability, debugging, and custom telemetry.
Errors thrown inside these callbacks are silently caught and do not break the streaming flow.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { streamText } from 'ai';
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'What is the weather in San Francisco?',
tools: {
// ... your tools
},
experimental\_onStart({ model, system, prompt, messages }) {
console.log('Streaming started', { model, prompt });
},
experimental\_onStepStart({ stepNumber, model, messages }) {
console.log(`Step ${stepNumber} starting`, { model: model.modelId });
},
experimental\_onToolCallStart({ toolCall }) {
console.log(`Tool call starting: ${toolCall.toolName}`, {
toolCallId: toolCall.toolCallId,
});
},
experimental\_onToolCallFinish({ toolCall, durationMs, success, error }) {
console.log(`Tool call finished: ${toolCall.toolName} (${durationMs}ms)`, {
success,
});
},
onStepFinish({ finishReason, usage }) {
console.log('Step finished', { finishReason, usage });
},
});
`
```
The available lifecycle callbacks are:
* **`experimental\_onStart`**: Called once when the `streamText` operation begins, before any LLM calls. Receives model info, prompt, settings, and telemetry metadata.
* **`experimental\_onStepStart`**: Called before each step (LLM call). Receives the step number, model, messages being sent, tools, and prior steps.
* **`experimental\_onToolCallStart`**: Called right before a tool's `execute` function runs. Receives the tool call object, messages, and context.
* **`experimental\_onToolCallFinish`**: Called right after a tool's `execute` function completes or errors. Receives the tool call object, `durationMs`, and a discriminated union with `success`/`output` or `success`/`error`.
* **`onStepFinish`**: Called after each step finishes. Receives the finish reason, usage, and other step details.
### [`fullStream` property](#fullstream-property)
You can read a stream with all events using the `fullStream` property.
This can be useful if you want to implement your own UI or handle the stream in a different way.
Here is an example of how to use the `fullStream` property:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { streamText } from 'ai';
import { z } from 'zod';
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
tools: {
cityAttractions: {
inputSchema: z.object({ city: z.string() }),
execute: async ({ city }) =\> ({
attractions: ['attraction1', 'attraction2', 'attraction3'],
}),
},
},
prompt: 'What are some San Francisco tourist attractions?',
});
for await (const part of result.fullStream) {
switch (part.type) {
case 'start': {
// handle start of stream
break;
}
case 'start-step': {
// handle start of step
break;
}
case 'text-start': {
// handle text start
break;
}
case 'text-delta': {
// handle text delta here
break;
}
case 'text-end': {
// handle text end
break;
}
case 'reasoning-start': {
// handle reasoning start
break;
}
case 'reasoning-delta': {
// handle reasoning delta here
break;
}
case 'reasoning-end': {
// handle reasoning end
break;
}
case 'source': {
// handle source here
break;
}
case 'file': {
// handle file here
break;
}
case 'tool-call': {
switch (part.toolName) {
case 'cityAttractions': {
// handle tool call here
break;
}
}
break;
}
case 'tool-input-start': {
// handle tool input start
break;
}
case 'tool-input-delta': {
// handle tool input delta
break;
}
case 'tool-input-end': {
// handle tool input end
break;
}
case 'tool-result': {
switch (part.toolName) {
case 'cityAttractions': {
// handle tool result here
break;
}
}
break;
}
case 'tool-error': {
// handle tool error
break;
}
case 'finish-step': {
// handle finish step
break;
}
case 'finish': {
// handle finish here
break;
}
case 'error': {
// handle error here
break;
}
case 'raw': {
// handle raw value
break;
}
}
}
`
```
### [Stream transformation](#stream-transformation)
You can use the `experimental\_transform` option to transform the stream.
This is useful for e.g. filtering, changing, or smoothing the text stream.
The transformations are applied before the callbacks are invoked and the promises are resolved.
If you e.g. have a transformation that changes all text to uppercase, the `onFinish` callback will receive the transformed text.
#### [Smoothing streams](#smoothing-streams)
The AI SDK Core provides a [`smoothStream` function](/docs/reference/ai-sdk-core/smooth-stream) that
can be used to smooth out text and reasoning streaming.
```
`
import { smoothStream, streamText } from 'ai';
const result = streamText({
model,
prompt,
experimental\_transform: smoothStream(),
});
`
```
#### [Custom transformations](#custom-transformations)
You can also implement your own custom transformations.
The transformation function receives the tools that are available to the model,
and returns a function that is used to transform the stream.
Tools can either be generic or limited to the tools that you are using.
Here is an example of how to implement a custom transformation that converts
all text to uppercase:
```
`
import { streamText, type TextStreamPart, type ToolSet } from 'ai';
const upperCaseTransform =
\<TOOLS extends ToolSet\>() =\>
(options: { tools: TOOLS; stopStream: () =\> void }) =\>
new TransformStream\<TextStreamPart\<TOOLS\>, TextStreamPart\<TOOLS\>\>({
transform(chunk, controller) {
controller.enqueue(
// for text-delta chunks, convert the text to uppercase:
chunk.type === 'text-delta'
? { ...chunk, text: chunk.text.toUpperCase() }
: chunk,
);
},
});
`
```
You can also stop the stream using the `stopStream` function.
This is e.g. useful if you want to stop the stream when model guardrails are violated, e.g. by generating inappropriate content.
When you invoke `stopStream`, it is important to simulate the `finish-step` and `finish` events to guarantee that a well-formed stream is returned
and all callbacks are invoked.
```
`
import { streamText, type TextStreamPart, type ToolSet } from 'ai';
const stopWordTransform =
\<TOOLS extends ToolSet\>() =\>
({ stopStream }: { stopStream: () =\> void }) =\>
new TransformStream\<TextStreamPart\<TOOLS\>, TextStreamPart\<TOOLS\>\>({
// note: this is a simplified transformation for testing;
// in a real-world version more there would need to be
// stream buffering and scanning to correctly emit prior text
// and to detect all STOP occurrences.
transform(chunk, controller) {
if (chunk.type !== 'text-delta') {
controller.enqueue(chunk);
return;
}
if (chunk.text.includes('STOP')) {
// stop the stream
stopStream();
// simulate the finish-step event
controller.enqueue({
type: 'finish-step',
finishReason: 'stop',
rawFinishReason: 'stop',
usage: {
completionTokens: NaN,
promptTokens: NaN,
totalTokens: NaN,
},
response: {
id: 'response-id',
modelId: 'mock-model-id',
timestamp: new Date(0),
},
providerMetadata: undefined,
});
// simulate the finish event
controller.enqueue({
type: 'finish',
finishReason: 'stop',
rawFinishReason: 'stop',
totalUsage: {
completionTokens: NaN,
promptTokens: NaN,
totalTokens: NaN,
},
});
return;
}
controller.enqueue(chunk);
},
});
`
```
#### [Multiple transformations](#multiple-transformations)
You can also provide multiple transformations. They are applied in the order they are provided.
```
`
const result = streamText({
model,
prompt,
experimental\_transform: [firstTransform, secondTransform],
});
`
```
## [Sources](#sources)
Some providers such as [Perplexity](/providers/ai-sdk-providers/perplexity#sources) and
[Google Generative AI](/providers/ai-sdk-providers/google-generative-ai#sources) include sources in the response.
Currently sources are limited to web pages that ground the response.
You can access them using the `sources` property of the result.
Each `url` source contains the following properties:
* `id`: The ID of the source.
* `url`: The URL of the source.
* `title`: The optional title of the source.
* `providerMetadata`: Provider metadata for the source.
When you use `generateText`, you can access the sources using the `sources` property:
```
`
const result = await generateText({
model: 'google/gemini-2.5-flash',
tools: {
google\_search: google.tools.googleSearch({}),
},
prompt: 'List the top 5 San Francisco news from the past week.',
});
for (const source of result.sources) {
if (source.sourceType === 'url') {
console.log('ID:', source.id);
console.log('Title:', source.title);
console.log('URL:', source.url);
console.log('Provider metadata:', source.providerMetadata);
console.log();
}
}
`
```
When you use `streamText`, you can access the sources using the `fullStream` property:
```
`
const result = streamText({
model: 'google/gemini-2.5-flash',
tools: {
google\_search: google.tools.googleSearch({}),
},
prompt: 'List the top 5 San Francisco news from the past week.',
});
for await (const part of result.fullStream) {
if (part.type === 'source' && part.sourceType === 'url') {
console.log('ID:', part.id);
console.log('Title:', part.title);
console.log('URL:', part.url);
console.log('Provider metadata:', part.providerMetadata);
console.log();
}
}
`
```
The sources are also available in the `result.sources` promise.
## [Examples](#examples)
You can see `generateText` and `streamText` in action using various frameworks in the following examples:
### [`generateText`](#generatetext-1)
[
Learn to generate text in Node.js
](/examples/node/generating-text/generate-text)[
Learn to generate text in Next.js with Route Handlers (AI SDK UI)
](/examples/next-pages/basics/generating-text)[
Learn to generate text in Next.js with Server Actions (AI SDK RSC)
](/examples/next-app/basics/generating-text)
### [`streamText`](#streamtext-1)
[
Learn to stream text in Node.js
](/examples/node/generating-text/stream-text)[
Learn to stream text in Next.js with Route Handlers (AI SDK UI)
](/examples/next-pages/basics/streaming-text-generation)[
Learn to stream text in Next.js with Server Actions (AI SDK RSC)
](/examples/next-app/basics/streaming-text-generation)
On this page
[Generating and Streaming Text](#generating-and-streaming-text)
[generateText](#generatetext)
[Accessing response headers & body](#accessing-response-headers--body)
[onFinish callback](#onfinish-callback)
[Lifecycle callbacks (experimental)](#lifecycle-callbacks-experimental)
[streamText](#streamtext)
[onError callback](#onerror-callback)
[onChunk callback](#onchunk-callback)
[onFinish callback](#onfinish-callback-1)
[Lifecycle callbacks (experimental)](#lifecycle-callbacks-experimental-1)
[fullStream property](#fullstream-property)
[Stream transformation](#stream-transformation)
[Smoothing streams](#smoothing-streams)
[Custom transformations](#custom-transformations)
[Multiple transformations](#multiple-transformations)
[Sources](#sources)
[Examples](#examples)
[generateText](#generatetext-1)
[streamText](#streamtext-1)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)