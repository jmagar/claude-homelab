Agents: Loop Control
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
# [Loop Control](#loop-control)
You can control both the execution flow and the settings at each step of the agent loop. The loop continues until:
* A finish reasoning other than tool-calls is returned, or
* A tool that is invoked does not have an execute function, or
* A tool call needs approval, or
* A stop condition is met
The AI SDK provides built-in loop control through two parameters: `stopWhen` for defining stopping conditions and `prepareStep` for modifying settings (model, tools, messages, and more) between steps.
## [Stop Conditions](#stop-conditions)
The `stopWhen` parameter controls when to stop execution when there are tool results in the last step. By default, agents stop after 20 steps using `stepCountIs(20)`. This default is a safety measure to prevent runaway loops that could result in excessive API calls and costs.
When you provide `stopWhen`, the agent continues executing after tool calls until a stopping condition is met. When the condition is an array, execution stops when any of the conditions are met.
### [Use Built-in Conditions](#use-built-in-conditions)
The AI SDK provides several built-in stopping conditions:
* `stepCountIs(count)` — stops after a specified number of steps
* `hasToolCall(toolName)` — stops when a specific tool is called
* `isLoopFinished()` — never triggers, letting the loop run until the agent is naturally finished
### [Run Up to a Maximum Number of Steps](#run-up-to-a-maximum-number-of-steps)
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent, stepCountIs } from 'ai';
const agent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
tools: {
// your tools
},
stopWhen: stepCountIs(50), // Increasing the default of 20 to 50.
});
const result = await agent.generate({
prompt: 'Analyze this dataset and create a summary report',
});
`
```
### [Run Until Finished](#run-until-finished)
If you want the agent to run until the model naturally stops making tool calls, use `isLoopFinished()`. This removes the default step limit:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent, isLoopFinished } from 'ai';
const agent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
tools: {
// your tools
},
stopWhen: isLoopFinished(), // No maximum step limit.
});
const result = await agent.generate({
prompt: 'Analyze this dataset and create a summary report',
});
`
```
Use `isLoopFinished()` with caution. Without a step limit, the agent could
potentially run indefinitely or incur significant costs if the model keeps
making tool calls.
### [Combine Multiple Conditions](#combine-multiple-conditions)
Combine multiple stopping conditions. The loop stops when it meets any condition:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent, stepCountIs, hasToolCall } from 'ai';
const agent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
tools: {
// your tools
},
stopWhen: [
stepCountIs(20), // Maximum 20 steps
hasToolCall('someTool'), // Stop after calling 'someTool'
],
});
const result = await agent.generate({
prompt: 'Research and analyze the topic',
});
`
```
### [Create Custom Conditions](#create-custom-conditions)
Build custom stopping conditions for specific requirements:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent, StopCondition, ToolSet } from 'ai';
const tools = {
// your tools
} satisfies ToolSet;
const hasAnswer: StopCondition\<typeof tools\> = ({ steps }) =\> {
// Stop when the model generates text containing "ANSWER:"
return steps.some(step =\> step.text?.includes('ANSWER:')) ?? false;
};
const agent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
tools,
stopWhen: hasAnswer,
});
const result = await agent.generate({
prompt: 'Find the answer and respond with "ANSWER: [your answer]"',
});
`
```
Custom conditions receive step information across all steps:
```
`
const budgetExceeded: StopCondition\<typeof tools\> = ({ steps }) =\> {
const totalUsage = steps.reduce(
(acc, step) =\> ({
inputTokens: acc.inputTokens + (step.usage?.inputTokens ?? 0),
outputTokens: acc.outputTokens + (step.usage?.outputTokens ?? 0),
}),
{ inputTokens: 0, outputTokens: 0 },
);
const costEstimate =
(totalUsage.inputTokens \* 0.01 + totalUsage.outputTokens \* 0.03) / 1000;
return costEstimate \> 0.5; // Stop if cost exceeds $0.50
};
`
```
## [Prepare Step](#prepare-step)
The `prepareStep` callback runs before each step in the loop and defaults to the initial settings if you don't return any changes. Use it to modify settings, manage context, or implement dynamic behavior based on execution history.
### [Dynamic Model Selection](#dynamic-model-selection)
Switch models based on step requirements:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent } from 'ai';
const agent = new ToolLoopAgent({
model: 'openai/gpt-4o-mini', // Default model
tools: {
// your tools
},
prepareStep: async ({ stepNumber, messages }) =\> {
// Use a stronger model for complex reasoning after initial steps
if (stepNumber \> 2 && messages.length \> 10) {
return {
model: "anthropic/claude-sonnet-4.5",
};
}
// Continue with default settings
return {};
},
});
const result = await agent.generate({
prompt: '...',
});
`
```
### [Context Management](#context-management)
Manage growing conversation history in long-running loops:
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
// your tools
},
prepareStep: async ({ messages }) =\> {
// Keep only recent messages to stay within context limits
if (messages.length \> 20) {
return {
messages: [
messages[0], // Keep system instructions
...messages.slice(-10), // Keep last 10 messages
],
};
}
return {};
},
});
const result = await agent.generate({
prompt: '...',
});
`
```
### [Tool Selection](#tool-selection)
Control which tools are available at each step:
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
search: searchTool,
analyze: analyzeTool,
summarize: summarizeTool,
},
prepareStep: async ({ stepNumber, steps }) =\> {
// Search phase (steps 0-2)
if (stepNumber \<= 2) {
return {
activeTools: ['search'],
toolChoice: 'required',
};
}
// Analysis phase (steps 3-5)
if (stepNumber \<= 5) {
return {
activeTools: ['analyze'],
};
}
// Summary phase (step 6+)
return {
activeTools: ['summarize'],
toolChoice: 'required',
};
},
});
const result = await agent.generate({
prompt: '...',
});
`
```
You can also force a specific tool to be used:
```
`
prepareStep: async ({ stepNumber }) =\> {
if (stepNumber === 0) {
// Force the search tool to be used first
return {
toolChoice: { type: 'tool', toolName: 'search' },
};
}
if (stepNumber === 5) {
// Force the summarize tool after analysis
return {
toolChoice: { type: 'tool', toolName: 'summarize' },
};
}
return {};
};
`
```
### [Message Modification](#message-modification)
Transform messages before sending them to the model:
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
// your tools
},
prepareStep: async ({ messages, stepNumber }) =\> {
// Summarize tool results to reduce token usage
const processedMessages = messages.map(msg =\> {
if (msg.role === 'tool' && msg.content.length \> 1000) {
return {
...msg,
content: summarizeToolResult(msg.content),
};
}
return msg;
});
return { messages: processedMessages };
},
});
const result = await agent.generate({
prompt: '...',
});
`
```
## [Access Step Information](#access-step-information)
Both `stopWhen` and `prepareStep` receive detailed information about the current execution:
```
`
prepareStep: async ({
model, // Current model configuration
stepNumber, // Current step number (0-indexed)
steps, // All previous steps with their results
messages, // Messages to be sent to the model
}) =\> {
// Access previous tool calls and results
const previousToolCalls = steps.flatMap(step =\> step.toolCalls);
const previousResults = steps.flatMap(step =\> step.toolResults);
// Make decisions based on execution history
if (previousToolCalls.some(call =\> call.toolName === 'dataAnalysis')) {
return {
toolChoice: { type: 'tool', toolName: 'reportGenerator' },
};
}
return {};
},
`
```
## [Forced Tool Calling](#forced-tool-calling)
You can force the agent to always use tools by combining `toolChoice: 'required'` with a `done` tool that has no `execute` function. This pattern ensures the agent uses tools for every step and stops only when it explicitly signals completion.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent, tool } from 'ai';
import { z } from 'zod';
const agent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
tools: {
search: searchTool,
analyze: analyzeTool,
done: tool({
description: 'Signal that you have finished your work',
inputSchema: z.object({
answer: z.string().describe('The final answer'),
}),
// No execute function - stops the agent when called
}),
},
toolChoice: 'required', // Force tool calls at every step
});
const result = await agent.generate({
prompt: 'Research and analyze this topic, then provide your answer.',
});
// extract answer from done tool call
const toolCall = result.staticToolCalls[0]; // tool call from final step
if (toolCall?.toolName === 'done') {
console.log(toolCall.input.answer);
}
`
```
Key aspects of this pattern:
* **`toolChoice: 'required'`**: Forces the model to call a tool at every step instead of generating text directly. This ensures the agent follows a structured workflow.
* **`done` tool without `execute`**: A tool that has no `execute` function acts as a termination signal. When the agent calls this tool, the loop stops because there's no function to execute.
* **Accessing results**: The final answer is available in `result.staticToolCalls`, which contains tool calls that weren't executed.
This pattern is useful when you want the agent to always use specific tools for operations (like code execution or data retrieval) rather than attempting to answer directly.
## [Manual Loop Control](#manual-loop-control)
For scenarios requiring complete control over the agent loop, you can use AI SDK Core functions (`generateText` and `streamText`) to implement your own loop management instead of using `stopWhen` and `prepareStep`. This approach provides maximum flexibility for complex workflows.
### [Implementing a Manual Loop](#implementing-a-manual-loop)
Build your own agent loop when you need full control over execution:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText, ModelMessage } from 'ai';
const messages: ModelMessage[] = [{ role: 'user', content: '...' }];
let step = 0;
const maxSteps = 10;
while (step \< maxSteps) {
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages,
tools: {
// your tools here
},
});
messages.push(...result.response.messages);
if (result.text) {
break; // Stop when model generates text
}
step++;
}
`
```
This manual approach gives you complete control over:
* Message history management
* Step-by-step decision making
* Custom stopping conditions
* Dynamic tool and model selection
* Error handling and recovery
[Learn more about manual agent loops in the cookbook](/cookbook/node/manual-agent-loop).
On this page
[Loop Control](#loop-control)
[Stop Conditions](#stop-conditions)
[Use Built-in Conditions](#use-built-in-conditions)
[Run Up to a Maximum Number of Steps](#run-up-to-a-maximum-number-of-steps)
[Run Until Finished](#run-until-finished)
[Combine Multiple Conditions](#combine-multiple-conditions)
[Create Custom Conditions](#create-custom-conditions)
[Prepare Step](#prepare-step)
[Dynamic Model Selection](#dynamic-model-selection)
[Context Management](#context-management)
[Tool Selection](#tool-selection)
[Message Modification](#message-modification)
[Access Step Information](#access-step-information)
[Forced Tool Calling](#forced-tool-calling)
[Manual Loop Control](#manual-loop-control)
[Implementing a Manual Loop](#implementing-a-manual-loop)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)