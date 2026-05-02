AI SDK UI: Streaming Custom Data
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
# [Streaming Custom Data](#streaming-custom-data)
It is often useful to send additional data alongside the model's response.
For example, you may want to send status information, the message ids after storing them,
or references to content that the language model is referring to.
The AI SDK provides several helpers that allows you to stream additional data to the client
and attach it to the `UIMessage` parts array:
* `createUIMessageStream`: creates a data stream
* `createUIMessageStreamResponse`: creates a response object that streams data
* `pipeUIMessageStreamToResponse`: pipes a data stream to a server response object
The data is streamed as part of the response stream using Server-Sent Events.
## [Setting Up Type-Safe Data Streaming](#setting-up-type-safe-data-streaming)
First, define your custom message type with data part schemas for type safety:
ai/types.ts
```
`
import { UIMessage } from 'ai';
// Define your custom message type with data part schemas
export type MyUIMessage = UIMessage\<
never, // metadata type
{
weather: {
city: string;
weather?: string;
status: 'loading' | 'success';
};
notification: {
message: string;
level: 'info' | 'warning' | 'error';
};
} // data parts type
\>;
`
```
## [Streaming Data from the Server](#streaming-data-from-the-server)
In your server-side route handler, you can create a `UIMessageStream` and then pass it to `createUIMessageStreamResponse`:
Gateway
Provider
Custom
Claude Sonnet 4.5
route.ts
```
`
import { openai } from '@ai-sdk/openai';
import {
createUIMessageStream,
createUIMessageStreamResponse,
streamText,
convertToModelMessages,
} from 'ai';
import type { MyUIMessage } from '@/ai/types';
export async function POST(req: Request) {
const { messages } = await req.json();
const stream = createUIMessageStream\<MyUIMessage\>({
execute: ({ writer }) =\> {
// 1. Send initial status (transient - won't be added to message history)
writer.write({
type: 'data-notification',
data: { message: 'Processing your request...', level: 'info' },
transient: true, // This part won't be added to message history
});
// 2. Send sources (useful for RAG use cases)
writer.write({
type: 'source',
value: {
type: 'source',
sourceType: 'url',
id: 'source-1',
url: 'https://weather.com',
title: 'Weather Data Source',
},
});
// 3. Send data parts with loading state
writer.write({
type: 'data-weather',
id: 'weather-1',
data: { city: 'San Francisco', status: 'loading' },
});
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: await convertToModelMessages(messages),
onFinish() {
// 4. Update the same data part (reconciliation)
writer.write({
type: 'data-weather',
id: 'weather-1', // Same ID = update existing part
data: {
city: 'San Francisco',
weather: 'sunny',
status: 'success',
},
});
// 5. Send completion notification (transient)
writer.write({
type: 'data-notification',
data: { message: 'Request completed', level: 'info' },
transient: true, // Won't be added to message history
});
},
});
writer.merge(result.toUIMessageStream());
},
});
return createUIMessageStreamResponse({ stream });
}
`
```
You can also send stream data from custom backends, e.g. Python / FastAPI,
using the [UI Message Stream
Protocol](/docs/ai-sdk-ui/stream-protocol#ui-message-stream-protocol).
## [Types of Streamable Data](#types-of-streamable-data)
### [Data Parts (Persistent)](#data-parts-persistent)
Regular data parts are added to the message history and appear in `message.parts`:
```
`
writer.write({
type: 'data-weather',
id: 'weather-1', // Optional: enables reconciliation
data: { city: 'San Francisco', status: 'loading' },
});
`
```
### [Sources](#sources)
Sources are useful for RAG implementations where you want to show which documents or URLs were referenced:
```
`
writer.write({
type: 'source',
value: {
type: 'source',
sourceType: 'url',
id: 'source-1',
url: 'https://example.com',
title: 'Example Source',
},
});
`
```
### [Transient Data Parts (Ephemeral)](#transient-data-parts-ephemeral)
Transient parts are sent to the client but not added to the message history. They are only accessible via the `onData` useChat handler:
```
`
// server
writer.write({
type: 'data-notification',
data: { message: 'Processing...', level: 'info' },
transient: true, // Won't be added to message history
});
// client
const [notification, setNotification] = useState();
const { messages } = useChat({
onData: ({ data, type }) =\> {
if (type === 'data-notification') {
setNotification({ message: data.message, level: data.level });
}
},
});
`
```
## [Data Part Reconciliation](#data-part-reconciliation)
When you write to a data part with the same ID, the client automatically reconciles and updates that part. This enables powerful dynamic experiences like:
* **Collaborative artifacts** - Update code, documents, or designs in real-time
* **Progressive data loading** - Show loading states that transform into final results
* **Live status updates** - Update progress bars, counters, or status indicators
* **Interactive components** - Build UI elements that evolve based on user interaction
The reconciliation happens automatically - simply use the same `id` when writing to the stream.
## [Processing Data on the Client](#processing-data-on-the-client)
### [Using the onData Callback](#using-the-ondata-callback)
The `onData` callback is essential for handling streaming data, especially transient parts:
page.tsx
```
`
import { useChat } from '@ai-sdk/react';
import type { MyUIMessage } from '@/ai/types';
const { messages } = useChat\<MyUIMessage\>({
api: '/api/chat',
onData: dataPart =\> {
// Handle all data parts as they arrive (including transient parts)
console.log('Received data part:', dataPart);
// Handle different data part types
if (dataPart.type === 'data-weather') {
console.log('Weather update:', dataPart.data);
}
// Handle transient notifications (ONLY available here, not in message.parts)
if (dataPart.type === 'data-notification') {
showToast(dataPart.data.message, dataPart.data.level);
}
},
});
`
```
**Important:** Transient data parts are **only** available through the `onData` callback. They will not appear in the `message.parts` array since they're not added to message history.
### [Rendering Persistent Data Parts](#rendering-persistent-data-parts)
You can filter and render data parts from the message parts array:
page.tsx
```
`
const result = (
\<\>
{messages?.map(message =\> (
\<div key={message.id}\>
{/\* Render weather data parts \*/}
{message.parts
.filter(part =\> part.type === 'data-weather')
.map((part, index) =\> (
\<div key={index} className="weather-widget"\>
{part.data.status === 'loading' ? (
\<\>Getting weather for {part.data.city}...\</\>
) : (
\<\>
Weather in {part.data.city}: {part.data.weather}
\</\>
)}
\</div\>
))}
{/\* Render text content \*/}
{message.parts
.filter(part =\> part.type === 'text')
.map((part, index) =\> (
\<div key={index}\>{part.text}\</div\>
))}
{/\* Render sources \*/}
{message.parts
.filter(part =\> part.type === 'source')
.map((part, index) =\> (
\<div key={index} className="source"\>
Source: \<a href={part.url}\>{part.title}\</a\>
\</div\>
))}
\</div\>
))}
\</\>
);
`
```
### [Complete Example](#complete-example)
page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { useState } from 'react';
import type { MyUIMessage } from '@/ai/types';
export default function Chat() {
const [input, setInput] = useState('');
const { messages, sendMessage } = useChat\<MyUIMessage\>({
api: '/api/chat',
onData: dataPart =\> {
// Handle transient notifications
if (dataPart.type === 'data-notification') {
console.log('Notification:', dataPart.data.message);
}
},
});
const handleSubmit = (e: React.FormEvent) =\> {
e.preventDefault();
sendMessage({ text: input });
setInput('');
};
return (
\<\>
{messages?.map(message =\> (
\<div key={message.id}\>
{message.role === 'user' ? 'User: ' : 'AI: '}
{/\* Render weather data \*/}
{message.parts
.filter(part =\> part.type === 'data-weather')
.map((part, index) =\> (
\<span key={index} className="weather-update"\>
{part.data.status === 'loading' ? (
\<\>Getting weather for {part.data.city}...\</\>
) : (
\<\>
Weather in {part.data.city}: {part.data.weather}
\</\>
)}
\</span\>
))}
{/\* Render text content \*/}
{message.parts
.filter(part =\> part.type === 'text')
.map((part, index) =\> (
\<div key={index}\>{part.text}\</div\>
))}
\</div\>
))}
\<form onSubmit={handleSubmit}\>
\<input
value={input}
onChange={e =\> setInput(e.target.value)}
placeholder="Ask about the weather..."
/\>
\<button type="submit"\>Send\</button\>
\</form\>
\</\>
);
}
`
```
## [Use Cases](#use-cases)
* **RAG Applications** - Stream sources and retrieved documents
* **Real-time Status** - Show loading states and progress updates
* **Collaborative Tools** - Stream live updates to shared artifacts
* **Analytics** - Send usage data without cluttering message history
* **Notifications** - Display temporary alerts and status messages
## [Message Metadata vs Data Parts](#message-metadata-vs-data-parts)
Both [message metadata](/docs/ai-sdk-ui/message-metadata) and data parts allow you to send additional information alongside messages, but they serve different purposes:
### [Message Metadata](#message-metadata)
Message metadata is best for **message-level information** that describes the message as a whole:
* Attached at the message level via `message.metadata`
* Sent using the `messageMetadata` callback in `toUIMessageStreamResponse`
* Ideal for: timestamps, model info, token usage, user context
* Type-safe with custom metadata types
```
`
// Server: Send metadata about the message
return result.toUIMessageStreamResponse({
messageMetadata: ({ part }) =\> {
if (part.type === 'finish') {
return {
model: part.response.modelId,
totalTokens: part.totalUsage.totalTokens,
createdAt: Date.now(),
};
}
},
});
`
```
### [Data Parts](#data-parts)
Data parts are best for streaming **dynamic arbitrary data**:
* Added to the message parts array via `message.parts`
* Streamed using `createUIMessageStream` and `writer.write()`
* Can be reconciled/updated using the same ID
* Support transient parts that don't persist
* Ideal for: dynamic content, loading states, interactive components
```
`
// Server: Stream data as part of message content
writer.write({
type: 'data-weather',
id: 'weather-1',
data: { city: 'San Francisco', status: 'loading' },
});
`
```
For more details on message metadata, see the [Message Metadata documentation](/docs/ai-sdk-ui/message-metadata).
On this page
[Streaming Custom Data](#streaming-custom-data)
[Setting Up Type-Safe Data Streaming](#setting-up-type-safe-data-streaming)
[Streaming Data from the Server](#streaming-data-from-the-server)
[Types of Streamable Data](#types-of-streamable-data)
[Data Parts (Persistent)](#data-parts-persistent)
[Sources](#sources)
[Transient Data Parts (Ephemeral)](#transient-data-parts-ephemeral)
[Data Part Reconciliation](#data-part-reconciliation)
[Processing Data on the Client](#processing-data-on-the-client)
[Using the onData Callback](#using-the-ondata-callback)
[Rendering Persistent Data Parts](#rendering-persistent-data-parts)
[Complete Example](#complete-example)
[Use Cases](#use-cases)
[Message Metadata vs Data Parts](#message-metadata-vs-data-parts)
[Message Metadata](#message-metadata)
[Data Parts](#data-parts)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)