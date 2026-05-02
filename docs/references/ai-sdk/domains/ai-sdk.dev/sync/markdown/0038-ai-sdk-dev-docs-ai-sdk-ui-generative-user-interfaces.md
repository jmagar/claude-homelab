AI SDK UI: Generative User Interfaces
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
# [Generative User Interfaces](#generative-user-interfaces)
Generative user interfaces (generative UI) is the process of allowing a large language model (LLM) to go beyond text and "generate UI". This creates a more engaging and AI-native experience for users.
What is the weather in SF?
getWeather("San Francisco")
Thursday, March 7
47°
sunny
7am
48°
8am
50°
9am
52°
10am
54°
11am
56°
12pm
58°
1pm
60°
Thanks!
At the core of generative UI are [ tools ](/docs/ai-sdk-core/tools-and-tool-calling), which are functions you provide to the model to perform specialized tasks like getting the weather in a location. The model can decide when and how to use these tools based on the context of the conversation.
Generative UI is the process of connecting the results of a tool call to a React component. Here's how it works:
1. You provide the model with a prompt or conversation history, along with a set of tools.
2. Based on the context, the model may decide to call a tool.
3. If a tool is called, it will execute and return data.
4. This data can then be passed to a React component for rendering.
By passing the tool results to React components, you can create a generative UI experience that's more engaging and adaptive to your needs.
## [Build a Generative UI Chat Interface](#build-a-generative-ui-chat-interface)
Let's create a chat interface that handles text-based conversations and incorporates dynamic UI elements based on model responses.
### [Basic Chat Implementation](#basic-chat-implementation)
Start with a basic chat implementation using the `useChat` hook:
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { useState } from 'react';
export default function Page() {
const [input, setInput] = useState('');
const { messages, sendMessage } = useChat();
const handleSubmit = (e: React.FormEvent) =\> {
e.preventDefault();
sendMessage({ text: input });
setInput('');
};
return (
\<div\>
{messages.map(message =\> (
\<div key={message.id}\>
\<div\>{message.role === 'user' ? 'User: ' : 'AI: '}\</div\>
\<div\>
{message.parts.map((part, index) =\> {
if (part.type === 'text') {
return \<span key={index}\>{part.text}\</span\>;
}
return null;
})}
\</div\>
\</div\>
))}
\<form onSubmit={handleSubmit}\>
\<input
value={input}
onChange={e =\> setInput(e.target.value)}
placeholder="Type a message..."
/\>
\<button type="submit"\>Send\</button\>
\</form\>
\</div\>
);
}
`
```
To handle the chat requests and model responses, set up an API route:
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/chat/route.ts
```
`
import { streamText, convertToModelMessages, UIMessage, stepCountIs } from 'ai';
export async function POST(request: Request) {
const { messages }: { messages: UIMessage[] } = await request.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
system: 'You are a friendly assistant!',
messages: await convertToModelMessages(messages),
stopWhen: stepCountIs(5),
});
return result.toUIMessageStreamResponse();
}
`
```
This API route uses the `streamText` function to process chat messages and stream the model's responses back to the client.
### [Create a Tool](#create-a-tool)
Before enhancing your chat interface with dynamic UI elements, you need to create a tool and corresponding React component. A tool will allow the model to perform a specific action, such as fetching weather information.
Create a new file called `ai/tools.ts` with the following content:
ai/tools.ts
```
`
import { tool as createTool } from 'ai';
import { z } from 'zod';
export const weatherTool = createTool({
description: 'Display the weather for a location',
inputSchema: z.object({
location: z.string().describe('The location to get the weather for'),
}),
execute: async function ({ location }) {
await new Promise(resolve =\> setTimeout(resolve, 2000));
return { weather: 'Sunny', temperature: 75, location };
},
});
export const tools = {
displayWeather: weatherTool,
};
`
```
In this file, you've created a tool called `weatherTool`. This tool simulates fetching weather information for a given location. This tool will return simulated data after a 2-second delay. In a real-world application, you would replace this simulation with an actual API call to a weather service.
### [Update the API Route](#update-the-api-route)
Update the API route to include the tool you've defined:
Gateway
Provider
Custom
Claude Sonnet 4.5
app/api/chat/route.ts
```
`
import { streamText, convertToModelMessages, UIMessage, stepCountIs } from 'ai';
import { tools } from '@/ai/tools';
export async function POST(request: Request) {
const { messages }: { messages: UIMessage[] } = await request.json();
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
system: 'You are a friendly assistant!',
messages: await convertToModelMessages(messages),
stopWhen: stepCountIs(5),
tools,
});
return result.toUIMessageStreamResponse();
}
`
```
Now that you've defined the tool and added it to your `streamText` call, let's build a React component to display the weather information it returns.
### [Create UI Components](#create-ui-components)
Create a new file called `components/weather.tsx`:
components/weather.tsx
```
`
type WeatherProps = {
temperature: number;
weather: string;
location: string;
};
export const Weather = ({ temperature, weather, location }: WeatherProps) =\> {
return (
\<div\>
\<h2\>Current Weather for {location}\</h2\>
\<p\>Condition: {weather}\</p\>
\<p\>Temperature: {temperature}°C\</p\>
\</div\>
);
};
`
```
This component will display the weather information for a given location. It takes three props: `temperature`, `weather`, and `location` (exactly what the `weatherTool` returns).
### [Render the Weather Component](#render-the-weather-component)
Now that you have your tool and corresponding React component, let's integrate them into your chat interface. You'll render the Weather component when the model calls the weather tool.
To check if the model has called a tool, you can check the `parts` array of the UIMessage object for tool-specific parts. In AI SDK 5.0, tool parts use typed naming: `tool-${toolName}` instead of generic types.
Update your `page.tsx` file:
app/page.tsx
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { useState } from 'react';
import { Weather } from '@/components/weather';
export default function Page() {
const [input, setInput] = useState('');
const { messages, sendMessage } = useChat();
const handleSubmit = (e: React.FormEvent) =\> {
e.preventDefault();
sendMessage({ text: input });
setInput('');
};
return (
\<div\>
{messages.map(message =\> (
\<div key={message.id}\>
\<div\>{message.role === 'user' ? 'User: ' : 'AI: '}\</div\>
\<div\>
{message.parts.map((part, index) =\> {
if (part.type === 'text') {
return \<span key={index}\>{part.text}\</span\>;
}
if (part.type === 'tool-displayWeather') {
switch (part.state) {
case 'input-available':
return \<div key={index}\>Loading weather...\</div\>;
case 'output-available':
return (
\<div key={index}\>
\<Weather {...part.output} /\>
\</div\>
);
case 'output-error':
return \<div key={index}\>Error: {part.errorText}\</div\>;
default:
return null;
}
}
return null;
})}
\</div\>
\</div\>
))}
\<form onSubmit={handleSubmit}\>
\<input
value={input}
onChange={e =\> setInput(e.target.value)}
placeholder="Type a message..."
/\>
\<button type="submit"\>Send\</button\>
\</form\>
\</div\>
);
}
`
```
In this updated code snippet, you:
1. Use manual input state management with `useState` instead of the built-in `input` and `handleInputChange`.
2. Use `sendMessage` instead of `handleSubmit` to send messages.
3. Check the `parts` array of each message for different content types.
4. Handle tool parts with type `tool-displayWeather` and their different states (`input-available`, `output-available`, `output-error`).
This approach allows you to dynamically render UI components based on the model's responses, creating a more interactive and context-aware chat experience.
## [Expanding Your Generative UI Application](#expanding-your-generative-ui-application)
You can enhance your chat application by adding more tools and components, creating a richer and more versatile user experience. Here's how you can expand your application:
### [Adding More Tools](#adding-more-tools)
To add more tools, simply define them in your `ai/tools.ts` file:
```
`
// Add a new stock tool
export const stockTool = createTool({
description: 'Get price for a stock',
inputSchema: z.object({
symbol: z.string().describe('The stock symbol to get the price for'),
}),
execute: async function ({ symbol }) {
// Simulated API call
await new Promise(resolve =\> setTimeout(resolve, 2000));
return { symbol, price: 100 };
},
});
// Update the tools object
export const tools = {
displayWeather: weatherTool,
getStockPrice: stockTool,
};
`
```
Now, create a new file called `components/stock.tsx`:
```
`
type StockProps = {
price: number;
symbol: string;
};
export const Stock = ({ price, symbol }: StockProps) =\> {
return (
\<div\>
\<h2\>Stock Information\</h2\>
\<p\>Symbol: {symbol}\</p\>
\<p\>Price: ${price}\</p\>
\</div\>
);
};
`
```
Finally, update your `page.tsx` file to include the new Stock component:
```
`
'use client';
import { useChat } from '@ai-sdk/react';
import { useState } from 'react';
import { Weather } from '@/components/weather';
import { Stock } from '@/components/stock';
export default function Page() {
const [input, setInput] = useState('');
const { messages, sendMessage } = useChat();
const handleSubmit = (e: React.FormEvent) =\> {
e.preventDefault();
sendMessage({ text: input });
setInput('');
};
return (
\<div\>
{messages.map(message =\> (
\<div key={message.id}\>
\<div\>{message.role}\</div\>
\<div\>
{message.parts.map((part, index) =\> {
if (part.type === 'text') {
return \<span key={index}\>{part.text}\</span\>;
}
if (part.type === 'tool-displayWeather') {
switch (part.state) {
case 'input-available':
return \<div key={index}\>Loading weather...\</div\>;
case 'output-available':
return (
\<div key={index}\>
\<Weather {...part.output} /\>
\</div\>
);
case 'output-error':
return \<div key={index}\>Error: {part.errorText}\</div\>;
default:
return null;
}
}
if (part.type === 'tool-getStockPrice') {
switch (part.state) {
case 'input-available':
return \<div key={index}\>Loading stock price...\</div\>;
case 'output-available':
return (
\<div key={index}\>
\<Stock {...part.output} /\>
\</div\>
);
case 'output-error':
return \<div key={index}\>Error: {part.errorText}\</div\>;
default:
return null;
}
}
return null;
})}
\</div\>
\</div\>
))}
\<form onSubmit={handleSubmit}\>
\<input
type="text"
value={input}
onChange={e =\> setInput(e.target.value)}
/\>
\<button type="submit"\>Send\</button\>
\</form\>
\</div\>
);
}
`
```
By following this pattern, you can continue to add more tools and components, expanding the capabilities of your Generative UI application.
On this page
[Generative User Interfaces](#generative-user-interfaces)
[Build a Generative UI Chat Interface](#build-a-generative-ui-chat-interface)
[Basic Chat Implementation](#basic-chat-implementation)
[Create a Tool](#create-a-tool)
[Update the API Route](#update-the-api-route)
[Create UI Components](#create-ui-components)
[Render the Weather Component](#render-the-weather-component)
[Expanding Your Generative UI Application](#expanding-your-generative-ui-application)
[Adding More Tools](#adding-more-tools)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)