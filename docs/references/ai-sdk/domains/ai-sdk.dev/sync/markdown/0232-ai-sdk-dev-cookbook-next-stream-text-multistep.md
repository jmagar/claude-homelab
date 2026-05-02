Next.js: streamText Multi-Step Cookbook
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
# [streamText Multi-Step Agent](#streamtext-multi-step-agent)
You may want to have different steps in your stream where each step has different settings,
e.g. models, tools, or system prompts.
With `createUIMessageStream` and `sendFinish` / `sendStart` options when merging
into the `UIMessageStream`, you can control when the finish and start events are sent to the client,
allowing you to have different steps in a single assistant UI message.
## [Server](#server)
app/api/chat/route.ts
```
`
import {
convertToModelMessages,
createUIMessageStream,
createUIMessageStreamResponse,
streamText,
tool,
} from 'ai';
import { z } from 'zod';
export async function POST(req: Request) {
const { messages } = await req.json();
const stream = createUIMessageStream({
execute: async ({ writer }) =\> {
// step 1 example: forced tool call
const result1 = streamText({
model: 'openai/gpt-4o-mini',
system: 'Extract the user goal from the conversation.',
messages,
toolChoice: 'required', // force the model to call a tool
tools: {
extractGoal: tool({
inputSchema: z.object({ goal: z.string() }),
execute: async ({ goal }) =\> goal, // no-op extract tool
}),
},
});
// forward the initial result to the client without the finish event:
writer.merge(result1.toUIMessageStream({ sendFinish: false }));
// note: you can use any programming construct here, e.g. if-else, loops, etc.
// workflow programming is normal programming with this approach.
// example: continue stream with forced tool call from previous step
const result2 = streamText({
// different system prompt, different model, no tools:
model: 'openai/gpt-4o',
system:
'You are a helpful assistant with a different system prompt. Repeat the extract user goal in your answer.',
// continue the workflow stream with the messages from the previous step:
messages: [
...convertToModelMessages(messages),
...(await result1.response).messages,
],
});
// forward the 2nd result to the client (incl. the finish event):
writer.merge(result2.toUIMessageStream({ sendStart: false }));
},
});
return createUIMessageStreamResponse({ stream });
}
`
```
## [Client](#client)
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { useState } from 'react';
export default function Chat() {
const [input, setInput] = useState('');
const { messages, sendMessage } = useChat();
return (
\<div\>
{messages?.map(message =\> (
\<div key={message.id}\>
\<strong\>{`${message.role}: `}\</strong\>
{message.parts.map((part, index) =\> {
switch (part.type) {
case 'text':
return \<span key={index}\>{part.text}\</span\>;
case 'tool-extractGoal': {
return \<pre key={index}\>{JSON.stringify(part, null, 2)}\</pre\>;
}
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
\<input value={input} onChange={e =\> setInput(e.currentTarget.value)} /\>
\</form\>
\</div\>
);
}
`
```
On this page
[streamText Multi-Step Agent](#streamtext-multi-step-agent)
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