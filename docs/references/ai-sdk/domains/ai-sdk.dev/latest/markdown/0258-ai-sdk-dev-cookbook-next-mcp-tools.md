Next.js: Model Context Protocol (MCP) Tools
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
# [MCP Tools](#mcp-tools)
The AI SDK supports Model Context Protocol (MCP) tools by offering a lightweight client that exposes a `tools` method for retrieving tools from a MCP server. After use, the client should always be closed to release resources.
## [Server](#server)
Let's create a route handler for `/api/completion` that will generate text based on the input prompt and MCP tools that can be called at any time during a generation. The route will call the `streamText` function from the `ai` module, which will then generate text based on the input prompt and stream it to the client.
If you prefer to use the official transports (optional), install the official TypeScript SDK for Model Context Protocol:
```
pnpm install @modelcontextprotocol/sdk
```
app/api/completion/route.ts
```
`
import { createMCPClient } from '@ai-sdk/mcp';
import { streamText } from 'ai';
import { Experimental\_StdioMCPTransport } from '@ai-sdk/mcp/mcp-stdio';
import { openai } from '@ai-sdk/openai';
// Optional: Official transports if you prefer them
// import { StdioClientTransport } from '@modelcontextprotocol/sdk/client/stdio';
// import { SSEClientTransport } from '@modelcontextprotocol/sdk/client/sse';
// import { StreamableHTTPClientTransport } from '@modelcontextprotocol/sdk/client/streamableHttp';
export async function POST(req: Request) {
const { prompt }: { prompt: string } = await req.json();
try {
// Initialize an MCP client to connect to a `stdio` MCP server (local only):
const transport = new Experimental\_StdioMCPTransport({
command: 'node',
args: ['src/stdio/dist/server.js'],
});
const stdioClient = await createMCPClient({
transport,
});
// Connect to an HTTP MCP server directly via the client transport config
const httpClient = await createMCPClient({
transport: {
type: 'http',
url: 'http://localhost:3000/mcp',
// optional: configure headers
// headers: { Authorization: 'Bearer my-api-key' },
// optional: provide an OAuth client provider for automatic authorization
// authProvider: myOAuthClientProvider,
},
});
// Connect to a Server-Sent Events (SSE) MCP server directly via the client transport config
const sseClient = await createMCPClient({
transport: {
type: 'sse',
url: 'http://localhost:3000/sse',
// optional: configure headers
// headers: { Authorization: 'Bearer my-api-key' },
// optional: provide an OAuth client provider for automatic authorization
// authProvider: myOAuthClientProvider,
},
});
// Alternatively, you can create transports with the official SDKs instead of direct config:
// const httpTransport = new StreamableHTTPClientTransport(new URL('http://localhost:3000/mcp'));
// const httpClient = await createMCPClient({ transport: httpTransport });
// const sseTransport = new SSEClientTransport(new URL('http://localhost:3000/sse'));
// const sseClient = await createMCPClient({ transport: sseTransport });
const toolSetOne = await stdioClient.tools();
const toolSetTwo = await httpClient.tools();
const toolSetThree = await sseClient.tools();
const tools = {
...toolSetOne,
...toolSetTwo,
...toolSetThree, // note: this approach causes subsequent tool sets to override tools with the same name
};
const response = await streamText({
model: 'openai/gpt-4o',
tools,
prompt,
// When streaming, the client should be closed after the response is finished:
onFinish: async () =\> {
await stdioClient.close();
await httpClient.close();
await sseClient.close();
},
// Closing clients onError is optional
// - Closing: Immediately frees resources, prevents hanging connections
// - Not closing: Keeps connection open for retries
onError: async error =\> {
await stdioClient.close();
await httpClient.close();
await sseClient.close();
},
});
return response.toDataStreamResponse();
} catch (error) {
return new Response('Internal Server Error', { status: 500 });
}
}
`
```
## [Client](#client)
Let's create a simple React component that imports the `useCompletion` hook from the `@ai-sdk/react` module. The `useCompletion` hook will call the `/api/completion` endpoint when a button is clicked. The endpoint will generate text based on the input prompt and stream it to the client.
app/page.tsx
```
`
'use client';
import { useCompletion } from '@ai-sdk/react';
export default function Page() {
const { completion, complete } = useCompletion({
api: '/api/completion',
});
return (
\<div\>
\<div
onClick={async () =\> {
await complete(
'Please schedule a call with Sonny and Robby for tomorrow at 10am ET for me!',
);
}}
\>
Schedule a call
\</div\>
{completion}
\</div\>
);
}
`
```
On this page
[MCP Tools](#mcp-tools)
[Server](#server)
[Client](#client)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)