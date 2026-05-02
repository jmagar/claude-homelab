AI SDK RSC: Handling Loading State
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
# [Handling Loading State](#handling-loading-state)
AI SDK RSC is currently experimental. We recommend using [AI SDK
UI](/docs/ai-sdk-ui/overview) for production. For guidance on migrating from
RSC to UI, see our [migration guide](/docs/ai-sdk-rsc/migrating-to-ui).
Given that responses from language models can often take a while to complete, it's crucial to be able to show loading state to users. This provides visual feedback that the system is working on their request and helps maintain a positive user experience.
There are three approaches you can take to handle loading state with the AI SDK RSC:
* Managing loading state similar to how you would in a traditional Next.js application. This involves setting a loading state variable in the client and updating it when the response is received.
* Streaming loading state from the server to the client. This approach allows you to track loading state on a more granular level and provide more detailed feedback to the user.
* Streaming loading component from the server to the client. This approach allows you to stream a React Server Component to the client while awaiting the model's response.
## [Handling Loading State on the Client](#handling-loading-state-on-the-client)
### [Client](#client)
Let's create a simple Next.js page that will call the `generateResponse` function when the form is submitted. The function will take in the user's prompt (`input`) and then generate a response (`response`). To handle the loading state, use the `loading` state variable. When the form is submitted, set `loading` to `true`, and when the response is received, set it back to `false`. While the response is being streamed, the input field will be disabled.
app/page.tsx
```
`
'use client';
import { useState } from 'react';
import { generateResponse } from './actions';
import { readStreamableValue } from '@ai-sdk/rsc';
// Force the page to be dynamic and allow streaming responses up to 30 seconds
export const maxDuration = 30;
export default function Home() {
const [input, setInput] = useState\<string\>('');
const [generation, setGeneration] = useState\<string\>('');
const [loading, setLoading] = useState\<boolean\>(false);
return (
\<div\>
\<div\>{generation}\</div\>
\<form
onSubmit={async e =\> {
e.preventDefault();
setLoading(true);
const response = await generateResponse(input);
let textContent = '';
for await (const delta of readStreamableValue(response)) {
textContent = `${textContent}${delta}`;
setGeneration(textContent);
}
setInput('');
setLoading(false);
}}
\>
\<input
type="text"
value={input}
disabled={loading}
className="disabled:opacity-50"
onChange={event =\> {
setInput(event.target.value);
}}
/\>
\<button\>Send Message\</button\>
\</form\>
\</div\>
);
}
`
```
### [Server](#server)
Now let's implement the `generateResponse` function. Use the `streamText` function to generate a response to the input.
Gateway
Provider
Custom
Claude Sonnet 4.5
app/actions.ts
```
`
'use server';
import { streamText } from 'ai';
import { createStreamableValue } from '@ai-sdk/rsc';
export async function generateResponse(prompt: string) {
const stream = createStreamableValue();
(async () =\> {
const { textStream } = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt,
});
for await (const text of textStream) {
stream.update(text);
}
stream.done();
})();
return stream.value;
}
`
```
## [Streaming Loading State from the Server](#streaming-loading-state-from-the-server)
If you are looking to track loading state on a more granular level, you can create a new streamable value to store a custom variable and then read this on the frontend. Let's update the example to create a new streamable value for tracking loading state:
### [Server](#server-1)
Gateway
Provider
Custom
Claude Sonnet 4.5
app/actions.ts
```
`
'use server';
import { streamText } from 'ai';
import { createStreamableValue } from '@ai-sdk/rsc';
export async function generateResponse(prompt: string) {
const stream = createStreamableValue();
const loadingState = createStreamableValue({ loading: true });
(async () =\> {
const { textStream } = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt,
});
for await (const text of textStream) {
stream.update(text);
}
stream.done();
loadingState.done({ loading: false });
})();
return { response: stream.value, loadingState: loadingState.value };
}
`
```
### [Client](#client-1)
app/page.tsx
```
`
'use client';
import { useState } from 'react';
import { generateResponse } from './actions';
import { readStreamableValue } from '@ai-sdk/rsc';
// Force the page to be dynamic and allow streaming responses up to 30 seconds
export const maxDuration = 30;
export default function Home() {
const [input, setInput] = useState\<string\>('');
const [generation, setGeneration] = useState\<string\>('');
const [loading, setLoading] = useState\<boolean\>(false);
return (
\<div\>
\<div\>{generation}\</div\>
\<form
onSubmit={async e =\> {
e.preventDefault();
setLoading(true);
const { response, loadingState } = await generateResponse(input);
let textContent = '';
for await (const responseDelta of readStreamableValue(response)) {
textContent = `${textContent}${responseDelta}`;
setGeneration(textContent);
}
for await (const loadingDelta of readStreamableValue(loadingState)) {
if (loadingDelta) {
setLoading(loadingDelta.loading);
}
}
setInput('');
setLoading(false);
}}
\>
\<input
type="text"
value={input}
disabled={loading}
className="disabled:opacity-50"
onChange={event =\> {
setInput(event.target.value);
}}
/\>
\<button\>Send Message\</button\>
\</form\>
\</div\>
);
}
`
```
This allows you to provide more detailed feedback about the generation process to your users.
## [Streaming Loading Components with `streamUI`](#streaming-loading-components-with-streamui)
If you are using the [ `streamUI` ](/docs/reference/ai-sdk-rsc/stream-ui) function, you can stream the loading state to the client in the form of a React component. `streamUI` supports the usage of [ JavaScript generator functions ](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function*), which allow you to yield some value (in this case a React component) while some other blocking work completes.
## [Server](#server-2)
```
`
'use server';
import { openai } from '@ai-sdk/openai';
import { streamUI } from '@ai-sdk/rsc';
export async function generateResponse(prompt: string) {
const result = await streamUI({
model: openai('gpt-4o'),
prompt,
text: async function\* ({ content }) {
yield \<div\>loading...\</div\>;
return \<div\>{content}\</div\>;
},
});
return result.value;
}
`
```
Remember to update the file from `.ts` to `.tsx` because you are defining a
React component in the `streamUI` function.
## [Client](#client-2)
```
`
'use client';
import { useState } from 'react';
import { generateResponse } from './actions';
import { readStreamableValue } from '@ai-sdk/rsc';
// Force the page to be dynamic and allow streaming responses up to 30 seconds
export const maxDuration = 30;
export default function Home() {
const [input, setInput] = useState\<string\>('');
const [generation, setGeneration] = useState\<React.ReactNode\>();
return (
\<div\>
\<div\>{generation}\</div\>
\<form
onSubmit={async e =\> {
e.preventDefault();
const result = await generateResponse(input);
setGeneration(result);
setInput('');
}}
\>
\<input
type="text"
value={input}
onChange={event =\> {
setInput(event.target.value);
}}
/\>
\<button\>Send Message\</button\>
\</form\>
\</div\>
);
}
`
```
On this page
[Handling Loading State](#handling-loading-state)
[Handling Loading State on the Client](#handling-loading-state-on-the-client)
[Client](#client)
[Server](#server)
[Streaming Loading State from the Server](#streaming-loading-state-from-the-server)
[Server](#server-1)
[Client](#client-1)
[Streaming Loading Components with streamUI](#streaming-loading-components-with-streamui)
[Server](#server-2)
[Client](#client-2)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)