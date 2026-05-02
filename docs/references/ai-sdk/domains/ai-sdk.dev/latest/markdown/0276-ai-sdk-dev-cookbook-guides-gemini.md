Guides: Get started with Gemini 3
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
# [Get started with Gemini 3](#get-started-with-gemini-3)
With the release of Gemini 3, Google's most intelligent model to date, there has never been a better time to start building AI applications that combine state-of-the-art reasoning with multimodal understanding.
The [AI SDK](/) is a powerful TypeScript toolkit for building AI applications with large language models (LLMs) like Gemini 3 alongside popular frameworks like React, Next.js, Vue, Svelte, Node.js, and more.
## [Gemini 3](#gemini-3)
Gemini 3 represents a significant leap forward in AI capabilities, combining all of Gemini's strengths together to help you bring any idea to life. It delivers:
* State-of-the-art reasoning with unprecedented depth and nuance
* PhD-level performance on complex benchmarks like Humanity's Last Exam (37.5%) and GPQA Diamond (91.9%)
* Leading multimodal understanding with 81% on MMMU-Pro and 87.6% on Video-MMMU
* Best-in-class vibe coding and agentic capabilities
* Superior long-horizon planning for multi-step workflows
Gemini 3 Pro is currently available in preview, offering great performance across all benchmarks.
## [Getting Started with the AI SDK](#getting-started-with-the-ai-sdk)
The AI SDK is the TypeScript toolkit designed to help developers build AI-powered applications with React, Next.js, Vue, Svelte, Node.js, and more. Integrating LLMs into applications is complicated and heavily dependent on the specific model provider you use.
The AI SDK abstracts away the differences between model providers, eliminates boilerplate code for building chatbots, and allows you to go beyond text output to generate rich, interactive components.
At the center of the AI SDK is [AI SDK Core](/docs/ai-sdk-core/overview), which provides a unified API to call any LLM. The code snippet below is all you need to call Gemini 3 with the AI SDK:
```
`
import { google } from '@ai-sdk/google';
import { generateText } from 'ai';
const { text } = await generateText({
model: google('gemini-3-pro-preview'),
prompt: 'Explain the concept of the Hilbert space.',
});
console.log(text);
`
```
### [Enhanced Reasoning with Thinking Mode](#enhanced-reasoning-with-thinking-mode)
Gemini 3 models can use enhanced reasoning through thinking mode, which improves their ability to solve complex problems. You can control the thinking level using the `thinkingLevel` provider option:
```
`
import { google, GoogleLanguageModelOptions } from '@ai-sdk/google';
import { generateText } from 'ai';
const { text } = await generateText({
model: google('gemini-3-pro-preview'),
prompt: 'What is the sum of the first 10 prime numbers?',
providerOptions: {
google: {
thinkingConfig: {
includeThoughts: true,
thinkingLevel: 'low',
},
} satisfies GoogleLanguageModelOptions,
},
});
console.log(text);
`
```
The `thinkingLevel` parameter accepts different values to control the depth of reasoning applied to your prompt:
* Gemini 3 Pro supports: `'low'` and `'high'`
* Gemini 3 Flash supports: `'minimal'`, `'low'`, `'medium'`, and `'high'`
### [Using Tools with the AI SDK](#using-tools-with-the-ai-sdk)
Gemini 3 excels at tool calling with improved reliability and consistency for multi-step workflows. Here's an example of using tool calling with the AI SDK:
```
`
import { z } from 'zod';
import { generateText, tool, stepCountIs } from 'ai';
import { google } from '@ai-sdk/google';
const result = await generateText({
model: google('gemini-3-pro-preview'),
prompt: 'What is the weather in San Francisco?',
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
stopWhen: stepCountIs(5), // enables multi-step calling
});
console.log(result.text);
console.log(result.steps);
`
```
### [Using Google Search with Gemini](#using-google-search-with-gemini)
With [search grounding](https://ai.google.dev/gemini-api/docs/google-search), Gemini can access the latest information using Google search. Here's an example of using Google Search with the AI SDK:
```
`
import { google } from '@ai-sdk/google';
import { GoogleGenerativeAIProviderMetadata } from '@ai-sdk/google';
import { generateText } from 'ai';
const { text, sources, providerMetadata } = await generateText({
model: google('gemini-3-pro-preview'),
tools: {
google\_search: google.tools.googleSearch({}),
},
prompt:
'List the top 5 San Francisco news from the past week.' +
'You must include the date of each article.',
});
// access the grounding metadata. Casting to the provider metadata type
// is optional but provides autocomplete and type safety.
const metadata = providerMetadata?.google as
| GoogleGenerativeAIProviderMetadata
| undefined;
const groundingMetadata = metadata?.groundingMetadata;
const safetyRatings = metadata?.safetyRatings;
console.log({ text, sources, groundingMetadata, safetyRatings });
`
```
### [Building Interactive Interfaces](#building-interactive-interfaces)
AI SDK Core can be paired with [AI SDK UI](/docs/ai-sdk-ui/overview), another powerful component of the AI SDK, to streamline the process of building chat, completion, and assistant interfaces with popular frameworks like Next.js, Nuxt, SvelteKit, and SolidStart.
AI SDK UI provides robust abstractions that simplify the complex tasks of managing chat streams and UI updates on the frontend, enabling you to develop dynamic AI-driven interfaces more efficiently.
With three main hooks — [`useChat`](/docs/reference/ai-sdk-ui/use-chat), [`useCompletion`](/docs/reference/ai-sdk-ui/use-completion), and [`useObject`](/docs/reference/ai-sdk-ui/use-object) — you can incorporate real-time chat capabilities, text completions, and streamed JSON into your app.
Let's explore building a chatbot with [Next.js](https://nextjs.org), the AI SDK, and Gemini 3 Pro:
In a new Next.js application, first install the AI SDK and the Google Generative AI provider:
```
pnpm install ai @ai-sdk/google
```
Then, create a route handler for the chat endpoint:
app/api/chat/route.ts
```
`
import { google } from '@ai-sdk/google';
import { streamText, UIMessage, convertToModelMessages } from 'ai';
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: google('gemini-3-pro-preview'),
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
export default function Chat() {
const [input, setInput] = useState('');
const { messages, sendMessage } = useChat();
return (
\<div className="flex flex-col w-full max-w-md py-24 mx-auto stretch"\>
{messages.map(message =\> (
\<div key={message.id} className="whitespace-pre-wrap"\>
{message.role === 'user' ? 'User: ' : 'Gemini: '}
{message.parts.map((part, i) =\> {
switch (part.type) {
case 'text':
return \<div key={`${message.id}-${i}`}\>{part.text}\</div\>;
}
})}
\</div\>
))}
\<form
onSubmit={e =\> {
e.preventDefault();
sendMessage({ text: input });
setInput('');
}}
\>
\<input
className="fixed dark:bg-zinc-900 bottom-0 w-full max-w-md p-2 mb-8 border border-zinc-300 dark:border-zinc-800 rounded shadow-xl"
value={input}
placeholder="Say something..."
onChange={e =\> setInput(e.currentTarget.value)}
/\>
\</form\>
\</div\>
);
}
`
```
The useChat hook on your root page (`app/page.tsx`) will make a request to your AI provider endpoint (`app/api/chat/route.ts`) whenever the user submits a message. The messages are then displayed in the chat UI.
## [Get Started](#get-started)
Ready to dive in? Here's how you can begin:
1. Explore the documentation at [ai-sdk.dev/docs](/docs) to understand the capabilities of the AI SDK.
2. Check out practical examples at [ai-sdk.dev/examples](/examples) to see the SDK in action.
3. Dive deeper with advanced guides on topics like Retrieval-Augmented Generation (RAG) at [ai-sdk.dev/docs/guides](/cookbook/guides).
4. Use ready-to-deploy AI templates at [vercel.com/templates?type=ai](https://vercel.com/templates?type=ai).
5. Read more about the [Google Generative AI provider](/providers/ai-sdk-providers/google-generative-ai).
On this page
[Get started with Gemini 3](#get-started-with-gemini-3)
[Gemini 3](#gemini-3)
[Getting Started with the AI SDK](#getting-started-with-the-ai-sdk)
[Enhanced Reasoning with Thinking Mode](#enhanced-reasoning-with-thinking-mode)
[Using Tools with the AI SDK](#using-tools-with-the-ai-sdk)
[Using Google Search with Gemini](#using-google-search-with-gemini)
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