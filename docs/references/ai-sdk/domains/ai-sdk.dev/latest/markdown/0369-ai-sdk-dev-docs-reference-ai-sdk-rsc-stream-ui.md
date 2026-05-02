AI SDK RSC: streamUI
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
[streamUI](/docs/reference/ai-sdk-rsc/stream-ui)
[createAI](/docs/reference/ai-sdk-rsc/create-ai)
[createStreamableUI](/docs/reference/ai-sdk-rsc/create-streamable-ui)
[createStreamableValue](/docs/reference/ai-sdk-rsc/create-streamable-value)
[readStreamableValue](/docs/reference/ai-sdk-rsc/read-streamable-value)
[getAIState](/docs/reference/ai-sdk-rsc/get-ai-state)
[getMutableAIState](/docs/reference/ai-sdk-rsc/get-mutable-ai-state)
[useAIState](/docs/reference/ai-sdk-rsc/use-ai-state)
[useActions](/docs/reference/ai-sdk-rsc/use-actions)
[useUIState](/docs/reference/ai-sdk-rsc/use-ui-state)
[useStreamableValue](/docs/reference/ai-sdk-rsc/use-streamable-value)
[render (Removed)](/docs/reference/ai-sdk-rsc/render)
[AI SDK Errors](/docs/reference/ai-sdk-errors)
[Migration Guides](/docs/migration-guides)
[Troubleshooting](/docs/troubleshooting)
Copy markdown
# [`streamUI`](#streamui)
AI SDK RSC is currently experimental. We recommend using [AI SDK
UI](/docs/ai-sdk-ui/overview) for production. For guidance on migrating from
RSC to UI, see our [migration guide](/docs/ai-sdk-rsc/migrating-to-ui).
A helper function to create a streamable UI from LLM providers. This function is similar to AI SDK Core APIs and supports the same model interfaces.
To see `streamUI` in action, check out [these examples](#examples).
## [Import](#import)
```
import { streamUI } from "@ai-sdk/rsc"
```
## [Parameters](#parameters)
### model:
LanguageModel
### initial?:
ReactNode
### system:
string | SystemModelMessage | SystemModelMessage[]
### prompt:
string
### messages:
Array\<SystemModelMessage | UserModelMessage | AssistantModelMessage | ToolModelMessage\> | Array\<UIMessage\>
SystemModelMessage
### role:
'system'
### content:
string
UserModelMessage
### role:
'user'
### content:
string | Array\<TextPart | ImagePart | FilePart\>
TextPart
### type:
'text'
### text:
string
ImagePart
### type:
'image'
### image:
string | Uint8Array | Buffer | ArrayBuffer | URL
### mediaType?:
string
FilePart
### type:
'file'
### data:
string | Uint8Array | Buffer | ArrayBuffer | URL
### mediaType:
string
AssistantModelMessage
### role:
'assistant'
### content:
string | Array\<TextPart | ToolCallPart\>
TextPart
### type:
'text'
### text:
string
ToolCallPart
### type:
'tool-call'
### toolCallId:
string
### toolName:
string
### args:
object based on zod schema
ToolModelMessage
### role:
'tool'
### content:
Array\<ToolResultPart\>
ToolResultPart
### type:
'tool-result'
### toolCallId:
string
### toolName:
string
### result:
unknown
### isError?:
boolean
### maxOutputTokens?:
number
### temperature?:
number
### topP?:
number
### topK?:
number
### presencePenalty?:
number
### frequencyPenalty?:
number
### stopSequences?:
string[]
### seed?:
number
### maxRetries?:
number
### abortSignal?:
AbortSignal
### headers?:
Record\<string, string\>
### tools:
ToolSet
Tool
### description?:
string
### inputSchema:
zod schema
### generate?:
(async (parameters) =\> ReactNode) | AsyncGenerator\<ReactNode, ReactNode, void\>
### toolChoice?:
"auto" | "none" | "required" | { "type": "tool", "toolName": string }
### text?:
(Text) =\> ReactNode
Text
### content:
string
### delta:
string
### done:
boolean
### providerOptions?:
Record\<string,JSONObject\> | undefined
### onFinish?:
(result: OnFinishResult) =\> void
OnFinishResult
### usage:
LanguageModelUsage
LanguageModelUsage
### inputTokens:
number | undefined
### inputTokenDetails:
LanguageModelInputTokenDetails
LanguageModelInputTokenDetails
### noCacheTokens:
number | undefined
### cacheReadTokens:
number | undefined
### cacheWriteTokens:
number | undefined
### outputTokens:
number | undefined
### outputTokenDetails:
LanguageModelOutputTokenDetails
LanguageModelOutputTokenDetails
### textTokens:
number | undefined
### reasoningTokens:
number | undefined
### totalTokens:
number | undefined
### raw?:
object | undefined
### value:
ReactNode
### warnings:
Warning[] | undefined
### response:
Response
Response
### headers?:
Record\<string, string\>
## [Returns](#returns)
### value:
ReactNode
### response?:
Response
Response
### headers?:
Record\<string, string\>
### warnings:
Warning[] | undefined
### stream:
AsyncIterable\<StreamPart\> & ReadableStream\<StreamPart\>
StreamPart
### type:
'text-delta'
### textDelta:
string
StreamPart
### type:
'tool-call'
### toolCallId:
string
### toolName:
string
### args:
object based on zod schema
StreamPart
### type:
'error'
### error:
Error
StreamPart
### type:
'finish'
### finishReason:
'stop' | 'length' | 'content-filter' | 'tool-calls' | 'error' | 'other'
### usage:
LanguageModelUsage
LanguageModelUsage
### inputTokens:
number | undefined
### inputTokenDetails:
LanguageModelInputTokenDetails
LanguageModelInputTokenDetails
### noCacheTokens:
number | undefined
### cacheReadTokens:
number | undefined
### cacheWriteTokens:
number | undefined
### outputTokens:
number | undefined
### outputTokenDetails:
LanguageModelOutputTokenDetails
LanguageModelOutputTokenDetails
### textTokens:
number | undefined
### reasoningTokens:
number | undefined
### totalTokens:
number | undefined
### raw?:
object | undefined
## [Examples](#examples)
[
Learn to render a React component as a function call using a language model in Next.js
](/examples/next-app/state-management/ai-ui-states)[
Learn to persist and restore states UI/AI states in Next.js
](/examples/next-app/state-management/save-and-restore-states)[
Learn to route React components using a language model in Next.js
](/examples/next-app/interface/route-components)[
Learn to stream component updates to the client in Next.js
](/examples/next-app/interface/stream-component-updates)
On this page
[streamUI](#streamui)
[Import](#import)
[Parameters](#parameters)
[Returns](#returns)
[Examples](#examples)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)