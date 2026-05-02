Next.js: Share useChat State Across Components
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
# [Share useChat State Across Components](#share-usechat-state-across-components)
When building chat applications, you may want to access the same chat instance across multiple components. This allows you to display messages in one component, handle input in another, and control the chat state from anywhere in your application.
## [Create a Chat Context](#create-a-chat-context)
First, create a context that will hold your chat instance and provide methods to interact with it.
app/chat-context.tsx
```
`
'use client';
import React, { createContext, useContext, ReactNode, useState } from 'react';
import { Chat } from '@ai-sdk/react';
import { DefaultChatTransport, UIMessage } from 'ai';
interface ChatContextValue {
// replace with your custom message type
chat: Chat\<UIMessage\>;
clearChat: () =\> void;
}
const ChatContext = createContext\<ChatContextValue | undefined\>(undefined);
function createChat() {
return new Chat\<UIMessage\>({
transport: new DefaultChatTransport({
api: '/api/chat',
}),
});
}
export function ChatProvider({ children }: { children: ReactNode }) {
const [chat, setChat] = useState(() =\> createChat());
const clearChat = () =\> {
setChat(createChat());
};
return (
\<ChatContext.Provider
value={{
chat,
clearChat,
}}
\>
{children}
\</ChatContext.Provider\>
);
}
export function useSharedChatContext() {
const context = useContext(ChatContext);
if (!context) {
throw new Error('useSharedChatContext must be used within a ChatProvider');
}
return context;
}
`
```
## [Wrap Your App with the Provider](#wrap-your-app-with-the-provider)
Add the ChatProvider to your layout to make the chat context available to all child components.
app/layout.tsx
```
`
import { ChatProvider } from './chat-context';
export default function Layout({ children }: { children: React.ReactNode }) {
return \<ChatProvider\>{children}\</ChatProvider\>;
}
`
```
## [Display Messages and Clear Chat](#display-messages-and-clear-chat)
Create a component that displays messages and provides a button to clear the chat.
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { useSharedChatContext } from './chat-context';
import ChatInput from './chat-input';
export default function Chat() {
const { chat, clearChat } = useSharedChatContext();
const { messages } = useChat({
chat,
});
return (
\<div\>
\<button onClick={clearChat} disabled={messages.length === 0}\>
Clear Chat
\</button\>
{messages?.map(message =\> (
\<div key={message.id}\>
\<strong\>{`${message.role}: `}\</strong\>
{message.parts.map((part, index) =\> {
if (part.type === 'text') {
return \<div key={index}\>{part.text}\</div\>;
}
})}
\</div\>
))}
\<ChatInput /\>
\</div\>
);
}
`
```
## [Handle Input in a Separate Component](#handle-input-in-a-separate-component)
Create an input component that uses the shared chat context to send messages.
app/chat-input.tsx
```
`
import { useChat } from '@ai-sdk/react';
import { useState } from 'react';
import { useSharedChatContext } from './chat-context';
export default function ChatInput() {
const { chat } = useSharedChatContext();
const [text, setText] = useState('');
const { status, stop, sendMessage } = useChat({ chat });
return (
\<form
onSubmit={e =\> {
e.preventDefault();
if (text.trim() === '') return;
sendMessage({ text });
setText('');
}}
\>
\<input
placeholder="Say something..."
disabled={status !== 'ready'}
value={text}
onChange={e =\> setText(e.target.value)}
/\>
{stop && (status === 'streaming' || status === 'submitted') && (
\<button type="submit" onClick={stop}\>
Stop
\</button\>
)}
\</form\>
);
}
`
```
## [Server](#server)
Create an API route to handle the chat messages using the AI SDK.
app/api/chat/route.ts
```
`
import { convertToModelMessages, streamText, UIMessage } from 'ai';
export const maxDuration = 30;
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: 'openai/gpt-4o-mini',
messages: await convertToModelMessages(messages),
});
return result.toUIMessageStreamResponse();
}
`
```
[
View Example on GitHub
](https://github.com/vercel/ai/tree/main/examples/ai-e2e-next/app/chat/shared-context)
On this page
[Share useChat State Across Components](#share-usechat-state-across-components)
[Create a Chat Context](#create-a-chat-context)
[Wrap Your App with the Provider](#wrap-your-app-with-the-provider)
[Display Messages and Clear Chat](#display-messages-and-clear-chat)
[Handle Input in a Separate Component](#handle-input-in-a-separate-component)
[Server](#server)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)