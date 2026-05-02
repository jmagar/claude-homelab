AI SDK RSC: Streaming Values
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
# [Streaming Values](#streaming-values)
AI SDK RSC is currently experimental. We recommend using [AI SDK
UI](/docs/ai-sdk-ui/overview) for production. For guidance on migrating from
RSC to UI, see our [migration guide](/docs/ai-sdk-rsc/migrating-to-ui).
The RSC API provides several utility functions to allow you to stream values from the server to the client. This is useful when you need more granular control over what you are streaming and how you are streaming it.
These utilities can also be paired with [AI SDK Core](/docs/ai-sdk-core)
functions like [`streamText`](/docs/reference/ai-sdk-core/stream-text) to
easily stream LLM generations from the server to the client.
There are two functions provided by the RSC API that allow you to create streamable values:
* [`createStreamableValue`](/docs/reference/ai-sdk-rsc/create-streamable-value) - creates a streamable (serializable) value, with full control over how you create, update, and close the stream.
* [`createStreamableUI`](/docs/reference/ai-sdk-rsc/create-streamable-ui) - creates a streamable React component, with full control over how you create, update, and close the stream.
## [`createStreamableValue`](#createstreamablevalue)
The RSC API allows you to stream serializable JavaScript values from the server to the client using [`createStreamableValue`](/docs/reference/ai-sdk-rsc/create-streamable-value), such as strings, numbers, objects, and arrays.
This is useful when you want to stream:
* Text generations from the language model in real-time.
* Buffer values of image and audio generations from multi-modal models.
* Progress updates from multi-step agent runs.
## [Creating a Streamable Value](#creating-a-streamable-value)
You can import `createStreamableValue` from `@ai-sdk/rsc` and use it to create a streamable value.
```
`
'use server';
import { createStreamableValue } from '@ai-sdk/rsc';
export const runThread = async () =\> {
const streamableStatus = createStreamableValue('thread.init');
setTimeout(() =\> {
streamableStatus.update('thread.run.create');
streamableStatus.update('thread.run.update');
streamableStatus.update('thread.run.end');
streamableStatus.done('thread.end');
}, 1000);
return {
status: streamableStatus.value,
};
};
`
```
## [Reading a Streamable Value](#reading-a-streamable-value)
You can read streamable values on the client using `readStreamableValue`. It returns an async iterator that yields the value of the streamable as it is updated:
```
`
import { readStreamableValue } from '@ai-sdk/rsc';
import { runThread } from '@/actions';
export default function Page() {
return (
\<button
onClick={async () =\> {
const { status } = await runThread();
for await (const value of readStreamableValue(status)) {
console.log(value);
}
}}
\>
Ask
\</button\>
);
}
`
```
Learn how to stream a text generation (with `streamText`) using the Next.js App Router and `createStreamableValue` in this [example](/examples/next-app/basics/streaming-text-generation).
## [`createStreamableUI`](#createstreamableui)
`createStreamableUI` creates a stream that holds a React component. Unlike AI SDK Core APIs, this function does not call a large language model. Instead, it provides a primitive that can be used to have granular control over streaming a React component.
## [Using `createStreamableUI`](#using-createstreamableui)
Let's look at how you can use the `createStreamableUI` function with a Server Action.
app/actions.tsx
```
`
'use server';
import { createStreamableUI } from '@ai-sdk/rsc';
export async function getWeather() {
const weatherUI = createStreamableUI();
weatherUI.update(\<div style={{ color: 'gray' }}\>Loading...\</div\>);
setTimeout(() =\> {
weatherUI.done(\<div\>It&apos;s a sunny day!\</div\>);
}, 1000);
return weatherUI.value;
}
`
```
First, you create a streamable UI with an empty state and then update it with a loading message. After 1 second, you mark the stream as done passing in the actual weather information as its final value. The `.value` property contains the actual UI that can be sent to the client.
## [Reading a Streamable UI](#reading-a-streamable-ui)
On the client side, you can call the `getWeather` Server Action and render the returned UI like any other React component.
app/page.tsx
```
`
'use client';
import { useState } from 'react';
import { readStreamableValue } from '@ai-sdk/rsc';
import { getWeather } from '@/actions';
export default function Page() {
const [weather, setWeather] = useState\<React.ReactNode | null\>(null);
return (
\<div\>
\<button
onClick={async () =\> {
const weatherUI = await getWeather();
setWeather(weatherUI);
}}
\>
What&apos;s the weather?
\</button\>
{weather}
\</div\>
);
}
`
```
When the button is clicked, the `getWeather` function is called, and the returned UI is set to the `weather` state and rendered on the page. Users will see the loading message first and then the actual weather information after 1 second.
Learn more about handling multiple streams in a single request in the [Multiple Streamables](/docs/advanced/multiple-streamables) guide.
Learn more about handling state for more complex use cases with [ AI/UI State ](/docs/ai-sdk-rsc/generative-ui-state).
On this page
[Streaming Values](#streaming-values)
[createStreamableValue](#createstreamablevalue)
[Creating a Streamable Value](#creating-a-streamable-value)
[Reading a Streamable Value](#reading-a-streamable-value)
[createStreamableUI](#createstreamableui)
[Using createStreamableUI](#using-createstreamableui)
[Reading a Streamable UI](#reading-a-streamable-ui)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)