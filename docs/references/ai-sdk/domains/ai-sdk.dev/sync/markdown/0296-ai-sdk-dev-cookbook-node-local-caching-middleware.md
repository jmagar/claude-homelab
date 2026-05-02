Node: Local Caching Middleware
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
# [Local Caching Middleware](#local-caching-middleware)
When developing AI applications, you'll often find yourself repeatedly making the same API calls during development. This can lead to increased costs and slower development cycles. A caching middleware allows you to store responses locally and reuse them when the same inputs are provided.
This approach is particularly useful in two scenarios:
1. **Iterating on UI/UX** - When you're focused on styling and user experience, you don't want to regenerate AI responses for every code change.
2. **Working on evals** - When developing evals, you need to repeatedly test the same prompts, but don't need new generations each time.
## [Implementation](#implementation)
In this implementation, you create a JSON file to store responses. When a request is made, you first check if you have already seen this exact request. If you have, you return the cached response immediately (as a one-off generation or chunks of tokens). If not, you trigger the generation, save the response, and return it.
Make sure to add the path of your local cache to your `.gitignore` so you do
not commit it.
### [How it works](#how-it-works)
For regular generations, you store and retrieve complete responses. Instead, the streaming implementation captures each token as it arrives, stores the full sequence, and on cache hits uses the SDK's `simulateReadableStream` utility to recreate the token-by-token streaming experience at a controlled speed (defaults to 10ms between chunks).
This approach gives you the best of both worlds:
* Instant responses for repeated queries
* Preserved streaming behavior for UI development
The middleware handles all transformations needed to make cached responses indistinguishable from fresh ones, including normalizing tool calls and fixing timestamp formats.
### [Middleware](#middleware)
```
`
import {
type LanguageModelV3Middleware,
type LanguageModelV3StreamPart,
type LanguageModelV3CallOptions,
type LanguageModelV3,
} from '@ai-sdk/provider';
import { safeParseJSON } from '@ai-sdk/provider-utils';
import 'dotenv/config';
import fs from 'fs';
import path from 'path';
import { wrapLanguageModel, simulateReadableStream } from 'ai';
const CACHE\_FILE = path.join(process.cwd(), '.cache/ai-cache.json');
export const cached = (model: LanguageModelV3) =\>
wrapLanguageModel({
middleware: cacheMiddleware,
model,
});
const ensureCacheFile = () =\> {
const cacheDir = path.dirname(CACHE\_FILE);
if (!fs.existsSync(cacheDir)) {
fs.mkdirSync(cacheDir, { recursive: true });
}
if (!fs.existsSync(CACHE\_FILE)) {
fs.writeFileSync(CACHE\_FILE, '{}');
}
};
const getCachedResult = (key: string | object) =\> {
ensureCacheFile();
const cacheKey = typeof key === 'object' ? JSON.stringify(key) : key;
try {
const cacheContent = fs.readFileSync(CACHE\_FILE, 'utf-8');
const parseResult = safeParseJSON({ text: cacheContent });
if (!parseResult.success) {
console.error('Failed to parse cache:', parseResult.error);
return null;
}
const cache = parseResult.value as Record\<string, unknown\>;
const result = cache[cacheKey];
return result ?? null;
} catch (error) {
console.error('Cache error:', error);
return null;
}
};
const updateCache = (key: string, value: any) =\> {
ensureCacheFile();
try {
const parseResult = safeParseJSON({
text: fs.readFileSync(CACHE\_FILE, 'utf-8'),
});
const cache = parseResult.success
? (parseResult.value as Record\<string, unknown\>)
: {};
const updatedCache = { ...cache, [key]: value };
fs.writeFileSync(CACHE\_FILE, JSON.stringify(updatedCache, null, 2));
} catch (error) {
console.error('Failed to update cache:', error);
}
};
const cleanPrompt = (prompt: LanguageModelV3CallOptions['prompt']) =\> {
return prompt.map(m =\> {
if (m.role === 'assistant') {
return {
...m,
content: m.content.map(part =\>
part.type === 'tool-call' ? { ...part, toolCallId: 'cached' } : part,
),
};
}
if (m.role === 'tool') {
return {
...m,
content: m.content.map(tc =\> ({
...tc,
toolCallId: 'cached',
result: {},
})),
};
}
return m;
});
};
export const cacheMiddleware: LanguageModelV3Middleware = {
specificationVersion: 'v3',
wrapGenerate: async ({ doGenerate, params, model }) =\> {
const cacheKey = JSON.stringify({
prompt: cleanPrompt(params.prompt),
\_function: 'generate',
model: model.modelId,
});
const cached = getCachedResult(cacheKey);
if (cached && cached !== null) {
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
updateCache(cacheKey, result);
return result;
},
wrapStream: async ({ doStream, params, model }) =\> {
const cacheKey = JSON.stringify({
prompt: cleanPrompt(params.prompt),
\_function: 'stream',
model: model.modelId,
});
const cached = getCachedResult(cacheKey);
if (cached && cached !== null) {
const { chunks, ...rest } = cached;
const formattedChunks = (chunks as LanguageModelV3StreamPart[]).map(p =\> {
if (p.type === 'response-metadata' && p.timestamp) {
return { ...p, timestamp: new Date(p.timestamp) };
}
return p;
});
return {
stream: simulateReadableStream({
initialDelayInMs: 0,
chunkDelayInMs: 10,
chunks: formattedChunks,
}),
...rest,
};
}
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
updateCache(cacheKey, { chunks: fullResponse, ...rest });
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
## [Using the Middleware](#using-the-middleware)
The middleware can be easily integrated into your existing AI SDK setup:
```
`
import { openai } from '@ai-sdk/openai';
import { streamText } from 'ai';
import 'dotenv/config';
import { cached } from '../middleware/your-cache-middleware';
async function main() {
const result = streamText({
model: cached(openai('gpt-4o')),
maxOutputTokens: 512,
temperature: 0.3,
maxRetries: 5,
prompt: 'Invent a new holiday and describe its traditions.',
});
for await (const textPart of result.textStream) {
process.stdout.write(textPart);
}
console.log();
console.log('Token usage:', await result.usage);
console.log('Finish reason:', await result.finishReason);
}
main().catch(console.error);
`
```
## [Considerations](#considerations)
When using this caching middleware, keep these points in mind:
1. **Development Only** - This approach is intended for local development, not production environments
2. **Cache Invalidation** - You'll need to clear the cache (delete the cache file) when you want fresh responses
3. **Multi-Step Flows** - When using `stopWhen`, be aware that caching occurs at the individual language model response level, not across the entire execution flow. This means that while the model's generation is cached, the tool call is not and will run on each generation.
On this page
[Local Caching Middleware](#local-caching-middleware)
[Implementation](#implementation)
[How it works](#how-it-works)
[Middleware](#middleware)
[Using the Middleware](#using-the-middleware)
[Considerations](#considerations)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)