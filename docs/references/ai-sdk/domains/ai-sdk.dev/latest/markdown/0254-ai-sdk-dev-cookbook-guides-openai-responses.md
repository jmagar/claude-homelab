Guides: OpenAI Responses API
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
# [Get started with OpenAI Responses API](#get-started-with-openai-responses-api)
With the [release of OpenAI's responses API](https://openai.com/index/new-tools-for-building-agents/), there has never been a better time to start building AI applications, particularly those that require a deeper understanding of the world.
The [AI SDK](/) is a powerful TypeScript toolkit for building AI applications with large language models (LLMs) alongside popular frameworks like React, Next.js, Vue, Svelte, Node.js, and more.
## [OpenAI Responses API](#openai-responses-api)
OpenAI recently released the Responses API, a brand new way to build applications on OpenAI's platform. The new API offers a way to persist chat history, a web search tool for grounding LLM responses, file search tool for finding relevant files, and a computer use tool for building agents that can interact with and operate computers. Let's explore how to use the Responses API with the AI SDK.
## [Getting Started with the AI SDK](#getting-started-with-the-ai-sdk)
The AI SDK is the TypeScript toolkit designed to help developers build AI-powered applications with React, Next.js, Vue, Svelte, Node.js, and more. Integrating LLMs into applications is complicated and heavily dependent on the specific model provider you use.
The AI SDK abstracts away the differences between model providers, eliminates boilerplate code for building chatbots, and allows you to go beyond text output to generate rich, interactive components.
At the center of the AI SDK is [AI SDK Core](/docs/ai-sdk-core/overview), which provides a unified API to call any LLM. The code snippet below is all you need to call GPT-4o with the new Responses API using the AI SDK:
```
`
import { generateText } from 'ai';
import { openai } from '@ai-sdk/openai';
const { text } = await generateText({
model: openai.responses('gpt-4o'),
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
model: openai.responses('gpt-4o'),
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
The Responses API supports tool calling out of the box, allowing it to interact with external systems and perform discrete tasks. Here's an example of using tool calling with the AI SDK:
```
`
import { generateText, tool } from 'ai';
import { openai } from '@ai-sdk/openai';
import { z } from 'zod';
const { text } = await generateText({
model: openai.responses('gpt-4o'),
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
stopWhen: stepCountIs(5), // enable multi-step 'agentic' LLM calls
});
`
```
This example demonstrates how `stopWhen` transforms a single LLM call into an agent. The `stopWhen: stepCountIs(5)` parameter allows the model to autonomously call tools, analyze results, and make additional tool calls as needed - turning what would be a simple one-shot completion into an intelligent agent that can chain multiple actions together to complete complex tasks.
### [Web Search Tool](#web-search-tool)
The Responses API introduces a built-in tool for grounding responses called `webSearch`. With this tool, the model can access the internet to find relevant information for its responses.
```
`
import { openai } from '@ai-sdk/openai';
import { generateText } from 'ai';
const result = await generateText({
model: openai.responses('gpt-4o-mini'),
prompt: 'What happened in San Francisco last week?',
tools: {
web\_search\_preview: openai.tools.webSearchPreview(),
},
});
console.log(result.text);
console.log(result.sources);
`
```
The `webSearch` tool also allows you to specify query-specific metadata that can be used to improve the quality of the search results.
```
`
import { generateText } from 'ai';
const result = await generateText({
model: openai.responses('gpt-4o-mini'),
prompt: 'What happened in San Francisco last week?',
tools: {
web\_search\_preview: openai.tools.webSearchPreview({
searchContextSize: 'high',
userLocation: {
type: 'approximate',
city: 'San Francisco',
region: 'California',
},
}),
},
});
console.log(result.text);
console.log(result.sources);
`
```
### [MCP Tool](#mcp-tool)
The Responses API also supports connecting to [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) servers. This allows models to call tools exposed by remote MCP servers or service connectors.
```
`
import { openai } from '@ai-sdk/openai';
import { generateText } from 'ai';
const result = await generateText({
model: openai.responses('gpt-5-mini'),
prompt: 'Search the web for the latest NYC mayoral election results',
tools: {
mcp: openai.tools.mcp({
serverLabel: 'web-search',
serverUrl: 'https://mcp.exa.ai/mcp',
serverDescription: 'A web-search API for AI agents',
}),
},
});
console.log(result.text);
`
```
For more details on configuring the MCP tool, including authentication, tool filtering, and connector support, see the [OpenAI provider documentation](/providers/ai-sdk-providers/openai#mcp-tool).
## [Using Persistence](#using-persistence)
With the Responses API, you can persist chat history with OpenAI across requests. This allows you to send just the user's last message and OpenAI can access the entire chat history.
There are two options available to use persistence:
### [With previousResponseId](#with-previousresponseid)
app/api/chat/route.ts
```
`
import { openai } from '@ai-sdk/openai';
import { generateText } from 'ai';
const result1 = await generateText({
model: openai.responses('gpt-4o-mini'),
prompt: 'Invent a new holiday and describe its traditions.',
});
const result2 = await generateText({
model: openai.responses('gpt-4o-mini'),
prompt: 'Summarize in 2 sentences',
providerOptions: {
openai: {
previousResponseId: result1.providerMetadata?.openai.responseId as string,
},
},
});
`
```
### [With Conversations](#with-conversations)
You can use the [Conversation API](https://platform.openai.com/docs/api-reference/conversations/create) to create a conversation.
Once you have created a conversation, you can continue it:
app/api/chat/route.ts
```
`
import { openai } from '@ai-sdk/openai';
import { generateText } from 'ai';
const result = await generateText({
model: openai.responses('gpt-4o-mini'),
prompt: 'Summarize in 2 sentences',
providerOptions: {
openai: {
// The Conversation ID created via the OpenAI API to continue
conversation: 'conv\_123',
},
},
});
`
```
## [Migrating from Completions API](#migrating-from-completions-api)
Migrating from the OpenAI Completions API (via the AI SDK) to the new Responses API is simple. To migrate, simply change your provider instance from `openai(modelId)` to `openai.responses(modelId)`:
```
`
import { generateText } from 'ai';
import { openai } from '@ai-sdk/openai';
// Completions API
const { text } = await generateText({
model: openai('gpt-4o'),
prompt: 'Explain the concept of quantum entanglement.',
});
// Responses API
const { text } = await generateText({
model: openai.responses('gpt-4o'),
prompt: 'Explain the concept of quantum entanglement.',
});
`
```
When using the Responses API, provider specific options that were previously specified on the model provider instance have now moved to the `providerOptions` object:
```
`
import { generateText } from 'ai';
import { openai } from '@ai-sdk/openai';
// Completions API
const { text } = await generateText({
model: openai('gpt-4o'),
prompt: 'Explain the concept of quantum entanglement.',
providerOptions: {
openai: {
parallelToolCalls: false,
},
},
});
// Responses API
const { text } = await generateText({
model: openai.responses('gpt-4o'),
prompt: 'Explain the concept of quantum entanglement.',
providerOptions: {
openai: {
parallelToolCalls: false,
},
},
});
`
```
## [Get Started](#get-started)
Ready to get started? Here's how you can dive in:
1. Explore the documentation at [ai-sdk.dev/docs](/docs) to understand the full capabilities of the AI SDK.
2. Check out practical examples at [ai-sdk.dev/examples](/examples) to see the SDK in action and get inspired for your own projects.
3. Dive deeper with advanced guides on topics like Retrieval-Augmented Generation (RAG) and multi-modal chat at [ai-sdk.dev/docs/guides](/cookbook/guides).
4. Check out ready-to-deploy AI templates at [vercel.com/templates?type=ai](https://vercel.com/templates?type=ai).
On this page
[Get started with OpenAI Responses API](#get-started-with-openai-responses-api)
[OpenAI Responses API](#openai-responses-api)
[Getting Started with the AI SDK](#getting-started-with-the-ai-sdk)
[Generating Structured Data](#generating-structured-data)
[Using Tools with the AI SDK](#using-tools-with-the-ai-sdk)
[Web Search Tool](#web-search-tool)
[MCP Tool](#mcp-tool)
[Using Persistence](#using-persistence)
[With previousResponseId](#with-previousresponseid)
[With Conversations](#with-conversations)
[Migrating from Completions API](#migrating-from-completions-api)
[Get Started](#get-started)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)