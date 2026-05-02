Next.js: Human-in-the-Loop with Next.js
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
# [Human-in-the-Loop with Next.js](#human-in-the-loop-with-nextjs)
When building agentic systems, it's important to add human-in-the-loop (HITL) functionality to ensure that users can approve actions before the system executes them. The AI SDK provides built-in support for tool execution approval through the `needsApproval` property on tools.
This recipe shows how to add a human approval step to a Next.js chatbot using the AI SDK's native tool execution approval feature.
## [Background](#background)
To understand how to implement this functionality, let's look at how tool calling works in a Next.js chatbot application with the AI SDK.
On the frontend, use the `useChat` hook to manage the message state and user interaction.
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport } from 'ai';
import { useState } from 'react';
export default function Chat() {
const { messages, sendMessage } = useChat({
transport: new DefaultChatTransport({
api: '/api/chat',
}),
});
const [input, setInput] = useState('');
return (
\<div\>
\<div\>
{messages?.map(m =\> (
\<div key={m.id}\>
\<strong\>{`${m.role}: `}\</strong\>
{m.parts?.map((part, i) =\> {
switch (part.type) {
case 'text':
return \<div key={i}\>{part.text}\</div\>;
}
})}
\<br /\>
\</div\>
))}
\</div\>
\<form
onSubmit={e =\> {
e.preventDefault();
if (input.trim()) {
sendMessage({ text: input });
setInput('');
}
}}
\>
\<input
value={input}
placeholder="Say something..."
onChange={e =\> setInput(e.target.value)}
/\>
\</form\>
\</div\>
);
}
`
```
On the backend, create a route handler that uses `streamText` and returns a `UIMessageStreamResponse`. The tool has an `execute` function that runs automatically when the model calls it.
app/api/chat/route.ts
```
`
import { streamText, tool } from 'ai';
import { openai } from '@ai-sdk/openai';
import { z } from 'zod';
export async function POST(req: Request) {
const { messages } = await req.json();
const result = streamText({
model: openai('gpt-4o'),
messages,
tools: {
getWeatherInformation: tool({
description: 'show the weather in a given city to the user',
inputSchema: z.object({ city: z.string() }),
execute: async ({ city }) =\> {
const weatherOptions = ['sunny', 'cloudy', 'rainy', 'snowy'];
return weatherOptions[
Math.floor(Math.random() \* weatherOptions.length)
];
},
}),
},
});
return result.toUIMessageStreamResponse();
}
`
```
When a user asks the LLM for the weather in New York, the model generates a tool call with the city parameter. The AI SDK then runs the `execute` function automatically and returns the result.
To add a HITL step, you add an approval gate between the tool call and the tool execution using `needsApproval`.
## [Adding Tool Execution Approval](#adding-tool-execution-approval)
### [Server Setup](#server-setup)
Add `needsApproval: true` to the tool definition. The tool keeps its `execute` function, but the SDK pauses execution until the user approves.
app/api/chat/route.ts
```
`
import { streamText, tool } from 'ai';
import { openai } from '@ai-sdk/openai';
import { z } from 'zod';
export async function POST(req: Request) {
const { messages } = await req.json();
const result = streamText({
model: openai('gpt-4o'),
messages,
tools: {
getWeatherInformation: tool({
description: 'show the weather in a given city to the user',
inputSchema: z.object({ city: z.string() }),
needsApproval: true,
execute: async ({ city }) =\> {
const weatherOptions = ['sunny', 'cloudy', 'rainy', 'snowy'];
return weatherOptions[
Math.floor(Math.random() \* weatherOptions.length)
];
},
}),
},
});
return result.toUIMessageStreamResponse();
}
`
```
When the model calls this tool, instead of running the `execute` function, the SDK sends a tool part with the `approval-requested` state to the client. The tool only executes after the user responds.
### [Client-Side Approval UI](#client-side-approval-ui)
On the frontend, check for the `approval-requested` state and render approve/deny buttons. Use `addToolApprovalResponse` from the `useChat` hook to send the user's decision.
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import {
DefaultChatTransport,
lastAssistantMessageIsCompleteWithApprovalResponses,
} from 'ai';
import { useState } from 'react';
export default function Chat() {
const { messages, sendMessage, addToolApprovalResponse } = useChat({
transport: new DefaultChatTransport({
api: '/api/chat',
}),
sendAutomaticallyWhen: lastAssistantMessageIsCompleteWithApprovalResponses,
});
const [input, setInput] = useState('');
return (
\<div\>
\<div\>
{messages?.map(m =\> (
\<div key={m.id}\>
\<strong\>{`${m.role}: `}\</strong\>
{m.parts?.map((part, i) =\> {
if (part.type === 'text') {
return \<div key={i}\>{part.text}\</div\>;
}
if (part.type === 'tool-getWeatherInformation') {
switch (part.state) {
case 'approval-requested':
return (
\<div key={part.toolCallId}\>
Get weather information for {part.input.city}?
\<div\>
\<button
onClick={() =\>
addToolApprovalResponse({
id: part.approval.id,
approved: true,
})
}
\>
Approve
\</button\>
\<button
onClick={() =\>
addToolApprovalResponse({
id: part.approval.id,
approved: false,
})
}
\>
Deny
\</button\>
\</div\>
\</div\>
);
case 'output-available':
return (
\<div key={part.toolCallId}\>
Weather in {part.input.city}: {part.output}
\</div\>
);
case 'output-denied':
return (
\<div key={part.toolCallId}\>
Weather request for {part.input.city} was denied.
\</div\>
);
}
}
})}
\<br /\>
\</div\>
))}
\</div\>
\<form
onSubmit={e =\> {
e.preventDefault();
if (input.trim()) {
sendMessage({ text: input });
setInput('');
}
}}
\>
\<input
value={input}
placeholder="Say something..."
onChange={e =\> setInput(e.target.value)}
/\>
\</form\>
\</div\>
);
}
`
```
Here's how the approval flow works:
1. The model calls `getWeatherInformation` with a city
2. The tool part enters the `approval-requested` state with an `approval.id`
3. The UI renders approve/deny buttons
4. When the user clicks a button, `addToolApprovalResponse` records the decision
5. `sendAutomaticallyWhen` detects all approvals are responded to and sends the message
6. On the server, if approved, the `execute` function runs and returns the result. If denied, the model receives the denial and responds accordingly.
### [Auto-Submit After Approval](#auto-submit-after-approval)
The `sendAutomaticallyWhen` option with `lastAssistantMessageIsCompleteWithApprovalResponses` automatically sends a message after all tool approvals in the last step have been responded to. Without this, you would need to call `sendMessage()` manually after each approval.
```
`
import { useChat } from '@ai-sdk/react';
import { lastAssistantMessageIsCompleteWithApprovalResponses } from 'ai';
const { messages, addToolApprovalResponse } = useChat({
sendAutomaticallyWhen: lastAssistantMessageIsCompleteWithApprovalResponses,
});
`
```
If nothing happens after you approve a tool execution, make sure you either
call `sendMessage` manually or configure `sendAutomaticallyWhen` on the
`useChat` hook.
### [Dynamic Approval](#dynamic-approval)
You can make approval conditional based on the tool's input by providing an async function to `needsApproval`:
app/api/chat/route.ts
```
`
import { streamText, tool } from 'ai';
import { openai } from '@ai-sdk/openai';
import { z } from 'zod';
export async function POST(req: Request) {
const { messages } = await req.json();
const result = streamText({
model: openai('gpt-4o'),
messages,
tools: {
processPayment: tool({
description: 'Process a payment',
inputSchema: z.object({
amount: z.number(),
recipient: z.string(),
}),
needsApproval: async ({ amount }) =\> amount \> 1000,
execute: async ({ amount, recipient }) =\> {
return `Payment of $${amount} to ${recipient} processed.`;
},
}),
},
});
return result.toUIMessageStreamResponse();
}
`
```
In this example, only payments over $1000 require approval. Smaller amounts execute automatically.
### [Handling Denial](#handling-denial)
When a user denies a tool execution, the model receives the denial and can respond accordingly. To prevent the model from retrying the same tool call, add an instruction:
```
`
const result = streamText({
model: openai('gpt-4o'),
messages,
system:
'When a tool execution is not approved by the user, do not retry it. ' +
'Inform the user that the action was not performed.',
tools: {
// ...
},
});
`
```
## [Full Example](#full-example)
To see this code in action, check out the [`next-openai` example](https://github.com/vercel/ai/tree/main/examples/next-openai) in the AI SDK repository. Navigate to the `/test-tool-approval` page and associated route handler.
For more details on tool execution approval, see the [Tool Execution Approval](/docs/ai-sdk-core/tools-and-tool-calling#tool-execution-approval) and [Chatbot Tool Usage](/docs/ai-sdk-ui/chatbot-tool-usage#tool-execution-approval) documentation.
On this page
[Human-in-the-Loop with Next.js](#human-in-the-loop-with-nextjs)
[Background](#background)
[Adding Tool Execution Approval](#adding-tool-execution-approval)
[Server Setup](#server-setup)
[Client-Side Approval UI](#client-side-approval-ui)
[Auto-Submit After Approval](#auto-submit-after-approval)
[Dynamic Approval](#dynamic-approval)
[Handling Denial](#handling-denial)
[Full Example](#full-example)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)