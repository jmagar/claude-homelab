AI SDK RSC: Error Handling
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
# [Error Handling](#error-handling)
AI SDK RSC is currently experimental. We recommend using [AI SDK
UI](/docs/ai-sdk-ui/overview) for production. For guidance on migrating from
RSC to UI, see our [migration guide](/docs/ai-sdk-rsc/migrating-to-ui).
Two categories of errors can occur when working with the RSC API: errors while streaming user interfaces and errors while streaming other values.
## [Handling UI Errors](#handling-ui-errors)
To handle errors while generating UI, the [`streamableUI`](/docs/reference/ai-sdk-rsc/create-streamable-ui) object exposes an `error()` method.
app/actions.tsx
```
`
'use server';
import { createStreamableUI } from '@ai-sdk/rsc';
export async function getStreamedUI() {
const ui = createStreamableUI();
(async () =\> {
ui.update(\<div\>loading\</div\>);
const data = await fetchData();
ui.done(\<div\>{data}\</div\>);
})().catch(e =\> {
ui.error(\<div\>Error: {e.message}\</div\>);
});
return ui.value;
}
`
```
With this method, you can catch any error with the stream, and return relevant UI. On the client, you can also use a [React Error Boundary](https://react.dev/reference/react/Component#catching-rendering-errors-with-an-error-boundary) to wrap the streamed component and catch any additional errors.
app/page.tsx
```
`
import { getStreamedUI } from '@/actions';
import { useState } from 'react';
import { ErrorBoundary } from './ErrorBoundary';
export default function Page() {
const [streamedUI, setStreamedUI] = useState(null);
return (
\<div\>
\<button
onClick={async () =\> {
const newUI = await getStreamedUI();
setStreamedUI(newUI);
}}
\>
What does the new UI look like?
\</button\>
\<ErrorBoundary\>{streamedUI}\</ErrorBoundary\>
\</div\>
);
}
`
```
## [Handling Other Errors](#handling-other-errors)
To handle other errors while streaming, you can return an error object that the receiver can use to determine why the failure occurred.
app/actions.tsx
```
`
'use server';
import { createStreamableValue } from '@ai-sdk/rsc';
import { fetchData, emptyData } from '../utils/data';
export const getStreamedData = async () =\> {
const streamableData = createStreamableValue\<string\>(emptyData);
(async () =\> {
const data1 = await fetchData();
streamableData.update(data1);
const data2 = await fetchData();
streamableData.update(data2);
const data3 = await fetchData();
streamableData.done(data3);
})().catch(e =\> {
streamableData.error(e);
});
return { data: streamableData.value };
};
`
```
On this page
[Error Handling](#error-handling)
[Handling UI Errors](#handling-ui-errors)
[Handling Other Errors](#handling-other-errors)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)