Guides: Get started with Claude 3.7 Sonnet
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
# [Get started with Claude 3.7 Sonnet](#get-started-with-claude-37-sonnet)
This guide is deprecated. [Claude 3.7 Sonnet was retired on February 19,
2026](https://platform.claude.com/docs/en/about-claude/model-deprecations#2025-10-28-claude-sonnet-3-7-model)
and can no longer be used with the Anthropic API.
With the [release of Claude 3.7 Sonnet](https://www.anthropic.com/news/claude-3-7-sonnet), there has never been a better time to start building AI applications, particularly those that require complex reasoning capabilities.
The [AI SDK](/) is a powerful TypeScript toolkit for building AI applications with large language models (LLMs) like Claude 3.7 Sonnet alongside popular frameworks like React, Next.js, Vue, Svelte, Node.js, and more.
## [Claude 3.7 Sonnet](#claude-37-sonnet)
Claude 3.7 Sonnet is Anthropic's most intelligent model to date and the first Claude model to offer extended thinking—the ability to solve complex problems with careful, step-by-step reasoning. With Claude 3.7 Sonnet, you can balance speed and quality by choosing between standard thinking for near-instant responses or extended thinking or advanced reasoning. Claude 3.7 Sonnet is state-of-the-art for coding, and delivers advancements in computer use, agentic capabilities, complex reasoning, and content generation. With frontier performance and more control over speed, Claude 3.7 Sonnet is a great choice for powering AI agents, especially customer-facing agents, and complex AI workflows.
## [Getting Started with the AI SDK](#getting-started-with-the-ai-sdk)
The AI SDK is the TypeScript toolkit designed to help developers build AI-powered applications with React, Next.js, Vue, Svelte, Node.js, and more. Integrating LLMs into applications is complicated and heavily dependent on the specific model provider you use.
The AI SDK abstracts away the differences between model providers, eliminates boilerplate code for building chatbots, and allows you to go beyond text output to generate rich, interactive components.
At the center of the AI SDK is [AI SDK Core](/docs/ai-sdk-core/overview), which provides a unified API to call any LLM. The code snippet below is all you need to call Claude 3.7 Sonnet with the AI SDK:
```
`
import { anthropic } from '@ai-sdk/anthropic';
import { generateText } from 'ai';
const { text, reasoningText, reasoning } = await generateText({
model: anthropic('claude-3-7-sonnet-20250219'),
prompt: 'How many people will live in the world in 2040?',
});
console.log(text); // text response
`
```
The unified interface also means that you can easily switch between providers by changing just two lines of code. For example, to use Claude 3.7 Sonnet via Amazon Bedrock:
```
`
import { bedrock } from '@ai-sdk/amazon-bedrock';
import { generateText } from 'ai';
const { reasoning, text } = await generateText({
model: bedrock('anthropic.claude-3-7-sonnet-20250219-v1:0'),
prompt: 'How many people will live in the world in 2040?',
});
`
```
### [Reasoning Ability](#reasoning-ability)
Claude 3.7 Sonnet introduces a new extended thinking—the ability to solve complex problems with careful, step-by-step reasoning. You can enable it using the `thinking` provider option and specifying a thinking budget in tokens:
```
`
import { anthropic, AnthropicLanguageModelOptions } from '@ai-sdk/anthropic';
import { generateText } from 'ai';
const { text, reasoningText, reasoning } = await generateText({
model: anthropic('claude-3-7-sonnet-20250219'),
prompt: 'How many people will live in the world in 2040?',
providerOptions: {
anthropic: {
thinking: { type: 'enabled', budgetTokens: 12000 },
} satisfies AnthropicLanguageModelOptions,
},
});
console.log(reasoningText); // reasoning text
console.log(reasoning); // reasoning details including redacted reasoning
console.log(text); // text response
`
```
### [Building Interactive Interfaces](#building-interactive-interfaces)
AI SDK Core can be paired with [AI SDK UI](/docs/ai-sdk-ui/overview), another powerful component of the AI SDK, to streamline the process of building chat, completion, and assistant interfaces with popular frameworks like Next.js, Nuxt, and SvelteKit.
AI SDK UI provides robust abstractions that simplify the complex tasks of managing chat streams and UI updates on the frontend, enabling you to develop dynamic AI-driven interfaces more efficiently.
With four main hooks — [`useChat`](/docs/reference/ai-sdk-ui/use-chat), [`useCompletion`](/docs/reference/ai-sdk-ui/use-completion), and [`useObject`](/docs/reference/ai-sdk-ui/use-object) — you can incorporate real-time chat capabilities, text completions, streamed JSON, and interactive assistant features into your app.
Let's explore building a chatbot with [Next.js](https://nextjs.org), the AI SDK, and Claude 3.7 Sonnet:
In a new Next.js application, first install the AI SDK and the Anthropic provider:
```
pnpm install ai @ai-sdk/anthropic
```
Then, create a route handler for the chat endpoint:
app/api/chat/route.ts
```
`
import { anthropic, AnthropicLanguageModelOptions } from '@ai-sdk/anthropic';
import { streamText, convertToModelMessages, type UIMessage } from 'ai';
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: anthropic('claude-3-7-sonnet-20250219'),
messages: await convertToModelMessages(messages),
providerOptions: {
anthropic: {
thinking: { type: 'enabled', budgetTokens: 12000 },
} satisfies AnthropicLanguageModelOptions,
},
});
return result.toUIMessageStreamResponse({
sendReasoning: true,
});
}
`
```
You can forward the model's reasoning tokens to the client with
`sendReasoning: true` in the `toUIMessageStreamResponse` method.
Finally, update the root page (`app/page.tsx`) to use the `useChat` hook:
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport } from 'ai';
import { useState } from 'react';
export default function Page() {
const [input, setInput] = useState('');
const { messages, sendMessage } = useChat({
transport: new DefaultChatTransport({ api: '/api/chat' }),
});
const handleSubmit = (e: React.FormEvent) =\> {
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
// text parts:
if (part.type === 'text') {
return \<div key={index}\>{part.text}\</div\>;
}
// reasoning parts:
if (part.type === 'reasoning') {
return \<pre key={index}\>{part.text}\</pre\>;
}
})}
\</div\>
))}
\<form onSubmit={handleSubmit}\>
\<input
name="prompt"
value={input}
onChange={e =\> setInput(e.target.value)}
/\>
\<button type="submit"\>Send\</button\>
\</form\>
\</\>
);
}
`
```
You can access the model's reasoning tokens with the `reasoning` part on the
message `parts`.
The useChat hook on your root page (`app/page.tsx`) will make a request to your LLM provider endpoint (`app/api/chat/route.ts`) whenever the user submits a message. The messages are then displayed in the chat UI.
## [Get Started](#get-started)
Ready to dive in? Here's how you can begin:
1. Explore the documentation at [ai-sdk.dev/docs](/docs) to understand the capabilities of the AI SDK.
2. Check out practical examples at [ai-sdk.dev/examples](/examples) to see the SDK in action.
3. Dive deeper with advanced guides on topics like Retrieval-Augmented Generation (RAG) at [ai-sdk.dev/docs/guides](/cookbook/guides).
4. Use ready-to-deploy AI templates at [vercel.com/templates?type=ai](https://vercel.com/templates?type=ai).
Claude 3.7 Sonnet opens new opportunities for reasoning-intensive AI applications. Start building today and leverage the power of advanced reasoning in your AI projects.
On this page
[Get started with Claude 3.7 Sonnet](#get-started-with-claude-37-sonnet)
[Claude 3.7 Sonnet](#claude-37-sonnet)
[Getting Started with the AI SDK](#getting-started-with-the-ai-sdk)
[Reasoning Ability](#reasoning-ability)
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