Getting Started: Expo
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
# [Expo Quickstart](#expo-quickstart)
In this quickstart tutorial, you'll build a simple agent with a streaming chat user interface with [Expo](https://expo.dev/). Along the way, you'll learn key concepts and techniques that are fundamental to using the SDK in your own projects.
If you are unfamiliar with the concepts of [Prompt Engineering](/docs/advanced/prompt-engineering) and [HTTP Streaming](/docs/foundations/streaming), you can optionally read these documents first.
## [Prerequisites](#prerequisites)
To follow this quickstart, you'll need:
* Node.js 18+ and pnpm installed on your local development machine.
* A [ Vercel AI Gateway ](https://vercel.com/ai-gateway) API key.
If you haven't obtained your Vercel AI Gateway API key, you can do so by [signing up](https://vercel.com/d?to=/[team]/~/ai&amp;title=Go+to+AI+Gateway) on the Vercel website.
## [Create Your Application](#create-your-application)
Start by creating a new Expo application. This command will create a new directory named `my-ai-app` and set up a basic Expo application inside it.
```
pnpm create expo-app@latest my-ai-app
```
Navigate to the newly created directory:
```
cd my-ai-app
```
This guide requires Expo 52 or higher.
### [Install dependencies](#install-dependencies)
Install `ai` and `@ai-sdk/react`, the AI package and AI SDK's React hooks. The AI SDK's [ Vercel AI Gateway provider ](/providers/ai-sdk-providers/ai-gateway) ships with the `ai` package. You'll also install `zod`, a schema validation library used for defining tool inputs.
This guide uses the Vercel AI Gateway provider so you can access hundreds of
models from different providers with one API key, but you can switch to any
provider or model by installing its package. Check out available [AI SDK
providers](/providers/ai-sdk-providers) for more information.
pnpmnpmyarnbun
```
pnpm add ai @ai-sdk/react zod
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
`AI\_GATEWAY\_API\_KEY` environment variable.
## [Create an API Route](#create-an-api-route)
Create a route handler, `app/api/chat+api.ts` and add the following code:
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/chat+api.ts
```
`
import { streamText, UIMessage, convertToModelMessages } from 'ai';
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages: await convertToModelMessages(messages),
});
return result.toUIMessageStreamResponse({
headers: {
'Content-Type': 'application/octet-stream',
'Content-Encoding': 'none',
},
});
}
`
```
Let's take a look at what is happening in this code:
1. Define an asynchronous `POST` request handler and extract `messages` from the body of the request. The `messages` variable contains a history of the conversation between you and the chatbot and provides the chatbot with the necessary context to make the next generation.
2. Call [`streamText`](/docs/reference/ai-sdk-core/stream-text), which is imported from the `ai` package. This function accepts a configuration object that contains a `model` provider (imported from `ai`) and `messages` (defined in step 1). You can pass additional [settings](/docs/ai-sdk-core/settings) to further customize the model's behavior.
3. The `streamText` function returns a [`StreamTextResult`](/docs/reference/ai-sdk-core/stream-text#result-object). This result object contains the [ `toUIMessageStreamResponse` ](/docs/reference/ai-sdk-core/stream-text#to-ui-message-stream-response) function which converts the result to a streamed response object.
4. Finally, return the result to the client to stream the response.
This API route creates a POST request endpoint at `/api/chat`.
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
Now that you have an API route that can query an LLM, it's time to setup your frontend. The AI SDK's [ UI ](/docs/ai-sdk-ui) package abstracts the complexity of a chat interface into one hook, [`useChat`](/docs/reference/ai-sdk-ui/use-chat).
Update your root page (`app/(tabs)/index.tsx`) with the following code to show a list of chat messages and provide a user message input:
app/(tabs)/index.tsx
```
`
import { generateAPIUrl } from '@/utils';
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport } from 'ai';
import { fetch as expoFetch } from 'expo/fetch';
import { useState } from 'react';
import { View, TextInput, ScrollView, Text, SafeAreaView } from 'react-native';
export default function App() {
const [input, setInput] = useState('');
const { messages, error, sendMessage } = useChat({
transport: new DefaultChatTransport({
fetch: expoFetch as unknown as typeof globalThis.fetch,
api: generateAPIUrl('/api/chat'),
}),
onError: error =\> console.error(error, 'ERROR'),
});
if (error) return \<Text\>{error.message}\</Text\>;
return (
\<SafeAreaView style={{ height: '100%' }}\>
\<View
style={{
height: '95%',
display: 'flex',
flexDirection: 'column',
paddingHorizontal: 8,
}}
\>
\<ScrollView style={{ flex: 1 }}\>
{messages.map(m =\> (
\<View key={m.id} style={{ marginVertical: 8 }}\>
\<View\>
\<Text style={{ fontWeight: 700 }}\>{m.role}\</Text\>
{m.parts.map((part, i) =\> {
switch (part.type) {
case 'text':
return \<Text key={`${m.id}-${i}`}\>{part.text}\</Text\>;
}
})}
\</View\>
\</View\>
))}
\</ScrollView\>
\<View style={{ marginTop: 8 }}\>
\<TextInput
style={{ backgroundColor: 'white', padding: 8 }}
placeholder="Say something..."
value={input}
onChange={e =\> setInput(e.nativeEvent.text)}
onSubmitEditing={e =\> {
e.preventDefault();
sendMessage({ text: input });
setInput('');
}}
autoFocus={true}
/\>
\</View\>
\</View\>
\</SafeAreaView\>
);
}
`
```
This page utilizes the `useChat` hook, which will, by default, use the `POST` API route you created earlier (`/api/chat`). The hook provides functions and state for handling user input and form submission. The `useChat` hook provides multiple utility functions and state variables:
* `messages` - the current chat messages (an array of objects with `id`, `role`, and `parts` properties).
* `sendMessage` - a function to send a message to the chat API.
The component uses local state (`useState`) to manage the input field value, and handles form submission by calling `sendMessage` with the input text and then clearing the input field.
The LLM's response is accessed through the message `parts` array. Each message contains an ordered array of `parts` that represents everything the model generated in its response. These parts can include plain text, reasoning tokens, and more that you will see later. The `parts` array preserves the sequence of the model's outputs, allowing you to display or process each component in the order it was generated.
You use the expo/fetch function instead of the native node fetch to enable
streaming of chat responses. This requires Expo 52 or higher.
### [Create the API URL Generator](#create-the-api-url-generator)
Because you're using expo/fetch for streaming responses instead of the native fetch function, you'll need an API URL generator to ensure you are using the correct base url and format depending on the client environment (e.g. web or mobile). Create a new file called `utils.ts` in the root of your project and add the following code:
utils.ts
```
`
import Constants from 'expo-constants';
export const generateAPIUrl = (relativePath: string) =\> {
const origin = Constants.experienceUrl.replace('exp://', 'http://');
const path = relativePath.startsWith('/') ? relativePath : `/${relativePath}`;
if (process.env.NODE\_ENV === 'development') {
return origin.concat(path);
}
if (!process.env.EXPO\_PUBLIC\_API\_BASE\_URL) {
throw new Error(
'EXPO\_PUBLIC\_API\_BASE\_URL environment variable is not defined',
);
}
return process.env.EXPO\_PUBLIC\_API\_BASE\_URL.concat(path);
};
`
```
This utility function handles URL generation for both development and production environments, ensuring your API calls work correctly across different devices and configurations.
Before deploying to production, you must set the `EXPO\_PUBLIC\_API\_BASE\_URL`
environment variable in your production environment. This variable should
point to the base URL of your API server.
## [Running Your Application](#running-your-application)
With that, you have built everything you need for your chatbot! To start your application, use the command:
```
pnpm expo
```
Head to your browser and open [http://localhost:8081](http://localhost:8081). You should see an input field. Test it out by entering a message and see the AI chatbot respond in real-time! The AI SDK makes it fast and easy to build AI chat interfaces with Expo.
If you experience "Property `structuredClone` doesn't exist" errors on mobile,
add the [polyfills described below](#polyfills).
## [Enhance Your Chatbot with Tools](#enhance-your-chatbot-with-tools)
While large language models (LLMs) have incredible generation capabilities, they struggle with discrete tasks (e.g. mathematics) and interacting with the outside world (e.g. getting the weather). This is where [tools](/docs/ai-sdk-core/tools-and-tool-calling) come in.
Tools are actions that an LLM can invoke. The results of these actions can be reported back to the LLM to be considered in the next response.
For example, if a user asks about the current weather, without tools, the model would only be able to provide general information based on its training data. But with a weather tool, it can fetch and provide up-to-date, location-specific weather information.
Let's enhance your chatbot by adding a simple weather tool.
### [Update Your API route](#update-your-api-route)
Modify your `app/api/chat+api.ts` file to include the new weather tool:
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/chat+api.ts
```
`
import { streamText, UIMessage, convertToModelMessages, tool } from 'ai';
import { z } from 'zod';
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
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
return result.toUIMessageStreamResponse({
headers: {
'Content-Type': 'application/octet-stream',
'Content-Encoding': 'none',
},
});
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
You may need to restart your development server for the changes to take
effect.
Try asking something like "What's the weather in New York?" and see how the model uses the new tool.
Notice the blank response in the UI? This is because instead of generating a text response, the model generated a tool call. You can access the tool call and subsequent tool result on the client via the `tool-weather` part of the `message.parts` array.
Tool parts are always named `tool-{toolName}`, where `{toolName}` is the key
you used when defining the tool. In this case, since we defined the tool as
`weather`, the part type is `tool-weather`.
### [Update the UI](#update-the-ui)
To display the weather tool invocation in your UI, update your `app/(tabs)/index.tsx` file:
app/(tabs)/index.tsx
```
`
import { generateAPIUrl } from '@/utils';
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport } from 'ai';
import { fetch as expoFetch } from 'expo/fetch';
import { useState } from 'react';
import { View, TextInput, ScrollView, Text, SafeAreaView } from 'react-native';
export default function App() {
const [input, setInput] = useState('');
const { messages, error, sendMessage } = useChat({
transport: new DefaultChatTransport({
fetch: expoFetch as unknown as typeof globalThis.fetch,
api: generateAPIUrl('/api/chat'),
}),
onError: error =\> console.error(error, 'ERROR'),
});
if (error) return \<Text\>{error.message}\</Text\>;
return (
\<SafeAreaView style={{ height: '100%' }}\>
\<View
style={{
height: '95%',
display: 'flex',
flexDirection: 'column',
paddingHorizontal: 8,
}}
\>
\<ScrollView style={{ flex: 1 }}\>
{messages.map(m =\> (
\<View key={m.id} style={{ marginVertical: 8 }}\>
\<View\>
\<Text style={{ fontWeight: 700 }}\>{m.role}\</Text\>
{m.parts.map((part, i) =\> {
switch (part.type) {
case 'text':
return \<Text key={`${m.id}-${i}`}\>{part.text}\</Text\>;
case 'tool-weather':
return (
\<Text key={`${m.id}-${i}`}\>
{JSON.stringify(part, null, 2)}
\</Text\>
);
}
})}
\</View\>
\</View\>
))}
\</ScrollView\>
\<View style={{ marginTop: 8 }}\>
\<TextInput
style={{ backgroundColor: 'white', padding: 8 }}
placeholder="Say something..."
value={input}
onChange={e =\> setInput(e.nativeEvent.text)}
onSubmitEditing={e =\> {
e.preventDefault();
sendMessage({ text: input });
setInput('');
}}
autoFocus={true}
/\>
\</View\>
\</View\>
\</SafeAreaView\>
);
}
`
```
You may need to restart your development server for the changes to take
effect.
With this change, you're updating the UI to handle different message parts. For text parts, you display the text content as before. For weather tool invocations, you display a JSON representation of the tool call and its result.
Now, when you ask about the weather, you'll see the tool call and its result displayed in your chat interface.
## [Enabling Multi-Step Tool Calls](#enabling-multi-step-tool-calls)
You may have noticed that while the tool results are visible in the chat interface, the model isn't using this information to answer your original query. This is because once the model generates a tool call, it has technically completed its generation.
To solve this, you can enable multi-step tool calls using `stopWhen`. By default, `stopWhen` is set to `stepCountIs(1)`, which means generation stops after the first step when there are tool results. By changing this condition, you can allow the model to automatically send tool results back to itself to trigger additional generations until your specified stopping condition is met. In this case, you want the model to continue generating so it can use the weather tool results to answer your original question.
### [Update Your API Route](#update-your-api-route-1)
Modify your `app/api/chat+api.ts` file to include the `stopWhen` condition:
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/chat+api.ts
```
`
import {
streamText,
UIMessage,
convertToModelMessages,
tool,
stepCountIs,
} from 'ai';
import { z } from 'zod';
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
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
return result.toUIMessageStreamResponse({
headers: {
'Content-Type': 'application/octet-stream',
'Content-Encoding': 'none',
},
});
}
`
```
You may need to restart your development server for the changes to take
effect.
Head back to the Expo app and ask about the weather in a location. You should now see the model using the weather tool results to answer your question.
By setting `stopWhen: stepCountIs(5)`, you're allowing the model to use up to 5 "steps" for any given generation. This enables more complex interactions and allows the model to gather and process information over several steps if needed. You can see this in action by adding another tool to convert the temperature from Fahrenheit to Celsius.
### [Add More Tools](#add-more-tools)
Update your `app/api/chat+api.ts` file to add a new tool to convert the temperature from Fahrenheit to Celsius:
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/chat+api.ts
```
`
import {
streamText,
UIMessage,
convertToModelMessages,
tool,
stepCountIs,
} from 'ai';
import { z } from 'zod';
export async function POST(req: Request) {
const { messages }: { messages: UIMessage[] } = await req.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
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
return result.toUIMessageStreamResponse({
headers: {
'Content-Type': 'application/octet-stream',
'Content-Encoding': 'none',
},
});
}
`
```
You may need to restart your development server for the changes to take
effect.
### [Update the UI for the new tool](#update-the-ui-for-the-new-tool)
To display the temperature conversion tool invocation in your UI, update your `app/(tabs)/index.tsx` file to handle the new tool part:
app/(tabs)/index.tsx
```
`
import { generateAPIUrl } from '@/utils';
import { useChat } from '@ai-sdk/react';
import { DefaultChatTransport } from 'ai';
import { fetch as expoFetch } from 'expo/fetch';
import { useState } from 'react';
import { View, TextInput, ScrollView, Text, SafeAreaView } from 'react-native';
export default function App() {
const [input, setInput] = useState('');
const { messages, error, sendMessage } = useChat({
transport: new DefaultChatTransport({
fetch: expoFetch as unknown as typeof globalThis.fetch,
api: generateAPIUrl('/api/chat'),
}),
onError: error =\> console.error(error, 'ERROR'),
});
if (error) return \<Text\>{error.message}\</Text\>;
return (
\<SafeAreaView style={{ height: '100%' }}\>
\<View
style={{
height: '95%',
display: 'flex',
flexDirection: 'column',
paddingHorizontal: 8,
}}
\>
\<ScrollView style={{ flex: 1 }}\>
{messages.map(m =\> (
\<View key={m.id} style={{ marginVertical: 8 }}\>
\<View\>
\<Text style={{ fontWeight: 700 }}\>{m.role}\</Text\>
{m.parts.map((part, i) =\> {
switch (part.type) {
case 'text':
return \<Text key={`${m.id}-${i}`}\>{part.text}\</Text\>;
case 'tool-weather':
case 'tool-convertFahrenheitToCelsius':
return (
\<Text key={`${m.id}-${i}`}\>
{JSON.stringify(part, null, 2)}
\</Text\>
);
}
})}
\</View\>
\</View\>
))}
\</ScrollView\>
\<View style={{ marginTop: 8 }}\>
\<TextInput
style={{ backgroundColor: 'white', padding: 8 }}
placeholder="Say something..."
value={input}
onChange={e =\> setInput(e.nativeEvent.text)}
onSubmitEditing={e =\> {
e.preventDefault();
sendMessage({ text: input });
setInput('');
}}
autoFocus={true}
/\>
\</View\>
\</View\>
\</SafeAreaView\>
);
}
`
```
You may need to restart your development server for the changes to take
effect.
Now, when you ask "What's the weather in New York in celsius?", you should see a more complete interaction:
1. The model will call the weather tool for New York.
2. You'll see the tool result displayed.
3. It will then call the temperature conversion tool to convert the temperature from Fahrenheit to Celsius.
4. The model will then use that information to provide a natural language response about the weather in New York.
This multi-step approach allows the model to gather information and use it to provide more accurate and contextual responses, making your chatbot considerably more useful.
This simple example demonstrates how tools can expand your model's capabilities. You can create more complex tools to integrate with real APIs, databases, or any other external systems, allowing the model to access and process real-world data in real-time. Tools bridge the gap between the model's knowledge cutoff and current information.
## [Polyfills](#polyfills)
Several functions that are internally used by the AI SDK might not available in the Expo runtime depending on your configuration and the target platform.
First, install the following packages:
pnpmnpmyarnbun
```
pnpm add @ungap/structured-clone @stardazed/streams-text-encoding
```
Then create a new file in the root of your project with the following polyfills:
polyfills.js
```
`
import { Platform } from 'react-native';
import structuredClone from '@ungap/structured-clone';
if (Platform.OS !== 'web') {
const setupPolyfills = async () =\> {
const { polyfillGlobal } = await import(
'react-native/Libraries/Utilities/PolyfillFunctions'
);
const { TextEncoderStream, TextDecoderStream } = await import(
'@stardazed/streams-text-encoding'
);
if (!('structuredClone' in global)) {
polyfillGlobal('structuredClone', () =\> structuredClone);
}
polyfillGlobal('TextEncoderStream', () =\> TextEncoderStream);
polyfillGlobal('TextDecoderStream', () =\> TextDecoderStream);
};
setupPolyfills();
}
export {};
`
```
Finally, import the polyfills in your root `\_layout.tsx`:
\_layout.tsx
```
`
import '@/polyfills';
`
```
## [Where to Next?](#where-to-next)
You've built an AI chatbot using the AI SDK! From here, you have several paths to explore:
* To learn more about the AI SDK, read through the [documentation](/docs).
* If you're interested in diving deeper with guides, check out the [RAG (retrieval-augmented generation)](/cookbook/guides/rag-chatbot) and [multi-modal chatbot](/cookbook/guides/multi-modal-chatbot) guides.
* To jumpstart your first AI project, explore available [templates](https://vercel.com/templates?type=ai).
On this page
[Expo Quickstart](#expo-quickstart)
[Prerequisites](#prerequisites)
[Create Your Application](#create-your-application)
[Install dependencies](#install-dependencies)
[Configure your AI Gateway API key](#configure-your-ai-gateway-api-key)
[Create an API Route](#create-an-api-route)
[Choosing a Provider](#choosing-a-provider)
[Using other providers](#using-other-providers)
[Updating the global provider](#updating-the-global-provider)
[Wire up the UI](#wire-up-the-ui)
[Create the API URL Generator](#create-the-api-url-generator)
[Running Your Application](#running-your-application)
[Enhance Your Chatbot with Tools](#enhance-your-chatbot-with-tools)
[Update Your API route](#update-your-api-route)
[Update the UI](#update-the-ui)
[Enabling Multi-Step Tool Calls](#enabling-multi-step-tool-calls)
[Update Your API Route](#update-your-api-route-1)
[Add More Tools](#add-more-tools)
[Update the UI for the new tool](#update-the-ui-for-the-new-tool)
[Polyfills](#polyfills)
[Where to Next?](#where-to-next)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)