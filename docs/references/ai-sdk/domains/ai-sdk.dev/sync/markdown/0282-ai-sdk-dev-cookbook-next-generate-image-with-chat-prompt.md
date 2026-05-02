Next.js: Generate Image with Chat Prompt
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
# [Generate Image with Chat Prompt](#generate-image-with-chat-prompt)
When building a chatbot, you may want to allow the user to generate an image. This can be done by creating a tool that generates an image using the [`generateImage`](/docs/reference/ai-sdk-core/generate-image) function from the AI SDK.
## [Server](#server)
Let's create an endpoint at `/api/chat` that generates the assistant's response based on the conversation history. You will also define a tool called `generateImage` that will generate an image based on the assistant's response.
tools/generate-image.ts
```
`
import { generateImage, tool } from 'ai';
import z from 'zod';
export const generateImageTool = tool({
description: 'Generate an image',
inputSchema: z.object({
prompt: z.string().describe('The prompt to generate the image from'),
}),
execute: async ({ prompt }) =\> {
const { image } = await generateImage({
model: openai.imageModel('dall-e-3'),
prompt,
});
// in production, save this image to blob storage and return a URL
return { image: image.base64, prompt };
},
});
`
```
app/api/chat/route.ts
```
`
import {
convertToModelMessages,
type InferUITools,
stepCountIs,
streamText,
type UIMessage,
} from 'ai';
import { generateImageTool } from '@/tools/generate-image';
const tools = {
generateImage: generateImageTool,
};
export type ChatTools = InferUITools\<typeof tools\>;
export async function POST(request: Request) {
const { messages }: { messages: UIMessage[] } = await request.json();
const result = streamText({
model: 'openai/gpt-4o',
messages: await convertToModelMessages(messages),
stopWhen: stepCountIs(5),
tools,
});
return result.toUIMessageStreamResponse();
}
`
```
In production, you should save the generated image to a blob storage and
return a URL instead of the base64 image data. If you don't, the base64 image
data will be sent to the model which may cause the generation to fail.
## [Client](#client)
Let's create a simple chat interface with `useChat`. You will call the `/api/chat` endpoint to generate the assistant's response. If the assistant's response contains a `generateImage` tool invocation, you will display the tool result (the image in base64 format and the prompt) using the Next `Image` component.
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport, type UIMessage } from 'ai';
import Image from 'next/image';
import { type FormEvent, useState } from 'react';
import type { ChatTools } from './api/chat/route';
type ChatMessage = UIMessage\<never, never, ChatTools\>;
export default function Chat() {
const [input, setInput] = useState('');
const { messages, sendMessage } = useChat\<ChatMessage\>({
transport: new DefaultChatTransport({
api: '/api/chat',
}),
});
const handleInputChange = (event: React.ChangeEvent\<HTMLInputElement\>) =\> {
setInput(event.target.value);
};
const handleSubmit = async (event: FormEvent\<HTMLFormElement\>) =\> {
event.preventDefault();
sendMessage({
parts: [{ type: 'text', text: input }],
});
setInput('');
};
return (
\<div className="flex flex-col w-full max-w-md py-24 mx-auto stretch"\>
\<div className="space-y-4"\>
{messages.map(message =\> (
\<div key={message.id} className="whitespace-pre-wrap"\>
\<div key={message.id}\>
\<div className="font-bold"\>{message.role}\</div\>
{message.parts.map((part, partIndex) =\> {
const { type } = part;
if (type === 'text') {
return (
\<div key={`${message.id}-part-${partIndex}`}\>
{part.text}
\</div\>
);
}
if (type === 'tool-generateImage') {
const { state, toolCallId } = part;
if (state === 'input-available') {
return (
\<div key={`${message.id}-part-${partIndex}`}\>
Generating image...
\</div\>
);
}
if (state === 'output-available') {
const { input, output } = part;
return (
\<Image
key={toolCallId}
src={`data:image/png;base64,${output.image}`}
alt={input.prompt}
height={400}
width={400}
/\>
);
}
}
})}
\</div\>
\</div\>
))}
\</div\>
\<form onSubmit={handleSubmit}\>
\<input
className="fixed bottom-0 w-full max-w-md p-2 mb-8 border border-gray-300 rounded shadow-xl"
value={input}
placeholder="Say something..."
onChange={handleInputChange}
/\>
\</form\>
\</div\>
);
}
`
```
On this page
[Generate Image with Chat Prompt](#generate-image-with-chat-prompt)
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