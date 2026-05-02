Getting Started: Coding Agents
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
Coding Agents
Copy markdown
# [Getting Started with Coding Agents](#getting-started-with-coding-agents)
This page explains how to get the most out of the AI SDK when working inside a coding agent (such as Claude Code, Codex, OpenCode, Cursor, or any other AI-assisted development environment).
## [Install the AI SDK Skill](#install-the-ai-sdk-skill)
The fastest way to give your coding agent deep knowledge of the AI SDK is to install the official AI SDK skill. Skills are lightweight markdown files that load specialized instructions into your agent's context on demand — so your agent knows exactly how to use the SDK without you needing to explain it.
Install the AI SDK skill using `npx skills add`:
```
`
npx skills add vercel/ai
`
```
This installs the skill into your agent's specific skills directory (e.g., `.claude/skills`, `.codex/skills`). If you select more than one agent, the CLI creates symlinks so each agent can discover the skill. Use `-a` to specify agents directly — for example, `-a amp` installs into the universal `.agents/skills` directory. Use `-y` for non-interactive installation.
Once installed, any agent that supports the [Agent Skills](https://agentskills.io) format will automatically discover and load the skill when working on AI SDK tasks.
Agent Skills use **progressive disclosure**: your agent loads only the skill's
name and description at startup. The full instructions are only pulled into
context when the task calls for it, keeping your agent fast and focused.
## [Docs and Source Code in `node\_modules`](#docs-and-source-code-in-node_modules)
Once you've installed the `ai` package, you already have the full AI SDK documentation and source code available locally inside `node\_modules`. Your coding agent can read these directly — no internet access required.
Install the `ai` package if you haven't already:
pnpmnpmyarnbun
```
pnpm add ai
```
After installation, your agent can reference the bundled source code and documentation at paths like:
```
`
node\_modules/ai/src/ # Full source code organized by module
node\_modules/ai/docs/ # Official documentation with examples
`
```
This means your agent can look up accurate API signatures, implementations, and usage examples directly from the installed package — ensuring it always uses the version of the SDK that's actually installed in your project.
## [Install DevTools](#install-devtools)
AI SDK DevTools gives you full visibility into your AI SDK calls during development. It captures LLM requests, responses, tool calls, token usage, and multi-step interactions, and displays them in a local web UI.
AI SDK DevTools is experimental and intended for local development only. Do
not use in production environments.
Install the DevTools package:
pnpmnpmyarnbun
```
pnpm add @ai-sdk/devtools
```
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
Use the wrapped model with any AI SDK Core function:
```
`
import { generateText } from 'ai';
const result = await generateText({
model, // wrapped model with DevTools middleware
prompt: 'What cities are in the United States?',
});
`
```
### [Launch the viewer](#launch-the-viewer)
Start the DevTools viewer in a separate terminal:
```
`
npx @ai-sdk/devtools
`
```
Open [http://localhost:4983](http://localhost:4983) to inspect your AI SDK interactions in real time.
## [Inspecting Tool Calls and Outputs](#inspecting-tool-calls-and-outputs)
DevTools captures and displays the following for every call:
* **Input parameters and prompts** — the complete input sent to your LLM
* **Output content and tool calls** — generated text and tool invocations
* **Token usage and timing** — resource consumption and latency per step
* **Raw provider data** — complete request and response payloads
For multi-step agent interactions, DevTools groups everything into **runs** (a complete interaction) and **steps** (each individual LLM call within it), making it easy to trace exactly what your agent did and why.
You can also log tool results directly in code during development:
```
`
import { streamText, tool, stepCountIs } from 'ai';
import { z } from 'zod';
const result = streamText({
model,
prompt: "What's the weather in New York in celsius?",
tools: {
weather: tool({
description: 'Get the weather in a location (fahrenheit)',
inputSchema: z.object({
location: z.string().describe('The location to get the weather for'),
}),
execute: async ({ location }) =\> ({
location,
temperature: Math.round(Math.random() \* (90 - 32) + 32),
}),
}),
},
stopWhen: stepCountIs(5),
onStepFinish: async ({ toolResults }) =\> {
if (toolResults.length) {
console.log(JSON.stringify(toolResults, null, 2));
}
},
});
`
```
The `onStepFinish` callback fires after each LLM step and prints any tool results to your terminal — useful for quick debugging without opening the DevTools UI.
DevTools stores all AI interactions in a local `.devtools/generations.json`
file. It automatically adds `.devtools` to your `.gitignore` to prevent
committing sensitive interaction data.
## [Where to Next?](#where-to-next)
* Learn about [Agent Skills](https://agentskills.io/specification) to understand the full skill format.
* Read the [DevTools reference](/docs/ai-sdk-core/devtools) for a complete list of captured data and configuration options.
* Explore [Tools and Tool Calling](/docs/ai-sdk-core/tools-and-tool-calling) to build agents that can take real-world actions.
* Check out the [Add Skills to Your Agent](/cookbook/guides/agent-skills) cookbook guide for a step-by-step integration walkthrough.
On this page
[Getting Started with Coding Agents](#getting-started-with-coding-agents)
[Install the AI SDK Skill](#install-the-ai-sdk-skill)
[Docs and Source Code in node\_modules](#docs-and-source-code-in-node_modules)
[Install DevTools](#install-devtools)
[Add the middleware](#add-the-middleware)
[Launch the viewer](#launch-the-viewer)
[Inspecting Tool Calls and Outputs](#inspecting-tool-calls-and-outputs)
[Where to Next?](#where-to-next)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)