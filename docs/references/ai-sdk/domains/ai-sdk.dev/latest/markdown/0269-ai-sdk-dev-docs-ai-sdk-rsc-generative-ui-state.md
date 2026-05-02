AI SDK RSC: Managing Generative UI State
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
[Overview](/docs/ai-sdk-rsc/overview)
[Streaming React Components](/docs/ai-sdk-rsc/streaming-react-components)
[Managing Generative UI State](/docs/ai-sdk-rsc/generative-ui-state)
[Saving and Restoring States](/docs/ai-sdk-rsc/saving-and-restoring-states)
[Multistep Interfaces](/docs/ai-sdk-rsc/multistep-interfaces)
[Streaming Values](/docs/ai-sdk-rsc/streaming-values)
[Handling Loading State](/docs/ai-sdk-rsc/loading-state)
[Error Handling](/docs/ai-sdk-rsc/error-handling)
[Handling Authentication](/docs/ai-sdk-rsc/authentication)
[Migrating from RSC to UI](/docs/ai-sdk-rsc/migrating-to-ui)
[Advanced](/docs/advanced)
[Reference](/docs/reference)
[AI SDK Core](/docs/reference/ai-sdk-core)
[AI SDK UI](/docs/reference/ai-sdk-ui)
[AI SDK RSC](/docs/reference/ai-sdk-rsc)
[AI SDK Errors](/docs/reference/ai-sdk-errors)
[Migration Guides](/docs/migration-guides)
[Troubleshooting](/docs/troubleshooting)
Copy markdown
# [Managing Generative UI State](#managing-generative-ui-state)
AI SDK RSC is currently experimental. We recommend using [AI SDK
UI](/docs/ai-sdk-ui/overview) for production. For guidance on migrating from
RSC to UI, see our [migration guide](/docs/ai-sdk-rsc/migrating-to-ui).
State is an essential part of any application. State is particularly important in AI applications as it is passed to large language models (LLMs) on each request to ensure they have the necessary context to produce a great generation. Traditional chatbots are text-based and have a structure that mirrors that of any chat application.
For example, in a chatbot, state is an array of `messages` where each `message` has:
* `id`: a unique identifier
* `role`: who sent the message (user/assistant/system/tool)
* `content`: the content of the message
This state can be rendered in the UI and sent to the model without any modifications.
With Generative UI, the model can now return a React component, rather than a plain text message. The client can render that component without issue, but that state can't be sent back to the model because React components aren't serialisable. So, what can you do?
**The solution is to split the state in two, where one (AI State) becomes a proxy for the other (UI State)**.
One way to understand this concept is through a Lego analogy. Imagine a 10,000 piece Lego model that, once built, cannot be easily transported because it is fragile. By taking the model apart, it can be easily transported, and then rebuilt following the steps outlined in the instructions pamphlet. In this way, the instructions pamphlet is a proxy to the physical structure. Similarly, AI State provides a serialisable (JSON) representation of your UI that can be passed back and forth to the model.
## [What is AI and UI State?](#what-is-ai-and-ui-state)
The RSC API simplifies how you manage AI State and UI State, providing a robust way to keep them in sync between your database, server and client.
### [AI State](#ai-state)
AI State refers to the state of your application in a serialisable format that will be used on the server and can be shared with the language model.
For a chat app, the AI State is the conversation history (messages) between the user and the assistant. Components generated by the model would be represented in a JSON format as a tool alongside any necessary props. AI State can also be used to store other values and meta information such as `createdAt` for each message and `chatId` for each conversation. The LLM reads this history so it can generate the next message. This state serves as the source of truth for the current application state.
**Note**: AI state can be accessed/modified from both the server and the
client.
### [UI State](#ui-state)
UI State refers to the state of your application that is rendered on the client. It is a fully client-side state (similar to `useState`) that can store anything from JavaScript values to React elements. UI state is a list of actual UI elements that are rendered on the client.
**Note**: UI State can only be accessed client-side.
## [Using AI / UI State](#using-ai--ui-state)
### [Creating the AI Context](#creating-the-ai-context)
AI SDK RSC simplifies managing AI and UI state across your application by providing several hooks. These hooks are powered by [ React context ](https://react.dev/reference/react/hooks#context-hooks) under the hood.
Notably, this means you do not have to pass the message history to the server explicitly for each request. You also can access and update your application state in any child component of the context provider. As you begin building [multistep generative interfaces](/docs/ai-sdk-rsc/multistep-interfaces), this will be particularly helpful.
To use `@ai-sdk/rsc` to manage AI and UI State in your application, you can create a React context using [`createAI`](/docs/reference/ai-sdk-rsc/create-ai):
app/actions.tsx
```
`
// Define the AI state and UI state types
export type ServerMessage = {
role: 'user' | 'assistant';
content: string;
};
export type ClientMessage = {
id: string;
role: 'user' | 'assistant';
display: ReactNode;
};
export const sendMessage = async (input: string): Promise\<ClientMessage\> =\> {
"use server"
...
}
`
```
app/ai.ts
```
`
import { createAI } from '@ai-sdk/rsc';
import { ClientMessage, ServerMessage, sendMessage } from './actions';
export type AIState = ServerMessage[];
export type UIState = ClientMessage[];
// Create the AI provider with the initial states and allowed actions
export const AI = createAI\<AIState, UIState\>({
initialAIState: [],
initialUIState: [],
actions: {
sendMessage,
},
});
`
```
You must pass Server Actions to the `actions` object.
In this example, you define types for AI State and UI State, respectively.
Next, wrap your application with your newly created context. With that, you can get and set AI and UI State across your entire application.
app/layout.tsx
```
`
import { type ReactNode } from 'react';
import { AI } from './ai';
export default function RootLayout({
children,
}: Readonly\<{ children: ReactNode }\>) {
return (
\<AI\>
\<html lang="en"\>
\<body\>{children}\</body\>
\</html\>
\</AI\>
);
}
`
```
## [Reading UI State in Client](#reading-ui-state-in-client)
The UI state can be accessed in Client Components using the [`useUIState`](/docs/reference/ai-sdk-rsc/use-ui-state) hook provided by the RSC API. The hook returns the current UI state and a function to update the UI state like React's `useState`.
app/page.tsx
```
`
'use client';
import { useUIState } from '@ai-sdk/rsc';
export default function Page() {
const [messages, setMessages] = useUIState();
return (
\<ul\>
{messages.map(message =\> (
\<li key={message.id}\>{message.display}\</li\>
))}
\</ul\>
);
}
`
```
## [Reading AI State in Client](#reading-ai-state-in-client)
The AI state can be accessed in Client Components using the [`useAIState`](/docs/reference/ai-sdk-rsc/use-ai-state) hook provided by the RSC API. The hook returns the current AI state.
app/page.tsx
```
`
'use client';
import { useAIState } from '@ai-sdk/rsc';
export default function Page() {
const [messages, setMessages] = useAIState();
return (
\<ul\>
{messages.map(message =\> (
\<li key={message.id}\>{message.content}\</li\>
))}
\</ul\>
);
}
`
```
## [Reading AI State on Server](#reading-ai-state-on-server)
The AI State can be accessed within any Server Action provided to the `createAI` context using the [`getAIState`](/docs/reference/ai-sdk-rsc/get-ai-state) function. It returns the current AI state as a read-only value:
Gateway
Provider
Custom
Claude Sonnet 4.5
app/actions.ts
```
`
import { getAIState } from '@ai-sdk/rsc';
export async function sendMessage(message: string) {
'use server';
const history = getAIState();
const response = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages: [...history, { role: 'user', content: message }],
});
return response;
}
`
```
Remember, you can only access state within actions that have been passed to
the `createAI` context within the `actions` key.
## [Updating AI State on Server](#updating-ai-state-on-server)
The AI State can also be updated from within your Server Action with the [`getMutableAIState`](/docs/reference/ai-sdk-rsc/get-mutable-ai-state) function. This function is similar to `getAIState`, but it returns the state with methods to read and update it:
Gateway
Provider
Custom
Claude Sonnet 4.5
app/actions.ts
```
`
import { getMutableAIState } from '@ai-sdk/rsc';
export async function sendMessage(message: string) {
'use server';
const history = getMutableAIState();
// Update the AI state with the new user message.
history.update([...history.get(), { role: 'user', content: message }]);
const response = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages: history.get(),
});
// Update the AI state again with the response from the model.
history.done([...history.get(), { role: 'assistant', content: response }]);
return response;
}
`
```
It is important to update the AI State with new responses using `.update()`
and `.done()` to keep the conversation history in sync.
## [Calling Server Actions from the Client](#calling-server-actions-from-the-client)
To call the `sendMessage` action from the client, you can use the [`useActions`](/docs/reference/ai-sdk-rsc/use-actions) hook. The hook returns all the available Actions that were provided to `createAI`:
app/page.tsx
```
`
'use client';
import { useActions, useUIState } from '@ai-sdk/rsc';
import { AI } from './ai';
export default function Page() {
const { sendMessage } = useActions\<typeof AI\>();
const [messages, setMessages] = useUIState();
const handleSubmit = async event =\> {
event.preventDefault();
setMessages([
...messages,
{ id: Date.now(), role: 'user', display: event.target.message.value },
]);
const response = await sendMessage(event.target.message.value);
setMessages([
...messages,
{ id: Date.now(), role: 'assistant', display: response },
]);
};
return (
\<\>
\<ul\>
{messages.map(message =\> (
\<li key={message.id}\>{message.display}\</li\>
))}
\</ul\>
\<form onSubmit={handleSubmit}\>
\<input type="text" name="message" /\>
\<button type="submit"\>Send\</button\>
\</form\>
\</\>
);
}
`
```
When the user submits a message, the `sendMessage` action is called with the message content. The response from the action is then added to the UI state, updating the displayed messages.
Important! Don't forget to update the UI State after you call your Server
Action otherwise the streamed component will not show in the UI.
To learn more, check out this [example](/examples/next-app/state-management/ai-ui-states) on managing AI and UI state using `@ai-sdk/rsc`.
Next, you will learn how you can save and restore state with `@ai-sdk/rsc`.
On this page
[Managing Generative UI State](#managing-generative-ui-state)
[What is AI and UI State?](#what-is-ai-and-ui-state)
[AI State](#ai-state)
[UI State](#ui-state)
[Using AI / UI State](#using-ai--ui-state)
[Creating the AI Context](#creating-the-ai-context)
[Reading UI State in Client](#reading-ui-state-in-client)
[Reading AI State in Client](#reading-ai-state-in-client)
[Reading AI State on Server](#reading-ai-state-on-server)
[Updating AI State on Server](#updating-ai-state-on-server)
[Calling Server Actions from the Client](#calling-server-actions-from-the-client)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)