Node: Web Search Agent
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
# [Web Search Agent](#web-search-agent)
There are two approaches you can take to building a web search agent with the AI SDK:
1. Use a model that has native web-searching capabilities
2. Use a tool to access the web and return search results.
Both approaches have their advantages and disadvantages. Models with native search capabilities tend to be faster and there is no additional cost to make the search. The disadvantage is that you have less control over what is being searched, and the functionality is limited to models that support it.
instead, by using a tool, you can achieve more flexibility and greater control over your search queries. It allows you to customize your search strategy, specify search parameters, and you can use it with any LLM that supports tool calling. This approach will incur additional costs for the search API you use, but gives you complete control over the search experience.
## [Using native web-search](#using-native-web-search)
There are several models that offer native web-searching capabilities (Perplexity, OpenAI, Gemini). Let's look at how you could build a Web Search Agent across providers.
### [OpenAI Responses API](#openai-responses-api)
OpenAI's Responses API has a built-in web search tool that can be used to search the web and return search results. This tool is called `web\_search` and is accessed via the `openai` provider.
```
`
import { openai } from '@ai-sdk/openai';
import { generateText } from 'ai';
const { text, sources } = await generateText({
model: 'openai/gpt-5-mini',
prompt: 'What happened in San Francisco last week?',
tools: {
web\_search: openai.tools.webSearch({}),
},
});
console.log(text);
console.log(sources);
`
```
You can also use the `ToolLoopAgent` to build a web search agent with OpenAI. This following example shows how to extract query and sources from tool calls:
```
`
import { openai } from '@ai-sdk/openai';
import { ToolLoopAgent } from 'ai';
const agent = new ToolLoopAgent({
model: 'openai/gpt-5-mini',
tools: {
web\_search: openai.tools.webSearch({
searchContextSize: 'low',
}),
},
});
const { text, sources, toolResults } = await agent.generate({
prompt: 'What happened in San Francisco last week?',
});
// Access sources directly
console.log('Sources:', sources);
// Or extract query and sources from tool results
for (const toolResult of toolResults) {
if (toolResult.toolName === 'web\_search') {
const { action, sources } = toolResult.output;
console.log('Search query:', action.query);
console.log('Sources:', sources);
}
}
`
```
### [Perplexity](#perplexity)
Perplexity's Sonar models combines real-time web search with natural language processing. Each response is grounded in current web data and includes detailed citations.
```
`
import { generateText } from 'ai';
const { text, sources } = await generateText({
model: 'perplexity/sonar-pro',
prompt: 'What are the latest developments in quantum computing?',
});
console.log(text);
console.log(sources);
`
```
### [Gemini](#gemini)
With compatible Gemini models, you can enable search grounding to give the model access to the latest information using Google search.
```
`
import { google } from '@ai-sdk/google';
import { generateText } from 'ai';
const { text, sources, providerMetadata } = await generateText({
model: 'google/gemini-2.5-flash',
tools: {
google\_search: google.tools.googleSearch({}),
},
prompt:
'List the top 5 San Francisco news from the past week.' +
'You must include the date of each article.',
});
console.log(text);
console.log(sources);
// access the grounding metadata.
const metadata = providerMetadata?.google;
const groundingMetadata = metadata?.groundingMetadata;
const safetyRatings = metadata?.safetyRatings;
`
```
## [Using tools](#using-tools)
When using tools for web search, you have two options: use ready-made tools that integrate directly with the AI SDK, or build custom tools tailored to your specific needs.
Unlike the native web search examples where searching is built into the model, using web search tools requires multiple steps. The language model will make two generations - the first to call the relevant web search tool (extracting search queries from the context), and the second to process the results and generate a response. This multi-step process is handled automatically when you set `stopWhen: stepCountIs(n)` to a value greater than 1.
By using `stopWhen`, you can automatically send tool results back to the
language model alongside the original question, enabling the model to respond
with information relevant to the user's query based on the search results.
This creates a seamless experience where the agent can search the web and
incorporate those findings into its response.
### [Use ready-made tools](#use-ready-made-tools)
If you prefer a ready-to-use web search tool without building one from scratch, there are several options that integrate directly with the AI SDK.
#### [Exa](#exa)
Get your API key from the [Exa Dashboard](https://dashboard.exa.ai/api-keys).
First, install the Exa `webSearch` tool:
```
`
pnpm install @exalabs/ai-sdk
`
```
Then, you can import and pass it into `generateText`, `streamText`, or your agent:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText, stepCountIs } from 'ai';
import { webSearch } from '@exalabs/ai-sdk';
const { text } = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Tell me the latest developments in AI',
tools: {
webSearch: webSearch(),
},
stopWhen: stepCountIs(3),
});
console.log(text);
`
```
For more configuration options and customization, see the [Exa AI SDK documentation](https://docs.exa.ai/reference/vercel).
#### [Parallel Web](#parallel-web)
Get your API key from the [Parallel Platform](https://parallel.ai).
First, install the Parallel Web AI SDK tools:
```
`
pnpm install @parallel-web/ai-sdk-tools
`
```
Then, you can import and pass the tools into `generateText`, `streamText`, or your agent. Parallel Web provides two tools: `searchTool` for web search and `extractTool` for extracting web page content:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText, stepCountIs } from 'ai';
import { searchTool, extractTool } from '@parallel-web/ai-sdk-tools';
const { text } = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'When was Vercel Ship AI?',
tools: {
webSearch: searchTool,
webExtract: extractTool,
},
stopWhen: stepCountIs(3),
});
console.log(text);
`
```
#### [Perplexity Search](#perplexity-search)
Get your API key from the [Perplexity API Keys
page](https://www.perplexity.ai/account/api/keys).
First, install the Perplexity Search tool:
```
`
pnpm install @perplexity-ai/ai-sdk
`
```
Then, you can import and pass it into `generateText`, `streamText`, or your agent. Perplexity Search provides real-time web search with advanced filtering options including domain, language, date range, and recency filters:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText, stepCountIs } from 'ai';
import { perplexitySearch } from '@perplexity-ai/ai-sdk';
const { text } = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt:
'What are the latest AI developments? Use search to find current information.',
tools: {
search: perplexitySearch(),
},
stopWhen: stepCountIs(3),
});
console.log(text);
`
```
For more configuration options and customization, see the [Perplexity Search API documentation](https://docs.perplexity.ai/guides/search-quickstart).
#### [Tavily](#tavily)
Get your API key from the [Tavily Dashboard](https://app.tavily.com).
First, install the `tavilySearch` tool:
```
`
pnpm install @tavily/ai-sdk
`
```
Then, you can import and pass it into `generateText`, `streamText`, or your agent:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText, stepCountIs } from 'ai';
import { tavilySearch, tavilyExtract } from '@tavily/ai-sdk';
const { text } = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'When was the latest update to the AI SDK?',
tools: {
webSearch: tavilySearch(),
webExtract: tavilyExtract(),
},
stopWhen: stepCountIs(3),
});
console.log(text);
`
```
For more customization options over your agent's web-access functionality, visit the [Tavily AI SDK Documentation](https://docs.tavily.com/documentation/integrations/vercel).
### [Build and use custom tools](#build-and-use-custom-tools)
For more control over your web search functionality, you can build custom tools using web scraping and crawling APIs. This approach allows you to customize search parameters, handle specific data formats, and integrate with specialized search services.
#### [Exa](#exa-1)
Let's look at how you could implement a search tool using Exa:
```
`
pnpm install exa-js
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText, tool, stepCountIs } from 'ai';
import { z } from 'zod';
import Exa from 'exa-js';
export const exa = new Exa(process.env.EXA\_API\_KEY);
export const webSearch = tool({
description: 'Search the web for up-to-date information',
inputSchema: z.object({
query: z.string().min(1).max(100).describe('The search query'),
}),
execute: async ({ query }) =\> {
const { results } = await exa.searchAndContents(query, {
livecrawl: 'always',
numResults: 3,
});
return results.map(result =\> ({
title: result.title,
url: result.url,
content: result.text.slice(0, 1000), // take just the first 1000 characters
publishedDate: result.publishedDate,
}));
},
});
const { text } = await generateText({
model: "anthropic/claude-sonnet-4.5", // can be any model that supports tools
prompt: 'What happened in San Francisco last week?',
tools: {
webSearch,
},
stopWhen: stepCountIs(5),
});
`
```
#### [Firecrawl](#firecrawl)
[Firecrawl](https://firecrawl.dev) provides an API for web scraping and crawling. Let's look at how you can build a custom scraping tool using Firecrawl:
```
`
pnpm install @mendable/firecrawl-js
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText, tool, stepCountIs } from 'ai';
import { z } from 'zod';
import FirecrawlApp from '@mendable/firecrawl-js';
import 'dotenv/config';
const app = new FirecrawlApp({ apiKey: process.env.FIRECRAWL\_API\_KEY });
export const webSearch = tool({
description: 'Search the web for up-to-date information',
inputSchema: z.object({
urlToCrawl: z
.string()
.url()
.min(1)
.max(100)
.describe('The URL to crawl (including http:// or https://)'),
}),
execute: async ({ urlToCrawl }) =\> {
const crawlResponse = await app.crawlUrl(urlToCrawl, {
limit: 1,
scrapeOptions: {
formats: ['markdown', 'html'],
},
});
if (!crawlResponse.success) {
throw new Error(`Failed to crawl: ${crawlResponse.error}`);
}
return crawlResponse.data;
},
});
const main = async () =\> {
const { text } = await generateText({
model: "anthropic/claude-sonnet-4.5", // can be any model that supports tools
prompt: 'Get the latest blog post from vercel.com/blog',
tools: {
webSearch,
},
stopWhen: stepCountIs(5),
});
console.log(text);
};
main();
`
```
On this page
[Web Search Agent](#web-search-agent)
[Using native web-search](#using-native-web-search)
[OpenAI Responses API](#openai-responses-api)
[Perplexity](#perplexity)
[Gemini](#gemini)
[Using tools](#using-tools)
[Use ready-made tools](#use-ready-made-tools)
[Exa](#exa)
[Parallel Web](#parallel-web)
[Perplexity Search](#perplexity-search)
[Tavily](#tavily)
[Build and use custom tools](#build-and-use-custom-tools)
[Exa](#exa-1)
[Firecrawl](#firecrawl)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)