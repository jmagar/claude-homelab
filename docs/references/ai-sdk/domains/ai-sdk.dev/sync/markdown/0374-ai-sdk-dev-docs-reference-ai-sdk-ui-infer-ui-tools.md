AI SDK UI: InferUITools
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
# [InferUITools](#inferuitools)
Infers the input and output types of a `ToolSet`.
This type helper is useful when working with tools in TypeScript to ensure type safety for your tool inputs and outputs in `UIMessage`s.
## [Import](#import)
```
`
import { InferUITools } from 'ai';
`
```
## [API Signature](#api-signature)
### [Type Parameters](#type-parameters)
### TOOLS:
ToolSet
### [Returns](#returns)
A type that maps each tool in the tool set to its inferred input and output types.
The resulting type has the shape:
```
`
{
[NAME in keyof TOOLS & string]: {
input: InferToolInput\<TOOLS[NAME]\>;
output: InferToolOutput\<TOOLS[NAME]\>;
};
}
`
```
## [Examples](#examples)
### [Basic Usage](#basic-usage)
```
`
import { InferUITools } from 'ai';
import { z } from 'zod';
const tools = {
weather: {
description: 'Get the current weather',
inputSchema: z.object({
location: z.string().describe('The city and state'),
}),
execute: async ({ location }) =\> {
return `The weather in ${location} is sunny.`;
},
},
calculator: {
description: 'Perform basic arithmetic',
inputSchema: z.object({
operation: z.enum(['add', 'subtract', 'multiply', 'divide']),
a: z.number(),
b: z.number(),
}),
execute: async ({ operation, a, b }) =\> {
switch (operation) {
case 'add':
return a + b;
case 'subtract':
return a - b;
case 'multiply':
return a \* b;
case 'divide':
return a / b;
}
},
},
};
// Infer the types from the tool set
type MyUITools = InferUITools\<typeof tools\>;
// This creates a type with:
// {
// weather: { input: { location: string }; output: string };
// calculator: { input: { operation: 'add' | 'subtract' | 'multiply' | 'divide'; a: number; b: number }; output: number };
// }
`
```
## [Related](#related)
* [`InferUITool`](/docs/reference/ai-sdk-ui/infer-ui-tool) - Infer types for a single tool
* [`useChat`](/docs/reference/ai-sdk-ui/use-chat) - Chat hook that supports typed tools
On this page
[InferUITools](#inferuitools)
[Import](#import)
[API Signature](#api-signature)
[Type Parameters](#type-parameters)
[Returns](#returns)
[Examples](#examples)
[Basic Usage](#basic-usage)
[Related](#related)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)