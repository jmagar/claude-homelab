Agents: Building Agents
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
# [Building Agents](#building-agents)
The ToolLoopAgent provides a structured way to encapsulate LLM configuration, tools, and behavior into reusable components. It handles the agent loop for you, allowing the LLM to call tools multiple times in sequence to accomplish complex tasks. Define agents once and use them across your application.
## [Why Use the ToolLoopAgent Class?](#why-use-the-toolloopagent-class)
When building AI applications, you often need to:
* **Reuse configurations** - Same model settings, tools, and prompts across different parts of your application
* **Maintain consistency** - Ensure the same behavior and capabilities throughout your codebase
* **Simplify API routes** - Reduce boilerplate in your endpoints
* **Type safety** - Get full TypeScript support for your agent's tools and outputs
The ToolLoopAgent class provides a single place to define your agent's behavior.
## [Creating an Agent](#creating-an-agent)
Define an agent by instantiating the ToolLoopAgent class with your desired configuration:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent } from 'ai';
const myAgent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
instructions: 'You are a helpful assistant.',
tools: {
// Your tools here
},
});
`
```
## [Configuration Options](#configuration-options)
The ToolLoopAgent accepts all the same settings as `generateText` and `streamText`. Configure:
### [Model and System Instructions](#model-and-system-instructions)
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent } from 'ai';
const agent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
instructions: 'You are an expert software engineer.',
});
`
```
### [Tools](#tools)
Provide tools that the agent can use to accomplish tasks:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent, tool } from 'ai';
import { z } from 'zod';
const codeAgent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
tools: {
runCode: tool({
description: 'Execute Python code',
inputSchema: z.object({
code: z.string(),
}),
execute: async ({ code }) =\> {
// Execute code and return result
return { output: 'Code executed successfully' };
},
}),
},
});
`
```
### [Loop Control](#loop-control)
By default, agents run for 20 steps (`stopWhen: stepCountIs(20)`). In each step, the model either generates text or calls a tool. If it generates text, the agent completes. If it calls a tool, the AI SDK executes that tool.
You can configure `stopWhen` differently to allow more steps. After each tool execution, the agent triggers a new generation where the model can call another tool or generate text:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent, stepCountIs } from 'ai';
const agent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
stopWhen: stepCountIs(50), // Increase default from 20 to 50.
});
`
```
Each step represents one generation (which results in either text or a tool call). The loop continues until:
* A finish reasoning other than tool-calls is returned, or
* A tool that is invoked does not have an execute function, or
* A tool call needs approval, or
* A stop condition is met
You can combine multiple conditions:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent, stepCountIs } from 'ai';
const agent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
stopWhen: [
stepCountIs(20), // Maximum 20 steps
yourCustomCondition(), // Custom logic for when to stop
],
});
`
```
Learn more about [loop control and stop conditions](/docs/agents/loop-control).
### [Tool Choice](#tool-choice)
Control how the agent uses tools:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent } from 'ai';
const agent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
tools: {
// your tools here
},
toolChoice: 'required', // Force tool use
// or toolChoice: 'none' to disable tools
// or toolChoice: 'auto' (default) to let the model decide
});
`
```
You can also force the use of a specific tool:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent } from 'ai';
const agent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
tools: {
weather: weatherTool,
cityAttractions: attractionsTool,
},
toolChoice: {
type: 'tool',
toolName: 'weather', // Force the weather tool to be used
},
});
`
```
### [Structured Output](#structured-output)
Define structured output schemas:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent, Output } from 'ai';
import { z } from 'zod';
const analysisAgent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
output: Output.object({
schema: z.object({
sentiment: z.enum(['positive', 'neutral', 'negative']),
summary: z.string(),
keyPoints: z.array(z.string()),
}),
}),
});
const { output } = await analysisAgent.generate({
prompt: 'Analyze customer feedback from the last quarter',
});
`
```
## [Define Agent Behavior with System Instructions](#define-agent-behavior-with-system-instructions)
System instructions define your agent's behavior, personality, and constraints. They set the context for all interactions and guide how the agent responds to user queries and uses tools.
### [Basic System Instructions](#basic-system-instructions)
Set the agent's role and expertise:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const agent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
instructions:
'You are an expert data analyst. You provide clear insights from complex data.',
});
`
```
### [Detailed Behavioral Instructions](#detailed-behavioral-instructions)
Provide specific guidelines for agent behavior:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const codeReviewAgent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
instructions: `You are a senior software engineer conducting code reviews.
Your approach:
- Focus on security vulnerabilities first
- Identify performance bottlenecks
- Suggest improvements for readability and maintainability
- Be constructive and educational in your feedback
- Always explain why something is an issue and how to fix it`,
});
`
```
### [Constrain Agent Behavior](#constrain-agent-behavior)
Set boundaries and ensure consistent behavior:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const customerSupportAgent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
instructions: `You are a customer support specialist for an e-commerce platform.
Rules:
- Never make promises about refunds without checking the policy
- Always be empathetic and professional
- If you don't know something, say so and offer to escalate
- Keep responses concise and actionable
- Never share internal company information`,
tools: {
checkOrderStatus,
lookupPolicy,
createTicket,
},
});
`
```
### [Tool Usage Instructions](#tool-usage-instructions)
Guide how the agent should use available tools:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const researchAgent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
instructions: `You are a research assistant with access to search and document tools.
When researching:
1. Always start with a broad search to understand the topic
2. Use document analysis for detailed information
3. Cross-reference multiple sources before drawing conclusions
4. Cite your sources when presenting information
5. If information conflicts, present both viewpoints`,
tools: {
webSearch,
analyzeDocument,
extractQuotes,
},
});
`
```
### [Format and Style Instructions](#format-and-style-instructions)
Control the output format and communication style:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const technicalWriterAgent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
instructions: `You are a technical documentation writer.
Writing style:
- Use clear, simple language
- Avoid jargon unless necessary
- Structure information with headers and bullet points
- Include code examples where relevant
- Write in second person ("you" instead of "the user")
Always format responses in Markdown.`,
});
`
```
## [Using an Agent](#using-an-agent)
Once defined, you can use your agent in three ways:
### [Generate Text](#generate-text)
Use `generate()` for one-time text generation:
```
`
const result = await myAgent.generate({
prompt: 'What is the weather like?',
});
console.log(result.text);
`
```
### [Stream Text](#stream-text)
Use `stream()` for streaming responses:
```
`
const result = await myAgent.stream({
prompt: 'Tell me a story',
});
for await (const chunk of result.textStream) {
console.log(chunk);
}
`
```
### [Respond to UI Messages](#respond-to-ui-messages)
Use `createAgentUIStreamResponse()` to create API responses for client applications:
```
`
// In your API route (e.g., app/api/chat/route.ts)
import { createAgentUIStreamResponse } from 'ai';
export async function POST(request: Request) {
const { messages } = await request.json();
return createAgentUIStreamResponse({
agent: myAgent,
uiMessages: messages,
});
}
`
```
### [Track Step Progress](#track-step-progress)
Use `onStepFinish` to track each step's progress, including token usage.
The callback receives a `stepNumber` (zero-based) to identify which step just completed:
```
`
const result = await myAgent.generate({
prompt: 'Research and summarize the latest AI trends',
onStepFinish: async ({ stepNumber, usage, finishReason, toolCalls }) =\> {
console.log(`Step ${stepNumber} completed:`, {
inputTokens: usage.inputTokens,
outputTokens: usage.outputTokens,
finishReason,
toolsUsed: toolCalls?.map(tc =\> tc.toolName),
});
},
});
`
```
You can also define `onStepFinish` in the constructor for agent-wide tracking. When both constructor and method callbacks are provided, both are called (constructor first, then the method callback):
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const agent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
onStepFinish: async ({ stepNumber, usage }) =\> {
// Agent-wide logging
console.log(`Agent step ${stepNumber}:`, usage.totalTokens);
},
});
// Method-level callback runs after constructor callback
const result = await agent.generate({
prompt: 'Hello',
onStepFinish: async ({ stepNumber, usage }) =\> {
// Per-call tracking (e.g., for billing)
await trackUsage(stepNumber, usage);
},
});
`
```
## [End-to-end Type Safety](#end-to-end-type-safety)
You can infer types for your agent's `UIMessage`s:
```
`
import { ToolLoopAgent, InferAgentUIMessage } from 'ai';
const myAgent = new ToolLoopAgent({
// ... configuration
});
// Infer the UIMessage type for UI components or persistence
export type MyAgentUIMessage = InferAgentUIMessage\<typeof myAgent\>;
`
```
Use this type in your client components with `useChat`:
components/chat.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import type { MyAgentUIMessage } from '@/agent/my-agent';
export function Chat() {
const { messages } = useChat\<MyAgentUIMessage\>();
// Full type safety for your messages and tools
}
`
```
## [Next Steps](#next-steps)
Now that you understand building agents, you can:
* Explore [workflow patterns](/docs/agents/workflows) for structured patterns using core functions
* Learn about [loop control](/docs/agents/loop-control) for advanced execution control
* See [manual loop examples](/cookbook/node/manual-agent-loop) for custom workflow implementations
On this page
[Building Agents](#building-agents)
[Why Use the ToolLoopAgent Class?](#why-use-the-toolloopagent-class)
[Creating an Agent](#creating-an-agent)
[Configuration Options](#configuration-options)
[Model and System Instructions](#model-and-system-instructions)
[Tools](#tools)
[Loop Control](#loop-control)
[Tool Choice](#tool-choice)
[Structured Output](#structured-output)
[Define Agent Behavior with System Instructions](#define-agent-behavior-with-system-instructions)
[Basic System Instructions](#basic-system-instructions)
[Detailed Behavioral Instructions](#detailed-behavioral-instructions)
[Constrain Agent Behavior](#constrain-agent-behavior)
[Tool Usage Instructions](#tool-usage-instructions)
[Format and Style Instructions](#format-and-style-instructions)
[Using an Agent](#using-an-agent)
[Generate Text](#generate-text)
[Stream Text](#stream-text)
[Respond to UI Messages](#respond-to-ui-messages)
[Track Step Progress](#track-step-progress)
[End-to-end Type Safety](#end-to-end-type-safety)
[Next Steps](#next-steps)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)