AI SDK UI: Stream Protocols
[](https://vercel.com/oss)
Menu
v6 (Latest)
AI SDK 6.x
[AI SDK by Vercel](/docs/introduction)
[Foundations](/docs/foundations)
[Overview](/docs/foundations/overview)
[Providers and Models](/docs/foundations/providers-and-models)
[Prompts](/docs/foundations/prompts)
[Tools](/docs/foundations/tools)
[Streaming](/docs/foundations/streaming)
[Provider Options](/docs/foundations/provider-options)
[Getting Started](/docs/getting-started)
[Choosing a Provider](/docs/getting-started/choosing-a-provider)
[Navigating the Library](/docs/getting-started/navigating-the-library)
[Next.js App Router](/docs/getting-started/nextjs-app-router)
[Next.js Pages Router](/docs/getting-started/nextjs-pages-router)
[Svelte](/docs/getting-started/svelte)
[Vue.js (Nuxt)](/docs/getting-started/nuxt)
[Node.js](/docs/getting-started/nodejs)
[Expo](/docs/getting-started/expo)
[TanStack Start](/docs/getting-started/tanstack-start)
[Coding Agents](/docs/getting-started/coding-agents)
[Agents](/docs/agents)
[Overview](/docs/agents/overview)
[Building Agents](/docs/agents/building-agents)
[Workflow Patterns](/docs/agents/workflows)
[Loop Control](/docs/agents/loop-control)
[Configuring Call Options](/docs/agents/configuring-call-options)
[Memory](/docs/agents/memory)
[Subagents](/docs/agents/subagents)
[AI SDK Core](/docs/ai-sdk-core)
[Overview](/docs/ai-sdk-core/overview)
[Generating Text](/docs/ai-sdk-core/generating-text)
[Generating Structured Data](/docs/ai-sdk-core/generating-structured-data)
[Tool Calling](/docs/ai-sdk-core/tools-and-tool-calling)
[Model Context Protocol (MCP)](/docs/ai-sdk-core/mcp-tools)
[Prompt Engineering](/docs/ai-sdk-core/prompt-engineering)
[Settings](/docs/ai-sdk-core/settings)
[Embeddings](/docs/ai-sdk-core/embeddings)
[Reranking](/docs/ai-sdk-core/reranking)
[Image Generation](/docs/ai-sdk-core/image-generation)
[Transcription](/docs/ai-sdk-core/transcription)
[Speech](/docs/ai-sdk-core/speech)
[Video Generation](/docs/ai-sdk-core/video-generation)
[Language Model Middleware](/docs/ai-sdk-core/middleware)
[Provider & Model Management](/docs/ai-sdk-core/provider-management)
[Error Handling](/docs/ai-sdk-core/error-handling)
[Testing](/docs/ai-sdk-core/testing)
[Telemetry](/docs/ai-sdk-core/telemetry)
[DevTools](/docs/ai-sdk-core/devtools)
[Event Callbacks](/docs/ai-sdk-core/event-listeners)
[AI SDK UI](/docs/ai-sdk-ui)
[Overview](/docs/ai-sdk-ui/overview)
[Chatbot](/docs/ai-sdk-ui/chatbot)
[Chatbot Message Persistence](/docs/ai-sdk-ui/chatbot-message-persistence)
[Chatbot Resume Streams](/docs/ai-sdk-ui/chatbot-resume-streams)
[Chatbot Tool Usage](/docs/ai-sdk-ui/chatbot-tool-usage)
[Generative User Interfaces](/docs/ai-sdk-ui/generative-user-interfaces)
[Completion](/docs/ai-sdk-ui/completion)
[Object Generation](/docs/ai-sdk-ui/object-generation)
[Streaming Custom Data](/docs/ai-sdk-ui/streaming-data)
[Error Handling](/docs/ai-sdk-ui/error-handling)
[Transport](/docs/ai-sdk-ui/transport)
[Reading UIMessage Streams](/docs/ai-sdk-ui/reading-ui-message-streams)
[Message Metadata](/docs/ai-sdk-ui/message-metadata)
[Stream Protocols](/docs/ai-sdk-ui/stream-protocol)
[AI SDK RSC](/docs/ai-sdk-rsc)
[Advanced](/docs/advanced)
[Reference](/docs/reference)
[AI SDK Core](/docs/reference/ai-sdk-core)
[AI SDK UI](/docs/reference/ai-sdk-ui)
[AI SDK RSC](/docs/reference/ai-sdk-rsc)
[AI SDK Errors](/docs/reference/ai-sdk-errors)
[Migration Guides](/docs/migration-guides)
[Troubleshooting](/docs/troubleshooting)
Copy markdown
# [Stream Protocols](#stream-protocols)
AI SDK UI functions such as `useChat` and `useCompletion` support both text streams and data streams.
The stream protocol defines how the data is streamed to the frontend on top of the HTTP protocol.
This page describes both protocols and how to use them in the backend and frontend.
You can use this information to develop custom backends and frontends for your use case, e.g.,
to provide compatible API endpoints that are implemented in a different language such as Python.
For instance, here's an example using [FastAPI](https://github.com/vercel/ai/tree/main/examples/next-fastapi) as a backend.
## [Text Stream Protocol](#text-stream-protocol)
A text stream contains chunks in plain text, that are streamed to the frontend.
Each chunk is then appended together to form a full text response.
Text streams are supported by `useChat`, `useCompletion`, and `useObject`.
When you use `useChat` or `useCompletion`, you need to enable text streaming
by setting the `streamProtocol` options to `text`.
You can generate text streams with `streamText` in the backend.
When you call `toTextStreamResponse()` on the result object,
a streaming HTTP response is returned.
Text streams only support basic text data. If you need to stream other types
of data such as tool calls, use data streams.
### [Text Stream Example](#text-stream-example)
Here is a Next.js example that uses the text stream protocol:
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { TextStreamChatTransport } from 'ai';
import { useState } from 'react';
export default function Chat() {
const [input, setInput] = useState('');
const { messages, sendMessage } = useChat({
transport: new TextStreamChatTransport({ api: '/api/chat' }),
});
return (
\<div className="flex flex-col w-full max-w-md py-24 mx-auto stretch"\>
{messages.map(message =\> (
\<div key={message.id} className="whitespace-pre-wrap"\>
{message.role === 'user' ? 'User: ' : 'AI: '}
{message.parts.map((part, i) =\> {
switch (part.type) {
case 'text':
return \<div key={`${message.id}-${i}`}\>{part.text}\</div\>;
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
className="fixed dark:bg-zinc-900 bottom-0 w-full max-w-md p-2 mb-8 border border-zinc-300 dark:border-zinc-800 rounded shadow-xl"
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
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/chat/route.ts
```
`
import { streamText, UIMessage, convertToModelMessages } from 'ai';
// Allow streaming responses up to 30 seconds
export const maxDuration = 30;
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: await convertToModelMessages(messages),
});
return result.toTextStreamResponse();
}
`
```
## [Data Stream Protocol](#data-stream-protocol)
A data stream follows a special protocol that the AI SDK provides to send information to the frontend.
The data stream protocol uses Server-Sent Events (SSE) format for improved standardization, keep-alive through ping, reconnect capabilities, and better cache handling.
When you provide data streams from a custom backend, you need to set the
`x-vercel-ai-ui-message-stream` header to `v1`.
The following stream parts are currently supported:
### [Message Start Part](#message-start-part)
Indicates the beginning of a new message with metadata.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"start","messageId":"..."}
`
```
### [Text Parts](#text-parts)
Text content is streamed using a start/delta/end pattern with unique IDs for each text block.
#### [Text Start Part](#text-start-part)
Indicates the beginning of a text block.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"text-start","id":"msg\_68679a454370819ca74c8eb3d04379630dd1afb72306ca5d"}
`
```
#### [Text Delta Part](#text-delta-part)
Contains incremental text content for the text block.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"text-delta","id":"msg\_68679a454370819ca74c8eb3d04379630dd1afb72306ca5d","delta":"Hello"}
`
```
#### [Text End Part](#text-end-part)
Indicates the completion of a text block.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"text-end","id":"msg\_68679a454370819ca74c8eb3d04379630dd1afb72306ca5d"}
`
```
### [Reasoning Parts](#reasoning-parts)
Reasoning content is streamed using a start/delta/end pattern with unique IDs for each reasoning block.
#### [Reasoning Start Part](#reasoning-start-part)
Indicates the beginning of a reasoning block.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"reasoning-start","id":"reasoning\_123"}
`
```
#### [Reasoning Delta Part](#reasoning-delta-part)
Contains incremental reasoning content for the reasoning block.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"reasoning-delta","id":"reasoning\_123","delta":"This is some reasoning"}
`
```
#### [Reasoning End Part](#reasoning-end-part)
Indicates the completion of a reasoning block.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"reasoning-end","id":"reasoning\_123"}
`
```
### [Source Parts](#source-parts)
Source parts provide references to external content sources.
#### [Source URL Part](#source-url-part)
References to external URLs.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"source-url","sourceId":"https://example.com","url":"https://example.com"}
`
```
#### [Source Document Part](#source-document-part)
References to documents or files.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"source-document","sourceId":"https://example.com","mediaType":"file","title":"Title"}
`
```
### [File Part](#file-part)
The file parts contain references to files with their media type.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"file","url":"https://example.com/file.png","mediaType":"image/png"}
`
```
### [Data Parts](#data-parts)
Custom data parts allow streaming of arbitrary structured data with type-specific handling.
Format: Server-Sent Event with JSON object where the type includes a custom suffix
Example:
```
`
data: {"type":"data-weather","data":{"location":"SF","temperature":100}}
`
```
The `data-\*` type pattern allows you to define custom data types that your frontend can handle specifically.
### [Error Part](#error-part)
The error parts are appended to the message as they are received.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"error","errorText":"error message"}
`
```
### [Tool Input Start Part](#tool-input-start-part)
Indicates the beginning of tool input streaming.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"tool-input-start","toolCallId":"call\_fJdQDqnXeGxTmr4E3YPSR7Ar","toolName":"getWeatherInformation"}
`
```
### [Tool Input Delta Part](#tool-input-delta-part)
Incremental chunks of tool input as it's being generated.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"tool-input-delta","toolCallId":"call\_fJdQDqnXeGxTmr4E3YPSR7Ar","inputTextDelta":"San Francisco"}
`
```
### [Tool Input Available Part](#tool-input-available-part)
Indicates that tool input is complete and ready for execution.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"tool-input-available","toolCallId":"call\_fJdQDqnXeGxTmr4E3YPSR7Ar","toolName":"getWeatherInformation","input":{"city":"San Francisco"}}
`
```
### [Tool Output Available Part](#tool-output-available-part)
Contains the result of tool execution.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"tool-output-available","toolCallId":"call\_fJdQDqnXeGxTmr4E3YPSR7Ar","output":{"city":"San Francisco","weather":"sunny"}}
`
```
### [Start Step Part](#start-step-part)
A part indicating the start of a step.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"start-step"}
`
```
### [Finish Step Part](#finish-step-part)
A part indicating that a step (i.e., one LLM API call in the backend) has been completed.
This part is necessary to correctly process multiple stitched assistant calls, e.g. when calling tools in the backend, and using steps in `useChat` at the same time.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"finish-step"}
`
```
### [Finish Message Part](#finish-message-part)
A part indicating the completion of a message.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"finish"}
`
```
### [Abort Part](#abort-part)
Indicates the stream was aborted.
Format: Server-Sent Event with JSON object
Example:
```
`
data: {"type":"abort","reason":"user cancelled"}
`
```
### [Stream Termination](#stream-termination)
The stream ends with a special `[DONE]` marker.
Format: Server-Sent Event with literal `[DONE]`
Example:
```
`
data: [DONE]
`
```
The data stream protocol is supported
by `useChat` and `useCompletion` on the frontend and used by default.
`useCompletion` only supports the `text` and `data` stream parts.
On the backend, you can use `toUIMessageStreamResponse()` from the `streamText` result object to return a streaming HTTP response.
### [UI Message Stream Example](#ui-message-stream-example)
Here is a Next.js example that uses the UI message stream protocol:
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
\<div className="flex flex-col w-full max-w-md py-24 mx-auto stretch"\>
{messages.map(message =\> (
\<div key={message.id} className="whitespace-pre-wrap"\>
{message.role === 'user' ? 'User: ' : 'AI: '}
{message.parts.map((part, i) =\> {
switch (part.type) {
case 'text':
return \<div key={`${message.id}-${i}`}\>{part.text}\</div\>;
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
className="fixed dark:bg-zinc-900 bottom-0 w-full max-w-md p-2 mb-8 border border-zinc-300 dark:border-zinc-800 rounded shadow-xl"
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
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/chat/route.ts
```
`
import { streamText, UIMessage, convertToModelMessages } from 'ai';
// Allow streaming responses up to 30 seconds
export const maxDuration = 30;
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: await convertToModelMessages(messages),
});
return result.toUIMessageStreamResponse();
}
`
```
On this page
[Stream Protocols](#stream-protocols)
[Text Stream Protocol](#text-stream-protocol)
[Text Stream Example](#text-stream-example)
[Data Stream Protocol](#data-stream-protocol)
[Message Start Part](#message-start-part)
[Text Parts](#text-parts)
[Text Start Part](#text-start-part)
[Text Delta Part](#text-delta-part)
[Text End Part](#text-end-part)
[Reasoning Parts](#reasoning-parts)
[Reasoning Start Part](#reasoning-start-part)
[Reasoning Delta Part](#reasoning-delta-part)
[Reasoning End Part](#reasoning-end-part)
[Source Parts](#source-parts)
[Source URL Part](#source-url-part)
[Source Document Part](#source-document-part)
[File Part](#file-part)
[Data Parts](#data-parts)
[Error Part](#error-part)
[Tool Input Start Part](#tool-input-start-part)
[Tool Input Delta Part](#tool-input-delta-part)
[Tool Input Available Part](#tool-input-available-part)
[Tool Output Available Part](#tool-output-available-part)
[Start Step Part](#start-step-part)
[Finish Step Part](#finish-step-part)
[Finish Message Part](#finish-message-part)
[Abort Part](#abort-part)
[Stream Termination](#stream-termination)
[UI Message Stream Example](#ui-message-stream-example)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)