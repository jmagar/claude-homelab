Guides: Get started with DeepSeek R1
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
# [Get started with DeepSeek R1](#get-started-with-deepseek-r1)
With the [release of DeepSeek R1](https://api-docs.deepseek.com/news/news250528), there has never been a better time to start building AI applications, particularly those that require complex reasoning capabilities.
The [AI SDK](/) is a powerful TypeScript toolkit for building AI applications with large language models (LLMs) like DeepSeek R1 alongside popular frameworks like React, Next.js, Vue, Svelte, Node.js, and more.
## [DeepSeek R1](#deepseek-r1)
DeepSeek R1 is a series of advanced AI models designed to tackle complex reasoning tasks in science, coding, and mathematics. These models are optimized to "think before they answer," producing detailed internal chains of thought that aid in solving challenging problems.
The series includes two primary variants:
* **DeepSeek R1-Zero**: Trained exclusively with reinforcement learning (RL) without any supervised fine-tuning. It exhibits advanced reasoning capabilities but may struggle with readability and formatting.
* **DeepSeek R1**: Combines reinforcement learning with cold-start data and supervised fine-tuning to improve both reasoning performance and the readability of outputs.
### [Benchmarks](#benchmarks)
DeepSeek R1 models excel in reasoning tasks, delivering competitive performance across key benchmarks:
* **AIME 2024 (Pass@1)**: 79.8%
* **MATH-500 (Pass@1)**: 97.3%
* **Codeforces (Percentile)**: Top 4% (96.3%)
* **GPQA Diamond (Pass@1)**: 71.5%
[Source](https://github.com/deepseek-ai/DeepSeek-R1?tab=readme-ov-file#4-evaluation-results)
### [Prompt Engineering for DeepSeek R1 Models](#prompt-engineering-for-deepseek-r1-models)
DeepSeek R1 models excel with structured and straightforward prompts. The following best practices can help achieve optimal performance:
1. **Use a structured format**: Leverage the model’s preferred output structure with `\<think\>` tags for reasoning and `\<answer\>` tags for the final result.
2. **Prefer zero-shot prompts**: Avoid few-shot prompting as it can degrade performance; instead, directly state the problem clearly.
3. **Specify output expectations**: Guide the model by defining desired formats, such as markdown for readability or XML-like tags for clarity.
## [Getting Started with the AI SDK](#getting-started-with-the-ai-sdk)
The AI SDK is the TypeScript toolkit designed to help developers build AI-powered applications with React, Next.js, Vue, Svelte, Node.js, and more. Integrating LLMs into applications is complicated and heavily dependent on the specific model provider you use.
The AI SDK abstracts away the differences between model providers, eliminates boilerplate code for building chatbots, and allows you to go beyond text output to generate rich, interactive components.
At the center of the AI SDK is [AI SDK Core](/docs/ai-sdk-core/overview), which provides a unified API to call any LLM. The code snippet below is all you need to call DeepSeek R1 with the AI SDK:
```
`
import { deepseek } from '@ai-sdk/deepseek';
import { generateText } from 'ai';
const { reasoningText, text } = await generateText({
model: deepseek('deepseek-reasoner'),
prompt: 'Explain quantum entanglement.',
});
`
```
The unified interface also means that you can easily switch between providers by changing just two lines of code. For example, to use DeepSeek R1 via Fireworks:
```
`
import { fireworks } from '@ai-sdk/fireworks';
import {
generateText,
wrapLanguageModel,
extractReasoningMiddleware,
} from 'ai';
// middleware to extract reasoning tokens
const enhancedModel = wrapLanguageModel({
model: fireworks('accounts/fireworks/models/deepseek-r1'),
middleware: extractReasoningMiddleware({ tagName: 'think' }),
});
const { reasoningText, text } = await generateText({
model: enhancedModel,
prompt: 'Explain quantum entanglement.',
});
`
```
Or to use Groq's `deepseek-r1-distill-llama-70b` model:
```
`
import { groq } from '@ai-sdk/groq';
import {
generateText,
wrapLanguageModel,
extractReasoningMiddleware,
} from 'ai';
// middleware to extract reasoning tokens
const enhancedModel = wrapLanguageModel({
model: groq('deepseek-r1-distill-llama-70b'),
middleware: extractReasoningMiddleware({ tagName: 'think' }),
});
const { reasoningText, text } = await generateText({
model: enhancedModel,
prompt: 'Explain quantum entanglement.',
});
`
```
The AI SDK provides a [middleware](/docs/ai-sdk-core/middleware)
(`extractReasoningMiddleware`) that can be used to extract the reasoning
tokens from the model's output.
When using DeepSeek-R1 series models with third-party providers like Together AI, we recommend using the `startWithReasoning`
option in the `extractReasoningMiddleware` function, as they tend to bypass thinking patterns.
### [Model Provider Comparison](#model-provider-comparison)
You can use DeepSeek R1 with the AI SDK through various providers. Here's a comparison of the providers that support DeepSeek R1:
|Provider|Model ID|Reasoning Tokens|
|[DeepSeek](/providers/ai-sdk-providers/deepseek)|[`deepseek-reasoner`](https://api-docs.deepseek.com/guides/reasoning_model)||
|[Fireworks](/providers/ai-sdk-providers/fireworks)|[`accounts/fireworks/models/deepseek-r1`](https://fireworks.ai/models/fireworks/deepseek-r1)|Requires Middleware|
|[Groq](/providers/ai-sdk-providers/groq)|[`deepseek-r1-distill-llama-70b`](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Llama-70B)|Requires Middleware|
|[Azure](/providers/ai-sdk-providers/azure)|[`DeepSeek-R1`](https://ai.azure.com/explore/models/DeepSeek-R1/version/1/registry/azureml-deepseek#code-samples)|Requires Middleware|
|[Together AI](/providers/ai-sdk-providers/togetherai)|[`deepseek-ai/DeepSeek-R1`](https://www.together.ai/models/deepseek-r1)|Requires Middleware|
|[FriendliAI](/providers/community-providers/friendliai)|[`deepseek-r1`](https://huggingface.co/deepseek-ai/DeepSeek-R1)|Requires Middleware|
|[LangDB](/providers/community-providers/langdb)|[`deepseek/deepseek-reasoner`](https://docs.langdb.ai/guides/deepseek)|Requires Middleware|
### [Building Interactive Interfaces](#building-interactive-interfaces)
AI SDK Core can be paired with [AI SDK UI](/docs/ai-sdk-ui/overview), another powerful component of the AI SDK, to streamline the process of building chat, completion, and assistant interfaces with popular frameworks like Next.js, Nuxt, and SvelteKit.
AI SDK UI provides robust abstractions that simplify the complex tasks of managing chat streams and UI updates on the frontend, enabling you to develop dynamic AI-driven interfaces more efficiently.
With four main hooks — [`useChat`](/docs/reference/ai-sdk-ui/use-chat), [`useCompletion`](/docs/reference/ai-sdk-ui/use-completion), and [`useObject`](/docs/reference/ai-sdk-ui/use-object) — you can incorporate real-time chat capabilities, text completions, streamed JSON, and interactive assistant features into your app.
Let's explore building a chatbot with [Next.js](https://nextjs.org), the AI SDK, and DeepSeek R1:
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
if (part.type === 'reasoning') {
return \<pre key={index}\>{part.text}\</pre\>;
}
if (part.type === 'text') {
return \<span key={index}\>{part.text}\</span\>;
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
You can access the model's reasoning tokens through the `parts` array on the
`message` object, where reasoning parts have `type: 'reasoning'`.
The useChat hook on your root page (`app/page.tsx`) will make a request to your AI provider endpoint (`app/api/chat/route.ts`) whenever the user submits a message. The messages are then displayed in the chat UI.
## [Limitations](#limitations)
While DeepSeek R1 models are powerful, they have certain limitations:
* No tool-calling support: DeepSeek R1 cannot directly interact with APIs or external tools.
* No object generation support: DeepSeek R1 does not support structured object generation. However, you can combine it with models that support structured object generation (like gpt-4o-mini) to generate objects. See the [structured object generation with a reasoning model recipe](/cookbook/node/generate-object-reasoning) for more information.
## [Get Started](#get-started)
Ready to dive in? Here's how you can begin:
1. Explore the documentation at [ai-sdk.dev/docs](/docs) to understand the capabilities of the AI SDK.
2. Check out practical examples at [ai-sdk.dev/examples](/examples) to see the SDK in action.
3. Dive deeper with advanced guides on topics like Retrieval-Augmented Generation (RAG) at [ai-sdk.dev/docs/guides](/cookbook/guides).
4. Use ready-to-deploy AI templates at [vercel.com/templates?type=ai](https://vercel.com/templates?type=ai).
DeepSeek R1 opens new opportunities for reasoning-intensive AI applications. Start building today and leverage the power of advanced reasoning in your AI projects.
On this page
[Get started with DeepSeek R1](#get-started-with-deepseek-r1)
[DeepSeek R1](#deepseek-r1)
[Benchmarks](#benchmarks)
[Prompt Engineering for DeepSeek R1 Models](#prompt-engineering-for-deepseek-r1-models)
[Getting Started with the AI SDK](#getting-started-with-the-ai-sdk)
[Model Provider Comparison](#model-provider-comparison)
[Building Interactive Interfaces](#building-interactive-interfaces)
[Limitations](#limitations)
[Get Started](#get-started)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)