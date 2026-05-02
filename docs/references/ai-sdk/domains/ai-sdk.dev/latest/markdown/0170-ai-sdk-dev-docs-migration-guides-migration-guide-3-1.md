Migration Guides: Migrate AI SDK 3.0 to 3.1
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
[Versioning](/docs/migration-guides/versioning)
[Migrate AI SDK 5.x to 6.0](/docs/migration-guides/migration-guide-6-0)
[Migrate Your Data to AI SDK 5.0](/docs/migration-guides/migration-guide-5-0-data)
[Migrate AI SDK 4.x to 5.0](/docs/migration-guides/migration-guide-5-0)
[Migrate AI SDK 4.1 to 4.2](/docs/migration-guides/migration-guide-4-2)
[Migrate AI SDK 4.0 to 4.1](/docs/migration-guides/migration-guide-4-1)
[Migrate AI SDK 3.4 to 4.0](/docs/migration-guides/migration-guide-4-0)
[Migrate AI SDK 3.3 to 3.4](/docs/migration-guides/migration-guide-3-4)
[Migrate AI SDK 3.2 to 3.3](/docs/migration-guides/migration-guide-3-3)
[Migrate AI SDK 3.1 to 3.2](/docs/migration-guides/migration-guide-3-2)
[Migrate AI SDK 3.0 to 3.1](/docs/migration-guides/migration-guide-3-1)
[Troubleshooting](/docs/troubleshooting)
Copy markdown
# [Migrate AI SDK 3.0 to 3.1](#migrate-ai-sdk-30-to-31)
Check out the [AI SDK 3.1 release blog
post](https://vercel.com/blog/vercel-ai-sdk-3-1-modelfusion-joins-the-team)
for more information about the release.
This guide will help you:
* Upgrade to AI SDK 3.1
* Migrate from Legacy Providers to AI SDK Core
* Migrate from [`render`](/docs/reference/ai-sdk-rsc/render) to [`streamUI`](/docs/reference/ai-sdk-rsc/stream-ui)
Upgrading to AI SDK 3.1 does not require using the newly released AI SDK Core API or [`streamUI`](/docs/reference/ai-sdk-rsc/stream-ui) function.
## [Upgrading](#upgrading)
### [AI SDK](#ai-sdk)
To update to AI SDK version 3.1, run the following command using your preferred package manager:
```
pnpm add ai@3.1
```
## [Next Steps](#next-steps)
The release of AI SDK 3.1 introduces several new features that improve the way you build AI applications with the SDK:
* AI SDK Core, a brand new unified API for interacting with large language models (LLMs).
* [`streamUI`](/docs/reference/ai-sdk-rsc/stream-ui), a new abstraction, built upon AI SDK Core functions that simplifies building streaming UIs.
## [Migrating from Legacy Providers to AI SDK Core](#migrating-from-legacy-providers-to-ai-sdk-core)
Prior to AI SDK Core, you had to use a model provider's SDK to query their models.
In the following Route Handler, you use the OpenAI SDK to query their model. You then pipe that response into the `OpenAIStream` function which returns a [`ReadableStream`](https://developer.mozilla.org/en-US/docs/Web/API/ReadableStream) that you can pass to the client using a new `StreamingTextResponse`.
```
`
import OpenAI from 'openai';
import { OpenAIStream, StreamingTextResponse } from 'ai';
const openai = new OpenAI({
apiKey: process.env.OPENAI\_API\_KEY!,
});
export async function POST(req: Request) {
const { messages } = await req.json();
const response = await openai.chat.completions.create({
model: 'gpt-4.1',
stream: true,
messages,
});
const stream = OpenAIStream(response);
return new StreamingTextResponse(stream);
}
`
```
With AI SDK Core you have a unified API for any provider that implements the [AI SDK Language Model Specification](/providers/community-providers/custom-providers).
Let’s take a look at the example above, but refactored to utilize the AI SDK Core API alongside the AI SDK OpenAI provider. In this example, you import the LLM function you want to use from the `ai` package, import the OpenAI provider from `@ai-sdk/openai`, and then you call the model and return the response using the `toDataStreamResponse()` helper function.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { streamText } from 'ai';
import { openai } from '@ai-sdk/openai';
export async function POST(req: Request) {
const { messages } = await req.json();
const result = await streamText({
model: "anthropic/claude-sonnet-4.5",
messages,
});
return result.toUIMessageStreamResponse();
}
`
```
## [Migrating from `render` to `streamUI`](#migrating-from-render-to-streamui)
The AI SDK RSC API was launched as part of version 3.0. This API introduced the [`render`](/docs/reference/ai-sdk-rsc/render) function, a helper function to create streamable UIs with OpenAI models. With the new AI SDK Core API, it became possible to make streamable UIs possible with any compatible provider.
The following example Server Action uses the `render` function using the model provider directly from OpenAI. You first create an OpenAI provider instance with the OpenAI SDK. Then, you pass it to the provider key of the render function alongside a tool that returns a React Server Component, defined in the `render` key of the tool.
```
`
import { render } from '@ai-sdk/rsc';
import OpenAI from 'openai';
import { z } from 'zod';
import { Spinner, Weather } from '@/components';
import { getWeather } from '@/utils';
const openai = new OpenAI();
async function submitMessage(userInput = 'What is the weather in SF?') {
'use server';
return render({
provider: openai,
model: 'gpt-4.1',
messages: [
{ role: 'system', content: 'You are a helpful assistant' },
{ role: 'user', content: userInput },
],
text: ({ content }) =\> \<p\>{content}\</p\>,
tools: {
get\_city\_weather: {
description: 'Get the current weather for a city',
parameters: z
.object({
city: z.string().describe('the city'),
})
.required(),
render: async function\* ({ city }) {
yield \<Spinner /\>;
const weather = await getWeather(city);
return \<Weather info={weather} /\>;
},
},
},
});
}
`
```
With the new [`streamUI`](/docs/reference/ai-sdk-rsc/stream-ui) function, you can now use any compatible AI SDK provider. In this example, you import the AI SDK OpenAI provider. Then, you pass it to the [`model`](/docs/reference/ai-sdk-rsc/stream-ui#model) key of the new [`streamUI`](/docs/reference/ai-sdk-rsc/stream-ui) function. Finally, you declare a tool and return a React Server Component, defined in the [`generate`](/docs/reference/ai-sdk-rsc/stream-ui#tools-generate) key of the tool.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { streamUI } from '@ai-sdk/rsc';
import { openai } from '@ai-sdk/openai';
import { z } from 'zod';
import { Spinner, Weather } from '@/components';
import { getWeather } from '@/utils';
async function submitMessage(userInput = 'What is the weather in SF?') {
'use server';
const result = await streamUI({
model: "anthropic/claude-sonnet-4.5",
system: 'You are a helpful assistant',
messages: [{ role: 'user', content: userInput }],
text: ({ content }) =\> \<p\>{content}\</p\>,
tools: {
get\_city\_weather: {
description: 'Get the current weather for a city',
parameters: z
.object({
city: z.string().describe('Name of the city'),
})
.required(),
generate: async function\* ({ city }) {
yield \<Spinner /\>;
const weather = await getWeather(city);
return \<Weather info={weather} /\>;
},
},
},
});
return result.value;
}
`
```
On this page
[Migrate AI SDK 3.0 to 3.1](#migrate-ai-sdk-30-to-31)
[Upgrading](#upgrading)
[AI SDK](#ai-sdk)
[Next Steps](#next-steps)
[Migrating from Legacy Providers to AI SDK Core](#migrating-from-legacy-providers-to-ai-sdk-core)
[Migrating from render to streamUI](#migrating-from-render-to-streamui)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)