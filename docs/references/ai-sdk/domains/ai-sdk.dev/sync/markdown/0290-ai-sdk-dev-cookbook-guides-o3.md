Guides: Get started with OpenAI o3-mini
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
# [Get started with OpenAI o3-mini](#get-started-with-openai-o3-mini)
With the [release of OpenAI's o3-mini model](https://openai.com/index/openai-o3-mini/), there has never been a better time to start building AI applications, particularly those that require complex STEM reasoning capabilities.
The [AI SDK](/) is a powerful TypeScript toolkit for building AI applications with large language models (LLMs) like OpenAI o3-mini alongside popular frameworks like React, Next.js, Vue, Svelte, Node.js, and more.
## [OpenAI o3-mini](#openai-o3-mini)
OpenAI recently released a new AI model optimized for STEM reasoning that excels in science, math, and coding tasks. o3-mini matches o1's performance in these domains while delivering faster responses and lower costs. The model supports tool calling, structured outputs, and system messages, making it a great option for a wide range of applications.
o3-mini offers three reasoning effort levels:
1. [**Low**]: Optimized for speed while maintaining solid reasoning capabilities
2. [**Medium**]: Balanced approach matching o1's performance levels
3. [**High**]: Enhanced reasoning power exceeding o1 in many STEM domains
|Model|Streaming|Tool Calling|Structured Output|Reasoning Effort|Image Input|
|o3-mini||||||
### [Benchmarks](#benchmarks)
OpenAI o3-mini demonstrates impressive performance across technical domains:
* 87.3% accuracy on AIME competition math questions
* 79.7% accuracy on PhD-level science questions (GPQA Diamond)
* 2130 Elo rating on competitive programming (Codeforces)
* 49.3% accuracy on verified software engineering tasks (SWE-bench)
These benchmark results are using high reasoning effort setting.
[Source](https://openai.com/index/openai-o3-mini/)
### [Prompt Engineering for o3-mini](#prompt-engineering-for-o3-mini)
The o3-mini model performs best with straightforward prompts. Some prompt engineering techniques, like few-shot prompting or instructing the model to "think step by step," may not enhance performance and can sometimes hinder it. Here are some best practices:
1. Keep prompts simple and direct: The model excels at understanding and responding to brief, clear instructions without the need for extensive guidance.
2. Avoid chain-of-thought prompts: Since the model performs reasoning internally, prompting it to "think step by step" or "explain your reasoning" is unnecessary.
3. Use delimiters for clarity: Use delimiters like triple quotation marks, XML tags, or section titles to clearly indicate distinct parts of the input.
## [Getting Started with the AI SDK](#getting-started-with-the-ai-sdk)
The AI SDK is the TypeScript toolkit designed to help developers build AI-powered applications with React, Next.js, Vue, Svelte, Node.js, and more. Integrating LLMs into applications is complicated and heavily dependent on the specific model provider you use.
The AI SDK abstracts away the differences between model providers, eliminates boilerplate code for building chatbots, and allows you to go beyond text output to generate rich, interactive components.
At the center of the AI SDK is [AI SDK Core](/docs/ai-sdk-core/overview), which provides a unified API to call any LLM. The code snippet below is all you need to call OpenAI o3-mini with the AI SDK:
```
`
import { generateText } from 'ai';
import { openai } from '@ai-sdk/openai';
const { text } = await generateText({
model: openai('o3-mini'),
prompt: 'Explain the concept of quantum entanglement.',
});
`
```
To use o3-mini, you must be using @ai-sdk/openai version 1.1.9 or greater.
System messages are automatically converted to OpenAI developer messages.
### [Refining Reasoning Effort](#refining-reasoning-effort)
You can control the amount of reasoning effort expended by o3-mini through the `reasoningEffort` parameter.
This parameter can be set to `low`, `medium`, or `high` to adjust how much time and computation the model spends on internal reasoning before producing a response.
```
`
import { generateText } from 'ai';
import { openai } from '@ai-sdk/openai';
// Reduce reasoning effort for faster responses
const { text } = await generateText({
model: openai('o3-mini'),
prompt: 'Explain quantum entanglement briefly.',
providerOptions: {
openai: { reasoningEffort: 'low' },
},
});
`
```
### [Generating Structured Data](#generating-structured-data)
While text generation can be useful, you might want to generate structured JSON data. For example, you might want to extract information from text, classify data, or generate synthetic data. AI SDK Core provides [`generateText`](/docs/reference/ai-sdk-core/generate-text) and [`streamText`](/docs/reference/ai-sdk-core/stream-text) with `Output` to generate structured data, allowing you to constrain model outputs to a specific schema.
```
`
import { generateText, Output } from 'ai';
import { openai } from '@ai-sdk/openai';
import { z } from 'zod';
const { output } = await generateText({
model: openai('o3-mini'),
output: Output.object({
schema: z.object({
recipe: z.object({
name: z.string(),
ingredients: z.array(
z.object({ name: z.string(), amount: z.string() }),
),
steps: z.array(z.string()),
}),
}),
}),
prompt: 'Generate a lasagna recipe.',
});
`
```
This code snippet will generate a type-safe recipe that conforms to the specified zod schema.
### [Using Tools with the AI SDK](#using-tools-with-the-ai-sdk)
o3-mini supports tool calling out of the box, allowing it to interact with external systems and perform discrete tasks. Here's an example of using tool calling with the AI SDK:
```
`
import { generateText, tool } from 'ai';
import { openai } from '@ai-sdk/openai';
import { z } from 'zod';
const { text } = await generateText({
model: openai('o3-mini'),
prompt: 'What is the weather like today in San Francisco?',
tools: {
getWeather: tool({
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
`
```
In this example, the `getWeather` tool allows the model to fetch real-time weather data (simulated for simplicity), enhancing its ability to provide accurate and up-to-date information.
### [Building Interactive Interfaces](#building-interactive-interfaces)
AI SDK Core can be paired with [AI SDK UI](/docs/ai-sdk-ui/overview), another powerful component of the AI SDK, to streamline the process of building chat, completion, and assistant interfaces with popular frameworks like Next.js, Nuxt, and SvelteKit.
AI SDK UI provides robust abstractions that simplify the complex tasks of managing chat streams and UI updates on the frontend, enabling you to develop dynamic AI-driven interfaces more efficiently.
With four main hooks — [`useChat`](/docs/reference/ai-sdk-ui/use-chat), [`useCompletion`](/docs/reference/ai-sdk-ui/use-completion), and [`useObject`](/docs/reference/ai-sdk-ui/use-object) — you can incorporate real-time chat capabilities, text completions, streamed JSON, and interactive assistant features into your app.
Let's explore building a chatbot with [Next.js](https://nextjs.org), the AI SDK, and OpenAI o3-mini:
In a new Next.js application, first install the AI SDK and the OpenAI provider:
```
pnpm install ai @ai-sdk/openai @ai-sdk/react
```
Then, create a route handler for the chat endpoint:
app/api/chat/route.ts
```
`
import { openai } from '@ai-sdk/openai';
import { convertToModelMessages, streamText, UIMessage } from 'ai';
// Allow responses up to 5 minutes
export const maxDuration = 300;
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: openai('o3-mini'),
messages: await convertToModelMessages(messages),
});
return result.toUIMessageStreamResponse();
}
`
```
Finally, update the root page (`app/page.tsx`) to use the `useChat` hook:
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
export default function Page() {
const { messages, input, handleInputChange, handleSubmit, error } = useChat();
return (
\<\>
{messages.map(message =\> (
\<div key={message.id}\>
{message.role === 'user' ? 'User: ' : 'AI: '}
{message.content}
\</div\>
))}
\<form onSubmit={handleSubmit}\>
\<input name="prompt" value={input} onChange={handleInputChange} /\>
\<button type="submit"\>Submit\</button\>
\</form\>
\</\>
);
}
`
```
The useChat hook on your root page (`app/page.tsx`) will make a request to your AI provider endpoint (`app/api/chat/route.ts`) whenever the user submits a message. The messages are then displayed in the chat UI.
## [Get Started](#get-started)
Ready to get started? Here's how you can dive in:
1. Explore the documentation at [ai-sdk.dev/docs](/docs) to understand the full capabilities of the AI SDK.
2. Check out our support for o3-mini in the [OpenAI Provider](/providers/ai-sdk-providers/openai#reasoning-models).
3. Check out practical examples at [ai-sdk.dev/examples](/examples) to see the SDK in action and get inspired for your own projects.
4. Dive deeper with advanced guides on topics like Retrieval-Augmented Generation (RAG) and multi-modal chat at [ai-sdk.dev/docs/guides](/cookbook/guides).
5. Check out ready-to-deploy AI templates at [vercel.com/templates?type=ai](https://vercel.com/templates?type=ai).
On this page
[Get started with OpenAI o3-mini](#get-started-with-openai-o3-mini)
[OpenAI o3-mini](#openai-o3-mini)
[Benchmarks](#benchmarks)
[Prompt Engineering for o3-mini](#prompt-engineering-for-o3-mini)
[Getting Started with the AI SDK](#getting-started-with-the-ai-sdk)
[Refining Reasoning Effort](#refining-reasoning-effort)
[Generating Structured Data](#generating-structured-data)
[Using Tools with the AI SDK](#using-tools-with-the-ai-sdk)
[Building Interactive Interfaces](#building-interactive-interfaces)
[Get Started](#get-started)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)