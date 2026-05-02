React Server Components: Call Tools in Parallel
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
[Generate Text](/cookbook/rsc/generate-text)
[Generate Text with Chat Prompt](/cookbook/rsc/generate-text-with-chat-prompt)
[Stream Text](/cookbook/rsc/stream-text)
[Stream Text with Chat Prompt](/cookbook/rsc/stream-text-with-chat-prompt)
[Generate Object](/cookbook/rsc/generate-object)
[Stream Object](/cookbook/rsc/stream-object)
[Call Tools](/cookbook/rsc/call-tools)
[Call Tools in Parallel](/cookbook/rsc/call-tools-in-parallel)
[Save Messages To Database](/cookbook/rsc/save-messages-to-database)
[Restore Messages From Database](/cookbook/rsc/restore-messages-from-database)
[Render Visual Interface in Chat](/cookbook/rsc/render-visual-interface-in-chat)
[Stream Updates to Visual Interfaces](/cookbook/rsc/stream-updates-to-visual-interfaces)
[Record Token Usage after Streaming User Interfaces](/cookbook/rsc/stream-ui-record-token-usage)
Copy markdown
# [Call Tools in Parallel](#call-tools-in-parallel)
Some language models support calling tools in parallel. This is particularly useful when multiple tools are independent of each other and can be executed in parallel during the same generation step.
http://localhost:3000
User: How is it going?
Assistant: All good, how may I help you?
What is the weather in Paris and New York?
Send Message
## [Client](#client)
Let's modify our previous example to call `getWeather` tool for multiple cities in parallel.
app/page.tsx
```
`
'use client';
import { useState } from 'react';
import { Message, continueConversation } from './actions';
// Allow streaming responses up to 30 seconds
export const maxDuration = 30;
export default function Home() {
const [conversation, setConversation] = useState\<Message[]\>([]);
const [input, setInput] = useState\<string\>('');
return (
\<div\>
\<div\>
{conversation.map((message, index) =\> (
\<div key={index}\>
{message.role}: {message.content}
\</div\>
))}
\</div\>
\<div\>
\<input
type="text"
value={input}
onChange={event =\> {
setInput(event.target.value);
}}
/\>
\<button
onClick={async () =\> {
const { messages } = await continueConversation([
...conversation,
{ role: 'user', content: input },
]);
setConversation(messages);
}}
\>
Send Message
\</button\>
\</div\>
\</div\>
);
}
`
```
## [Server](#server)
Let's update the tools object to now use the `getWeather` function instead.
app/actions.ts
```
`
'use server';
import { generateText } from 'ai';
import { z } from 'zod';
export interface Message {
role: 'user' | 'assistant';
content: string;
}
function getWeather({ city, unit }) {
// This function would normally make an
// API request to get the weather.
return { value: 25, description: 'Sunny' };
}
export async function continueConversation(history: Message[]) {
'use server';
const { text, toolResults } = await generateText({
model: 'openai/gpt-5.4',
system: 'You are a friendly weather assistant!',
messages: history,
tools: {
getWeather: {
description: 'Get the weather for a location',
inputSchema: z.object({
city: z.string().describe('The city to get the weather for'),
unit: z
.enum(['C', 'F'])
.describe('The unit to display the temperature in'),
}),
execute: async ({ city, unit }) =\> {
const weather = getWeather({ city, unit });
return `It is currently ${weather.value}°${unit} and ${weather.description} in ${city}!`;
},
},
},
});
return {
messages: [
...history,
{
role: 'assistant' as const,
content:
text || toolResults.map(toolResult =\> toolResult.result).join('\\n'),
},
],
};
}
`
```
On this page
[Call Tools in Parallel](#call-tools-in-parallel)
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