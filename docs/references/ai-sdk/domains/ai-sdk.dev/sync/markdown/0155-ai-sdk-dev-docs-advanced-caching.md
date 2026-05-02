Advanced: Caching
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
# [Caching Responses](#caching-responses)
Depending on the type of application you're building, you may want to cache the responses you receive from your AI provider, at least temporarily.
## [Using Language Model Middleware (Recommended)](#using-language-model-middleware-recommended)
The recommended approach to caching responses is using [language model middleware](/docs/ai-sdk-core/middleware)
and the [`simulateReadableStream`](/docs/reference/ai-sdk-core/simulate-readable-stream) function.
Language model middleware is a way to enhance the behavior of language models by intercepting and modifying the calls to the language model.
Let's see how you can use language model middleware to cache responses.
ai/middleware.ts
```
`
import { Redis } from '@upstash/redis';
import {
type LanguageModelV3,
type LanguageModelV3Middleware,
type LanguageModelV3StreamPart,
simulateReadableStream,
} from 'ai';
const redis = new Redis({
url: process.env.KV\_URL,
token: process.env.KV\_TOKEN,
});
export const cacheMiddleware: LanguageModelV3Middleware = {
wrapGenerate: async ({ doGenerate, params }) =\> {
const cacheKey = JSON.stringify(params);
const cached = (await redis.get(cacheKey)) as Awaited\<
ReturnType\<LanguageModelV3['doGenerate']\>
\> | null;
if (cached !== null) {
return {
...cached,
response: {
...cached.response,
timestamp: cached?.response?.timestamp
? new Date(cached?.response?.timestamp)
: undefined,
},
};
}
const result = await doGenerate();
redis.set(cacheKey, result);
return result;
},
wrapStream: async ({ doStream, params }) =\> {
const cacheKey = JSON.stringify(params);
// Check if the result is in the cache
const cached = await redis.get(cacheKey);
// If cached, return a simulated ReadableStream that yields the cached result
if (cached !== null) {
// Format the timestamps in the cached response
const formattedChunks = (cached as LanguageModelV3StreamPart[]).map(p =\> {
if (p.type === 'response-metadata' && p.timestamp) {
return { ...p, timestamp: new Date(p.timestamp) };
} else return p;
});
return {
stream: simulateReadableStream({
initialDelayInMs: 0,
chunkDelayInMs: 10,
chunks: formattedChunks,
}),
};
}
// If not cached, proceed with streaming
const { stream, ...rest } = await doStream();
const fullResponse: LanguageModelV3StreamPart[] = [];
const transformStream = new TransformStream\<
LanguageModelV3StreamPart,
LanguageModelV3StreamPart
\>({
transform(chunk, controller) {
fullResponse.push(chunk);
controller.enqueue(chunk);
},
flush() {
// Store the full response in the cache after streaming is complete
redis.set(cacheKey, fullResponse);
},
});
return {
stream: stream.pipeThrough(transformStream),
...rest,
};
},
};
`
```
This example uses `@upstash/redis` to store and retrieve the assistant's
responses but you can use any KV storage provider you would like.
`LanguageModelV3Middleware` has two methods: `wrapGenerate` and `wrapStream`. `wrapGenerate` is called when using [`generateText`](/docs/reference/ai-sdk-core/generate-text), while `wrapStream` is called when using [`streamText`](/docs/reference/ai-sdk-core/stream-text).
For `wrapGenerate`, you can cache the response directly. Instead, for `wrapStream`, you cache an array of the stream parts, which can then be used with [`simulateReadableStream`](/docs/ai-sdk-core/testing#simulate-data-stream-protocol-responses) function to create a simulated `ReadableStream` that returns the cached response. In this way, the cached response is returned chunk-by-chunk as if it were being generated by the model. You can control the initial delay and delay between chunks by adjusting the `initialDelayInMs` and `chunkDelayInMs` parameters of `simulateReadableStream`.
You can see a full example of caching with Redis in a Next.js application in our [Caching Middleware Recipe](/cookbook/next/caching-middleware).
## [Using Lifecycle Callbacks](#using-lifecycle-callbacks)
Alternatively, each AI SDK Core function has special lifecycle callbacks you can use. The one of interest is likely `onFinish`, which is called when the generation is complete. This is where you can cache the full response.
Here's an example of how you can implement caching using Vercel KV and Next.js to cache the OpenAI response for 1 hour:
This example uses [Upstash Redis](https://upstash.com/docs/redis/overall/getstarted) and Next.js to cache the response for 1 hour.
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/chat/route.ts
```
`
import { convertToModelMessages, streamText, UIMessage } from 'ai';
import { Redis } from '@upstash/redis';
// Allow streaming responses up to 30 seconds
export const maxDuration = 30;
const redis = new Redis({
url: process.env.KV\_URL,
token: process.env.KV\_TOKEN,
});
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
// come up with a key based on the request:
const key = JSON.stringify(messages);
// Check if we have a cached response
const cached = (await redis.get(key)) as string | null;
if (cached != null) {
return new Response(cached, {
status: 200,
headers: { 'Content-Type': 'text/plain' },
});
}
// Call the language model:
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: await convertToModelMessages(messages),
async onFinish({ text }) {
// Cache the response text:
await redis.set(key, text);
await redis.expire(key, 60 \* 60);
},
});
// Respond with the stream
return result.toUIMessageStreamResponse();
}
`
```
On this page
[Caching Responses](#caching-responses)
[Using Language Model Middleware (Recommended)](#using-language-model-middleware-recommended)
[Using Lifecycle Callbacks](#using-lifecycle-callbacks)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)