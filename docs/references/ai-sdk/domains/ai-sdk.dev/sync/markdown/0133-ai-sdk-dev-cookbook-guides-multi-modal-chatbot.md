Guides: Multi-Modal Agent
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
# [Multi-Modal Agent](#multi-modal-agent)
In this guide, you will build a multi-modal agent capable of understanding both images and PDFs.
Multi-modal refers to the ability of the agent to understand and generate responses in multiple formats. In this guide, we'll focus on images and PDFs - two common document types that modern language models can process natively.
For a complete list of providers and their multi-modal capabilities, visit the
[providers documentation](/providers/ai-sdk-providers).
We'll build this agent using OpenAI's GPT-4o, but the same code works seamlessly with other providers - you can switch between them by changing just one line of code.
## [Prerequisites](#prerequisites)
To follow this quickstart, you'll need:
* Node.js 18+ and pnpm installed on your local development machine.
* A Vercel AI Gateway API key.
If you haven't obtained your Vercel AI Gateway API key, you can do so by [signing up](https://vercel.com/d?to=/[team]/~/ai&amp;title=Go+to+AI+Gateway) on the Vercel website.
## [Create Your Application](#create-your-application)
Start by creating a new Next.js application. This command will create a new directory named `multi-modal-agent` and set up a basic Next.js application inside it.
Be sure to select yes when prompted to use the App Router. If you are
looking for the Next.js Pages Router quickstart guide, you can find it
[here](/docs/getting-started/nextjs-pages-router).
```
pnpm create next-app@latest multi-modal-agent
```
Navigate to the newly created directory:
```
cd multi-modal-agent
```
### [Install dependencies](#install-dependencies)
Install `ai` and `@ai-sdk/react`, the AI SDK package and the AI SDK's React package respectively.
The AI SDK is designed to be a unified interface to interact with any large
language model. This means that you can change model and providers with just
one line of code! Learn more about [available providers](/providers) and
[building custom providers](/providers/community-providers/custom-providers)
in the [providers](/providers) section.
pnpmnpmyarnbun
```
pnpm add ai @ai-sdk/react
```
### [Configure your Vercel AI Gateway API key](#configure-your-vercel-ai-gateway-api-key)
Create a `.env.local` file in your project root and add your Vercel AI Gateway API key. This key authenticates your application with Vercel AI Gateway.
```
touch .env.local
```
Edit the `.env.local` file:
.env.local
```
`
AI\_GATEWAY\_API\_KEY=your\_api\_key\_here
`
```
Replace `your\_api\_key\_here` with your actual Vercel AI Gateway API key.
The AI SDK's Vercel AI Gateway Provider is the default global provider, so you
can access models using a simple string in the model configuration. If you
prefer to use a specific provider like OpenAI directly, see the [provider
management](/docs/ai-sdk-core/provider-management) documentation.
## [Implementation Plan](#implementation-plan)
To build a multi-modal agent, you will need to:
* Create a Route Handler to handle incoming chat messages and generate responses.
* Wire up the UI to display chat messages, provide a user input, and handle submitting new messages.
* Add the ability to upload images and PDFs and attach them alongside the chat messages.
## [Create a Route Handler](#create-a-route-handler)
Create a route handler, `app/api/chat/route.ts` and add the following code:
app/api/chat/route.ts
```
`
import { streamText, convertToModelMessages, type UIMessage } from 'ai';
// Allow streaming responses up to 30 seconds
export const maxDuration = 30;
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: 'openai/gpt-4o',
messages: await convertToModelMessages(messages),
});
return result.toUIMessageStreamResponse();
}
`
```
Let's take a look at what is happening in this code:
1. Define an asynchronous `POST` request handler and extract `messages` from the body of the request. The `messages` variable contains a history of the conversation between you and the agent and provides the agent with the necessary context to make the next generation.
2. Convert the UI messages to model messages using `convertToModelMessages`, which transforms the UI-focused message format to the format expected by the language model.
3. Call [`streamText`](/docs/reference/ai-sdk-core/stream-text), which is imported from the `ai` package. This function accepts a configuration object that contains a `model` provider and `messages` (converted in step 2). You can pass additional [settings](/docs/ai-sdk-core/settings) to further customize the model's behavior.
4. The `streamText` function returns a [`StreamTextResult`](/docs/reference/ai-sdk-core/stream-text#result-object). This result object contains the [ `toUIMessageStreamResponse` ](/docs/reference/ai-sdk-core/stream-text#to-ui-message-stream-response) function which converts the result to a streamed response object.
5. Finally, return the result to the client to stream the response.
This Route Handler creates a POST request endpoint at `/api/chat`.
## [Wire up the UI](#wire-up-the-ui)
Now that you have a Route Handler that can query a large language model (LLM), it's time to setup your frontend. [ AI SDK UI ](/docs/ai-sdk-ui) abstracts the complexity of a chat interface into one hook, [`useChat`](/docs/reference/ai-sdk-ui/use-chat).
Update your root page (`app/page.tsx`) with the following code to show a list of chat messages and provide a user message input:
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport } from 'ai';
import { useState } from 'react';
export default function Chat() {
const [input, setInput] = useState('');
const { messages, sendMessage } = useChat({
transport: new DefaultChatTransport({
api: '/api/chat',
}),
});
return (
\<div className="flex flex-col w-full max-w-md py-24 mx-auto stretch"\>
{messages.map(m =\> (
\<div key={m.id} className="whitespace-pre-wrap"\>
{m.role === 'user' ? 'User: ' : 'AI: '}
{m.parts.map((part, index) =\> {
if (part.type === 'text') {
return \<span key={`${m.id}-text-${index}`}\>{part.text}\</span\>;
}
return null;
})}
\</div\>
))}
\<form
onSubmit={async event =\> {
event.preventDefault();
sendMessage({
role: 'user',
parts: [{ type: 'text', text: input }],
});
setInput('');
}}
className="fixed bottom-0 w-full max-w-md mb-8 border border-gray-300 rounded shadow-xl"
\>
\<input
className="w-full p-2"
value={input}
placeholder="Say something..."
onChange={e =\> setInput(e.target.value)}
/\>
\</form\>
\</div\>
);
}
`
```
Make sure you add the `"use client"` directive to the top of your file. This
allows you to add interactivity with JavaScript.
This page utilizes the `useChat` hook, configured with `DefaultChatTransport` to specify the API endpoint. The `useChat` hook provides multiple utility functions and state variables:
* `messages` - the current chat messages (an array of objects with `id`, `role`, and `parts` properties).
* `sendMessage` - function to send a new message to the AI.
* Each message contains a `parts` array that can include text, images, PDFs, and other content types.
* Files are converted to data URLs before being sent to maintain compatibility across different environments.
## [Add File Upload](#add-file-upload)
To make your agent multi-modal, let's add the ability to upload and send both images and PDFs to the model. In v5, files are sent as part of the message's `parts` array. Files are converted to data URLs using the FileReader API before being sent to the server.
Update your root page (`app/page.tsx`) with the following code:
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport } from 'ai';
import { useRef, useState } from 'react';
import Image from 'next/image';
async function convertFilesToDataURLs(files: FileList) {
return Promise.all(
Array.from(files).map(
file =\>
new Promise\<{
type: 'file';
mediaType: string;
url: string;
}\>((resolve, reject) =\> {
const reader = new FileReader();
reader.onload = () =\> {
resolve({
type: 'file',
mediaType: file.type,
url: reader.result as string,
});
};
reader.onerror = reject;
reader.readAsDataURL(file);
}),
),
);
}
export default function Chat() {
const [input, setInput] = useState('');
const [files, setFiles] = useState\<FileList | undefined\>(undefined);
const fileInputRef = useRef\<HTMLInputElement\>(null);
const { messages, sendMessage } = useChat({
transport: new DefaultChatTransport({
api: '/api/chat',
}),
});
return (
\<div className="flex flex-col w-full max-w-md py-24 mx-auto stretch"\>
{messages.map(m =\> (
\<div key={m.id} className="whitespace-pre-wrap"\>
{m.role === 'user' ? 'User: ' : 'AI: '}
{m.parts.map((part, index) =\> {
if (part.type === 'text') {
return \<span key={`${m.id}-text-${index}`}\>{part.text}\</span\>;
}
if (part.type === 'file' && part.mediaType?.startsWith('image/')) {
return (
\<Image
key={`${m.id}-image-${index}`}
src={part.url}
width={500}
height={500}
alt={`attachment-${index}`}
/\>
);
}
if (part.type === 'file' && part.mediaType === 'application/pdf') {
return (
\<iframe
key={`${m.id}-pdf-${index}`}
src={part.url}
width={500}
height={600}
title={`pdf-${index}`}
/\>
);
}
return null;
})}
\</div\>
))}
\<form
className="fixed bottom-0 w-full max-w-md p-2 mb-8 border border-gray-300 rounded shadow-xl space-y-2"
onSubmit={async event =\> {
event.preventDefault();
const fileParts =
files && files.length \> 0
? await convertFilesToDataURLs(files)
: [];
sendMessage({
role: 'user',
parts: [{ type: 'text', text: input }, ...fileParts],
});
setInput('');
setFiles(undefined);
if (fileInputRef.current) {
fileInputRef.current.value = '';
}
}}
\>
\<input
type="file"
accept="image/\*,application/pdf"
className=""
onChange={event =\> {
if (event.target.files) {
setFiles(event.target.files);
}
}}
multiple
ref={fileInputRef}
/\>
\<input
className="w-full p-2"
value={input}
placeholder="Say something..."
onChange={e =\> setInput(e.target.value)}
/\>
\</form\>
\</div\>
);
}
`
```
In this code, you:
1. Add a helper function `convertFilesToDataURLs` to convert file uploads to data URLs.
2. Create state to hold the input text, files, and a ref to the file input field.
3. Configure `useChat` with `DefaultChatTransport` to specify the API endpoint.
4. Display messages using the `parts` array structure, rendering text, images, and PDFs appropriately.
5. Update the `onSubmit` function to send messages with the `sendMessage` function, including both text and file parts.
6. Add a file input field to the form, including an `onChange` handler to handle updating the files state.
## [Running Your Application](#running-your-application)
With that, you have built everything you need for your multi-modal agent! To start your application, use the command:
```
pnpm run dev
```
Head to your browser and open [http://localhost:3000](http://localhost:3000). You should see an input field and a button to upload files.
Try uploading an image or PDF and asking the model questions about it. Watch as the model's response is streamed back to you!
## [Using Other Providers](#using-other-providers)
With the AI SDK's unified provider interface you can easily switch to other providers that support multi-modal capabilities:
app/api/chat/route.ts
```
`
// Using Anthropic
const result = streamText({
model: 'anthropic/claude-sonnet-4-20250514',
messages: await convertToModelMessages(messages),
});
// Using Google
const result = streamText({
model: 'google/gemini-2.5-flash',
messages: await convertToModelMessages(messages),
});
`
```
Install the provider package (`@ai-sdk/anthropic` or `@ai-sdk/google`) and update your API keys in `.env.local`. The rest of your code remains the same.
Different providers may have varying file size limits and performance
characteristics. Check the [provider
documentation](/providers/ai-sdk-providers) for specific details.
## [Where to Next?](#where-to-next)
You've built a multi-modal AI agent using the AI SDK! Experiment and extend the functionality of this application further by exploring [tool calling](/docs/ai-sdk-core/tools-and-tool-calling).
On this page
[Multi-Modal Agent](#multi-modal-agent)
[Prerequisites](#prerequisites)
[Create Your Application](#create-your-application)
[Install dependencies](#install-dependencies)
[Configure your Vercel AI Gateway API key](#configure-your-vercel-ai-gateway-api-key)
[Implementation Plan](#implementation-plan)
[Create a Route Handler](#create-a-route-handler)
[Wire up the UI](#wire-up-the-ui)
[Add File Upload](#add-file-upload)
[Running Your Application](#running-your-application)
[Using Other Providers](#using-other-providers)
[Where to Next?](#where-to-next)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)