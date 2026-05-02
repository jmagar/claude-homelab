AI SDK UI: useChat
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
# [`useChat()`](#usechat)
Allows you to easily create a conversational user interface for your chatbot application. It enables the streaming of chat messages from your AI provider, manages the chat state, and updates the UI automatically as new messages are received.
The `useChat` API has been significantly updated in AI SDK 5.0. It now uses a
transport-based architecture and no longer manages input state internally. See
the [migration
guide](/docs/migration-guides/migration-guide-5-0#usechat-changes) for
details.
## [Import](#import)
ReactSvelteVueAngular
```
import { useChat } from '@ai-sdk/react'
```
## [API Signature](#api-signature)
### [Parameters](#parameters)
### chat?:
Chat\<UIMessage\>
### transport?:
ChatTransport
DefaultChatTransport
### api?:
string = '/api/chat'
### credentials?:
RequestCredentials
### headers?:
Record\<string, string\> | Headers
### body?:
object
### fetch?:
FetchFunction
### prepareSendMessagesRequest?:
PrepareSendMessagesRequest
PrepareSendMessagesRequest
### options:
PrepareSendMessageRequestOptions
PrepareSendMessageRequestOptions
### id:
string
### messages:
UIMessage[]
### requestMetadata:
unknown
### body:
Record\<string, any\> | undefined
### credentials:
RequestCredentials | undefined
### headers:
HeadersInit | undefined
### api:
string
### trigger:
'submit-message' | 'regenerate-message'
### messageId:
string | undefined
### prepareReconnectToStreamRequest?:
PrepareReconnectToStreamRequest
PrepareReconnectToStreamRequest
### options:
PrepareReconnectToStreamRequestOptions
PrepareReconnectToStreamRequestOptions
### id:
string
### requestMetadata:
unknown
### body:
Record\<string, any\> | undefined
### credentials:
RequestCredentials | undefined
### headers:
HeadersInit | undefined
### api:
string
### id?:
string
### messages?:
UIMessage[]
### messageMetadataSchema?:
FlexibleSchema
### dataPartSchemas?:
UIDataTypesToSchemas
### generateId?:
IdGenerator
### onToolCall?:
({toolCall: ToolCall}) =\> void | Promise\<void\>
### sendAutomaticallyWhen?:
(options: { messages: UIMessage[] }) =\> boolean | PromiseLike\<boolean\>
### onFinish?:
(options: OnFinishOptions) =\> void
OnFinishOptions
### message:
UIMessage
### messages:
UIMessage[]
### isAbort:
boolean
### isDisconnect:
boolean
### isError:
boolean
### finishReason?:
'stop' | 'length' | 'content-filter' | 'tool-calls' | 'error' | 'other'
### onError?:
(error: Error) =\> void
### onData?:
(dataPart: DataUIPart) =\> void
### experimental\_throttle?:
number
### resume?:
boolean
### [Returns](#returns)
### id:
string
### messages:
UIMessage[]
UIMessage
### id:
string
### role:
'system' | 'user' | 'assistant'
### parts:
UIMessagePart[]
### metadata?:
unknown
### status:
'submitted' | 'streaming' | 'ready' | 'error'
### error:
Error | undefined
### sendMessage:
(message?: { text: string; files?: FileList | FileUIPart[]; metadata?; messageId?: string } | CreateUIMessage, options?: ChatRequestOptions) =\> Promise\<void\>
ChatRequestOptions
### headers?:
Record\<string, string\> | Headers
### body?:
object
### metadata?:
unknown
### regenerate:
(options?: { messageId?: string } & ChatRequestOptions) =\> Promise\<void\>
### stop:
() =\> void
### clearError:
() =\> void
### resumeStream:
() =\> void
### addToolOutput:
(options: { tool: string; toolCallId: string; output: unknown } | { tool: string; toolCallId: string; state: "output-error", errorText: string }) =\> void
### addToolApprovalResponse:
(options: { id: string; approved: boolean; reason?: string }) =\> void | PromiseLike\<void\>
### addToolResult:
(options: { tool: string; toolCallId: string; output: unknown } | { tool: string; toolCallId: string; state: "output-error", errorText: string }) =\> void
### setMessages:
(messages: UIMessage[] | ((messages: UIMessage[]) =\> UIMessage[])) =\> void
## [Learn more](#learn-more)
* [Chatbot](/docs/ai-sdk-ui/chatbot)
* [Chatbot with Tools](/docs/ai-sdk-ui/chatbot-tool-usage)
* [UIMessage](/docs/reference/ai-sdk-core/ui-message)
On this page
[useChat()](#usechat)
[Import](#import)
[API Signature](#api-signature)
[Parameters](#parameters)
[Returns](#returns)
[Learn more](#learn-more)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)