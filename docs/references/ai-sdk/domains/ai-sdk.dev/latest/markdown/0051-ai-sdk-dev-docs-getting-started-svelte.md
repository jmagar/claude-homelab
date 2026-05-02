Getting Started: Svelte
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
# [Svelte Quickstart](#svelte-quickstart)
The AI SDK is a powerful TypeScript library designed to help developers build AI-powered applications.
In this quickstart tutorial, you'll build a simple agent with a streaming chat user interface. Along the way, you'll learn key concepts and techniques that are fundamental to using the SDK in your own projects.
If you are unfamiliar with the concepts of [Prompt Engineering](/docs/advanced/prompt-engineering) and [HTTP Streaming](/docs/foundations/streaming), you can optionally read these documents first.
## [Prerequisites](#prerequisites)
To follow this quickstart, you'll need:
* Node.js 18+ and pnpm installed on your local development machine.
* A [ Vercel AI Gateway ](https://vercel.com/ai-gateway) API key.
If you haven't obtained your Vercel AI Gateway API key, you can do so by [signing up](https://vercel.com/d?to=/[team]/~/ai&amp;title=Go+to+AI+Gateway) on the Vercel website.
## [Set Up Your Application](#set-up-your-application)
Start by creating a new SvelteKit application. This command will create a new directory named `my-ai-app` and set up a basic SvelteKit application inside it.
```
npx sv create my-ai-app
```
Navigate to the newly created directory:
```
cd my-ai-app
```
### [Install Dependencies](#install-dependencies)
Install `ai` and `@ai-sdk/svelte`, the AI package and AI SDK's Svelte bindings. The AI SDK's [ Vercel AI Gateway provider ](/providers/ai-sdk-providers/ai-gateway) ships with the `ai` package. You'll also install `zod`, a schema validation library used for defining tool inputs.
This guide uses the Vercel AI Gateway provider so you can access hundreds of
models from different providers with one API key, but you can switch to any
provider or model by installing its package. Check out available [AI SDK
providers](/providers/ai-sdk-providers) for more information.
pnpmnpmyarnbun
```
pnpm add -D ai @ai-sdk/svelte zod
```
### [Configure your AI Gateway API key](#configure-your-ai-gateway-api-key)
Create a `.env.local` file in your project root and add your AI Gateway API key. This key authenticates your application with the Vercel AI Gateway.
```
touch .env.local
```
Edit the `.env.local` file:
.env.local
```
`
AI\_GATEWAY\_API\_KEY=xxxxxxxxx
`
```
Replace `xxxxxxxxx` with your actual Vercel AI Gateway API key.
The AI SDK's Vercel AI Gateway Provider will default to using the
`AI\_GATEWAY\_API\_KEY` environment variable. Vite does not automatically load
environment variables onto `process.env`, so you'll need to import
`AI\_GATEWAY\_API\_KEY` from `$env/static/private` in your code (see below).
## [Create an API route](#create-an-api-route)
Create a SvelteKit Endpoint, `src/routes/api/chat/+server.ts` and add the following code:
src/routes/api/chat/+server.ts
```
`
import {
streamText,
type UIMessage,
convertToModelMessages,
createGateway,
} from 'ai';
import { AI\_GATEWAY\_API\_KEY } from '$env/static/private';
const gateway = createGateway({
apiKey: AI\_GATEWAY\_API\_KEY,
});
export async function POST({ request }) {
const { messages }: { messages: UIMessage[] } = await request.json();
const result = streamText({
model: gateway('anthropic/claude-sonnet-4.5'),
messages: await convertToModelMessages(messages),
});
return result.toUIMessageStreamResponse();
}
`
```
If you see type errors with `AI\_GATEWAY\_API\_KEY` or your `POST` function, run
the dev server.
Let's take a look at what is happening in this code:
1. Create a gateway provider instance with the `createGateway` function from the `ai` package.
2. Define a `POST` request handler and extract `messages` from the body of the request. The `messages` variable contains a history of the conversation between you and the chatbot and provides the chatbot with the necessary context to make the next generation. The `messages` are of UIMessage type, which are designed for use in application UI - they contain the entire message history and associated metadata like timestamps.
3. Call [`streamText`](/docs/reference/ai-sdk-core/stream-text), which is imported from the `ai` package. This function accepts a configuration object that contains a `model` provider (defined in step 1) and `messages` (defined in step 2). You can pass additional [settings](/docs/ai-sdk-core/settings) to further customize the model's behavior. The `messages` key expects a `ModelMessage[]` array. This type is different from `UIMessage` in that it does not include metadata, such as timestamps or sender information. To convert between these types, we use the `convertToModelMessages` function, which strips the UI-specific metadata and transforms the `UIMessage[]` array into the `ModelMessage[]` format that the model expects.
4. The `streamText` function returns a [`StreamTextResult`](/docs/reference/ai-sdk-core/stream-text#result-object). This result object contains the [ `toUIMessageStreamResponse` ](/docs/reference/ai-sdk-core/stream-text#to-ui-message-stream-response) function which converts the result to a streamed response object.
5. Return the result to the client to stream the response.
## [Choosing a Provider](#choosing-a-provider)
The AI SDK supports dozens of model providers through [first-party](/providers/ai-sdk-providers), [OpenAI-compatible](/providers/openai-compatible-providers), and [ community ](/providers/community-providers) packages.
This quickstart uses the [Vercel AI Gateway](https://vercel.com/ai-gateway) provider, which is the default [global provider](/docs/ai-sdk-core/provider-management#global-provider-configuration). This means you can access models using a simple string in the model configuration:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
model: "anthropic/claude-sonnet-4.5";
`
```
You can also explicitly import and use the gateway provider in two other equivalent ways:
```
`
// Option 1: Import from 'ai' package (included by default)
import { gateway } from 'ai';
model: gateway('anthropic/claude-sonnet-4.5');
// Option 2: Install and import from '@ai-sdk/gateway' package
import { gateway } from '@ai-sdk/gateway';
model: gateway('anthropic/claude-sonnet-4.5');
`
```
### [Using other providers](#using-other-providers)
To use a different provider, install its package and create a provider instance. For example, to use OpenAI directly:
pnpmnpmyarnbun
```
pnpm add @ai-sdk/openai
```
```
`
import { openai } from '@ai-sdk/openai';
model: openai('gpt-5.1');
`
```
#### [Updating the global provider](#updating-the-global-provider)
You can change the default global provider so string model references use your preferred provider everywhere in your application. Learn more about [provider management](/docs/ai-sdk-core/provider-management#global-provider-configuration).
Pick the approach that best matches how you want to manage providers across your application.
## [Wire up the UI](#wire-up-the-ui)
Now that you have an API route that can query an LLM, it's time to set up your frontend. The AI SDK's [UI](/docs/ai-sdk-ui) package abstracts the complexity of a chat interface into one class, `Chat`.
Its properties and API are largely the same as React's [`useChat`](/docs/reference/ai-sdk-ui/use-chat).
Update your root page (`src/routes/+page.svelte`) with the following code to show a list of chat messages and provide a user message input:
src/routes/+page.svelte
```
`
\<script lang="ts"\>
import { Chat } from '@ai-sdk/svelte';
let input = '';
const chat = new Chat({});
function handleSubmit(event: SubmitEvent) {
event.preventDefault();
chat.sendMessage({ text: input });
input = '';
}
\</script\>
\<main\>
\<ul\>
{#each chat.messages as message, messageIndex (messageIndex)}
\<li\>
\<div\>{message.role}\</div\>
\<div\>
{#each message.parts as part, partIndex (partIndex)}
{#if part.type === 'text'}
\<div\>{part.text}\</div\>
{/if}
{/each}
\</div\>
\</li\>
{/each}
\</ul\>
\<form onsubmit={handleSubmit}\>
\<input bind:value={input} /\>
\<button type="submit"\>Send\</button\>
\</form\>
\</main\>
`
```
This page utilizes the `Chat` class, which will, by default, use the `POST` route handler you created earlier. The class provides functions and state for handling user input and form submission. The `Chat` class provides multiple utility functions and state variables:
* `messages` - the current chat messages (an array of objects with `id`, `role`, and `parts` properties).
* `sendMessage` - a function to send a message to the chat API.
The component uses local state to manage the input field value, and handles form submission by calling `sendMessage` with the input text and then clearing the input field.
The LLM's response is accessed through the message `parts` array. Each message contains an ordered array of `parts` that represents everything the model generated in its response. These parts can include plain text, reasoning tokens, and more that you will see later. The `parts` array preserves the sequence of the model's outputs, allowing you to display or process each component in the order it was generated.
## [Running Your Application](#running-your-application)
With that, you have built everything you need for your chatbot! To start your application, use the command:
```
pnpm run dev
```
Head to your browser and open [http://localhost:5173](http://localhost:5173). You should see an input field. Test it out by entering a message and see the AI chatbot respond in real-time! The AI SDK makes it fast and easy to build AI chat interfaces with Svelte.
## [Enhance Your Chatbot with Tools](#enhance-your-chatbot-with-tools)
While large language models (LLMs) have incredible generation capabilities, they struggle with discrete tasks (e.g. mathematics) and interacting with the outside world (e.g. getting the weather). This is where [tools](/docs/ai-sdk-core/tools-and-tool-calling) come in.
Tools are actions that an LLM can invoke. The results of these actions can be reported back to the LLM to be considered in the next response.
For example, if a user asks about the current weather, without tools, the model would only be able to provide general information based on its training data. But with a weather tool, it can fetch and provide up-to-date, location-specific weather information.
Let's enhance your chatbot by adding a simple weather tool.
### [Update Your API Route](#update-your-api-route)
Modify your `src/routes/api/chat/+server.ts` file to include the new weather tool:
src/routes/api/chat/+server.ts
```
`
import {
createGateway,
streamText,
type UIMessage,
convertToModelMessages,
tool,
stepCountIs,
} from 'ai';
import { z } from 'zod';
import { AI\_GATEWAY\_API\_KEY } from '$env/static/private';
const gateway = createGateway({
apiKey: AI\_GATEWAY\_API\_KEY,
});
export async function POST({ request }) {
const { messages }: { messages: UIMessage[] } = await request.json();
const result = streamText({
model: gateway('anthropic/claude-sonnet-4.5'),
messages: await convertToModelMessages(messages),
tools: {
weather: tool({
description: 'Get the weather in a location (fahrenheit)',
inputSchema: z.object({
location: z.string().describe('The location to get the weather for'),
}),
execute: async ({ location }) =\> {
const temperature = Math.round(Math.random() \* (90 - 32) + 32);
return {
location,
temperature,
};
},
}),
},
});
return result.toUIMessageStreamResponse();
}
`
```
In this updated code:
1. You import the `tool` function from the `ai` package and `z` from `zod` for schema validation.
2. You define a `tools` object with a `weather` tool. This tool:
* Has a description that helps the model understand when to use it.
* Defines `inputSchema` using a Zod schema, specifying that it requires a `location` string to execute this tool. The model will attempt to extract this input from the context of the conversation. If it can't, it will ask the user for the missing information.
* Defines an `execute` function that simulates getting weather data (in this case, it returns a random temperature). This is an asynchronous function running on the server so you can fetch real data from an external API.
Now your chatbot can "fetch" weather information for any location the user asks about. When the model determines it needs to use the weather tool, it will generate a tool call with the necessary input. The `execute` function will then be automatically run, and the tool output will be added to the `messages` as a `tool` message.
Try asking something like "What's the weather in New York?" and see how the model uses the new tool.
Notice the blank response in the UI? This is because instead of generating a text response, the model generated a tool call. You can access the tool call and subsequent tool result on the client via the `tool-weather` part of the `message.parts` array.
Tool parts are always named `tool-{toolName}`, where `{toolName}` is the key
you used when defining the tool. In this case, since we defined the tool as
`weather`, the part type is `tool-weather`.
### [Update the UI](#update-the-ui)
To display the tool invocation in your UI, update your `src/routes/+page.svelte` file:
src/routes/+page.svelte
```
`
\<script lang="ts"\>
import { Chat } from '@ai-sdk/svelte';
let input = '';
const chat = new Chat({});
function handleSubmit(event: SubmitEvent) {
event.preventDefault();
chat.sendMessage({ text: input });
input = '';
}
\</script\>
\<main\>
\<ul\>
{#each chat.messages as message, messageIndex (messageIndex)}
\<li\>
\<div\>{message.role}\</div\>
\<div\>
{#each message.parts as part, partIndex (partIndex)}
{#if part.type === 'text'}
\<div\>{part.text}\</div\>
{:else if part.type === 'tool-weather'}
\<pre\>{JSON.stringify(part, null, 2)}\</pre\>
{/if}
{/each}
\</div\>
\</li\>
{/each}
\</ul\>
\<form onsubmit={handleSubmit}\>
\<input bind:value={input} /\>
\<button type="submit"\>Send\</button\>
\</form\>
\</main\>
`
```
With this change, you're updating the UI to handle different message parts. For text parts, you display the text content as before. For weather tool invocations, you display a JSON representation of the tool call and its result.
Now, when you ask about the weather, you'll see the tool call and its result displayed in your chat interface.
## [Enabling Multi-Step Tool Calls](#enabling-multi-step-tool-calls)
You may have noticed that while the tool is now visible in the chat interface, the model isn't using this information to answer your original query. This is because once the model generates a tool call, it has technically completed its generation.
To solve this, you can enable multi-step tool calls using `stopWhen`. By default, `stopWhen` is set to `stepCountIs(1)`, which means generation stops after the first step when there are tool results. By changing this condition, you can allow the model to automatically send tool results back to itself to trigger additional generations until your specified stopping condition is met. In this case, you want the model to continue generating so it can use the weather tool results to answer your original question.
### [Update Your API Route](#update-your-api-route-1)
Modify your `src/routes/api/chat/+server.ts` file to include the `stopWhen` condition:
src/routes/api/chat/+server.ts
```
`
import {
createGateway,
streamText,
type UIMessage,
convertToModelMessages,
tool,
stepCountIs,
} from 'ai';
import { z } from 'zod';
import { AI\_GATEWAY\_API\_KEY } from '$env/static/private';
const gateway = createGateway({
apiKey: AI\_GATEWAY\_API\_KEY,
});
export async function POST({ request }) {
const { messages }: { messages: UIMessage[] } = await request.json();
const result = streamText({
model: gateway('anthropic/claude-sonnet-4.5'),
messages: await convertToModelMessages(messages),
stopWhen: stepCountIs(5),
tools: {
weather: tool({
description: 'Get the weather in a location (fahrenheit)',
inputSchema: z.object({
location: z.string().describe('The location to get the weather for'),
}),
execute: async ({ location }) =\> {
const temperature = Math.round(Math.random() \* (90 - 32) + 32);
return {
location,
temperature,
};
},
}),
},
});
return result.toUIMessageStreamResponse();
}
`
```
Head back to the browser and ask about the weather in a location. You should now see the model using the weather tool results to answer your question.
By setting `stopWhen: stepCountIs(5)`, you're allowing the model to use up to 5 "steps" for any given generation. This enables more complex interactions and allows the model to gather and process information over several steps if needed. You can see this in action by adding another tool to convert the temperature from Fahrenheit to Celsius.
### [Add another tool](#add-another-tool)
Update your `src/routes/api/chat/+server.ts` file to add a new tool to convert the temperature from Fahrenheit to Celsius:
src/routes/api/chat/+server.ts
```
`
import {
createGateway,
streamText,
type UIMessage,
convertToModelMessages,
tool,
stepCountIs,
} from 'ai';
import { z } from 'zod';
import { AI\_GATEWAY\_API\_KEY } from '$env/static/private';
const gateway = createGateway({
apiKey: AI\_GATEWAY\_API\_KEY,
});
export async function POST({ request }) {
const { messages }: { messages: UIMessage[] } = await request.json();
const result = streamText({
model: gateway('anthropic/claude-sonnet-4.5'),
messages: await convertToModelMessages(messages),
stopWhen: stepCountIs(5),
tools: {
weather: tool({
description: 'Get the weather in a location (fahrenheit)',
inputSchema: z.object({
location: z.string().describe('The location to get the weather for'),
}),
execute: async ({ location }) =\> {
const temperature = Math.round(Math.random() \* (90 - 32) + 32);
return {
location,
temperature,
};
},
}),
convertFahrenheitToCelsius: tool({
description: 'Convert a temperature in fahrenheit to celsius',
inputSchema: z.object({
temperature: z
.number()
.describe('The temperature in fahrenheit to convert'),
}),
execute: async ({ temperature }) =\> {
const celsius = Math.round((temperature - 32) \* (5 / 9));
return {
celsius,
};
},
}),
},
});
return result.toUIMessageStreamResponse();
}
`
```
### [Update Your Frontend](#update-your-frontend)
Update your UI to handle the new temperature conversion tool by modifying the tool part handling:
src/routes/+page.svelte
```
`
\<script lang="ts"\>
import { Chat } from '@ai-sdk/svelte';
let input = '';
const chat = new Chat({});
function handleSubmit(event: SubmitEvent) {
event.preventDefault();
chat.sendMessage({ text: input });
input = '';
}
\</script\>
\<main\>
\<ul\>
{#each chat.messages as message, messageIndex (messageIndex)}
\<li\>
\<div\>{message.role}\</div\>
\<div\>
{#each message.parts as part, partIndex (partIndex)}
{#if part.type === 'text'}
\<div\>{part.text}\</div\>
{:else if part.type === 'tool-weather' || part.type === 'tool-convertFahrenheitToCelsius'}
\<pre\>{JSON.stringify(part, null, 2)}\</pre\>
{/if}
{/each}
\</div\>
\</li\>
{/each}
\</ul\>
\<form onsubmit={handleSubmit}\>
\<input bind:value={input} /\>
\<button type="submit"\>Send\</button\>
\</form\>
\</main\>
`
```
This update handles the new `tool-convertFahrenheitToCelsius` part type, displaying the temperature conversion tool calls and results in the UI.
Now, when you ask "What's the weather in New York in celsius?", you should see a more complete interaction:
1. The model will call the weather tool for New York.
2. You'll see the tool output displayed.
3. It will then call the temperature conversion tool to convert the temperature from Fahrenheit to Celsius.
4. The model will then use that information to provide a natural language response about the weather in New York.
This multi-step approach allows the model to gather information and use it to provide more accurate and contextual responses, making your chatbot considerably more useful.
This simple example demonstrates how tools can expand your model's capabilities. You can create more complex tools to integrate with real APIs, databases, or any other external systems, allowing the model to access and process real-world data in real-time. Tools bridge the gap between the model's knowledge cutoff and current information.
## [How does `@ai-sdk/svelte` differ from `@ai-sdk/react`?](#how-does-ai-sdksvelte-differ-from-ai-sdkreact)
The surface-level difference is that Svelte uses classes to manage state, whereas React uses hooks, so `useChat` in React is `Chat` in Svelte. Other than that, there are a few things to keep in mind:
### [1. Arguments to classes aren't reactive by default](#1-arguments-to-classes-arent-reactive-by-default)
Unlike in React, where hooks are rerun any time their containing component is invalidated, code in the `script` block of a Svelte component is only run once when the component is created.
This means that, if you want arguments to your class to be reactive, you need to make sure you pass a *reference* into the class, rather than a value:
```
`
\<script\>
import { Chat } from '@ai-sdk/svelte';
let { id } = $props();
// won't work; the class instance will be created once, `id` will be copied by value, and won't update when $props.id changes
let chat = new Chat({ id });
// will work; passes `id` by reference, so `Chat` always has the latest value
let chat = new Chat({
get id() {
return id;
},
});
\</script\>
`
```
Keep in mind that this normally doesn't matter; most parameters you'll pass into the Chat class are static (for example, you typically wouldn't expect your `onError` handler to change).
### [2. You can't destructure class properties](#2-you-cant-destructure-class-properties)
In vanilla JavaScript, destructuring class properties copies them by value and "disconnects" them from their class instance:
```
`
const classInstance = new Whatever();
classInstance.foo = 'bar';
const { foo } = classInstance;
classInstance.foo = 'baz';
console.log(foo); // 'bar'
`
```
The same is true of classes in Svelte:
```
`
\<script\>
import { Chat } from '@ai-sdk/svelte';
const chat = new Chat({});
let { messages } = chat;
chat.sendMessage({ text: 'Hello, world!' }).then(() =\> {
console.log(messages); // []
console.log(chat.messages); // [{ id: '...', role: 'user', parts: [{ type: 'text', text: 'Hello, world!' }] }]
});
\</script\>
`
```
### [3. Instance synchronization requires context](#3-instance-synchronization-requires-context)
In React, hook instances with the same `id` are synchronized -- so two instances of `useChat` will have the same `messages`, `status`, etc. if they have the same `id`.
For most use cases, you probably don't need this behavior -- but if you do, you can create a context in your root layout file using `createAIContext`:
```
`
\<script\>
import { createAIContext } from '@ai-sdk/svelte';
let { children } = $props();
createAIContext();
// all hooks created after this or in components that are children of this component
// will have synchronized state
\</script\>
{@render children()}
`
```
## [Where to Next?](#where-to-next)
You've built an AI chatbot using the AI SDK! From here, you have several paths to explore:
* To learn more about the AI SDK, read through the [documentation](/docs).
* If you're interested in diving deeper with guides, check out the [RAG (retrieval-augmented generation)](/cookbook/guides/rag-chatbot) and [multi-modal chatbot](/cookbook/guides/multi-modal-chatbot) guides.
* To jumpstart your first AI project, explore available [templates](https://vercel.com/templates?type=ai).
* To learn more about Svelte, check out the [official documentation](https://svelte.dev/docs/svelte).
On this page
[Svelte Quickstart](#svelte-quickstart)
[Prerequisites](#prerequisites)
[Set Up Your Application](#set-up-your-application)
[Install Dependencies](#install-dependencies)
[Configure your AI Gateway API key](#configure-your-ai-gateway-api-key)
[Create an API route](#create-an-api-route)
[Choosing a Provider](#choosing-a-provider)
[Using other providers](#using-other-providers)
[Updating the global provider](#updating-the-global-provider)
[Wire up the UI](#wire-up-the-ui)
[Running Your Application](#running-your-application)
[Enhance Your Chatbot with Tools](#enhance-your-chatbot-with-tools)
[Update Your API Route](#update-your-api-route)
[Update the UI](#update-the-ui)
[Enabling Multi-Step Tool Calls](#enabling-multi-step-tool-calls)
[Update Your API Route](#update-your-api-route-1)
[Add another tool](#add-another-tool)
[Update Your Frontend](#update-your-frontend)
[How does @ai-sdk/svelte differ from @ai-sdk/react?](#how-does-ai-sdksvelte-differ-from-ai-sdkreact)
[1. Arguments to classes aren't reactive by default](#1-arguments-to-classes-arent-reactive-by-default)
[2. You can't destructure class properties](#2-you-cant-destructure-class-properties)
[3. Instance synchronization requires context](#3-instance-synchronization-requires-context)
[Where to Next?](#where-to-next)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)