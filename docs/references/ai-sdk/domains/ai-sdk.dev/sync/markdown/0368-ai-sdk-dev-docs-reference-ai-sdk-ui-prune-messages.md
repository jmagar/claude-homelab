AI SDK UI: pruneMessages
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
# [`pruneMessages()`](#prunemessages)
The `pruneMessages` function is used to prune or filter an array of `ModelMessage` objects. This is useful for reducing message context (to save tokens), removing intermediate reasoning, or trimming tool calls and empty messages before sending to an LLM.
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/chat/route.ts
```
`
import { pruneMessages, streamText } from 'ai';
export async function POST(req: Request) {
const { messages } = await req.json();
const prunedMessages = pruneMessages({
messages,
reasoning: 'before-last-message',
toolCalls: 'before-last-2-messages',
emptyMessages: 'remove',
});
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: prunedMessages,
});
return result.toUIMessageStreamResponse();
}
`
```
## [Import](#import)
```
import { pruneMessages } from "ai"
```
## [API Signature](#api-signature)
### [Parameters](#parameters)
### messages:
ModelMessage[]
### reasoning:
'all' | 'before-last-message' | 'none'
### toolCalls:
'all' | 'before-last-message' | 'before-last-${number}-messages' | 'none' | Array\<{ type: 'all' | 'before-last-message' | 'before-last-${number}-messages'; tools?: string[] }\>
### emptyMessages:
'keep' | 'remove'
### [Returns](#returns)
An array of [`ModelMessage`](/docs/reference/ai-sdk-core/model-message) objects, pruned according to the provided options.
### ModelMessage[]:
Array
## [Example Usage](#example-usage)
```
`
import { pruneMessages } from 'ai';
const pruned = pruneMessages({
messages,
reasoning: 'all', // Remove all reasoning parts
toolCalls: 'before-last-message', // Remove tool calls except those in the last message
});
`
```
## [Pruning Options](#pruning-options)
* **reasoning:** Removes reasoning parts from assistant messages. Use `'all'` to remove all, `'before-last-message'` to keep reasoning in the last message, or `'none'` to retain all reasoning.
* **toolCalls:** Prune tool-call, tool-result, and tool-approval chunks from assistant/tool messages. Default is an empty array (no pruning). Options include:
* `'all'`: Prune all such content.
* `'before-last-message'`: Prune except in the last message.
* `'before-last-N-messages'`: Prune except in the last N messages.
* `'none'`: Do not prune.
* Or provide an array for per-tool fine control, e.g., `[{ type: 'before-last-message', tools: ['search', 'calculator'] }]` to prune only specific tools.
* **emptyMessages:** Set to `'remove'` (default) to exclude messages that have no content after pruning.
>
**> Tip
**> :
`> pruneMessages
`> is typically used prior to sending a context window to an LLM to reduce message/token count, especially after a series of tool-calls and approvals.
>
For advanced usage and the full list of possible message parts, see [`ModelMessage`](/docs/reference/ai-sdk-core/model-message) and [`pruneMessages` implementation](https://github.com/vercel/ai/blob/main/packages/ai/src/generate-text/prune-messages.ts).
On this page
[pruneMessages()](#prunemessages)
[Import](#import)
[API Signature](#api-signature)
[Parameters](#parameters)
[Returns](#returns)
[Example Usage](#example-usage)
[Pruning Options](#pruning-options)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)