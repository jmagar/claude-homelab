AI SDK UI: DirectChatTransport
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
[useChat](/docs/reference/ai-sdk-ui/use-chat)
[useCompletion](/docs/reference/ai-sdk-ui/use-completion)
[useObject](/docs/reference/ai-sdk-ui/use-object)
[convertToModelMessages](/docs/reference/ai-sdk-ui/convert-to-model-messages)
[pruneMessages](/docs/reference/ai-sdk-ui/prune-messages)
[createUIMessageStream](/docs/reference/ai-sdk-ui/create-ui-message-stream)
[createUIMessageStreamResponse](/docs/reference/ai-sdk-ui/create-ui-message-stream-response)
[pipeUIMessageStreamToResponse](/docs/reference/ai-sdk-ui/pipe-ui-message-stream-to-response)
[readUIMessageStream](/docs/reference/ai-sdk-ui/read-ui-message-stream)
[InferUITools](/docs/reference/ai-sdk-ui/infer-ui-tools)
[InferUITool](/docs/reference/ai-sdk-ui/infer-ui-tool)
[DirectChatTransport](/docs/reference/ai-sdk-ui/direct-chat-transport)
[AI SDK RSC](/docs/reference/ai-sdk-rsc)
[AI SDK Errors](/docs/reference/ai-sdk-errors)
[Migration Guides](/docs/migration-guides)
[Troubleshooting](/docs/troubleshooting)
Copy markdown
# [`DirectChatTransport`](#directchattransport)
A transport that directly communicates with an [Agent](/docs/reference/ai-sdk-core/agent) in-process, without going through HTTP. This is useful for:
* Server-side rendering scenarios
* Testing without network
* Single-process applications
Unlike `DefaultChatTransport` which sends HTTP requests to an API endpoint, `DirectChatTransport` invokes the agent's `stream()` method directly and converts the result to a UI message stream.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { useChat } from '@ai-sdk/react';
import { DirectChatTransport, ToolLoopAgent } from 'ai';
const agent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
instructions: 'You are a helpful assistant.',
});
export default function Chat() {
const { messages, sendMessage, status } = useChat({
transport: new DirectChatTransport({ agent }),
});
// ... render chat UI
}
`
```
## [Import](#import)
```
import { DirectChatTransport } from "ai"
```
## [Constructor](#constructor)
### [Parameters](#parameters)
### agent:
Agent
### options?:
CALL\_OPTIONS
### originalMessages?:
UIMessage[]
### generateMessageId?:
IdGenerator
### messageMetadata?:
(options: { part: TextStreamPart }) =\> METADATA | undefined
### sendReasoning?:
boolean
### sendSources?:
boolean
### sendFinish?:
boolean
### sendStart?:
boolean
### onError?:
(error: unknown) =\> string
## [Methods](#methods)
### [`sendMessages()`](#sendmessages)
Sends messages to the agent and returns a streaming response. This method validates and converts UI messages to model messages, calls the agent's `stream()` method, and returns the result as a UI message stream.
```
`
const stream = await transport.sendMessages({
chatId: 'chat-123',
trigger: 'submit-message',
messages: [...],
abortSignal: controller.signal,
});
`
```
### chatId:
string
### trigger:
'submit-message' | 'regenerate-message'
### messageId:
string | undefined
### messages:
UIMessage[]
### abortSignal:
AbortSignal | undefined
### headers?:
Record\<string, string\> | Headers
### body?:
object
### metadata?:
unknown
#### [Returns](#returns)
Returns a `Promise\<ReadableStream\<UIMessageChunk\>\>` - a stream of UI message chunks that can be processed by the chat UI.
### [`reconnectToStream()`](#reconnecttostream)
Direct transport does not support reconnection since there is no persistent server-side stream to reconnect to.
#### [Returns](#returns-1)
Always returns `Promise\<null\>`.
## [Examples](#examples)
### [Basic Usage](#basic-usage)
```
`
import { useChat } from '@ai-sdk/react';
import { DirectChatTransport, ToolLoopAgent } from 'ai';
import { openai } from '@ai-sdk/openai';
const agent = new ToolLoopAgent({
model: openai('gpt-4o'),
instructions: 'You are a helpful assistant.',
});
export default function Chat() {
const { messages, sendMessage, status } = useChat({
transport: new DirectChatTransport({ agent }),
});
return (
\<div\>
{messages.map(message =\> (
\<div key={message.id}\>
{message.role === 'user' ? 'User: ' : 'AI: '}
{message.parts.map((part, index) =\>
part.type === 'text' ? \<span key={index}\>{part.text}\</span\> : null,
)}
\</div\>
))}
\<button onClick={() =\> sendMessage({ text: 'Hello!' })}\>Send\</button\>
\</div\>
);
}
`
```
### [With Agent Tools](#with-agent-tools)
```
`
import { useChat } from '@ai-sdk/react';
import { DirectChatTransport, ToolLoopAgent, tool } from 'ai';
import { openai } from '@ai-sdk/openai';
import { z } from 'zod';
const weatherTool = tool({
description: 'Get the current weather',
parameters: z.object({
location: z.string().describe('The city and state'),
}),
execute: async ({ location }) =\> {
return `The weather in ${location} is sunny and 72°F.`;
},
});
const agent = new ToolLoopAgent({
model: openai('gpt-4o'),
instructions: 'You are a helpful assistant with access to weather data.',
tools: { weather: weatherTool },
});
export default function Chat() {
const { messages, sendMessage } = useChat({
transport: new DirectChatTransport({ agent }),
});
// ... render chat UI with tool results
}
`
```
### [With Custom Agent Options](#with-custom-agent-options)
```
`
import { useChat } from '@ai-sdk/react';
import { DirectChatTransport, ToolLoopAgent } from 'ai';
import { openai } from '@ai-sdk/openai';
const agent = new ToolLoopAgent\<{ userId: string }\>({
model: openai('gpt-4o'),
prepareCall: ({ options, ...rest }) =\> ({
...rest,
providerOptions: {
openai: { user: options.userId },
},
}),
});
export default function Chat({ userId }: { userId: string }) {
const { messages, sendMessage } = useChat({
transport: new DirectChatTransport({
agent,
options: { userId },
}),
});
// ... render chat UI
}
`
```
### [With Reasoning](#with-reasoning)
```
`
import { useChat } from '@ai-sdk/react';
import { DirectChatTransport, ToolLoopAgent } from 'ai';
import { openai } from '@ai-sdk/openai';
const agent = new ToolLoopAgent({
model: openai('o1-preview'),
});
export default function Chat() {
const { messages, sendMessage } = useChat({
transport: new DirectChatTransport({
agent,
sendReasoning: true,
}),
});
return (
\<div\>
{messages.map(message =\> (
\<div key={message.id}\>
{message.parts.map((part, index) =\> {
if (part.type === 'text') {
return \<p key={index}\>{part.text}\</p\>;
}
if (part.type === 'reasoning') {
return (
\<pre key={index} style={{ opacity: 0.6 }}\>
{part.text}
\</pre\>
);
}
return null;
})}
\</div\>
))}
\</div\>
);
}
`
```
On this page
[DirectChatTransport](#directchattransport)
[Import](#import)
[Constructor](#constructor)
[Parameters](#parameters)
[Methods](#methods)
[sendMessages()](#sendmessages)
[Returns](#returns)
[reconnectToStream()](#reconnecttostream)
[Returns](#returns-1)
[Examples](#examples)
[Basic Usage](#basic-usage)
[With Agent Tools](#with-agent-tools)
[With Custom Agent Options](#with-custom-agent-options)
[With Reasoning](#with-reasoning)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)