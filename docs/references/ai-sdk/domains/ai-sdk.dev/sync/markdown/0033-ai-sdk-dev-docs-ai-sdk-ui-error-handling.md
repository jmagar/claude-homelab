AI SDK UI: Error Handling
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
# [Error Handling and warnings](#error-handling-and-warnings)
## [Warnings](#warnings)
The AI SDK shows warnings when something might not work as expected.
These warnings help you fix problems before they cause errors.
### [When Warnings Appear](#when-warnings-appear)
Warnings are shown in the browser console when:
* **Unsupported features**: You use a feature or setting that is not supported by the AI model (e.g., certain options or parameters).
* **Compatibility warnings**: A feature is used in a compatibility mode, which might work differently or less optimally than intended.
* **Other warnings**: The AI model reports another type of issue, such as general problems or advisory messages.
### [Warning Messages](#warning-messages)
All warnings start with "AI SDK Warning:" so you can easily find them. For example:
```
`
AI SDK Warning: The feature "temperature" is not supported by this model
`
```
### [Turning Off Warnings](#turning-off-warnings)
By default, warnings are shown in the console. You can control this behavior:
#### [Turn Off All Warnings](#turn-off-all-warnings)
Set a global variable to turn off warnings completely:
```
`
globalThis.AI\_SDK\_LOG\_WARNINGS = false;
`
```
#### [Custom Warning Handler](#custom-warning-handler)
You can also provide your own function to handle warnings.
It receives provider id, model id, and a list of warnings.
```
`
globalThis.AI\_SDK\_LOG\_WARNINGS = ({ warnings, provider, model }) =\> {
// Handle warnings your own way
};
`
```
## [Error Handling](#error-handling)
### [Error Helper Object](#error-helper-object)
Each AI SDK UI hook also returns an [error](/docs/reference/ai-sdk-ui/use-chat#error) object that you can use to render the error in your UI.
You can use the error object to show an error message, disable the submit button, or show a retry button.
We recommend showing a generic error message to the user, such as "Something
went wrong." This is a good practice to avoid leaking information from the
server.
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { useState } from 'react';
export default function Chat() {
const [input, setInput] = useState('');
const { messages, sendMessage, error, regenerate } = useChat();
const handleSubmit = (e: React.FormEvent) =\> {
e.preventDefault();
sendMessage({ text: input });
setInput('');
};
return (
\<div\>
{messages.map(m =\> (
\<div key={m.id}\>
{m.role}:{' '}
{m.parts
.filter(part =\> part.type === 'text')
.map(part =\> part.text)
.join('')}
\</div\>
))}
{error && (
\<\>
\<div\>An error occurred.\</div\>
\<button type="button" onClick={() =\> regenerate()}\>
Retry
\</button\>
\</\>
)}
\<form onSubmit={handleSubmit}\>
\<input
value={input}
onChange={e =\> setInput(e.target.value)}
disabled={error != null}
/\>
\</form\>
\</div\>
);
}
`
```
#### [Alternative: replace last message](#alternative-replace-last-message)
Alternatively you can write a custom submit handler that replaces the last message when an error is present.
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { useState } from 'react';
export default function Chat() {
const [input, setInput] = useState('');
const { sendMessage, error, messages, setMessages } = useChat();
function customSubmit(event: React.FormEvent\<HTMLFormElement\>) {
event.preventDefault();
if (error != null) {
setMessages(messages.slice(0, -1)); // remove last message
}
sendMessage({ text: input });
setInput('');
}
return (
\<div\>
{messages.map(m =\> (
\<div key={m.id}\>
{m.role}:{' '}
{m.parts
.filter(part =\> part.type === 'text')
.map(part =\> part.text)
.join('')}
\</div\>
))}
{error && \<div\>An error occurred.\</div\>}
\<form onSubmit={customSubmit}\>
\<input value={input} onChange={e =\> setInput(e.target.value)} /\>
\</form\>
\</div\>
);
}
`
```
### [Error Handling Callback](#error-handling-callback)
Errors can be processed by passing an [`onError`](/docs/reference/ai-sdk-ui/use-chat#on-error) callback function as an option to the [`useChat`](/docs/reference/ai-sdk-ui/use-chat) or [`useCompletion`](/docs/reference/ai-sdk-ui/use-completion) hooks.
The callback function receives an error object as an argument.
```
`
import { useChat } from '@ai-sdk/react';
export default function Page() {
const {
/\* ... \*/
} = useChat({
// handle error:
onError: error =\> {
console.error(error);
},
});
}
`
```
### [Injecting Errors for Testing](#injecting-errors-for-testing)
You might want to create errors for testing.
You can easily do so by throwing an error in your route handler:
```
`
export async function POST(req: Request) {
throw new Error('This is a test error');
}
`
```
On this page
[Error Handling and warnings](#error-handling-and-warnings)
[Warnings](#warnings)
[When Warnings Appear](#when-warnings-appear)
[Warning Messages](#warning-messages)
[Turning Off Warnings](#turning-off-warnings)
[Turn Off All Warnings](#turn-off-all-warnings)
[Custom Warning Handler](#custom-warning-handler)
[Error Handling](#error-handling)
[Error Helper Object](#error-helper-object)
[Alternative: replace last message](#alternative-replace-last-message)
[Error Handling Callback](#error-handling-callback)
[Injecting Errors for Testing](#injecting-errors-for-testing)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)