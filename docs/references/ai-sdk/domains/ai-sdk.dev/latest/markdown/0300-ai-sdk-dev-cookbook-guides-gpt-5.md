Guides: Get started with GPT-5
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
# [Get started with OpenAI GPT-5](#get-started-with-openai-gpt-5)
With the [release of OpenAI's GPT-5 model](https://openai.com/index/introducing-gpt-5), there has never been a better time to start building AI applications with advanced capabilities like verbosity control, web search, and native multi-modal understanding.
The [AI SDK](/) is a powerful TypeScript toolkit for building AI applications with large language models (LLMs) like OpenAI GPT-5 alongside popular frameworks like React, Next.js, Vue, Svelte, Node.js, and more.
## [OpenAI GPT-5](#openai-gpt-5)
OpenAI's GPT-5 represents their latest advancement in language models, offering powerful new features including verbosity control for tailored response lengths, integrated web search capabilities, reasoning summaries for transparency, and native support for text, images, audio, and PDFs. The model is available in three variants: `gpt-5`, `gpt-5-mini` for faster, more cost-effective processing, and `gpt-5-nano` for ultra-efficient operations.
### [Prompt Engineering for GPT-5](#prompt-engineering-for-gpt-5)
Here are the key strategies for effective prompting:
#### [Core Principles](#core-principles)
1. **Be precise and unambiguous**: Avoid contradictory or ambiguous instructions. GPT-5 performs best with clear, explicit guidance.
2. **Use structured prompts**: Leverage XML-like tags to organize different sections of your instructions for better clarity.
3. **Natural language works best**: While being precise, write prompts as you would explain to a skilled colleague.
#### [Prompting Techniques](#prompting-techniques)
**1. Agentic Workflow Control**
* Adjust the `reasoningEffort` parameter to calibrate model autonomy
* Set clear stop conditions and define explicit tool call budgets
* Provide guidance on exploration depth and persistence
```
`
// Example with reasoning effort control
const result = await generateText({
model: openai('gpt-5'),
prompt: 'Analyze this complex dataset and provide insights.',
providerOptions: {
openai: {
reasoningEffort: 'high', // Increases autonomous exploration
},
},
});
`
```
**2. Structured Prompt Format**
Use XML-like tags to organize your prompts:
```
`
\<context\_gathering\>
Goal: Extract key performance metrics from the report
Method: Focus on quantitative data and year-over-year comparisons
Early stop criteria: Stop after finding 5 key metrics
\</context\_gathering\>
\<task\>
Analyze the attached financial report and identify the most important metrics.
\</task\>
`
```
**3. Tool Calling Best Practices**
* Use tool preambles to provide clear upfront plans
* Define safe vs. unsafe actions for different tools
* Create structured updates about tool call progress
**4. Verbosity Control**
* Use the `textVerbosity` parameter to control response length programmatically
* Override with natural language when needed for specific contexts
* Balance between conciseness and completeness
**5. Optimization Workflow**
* Start with a clear, simple prompt
* Test and identify areas of ambiguity or confusion
* Iteratively refine by removing contradictions
* Consider using OpenAI's Prompt Optimizer tool for complex prompts
* Document successful patterns for reuse
## [Getting Started with the AI SDK](#getting-started-with-the-ai-sdk)
The AI SDK is the TypeScript toolkit designed to help developers build AI-powered applications with React, Next.js, Vue, Svelte, Node.js, and more. Integrating LLMs into applications is complicated and heavily dependent on the specific model provider you use.
The AI SDK abstracts away the differences between model providers, eliminates boilerplate code for building chatbots, and allows you to go beyond text output to generate rich, interactive components.
At the center of the AI SDK is [AI SDK Core](/docs/ai-sdk-core/overview), which provides a unified API to call any LLM. The code snippet below is all you need to call OpenAI GPT-5 with the AI SDK:
```
`
import { generateText } from 'ai';
import { openai } from '@ai-sdk/openai';
const { text } = await generateText({
model: openai('gpt-5'),
prompt: 'Explain the concept of quantum entanglement.',
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
model: openai('gpt-5'),
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
### [Verbosity Control](#verbosity-control)
One of GPT-5's new features is verbosity control, allowing you to adjust response length without modifying your prompt:
```
`
import { generateText } from 'ai';
import { openai } from '@ai-sdk/openai';
// Concise response
const { text: conciseText } = await generateText({
model: openai('gpt-5'),
prompt: 'Explain quantum computing.',
providerOptions: {
openai: {
textVerbosity: 'low', // Produces terse, minimal responses
},
},
});
// Detailed response
const { text: detailedText } = await generateText({
model: openai('gpt-5'),
prompt: 'Explain quantum computing.',
providerOptions: {
openai: {
textVerbosity: 'high', // Produces comprehensive, detailed responses
},
},
});
`
```
### [Web Search](#web-search)
GPT-5 can access real-time information through the integrated web search tool:
```
`
import { generateText } from 'ai';
import { openai } from '@ai-sdk/openai';
const result = await generateText({
model: openai('gpt-5'),
prompt: 'What are the latest developments in AI this week?',
tools: {
web\_search: openai.tools.webSearch({
searchContextSize: 'high',
}),
},
});
// Access URL sources
const sources = result.sources;
`
```
### [Reasoning Summaries](#reasoning-summaries)
For transparency into GPT-5's thought process, enable reasoning summaries:
```
`
import { openai } from '@ai-sdk/openai';
import { streamText } from 'ai';
const result = streamText({
model: openai('gpt-5'),
prompt:
'Solve this logic puzzle: If all roses are flowers and some flowers fade quickly, do all roses fade quickly?',
providerOptions: {
openai: {
reasoningSummary: 'detailed', // 'auto' for condensed or 'detailed' for comprehensive
},
},
});
// Stream reasoning and text separately
for await (const part of result.fullStream) {
if (part.type === 'reasoning') {
console.log(part.textDelta);
} else if (part.type === 'text-delta') {
process.stdout.write(part.textDelta);
}
}
`
```
### [Using Tools with the AI SDK](#using-tools-with-the-ai-sdk)
GPT-5 supports tool calling out of the box, allowing it to interact with external systems and perform discrete tasks. Here's an example of using tool calling with the AI SDK:
```
`
import { generateText, tool } from 'ai';
import { openai } from '@ai-sdk/openai';
import { z } from 'zod';
const { toolResults } = await generateText({
model: openai('gpt-5'),
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
### [Building Interactive Interfaces](#building-interactive-interfaces)
AI SDK Core can be paired with [AI SDK UI](/docs/ai-sdk-ui/overview), another powerful component of the AI SDK, to streamline the process of building chat, completion, and assistant interfaces with popular frameworks like Next.js, Nuxt, and SvelteKit.
AI SDK UI provides robust abstractions that simplify the complex tasks of managing chat streams and UI updates on the frontend, enabling you to develop dynamic AI-driven interfaces more efficiently.
With four main hooks — [`useChat`](/docs/reference/ai-sdk-ui/use-chat), [`useCompletion`](/docs/reference/ai-sdk-ui/use-completion), and [`useObject`](/docs/reference/ai-sdk-ui/use-object) — you can incorporate real-time chat capabilities, text completions, streamed JSON, and interactive assistant features into your app.
Let's explore building a chatbot with [Next.js](https://nextjs.org), the AI SDK, and OpenAI GPT-5:
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
// Allow responses up to 30 seconds
export const maxDuration = 30;
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: openai('gpt-5'),
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
import { useState } from 'react';
export default function Page() {
const [input, setInput] = useState('');
const { messages, sendMessage } = useChat({});
return (
\<\>
{messages.map(message =\> (
\<div key={message.id}\>
{message.role === 'user' ? 'User: ' : 'AI: '}
{message.parts.map((part, index) =\> {
if (part.type === 'text') {
return \<span key={index}\>{part.text}\</span\>;
}
return null;
})}
\</div\>
))}
\<form
onSubmit={e =\> {
e.preventDefault();
if (input.trim()) {
sendMessage({ text: input });
setInput('');
}
}}
\>
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
## [Get Started](#get-started)
Ready to get started? Here's how you can dive in:
1. Explore the documentation at [ai-sdk.dev/docs](/docs) to understand the full capabilities of the AI SDK.
2. Check out practical examples at [ai-sdk.dev/cookbook](/cookbook) to see the SDK in action and get inspired for your own projects.
3. Dive deeper with advanced guides on topics like Retrieval-Augmented Generation (RAG) and multi-modal chat at [ai-sdk.dev/cookbook/guides](/cookbook/guides).
4. Check out ready-to-deploy AI templates at [vercel.com/templates?type=ai](https://vercel.com/templates?type=ai).
On this page
[Get started with OpenAI GPT-5](#get-started-with-openai-gpt-5)
[OpenAI GPT-5](#openai-gpt-5)
[Prompt Engineering for GPT-5](#prompt-engineering-for-gpt-5)
[Core Principles](#core-principles)
[Prompting Techniques](#prompting-techniques)
[Getting Started with the AI SDK](#getting-started-with-the-ai-sdk)
[Generating Structured Data](#generating-structured-data)
[Verbosity Control](#verbosity-control)
[Web Search](#web-search)
[Reasoning Summaries](#reasoning-summaries)
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