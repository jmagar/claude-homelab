AI SDK Core: Error Handling
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
# [Error Handling](#error-handling)
## [Handling regular errors](#handling-regular-errors)
Regular errors are thrown and can be handled using the `try/catch` block.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText } from 'ai';
try {
const { text } = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Write a vegetarian lasagna recipe for 4 people.',
});
} catch (error) {
// handle error
}
`
```
See [Error Types](/docs/reference/ai-sdk-errors) for more information on the different types of errors that may be thrown.
## [Handling streaming errors (simple streams)](#handling-streaming-errors-simple-streams)
When errors occur during streams that do not support error chunks,
the error is thrown as a regular error.
You can handle these errors using the `try/catch` block.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { streamText } from 'ai';
try {
const { textStream } = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Write a vegetarian lasagna recipe for 4 people.',
});
for await (const textPart of textStream) {
process.stdout.write(textPart);
}
} catch (error) {
// handle error
}
`
```
## [Handling streaming errors (streaming with `error` support)](#handling-streaming-errors-streaming-with-error-support)
Full streams support error parts.
You can handle those parts similar to other parts.
It is recommended to also add a try-catch block for errors that
happen outside of the streaming.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { streamText } from 'ai';
try {
const { fullStream } = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Write a vegetarian lasagna recipe for 4 people.',
});
for await (const part of fullStream) {
switch (part.type) {
// ... handle other part types
case 'error': {
const error = part.error;
// handle error
break;
}
case 'abort': {
// handle stream abort
break;
}
case 'tool-error': {
const error = part.error;
// handle error
break;
}
}
}
} catch (error) {
// handle error
}
`
```
## [Handling stream aborts](#handling-stream-aborts)
When streams are aborted (e.g., via chat stop button), you may want to perform cleanup operations like updating stored messages in your UI. Use the `onAbort` callback to handle these cases.
The `onAbort` callback is called when a stream is aborted via `AbortSignal`, but `onFinish` is not called. This ensures you can still update your UI state appropriately.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { streamText } from 'ai';
const { textStream } = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Write a vegetarian lasagna recipe for 4 people.',
onAbort: ({ steps }) =\> {
// Update stored messages or perform cleanup
console.log('Stream aborted after', steps.length, 'steps');
},
onFinish: ({ steps, totalUsage }) =\> {
// This is called on normal completion
console.log('Stream completed normally');
},
});
for await (const textPart of textStream) {
process.stdout.write(textPart);
}
`
```
The `onAbort` callback receives:
* `steps`: An array of all completed steps before the abort
You can also handle abort events directly in the stream:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { streamText } from 'ai';
const { fullStream } = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Write a vegetarian lasagna recipe for 4 people.',
});
for await (const chunk of fullStream) {
switch (chunk.type) {
case 'abort': {
// Handle abort directly in stream
console.log('Stream was aborted');
break;
}
// ... handle other part types
}
}
`
```
On this page
[Error Handling](#error-handling)
[Handling regular errors](#handling-regular-errors)
[Handling streaming errors (simple streams)](#handling-streaming-errors-simple-streams)
[Handling streaming errors (streaming with error support)](#handling-streaming-errors-streaming-with-error-support)
[Handling stream aborts](#handling-stream-aborts)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)