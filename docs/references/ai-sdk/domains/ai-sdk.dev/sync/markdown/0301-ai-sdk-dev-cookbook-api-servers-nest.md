API Servers: Nest.js
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
# [Nest.js](#nestjs)
You can use the AI SDK in a [Nest.js](https://nestjs.com/) server to generate and stream text and objects to the client.
## [Examples](#examples)
The examples show how to implement a Nest.js controller that uses the AI SDK to stream text and objects to the client.
**Full example**: [github.com/vercel/ai/examples/nest](https://github.com/vercel/ai/tree/main/examples/nest)
### [UI Message Stream](#ui-message-stream)
You can use the `pipeUIMessageStreamToResponse` method to pipe the stream data to the server response.
app.controller.ts
```
`
import { Controller, Post, Res } from '@nestjs/common';
import { streamText } from 'ai';
import { Response } from 'express';
@Controller()
export class AppController {
@Post('/')
async root(@Res() res: Response) {
const result = streamText({
model: 'openai/gpt-4o',
prompt: 'Invent a new holiday and describe its traditions.',
});
result.pipeUIMessageStreamToResponse(res);
}
}
`
```
### [Sending Custom Data](#sending-custom-data)
`createUIMessageStream` and `pipeUIMessageStreamToResponse` can be used to send custom data to the client.
app.controller.ts
```
`
import { Controller, Post, Res } from '@nestjs/common';
import {
createUIMessageStream,
streamText,
pipeUIMessageStreamToResponse,
} from 'ai';
import { Response } from 'express';
@Controller()
export class AppController {
@Post('/stream-data')
async streamData(@Res() response: Response) {
const stream = createUIMessageStream({
execute: ({ writer }) =\> {
// write some data
writer.write({ type: 'start' });
writer.write({
type: 'data-custom',
data: {
custom: 'Hello, world!',
},
});
const result = streamText({
model: 'openai/gpt-4o',
prompt: 'Invent a new holiday and describe its traditions.',
});
writer.merge(
result.toUIMessageStream({
sendStart: false,
onError: error =\> {
// Error messages are masked by default for security reasons.
// If you want to expose the error message to the client, you can do so here:
return error instanceof Error ? error.message : String(error);
},
}),
);
},
});
pipeUIMessageStreamToResponse({ stream, response });
}
}
`
```
### [Text Stream](#text-stream)
You can use the `pipeTextStreamToResponse` method to get a text stream from the result and then pipe it to the response.
app.controller.ts
```
`
import { Controller, Post, Res } from '@nestjs/common';
import { streamText } from 'ai';
import { Response } from 'express';
@Controller()
export class AppController {
@Post()
async example(@Res() res: Response) {
const result = streamText({
model: 'openai/gpt-4o',
prompt: 'Invent a new holiday and describe its traditions.',
});
result.pipeTextStreamToResponse(res);
}
}
`
```
## [Troubleshooting](#troubleshooting)
* Streaming not working when [proxied](/docs/troubleshooting/streaming-not-working-when-proxied)
On this page
[Nest.js](#nestjs)
[Examples](#examples)
[UI Message Stream](#ui-message-stream)
[Sending Custom Data](#sending-custom-data)
[Text Stream](#text-stream)
[Troubleshooting](#troubleshooting)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)