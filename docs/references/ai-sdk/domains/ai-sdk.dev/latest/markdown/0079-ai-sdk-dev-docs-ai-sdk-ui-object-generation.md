AI SDK UI: Object Generation
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
# [Object Generation](#object-generation)
`useObject` is an experimental feature and only available in React, Svelte,
and Vue.
The [`useObject`](/docs/reference/ai-sdk-ui/use-object) hook allows you to create interfaces that represent a structured JSON object that is being streamed.
In this guide, you will learn how to use the `useObject` hook in your application to generate UIs for structured data on the fly.
## [Example](#example)
The example shows a small notifications demo app that generates fake notifications in real-time.
### [Schema](#schema)
It is helpful to set up the schema in a separate file that is imported on both the client and server.
app/api/notifications/schema.ts
```
`
import { z } from 'zod';
// define a schema for the notifications
export const notificationSchema = z.object({
notifications: z.array(
z.object({
name: z.string().describe('Name of a fictional person.'),
message: z.string().describe('Message. Do not use emojis or links.'),
}),
),
});
`
```
### [Client](#client)
The client uses [`useObject`](/docs/reference/ai-sdk-ui/use-object) to stream the object generation process.
The results are partial and are displayed as they are received.
Please note the code for handling `undefined` values in the JSX.
app/page.tsx
```
`
'use client';
import { experimental\_useObject as useObject } from '@ai-sdk/react';
import { notificationSchema } from './api/notifications/schema';
export default function Page() {
const { object, submit } = useObject({
api: '/api/notifications',
schema: notificationSchema,
});
return (
\<\>
\<button onClick={() =\> submit('Messages during finals week.')}\>
Generate notifications
\</button\>
{object?.notifications?.map((notification, index) =\> (
\<div key={index}\>
\<p\>{notification?.name}\</p\>
\<p\>{notification?.message}\</p\>
\</div\>
))}
\</\>
);
}
`
```
### [Server](#server)
On the server, we use [`streamText`](/docs/reference/ai-sdk-core/stream-text) with [`Output.object()`](/docs/reference/ai-sdk-core/output#output-object) to stream the object generation process.
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/notifications/route.ts
```
`
import { streamText, Output } from 'ai';
import { notificationSchema } from './schema';
// Allow streaming responses up to 30 seconds
export const maxDuration = 30;
export async function POST(req: Request) {
const context = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
output: Output.object({ schema: notificationSchema }),
prompt:
`Generate 3 notifications for a messages app in this context:` + context,
});
return result.toTextStreamResponse();
}
`
```
## [Enum Output Mode](#enum-output-mode)
When you need to classify or categorize input into predefined options, you can use the `enum` output mode with `useObject`. This requires a specific schema structure where the object has `enum` as a key with `z.enum` containing your possible values.
### [Example: Text Classification](#example-text-classification)
This example shows how to build a simple text classifier that categorizes statements as true or false.
#### [Client](#client-1)
When using `useObject` with enum output mode, your schema must be an object with `enum` as the key:
app/classify/page.tsx
```
`
'use client';
import { experimental\_useObject as useObject } from '@ai-sdk/react';
import { z } from 'zod';
export default function ClassifyPage() {
const { object, submit, isLoading } = useObject({
api: '/api/classify',
schema: z.object({ enum: z.enum(['true', 'false']) }),
});
return (
\<\>
\<button onClick={() =\> submit('The earth is flat')} disabled={isLoading}\>
Classify statement
\</button\>
{object && \<div\>Classification: {object.enum}\</div\>}
\</\>
);
}
`
```
#### [Server](#server-1)
On the server, use `streamText` with `Output.choice()` to stream the classification result:
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/classify/route.ts
```
`
import { streamText, Output } from 'ai';
export async function POST(req: Request) {
const context = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
output: Output.choice({ options: ['true', 'false'] }),
prompt: `Classify this statement as true or false: ${context}`,
});
return result.toTextStreamResponse();
}
`
```
## [Customized UI](#customized-ui)
`useObject` also provides ways to show loading and error states:
### [Loading State](#loading-state)
The `isLoading` state returned by the `useObject` hook can be used for several
purposes:
* To show a loading spinner while the object is generated.
* To disable the submit button.
app/page.tsx
```
`
'use client';
import { experimental\_useObject as useObject } from '@ai-sdk/react';
export default function Page() {
const { isLoading, object, submit } = useObject({
api: '/api/notifications',
schema: notificationSchema,
});
return (
\<\>
{isLoading && \<Spinner /\>}
\<button
onClick={() =\> submit('Messages during finals week.')}
disabled={isLoading}
\>
Generate notifications
\</button\>
{object?.notifications?.map((notification, index) =\> (
\<div key={index}\>
\<p\>{notification?.name}\</p\>
\<p\>{notification?.message}\</p\>
\</div\>
))}
\</\>
);
}
`
```
### [Stop Handler](#stop-handler)
The `stop` function can be used to stop the object generation process. This can be useful if the user wants to cancel the request or if the server is taking too long to respond.
app/page.tsx
```
`
'use client';
import { experimental\_useObject as useObject } from '@ai-sdk/react';
export default function Page() {
const { isLoading, stop, object, submit } = useObject({
api: '/api/notifications',
schema: notificationSchema,
});
return (
\<\>
{isLoading && (
\<button type="button" onClick={() =\> stop()}\>
Stop
\</button\>
)}
\<button onClick={() =\> submit('Messages during finals week.')}\>
Generate notifications
\</button\>
{object?.notifications?.map((notification, index) =\> (
\<div key={index}\>
\<p\>{notification?.name}\</p\>
\<p\>{notification?.message}\</p\>
\</div\>
))}
\</\>
);
}
`
```
### [Error State](#error-state)
Similarly, the `error` state reflects the error object thrown during the fetch request.
It can be used to display an error message, or to disable the submit button:
We recommend showing a generic error message to the user, such as "Something
went wrong." This is a good practice to avoid leaking information from the
server.
```
`
'use client';
import { experimental\_useObject as useObject } from '@ai-sdk/react';
export default function Page() {
const { error, object, submit } = useObject({
api: '/api/notifications',
schema: notificationSchema,
});
return (
\<\>
{error && \<div\>An error occurred.\</div\>}
\<button onClick={() =\> submit('Messages during finals week.')}\>
Generate notifications
\</button\>
{object?.notifications?.map((notification, index) =\> (
\<div key={index}\>
\<p\>{notification?.name}\</p\>
\<p\>{notification?.message}\</p\>
\</div\>
))}
\</\>
);
}
`
```
## [Event Callbacks](#event-callbacks)
`useObject` provides optional event callbacks that you can use to handle life-cycle events.
* `onFinish`: Called when the object generation is completed.
* `onError`: Called when an error occurs during the fetch request.
These callbacks can be used to trigger additional actions, such as logging, analytics, or custom UI updates.
app/page.tsx
```
`
'use client';
import { experimental\_useObject as useObject } from '@ai-sdk/react';
import { notificationSchema } from './api/notifications/schema';
export default function Page() {
const { object, submit } = useObject({
api: '/api/notifications',
schema: notificationSchema,
onFinish({ object, error }) {
// typed object, undefined if schema validation fails:
console.log('Object generation completed:', object);
// error, undefined if schema validation succeeds:
console.log('Schema validation error:', error);
},
onError(error) {
// error during fetch request:
console.error('An error occurred:', error);
},
});
return (
\<div\>
\<button onClick={() =\> submit('Messages during finals week.')}\>
Generate notifications
\</button\>
{object?.notifications?.map((notification, index) =\> (
\<div key={index}\>
\<p\>{notification?.name}\</p\>
\<p\>{notification?.message}\</p\>
\</div\>
))}
\</div\>
);
}
`
```
## [Configure Request Options](#configure-request-options)
You can configure the API endpoint, optional headers and credentials using the `api`, `headers` and `credentials` settings.
```
`
const { submit, object } = useObject({
api: '/api/use-object',
headers: {
'X-Custom-Header': 'CustomValue',
},
credentials: 'include',
schema: yourSchema,
});
`
```
On this page
[Object Generation](#object-generation)
[Example](#example)
[Schema](#schema)
[Client](#client)
[Server](#server)
[Enum Output Mode](#enum-output-mode)
[Example: Text Classification](#example-text-classification)
[Client](#client-1)
[Server](#server-1)
[Customized UI](#customized-ui)
[Loading State](#loading-state)
[Stop Handler](#stop-handler)
[Error State](#error-state)
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