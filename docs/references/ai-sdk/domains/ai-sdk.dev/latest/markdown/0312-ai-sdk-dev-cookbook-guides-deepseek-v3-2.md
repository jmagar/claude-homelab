Guides: Get started with DeepSeek V3.2
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
# [Get started with DeepSeek V3.2](#get-started-with-deepseek-v32)
With the [release of DeepSeek V3.2](https://api-docs.deepseek.com/news/news251201), there has never been a better time to start building AI applications that require advanced reasoning and agentic capabilities.
The [AI SDK](/) is a powerful TypeScript toolkit for building AI applications with large language models (LLMs) like DeepSeek V3.2 alongside popular frameworks like React, Next.js, Vue, Svelte, Node.js, and more.
## [DeepSeek V3.2](#deepseek-v32)
DeepSeek V3.2 is a frontier model that harmonizes high computational efficiency with superior reasoning and agent performance. It introduces several key technical breakthroughs that enable it to perform comparably to GPT-5 while remaining open-source.
The series includes two primary variants:
* **DeepSeek V3.2**: The official successor to V3.2-Exp. A balanced model optimized for both reasoning and inference efficiency, delivering GPT-5 level performance.
* **DeepSeek V3.2-Speciale**: A high-compute variant with maxed-out reasoning capabilities that rivals Gemini-3.0-Pro. Achieves gold-medal performance in IMO 2025, CMO 2025, ICPC World Finals 2025, and IOI 2025. As of release, it does not support tool-use.
### [Benchmarks](#benchmarks)
DeepSeek V3.2 models excel in both reasoning and agentic tasks, delivering competitive performance across key benchmarks:
**Reasoning Capabilities**
* **AIME 2025 (Pass@1)**: 96.0% (Speciale)
* **HMMT 2025 (Pass@1)**: 99.2% (Speciale)
* **HLE (Pass@1)**: 30.6%
* **Codeforces (Rating)**: 2701 (Speciale)
**Agentic Capabilities**
* **SWE Verified (Resolved)**: 73.1%
* **Terminal Bench 2.0 (Acc)**: 46.4%
* **τ2 Bench (Pass@1)**: 80.3%
* **Tool Decathlon (Pass@1)**: 35.2%
[Source](https://huggingface.co/deepseek-ai/DeepSeek-V3.2/resolve/main/assets/paper.pdf)
### [Model Options](#model-options)
When using DeepSeek V3.2 with the AI SDK, you have two model options:
|Model Alias|Model Version|Description|
|`deepseek-chat`|DeepSeek-V3.2 (Non-thinking Mode)|Standard chat model|
|`deepseek-reasoner`|DeepSeek-V3.2 (Thinking Mode)|Enhanced reasoning for complex problem-solving|
## [Getting Started with the AI SDK](#getting-started-with-the-ai-sdk)
The AI SDK is the TypeScript toolkit designed to help developers build AI-powered applications with React, Next.js, Vue, Svelte, Node.js, and more. Integrating LLMs into applications is complicated and heavily dependent on the specific model provider you use.
The AI SDK abstracts away the differences between model providers, eliminates boilerplate code for building agents, and allows you to go beyond text output to generate rich, interactive components.
At the center of the AI SDK is [AI SDK Core](/docs/ai-sdk-core/overview), which provides a unified API to call any LLM. The code snippet below is all you need to call DeepSeek V3.2 with the AI SDK:
```
`
import { deepseek } from '@ai-sdk/deepseek';
import { generateText } from 'ai';
const { text } = await generateText({
model: deepseek('deepseek-chat'),
prompt: 'Explain the concept of sparse attention in transformers.',
});
`
```
### [Building Interactive Interfaces](#building-interactive-interfaces)
AI SDK Core can be paired with [AI SDK UI](/docs/ai-sdk-ui/overview), another powerful component of the AI SDK, to streamline the process of building chat, completion, and assistant interfaces with popular frameworks like Next.js, Nuxt, and SvelteKit.
AI SDK UI provides robust abstractions that simplify the complex tasks of managing chat streams and UI updates on the frontend, enabling you to develop dynamic AI-driven interfaces more efficiently.
With three main hooks — [`useChat`](/docs/reference/ai-sdk-ui/use-chat), [`useCompletion`](/docs/reference/ai-sdk-ui/use-completion), and [`useObject`](/docs/reference/ai-sdk-ui/use-object) — you can incorporate real-time chat capabilities, text completions, streamed JSON, and interactive assistant features into your app.
Let's explore building an agent with [Next.js](https://nextjs.org), the AI SDK, and DeepSeek V3.2:
In a new Next.js application, first install the AI SDK and the DeepSeek provider:
```
pnpm install ai @ai-sdk/deepseek @ai-sdk/react
```
Then, create a route handler for the chat endpoint:
app/api/chat/route.ts
```
`
import { deepseek } from '@ai-sdk/deepseek';
import { convertToModelMessages, streamText, UIMessage } from 'ai';
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: deepseek('deepseek-reasoner'),
messages: await convertToModelMessages(messages),
});
return result.toUIMessageStreamResponse({ sendReasoning: true });
}
`
```
Finally, update the root page (`app/page.tsx`) to use the `useChat` hook:
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { useState } from 'react';
export default function Page() {
const [input, setInput] = useState('');
const { messages, sendMessage } = useChat();
const handleSubmit = (e: React.FormEvent\<HTMLFormElement\>) =\> {
e.preventDefault();
if (input.trim()) {
sendMessage({ text: input });
setInput('');
}
};
return (
\<\>
{messages.map(message =\> (
\<div key={message.id}\>
{message.role === 'user' ? 'User: ' : 'AI: '}
{message.parts.map((part, index) =\> {
if (part.type === 'text' || part.type === 'reasoning') {
return \<div key={index}\>{part.text}\</div\>;
}
return null;
})}
\</div\>
))}
\<form onSubmit={handleSubmit}\>
\<input
name="prompt"
value={input}
onChange={e =\> setInput(e.target.value)}
/\>
\<button type="submit"\>Submit\</button\>
\</form\>
\</\>
);
}
`
```
The useChat hook on your root page (`app/page.tsx`) will make a request to your AI provider endpoint (`app/api/chat/route.ts`) whenever the user submits a message. The messages are then displayed in the chat UI.
## [Enhance Your Agent with Tools](#enhance-your-agent-with-tools)
One of the key strengths of DeepSeek V3.2 is its agentic capabilities. You can extend your agent's functionality by adding tools that allow the model to perform specific actions or retrieve information.
### [Update Your Route Handler](#update-your-route-handler)
Let's add a weather tool to your agent. Update your route handler at `app/api/chat/route.ts`:
app/api/chat/route.ts
```
`
import { deepseek } from '@ai-sdk/deepseek';
import {
convertToModelMessages,
stepCountIs,
streamText,
tool,
UIMessage,
} from 'ai';
import { z } from 'zod';
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: deepseek('deepseek-reasoner'),
messages: await convertToModelMessages(messages),
tools: {
weather: tool({
description: 'Get the weather in a location',
inputSchema: z.object({
location: z.string().describe('The location to get the weather for'),
}),
execute: async ({ location }) =\> ({
location,
temperature: 72,
unit: 'fahrenheit',
}),
}),
},
stopWhen: stepCountIs(5),
});
return result.toUIMessageStreamResponse({ sendReasoning: true });
}
`
```
This adds a weather tool that the model can call when needed. The `stopWhen: stepCountIs(5)` parameter allows the agent to continue executing for multiple steps (up to 5), enabling it to use tools and reason iteratively before stopping. Learn more about [loop control](/docs/agents/loop-control) to customize when and how your agent stops execution.
## [Get Started](#get-started)
Ready to dive in? Here's how you can begin:
1. Explore the documentation at [ai-sdk.dev/docs](/docs) to understand the capabilities of the AI SDK.
2. Check out practical examples at [ai-sdk.dev/examples](/examples) to see the SDK in action.
3. Dive deeper with advanced guides on topics like Retrieval-Augmented Generation (RAG) at [ai-sdk.dev/docs/guides](/cookbook/guides).
4. Use ready-to-deploy AI templates at [vercel.com/templates?type=ai](https://vercel.com/templates?type=ai).
On this page
[Get started with DeepSeek V3.2](#get-started-with-deepseek-v32)
[DeepSeek V3.2](#deepseek-v32)
[Benchmarks](#benchmarks)
[Model Options](#model-options)
[Getting Started with the AI SDK](#getting-started-with-the-ai-sdk)
[Building Interactive Interfaces](#building-interactive-interfaces)
[Enhance Your Agent with Tools](#enhance-your-agent-with-tools)
[Update Your Route Handler](#update-your-route-handler)
[Get Started](#get-started)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)