Next.js: Call Tools in Multiple Steps
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
# [Call Tools in Multiple Steps](#call-tools-in-multiple-steps)
Some language models are great at calling tools in multiple steps to achieve a more complex task. This is particularly useful when the tools are dependent on each other and need to be executed in sequence during the same generation step.
## [Client](#client)
Let's create a React component that imports the `useChat` hook from the `@ai-sdk/react` module. The `useChat` hook will call the `/api/chat` endpoint when the user sends a message. The endpoint will generate the assistant's response based on the conversation history and stream it to the client. If the assistant responds with a tool call, the hook will automatically display them as well.
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport } from 'ai';
import { useState } from 'react';
import type { ChatMessage } from './api/chat/route';
export default function Page() {
const [input, setInput] = useState('');
const { messages, sendMessage } = useChat\<ChatMessage\>({
transport: new DefaultChatTransport({
api: '/api/chat',
}),
});
return (
\<div\>
\<input
className="border"
value={input}
onChange={event =\> {
setInput(event.target.value);
}}
onKeyDown={async event =\> {
if (event.key === 'Enter') {
sendMessage({
text: input,
});
setInput('');
}
}}
/\>
{messages.map((message, index) =\> (
\<div key={index}\>
{message.parts.map((part, i) =\> {
switch (part.type) {
case 'text':
return \<div key={`${message.id}-text`}\>{part.text}\</div\>;
case 'tool-getLocation':
case 'tool-getWeather':
return (
\<div key={`${message.id}-weather-${i}`}\>
{JSON.stringify(part, null, 2)}
\</div\>
);
}
})}
\</div\>
))}
\</div\>
);
}
`
```
## [Server](#server)
You will create a new route at `/api/chat` that will use the `streamText` function from the `ai` module to generate the assistant's response based on the conversation history.
You will use the [`tools`](/docs/reference/ai-sdk-core/generate-text#tools) parameter to specify two tools called `getLocation` and `getWeather` that will first get the user's location and then use it to get the weather.
You will add the two functions mentioned earlier and use zod to specify the schema for its parameters.
To call tools in multiple steps, you can use the `stopWhen` option to specify the stopping conditions for when the model generates a tool call. In this example, you will set it to `stepCountIs(5)` to allow for multiple consecutive tool calls (steps).
app/api/chat/route.ts
```
`
import {
type InferUITools,
type ToolSet,
type UIDataTypes,
type UIMessage,
convertToModelMessages,
stepCountIs,
streamText,
tool,
} from 'ai';
import { z } from 'zod';
const tools = {
getLocation: tool({
description: 'Get the location of the user',
inputSchema: z.object({}),
execute: async () =\> {
const location = { lat: 37.7749, lon: -122.4194 };
return `Your location is at latitude ${location.lat} and longitude ${location.lon}`;
},
}),
getWeather: tool({
description: 'Get the weather for a location',
inputSchema: z.object({
city: z.string().describe('The city to get the weather for'),
unit: z
.enum(['C', 'F'])
.describe('The unit to display the temperature in'),
}),
execute: async ({ city, unit }) =\> {
const weather = {
value: 24,
description: 'Sunny',
};
return `It is currently ${weather.value}°${unit} and ${weather.description} in ${city}!`;
},
}),
} satisfies ToolSet;
export type ChatTools = InferUITools\<typeof tools\>;
export type ChatMessage = UIMessage\<never, UIDataTypes, ChatTools\>;
export async function POST(req: Request) {
const { messages }: { messages: ChatMessage[] } = await req.json();
const result = streamText({
model: 'openai/gpt-4o',
system: 'You are a helpful assistant.',
messages: await convertToModelMessages(messages),
stopWhen: stepCountIs(5),
tools,
});
return result.toUIMessageStreamResponse();
}
`
```
On this page
[Call Tools in Multiple Steps](#call-tools-in-multiple-steps)
[Client](#client)
[Server](#server)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)