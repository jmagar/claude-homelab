Next.js: Stream Object
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
# [Stream Object](#stream-object)
Object generation can sometimes take a long time to complete, especially when you're generating a large schema.
In such cases, it is useful to stream the object generation process to the client in real-time.
This allows the client to display the generated object as it is being generated,
rather than have users wait for it to complete before displaying the result.
http://localhost:3000
View Notifications
## [Object Mode](#object-mode)
The `streamText` function with `Output` allows you to specify different output strategies. Using `Output.object`, it will generate exactly the structured object that you specify in the schema option.
### [Schema](#schema)
It is helpful to set up the schema in a separate file that is imported on both the client and server.
app/api/use-object/schema.ts
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
import { notificationSchema } from './api/use-object/schema';
export default function Page() {
const { object, submit } = useObject({
api: '/api/use-object',
schema: notificationSchema,
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
### [Server](#server)
On the server, we use [`streamText`](/docs/reference/ai-sdk-core/stream-text) with `Output.object` to stream the object generation process.
app/api/use-object/route.ts
```
`
import { streamText, Output } from 'ai';
import { notificationSchema } from './schema';
export const maxDuration = 30;
export async function POST(req: Request) {
const context = await req.json();
const result = streamText({
model: 'openai/gpt-4.1',
output: Output.object({ schema: notificationSchema }),
prompt:
`Generate 3 notifications for a messages app in this context:` + context,
});
return result.toTextStreamResponse();
}
`
```
## [Loading State and Stopping the Stream](#loading-state-and-stopping-the-stream)
You can use the `loading` state to display a loading indicator while the object is being generated.
You can also use the `stop` function to stop the object generation process.
app/page.tsx
```
`
'use client';
import { experimental\_useObject as useObject } from '@ai-sdk/react';
import { notificationSchema } from './api/use-object/schema';
export default function Page() {
const { object, submit, isLoading, stop } = useObject({
api: '/api/use-object',
schema: notificationSchema,
});
return (
\<div\>
\<button
onClick={() =\> submit('Messages during finals week.')}
disabled={isLoading}
\>
Generate notifications
\</button\>
{isLoading && (
\<div\>
\<div\>Loading...\</div\>
\<button type="button" onClick={() =\> stop()}\>
Stop
\</button\>
\</div\>
)}
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
## [Array Mode](#array-mode)
The `Output.array` mode allows you to stream an array of objects one element at a time. This is particularly useful when generating lists of items.
### [Schema](#schema-1)
First, update the schema to generate a single object (remove the `z.array()`).
app/api/use-object/schema.ts
```
`
import { z } from 'zod';
// define a schema for a single notification
export const notificationSchema = z.object({
name: z.string().describe('Name of a fictional person.'),
message: z.string().describe('Message. Do not use emojis or links.'),
});
`
```
### [Client](#client-1)
On the client, you wrap the schema in `z.array()` to generate an array of objects.
app/page.tsx
```
`
'use client';
import { experimental\_useObject as useObject } from '@ai-sdk/react';
import { notificationSchema } from '../api/use-object/schema';
import z from 'zod';
export default function Page() {
const { object, submit, isLoading, stop } = useObject({
api: '/api/use-object',
schema: z.array(notificationSchema),
});
return (
\<div\>
\<button
onClick={() =\> submit('Messages during finals week.')}
disabled={isLoading}
\>
Generate notifications
\</button\>
{isLoading && (
\<div\>
\<div\>Loading...\</div\>
\<button type="button" onClick={() =\> stop()}\>
Stop
\</button\>
\</div\>
)}
{object?.map((notification, index) =\> (
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
### [Server](#server-1)
On the server, specify `Output.array` to generate an array of objects.
app/api/use-object/route.ts
```
`
import { streamText, Output } from 'ai';
import { notificationSchema } from './schema';
export const maxDuration = 30;
export async function POST(req: Request) {
const context = await req.json();
const result = streamText({
model: 'openai/gpt-4.1',
output: Output.array({ element: notificationSchema }),
prompt:
`Generate 3 notifications for a messages app in this context:` + context,
});
return result.toTextStreamResponse();
}
`
```
## [JSON Mode](#json-mode)
`Output.json()` can be used when you don't want to specify a schema, for example when the data structure is defined by a dynamic user request. The model will still attempt to generate JSON data based on the prompt.
### [Client](#client-2)
app/page.tsx
```
`
'use client';
import { experimental\_useObject as useObject } from '@ai-sdk/react';
import { z } from 'zod';
export default function Page() {
const { object, submit, isLoading, stop } = useObject({
api: '/api/use-object',
schema: z.unknown(),
});
return (
\<div\>
\<button
onClick={() =\> submit('Messages during finals week.')}
disabled={isLoading}
\>
Generate notifications
\</button\>
{isLoading && (
\<div\>
\<div\>Loading...\</div\>
\<button type="button" onClick={() =\> stop()}\>
Stop
\</button\>
\</div\>
)}
{JSON.stringify(object, null, 2)}
\</div\>
);
}
`
```
### [Server](#server-2)
On the server, specify `Output.json()`.
app/api/use-object/route.ts
```
`
import { streamText, Output } from 'ai';
export const maxDuration = 30;
export async function POST(req: Request) {
const context = await req.json();
const result = streamText({
model: 'openai/gpt-4o',
output: Output.json(),
prompt:
`Generate 3 notifications (in JSON) for a messages app in this context:` +
context,
});
return result.toTextStreamResponse();
}
`
```
On this page
[Stream Object](#stream-object)
[Object Mode](#object-mode)
[Schema](#schema)
[Client](#client)
[Server](#server)
[Loading State and Stopping the Stream](#loading-state-and-stopping-the-stream)
[Array Mode](#array-mode)
[Schema](#schema-1)
[Client](#client-1)
[Server](#server-1)
[JSON Mode](#json-mode)
[Client](#client-2)
[Server](#server-2)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)