Next.js: Streaming with Custom Format
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
# [Streaming with Custom Format](#streaming-with-custom-format)
Create a custom stream to control the streaming format and structure of tool calls instead of using the built-in AI SDK data stream format (`toUIMessageStream()`).
`fullStream` (on `StreamTextResult`) gives you direct access to all model events. You can transform, filter, and structure these events into your own streaming format. This gives you the benefits of the AI SDK's unified provider interface without prescribing how you consume the stream.
You can:
* Define your own stream chunk format
* Control how steps and tool calls are structured
* Parse the stream manually on the client
* Build custom UI from your stream data
For complete control over both the streaming format and the execution loop, combine this pattern with a [manual agent loop](/cookbook/node/manual-agent-loop).
## [Implementation](#implementation)
### [Server](#server)
Create a route handler that calls a model and then streams the responses in a custom format:
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/stream/route.ts
```
`
import { tools } from '@/ai/tools'; // your tools
import { stepCountIs, streamText } from 'ai';
export type StreamEvent =
| { type: 'text'; text: string }
| { type: 'tool-call'; toolName: string; input: unknown }
| { type: 'tool-result'; toolName: string; result: unknown };
const encoder = new TextEncoder();
function formatEvent(event: StreamEvent): Uint8Array {
return encoder.encode('data: ' + JSON.stringify(event) + '\\n\\n');
}
export async function POST(request: Request) {
const { prompt } = await request.json();
const result = streamText({
prompt,
model: "anthropic/claude-sonnet-4.5",
tools,
stopWhen: stepCountIs(5),
});
const transformStream = new TransformStream({
transform(chunk, controller) {
switch (chunk.type) {
case 'text-delta':
controller.enqueue(formatEvent({ type: 'text', text: chunk.text }));
break;
case 'tool-call':
controller.enqueue(
formatEvent({
type: 'tool-call',
toolName: chunk.toolName,
input: chunk.input,
}),
);
break;
case 'tool-result':
controller.enqueue(
formatEvent({
type: 'tool-result',
toolName: chunk.toolName,
result: chunk.output,
}),
);
break;
}
},
});
return new Response(result.fullStream.pipeThrough(transformStream), {
headers: { 'Content-Type': 'text/event-stream' },
});
}
`
```
The route uses `streamText` to process the prompt with tools. Each event (text, tool calls, tool results) is encoded as a Server-Sent Event with a `data: ` prefix and sent to the client.
### [Client](#client)
Create a simple interface that parses and displays the stream:
app/page.tsx
```
`
'use client';
import { useState } from 'react';
import { StreamEvent } from './api/stream/route';
export default function Home() {
const [prompt, setPrompt] = useState('');
const [events, setEvents] = useState\<StreamEvent[]\>([]);
const [isStreaming, setIsStreaming] = useState(false);
const handleSubmit = async () =\> {
setEvents([]);
setIsStreaming(true);
setPrompt('');
const response = await fetch('/api/stream', {
method: 'POST',
headers: { 'Content-Type': 'application/json' },
body: JSON.stringify({ prompt }),
});
const reader = response.body?.getReader();
const decoder = new TextDecoder();
if (reader) {
let buffer = '';
while (true) {
const { done, value } = await reader.read();
if (done) break;
buffer += decoder.decode(value, { stream: true });
const lines = buffer.split('\\n');
buffer = lines.pop() || '';
for (const line of lines) {
if (line.trim()) {
const dataStr = line.replace(/^data: /, '');
const event = JSON.parse(dataStr) as StreamEvent;
setEvents(prev =\> [...prev, event]);
}
}
}
}
setIsStreaming(false);
};
return (
\<div\>
\<input
value={prompt}
onChange={e =\> setPrompt(e.target.value)}
placeholder="Enter a prompt..."
/\>
\<button onClick={handleSubmit} disabled={isStreaming}\>
{isStreaming ? 'Streaming...' : 'Send'}
\</button\>
\<pre\>{JSON.stringify(events, null, 2)}\</pre\>
\</div\>
);
}
`
```
## [How it works](#how-it-works)
The client uses the Fetch API to stream responses from the server. Since the server sends Server-Sent Events (newline-delimited with `data: ` prefix), the client:
1. Reads chunks from the stream using `getReader()`
2. Decodes the binary chunks to text
3. Splits by newlines to identify complete events
4. Removes the `data: ` prefix and parses the JSON, then appends it to the events list
Events are rendered in order as they arrive, giving you a linear representation of the AI's response.
On this page
[Streaming with Custom Format](#streaming-with-custom-format)
[Implementation](#implementation)
[Server](#server)
[Client](#client)
[How it works](#how-it-works)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)