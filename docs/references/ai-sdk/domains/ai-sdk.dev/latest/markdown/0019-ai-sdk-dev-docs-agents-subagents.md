Agents: Subagents
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
# [Subagents](#subagents)
A subagent is an agent that a parent agent can invoke. The parent delegates work via a tool, and the subagent executes autonomously before returning a result.
## [How It Works](#how-it-works)
1. **Define a subagent** with its own model, instructions, and tools
2. **Create a tool that calls it** for the main agent to use
3. **Subagent runs independently with its own context window**
4. **Return a result** (optionally streaming progress to the UI)
5. **Control what the model sees** using `toModelOutput` to summarize
## [When to Use Subagents](#when-to-use-subagents)
Subagents add latency and complexity. Use them when the benefits outweigh the costs:
|Use Subagents When|Avoid Subagents When|
|Tasks require exploring large amounts of tokens|Tasks are simple and focused|
|You need to parallelize independent research|Sequential processing suffices|
|Context would grow beyond model limits|Context stays manageable|
|You want to isolate tool access by capability|All tools can safely coexist|
## [Why Use Subagents?](#why-use-subagents)
### [Offloading Context-Heavy Tasks](#offloading-context-heavy-tasks)
Some tasks require exploring large amounts of information—reading files, searching codebases, or researching topics. Running these in the main agent consumes context quickly, making the agent less coherent over time.
With subagents, you can:
* Spin up a dedicated agent that uses hundreds of thousands of tokens
* Have it return only a focused summary (perhaps 1,000 tokens)
* Keep your main agent's context clean and coherent
The subagent does the heavy lifting while the main agent stays focused on orchestration.
### [Parallelizing Independent Work](#parallelizing-independent-work)
For tasks like exploring a codebase, you can spawn multiple subagents to research different areas simultaneously. Each returns a summary, and the main agent synthesizes the findings—without paying the context cost of all that exploration.
### [Specialized Orchestration](#specialized-orchestration)
A less common but valid pattern is using a main agent purely for orchestration, delegating to specialized subagents for different types of work. For example:
* An exploration subagent with read-only tools for researching codebases
* A coding subagent with file editing tools
* An integration subagent with tools for a specific platform or API
This creates a clear separation of concerns, though context offloading and parallelization are the more common motivations for subagents.
## [Basic Subagent Without Streaming](#basic-subagent-without-streaming)
The simplest subagent pattern requires no special machinery. Your main agent has a tool that calls another agent in its `execute` function:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent, tool } from 'ai';
import { z } from 'zod';
// Define a subagent for research tasks
const researchSubagent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
instructions: `You are a research agent.
Summarize your findings in your final response.`,
tools: {
read: readFileTool, // defined elsewhere
search: searchTool, // defined elsewhere
},
});
// Create a tool that delegates to the subagent
const researchTool = tool({
description: 'Research a topic or question in depth.',
inputSchema: z.object({
task: z.string().describe('The research task to complete'),
}),
execute: async ({ task }, { abortSignal }) =\> {
const result = await researchSubagent.generate({
prompt: task,
abortSignal,
});
return result.text;
},
});
// Main agent uses the research tool
const mainAgent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
instructions: 'You are a helpful assistant that can delegate research tasks.',
tools: {
research: researchTool,
},
});
`
```
This works well when you don't need to show the subagent's progress in the UI. The tool call blocks until the subagent completes, then returns the final text response.
### [Handling Cancellation](#handling-cancellation)
When the user cancels a request, the `abortSignal` propagates to the subagent. Always pass it through to ensure cleanup:
```
`
execute: async ({ task }, { abortSignal }) =\> {
const result = await researchSubagent.generate({
prompt: task,
abortSignal, // Cancels subagent if main request is aborted
});
return result.text;
},
`
```
If you abort the signal, the subagent stops executing and throws an `AbortError`. The main agent's tool execution fails, which stops the main loop.
To avoid errors about incomplete tool calls in subsequent messages, use `convertToModelMessages` with `ignoreIncompleteToolCalls`:
```
`
import { convertToModelMessages } from 'ai';
const modelMessages = await convertToModelMessages(messages, {
ignoreIncompleteToolCalls: true,
});
`
```
This filters out tool calls that don't have corresponding results. Learn more in the [convertToModelMessages](/docs/reference/ai-sdk-ui/convert-to-model-messages) reference.
## [Streaming Subagent Progress](#streaming-subagent-progress)
When you want to show incremental progress as the subagent works, use [**preliminary tool results**](/docs/ai-sdk-core/tools-and-tool-calling#preliminary-tool-results). This pattern uses a generator function that yields partial updates to the UI.
### [How Preliminary Tool Results Work](#how-preliminary-tool-results-work)
Change your `execute` function from a regular function to an async generator (`async function\*`). Each `yield` sends a preliminary result to the frontend:
```
`
execute: async function\* ({ /\* input \*/ }) {
// ... do work ...
yield partialResult;
// ... do more work ...
yield updatedResult;
}
`
```
### [Building the Complete Message](#building-the-complete-message)
Each `yield` **replaces** the previous output entirely (it does not append). This means you need a way to accumulate the subagent's response into a complete message that grows over time.
The `readUIMessageStream` utility handles this. It reads each chunk from the stream and builds an ever-growing `UIMessage` containing all parts received so far:
```
`
import { readUIMessageStream, tool } from 'ai';
import { z } from 'zod';
const researchTool = tool({
description: 'Research a topic or question in depth.',
inputSchema: z.object({
task: z.string().describe('The research task to complete'),
}),
execute: async function\* ({ task }, { abortSignal }) {
// Start the subagent with streaming
const result = await researchSubagent.stream({
prompt: task,
abortSignal,
});
// Each iteration yields a complete, accumulated UIMessage
for await (const message of readUIMessageStream({
stream: result.toUIMessageStream(),
})) {
yield message;
}
},
});
`
```
Each yielded `message` is a complete `UIMessage` containing all the subagent's parts up to that point (text, tool calls, and tool results). The frontend simply replaces its display with each new message.
## [Controlling What the Model Sees](#controlling-what-the-model-sees)
Here's where subagents become powerful for context management. The full `UIMessage` with all the subagent's work is stored in the message history and displayed in the UI. But you can control what the main agent's model actually sees using `toModelOutput`.
### [How It Works](#how-it-works-1)
The `toModelOutput` function maps the tool's output to the tokens sent to the model:
```
`
const researchTool = tool({
description: 'Research a topic or question in depth.',
inputSchema: z.object({
task: z.string().describe('The research task to complete'),
}),
execute: async function\* ({ task }, { abortSignal }) {
const result = await researchSubagent.stream({
prompt: task,
abortSignal,
});
for await (const message of readUIMessageStream({
stream: result.toUIMessageStream(),
})) {
yield message;
}
},
toModelOutput: ({ output: message }) =\> {
// Extract just the final text as a summary
const lastTextPart = message?.parts.findLast(p =\> p.type === 'text');
return {
type: 'text',
value: lastTextPart?.text ?? 'Task completed.',
};
},
});
`
```
With this setup:
* **Users see**: The full subagent execution—every tool call, every intermediate step
* **The model sees**: Just the final summary text
The subagent might use 100,000 tokens exploring and reasoning, but the main agent only consumes the summary. This keeps the main agent coherent and focused.
### [Write Subagent Instructions for Summarization](#write-subagent-instructions-for-summarization)
For `toModelOutput` to extract a useful summary, your subagent must produce one. Add explicit instructions like this:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const researchSubagent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
instructions: `You are a research agent. Complete the task autonomously.
IMPORTANT: When you have finished, write a clear summary of your findings as your final response.
This summary will be returned to the main agent, so include all relevant information.`,
tools: {
read: readFileTool,
search: searchTool,
},
});
`
```
Without this instruction, the subagent might not produce a comprehensive summary. It could simply say "Done", leaving `toModelOutput` with nothing useful to extract.
## [Rendering Subagents in the UI (with useChat)](#rendering-subagents-in-the-ui-with-usechat)
To display streaming progress, check the tool part's `state` and `preliminary` flag.
### [Tool Part States](#tool-part-states)
|State|Description|
|`input-streaming`|Tool input being generated|
|`input-available`|Tool ready to execute|
|`output-available`|Tool produced output (check `preliminary`)|
|`output-error`|Tool execution failed|
### [Detecting Streaming vs Complete](#detecting-streaming-vs-complete)
```
`
const hasOutput = part.state === 'output-available';
const isStreaming = hasOutput && part.preliminary === true;
const isComplete = hasOutput && !part.preliminary;
`
```
### [Type Safety for Subagent Output](#type-safety-for-subagent-output)
Export types alongside your agents for use in UI components:
lib/agents.ts
```
`
import { ToolLoopAgent, InferAgentUIMessage } from 'ai';
export const mainAgent = new ToolLoopAgent({
// ... configuration with researchTool
});
// Export the main agent message type for the chat UI
export type MainAgentMessage = InferAgentUIMessage\<typeof mainAgent\>;
`
```
### [Render Messages and Subagent Output](#render-messages-and-subagent-output)
This example uses the types defined above to render both the main agent's messages and the subagent's streamed output:
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import type { MainAgentMessage } from '@/lib/agents';
export function Chat() {
const { messages } = useChat\<MainAgentMessage\>();
return (
\<div\>
{messages.map(message =\>
message.parts.map((part, i) =\> {
switch (part.type) {
case 'text':
return \<p key={i}\>{part.text}\</p\>;
case 'tool-research':
return (
\<div\>
{part.state !== 'input-streaming' && (
\<div\>Research: {part.input.task}\</div\>
)}
{part.state === 'output-available' && (
\<div\>
{part.output.parts.map((nestedPart, i) =\> {
switch (nestedPart.type) {
case 'text':
return \<p key={i}\>{nestedPart.text}\</p\>;
default:
return null;
}
})}
\</div\>
)}
\</div\>
);
default:
return null;
}
}),
)}
\</div\>
);
}
`
```
## [Caveats](#caveats)
### [No Tool Approvals in Subagents](#no-tool-approvals-in-subagents)
Subagent tools cannot use `needsApproval`. All tools must execute automatically without user confirmation.
### [Subagent Context is Isolated](#subagent-context-is-isolated)
Each subagent invocation starts with a fresh context window. This is one of the key benefits of subagents: they don't inherit the accumulated context from the main agent, which is exactly what allows them to do heavy exploration without bloating the main conversation.
If you need to give a subagent access to the conversation history, the `messages` are available in the tool's execute function alongside `abortSignal`:
```
`
execute: async ({ task }, { abortSignal, messages }) =\> {
const result = await researchSubagent.generate({
messages: [
...messages, // The main agent's conversation history
{ role: 'user', content: task }, // The specific task for this invocation
],
abortSignal,
});
return result.text;
},
`
```
Use this sparingly since passing full history defeats some of the context isolation benefits.
### [Streaming Adds Complexity](#streaming-adds-complexity)
The basic pattern (no streaming) is simpler to implement and debug. Only add streaming when you need to show real-time progress in the UI.
On this page
[Subagents](#subagents)
[How It Works](#how-it-works)
[When to Use Subagents](#when-to-use-subagents)
[Why Use Subagents?](#why-use-subagents)
[Offloading Context-Heavy Tasks](#offloading-context-heavy-tasks)
[Parallelizing Independent Work](#parallelizing-independent-work)
[Specialized Orchestration](#specialized-orchestration)
[Basic Subagent Without Streaming](#basic-subagent-without-streaming)
[Handling Cancellation](#handling-cancellation)
[Streaming Subagent Progress](#streaming-subagent-progress)
[How Preliminary Tool Results Work](#how-preliminary-tool-results-work)
[Building the Complete Message](#building-the-complete-message)
[Controlling What the Model Sees](#controlling-what-the-model-sees)
[How It Works](#how-it-works-1)
[Write Subagent Instructions for Summarization](#write-subagent-instructions-for-summarization)
[Rendering Subagents in the UI (with useChat)](#rendering-subagents-in-the-ui-with-usechat)
[Tool Part States](#tool-part-states)
[Detecting Streaming vs Complete](#detecting-streaming-vs-complete)
[Type Safety for Subagent Output](#type-safety-for-subagent-output)
[Render Messages and Subagent Output](#render-messages-and-subagent-output)
[Caveats](#caveats)
[No Tool Approvals in Subagents](#no-tool-approvals-in-subagents)
[Subagent Context is Isolated](#subagent-context-is-isolated)
[Streaming Adds Complexity](#streaming-adds-complexity)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)