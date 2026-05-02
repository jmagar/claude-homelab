AI SDK UI: Reading UIMessage Streams
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
# [Reading UI Message Streams](#reading-ui-message-streams)
`UIMessage` streams are useful outside of traditional chat use cases. You can consume them for terminal UIs, custom stream processing on the client, or React Server Components (RSC).
The `readUIMessageStream` helper transforms a stream of `UIMessageChunk` objects into an `AsyncIterableStream` of `UIMessage` objects, allowing you to process messages as they're being constructed.
## [Basic Usage](#basic-usage)
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { readUIMessageStream, streamText } from 'ai';
async function main() {
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Write a short story about a robot.',
});
for await (const uiMessage of readUIMessageStream({
stream: result.toUIMessageStream(),
})) {
console.log('Current message state:', uiMessage);
}
}
`
```
## [Tool Calls Integration](#tool-calls-integration)
Handle streaming responses that include tool calls:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { readUIMessageStream, streamText, tool } from 'ai';
import { z } from 'zod';
async function handleToolCalls() {
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
tools: {
weather: tool({
description: 'Get the weather in a location',
inputSchema: z.object({
location: z.string().describe('The location to get the weather for'),
}),
execute: ({ location }) =\> ({
location,
temperature: 72 + Math.floor(Math.random() \* 21) - 10,
}),
}),
},
prompt: 'What is the weather in Tokyo?',
});
for await (const uiMessage of readUIMessageStream({
stream: result.toUIMessageStream(),
})) {
// Handle different part types
uiMessage.parts.forEach(part =\> {
switch (part.type) {
case 'text':
console.log('Text:', part.text);
break;
case 'tool-call':
console.log('Tool called:', part.toolName, 'with args:', part.args);
break;
case 'tool-result':
console.log('Tool result:', part.result);
break;
}
});
}
}
`
```
## [Resuming Conversations](#resuming-conversations)
Resume streaming from a previous message state:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { readUIMessageStream, streamText } from 'ai';
async function resumeConversation(lastMessage: UIMessage) {
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: [
{ role: 'user', content: 'Continue our previous conversation.' },
],
});
// Resume from the last message
for await (const uiMessage of readUIMessageStream({
stream: result.toUIMessageStream(),
message: lastMessage, // Resume from this message
})) {
console.log('Resumed message:', uiMessage);
}
}
`
```
On this page
[Reading UI Message Streams](#reading-ui-message-streams)
[Basic Usage](#basic-usage)
[Tool Calls Integration](#tool-calls-integration)
[Resuming Conversations](#resuming-conversations)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)