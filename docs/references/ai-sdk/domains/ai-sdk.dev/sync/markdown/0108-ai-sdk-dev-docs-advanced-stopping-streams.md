Advanced: Stopping Streams
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
[Prompt Engineering](/docs/advanced/prompt-engineering)
[Stopping Streams](/docs/advanced/stopping-streams)
[Backpressure](/docs/advanced/backpressure)
[Caching](/docs/advanced/caching)
[Multiple Streamables](/docs/advanced/multiple-streamables)
[Rate Limiting](/docs/advanced/rate-limiting)
[Rendering UI with Language Models](/docs/advanced/rendering-ui-with-language-models)
[Language Models as Routers](/docs/advanced/model-as-router)
[Multistep Interfaces](/docs/advanced/multistep-interfaces)
[Sequential Generations](/docs/advanced/sequential-generations)
[Vercel Deployment Guide](/docs/advanced/vercel-deployment-guide)
[Reference](/docs/reference)
[AI SDK Core](/docs/reference/ai-sdk-core)
[AI SDK UI](/docs/reference/ai-sdk-ui)
[AI SDK RSC](/docs/reference/ai-sdk-rsc)
[AI SDK Errors](/docs/reference/ai-sdk-errors)
[Migration Guides](/docs/migration-guides)
[Troubleshooting](/docs/troubleshooting)
Copy markdown
# [Stopping Streams](#stopping-streams)
Canceling ongoing streams is often needed.
For example, users might want to stop a stream when they realize that the response is not what they want.
The different parts of the AI SDK support canceling streams in different ways.
## [AI SDK Core](#ai-sdk-core)
The AI SDK functions have an `abortSignal` argument that you can use to cancel a stream.
You would use this if you want to cancel a stream from the server side to the LLM API, e.g. by
forwarding the `abortSignal` from the request.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { streamText } from 'ai';
export async function POST(req: Request) {
const { prompt } = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt,
// forward the abort signal:
abortSignal: req.signal,
onAbort: ({ steps }) =\> {
// Handle cleanup when stream is aborted
console.log('Stream aborted after', steps.length, 'steps');
// Persist partial results to database
},
});
return result.toTextStreamResponse();
}
`
```
## [AI SDK UI](#ai-sdk-ui)
The hooks, e.g. `useChat` or `useCompletion`, provide a `stop` helper function that can be used to cancel a stream.
This will cancel the stream from the client side to the server.
Stream abort functionality is not compatible with stream resumption. If you're
using `resume: true` in `useChat`, the abort functionality will break the
resumption mechanism. Choose either abort or resume functionality, but not
both.
```
`
'use client';
import { useCompletion } from '@ai-sdk/react';
export default function Chat() {
const { input, completion, stop, status, handleSubmit, handleInputChange } =
useCompletion();
return (
\<div\>
{(status === 'submitted' || status === 'streaming') && (
\<button type="button" onClick={() =\> stop()}\>
Stop
\</button\>
)}
{completion}
\<form onSubmit={handleSubmit}\>
\<input value={input} onChange={handleInputChange} /\>
\</form\>
\</div\>
);
}
`
```
## [Handling stream abort cleanup](#handling-stream-abort-cleanup)
When streams are aborted, you may need to perform cleanup operations such as persisting partial results or cleaning up resources. The `onAbort` callback provides a way to handle these scenarios on the server side.
Unlike `onFinish`, which is called when a stream completes normally, `onAbort` is specifically called when a stream is aborted via `AbortSignal`. This distinction allows you to handle normal completion and aborted streams differently.
For UI message streams (`toUIMessageStreamResponse`), the `onFinish` callback
also receives an `isAborted` parameter that indicates whether the stream was
aborted. This allows you to handle both completion and abort scenarios in a
single callback.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { streamText } from 'ai';
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Write a long story...',
abortSignal: controller.signal,
onAbort: ({ steps }) =\> {
// Called when stream is aborted - persist partial results
await savePartialResults(steps);
await logAbortEvent(steps.length);
},
onFinish: ({ steps, totalUsage }) =\> {
// Called when stream completes normally
await saveFinalResults(steps, totalUsage);
},
});
`
```
The `onAbort` callback receives:
* `steps`: Array of all completed steps before the abort occurred
This is particularly useful for:
* Persisting partial conversation history to database
* Saving partial progress for later continuation
* Cleaning up server-side resources or connections
* Logging abort events for analytics
You can also handle abort events directly in the stream using the `abort` stream part:
```
`
for await (const part of result.fullStream) {
switch (part.type) {
case 'text-delta':
// Handle text delta content
break;
case 'abort':
// Handle abort event directly in stream
console.log('Stream was aborted');
break;
// ... other cases
}
}
`
```
## [UI Message Streams](#ui-message-streams)
When using `toUIMessageStreamResponse`, you need to handle stream abortion slightly differently. The `onFinish` callback receives an `isAborted` parameter, and you should pass the `consumeStream` function to ensure proper abort handling:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { openai } from '@ai-sdk/openai';
import {
consumeStream,
convertToModelMessages,
streamText,
UIMessage,
} from 'ai';
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: await convertToModelMessages(messages),
abortSignal: req.signal,
});
return result.toUIMessageStreamResponse({
onFinish: async ({ isAborted }) =\> {
if (isAborted) {
console.log('Stream was aborted');
// Handle abort-specific cleanup
} else {
console.log('Stream completed normally');
// Handle normal completion
}
},
consumeSseStream: consumeStream,
});
}
`
```
The `consumeStream` function is necessary for proper abort handling in UI message streams. It ensures that the stream is properly consumed even when aborted, preventing potential memory leaks or hanging connections.
## [AI SDK RSC](#ai-sdk-rsc)
The AI SDK RSC does not currently support stopping streams.
On this page
[Stopping Streams](#stopping-streams)
[AI SDK Core](#ai-sdk-core)
[AI SDK UI](#ai-sdk-ui)
[Handling stream abort cleanup](#handling-stream-abort-cleanup)
[UI Message Streams](#ui-message-streams)
[AI SDK RSC](#ai-sdk-rsc)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)