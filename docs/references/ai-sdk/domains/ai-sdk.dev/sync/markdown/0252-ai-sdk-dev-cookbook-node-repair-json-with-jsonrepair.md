Node: Repair Malformed JSON with jsonrepair
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
# [Repair Malformed JSON with jsonrepair](#repair-malformed-json-with-jsonrepair)
When generating structured outputs, language models sometimes produce malformed JSON output. This can happen due to:
* Truncated responses (hitting token limits)
* Syntax errors like single quotes instead of double quotes
* Missing closing brackets or braces
* Trailing commas
With AI SDK v6, a practical pattern is to generate text, repair it, then parse and validate it. Combined with the [`jsonrepair`](https://github.com/josdejong/jsonrepair) library, you can automatically fix many common JSON issues.
## [Installation](#installation)
First, install the `jsonrepair` library:
```
`
pnpm add jsonrepair
`
```
## [Using with generateText](#using-with-generatetext)
Here's how to use `jsonrepair` with `generateText`:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText, Output } from 'ai';
import { safeParseJSON } from '@ai-sdk/provider-utils';
import { jsonrepair } from 'jsonrepair';
import { z } from 'zod';
const recipeSchema = z.object({
recipe: z.object({
name: z.string(),
ingredients: z.array(
z.object({
name: z.string(),
amount: z.string(),
}),
),
steps: z.array(z.string()),
}),
});
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
output: Output.text(),
prompt: 'Generate a lasagna recipe.',
});
const repairedText = jsonrepair(result.text);
const parseResult = safeParseJSON({ text: repairedText });
if (!parseResult.success) {
throw parseResult.error;
}
const output = recipeSchema.parse(parseResult.value);
console.log(output.recipe);
`
```
## [How it Works](#how-it-works)
This flow has three steps:
1. Generate plain text from the model (`Output.text()`).
2. Repair malformed JSON with `jsonrepair`.
3. Parse safely and validate with your schema.
## [What jsonrepair Can Fix](#what-jsonrepair-can-fix)
The `jsonrepair` library can automatically fix many common issues:
* Missing closing brackets: `{"name": "test"` -\> `{"name": "test"}`
* Single quotes: `{'name': 'test'}` -\> `{"name": "test"}`
* Missing quotes around keys: `{name: "test"}` -\> `{"name": "test"}`
* Trailing commas: `{"items": [1, 2, 3,]}` -\> `{"items": [1, 2, 3]}`
* Comments in JSON
* Unescaped special characters
## [Considerations](#considerations)
1. **Repair is Best-Effort** - While `jsonrepair` handles many cases, it cannot fix all malformed JSON (e.g., semantically incorrect data that happens to be valid JSON)
2. **Schema Validation** - Even after repair, the object must still match your schema. If the model produces structurally wrong data, repair won't help
3. **Truncated Content** - For severely truncated responses, consider increasing `maxOutputTokens` or simplifying your schema
On this page
[Repair Malformed JSON with jsonrepair](#repair-malformed-json-with-jsonrepair)
[Installation](#installation)
[Using with generateText](#using-with-generatetext)
[How it Works](#how-it-works)
[What jsonrepair Can Fix](#what-jsonrepair-can-fix)
[Considerations](#considerations)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)