AI SDK UI: Chatbot Message Persistence
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
# [Chatbot Message Persistence](#chatbot-message-persistence)
Being able to store and load chat messages is crucial for most AI chatbots.
In this guide, we'll show how to implement message persistence with `useChat` and `streamText`.
This guide does not cover authorization, error handling, or other real-world
considerations. It is intended to be a simple example of how to implement
message persistence.
## [Starting a new chat](#starting-a-new-chat)
When the user navigates to the chat page without providing a chat ID,
we need to create a new chat and redirect to the chat page with the new chat ID.
app/chat/page.tsx
```
`
import { redirect } from 'next/navigation';
import { createChat } from '@util/chat-store';
export default async function Page() {
const id = await createChat(); // create a new chat
redirect(`/chat/${id}`); // redirect to chat page, see below
}
`
```
Our example chat store implementation uses files to store the chat messages.
In a real-world application, you would use a database or a cloud storage service,
and get the chat ID from the database.
That being said, the function interfaces are designed to be easily replaced with other implementations.
util/chat-store.ts
```
`
import { generateId } from 'ai';
import { existsSync, mkdirSync } from 'fs';
import { writeFile } from 'fs/promises';
import path from 'path';
export async function createChat(): Promise\<string\> {
const id = generateId(); // generate a unique chat ID
await writeFile(getChatFile(id), '[]'); // create an empty chat file
return id;
}
function getChatFile(id: string): string {
const chatDir = path.join(process.cwd(), '.chats');
if (!existsSync(chatDir)) mkdirSync(chatDir, { recursive: true });
return path.join(chatDir, `${id}.json`);
}
`
```
## [Loading an existing chat](#loading-an-existing-chat)
When the user navigates to the chat page with a chat ID, we need to load the chat messages from storage.
The `loadChat` function in our file-based chat store is implemented as follows:
util/chat-store.ts
```
`
import { UIMessage } from 'ai';
import { readFile } from 'fs/promises';
export async function loadChat(id: string): Promise\<UIMessage[]\> {
return JSON.parse(await readFile(getChatFile(id), 'utf8'));
}
// ... rest of the file
`
```
## [Validating messages on the server](#validating-messages-on-the-server)
When processing messages on the server that contain tool calls, custom metadata, or data parts, you should validate them using `validateUIMessages` before sending them to the model.
### [Validation with tools](#validation-with-tools)
When your messages include tool calls, validate them against your tool definitions:
app/api/chat/route.ts
```
`
import {
convertToModelMessages,
streamText,
UIMessage,
validateUIMessages,
tool,
} from 'ai';
import { z } from 'zod';
import { loadChat, saveChat } from '@util/chat-store';
import { dataPartsSchema, metadataSchema } from '@util/schemas';
// Define your tools
const tools = {
weather: tool({
description: 'Get weather information',
parameters: z.object({
location: z.string(),
units: z.enum(['celsius', 'fahrenheit']),
}),
execute: async ({ location, units }) =\> {
/\* tool implementation \*/
},
}),
// other tools
};
export async function POST(req: Request) {
const { message, id } = await req.json();
// Load previous messages from database
const previousMessages = await loadChat(id);
// Append new message to previousMessages messages
const messages = [...previousMessages, message];
// Validate loaded messages against
// tools, data parts schema, and metadata schema
const validatedMessages = await validateUIMessages({
messages,
tools, // Ensures tool calls in messages match current schemas
dataPartsSchema,
metadataSchema,
});
const result = streamText({
model: 'openai/gpt-5-mini',
messages: convertToModelMessages(validatedMessages),
tools,
});
return result.toUIMessageStreamResponse({
originalMessages: messages,
onFinish: ({ messages }) =\> {
saveChat({ chatId: id, messages });
},
});
}
`
```
### [Handling validation errors](#handling-validation-errors)
Handle validation errors gracefully when messages from the database don't match current schemas:
app/api/chat/route.ts
```
`
import {
convertToModelMessages,
streamText,
validateUIMessages,
TypeValidationError,
} from 'ai';
import { type MyUIMessage } from '@/types';
export async function POST(req: Request) {
const { message, id } = await req.json();
// Load and validate messages from database
let validatedMessages: MyUIMessage[];
try {
const previousMessages = await loadMessagesFromDB(id);
validatedMessages = await validateUIMessages({
// append the new message to the previous messages:
messages: [...previousMessages, message],
tools,
metadataSchema,
});
} catch (error) {
if (error instanceof TypeValidationError) {
// Log validation error for monitoring
console.error('Database messages validation failed:', error);
// Could implement message migration or filtering here
// For now, start with empty history
validatedMessages = [];
} else {
throw error;
}
}
// Continue with validated messages...
}
`
```
## [Displaying the chat](#displaying-the-chat)
Once messages are loaded from storage, you can display them in your chat UI. Here's how to set up the page component and the chat display:
app/chat/[id]/page.tsx
```
`
import { loadChat } from '@util/chat-store';
import Chat from '@ui/chat';
export default async function Page(props: { params: Promise\<{ id: string }\> }) {
const { id } = await props.params;
const messages = await loadChat(id);
return \<Chat id={id} initialMessages={messages} /\>;
}
`
```
The chat component uses the `useChat` hook to manage the conversation:
ui/chat.tsx
```
`
'use client';
import { UIMessage, useChat } from '@ai-sdk/react';
import { DefaultChatTransport } from 'ai';
import { useState } from 'react';
export default function Chat({
id,
initialMessages,
}: { id?: string | undefined; initialMessages?: UIMessage[] } = {}) {
const [input, setInput] = useState('');
const { sendMessage, messages } = useChat({
id, // use the provided chat ID
messages: initialMessages, // load initial messages
transport: new DefaultChatTransport({
api: '/api/chat',
}),
});
const handleSubmit = (e: React.FormEvent) =\> {
e.preventDefault();
if (input.trim()) {
sendMessage({ text: input });
setInput('');
}
};
// simplified rendering code, extend as needed:
return (
\<div\>
{messages.map(m =\> (
\<div key={m.id}\>
{m.role === 'user' ? 'User: ' : 'AI: '}
{m.parts
.map(part =\> (part.type === 'text' ? part.text : ''))
.join('')}
\</div\>
))}
\<form onSubmit={handleSubmit}\>
\<input
value={input}
onChange={e =\> setInput(e.target.value)}
placeholder="Type a message..."
/\>
\<button type="submit"\>Send\</button\>
\</form\>
\</div\>
);
}
`
```
## [Storing messages](#storing-messages)
`useChat` sends the chat id and the messages to the backend.
The `useChat` message format is different from the `ModelMessage` format. The
`useChat` message format is designed for frontend display, and contains
additional fields such as `id` and `createdAt`. We recommend storing the
messages in the `useChat` message format.
When loading messages from storage that contain tools, metadata, or custom data
parts, validate them using `validateUIMessages` before processing (see the
[validation section](#validating-messages-from-database) above).
Storing messages is done in the `onFinish` callback of the `toUIMessageStreamResponse` function.
`onFinish` receives the complete messages including the new AI response as `UIMessage[]`.
app/api/chat/route.ts
```
`
import { openai } from '@ai-sdk/openai';
import { saveChat } from '@util/chat-store';
import { convertToModelMessages, streamText, UIMessage } from 'ai';
export async function POST(req: Request) {
const { messages, chatId }: { messages: UIMessage[]; chatId: string } =
await req.json();
const result = streamText({
model: 'openai/gpt-5-mini',
messages: await convertToModelMessages(messages),
});
return result.toUIMessageStreamResponse({
originalMessages: messages,
onFinish: ({ messages }) =\> {
saveChat({ chatId, messages });
},
});
}
`
```
The actual storage of the messages is done in the `saveChat` function, which in
our file-based chat store is implemented as follows:
util/chat-store.ts
```
`
import { UIMessage } from 'ai';
import { writeFile } from 'fs/promises';
export async function saveChat({
chatId,
messages,
}: {
chatId: string;
messages: UIMessage[];
}): Promise\<void\> {
const content = JSON.stringify(messages, null, 2);
await writeFile(getChatFile(chatId), content);
}
// ... rest of the file
`
```
## [Message IDs](#message-ids)
In addition to a chat ID, each message has an ID.
You can use this message ID to e.g. manipulate individual messages.
### [Client-side vs Server-side ID Generation](#client-side-vs-server-side-id-generation)
By default, message IDs are generated client-side:
* User message IDs are generated by the `useChat` hook on the client
* AI response message IDs are generated by `streamText` on the server
For applications without persistence, client-side ID generation works perfectly.
However, **for persistence, you need server-side generated IDs** to ensure consistency across sessions and prevent ID conflicts when messages are stored and retrieved.
### [Setting Up Server-side ID Generation](#setting-up-server-side-id-generation)
When implementing persistence, you have two options for generating server-side IDs:
1. **Using `generateMessageId` in `toUIMessageStreamResponse`**
2. **Setting IDs in your start message part with `createUIMessageStream`**
#### [Option 1: Using `generateMessageId` in `toUIMessageStreamResponse`](#option-1-using-generatemessageid-in-touimessagestreamresponse)
You can control the ID format by providing ID generators using [`createIdGenerator()`](/docs/reference/ai-sdk-core/create-id-generator):
app/api/chat/route.ts
```
`
import { createIdGenerator, streamText } from 'ai';
export async function POST(req: Request) {
// ...
const result = streamText({
// ...
});
return result.toUIMessageStreamResponse({
originalMessages: messages,
// Generate consistent server-side IDs for persistence:
generateMessageId: createIdGenerator({
prefix: 'msg',
size: 16,
}),
onFinish: ({ messages }) =\> {
saveChat({ chatId, messages });
},
});
}
`
```
#### [Option 2: Setting IDs with `createUIMessageStream`](#option-2-setting-ids-with-createuimessagestream)
Alternatively, you can use `createUIMessageStream` to control the message ID by writing a start message part:
app/api/chat/route.ts
```
`
import {
generateId,
streamText,
createUIMessageStream,
createUIMessageStreamResponse,
} from 'ai';
export async function POST(req: Request) {
const { messages, chatId } = await req.json();
const stream = createUIMessageStream({
execute: ({ writer }) =\> {
// Write start message part with custom ID
writer.write({
type: 'start',
messageId: generateId(), // Generate server-side ID for persistence
});
const result = streamText({
model: 'openai/gpt-5-mini',
messages: await convertToModelMessages(messages),
});
writer.merge(result.toUIMessageStream({ sendStart: false })); // omit start message part
},
originalMessages: messages,
onFinish: ({ responseMessage }) =\> {
// save your chat here
},
});
return createUIMessageStreamResponse({ stream });
}
`
```
For client-side applications that don't require persistence, you can still customize client-side ID generation:
ui/chat.tsx
```
`
import { createIdGenerator } from 'ai';
import { useChat } from '@ai-sdk/react';
const { ... } = useChat({
generateId: createIdGenerator({
prefix: 'msgc',
size: 16,
}),
// ...
});
`
```
## [Sending only the last message](#sending-only-the-last-message)
Once you have implemented message persistence, you might want to send only the last message to the server.
This reduces the amount of data sent to the server on each request and can improve performance.
To achieve this, you can provide a `prepareSendMessagesRequest` function to the transport.
This function receives the messages and the chat ID, and returns the request body to be sent to the server.
ui/chat.tsx
```
`
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport } from 'ai';
const {
// ...
} = useChat({
// ...
transport: new DefaultChatTransport({
api: '/api/chat',
// only send the last message to the server:
prepareSendMessagesRequest({ messages, id }) {
return { body: { message: messages[messages.length - 1], id } };
},
}),
});
`
```
On the server, you can then load the previous messages and append the new message to the previous messages. If your messages contain tools, metadata, or custom data parts, you should validate them:
app/api/chat/route.ts
```
`
import { convertToModelMessages, UIMessage, validateUIMessages } from 'ai';
// import your tools and schemas
export async function POST(req: Request) {
// get the last message from the client:
const { message, id } = await req.json();
// load the previous messages from the server:
const previousMessages = await loadChat(id);
// validate messages if they contain tools, metadata, or data parts:
const validatedMessages = await validateUIMessages({
// append the new message to the previous messages:
messages: [...previousMessages, message],
tools, // if using tools
metadataSchema, // if using custom metadata
dataSchemas, // if using custom data parts
});
const result = streamText({
// ...
messages: convertToModelMessages(validatedMessages),
});
return result.toUIMessageStreamResponse({
originalMessages: validatedMessages,
onFinish: ({ messages }) =\> {
saveChat({ chatId: id, messages });
},
});
}
`
```
## [Handling client disconnects](#handling-client-disconnects)
By default, the AI SDK `streamText` function uses backpressure to the language model provider to prevent
the consumption of tokens that are not yet requested.
However, this means that when the client disconnects, e.g. by closing the browser tab or because of a network issue,
the stream from the LLM will be aborted and the conversation may end up in a broken state.
Assuming that you have a [storage solution](#storing-messages) in place, you can use the `consumeStream` method to consume the stream on the backend,
and then save the result as usual.
`consumeStream` effectively removes the backpressure,
meaning that the result is stored even when the client has already disconnected.
app/api/chat/route.ts
```
`
import { convertToModelMessages, streamText, UIMessage } from 'ai';
import { saveChat } from '@util/chat-store';
export async function POST(req: Request) {
const { messages, chatId }: { messages: UIMessage[]; chatId: string } =
await req.json();
const result = streamText({
model,
messages: await convertToModelMessages(messages),
});
// consume the stream to ensure it runs to completion & triggers onFinish
// even when the client response is aborted:
result.consumeStream(); // no await
return result.toUIMessageStreamResponse({
originalMessages: messages,
onFinish: ({ messages }) =\> {
saveChat({ chatId, messages });
},
});
}
`
```
When the client reloads the page after a disconnect, the chat will be restored from the storage solution.
In production applications, you would also track the state of the request (in
progress, complete) in your stored messages and use it on the client to cover
the case where the client reloads the page after a disconnection, but the
streaming is not yet complete.
For more robust handling of disconnects, you may want to add resumability on disconnects. Check out the [Chatbot Resume Streams](/docs/ai-sdk-ui/chatbot-resume-streams) documentation to learn more.
On this page
[Chatbot Message Persistence](#chatbot-message-persistence)
[Starting a new chat](#starting-a-new-chat)
[Loading an existing chat](#loading-an-existing-chat)
[Validating messages on the server](#validating-messages-on-the-server)
[Validation with tools](#validation-with-tools)
[Handling validation errors](#handling-validation-errors)
[Displaying the chat](#displaying-the-chat)
[Storing messages](#storing-messages)
[Message IDs](#message-ids)
[Client-side vs Server-side ID Generation](#client-side-vs-server-side-id-generation)
[Setting Up Server-side ID Generation](#setting-up-server-side-id-generation)
[Option 1: Using generateMessageId in toUIMessageStreamResponse](#option-1-using-generatemessageid-in-touimessagestreamresponse)
[Option 2: Setting IDs with createUIMessageStream](#option-2-setting-ids-with-createuimessagestream)
[Sending only the last message](#sending-only-the-last-message)
[Handling client disconnects](#handling-client-disconnects)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)