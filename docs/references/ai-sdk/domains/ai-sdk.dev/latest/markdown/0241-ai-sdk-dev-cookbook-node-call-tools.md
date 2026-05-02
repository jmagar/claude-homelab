Node: Call Tools
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
# [Call Tools](#call-tools)
Some models allow developers to provide a list of tools that can be called at any time during a generation.
This is useful for extending the capabilities of a language model to either use logic or data to interact with systems external to the model.
```
`
import { generateText, tool } from 'ai';
import { z } from 'zod';
const result = await generateText({
model: 'openai/gpt-4.1',
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
cityAttractions: tool({
inputSchema: z.object({ city: z.string() }),
}),
},
prompt:
'What is the weather in San Francisco and what attractions should I visit?',
});
`
```
## [Accessing Tool Calls and Tool Results](#accessing-tool-calls-and-tool-results)
If the model decides to call a tool, it will generate a tool call. You can access the tool call by checking the `toolCalls` property on the result.
```
`
import { generateText, tool } from 'ai';
import dotenv from 'dotenv';
import { z } from 'zod';
dotenv.config();
async function main() {
const result = await generateText({
model: 'openai/gpt-4o',
maxOutputTokens: 512,
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
cityAttractions: tool({
inputSchema: z.object({ city: z.string() }),
}),
},
prompt:
'What is the weather in San Francisco and what attractions should I visit?',
});
// typed tool calls:
for (const toolCall of result.toolCalls) {
if (toolCall.dynamic) {
continue;
}
switch (toolCall.toolName) {
case 'cityAttractions': {
toolCall.input.city; // string
break;
}
case 'weather': {
toolCall.input.location; // string
break;
}
}
}
console.log(JSON.stringify(result, null, 2));
}
main().catch(console.error);
`
```
## [Accessing Tool Results](#accessing-tool-results)
You can access the result of a tool call by checking the `toolResults` property on the result.
```
`
import { generateText, tool } from 'ai';
import dotenv from 'dotenv';
import { z } from 'zod';
dotenv.config();
async function main() {
const result = await generateText({
model: 'openai/gpt-4o',
maxOutputTokens: 512,
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
cityAttractions: tool({
inputSchema: z.object({ city: z.string() }),
}),
},
prompt:
'What is the weather in San Francisco and what attractions should I visit?',
});
// typed tool results for tools with execute method:
for (const toolResult of result.toolResults) {
if (toolResult.dynamic) {
continue;
}
switch (toolResult.toolName) {
case 'weather': {
toolResult.input.location; // string
toolResult.output.location; // string
toolResult.output.temperature; // number
break;
}
}
}
console.log(JSON.stringify(result, null, 2));
}
main().catch(console.error);
`
```
`toolResults` will only be available if the tool has an `execute` function.
## [Model Response](#model-response)
When using tools, it's important to note that the model won't respond with the tool call results by default.
This is because the model has technically already generated its response to the prompt: the tool call.
Many use cases will require the model to summarize the results of the tool call within the context of the original prompt automatically.
You can achieve this by [using `stopWhen`](/cookbook/node/call-tools-multiple-steps)
which will automatically send toolResults to the model to trigger another generation.
On this page
[Call Tools](#call-tools)
[Accessing Tool Calls and Tool Results](#accessing-tool-calls-and-tool-results)
[Accessing Tool Results](#accessing-tool-results)
[Model Response](#model-response)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)