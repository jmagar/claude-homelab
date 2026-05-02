Next.js: Render Visual Interface in Chat
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
# [Render Visual Interface in Chat](#render-visual-interface-in-chat)
An interesting consequence of language models that can call [tools](/docs/ai-sdk-core/tools-and-tool-calling) is that this ability can be used to render visual interfaces by streaming React components to the client.
http://localhost:3000
User: How is it going?
Assistant: All good, how may I help you?
What is the weather in San Francisco?
Send Message
## [Client](#client)
Let's build an assistant that gets the weather for any city by calling the `getWeatherInformation` tool. Instead of returning text during the tool call, you will render a React component that displays the weather information on the client.
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import {
DefaultChatTransport,
lastAssistantMessageIsCompleteWithToolCalls,
} from 'ai';
import { useState } from 'react';
import { ChatMessage } from './api/chat/route';
export default function Chat() {
const [input, setInput] = useState('');
const { messages, sendMessage, addToolOutput } = useChat\<ChatMessage\>({
transport: new DefaultChatTransport({
api: '/api/chat',
}),
sendAutomaticallyWhen: lastAssistantMessageIsCompleteWithToolCalls,
// run client-side tools that are automatically executed:
async onToolCall({ toolCall }) {
if (toolCall.toolName === 'getLocation') {
const cities = ['New York', 'Los Angeles', 'Chicago', 'San Francisco'];
// No await - avoids potential deadlocks
addToolOutput({
tool: 'getLocation',
toolCallId: toolCall.toolCallId,
output: cities[Math.floor(Math.random() \* cities.length)],
});
}
},
});
return (
\<div className="flex flex-col w-full max-w-md py-24 mx-auto stretch gap-4"\>
{messages?.map(m =\> (
\<div key={m.id} className="whitespace-pre-wrap flex flex-col gap-1"\>
\<strong\>{`${m.role}: `}\</strong\>
{m.parts?.map((part, i) =\> {
switch (part.type) {
case 'text':
return \<div key={m.id + i}\>{part.text}\</div\>;
// render confirmation tool (client-side tool with user interaction)
case 'tool-askForConfirmation':
return (
\<div
key={part.toolCallId}
className="text-gray-500 flex flex-col gap-2"
\>
\<div className="flex gap-2"\>
{part.state === 'output-available' ? (
\<b\>{part.output}\</b\>
) : (
\<\>
\<button
className="px-4 py-2 font-bold text-white bg-blue-500 rounded hover:bg-blue-700"
onClick={() =\>
addToolOutput({
tool: 'askForConfirmation',
toolCallId: part.toolCallId,
output: 'Yes, confirmed.',
})
}
\>
Yes
\</button\>
\<button
className="px-4 py-2 font-bold text-white bg-red-500 rounded hover:bg-red-700"
onClick={() =\>
addToolOutput({
tool: 'askForConfirmation',
toolCallId: part.toolCallId,
output: 'No, denied',
})
}
\>
No
\</button\>
\</\>
)}
\</div\>
\</div\>
);
// other tools:
case 'tool-getWeatherInformation':
if (part.state === 'output-available') {
return (
\<div
key={part.toolCallId}
className="flex flex-col gap-2 p-4 bg-blue-400 rounded-lg"
\>
\<div className="flex flex-row justify-between items-center"\>
\<div className="text-4xl text-blue-50 font-medium"\>
{part.output.value}°
{part.output.unit === 'celsius' ? 'C' : 'F'}
\</div\>
\<div className="h-9 w-9 bg-amber-400 rounded-full flex-shrink-0" /\>
\</div\>
\<div className="flex flex-row gap-2 text-blue-50 justify-between"\>
{part.output.weeklyForecast.map(forecast =\> (
\<div
key={forecast.day}
className="flex flex-col items-center"
\>
\<div className="text-xs"\>{forecast.day}\</div\>
\<div\>{forecast.value}°\</div\>
\</div\>
))}
\</div\>
\</div\>
);
}
break;
case 'tool-getLocation':
if (part.state === 'output-available') {
return (
\<div
key={part.toolCallId}
className="text-gray-500 bg-gray-100 rounded-lg p-4"
\>
User is in {part.output}.
\</div\>
);
} else {
return (
\<div key={part.toolCallId} className="text-gray-500"\>
Calling getLocation...
\</div\>
);
}
default:
break;
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
className="fixed bottom-0 w-full max-w-md p-2 mb-8 border border-gray-300 rounded shadow-xl"
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
## [Server](#server)
api/chat.ts
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
getWeatherInformation: tool({
description: 'show the weather in a given city to the user',
inputSchema: z.object({ city: z.string() }),
execute: async ({ city }: { city: string }) =\> {
return {
city,
value: 24,
unit: 'celsius',
weeklyForecast: [
{ day: 'Monday', value: 24 },
{ day: 'Tuesday', value: 25 },
{ day: 'Wednesday', value: 26 },
{ day: 'Thursday', value: 27 },
{ day: 'Friday', value: 28 },
{ day: 'Saturday', value: 29 },
{ day: 'Sunday', value: 30 },
],
};
},
}),
// client-side tool that starts user interaction:
askForConfirmation: tool({
description: 'Ask the user for confirmation.',
inputSchema: z.object({
message: z.string().describe('The message to ask for confirmation.'),
}),
}),
// client-side tool that is automatically executed on the client:
getLocation: tool({
description:
'Get the user location. Always ask for confirmation before using this tool.',
inputSchema: z.object({}),
}),
} satisfies ToolSet;
export type ChatTools = InferUITools\<typeof tools\>;
export type ChatMessage = UIMessage\<never, UIDataTypes, ChatTools\>;
export async function POST(request: Request) {
const { messages }: { messages: ChatMessage[] } = await request.json();
const result = streamText({
model: 'openai/gpt-4.1',
messages: await convertToModelMessages(messages),
tools,
stopWhen: stepCountIs(5),
});
return result.toUIMessageStreamResponse();
}
`
```
On this page
[Render Visual Interface in Chat](#render-visual-interface-in-chat)
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