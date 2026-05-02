Getting Started: Navigating the Library
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
# [Navigating the Library](#navigating-the-library)
The AI SDK is a powerful toolkit for building AI applications. This page will help you pick the right tools for your requirements.
Let’s start with a quick overview of the AI SDK, which is comprised of three parts:
* **[AI SDK Core](/docs/ai-sdk-core/overview):** A unified, provider agnostic API for generating text, structured objects, and tool calls with LLMs.
* **[AI SDK UI](/docs/ai-sdk-ui/overview):** A set of framework-agnostic hooks for building chat and generative user interfaces.
* [AI SDK RSC](/docs/ai-sdk-rsc/overview): Stream generative user interfaces with React Server Components (RSC). Development is currently experimental and we recommend using [AI SDK UI](/docs/ai-sdk-ui/overview).
## [Choosing the Right Tool for Your Environment](#choosing-the-right-tool-for-your-environment)
When deciding which part of the AI SDK to use, your first consideration should be the environment and existing stack you are working with. Different components of the SDK are tailored to specific frameworks and environments.
|Library|Purpose|Environment Compatibility|
|[AI SDK Core](/docs/ai-sdk-core/overview)|Call any LLM with unified API (e.g. [generateText](/docs/reference/ai-sdk-core/generate-text) and [streamText](/docs/reference/ai-sdk-core/stream-text))|Any JS environment (e.g. Node.js, Deno, Browser)|
|[AI SDK UI](/docs/ai-sdk-ui/overview)|Build streaming chat and generative UIs (e.g. [useChat](/docs/reference/ai-sdk-ui/use-chat))|React & Next.js, Vue & Nuxt, Svelte & SvelteKit|
|[AI SDK RSC](/docs/ai-sdk-rsc/overview)|Stream generative UIs from Server to Client (e.g. [streamUI](/docs/reference/ai-sdk-rsc/stream-ui)). Development is currently experimental and we recommend using [AI SDK UI](/docs/ai-sdk-ui/overview).|Any framework that supports React Server Components (e.g. Next.js)|
## [Environment Compatibility](#environment-compatibility)
These tools have been designed to work seamlessly with each other and it's likely that you will be using them together. Let's look at how you could decide which libraries to use based on your application environment, existing stack, and requirements.
The following table outlines AI SDK compatibility based on environment:
|Environment|[AI SDK Core](/docs/ai-sdk-core/overview)|[AI SDK UI](/docs/ai-sdk-ui/overview)|[AI SDK RSC](/docs/ai-sdk-rsc/overview)|
|None / Node.js / Deno||||
|Vue / Nuxt||||
|Svelte / SvelteKit||||
|Next.js Pages Router||||
|Next.js App Router||||
## [When to use AI SDK UI](#when-to-use-ai-sdk-ui)
AI SDK UI provides a set of framework-agnostic hooks for quickly building **production-ready AI-native applications**. It offers:
* Full support for streaming chat and client-side generative UI
* Utilities for handling common AI interaction patterns (i.e. chat, completion, assistant)
* Production-tested reliability and performance
* Compatibility across popular frameworks
## [AI SDK UI Framework Compatibility](#ai-sdk-ui-framework-compatibility)
AI SDK UI supports the following frameworks: [React](https://react.dev/), [Svelte](https://svelte.dev/), and [Vue.js](https://vuejs.org/). Here is a comparison of the supported functions across these frameworks:
|Function|React|Svelte|Vue.js|
|[useChat](/docs/reference/ai-sdk-ui/use-chat)||||
|[useChat](/docs/reference/ai-sdk-ui/use-chat) tool calling||||
|[useCompletion](/docs/reference/ai-sdk-ui/use-completion)||||
|[useObject](/docs/reference/ai-sdk-ui/use-object)||||
[Contributions](https://github.com/vercel/ai/blob/main/CONTRIBUTING.md) are
welcome to implement missing features for non-React frameworks.
## [When to use AI SDK RSC](#when-to-use-ai-sdk-rsc)
AI SDK RSC is currently experimental. We recommend using [AI SDK
UI](/docs/ai-sdk-ui/overview) for production. For guidance on migrating from
RSC to UI, see our [migration guide](/docs/ai-sdk-rsc/migrating-to-ui).
[React Server Components](https://nextjs.org/docs/app/building-your-application/rendering/server-components)
(RSCs) provide a new approach to building React applications that allow components
to render on the server, fetch data directly, and stream the results to the client,
reducing bundle size and improving performance. They also introduce a new way to
call server-side functions from anywhere in your application called [Server Actions](https://nextjs.org/docs/app/building-your-application/data-fetching/server-actions-and-mutations).
AI SDK RSC provides a number of utilities that allow you to stream values and UI directly from the server to the client. However, **it's important to be aware of current limitations**:
* **Cancellation**: currently, it is not possible to abort a stream using Server Actions. This will be improved in future releases of React and Next.js.
* **Increased Data Transfer**: using [`createStreamableUI`](/docs/reference/ai-sdk-rsc/create-streamable-ui) can lead to quadratic data transfer (quadratic to the length of generated text). You can avoid this using [ `createStreamableValue` ](/docs/reference/ai-sdk-rsc/create-streamable-value) instead, and rendering the component client-side.
* **Re-mounting Issue During Streaming**: when using `createStreamableUI`, components re-mount on `.done()`, causing [flickering](https://github.com/vercel/ai/issues/2232).
Given these limitations, **we recommend using [AI SDK UI](/docs/ai-sdk-ui/overview) for production applications**.
On this page
[Navigating the Library](#navigating-the-library)
[Choosing the Right Tool for Your Environment](#choosing-the-right-tool-for-your-environment)
[Environment Compatibility](#environment-compatibility)
[When to use AI SDK UI](#when-to-use-ai-sdk-ui)
[AI SDK UI Framework Compatibility](#ai-sdk-ui-framework-compatibility)
[When to use AI SDK RSC](#when-to-use-ai-sdk-rsc)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)