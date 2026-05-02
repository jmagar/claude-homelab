React Server Components: Save Messages To Database
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
# [Save Messages To Database](#save-messages-to-database)
Sometimes conversations with language models can get interesting and you might want to save the state of so you can revisit it or continue the conversation later.
`createAI` has an experimental callback function called `onSetAIState` that gets called whenever the AI state changes. You can use this to save the AI state to a file or a database.
## [Client](#client)
app/layout.tsx
```
`
import { ServerMessage } from './actions';
import { AI } from './ai';
export default function RootLayout({
children,
}: Readonly\<{
children: React.ReactNode;
}\>) {
// get chat history from database
const history: ServerMessage[] = getChat();
return (
\<html lang="en"\>
\<body\>
\<AI initialAIState={history} initialUIState={[]}\>
{children}
\</AI\>
\</body\>
\</html\>
);
}
`
```
app/page.tsx
```
`
'use client';
import { useState } from 'react';
import { ClientMessage } from './actions';
import { useActions, useUIState } from '@ai-sdk/rsc';
import { generateId } from 'ai';
// Allow streaming responses up to 30 seconds
export const maxDuration = 30;
export default function Home() {
const [input, setInput] = useState\<string\>('');
const [conversation, setConversation] = useUIState();
const { continueConversation } = useActions();
return (
\<div\>
\<div\>
{conversation.map((message: ClientMessage) =\> (
\<div key={message.id}\>
{message.role}: {message.display}
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
setConversation((currentConversation: ClientMessage[]) =\> [
...currentConversation,
{ id: generateId(), role: 'user', display: input },
]);
const message = await continueConversation(input);
setConversation((currentConversation: ClientMessage[]) =\> [
...currentConversation,
message,
]);
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
We will use the callback function to listen to state changes and save the conversation once we receive a `done` event.
app/actions.tsx
```
`
'use server';
import { getAIState, getMutableAIState, streamUI } from '@ai-sdk/rsc';
import { ReactNode } from 'react';
import { z } from 'zod';
import { generateId } from 'ai';
import { Stock } from '@ai-studio/components/stock';
export interface ServerMessage {
role: 'user' | 'assistant' | 'function';
content: string;
}
export interface ClientMessage {
id: string;
role: 'user' | 'assistant' | 'function';
display: ReactNode;
}
export async function continueConversation(
input: string,
): Promise\<ClientMessage\> {
'use server';
const history = getMutableAIState();
const result = await streamUI({
model: 'openai/gpt-5.4',
messages: [...history.get(), { role: 'user', content: input }],
text: ({ content, done }) =\> {
if (done) {
history.done([
...history.get(),
{ role: 'user', content: input },
{ role: 'assistant', content },
]);
}
return \<div\>{content}\</div\>;
},
tools: {
showStockInformation: {
description:
'Get stock information for symbol for the last numOfMonths months',
inputSchema: z.object({
symbol: z
.string()
.describe('The stock symbol to get information for'),
numOfMonths: z
.number()
.describe('The number of months to get historical information for'),
}),
generate: async ({ symbol, numOfMonths }) =\> {
history.done([
...history.get(),
{
role: 'function',
name: 'showStockInformation',
content: JSON.stringify({ symbol, numOfMonths }),
},
]);
return \<Stock symbol={symbol} numOfMonths={numOfMonths} /\>;
},
},
},
});
return {
id: generateId(),
role: 'assistant',
display: result.value,
};
}
`
```
app/ai.ts
```
`
import { createAI } from '@ai-sdk/rsc';
import { ServerMessage, ClientMessage, continueConversation } from './actions';
export const AI = createAI\<ServerMessage[], ClientMessage[]\>({
actions: {
continueConversation,
},
onSetAIState: async ({ state, done }) =\> {
'use server';
if (done) {
saveChat(state);
}
},
onGetUIState: async () =\> {
'use server';
const history: ServerMessage[] = getAIState();
return history.map(({ role, content }) =\> ({
id: generateId(),
role,
display:
role === 'function' ? \<Stock {...JSON.parse(content)} /\> : content,
}));
},
});
`
```
On this page
[Save Messages To Database](#save-messages-to-database)
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