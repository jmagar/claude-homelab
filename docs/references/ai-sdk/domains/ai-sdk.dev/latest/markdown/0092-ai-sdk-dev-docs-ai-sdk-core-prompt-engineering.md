AI SDK Core: Prompt Engineering
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
# [Prompt Engineering](#prompt-engineering)
## [Tips](#tips)
### [Prompts for Tools](#prompts-for-tools)
When you create prompts that include tools, getting good results can be tricky as the number and complexity of your tools increases.
Here are a few tips to help you get the best results:
1. Use a model that is strong at tool calling, such as `gpt-5` or `gpt-4.1`. Weaker models will often struggle to call tools effectively and flawlessly.
2. Keep the number of tools low, e.g. to 5 or less.
3. Keep the complexity of the tool parameters low. Complex Zod schemas with many nested and optional elements, unions, etc. can be challenging for the model to work with.
4. Use semantically meaningful names for your tools, parameters, parameter properties, etc. The more information you pass to the model, the better it can understand what you want.
5. Add `.describe("...")` to your Zod schema properties to give the model hints about what a particular property is for.
6. When the output of a tool might be unclear to the model and there are dependencies between tools, use the `description` field of a tool to provide information about the output of the tool execution.
7. You can include example input/outputs of tool calls in your prompt to help the model understand how to use the tools. Keep in mind that the tools work with JSON objects, so the examples should use JSON.
In general, the goal should be to give the model all information it needs in a clear way.
### [Tool & Structured Data Schemas](#tool--structured-data-schemas)
The mapping from Zod schemas to LLM inputs (typically JSON schema) is not always straightforward, since the mapping is not one-to-one.
#### [Zod Dates](#zod-dates)
Zod expects JavaScript Date objects, but models return dates as strings.
You can specify and validate the date format using `z.string().datetime()` or `z.string().date()`,
and then use a Zod transformer to convert the string to a Date object.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
output: Output.object({
schema: z.object({
events: z.array(
z.object({
event: z.string(),
date: z
.string()
.date()
.transform(value =\> new Date(value)),
}),
),
}),
}),
prompt: 'List 5 important events from the year 2000.',
});
`
```
#### [Optional Parameters](#optional-parameters)
When working with tools that have optional parameters, you may encounter compatibility issues with certain providers that use strict schema validation.
This is particularly relevant for OpenAI models with structured outputs
(strict mode).
For maximum compatibility, optional parameters should use `.nullable()` instead of `.optional()`:
```
`
// This may fail with strict schema validation
const failingTool = tool({
description: 'Execute a command',
inputSchema: z.object({
command: z.string(),
workdir: z.string().optional(), // This can cause errors
timeout: z.string().optional(),
}),
});
// This works with strict schema validation
const workingTool = tool({
description: 'Execute a command',
inputSchema: z.object({
command: z.string(),
workdir: z.string().nullable(), // Use nullable instead
timeout: z.string().nullable(),
}),
});
`
```
#### [Temperature Settings](#temperature-settings)
For tool calls and object generation, it's recommended to use `temperature: 0` to ensure deterministic and consistent results:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
temperature: 0, // Recommended for tool calls
tools: {
myTool: tool({
description: 'Execute a command',
inputSchema: z.object({
command: z.string(),
}),
}),
},
prompt: 'Execute the ls command',
});
`
```
Lower temperature values reduce randomness in model outputs, which is particularly important when the model needs to:
* Generate structured data with specific formats
* Make precise tool calls with correct parameters
* Follow strict schemas consistently
## [Debugging](#debugging)
### [Inspecting Warnings](#inspecting-warnings)
Not all providers support all AI SDK features.
Providers either throw exceptions or return warnings when they do not support a feature.
To check if your prompt, tools, and settings are handled correctly by the provider, you can check the call warnings:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Hello, world!',
});
console.log(result.warnings);
`
```
### [HTTP Request Bodies](#http-request-bodies)
You can inspect the raw HTTP request bodies for models that expose them, e.g. [OpenAI](/providers/ai-sdk-providers/openai).
This allows you to inspect the exact payload that is sent to the model provider in the provider-specific way.
Request bodies are available via the `request.body` property of the response:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Hello, world!',
});
console.log(result.request.body);
`
```
On this page
[Prompt Engineering](#prompt-engineering)
[Tips](#tips)
[Prompts for Tools](#prompts-for-tools)
[Tool & Structured Data Schemas](#tool--structured-data-schemas)
[Zod Dates](#zod-dates)
[Optional Parameters](#optional-parameters)
[Temperature Settings](#temperature-settings)
[Debugging](#debugging)
[Inspecting Warnings](#inspecting-warnings)
[HTTP Request Bodies](#http-request-bodies)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)