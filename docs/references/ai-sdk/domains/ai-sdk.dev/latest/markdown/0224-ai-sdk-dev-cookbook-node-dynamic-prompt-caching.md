Node: Dynamic Prompt Caching
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
# [Dynamic Prompt Caching](#dynamic-prompt-caching)
When building agents, API costs can add up quickly as conversations grow. Many providers offer prompt caching features that allow you to cache conversation prefixes, significantly reducing costs for repeated context.
This recipe shows a pattern you can copy into your project and customize for your specific providers and caching strategies. The example implementation covers Anthropic's recommended approach out of the box, but you can extend it to support other providers as needed.
This pattern is particularly useful when:
1. **Building agents with long conversations** - Multi-turn agent interactions accumulate context that gets resent with every request.
2. **Using tools heavily** - Tool calls and results add significant token overhead that benefits from caching.
For non-Anthropic models, messages pass through unchanged, making this safe to use in provider-agnostic code.
## [Implementation](#implementation)
The utility adds Anthropic's `cacheControl` directive to your messages, marking the final message with `{ type: "ephemeral" }`. This tells Anthropic to cache everything up to that point, so subsequent requests only pay full price for new content.
### [How it works](#how-it-works)
The function detects the model provider and applies the appropriate caching strategy. In this implementation, it checks for Anthropic models by examining the provider name and model ID. When it finds an Anthropic model, it adds `providerOptions` to the last message in your array with `cacheControl: { type: "ephemeral" }`. Per Anthropic's documentation: "Mark the final block of the final message with cache\_control so the conversation can be incrementally cached."
For non-Anthropic models, the function returns your messages unchanged. You can extend this pattern to support other providers by adding detection logic and provider-specific options.
### [Message-level vs block-level cache control](#message-level-vs-block-level-cache-control)
You might notice this implementation adds `providerOptions` at the **message level**, while Anthropic's API expects `cache\_control` at the **content block level**. The AI SDK handles this translation automatically.
When you set `providerOptions` on a message, the SDK applies it to the last content block when constructing the API request. For example:
```
`
// What you write (message-level)
{
role: 'user',
content: [
{ type: 'text', text: 'First part' },
{ type: 'text', text: 'Second part' },
],
providerOptions: {
anthropic: { cacheControl: { type: 'ephemeral' } },
},
}
// What the SDK sends to Anthropic (block-level)
{
"role": "user",
"content": [
{ "type": "text", "text": "First part" },
{ "type": "text", "text": "Second part", "cache\_control": { "type": "ephemeral" } }
]
}
`
```
This behavior is intentional and consistent across user messages, assistant messages, and tool results. If you need finer control, you can also set `providerOptions` directly on individual content parts, which takes priority over message-level settings.
### [Utility Function](#utility-function)
```
`
import type { ModelMessage, JSONValue, LanguageModel } from 'ai';
function isAnthropicModel(model: LanguageModel): boolean {
if (typeof model === 'string') {
return model.includes('anthropic') || model.includes('claude');
}
return (
model.provider === 'anthropic' ||
model.provider.includes('anthropic') ||
model.modelId.includes('anthropic') ||
model.modelId.includes('claude')
);
}
export function addCacheControlToMessages({
messages,
model,
providerOptions = {
anthropic: { cacheControl: { type: 'ephemeral' } },
},
}: {
messages: ModelMessage[];
model: LanguageModel;
providerOptions?: Record\<string, Record\<string, JSONValue\>\>;
}): ModelMessage[] {
if (messages.length === 0) return messages;
if (!isAnthropicModel(model)) return messages;
return messages.map((message, index) =\> {
if (index === messages.length - 1) {
return {
...message,
providerOptions: {
...message.providerOptions,
...providerOptions,
},
};
}
return message;
});
}
`
```
## [Using the Utility](#using-the-utility)
Integrate the utility into your agent using the `prepareStep` callback with `generateText` and `maxSteps`:
```
`
import { anthropic } from '@ai-sdk/anthropic';
import { generateText, tool } from 'ai';
import { z } from 'zod';
import { addCacheControlToMessages } from './add-cache-control-to-messages';
async function main() {
const result = await generateText({
model: anthropic('claude-sonnet-4-5'),
prompt: 'Help me analyze this codebase and suggest improvements.',
maxSteps: 10,
tools: {
// your tools here
analyzeFile: tool({
description: 'Analyze a file in the codebase',
inputSchema: z.object({
path: z.string().describe('Path to the file'),
}),
execute: async ({ path }) =\> {
// implementation
return { analysis: `Analysis of ${path}` };
},
}),
},
prepareStep: ({ messages, model }) =\> ({
messages: addCacheControlToMessages({ messages, model }),
}),
});
console.log(result.text);
}
main().catch(console.error);
`
```
You can also customize the cache control options if needed:
```
`
prepareStep: ({ messages, model }) =\> ({
messages: addCacheControlToMessages({
messages,
model,
providerOptions: {
anthropic: { cacheControl: { type: "ephemeral" } },
},
}),
}),
`
```
## [Considerations](#considerations)
When using this utility, keep these points in mind:
1. **Provider-specific behavior** - This implementation targets Anthropic models. For other providers, messages pass through unchanged. You can extend the pattern to support additional providers.
2. **Minimum token threshold** - Anthropic requires a minimum number of tokens before caching activates. Short conversations may not benefit. Other providers may have similar requirements.
3. **Cache lifetime** - Anthropic's ephemeral cache has a 5-minute TTL. Inactive conversations lose their cache. Check your provider's documentation for cache duration details.
4. **Cost structure** - With Anthropic, cached tokens cost 10% of input tokens, but cache writes cost 25% more. You save money when cache hits exceed cache misses. Cost structures vary by provider.
On this page
[Dynamic Prompt Caching](#dynamic-prompt-caching)
[Implementation](#implementation)
[How it works](#how-it-works)
[Message-level vs block-level cache control](#message-level-vs-block-level-cache-control)
[Utility Function](#utility-function)
[Using the Utility](#using-the-utility)
[Considerations](#considerations)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)