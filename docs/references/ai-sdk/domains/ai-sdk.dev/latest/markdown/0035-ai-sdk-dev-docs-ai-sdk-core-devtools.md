AI SDK Core: DevTools
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
# [DevTools](#devtools)
AI SDK DevTools is experimental and intended for local development only. Do
not use in production environments.
AI SDK DevTools gives you full visibility over your AI SDK calls with [`generateText`](/docs/reference/ai-sdk-core/generate-text), [`streamText`](/docs/reference/ai-sdk-core/stream-text), and [`ToolLoopAgent`](/docs/reference/ai-sdk-core/tool-loop-agent). It helps you debug and inspect LLM requests, responses, tool calls, and multi-step interactions through a web-based UI.
DevTools is composed of two parts:
1. **Middleware**: Captures runs and steps from your AI SDK calls
2. **Viewer**: A web UI to inspect the captured data
## [Installation](#installation)
Install the DevTools package:
```
`
pnpm add @ai-sdk/devtools
`
```
## [Requirements](#requirements)
* AI SDK v6 beta (`ai@^6.0.0-beta.0`)
* Node.js compatible runtime
## [Using DevTools](#using-devtools)
### [Add the middleware](#add-the-middleware)
Wrap your language model with the DevTools middleware using [`wrapLanguageModel`](/docs/ai-sdk-core/middleware):
```
`
import { wrapLanguageModel, gateway } from 'ai';
import { devToolsMiddleware } from '@ai-sdk/devtools';
const model = wrapLanguageModel({
model: gateway('anthropic/claude-sonnet-4.5'),
middleware: devToolsMiddleware(),
});
`
```
The wrapped model can be used with any AI SDK Core function:
```
`
import { generateText } from 'ai';
const result = await generateText({
model, // wrapped model with DevTools
prompt: 'What cities are in the United States?',
});
`
```
### [Launch the viewer](#launch-the-viewer)
Start the DevTools viewer:
```
`
npx @ai-sdk/devtools
`
```
Open [http://localhost:4983](http://localhost:4983) to view your AI SDK interactions.
### [Monorepo usage](#monorepo-usage)
If you are using a monorepo setup (e.g. Turborepo, Nx), start DevTools from the same workspace where your AI SDK code runs.
For example, if your API is in `apps/api`, run:
```
`
cd apps/api
npx @ai-sdk/devtools
`
```
## [Captured data](#captured-data)
The DevTools middleware captures the following information from your AI SDK calls:
* **Input parameters and prompts**: View the complete input sent to your LLM
* **Output content and tool calls**: Inspect generated text and tool invocations
* **Token usage and timing**: Monitor resource consumption and performance
* **Raw provider data**: Access complete request and response payloads
### [Runs and steps](#runs-and-steps)
DevTools organizes captured data into runs and steps:
* **Run**: A complete multi-step AI interaction, grouped by the initial prompt
* **Step**: A single LLM call within a run (e.g., one `generateText` or `streamText` call)
Multi-step interactions, such as those created by tool calling or agent loops, are grouped together as a single run with multiple steps.
## [How it works](#how-it-works)
The DevTools middleware intercepts all `generateText` and `streamText` calls through the [language model middleware](/docs/ai-sdk-core/middleware) system. Captured data is stored locally in a JSON file (`.devtools/generations.json`) and served through a web UI built with Hono and React.
The middleware automatically adds `.devtools` to your `.gitignore` file.
Verify that `.devtools` is in your `.gitignore` to ensure you don't commit
sensitive AI interaction data to your repository.
## [Security considerations](#security-considerations)
DevTools stores all AI interactions locally in plain text files, including:
* User prompts and messages
* LLM responses
* Tool call arguments and results
* API request and response data
**Only use DevTools in local development environments.** Do not enable DevTools in production or when handling sensitive data.
On this page
[DevTools](#devtools)
[Installation](#installation)
[Requirements](#requirements)
[Using DevTools](#using-devtools)
[Add the middleware](#add-the-middleware)
[Launch the viewer](#launch-the-viewer)
[Monorepo usage](#monorepo-usage)
[Captured data](#captured-data)
[Runs and steps](#runs-and-steps)
[How it works](#how-it-works)
[Security considerations](#security-considerations)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)