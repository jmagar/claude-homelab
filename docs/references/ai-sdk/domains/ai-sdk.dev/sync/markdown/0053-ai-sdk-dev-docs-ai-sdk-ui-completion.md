AI SDK UI: Completion
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
# [Completion](#completion)
The `useCompletion` hook allows you to create a user interface to handle text completions in your application. It enables the streaming of text completions from your AI provider, manages the state for chat input, and updates the UI automatically as new messages are received.
The `useCompletion` hook is now part of the `@ai-sdk/react` package.
In this guide, you will learn how to use the `useCompletion` hook in your application to generate text completions and stream them in real-time to your users.
## [Example](#example)
app/page.tsx
```
`
'use client';
import { useCompletion } from '@ai-sdk/react';
export default function Page() {
const { completion, input, handleInputChange, handleSubmit } = useCompletion({
api: '/api/completion',
});
return (
\<form onSubmit={handleSubmit}\>
\<input
name="prompt"
value={input}
onChange={handleInputChange}
id="input"
/\>
\<button type="submit"\>Submit\</button\>
\<div\>{completion}\</div\>
\</form\>
);
}
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/completion/route.ts
```
`
import { streamText } from 'ai';
// Allow streaming responses up to 30 seconds
export const maxDuration = 30;
export async function POST(req: Request) {
const { prompt }: { prompt: string } = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt,
});
return result.toUIMessageStreamResponse();
}
`
```
In the `Page` component, the `useCompletion` hook will request to your AI provider endpoint whenever the user submits a message. The completion is then streamed back in real-time and displayed in the UI.
This enables a seamless text completion experience where the user can see the AI response as soon as it is available, without having to wait for the entire response to be received.
## [Customized UI](#customized-ui)
`useCompletion` also provides ways to manage the prompt via code, show loading and error states, and update messages without being triggered by user interactions.
### [Loading and error states](#loading-and-error-states)
To show a loading spinner while the chatbot is processing the user's message, you can use the `isLoading` state returned by the `useCompletion` hook:
```
`
const { isLoading, ... } = useCompletion()
return(
\<\>
{isLoading ? \<Spinner /\> : null}
\</\>
)
`
```
Similarly, the `error` state reflects the error object thrown during the fetch request. It can be used to display an error message, or show a toast notification:
```
`
const { error, ... } = useCompletion()
useEffect(() =\> {
if (error) {
toast.error(error.message)
}
}, [error])
// Or display the error message in the UI:
return (
\<\>
{error ? \<div\>{error.message}\</div\> : null}
\</\>
)
`
```
### [Controlled input](#controlled-input)
In the initial example, we have `handleSubmit` and `handleInputChange` callbacks that manage the input changes and form submissions. These are handy for common use cases, but you can also use uncontrolled APIs for more advanced scenarios such as form validation or customized components.
The following example demonstrates how to use more granular APIs like `setInput` with your custom input and submit button components:
```
`
const { input, setInput } = useCompletion();
return (
\<\>
\<MyCustomInput value={input} onChange={value =\> setInput(value)} /\>
\</\>
);
`
```
### [Cancelation](#cancelation)
It's also a common use case to abort the response message while it's still streaming back from the AI provider. You can do this by calling the `stop` function returned by the `useCompletion` hook.
```
`
const { stop, isLoading, ... } = useCompletion()
return (
\<\>
\<button onClick={stop} disabled={!isLoading}\>Stop\</button\>
\</\>
)
`
```
When the user clicks the "Stop" button, the fetch request will be aborted. This avoids consuming unnecessary resources and improves the UX of your application.
### [Throttling UI Updates](#throttling-ui-updates)
This feature is currently only available for React.
By default, the `useCompletion` hook will trigger a render every time a new chunk is received.
You can throttle the UI updates with the `experimental\_throttle` option.
page.tsx
```
`
const { completion, ... } = useCompletion({
// Throttle the completion and data updates to 50ms:
experimental\_throttle: 50
})
`
```
## [Event Callbacks](#event-callbacks)
`useCompletion` also provides optional event callbacks that you can use to handle different stages of the chatbot lifecycle. These callbacks can be used to trigger additional actions, such as logging, analytics, or custom UI updates.
```
`
const { ... } = useCompletion({
onFinish: (prompt: string, completion: string) =\> {
console.log('Finished streaming completion:', completion)
},
onError: (error: Error) =\> {
console.error('An error occurred:', error)
},
})
`
```
## [Configure Request Options](#configure-request-options)
By default, the `useCompletion` hook sends a HTTP POST request to the `/api/completion` endpoint with the prompt as part of the request body. You can customize the request by passing additional options to the `useCompletion` hook:
```
`
const { messages, input, handleInputChange, handleSubmit } = useCompletion({
api: '/api/custom-completion',
headers: {
Authorization: 'your\_token',
},
body: {
user\_id: '123',
},
credentials: 'same-origin',
});
`
```
In this example, the `useCompletion` hook sends a POST request to the `/api/completion` endpoint with the specified headers, additional body fields, and credentials for that fetch request. On your server side, you can handle the request with these additional information.
On this page
[Completion](#completion)
[Example](#example)
[Customized UI](#customized-ui)
[Loading and error states](#loading-and-error-states)
[Controlled input](#controlled-input)
[Cancelation](#cancelation)
[Throttling UI Updates](#throttling-ui-updates)
[Event Callbacks](#event-callbacks)
[Configure Request Options](#configure-request-options)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)