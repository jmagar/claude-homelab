Migration Guides: Migrate AI SDK 3.2 to 3.3
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
[Versioning](/docs/migration-guides/versioning)
[Migrate AI SDK 5.x to 6.0](/docs/migration-guides/migration-guide-6-0)
[Migrate Your Data to AI SDK 5.0](/docs/migration-guides/migration-guide-5-0-data)
[Migrate AI SDK 4.x to 5.0](/docs/migration-guides/migration-guide-5-0)
[Migrate AI SDK 4.1 to 4.2](/docs/migration-guides/migration-guide-4-2)
[Migrate AI SDK 4.0 to 4.1](/docs/migration-guides/migration-guide-4-1)
[Migrate AI SDK 3.4 to 4.0](/docs/migration-guides/migration-guide-4-0)
[Migrate AI SDK 3.3 to 3.4](/docs/migration-guides/migration-guide-3-4)
[Migrate AI SDK 3.2 to 3.3](/docs/migration-guides/migration-guide-3-3)
[Migrate AI SDK 3.1 to 3.2](/docs/migration-guides/migration-guide-3-2)
[Migrate AI SDK 3.0 to 3.1](/docs/migration-guides/migration-guide-3-1)
[Troubleshooting](/docs/troubleshooting)
Copy markdown
# [Migrate AI SDK 3.2 to 3.3](#migrate-ai-sdk-32-to-33)
Check out the [AI SDK 3.3 release blog
post](https://vercel.com/blog/vercel-ai-sdk-3-3) for more information about
the release.
No breaking changes in this release.
The following changelog encompasses all changes made in the 3.2.x series,
introducing significant improvements and new features across the AI SDK and its associated libraries:
## [New Features](#new-features)
### [Open Telemetry Support](#open-telemetry-support)
* Added experimental [OpenTelemetry support](/docs/ai-sdk-core/telemetry#telemetry) for all [AI SDK Core functions](/docs/ai-sdk-core/overview#ai-sdk-core-functions), enabling better observability and tracing capabilities.
### [AI SDK UI Improvements](#ai-sdk-ui-improvements)
* Introduced the experimental **`useObject`** hook (for React) that can be used in conjunction with **`streamObject`** on the backend to enable seamless streaming of structured data.
* Enhanced **`useChat`** with experimental support for attachments and streaming tool calls, providing more versatile chat functionalities.
* Patched **`useChat`** to prevent empty submissions, improving the quality of user interactions by ensuring that only intended inputs are processed.
* Fix **`useChat`**'s **`reload`** function, now correctly sending data, body, and headers.
* Implemented **`setThreadId`** helper for **`useAssistant`**, simplifying thread management.
* Documented the stream data protocol for **`useChat`** and **`useCompletion`**, allowing developers to use these functions with any backend. The stream data protocol also enables the use of custom frontends with **`streamText`**.
* Added support for custom fetch functions and request body customization, offering greater control over API interactions.
* Added **`onFinish`** to **`useChat`** hook for access to token usage and finish reason.
### [Core Enhancements](#core-enhancements)
* Implemented support for sending custom request headers, enabling more tailored API requests.
* Added raw JSON schema support alongside existing Zod support, providing more options for schema and data validation.
* Introduced usage information for **`embed`** and **`embedMany`** functions, offering insights into token usage.
* Added support for additional settings including **`stopSequences`** and **`topK`**, allowing for finer control over text generation.
* Provided access to information for all steps on **`generateText`**, providing access to intermediate tool calls and results.
### [New Providers](#new-providers)
* [AWS Bedrock provider](/providers/ai-sdk-providers/amazon-bedrock).
### [Provider Improvements](#provider-improvements)
* Enhanced existing providers including Anthropic, Google, Azure, and OpenAI with various improvements and bug fixes.
* Upgraded the LangChain adapter with StreamEvent v2 support and introduced the **`toDataStreamResponse`** function, enabling conversion of LangChain output streams to data stream responses.
* Added legacy function calling support to the OpenAI provider.
* Updated Mistral AI provider with fixes and improvements for tool calling support.
### [UI Framework Support Expansion](#ui-framework-support-expansion)
* SolidJS: Updated **`useChat`** and **`useCompletion`** to achieve feature parity with React implementations.
* Vue.js: Introduced **`useAssistant`** hook.
* Vue.js / Nuxt: [Updated examples](https://github.com/vercel/ai/tree/main/examples/nuxt-openai) to showcase latest features and best practices.
* Svelte: Added tool calling support to **`useChat`.**
## [Fixes and Improvements](#fixes-and-improvements)
* Resolved various issues across different components of the SDK, including race conditions, error handling, and state management.
On this page
[Migrate AI SDK 3.2 to 3.3](#migrate-ai-sdk-32-to-33)
[New Features](#new-features)
[Open Telemetry Support](#open-telemetry-support)
[AI SDK UI Improvements](#ai-sdk-ui-improvements)
[Core Enhancements](#core-enhancements)
[New Providers](#new-providers)
[Provider Improvements](#provider-improvements)
[UI Framework Support Expansion](#ui-framework-support-expansion)
[Fixes and Improvements](#fixes-and-improvements)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)