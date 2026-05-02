AI SDK RSC: render (Removed)
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
# [`render` (Removed)](#render-removed)
"render" has been removed in AI SDK 4.0.
AI SDK RSC is currently experimental. We recommend using [AI SDK
UI](/docs/ai-sdk-ui/overview) for production. For guidance on migrating from
RSC to UI, see our [migration guide](/docs/ai-sdk-rsc/migrating-to-ui).
A helper function to create a streamable UI from LLM providers. This function is similar to AI SDK Core APIs and supports the same model interfaces.
>
**> Note
**> :
`> render
`> has been deprecated in favor of
[`> streamUI
`](/docs/reference/ai-sdk-rsc/stream-ui)> . During migration, please ensure that the
`> messages
`> parameter follows the updated
[> specification
](/docs/reference/ai-sdk-rsc/stream-ui#messages)> .
>
## [Import (No longer available)](#import-no-longer-available)
The following import will no longer work since `render` has been removed:
```
import { render } from "@ai-sdk/rsc"
```
Use [`streamUI`](/docs/reference/ai-sdk-rsc/stream-ui) instead.
## [API Signature](#api-signature)
### [Parameters](#parameters)
### model:
string
### provider:
provider client
### initial?:
ReactNode
### messages:
Array\<SystemMessage | UserMessage | AssistantMessage | ToolMessage\>
SystemMessage
### role:
'system'
### content:
string
UserMessage
### role:
'user'
### content:
string
AssistantMessage
### role:
'assistant'
### content:
string
### tool\_calls:
ToolCall[]
ToolCall
### id:
string
### type:
'function'
### function:
Function
Function
### name:
string
### arguments:
string
ToolMessage
### role:
'tool'
### content:
string
### toolCallId:
string
### functions?:
ToolSet
Tool
### description?:
string
### parameters:
zod schema
### render?:
async (parameters) =\> any
### tools?:
ToolSet
Tool
### description?:
string
### parameters:
zod schema
### render?:
async (parameters) =\> any
### text?:
(Text) =\> ReactNode
Text
### content:
string
### delta:
string
### done:
boolean
### temperature?:
number
### [Returns](#returns)
It can return any valid ReactNode.
On this page
[render (Removed)](#render-removed)
[Import (No longer available)](#import-no-longer-available)
[API Signature](#api-signature)
[Parameters](#parameters)
[Returns](#returns)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)