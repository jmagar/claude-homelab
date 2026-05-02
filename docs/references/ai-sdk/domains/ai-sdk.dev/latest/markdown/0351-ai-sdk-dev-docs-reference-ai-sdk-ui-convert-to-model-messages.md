AI SDK UI: convertToModelMessages
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
[useChat](/docs/reference/ai-sdk-ui/use-chat)
[useCompletion](/docs/reference/ai-sdk-ui/use-completion)
[useObject](/docs/reference/ai-sdk-ui/use-object)
[convertToModelMessages](/docs/reference/ai-sdk-ui/convert-to-model-messages)
[pruneMessages](/docs/reference/ai-sdk-ui/prune-messages)
[createUIMessageStream](/docs/reference/ai-sdk-ui/create-ui-message-stream)
[createUIMessageStreamResponse](/docs/reference/ai-sdk-ui/create-ui-message-stream-response)
[pipeUIMessageStreamToResponse](/docs/reference/ai-sdk-ui/pipe-ui-message-stream-to-response)
[readUIMessageStream](/docs/reference/ai-sdk-ui/read-ui-message-stream)
[InferUITools](/docs/reference/ai-sdk-ui/infer-ui-tools)
[InferUITool](/docs/reference/ai-sdk-ui/infer-ui-tool)
[DirectChatTransport](/docs/reference/ai-sdk-ui/direct-chat-transport)
[AI SDK RSC](/docs/reference/ai-sdk-rsc)
[AI SDK Errors](/docs/reference/ai-sdk-errors)
[Migration Guides](/docs/migration-guides)
[Troubleshooting](/docs/troubleshooting)
Copy markdown
# [`convertToModelMessages()`](#converttomodelmessages)
The `convertToModelMessages` function is used to transform an array of UI messages from the `useChat` hook into an array of `ModelMessage` objects. These `ModelMessage` objects are compatible with AI core functions like `streamText`.
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/chat/route.ts
```
`
import { convertToModelMessages, streamText } from 'ai';
export async function POST(req: Request) {
const { messages } = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: await convertToModelMessages(messages),
});
return result.toUIMessageStreamResponse();
}
`
```
## [Import](#import)
```
import { convertToModelMessages } from "ai"
```
## [API Signature](#api-signature)
### [Parameters](#parameters)
### messages:
Message[]
### options:
{ tools?: ToolSet, ignoreIncompleteToolCalls?: boolean, convertDataPart?: (part: DataUIPart) =\> TextPart | FilePart | undefined }
### [Returns](#returns)
A Promise that resolves to an array of [`ModelMessage`](/docs/reference/ai-sdk-core/model-message) objects.
### Promise\<ModelMessage[]\>:
Promise
## [Multi-modal Tool Responses](#multi-modal-tool-responses)
The `convertToModelMessages` function supports tools that can return multi-modal content. This is useful when tools need to return non-text content like images.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { tool } from 'ai';
import { z } from 'zod';
const screenshotTool = tool({
inputSchema: z.object({}),
execute: async () =\> 'imgbase64',
toModelOutput: ({ output }) =\> [{ type: 'image', data: output }],
});
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: convertToModelMessages(messages, {
tools: {
screenshot: screenshotTool,
},
}),
});
`
```
Tools can implement the optional `toModelOutput` method to transform their results into multi-modal content. The content is an array of content parts, where each part has a `type` (e.g., 'text', 'image') and corresponding data.
## [Custom Data Part Conversion](#custom-data-part-conversion)
The `convertToModelMessages` function supports converting custom data parts attached to user messages. This is useful when users need to include additional context (URLs, code files, JSON configs) with their messages.
### [Basic Usage](#basic-usage)
By default, data parts in user messages are filtered out during conversion. To include them, provide a `convertDataPart` callback that transforms data parts into text or file parts that the model can understand:
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/chat/route.ts
```
`
import { convertToModelMessages, streamText } from 'ai';
type CustomUIMessage = UIMessage\<
never,
{
url: { url: string; title: string; content: string };
'code-file': { filename: string; code: string; language: string };
}
\>;
export async function POST(req: Request) {
const { messages } = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: convertToModelMessages\<CustomUIMessage\>(messages, {
convertDataPart: part =\> {
// Convert URL attachments to text
if (part.type === 'data-url') {
return {
type: 'text',
text: `[Reference: ${part.data.title}](${part.data.url})\\n\\n${part.data.content}`,
};
}
// Convert code file attachments
if (part.type === 'data-code-file') {
return {
type: 'text',
text: `\\`\\`\\`${part.data.language}\\n// ${part.data.filename}\\n${part.data.code}\\n\\`\\`\\``,
};
}
// Other data parts are ignored
},
}),
});
return result.toUIMessageStreamResponse();
}
`
```
### [Use Cases](#use-cases)
**Attaching URL Content**
Allow users to attach URLs to their messages, with the content fetched and formatted for the model:
```
`
// Client side
sendMessage({
parts: [
{ type: 'text', text: 'Analyze this article' },
{
type: 'data-url',
data: {
url: 'https://example.com/article',
title: 'Important Article',
content: '...',
},
},
],
});
`
```
**Including Code Files as Context**
Let users reference code files in their conversations:
```
`
convertDataPart: part =\> {
if (part.type === 'data-code-file') {
return {
type: 'text',
text: `\\`\\`\\`${part.data.language}\\n${part.data.code}\\n\\`\\`\\``,
};
}
};
`
```
**Selective Inclusion**
Only data parts for which you return a text or file model message part are included,
all other data parts are ignored.
```
`
const result = convertToModelMessages\<
UIMessage\<
unknown,
{
url: { url: string; title: string };
code: { code: string; language: string };
note: { text: string };
}
\>
\>(messages, {
convertDataPart: part =\> {
if (part.type === 'data-url') {
return {
type: 'text',
text: `[${part.data.title}](${part.data.url})`,
};
}
// data-code and data-node are ignored
},
});
`
```
### [Type Safety](#type-safety)
The generic parameter ensures full type safety for your custom data parts:
```
`
type MyUIMessage = UIMessage\<
unknown,
{
url: { url: string; content: string };
config: { key: string; value: string };
}
\>;
// TypeScript knows the exact shape of part.data
convertToModelMessages\<MyUIMessage\>(messages, {
convertDataPart: part =\> {
if (part.type === 'data-url') {
// part.data is typed as { url: string; content: string }
return { type: 'text', text: part.data.url };
}
// Return undefined to skip this part
},
});
`
```
On this page
[convertToModelMessages()](#converttomodelmessages)
[Import](#import)
[API Signature](#api-signature)
[Parameters](#parameters)
[Returns](#returns)
[Multi-modal Tool Responses](#multi-modal-tool-responses)
[Custom Data Part Conversion](#custom-data-part-conversion)
[Basic Usage](#basic-usage)
[Use Cases](#use-cases)
[Type Safety](#type-safety)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)