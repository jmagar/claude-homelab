Next.js: Track Agent Token Usage
[](https://vercel.com/oss)
Menu
[Guides](/cookbook/guides)
[RAG Agent](/cookbook/guides/rag-chatbot)
[Multi-Modal Agent](/cookbook/guides/multi-modal-chatbot)
[Slackbot Agent Guide](/cookbook/guides/slackbot)
[Natural Language Postgres](/cookbook/guides/natural-language-postgres)
[Get started with Computer Use](/cookbook/guides/computer-use)
[Add Skills to Your Agent](/cookbook/guides/agent-skills)
[Build a Custom Memory Tool](/cookbook/guides/custom-memory-tool)
[Get started with Gemini 3](/cookbook/guides/gemini)
[Get started with Claude 4](/cookbook/guides/claude-4)
[OpenAI Responses API](/cookbook/guides/openai-responses)
[Google Gemini Image Generation](/cookbook/guides/google-gemini-image-generation)
[Get started with Claude 3.7 Sonnet](/cookbook/guides/sonnet-3-7)
[Get started with Llama 3.1](/cookbook/guides/llama-3_1)
[Get started with GPT-5](/cookbook/guides/gpt-5)
[Get started with OpenAI o1](/cookbook/guides/o1)
[Get started with OpenAI o3-mini](/cookbook/guides/o3)
[Get started with DeepSeek R1](/cookbook/guides/r1)
[Get started with DeepSeek V3.2](/cookbook/guides/deepseek-v3-2)
[Next.js](/cookbook/next)
[Generate Text](/cookbook/next/generate-text)
[Generate Text with Chat Prompt](/cookbook/next/generate-text-with-chat-prompt)
[Generate Image with Chat Prompt](/cookbook/next/generate-image-with-chat-prompt)
[Stream Text](/cookbook/next/stream-text)
[Stream Text with Chat Prompt](/cookbook/next/stream-text-with-chat-prompt)
[Stream Text with Image Prompt](/cookbook/next/stream-text-with-image-prompt)
[Chat with PDFs](/cookbook/next/chat-with-pdf)
[streamText Multi-Step Cookbook](/cookbook/next/stream-text-multistep)
[Markdown Chatbot with Memoization](/cookbook/next/markdown-chatbot-with-memoization)
[Generate Object](/cookbook/next/generate-object)
[Generate Object with File Prompt through Form Submission](/cookbook/next/generate-object-with-file-prompt)
[Stream Object](/cookbook/next/stream-object)
[Call Tools](/cookbook/next/call-tools)
[Call Tools in Multiple Steps](/cookbook/next/call-tools-multiple-steps)
[Model Context Protocol (MCP) Tools](/cookbook/next/mcp-tools)
[Share useChat State Across Components](/cookbook/next/use-shared-chat-context)
[Human-in-the-Loop with Next.js](/cookbook/next/human-in-the-loop)
[Track Agent Token Usage](/cookbook/next/track-agent-token-usage)
[Send Custom Body from useChat](/cookbook/next/send-custom-body-from-use-chat)
[Streaming with Custom Format](/cookbook/next/custom-stream-format)
[Render Visual Interface in Chat](/cookbook/next/render-visual-interface-in-chat)
[Caching Middleware](/cookbook/next/caching-middleware)
[Node](/cookbook/node)
[Generate Text](/cookbook/node/generate-text)
[Generate Text with Chat Prompt](/cookbook/node/generate-text-with-chat-prompt)
[Generate Text with Image Prompt](/cookbook/node/generate-text-with-image-prompt)
[Stream Text](/cookbook/node/stream-text)
[Stream Text with Chat Prompt](/cookbook/node/stream-text-with-chat-prompt)
[Stream Text with Image Prompt](/cookbook/node/stream-text-with-image-prompt)
[Stream Text with File Prompt](/cookbook/node/stream-text-with-file-prompt)
[Generate Object with a Reasoning Model](/cookbook/node/generate-object-reasoning)
[Generate Object](/cookbook/node/generate-object)
[Stream Object](/cookbook/node/stream-object)
[Stream Object with Image Prompt](/cookbook/node/stream-object-with-image-prompt)
[Record Token Usage After Streaming Object](/cookbook/node/stream-object-record-token-usage)
[Record Final Object after Streaming Object](/cookbook/node/stream-object-record-final-object)
[Call Tools](/cookbook/node/call-tools)
[Call Tools in Parallel](/cookbook/node/call-tools-in-parallel)
[Call Tools with Image Prompt](/cookbook/node/call-tools-with-image-prompt)
[Call Tools in Multiple Steps](/cookbook/node/call-tools-multiple-steps)
[Model Context Protocol (MCP) Tools](/cookbook/node/mcp-tools)
[Manual Agent Loop](/cookbook/node/manual-agent-loop)
[Web Search Agent](/cookbook/node/web-search-agent)
[Model Context Protocol (MCP) Elicitation](/cookbook/node/mcp-elicitation)
[Embed Text](/cookbook/node/embed-text)
[Embed Text in Batch](/cookbook/node/embed-text-batch)
[Intercepting Fetch Requests](/cookbook/node/intercept-fetch-requests)
[Local Caching Middleware](/cookbook/node/local-caching-middleware)
[Repair Malformed JSON with jsonrepair](/cookbook/node/repair-json-with-jsonrepair)
[Dynamic Prompt Caching](/cookbook/node/dynamic-prompt-caching)
[Retrieval Augmented Generation](/cookbook/node/retrieval-augmented-generation)
[Knowledge Base Agent](/cookbook/node/knowledge-base-agent)
[API Servers](/cookbook/api-servers)
[Node.js HTTP Server](/cookbook/api-servers/node-http-server)
[Express](/cookbook/api-servers/express)
[Hono](/cookbook/api-servers/hono)
[Fastify](/cookbook/api-servers/fastify)
[Nest.js](/cookbook/api-servers/nest)
[React Server Components](/cookbook/rsc)
Copy markdown
# [Track Agent Token Usage](#track-agent-token-usage)
For more information about building agents, check out the [ToolLoopAgent
documentation](/docs/reference/ai-sdk-core/tool-loop-agent).
Tracking token consumption in agentic applications helps you monitor costs and implement context management strategies.
This recipe shows how to track usage across steps and make it available throughout your agent's lifecycle.
## [Start with a Basic Agent](#start-with-a-basic-agent)
First, set up a basic `ToolLoopAgent` with a tool. Define an `AgentUIMessage` type using `InferAgentUIMessage` to get type-safe messages on the frontend, including typed tool calls and results.
ai/agent.ts
```
`
import { type InferAgentUIMessage, ToolLoopAgent, tool } from 'ai';
import { z } from 'zod';
export const agent = new ToolLoopAgent({
model: 'anthropic/claude-haiku-4.5',
tools: {
greet: tool({
description: 'Greets a person by their name.',
inputSchema: z.object({ name: z.string() }),
execute: async ({ name }) =\> `Greeted ${name}`,
}),
},
});
export type AgentUIMessage = InferAgentUIMessage\<typeof agent\>;
`
```
Create a route handler that streams the agent's response. Use `AgentUIMessage` to type the messages coming from the client.
app/api/chat/route.ts
```
`
import { convertToModelMessages } from 'ai';
import { type AgentUIMessage, agent } from '@/ai/agent';
export async function POST(req: Request) {
const { messages }: { messages: AgentUIMessage[] } = await req.json();
const result = await agent.stream({
messages: await convertToModelMessages(messages),
});
return result.toUIMessageStreamResponse();
}
`
```
And a basic chat interface using `useChat`. Pass `AgentUIMessage` as a generic to get type-safe access to messages, including typed tool invocations and results.
app/page.tsx
```
`
'use client';
import { type AgentUIMessage } from '@/ai/agent';
import { useChat } from '@ai-sdk/react';
import { useState } from 'react';
export default function Chat() {
const [input, setInput] = useState('');
const { messages, sendMessage } = useChat\<AgentUIMessage\>();
return (
\<div\>
{messages.map(m =\> (
\<div key={m.id}\>
\<strong\>{m.role}:\</strong\>
{m.parts.map(
(p, i) =\> p.type === 'text' && \<span key={i}\>{p.text}\</span\>,
)}
\</div\>
))}
\<form
onSubmit={e =\> {
e.preventDefault();
sendMessage({ text: input });
setInput('');
}}
\>
\<input value={input} onChange={e =\> setInput(e.target.value)} /\>
\</form\>
\</div\>
);
}
`
```
## [Access Usage Between Steps with Message Metadata](#access-usage-between-steps-with-message-metadata)
To track token usage, attach it to each message using the `messageMetadata` callback. First, define a metadata type and pass it as a second generic to `InferAgentUIMessage`.
ai/agent.ts
```
`
import {
type InferAgentUIMessage,
type LanguageModelUsage,
ToolLoopAgent,
tool,
} from 'ai';
import { z } from 'zod';
export const agent = new ToolLoopAgent({
model: 'anthropic/claude-haiku-4.5',
tools: {
greet: tool({
description: 'Greets a person by their name.',
inputSchema: z.object({ name: z.string() }),
execute: async ({ name }) =\> `Greeted ${name}`,
}),
},
});
type AgentMetadata = { usage: LanguageModelUsage };
export type AgentUIMessage = InferAgentUIMessage\<typeof agent, AgentMetadata\>;
`
```
Now add the `messageMetadata` callback to the route handler. Pass `AgentUIMessage` as a generic to `toUIMessageStreamResponse` to type the callback. When a step finishes, the `finish-step` part contains usage data that you can include in the message metadata.
app/api/chat/route.ts
```
`
import { convertToModelMessages } from 'ai';
import { type AgentUIMessage, agent } from '@/ai/agent';
export async function POST(req: Request) {
const { messages }: { messages: AgentUIMessage[] } = await req.json();
const result = await agent.stream({
messages: await convertToModelMessages(messages),
});
return result.toUIMessageStreamResponse\<AgentUIMessage\>({
messageMetadata: ({ part }) =\> {
if (part.type === 'finish-step') {
return { usage: part.usage };
}
},
});
}
`
```
Now you can access the metadata on the client. The `AgentUIMessage` type already includes the metadata shape, giving you type-safe access to `m.metadata.usage`.
app/page.tsx
```
`
'use client';
import { type AgentUIMessage } from '@/ai/agent';
import { useChat } from '@ai-sdk/react';
import { useState } from 'react';
export default function Chat() {
const [input, setInput] = useState('');
const { messages, sendMessage } = useChat\<AgentUIMessage\>();
return (
\<div\>
{messages.map((m) =\> (
\<div key={m.id}\>
\<strong\>{m.role}:\</strong\>
{m.parts.map((p, i) =\> p.type === 'text' && \<span key={i}\>{p.text}\</span\>)}
{m.metadata?.usage && (
\<div\>Input tokens: {m.metadata.usage.inputTokens}\</div\>
)}
\</div\>
))}
\<form onSubmit={(e) =\> {
e.preventDefault();
sendMessage({ text: input });
setInput('');
}}\>
\<input value={input} onChange={(e) =\> setInput(e.target.value)} /\>
\</form\>
\</div\>
);
}
`
```
## [Pass Usage Back to the Agent with Call Options](#pass-usage-back-to-the-agent-with-call-options)
You now have usage data displayed in the UI. But what if you want to act on that data? For example, you might want to implement context compaction when approaching token limits.
To manipulate messages or apply context management strategies, you'd use the `prepareStep` callback. However, `prepareStep` only has access to steps from the current run. On the first step of a new request, `steps` is empty, leaving you with no visibility into how many tokens the conversation has accumulated across previous requests.
To solve this, pass the usage from previous messages back to the agent. Use `callOptionsSchema` to define the data shape and `prepareCall` to make it available on `experimental\_context`, where `prepareStep` can access it.
ai/agent.ts
```
`
import {
type InferAgentUIMessage,
type LanguageModelUsage,
ToolLoopAgent,
tool,
} from 'ai';
import { z } from 'zod';
export const agent = new ToolLoopAgent({
model: 'anthropic/claude-haiku-4.5',
callOptionsSchema: z.object({
lastInputTokens: z.number(),
}),
tools: {
greet: tool({
description: 'Greets a person by their name.',
inputSchema: z.object({ name: z.string() }),
execute: async ({ name }) =\> `Greeted ${name}`,
}),
},
prepareCall: ({ options, ...settings }) =\> {
return {
...settings,
experimental\_context: { lastInputTokens: options.lastInputTokens },
};
},
});
type AgentMetadata = { usage: LanguageModelUsage };
export type AgentUIMessage = InferAgentUIMessage\<typeof agent, AgentMetadata\>;
`
```
Extract the last input token count from previous messages and pass it to the agent.
app/api/chat/route.ts
```
`
import { convertToModelMessages } from 'ai';
import { type AgentUIMessage, agent } from '@/ai/agent';
export async function POST(req: Request) {
const { messages }: { messages: AgentUIMessage[] } = await req.json();
const lastInputTokens =
messages.filter(m =\> m.role === 'assistant').at(-1)?.metadata?.usage
?.inputTokens ?? 0;
const result = await agent.stream({
messages: await convertToModelMessages(messages),
options: {
lastInputTokens,
},
});
return result.toUIMessageStreamResponse\<AgentUIMessage\>({
messageMetadata: ({ part }) =\> {
if (part.type === 'finish-step') {
return { usage: part.usage };
}
},
});
}
`
```
## [Access Usage in prepareStep and Tools](#access-usage-in-preparestep-and-tools)
With the usage on `experimental\_context`, you can access it in `prepareStep` to make decisions about context management, or pass it to your tools.
ai/agent.ts
```
`
import {
type InferAgentUIMessage,
type LanguageModelUsage,
ToolLoopAgent,
tool,
} from 'ai';
import { z } from 'zod';
type TContext = {
lastInputTokens: number;
};
export const agent = new ToolLoopAgent({
model: 'anthropic/claude-haiku-4.5',
callOptionsSchema: z.object({
lastInputTokens: z.number(),
}),
tools: {
greet: tool({
description: 'Greets a person by their name.',
inputSchema: z.object({ name: z.string() }),
execute: async ({ name }) =\> `Greeted ${name}`,
}),
},
prepareCall: ({ options, ...settings }) =\> {
return {
...settings,
experimental\_context: { lastInputTokens: options.lastInputTokens },
};
},
prepareStep: ({ steps, experimental\_context }) =\> {
const lastStep = steps.at(-1);
const lastStepUsage =
lastStep?.usage?.inputTokens ??
(experimental\_context as TContext)?.lastInputTokens ??
0;
console.log('Last step input tokens:', lastStepUsage);
// You can use this to implement context compaction strategies
return {
experimental\_context: {
...experimental\_context,
lastStepUsage,
},
};
},
});
type AgentMetadata = { usage: LanguageModelUsage };
export type AgentUIMessage = InferAgentUIMessage\<typeof agent, AgentMetadata\>;
`
```
The `prepareStep` callback runs before each step, giving you access to:
* `steps`: All previous steps with their usage data
* `experimental\_context`: The context set by `prepareCall` (usage from the previous request)
This allows you to track token consumption across the entire conversation lifecycle and implement strategies like context compaction when approaching token limits.
On this page
[Track Agent Token Usage](#track-agent-token-usage)
[Start with a Basic Agent](#start-with-a-basic-agent)
[Access Usage Between Steps with Message Metadata](#access-usage-between-steps-with-message-metadata)
[Pass Usage Back to the Agent with Call Options](#pass-usage-back-to-the-agent-with-call-options)
[Access Usage in prepareStep and Tools](#access-usage-in-preparestep-and-tools)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)