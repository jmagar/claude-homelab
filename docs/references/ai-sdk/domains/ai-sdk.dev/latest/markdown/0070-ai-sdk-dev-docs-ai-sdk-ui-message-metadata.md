AI SDK UI: Message Metadata
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
# [Message Metadata](#message-metadata)
Message metadata allows you to attach custom information to messages at the message level. This is useful for tracking timestamps, model information, token usage, user context, and other message-level data.
## [Overview](#overview)
Message metadata differs from [data parts](/docs/ai-sdk-ui/streaming-data) in that it's attached at the message level rather than being part of the message content. While data parts are ideal for dynamic content that forms part of the message, metadata is perfect for information about the message itself.
## [Getting Started](#getting-started)
Here's a simple example of using message metadata to track timestamps and model information:
### [Defining Metadata Types](#defining-metadata-types)
First, define your metadata type for type safety:
app/types.ts
```
`
import { UIMessage } from 'ai';
import { z } from 'zod';
// Define your metadata schema
export const messageMetadataSchema = z.object({
createdAt: z.number().optional(),
model: z.string().optional(),
totalTokens: z.number().optional(),
});
export type MessageMetadata = z.infer\<typeof messageMetadataSchema\>;
// Create a typed UIMessage
export type MyUIMessage = UIMessage\<MessageMetadata\>;
`
```
### [Sending Metadata from the Server](#sending-metadata-from-the-server)
Use the `messageMetadata` callback in `toUIMessageStreamResponse` to send metadata at different streaming stages:
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/chat/route.ts
```
`
import { convertToModelMessages, streamText } from 'ai';
import type { MyUIMessage } from '@/types';
export async function POST(req: Request) {
const { messages }: { messages: MyUIMessage[] } = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: await convertToModelMessages(messages),
});
return result.toUIMessageStreamResponse({
originalMessages: messages, // pass this in for type-safe return objects
messageMetadata: ({ part }) =\> {
// Send metadata when streaming starts
if (part.type === 'start') {
return {
createdAt: Date.now(),
model: 'your-model-id',
};
}
// Send additional metadata when streaming completes
if (part.type === 'finish') {
return {
totalTokens: part.totalUsage.totalTokens,
};
}
},
});
}
`
```
To enable type-safe metadata return object in `messageMetadata`, pass in the
`originalMessages` parameter typed to your UIMessage type.
### [Accessing Metadata on the Client](#accessing-metadata-on-the-client)
Access metadata through the `message.metadata` property:
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport } from 'ai';
import type { MyUIMessage } from '@/types';
export default function Chat() {
const { messages } = useChat\<MyUIMessage\>({
transport: new DefaultChatTransport({
api: '/api/chat',
}),
});
return (
\<div\>
{messages.map(message =\> (
\<div key={message.id}\>
\<div\>
{message.role === 'user' ? 'User: ' : 'AI: '}
{message.metadata?.createdAt && (
\<span className="text-sm text-gray-500"\>
{new Date(message.metadata.createdAt).toLocaleTimeString()}
\</span\>
)}
\</div\>
{/\* Render message content \*/}
{message.parts.map((part, index) =\>
part.type === 'text' ? \<div key={index}\>{part.text}\</div\> : null,
)}
{/\* Display additional metadata \*/}
{message.metadata?.totalTokens && (
\<div className="text-xs text-gray-400"\>
{message.metadata.totalTokens} tokens
\</div\>
)}
\</div\>
))}
\</div\>
);
}
`
```
For streaming arbitrary data that changes during generation, consider using
[data parts](/docs/ai-sdk-ui/streaming-data) instead.
## [Common Use Cases](#common-use-cases)
Message metadata is ideal for:
* **Timestamps**: When messages were created or completed
* **Model Information**: Which AI model was used
* **Token Usage**: Track costs and usage limits
* **User Context**: User IDs, session information
* **Performance Metrics**: Generation time, time to first token
* **Quality Indicators**: Finish reason, confidence scores
## [See Also](#see-also)
* [Chatbot Guide](/docs/ai-sdk-ui/chatbot#message-metadata) - Message metadata in the context of building chatbots
* [Streaming Data](/docs/ai-sdk-ui/streaming-data#message-metadata-vs-data-parts) - Comparison with data parts
* [UIMessage Reference](/docs/reference/ai-sdk-core/ui-message) - Complete UIMessage type reference
On this page
[Message Metadata](#message-metadata)
[Overview](#overview)
[Getting Started](#getting-started)
[Defining Metadata Types](#defining-metadata-types)
[Sending Metadata from the Server](#sending-metadata-from-the-server)
[Accessing Metadata on the Client](#accessing-metadata-on-the-client)
[Common Use Cases](#common-use-cases)
[See Also](#see-also)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)