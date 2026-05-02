Next.js: Chat with PDFs
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
# [Chat with PDFs](#chat-with-pdfs)
Some language models like Anthropic's Claude Sonnet 3.5 and Google's Gemini 2.0 can understand PDFs and respond to questions about their contents. In this example, we'll show you how to build a chat interface that accepts PDF uploads.
This example requires a provider that supports PDFs, such as Anthropic's
Claude 3.7, Google's Gemini 2.5, or OpenAI's GPT-4.1. Check the [provider
documentation](/providers/ai-sdk-providers) for up-to-date support
information.
## [Implementation](#implementation)
### [Server](#server)
Create a route handler that will use Anthropic's Claude model to process messages and PDFs:
app/api/chat/route.ts
```
`
import { convertToModelMessages, streamText, type UIMessage } from 'ai';
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: 'anthropic/claude-sonnet-4',
messages: await convertToModelMessages(messages),
});
return result.toUIMessageStreamResponse();
}
`
```
### [Client](#client)
Create a chat interface that allows uploading PDFs alongside messages:
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport } from 'ai';
import { useRef, useState } from 'react';
async function convertFilesToDataURLs(
files: FileList,
): Promise\<
{ type: 'file'; filename: string; mediaType: string; url: string }[]
\> {
return Promise.all(
Array.from(files).map(
file =\>
new Promise\<{
type: 'file';
filename: string;
mediaType: string;
url: string;
}\>((resolve, reject) =\> {
const reader = new FileReader();
reader.onload = () =\> {
resolve({
type: 'file',
filename: file.name,
mediaType: file.type,
url: reader.result as string, // Data URL
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
const { messages, sendMessage } = useChat({
transport: new DefaultChatTransport({
api: '/api/chat',
}),
});
const [files, setFiles] = useState\<FileList | undefined\>(undefined);
const fileInputRef = useRef\<HTMLInputElement\>(null);
return (
\<div className="flex flex-col w-full max-w-md py-24 mx-auto stretch"\>
{messages.map(message =\> (
\<div key={message.id} className="whitespace-pre-wrap"\>
{message.role === 'user' ? 'User: ' : 'AI: '}
{message.parts.map(part =\> {
if (part.type === 'text') {
return \<div key={`${message.id}-text`}\>{part.text}\</div\>;
}
})}
\<div\>\</div\>
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
setFiles(undefined);
setInput('');
if (fileInputRef.current) {
fileInputRef.current.value = '';
}
}}
\>
\<input
type="file"
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
onChange={event =\> {
setInput(event.target.value);
}}
/\>
\</form\>
\</div\>
);
}
`
```
The code uses the `useChat` hook which handles the file upload and message streaming. The `experimental\_attachments` option allows you to send files alongside messages.
Make sure to set up your environment variables with your Anthropic API key:
.env.local
```
`
ANTHROPIC\_API\_KEY=xxxxxxxxx
`
```
Now you can upload PDFs and ask questions about their contents. The LLM will analyze the PDF and provide relevant responses based on the document's content.
On this page
[Chat with PDFs](#chat-with-pdfs)
[Implementation](#implementation)
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