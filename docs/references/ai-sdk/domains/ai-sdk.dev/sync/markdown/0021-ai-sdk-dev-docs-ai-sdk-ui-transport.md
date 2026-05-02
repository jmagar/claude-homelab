AI SDK UI: Transport
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
# [Transport](#transport)
The `useChat` transport system provides fine-grained control over how messages are sent to your API endpoints and how responses are processed. This is particularly useful for alternative communication protocols like WebSockets, custom authentication patterns, or specialized backend integrations.
## [Default Transport](#default-transport)
By default, `useChat` uses HTTP POST requests to send messages to `/api/chat`:
```
`
import { useChat } from '@ai-sdk/react';
// Uses default HTTP transport
const { messages, sendMessage } = useChat();
`
```
This is equivalent to:
```
`
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport } from 'ai';
const { messages, sendMessage } = useChat({
transport: new DefaultChatTransport({
api: '/api/chat',
}),
});
`
```
## [Custom Transport Configuration](#custom-transport-configuration)
Configure the default transport with custom options:
```
`
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport } from 'ai';
const { messages, sendMessage } = useChat({
transport: new DefaultChatTransport({
api: '/api/custom-chat',
headers: {
Authorization: 'Bearer your-token',
'X-API-Version': '2024-01',
},
credentials: 'include',
}),
});
`
```
### [Dynamic Configuration](#dynamic-configuration)
You can also provide functions that return configuration values. This is useful for authentication tokens that need to be refreshed, or for configuration that depends on runtime conditions:
```
`
const { messages, sendMessage } = useChat({
transport: new DefaultChatTransport({
api: '/api/chat',
headers: () =\> ({
Authorization: `Bearer ${getAuthToken()}`,
'X-User-ID': getCurrentUserId(),
}),
body: () =\> ({
sessionId: getCurrentSessionId(),
preferences: getUserPreferences(),
}),
credentials: () =\> 'include',
}),
});
`
```
### [Request Transformation](#request-transformation)
Transform requests before sending to your API:
```
`
const { messages, sendMessage } = useChat({
transport: new DefaultChatTransport({
api: '/api/chat',
prepareSendMessagesRequest: ({ id, messages, trigger, messageId }) =\> {
return {
headers: {
'X-Session-ID': id,
},
body: {
messages: messages.slice(-10), // Only send last 10 messages
trigger,
messageId,
},
};
},
}),
});
`
```
## [Direct Agent Transport](#direct-agent-transport)
For scenarios where you want to communicate directly with an [Agent](/docs/reference/ai-sdk-core/agent) without going through HTTP, you can use `DirectChatTransport`. This transport invokes the agent's `stream()` method directly in-process.
This is useful for:
* **Server-side rendering**: Run the agent on the server without an API endpoint
* **Testing**: Test chat functionality without network requests
* **Single-process applications**: Desktop or CLI apps where client and agent run together
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
tools: {
weather: weatherTool,
},
});
const { messages, sendMessage } = useChat({
transport: new DirectChatTransport({ agent }),
});
`
```
### [How It Works](#how-it-works)
Unlike `DefaultChatTransport` which sends HTTP requests:
1. `DirectChatTransport` validates incoming UI messages
2. Converts them to model messages using `convertToModelMessages`
3. Calls the agent's `stream()` method directly
4. Returns the result as a UI message stream via `toUIMessageStream()`
### [Configuration Options](#configuration-options)
You can pass additional options to customize the stream output:
```
`
const transport = new DirectChatTransport({
agent,
// Pass options to the agent
options: { customOption: 'value' },
// Configure what's sent to the client
sendReasoning: true,
sendSources: true,
});
`
```
`DirectChatTransport` does not support stream reconnection since there is no
persistent server-side stream. The `reconnectToStream()` method always returns
`null`.
For complete API details, see the [DirectChatTransport reference](/docs/reference/ai-sdk-ui/direct-chat-transport).
## [Building Custom Transports](#building-custom-transports)
To understand how to build your own transport, refer to the source code of the default implementation:
* **[DefaultChatTransport](https://github.com/vercel/ai/blob/main/packages/ai/src/ui/default-chat-transport.ts)** - The complete default HTTP transport implementation
* **[HttpChatTransport](https://github.com/vercel/ai/blob/main/packages/ai/src/ui/http-chat-transport.ts)** - Base HTTP transport with request handling
* **[ChatTransport Interface](https://github.com/vercel/ai/blob/main/packages/ai/src/ui/chat-transport.ts)** - The transport interface you need to implement
These implementations show you exactly how to:
* Handle the `sendMessages` method
* Process UI message streams
* Transform requests and responses
* Handle errors and connection management
The transport system gives you complete control over how your chat application communicates, enabling integration with any backend protocol or service.
On this page
[Transport](#transport)
[Default Transport](#default-transport)
[Custom Transport Configuration](#custom-transport-configuration)
[Dynamic Configuration](#dynamic-configuration)
[Request Transformation](#request-transformation)
[Direct Agent Transport](#direct-agent-transport)
[How It Works](#how-it-works)
[Configuration Options](#configuration-options)
[Building Custom Transports](#building-custom-transports)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)