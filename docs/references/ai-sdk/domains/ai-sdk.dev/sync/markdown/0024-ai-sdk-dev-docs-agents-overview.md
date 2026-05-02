Agents: Overview
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
# [Agents](#agents)
Agents are **large language models (LLMs)** that use **tools** in a **loop** to accomplish tasks.
These components work together:
* **LLMs** process input and decide the next action
* **Tools** extend capabilities beyond text generation (reading files, calling APIs, writing to databases)
* **Loop** orchestrates execution through:
* **Context management** - Maintaining conversation history and deciding what the model sees (input) at each step
* **Stopping conditions** - Determining when the loop (task) is complete
## [ToolLoopAgent Class](#toolloopagent-class)
The ToolLoopAgent class handles these three components. Here's an agent that uses multiple tools in a loop to accomplish a task:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent, tool } from 'ai';
import { z } from 'zod';
const weatherAgent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
tools: {
weather: tool({
description: 'Get the weather in a location (in Fahrenheit)',
inputSchema: z.object({
location: z.string().describe('The location to get the weather for'),
}),
execute: async ({ location }) =\> ({
location,
temperature: 72 + Math.floor(Math.random() \* 21) - 10,
}),
}),
convertFahrenheitToCelsius: tool({
description: 'Convert temperature from Fahrenheit to Celsius',
inputSchema: z.object({
temperature: z.number().describe('Temperature in Fahrenheit'),
}),
execute: async ({ temperature }) =\> {
const celsius = Math.round((temperature - 32) \* (5 / 9));
return { celsius };
},
}),
},
});
const result = await weatherAgent.generate({
prompt: 'What is the weather in San Francisco in celsius?',
});
console.log(result.text); // agent's final answer
console.log(result.steps); // steps taken by the agent
`
```
The agent automatically:
1. Calls the `weather` tool to get the temperature in Fahrenheit
2. Calls `convertFahrenheitToCelsius` to convert it
3. Generates a final text response with the result
The ToolLoopAgent handles the loop, context management, and stopping conditions.
## [Why Use the ToolLoopAgent?](#why-use-the-toolloopagent)
The ToolLoopAgent is the recommended approach for building agents with the AI SDK because it:
* **Reduces boilerplate** - Manages loops and message arrays
* **Improves reusability** - Define once, use throughout your application
* **Simplifies maintenance** - Single place to update agent configuration
For most use cases, start with the ToolLoopAgent. Use core functions (`generateText`, `streamText`) when you need explicit control over each step for complex structured workflows.
## [Structured Workflows](#structured-workflows)
Agents are flexible and powerful, but non-deterministic. When you need reliable, repeatable outcomes with explicit control flow, use core functions with structured workflow patterns combining:
* Conditional statements for explicit branching
* Standard functions for reusable logic
* Error handling for robustness
* Explicit control flow for predictability
[Explore workflow patterns](/docs/agents/workflows) to learn more about building structured, reliable systems.
## [Next Steps](#next-steps)
* **[Building Agents](/docs/agents/building-agents)** - Guide to creating agents with the ToolLoopAgent
* **[Workflow Patterns](/docs/agents/workflows)** - Structured patterns using core functions for complex workflows
* **[Loop Control](/docs/agents/loop-control)** - Execution control with stopWhen and prepareStep
On this page
[Agents](#agents)
[ToolLoopAgent Class](#toolloopagent-class)
[Why Use the ToolLoopAgent?](#why-use-the-toolloopagent)
[Structured Workflows](#structured-workflows)
[Next Steps](#next-steps)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)