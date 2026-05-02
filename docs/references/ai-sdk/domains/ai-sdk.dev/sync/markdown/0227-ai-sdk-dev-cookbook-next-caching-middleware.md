Next.js: Caching Middleware
[](https://vercel.com/oss)
Menu
[Guides](/cookbook/guides)
[RAG Agent](/cookbook/guides/rag-chatbot)
[Multi-Modal Agent](/cookbook/guides/multi-modal-chatbot)
[Slackbot Agent Guide](/cookbook/guides/slackbot)
[Natural Language Postgres](/cookbook/guides/natural-language-postgres)
[Get started with Computer Use](/cookbook/guides/computer-use)
[Add Skills to Your Agent](/cookbook/guides/agent-skills)
[Build a Custom Memory Tool](/cookbook/guides/custom-memory-tool)
[Get started with Gemini 3](/cookbook/guides/gemini)
[Get started with Claude 4](/cookbook/guides/claude-4)
[OpenAI Responses API](/cookbook/guides/openai-responses)
[Google Gemini Image Generation](/cookbook/guides/google-gemini-image-generation)
[Get started with Claude 3.7 Sonnet](/cookbook/guides/sonnet-3-7)
[Get started with Llama 3.1](/cookbook/guides/llama-3_1)
[Get started with GPT-5](/cookbook/guides/gpt-5)
[Get started with OpenAI o1](/cookbook/guides/o1)
[Get started with OpenAI o3-mini](/cookbook/guides/o3)
[Get started with DeepSeek R1](/cookbook/guides/r1)
[Get started with DeepSeek V3.2](/cookbook/guides/deepseek-v3-2)
[Next.js](/cookbook/next)
[Generate Text](/cookbook/next/generate-text)
[Generate Text with Chat Prompt](/cookbook/next/generate-text-with-chat-prompt)
[Generate Image with Chat Prompt](/cookbook/next/generate-image-with-chat-prompt)
[Stream Text](/cookbook/next/stream-text)
[Stream Text with Chat Prompt](/cookbook/next/stream-text-with-chat-prompt)
[Stream Text with Image Prompt](/cookbook/next/stream-text-with-image-prompt)
[Chat with PDFs](/cookbook/next/chat-with-pdf)
[streamText Multi-Step Cookbook](/cookbook/next/stream-text-multistep)
[Markdown Chatbot with Memoization](/cookbook/next/markdown-chatbot-with-memoization)
[Generate Object](/cookbook/next/generate-object)
[Generate Object with File Prompt through Form Submission](/cookbook/next/generate-object-with-file-prompt)
[Stream Object](/cookbook/next/stream-object)
[Call Tools](/cookbook/next/call-tools)
[Call Tools in Multiple Steps](/cookbook/next/call-tools-multiple-steps)
[Model Context Protocol (MCP) Tools](/cookbook/next/mcp-tools)
[Share useChat State Across Components](/cookbook/next/use-shared-chat-context)
[Human-in-the-Loop with Next.js](/cookbook/next/human-in-the-loop)
[Track Agent Token Usage](/cookbook/next/track-agent-token-usage)
[Send Custom Body from useChat](/cookbook/next/send-custom-body-from-use-chat)
[Streaming with Custom Format](/cookbook/next/custom-stream-format)
[Render Visual Interface in Chat](/cookbook/next/render-visual-interface-in-chat)
[Caching Middleware](/cookbook/next/caching-middleware)
[Node](/cookbook/node)
[Generate Text](/cookbook/node/generate-text)
[Generate Text with Chat Prompt](/cookbook/node/generate-text-with-chat-prompt)
[Generate Text with Image Prompt](/cookbook/node/generate-text-with-image-prompt)
[Stream Text](/cookbook/node/stream-text)
[Stream Text with Chat Prompt](/cookbook/node/stream-text-with-chat-prompt)
[Stream Text with Image Prompt](/cookbook/node/stream-text-with-image-prompt)
[Stream Text with File Prompt](/cookbook/node/stream-text-with-file-prompt)
[Generate Object with a Reasoning Model](/cookbook/node/generate-object-reasoning)
[Generate Object](/cookbook/node/generate-object)
[Stream Object](/cookbook/node/stream-object)
[Stream Object with Image Prompt](/cookbook/node/stream-object-with-image-prompt)
[Record Token Usage After Streaming Object](/cookbook/node/stream-object-record-token-usage)
[Record Final Object after Streaming Object](/cookbook/node/stream-object-record-final-object)
[Call Tools](/cookbook/node/call-tools)
[Call Tools in Parallel](/cookbook/node/call-tools-in-parallel)
[Call Tools with Image Prompt](/cookbook/node/call-tools-with-image-prompt)
[Call Tools in Multiple Steps](/cookbook/node/call-tools-multiple-steps)
[Model Context Protocol (MCP) Tools](/cookbook/node/mcp-tools)
[Manual Agent Loop](/cookbook/node/manual-agent-loop)
[Web Search Agent](/cookbook/node/web-search-agent)
[Model Context Protocol (MCP) Elicitation](/cookbook/node/mcp-elicitation)
[Embed Text](/cookbook/node/embed-text)
[Embed Text in Batch](/cookbook/node/embed-text-batch)
[Intercepting Fetch Requests](/cookbook/node/intercept-fetch-requests)
[Local Caching Middleware](/cookbook/node/local-caching-middleware)
[Repair Malformed JSON with jsonrepair](/cookbook/node/repair-json-with-jsonrepair)
[Dynamic Prompt Caching](/cookbook/node/dynamic-prompt-caching)
[Retrieval Augmented Generation](/cookbook/node/retrieval-augmented-generation)
[Knowledge Base Agent](/cookbook/node/knowledge-base-agent)
[API Servers](/cookbook/api-servers)
[Node.js HTTP Server](/cookbook/api-servers/node-http-server)
[Express](/cookbook/api-servers/express)
[Hono](/cookbook/api-servers/hono)
[Fastify](/cookbook/api-servers/fastify)
[Nest.js](/cookbook/api-servers/nest)
[React Server Components](/cookbook/rsc)
Copy markdown
# [Caching Middleware](#caching-middleware)
This example is not yet updated to v5.
Let's create a simple chat interface that uses [`LanguageModelMiddleware`](/docs/ai-sdk-core/middleware) to cache the assistant's responses in fast KV storage.
## [Client](#client)
Let's create a simple chat interface that allows users to send messages to the assistant and receive responses. You will integrate the `useChat` hook from `@ai-sdk/react` to stream responses.
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
export default function Chat() {
const { messages, input, handleInputChange, handleSubmit, error } = useChat();
if (error) return \<div\>{error.message}\</div\>;
return (
\<div className="flex flex-col w-full max-w-md py-24 mx-auto stretch"\>
\<div className="space-y-4"\>
{messages.map(m =\> (
\<div key={m.id} className="whitespace-pre-wrap"\>
\<div\>
\<div className="font-bold"\>{m.role}\</div\>
{m.toolInvocations ? (
\<pre\>{JSON.stringify(m.toolInvocations, null, 2)}\</pre\>
) : (
\<p\>{m.content}\</p\>
)}
\</div\>
\</div\>
))}
\</div\>
\<form onSubmit={handleSubmit}\>
\<input
className="fixed bottom-0 w-full max-w-md p-2 mb-8 border border-gray-300 rounded shadow-xl"
value={input}
placeholder="Say something..."
onChange={handleInputChange}
/\>
\</form\>
\</div\>
);
}
`
```
## [Middleware](#middleware)
Next, you will create a `LanguageModelMiddleware` that caches the assistant's responses in KV storage.
`LanguageModelMiddleware` has two methods: `wrapGenerate` and `wrapStream`.
`wrapGenerate` is called when using [`generateText`](/docs/reference/ai-sdk-core/generate-text), while `wrapStream` is called when using [`streamText`](/docs/reference/ai-sdk-core/stream-text).
For `wrapGenerate`, you can cache the response directly.
Instead, for `wrapStream`, you cache an array of the stream parts, which can then be used with [`simulateReadableStream`](/docs/reference/ai-sdk-core/simulate-readable-stream) function to create a simulated `ReadableStream` that returns the cached response.
In this way, the cached response is returned chunk-by-chunk as if it were being generated by the model.
You can control the initial delay and delay between chunks by adjusting the `initialDelayInMs` and `chunkDelayInMs` parameters of `simulateReadableStream`.
ai/middleware.ts
```
`
import { Redis } from '@upstash/redis';
import {
type LanguageModelV1,
type LanguageModelV3Middleware,
type LanguageModelV1StreamPart,
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
ReturnType\<LanguageModelV1['doGenerate']\>
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
const formattedChunks = (cached as LanguageModelV1StreamPart[]).map(p =\> {
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
const fullResponse: LanguageModelV1StreamPart[] = [];
const transformStream = new TransformStream\<
LanguageModelV1StreamPart,
LanguageModelV1StreamPart
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
## [Server](#server)
Finally, you will create an API route for `api/chat` to handle the assistant's messages and responses. You can use your cache middleware by wrapping the model with `wrapLanguageModel` and passing the middleware as an argument.
app/api/chat/route.ts
```
`
import { cacheMiddleware } from '@/ai/middleware';
import { wrapLanguageModel, streamText, tool } from 'ai';
import { z } from 'zod';
const wrappedModel = wrapLanguageModel({
model: 'openai/gpt-4o-mini',
middleware: cacheMiddleware,
});
export async function POST(req: Request) {
const { messages } = await req.json();
const result = streamText({
model: wrappedModel,
messages,
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
});
return result.toUIMessageStreamResponse();
}
`
```
On this page
[Caching Middleware](#caching-middleware)
[Client](#client)
[Middleware](#middleware)
[Server](#server)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)