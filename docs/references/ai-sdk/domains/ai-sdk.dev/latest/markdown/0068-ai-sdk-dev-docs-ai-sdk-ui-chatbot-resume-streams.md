AI SDK UI: Chatbot Resume Streams
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
# [Chatbot Resume Streams](#chatbot-resume-streams)
`useChat` supports resuming ongoing streams after page reloads. Use this feature to build applications with long-running generations.
Stream resumption is not compatible with abort functionality. Closing a tab or
refreshing the page triggers an abort signal that will break the resumption
mechanism. Do not use `resume: true` if you need abort functionality in your
application. See
[troubleshooting](/docs/troubleshooting/abort-breaks-resumable-streams) for
more details.
## [How stream resumption works](#how-stream-resumption-works)
Stream resumption requires persistence for messages and active streams in your application. The AI SDK provides tools to connect to storage, but you need to set up the storage yourself.
**The AI SDK provides:**
* A `resume` option in `useChat` that automatically reconnects to active streams
* Access to the outgoing stream through the `consumeSseStream` callback
* Automatic HTTP requests to your resume endpoints
**You build:**
* Storage to track which stream belongs to each chat
* Redis to store the UIMessage stream
* Two API endpoints: POST to create streams, GET to resume them
* Integration with [`resumable-stream`](https://www.npmjs.com/package/resumable-stream) to manage Redis storage
## [Prerequisites](#prerequisites)
To implement resumable streams in your chat application, you need:
1. **The `resumable-stream` package** - Handles the publisher/subscriber mechanism for streams
2. **A Redis instance** - Stores stream data (e.g. [Redis through Vercel](https://vercel.com/marketplace/redis))
3. **A persistence layer** - Tracks which stream ID is active for each chat (e.g. database)
## [Implementation](#implementation)
### [1. Client-side: Enable stream resumption](#1-client-side-enable-stream-resumption)
Use the `resume` option in the `useChat` hook to enable stream resumption. When `resume` is true, the hook automatically attempts to reconnect to any active stream for the chat on mount:
app/chat/[chatId]/chat.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport, type UIMessage } from 'ai';
export function Chat({
chatData,
resume = false,
}: {
chatData: { id: string; messages: UIMessage[] };
resume?: boolean;
}) {
const { messages, sendMessage, status } = useChat({
id: chatData.id,
messages: chatData.messages,
resume, // Enable automatic stream resumption
transport: new DefaultChatTransport({
// You must send the id of the chat
prepareSendMessagesRequest: ({ id, messages }) =\> {
return {
body: {
id,
message: messages[messages.length - 1],
},
};
},
}),
});
return \<div\>{/\* Your chat UI \*/}\</div\>;
}
`
```
You must send the chat ID with each request (see
`prepareSendMessagesRequest`).
When you enable `resume`, the `useChat` hook makes a `GET` request to `/api/chat/[id]/stream` on mount to check for and resume any active streams.
Let's start by creating the POST handler to create the resumable stream.
### [2. Create the POST handler](#2-create-the-post-handler)
The POST handler creates resumable streams using the `consumeSseStream` callback:
app/api/chat/route.ts
```
`
import { openai } from '@ai-sdk/openai';
import { readChat, saveChat } from '@util/chat-store';
import {
convertToModelMessages,
generateId,
streamText,
type UIMessage,
} from 'ai';
import { after } from 'next/server';
import { createResumableStreamContext } from 'resumable-stream';
export async function POST(req: Request) {
const {
message,
id,
}: {
message: UIMessage | undefined;
id: string;
} = await req.json();
const chat = await readChat(id);
let messages = chat.messages;
messages = [...messages, message!];
// Clear any previous active stream and save the user message
saveChat({ id, messages, activeStreamId: null });
const result = streamText({
model: 'openai/gpt-5-mini',
messages: await convertToModelMessages(messages),
});
return result.toUIMessageStreamResponse({
originalMessages: messages,
generateMessageId: generateId,
onFinish: ({ messages }) =\> {
// Clear the active stream when finished
saveChat({ id, messages, activeStreamId: null });
},
async consumeSseStream({ stream }) {
const streamId = generateId();
// Create a resumable stream from the SSE stream
const streamContext = createResumableStreamContext({ waitUntil: after });
await streamContext.createNewResumableStream(streamId, () =\> stream);
// Update the chat with the active stream ID
saveChat({ id, activeStreamId: streamId });
},
});
}
`
```
### [3. Implement the GET handler](#3-implement-the-get-handler)
Create a GET handler at `/api/chat/[id]/stream` that:
1. Reads the chat ID from the route params
2. Loads the chat data to check for an active stream
3. Returns 204 (No Content) if no stream is active
4. Resumes the existing stream if one is found
app/api/chat/[id]/stream/route.ts
```
`
import { readChat } from '@util/chat-store';
import { UI\_MESSAGE\_STREAM\_HEADERS } from 'ai';
import { after } from 'next/server';
import { createResumableStreamContext } from 'resumable-stream';
export async function GET(
\_: Request,
{ params }: { params: Promise\<{ id: string }\> },
) {
const { id } = await params;
const chat = await readChat(id);
if (chat.activeStreamId == null) {
// no content response when there is no active stream
return new Response(null, { status: 204 });
}
const streamContext = createResumableStreamContext({
waitUntil: after,
});
return new Response(
await streamContext.resumeExistingStream(chat.activeStreamId),
{ headers: UI\_MESSAGE\_STREAM\_HEADERS },
);
}
`
```
The `after` function from Next.js allows work to continue after the response
has been sent. This ensures that the resumable stream persists in Redis even
after the initial response is returned to the client, enabling reconnection
later.
## [How it works](#how-it-works)
### [Request lifecycle](#request-lifecycle)
The diagram above shows the complete lifecycle of a resumable stream:
1. **Stream creation**: When you send a new message, the POST handler uses `streamText` to generate the response. The `consumeSseStream` callback creates a resumable stream with a unique ID and stores it in Redis through the `resumable-stream` package
2. **Stream tracking**: Your persistence layer saves the `activeStreamId` in the chat data
3. **Client reconnection**: When the client reconnects (page reload), the `resume` option triggers a GET request to `/api/chat/[id]/stream`
4. **Stream recovery**: The GET handler checks for an `activeStreamId` and uses `resumeExistingStream` to reconnect. If no active stream exists, it returns a 204 (No Content) response
5. **Completion cleanup**: When the stream finishes, the `onFinish` callback clears the `activeStreamId` by setting it to `null`
## [Customize the resume endpoint](#customize-the-resume-endpoint)
By default, the `useChat` hook makes a GET request to `/api/chat/[id]/stream` when resuming. Customize this endpoint, credentials, and headers, using the `prepareReconnectToStreamRequest` option in `DefaultChatTransport`:
app/chat/[chatId]/chat.tsx
```
`
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport } from 'ai';
export function Chat({ chatData, resume }) {
const { messages, sendMessage } = useChat({
id: chatData.id,
messages: chatData.messages,
resume,
transport: new DefaultChatTransport({
// Customize reconnect settings (optional)
prepareReconnectToStreamRequest: ({ id }) =\> {
return {
api: `/api/chat/${id}/stream`, // Default pattern
// Or use a different pattern:
// api: `/api/streams/${id}/resume`,
// api: `/api/resume-chat?id=${id}`,
credentials: 'include', // Include cookies/auth
headers: {
Authorization: 'Bearer token',
'X-Custom-Header': 'value',
},
};
},
}),
});
return \<div\>{/\* Your chat UI \*/}\</div\>;
}
`
```
This lets you:
* Match your existing API route structure
* Add query parameters or custom paths
* Integrate with different backend architectures
## [Important considerations](#important-considerations)
* **Incompatibility with abort**: Stream resumption is not compatible with abort functionality. Closing a tab or refreshing the page triggers an abort signal that will break the resumption mechanism. Do not use `resume: true` if you need abort functionality in your application
* **Stream expiration**: Streams in Redis expire after a set time (configurable in the `resumable-stream` package)
* **Multiple clients**: Multiple clients can connect to the same stream simultaneously
* **Error handling**: When no active stream exists, the GET handler returns a 204 (No Content) status code
* **Security**: Ensure proper authentication and authorization for both creating and resuming streams
* **Race conditions**: Clear the `activeStreamId` when starting a new stream to prevent resuming outdated streams
[
View Example on GitHub
](https://github.com/vercel/ai/blob/main/examples/next)
On this page
[Chatbot Resume Streams](#chatbot-resume-streams)
[How stream resumption works](#how-stream-resumption-works)
[Prerequisites](#prerequisites)
[Implementation](#implementation)
[1. Client-side: Enable stream resumption](#1-client-side-enable-stream-resumption)
[2. Create the POST handler](#2-create-the-post-handler)
[3. Implement the GET handler](#3-implement-the-get-handler)
[How it works](#how-it-works)
[Request lifecycle](#request-lifecycle)
[Customize the resume endpoint](#customize-the-resume-endpoint)
[Important considerations](#important-considerations)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)