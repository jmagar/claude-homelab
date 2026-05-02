AI SDK Core: Testing
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
# [Testing](#testing)
Testing language models can be challenging, because they are non-deterministic
and calling them is slow and expensive.
To enable you to unit test your code that uses the AI SDK, the AI SDK Core
includes mock providers and test helpers. You can import the following helpers from `ai/test`:
* `MockEmbeddingModelV3`: A mock embedding model using the [embedding model v3 specification](https://github.com/vercel/ai/blob/main/packages/provider/src/embedding-model/v3/embedding-model-v3.ts).
* `MockLanguageModelV3`: A mock language model using the [language model v3 specification](https://github.com/vercel/ai/blob/main/packages/provider/src/language-model/v3/language-model-v3.ts).
* `mockId`: Provides an incrementing integer ID.
* `mockValues`: Iterates over an array of values with each call. Returns the last value when the array is exhausted.
You can also import [`simulateReadableStream`](/docs/reference/ai-sdk-core/simulate-readable-stream) from `ai` to simulate a readable stream with delays.
With mock providers and test helpers, you can control the output of the AI SDK
and test your code in a repeatable and deterministic way without actually calling
a language model provider.
## [Examples](#examples)
You can use the test helpers with the AI Core functions in your unit tests:
### [generateText](#generatetext)
```
`
import { generateText } from 'ai';
import { MockLanguageModelV3 } from 'ai/test';
const result = await generateText({
model: new MockLanguageModelV3({
doGenerate: async () =\> ({
content: [{ type: 'text', text: `Hello, world!` }],
finishReason: { unified: 'stop', raw: undefined },
usage: {
inputTokens: {
total: 10,
noCache: 10,
cacheRead: undefined,
cacheWrite: undefined,
},
outputTokens: {
total: 20,
text: 20,
reasoning: undefined,
},
},
warnings: [],
}),
}),
prompt: 'Hello, test!',
});
`
```
### [streamText](#streamtext)
```
`
import { streamText, simulateReadableStream } from 'ai';
import { MockLanguageModelV3 } from 'ai/test';
const result = streamText({
model: new MockLanguageModelV3({
doStream: async () =\> ({
stream: simulateReadableStream({
chunks: [
{ type: 'text-start', id: 'text-1' },
{ type: 'text-delta', id: 'text-1', delta: 'Hello' },
{ type: 'text-delta', id: 'text-1', delta: ', ' },
{ type: 'text-delta', id: 'text-1', delta: 'world!' },
{ type: 'text-end', id: 'text-1' },
{
type: 'finish',
finishReason: { unified: 'stop', raw: undefined },
logprobs: undefined,
usage: {
inputTokens: {
total: 3,
noCache: 3,
cacheRead: undefined,
cacheWrite: undefined,
},
outputTokens: {
total: 10,
text: 10,
reasoning: undefined,
},
},
},
],
}),
}),
}),
prompt: 'Hello, test!',
});
`
```
### [generateText with Output](#generatetext-with-output)
```
`
import { generateText, Output } from 'ai';
import { MockLanguageModelV3 } from 'ai/test';
import { z } from 'zod';
const result = await generateText({
model: new MockLanguageModelV3({
doGenerate: async () =\> ({
content: [{ type: 'text', text: `{"content":"Hello, world!"}` }],
finishReason: { unified: 'stop', raw: undefined },
usage: {
inputTokens: {
total: 10,
noCache: 10,
cacheRead: undefined,
cacheWrite: undefined,
},
outputTokens: {
total: 20,
text: 20,
reasoning: undefined,
},
},
warnings: [],
}),
}),
output: Output.object({ schema: z.object({ content: z.string() }) }),
prompt: 'Hello, test!',
});
`
```
### [streamText with Output](#streamtext-with-output)
```
`
import { streamText, Output, simulateReadableStream } from 'ai';
import { MockLanguageModelV3 } from 'ai/test';
import { z } from 'zod';
const result = streamText({
model: new MockLanguageModelV3({
doStream: async () =\> ({
stream: simulateReadableStream({
chunks: [
{ type: 'text-start', id: 'text-1' },
{ type: 'text-delta', id: 'text-1', delta: '{ ' },
{ type: 'text-delta', id: 'text-1', delta: '"content": ' },
{ type: 'text-delta', id: 'text-1', delta: `"Hello, ` },
{ type: 'text-delta', id: 'text-1', delta: `world` },
{ type: 'text-delta', id: 'text-1', delta: `!"` },
{ type: 'text-delta', id: 'text-1', delta: ' }' },
{ type: 'text-end', id: 'text-1' },
{
type: 'finish',
finishReason: { unified: 'stop', raw: undefined },
logprobs: undefined,
usage: {
inputTokens: {
total: 3,
noCache: 3,
cacheRead: undefined,
cacheWrite: undefined,
},
outputTokens: {
total: 10,
text: 10,
reasoning: undefined,
},
},
},
],
}),
}),
}),
output: Output.object({ schema: z.object({ content: z.string() }) }),
prompt: 'Hello, test!',
});
`
```
### [Simulate UI Message Stream Responses](#simulate-ui-message-stream-responses)
You can also simulate [UI Message Stream](/docs/ai-sdk-ui/stream-protocol#ui-message-stream) responses for testing,
debugging, or demonstration purposes.
Here is a Next example:
route.ts
```
`
import { simulateReadableStream } from 'ai';
export async function POST(req: Request) {
return new Response(
simulateReadableStream({
initialDelayInMs: 1000, // Delay before the first chunk
chunkDelayInMs: 300, // Delay between chunks
chunks: [
`data: {"type":"start","messageId":"msg-123"}\\n\\n`,
`data: {"type":"text-start","id":"text-1"}\\n\\n`,
`data: {"type":"text-delta","id":"text-1","delta":"This"}\\n\\n`,
`data: {"type":"text-delta","id":"text-1","delta":" is an"}\\n\\n`,
`data: {"type":"text-delta","id":"text-1","delta":" example."}\\n\\n`,
`data: {"type":"text-end","id":"text-1"}\\n\\n`,
`data: {"type":"finish"}\\n\\n`,
`data: [DONE]\\n\\n`,
],
}).pipeThrough(new TextEncoderStream()),
{
status: 200,
headers: {
'Content-Type': 'text/event-stream',
'Cache-Control': 'no-cache',
Connection: 'keep-alive',
'x-vercel-ai-ui-message-stream': 'v1',
},
},
);
}
`
```
On this page
[Testing](#testing)
[Examples](#examples)
[generateText](#generatetext)
[streamText](#streamtext)
[generateText with Output](#generatetext-with-output)
[streamText with Output](#streamtext-with-output)
[Simulate UI Message Stream Responses](#simulate-ui-message-stream-responses)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)