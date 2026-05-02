AI SDK RSC: Multistep Interfaces
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
# [Designing Multistep Interfaces](#designing-multistep-interfaces)
AI SDK RSC is currently experimental. We recommend using [AI SDK
UI](/docs/ai-sdk-ui/overview) for production. For guidance on migrating from
RSC to UI, see our [migration guide](/docs/ai-sdk-rsc/migrating-to-ui).
Multistep interfaces refer to user interfaces that require multiple independent steps to be executed in order to complete a specific task.
For example, if you wanted to build a Generative UI chatbot capable of booking flights, it could have three steps:
* Search all flights
* Pick flight
* Check availability
To build this kind of application you will leverage two concepts, **tool composition** and **application context**.
**Tool composition** is the process of combining multiple [tools](/docs/ai-sdk-core/tools-and-tool-calling) to create a new tool. This is a powerful concept that allows you to break down complex tasks into smaller, more manageable steps. In the example above, *"search all flights"*, *"pick flight"*, and *"check availability"* come together to create a holistic *"book flight"* tool.
**Application context** refers to the state of the application at any given point in time. This includes the user's input, the output of the language model, and any other relevant information. In the example above, the flight selected in *"pick flight"* would be used as context necessary to complete the *"check availability"* task.
## [Overview](#overview)
In order to build a multistep interface with `@ai-sdk/rsc`, you will need a few things:
* A Server Action that calls and returns the result from the `streamUI` function
* Tool(s) (sub-tasks necessary to complete your overall task)
* React component(s) that should be rendered when the tool is called
* A page to render your chatbot
The general flow that you will follow is:
* User sends a message (calls your Server Action with `useActions`, passing the message as an input)
* Message is appended to the AI State and then passed to the model alongside a number of tools
* Model can decide to call a tool, which will render the `\<SomeTool /\>` component
* Within that component, you can add interactivity by using `useActions` to call the model with your Server Action and `useUIState` to append the model's response (`\<SomeOtherTool /\>`) to the UI State
* And so on...
## [Implementation](#implementation)
The turn-by-turn implementation is the simplest form of multistep interfaces. In this implementation, the user and the model take turns during the conversation. For every user input, the model generates a response, and the conversation continues in this turn-by-turn fashion.
In the following example, you specify two tools (`searchFlights` and `lookupFlight`) that the model can use to search for flights and lookup details for a specific flight.
app/actions.tsx
```
`
import { streamUI } from '@ai-sdk/rsc';
import { openai } from '@ai-sdk/openai';
import { z } from 'zod';
const searchFlights = async (
source: string,
destination: string,
date: string,
) =\> {
return [
{
id: '1',
flightNumber: 'AA123',
},
{
id: '2',
flightNumber: 'AA456',
},
];
};
const lookupFlight = async (flightNumber: string) =\> {
return {
flightNumber: flightNumber,
departureTime: '10:00 AM',
arrivalTime: '12:00 PM',
};
};
export async function submitUserMessage(input: string) {
'use server';
const ui = await streamUI({
model: openai('gpt-4o'),
system: 'you are a flight booking assistant',
prompt: input,
text: async ({ content }) =\> \<div\>{content}\</div\>,
tools: {
searchFlights: {
description: 'search for flights',
inputSchema: z.object({
source: z.string().describe('The origin of the flight'),
destination: z.string().describe('The destination of the flight'),
date: z.string().describe('The date of the flight'),
}),
generate: async function\* ({ source, destination, date }) {
yield `Searching for flights from ${source} to ${destination} on ${date}...`;
const results = await searchFlights(source, destination, date);
return (
\<div\>
{results.map(result =\> (
\<div key={result.id}\>
\<div\>{result.flightNumber}\</div\>
\</div\>
))}
\</div\>
);
},
},
lookupFlight: {
description: 'lookup details for a flight',
inputSchema: z.object({
flightNumber: z.string().describe('The flight number'),
}),
generate: async function\* ({ flightNumber }) {
yield `Looking up details for flight ${flightNumber}...`;
const details = await lookupFlight(flightNumber);
return (
\<div\>
\<div\>Flight Number: {details.flightNumber}\</div\>
\<div\>Departure Time: {details.departureTime}\</div\>
\<div\>Arrival Time: {details.arrivalTime}\</div\>
\</div\>
);
},
},
},
});
return ui.value;
}
`
```
Next, create an AI context that will hold the UI State and AI State.
app/ai.ts
```
`
import { createAI } from '@ai-sdk/rsc';
import { submitUserMessage } from './actions';
export const AI = createAI\<any[], React.ReactNode[]\>({
initialUIState: [],
initialAIState: [],
actions: {
submitUserMessage,
},
});
`
```
Next, wrap your application with your newly created context.
app/layout.tsx
```
`
import { type ReactNode } from 'react';
import { AI } from './ai';
export default function RootLayout({
children,
}: Readonly\<{ children: ReactNode }\>) {
return (
\<AI\>
\<html lang="en"\>
\<body\>{children}\</body\>
\</html\>
\</AI\>
);
}
`
```
To call your Server Action, update your root page with the following:
app/page.tsx
```
`
'use client';
import { useState } from 'react';
import { AI } from './ai';
import { useActions, useUIState } from '@ai-sdk/rsc';
export default function Page() {
const [input, setInput] = useState\<string\>('');
const [conversation, setConversation] = useUIState\<typeof AI\>();
const { submitUserMessage } = useActions();
const handleSubmit = async (e: React.FormEvent\<HTMLFormElement\>) =\> {
e.preventDefault();
setInput('');
setConversation(currentConversation =\> [
...currentConversation,
\<div\>{input}\</div\>,
]);
const message = await submitUserMessage(input);
setConversation(currentConversation =\> [...currentConversation, message]);
};
return (
\<div\>
\<div\>
{conversation.map((message, i) =\> (
\<div key={i}\>{message}\</div\>
))}
\</div\>
\<div\>
\<form onSubmit={handleSubmit}\>
\<input
type="text"
value={input}
onChange={e =\> setInput(e.target.value)}
/\>
\<button\>Send Message\</button\>
\</form\>
\</div\>
\</div\>
);
}
`
```
This page pulls in the current UI State using the `useUIState` hook, which is then mapped over and rendered in the UI. To access the Server Action, you use the `useActions` hook which will return all actions that were passed to the `actions` key of the `createAI` function in your `actions.tsx` file. Finally, you call the `submitUserMessage` function like any other TypeScript function. This function returns a React component (`message`) that is then rendered in the UI by updating the UI State with `setConversation`.
In this example, to call the next tool, the user must respond with plain text. **Given you are streaming a React component, you can add a button to trigger the next step in the conversation**.
To add user interaction, you will have to convert the component into a client component and use the `useAction` hook to trigger the next step in the conversation.
components/flights.tsx
```
`
'use client';
import { useActions, useUIState } from '@ai-sdk/rsc';
import { ReactNode } from 'react';
interface FlightsProps {
flights: { id: string; flightNumber: string }[];
}
export const Flights = ({ flights }: FlightsProps) =\> {
const { submitUserMessage } = useActions();
const [\_, setMessages] = useUIState();
return (
\<div\>
{flights.map(result =\> (
\<div key={result.id}\>
\<div
onClick={async () =\> {
const display = await submitUserMessage(
`lookupFlight ${result.flightNumber}`,
);
setMessages((messages: ReactNode[]) =\> [...messages, display]);
}}
\>
{result.flightNumber}
\</div\>
\</div\>
))}
\</div\>
);
};
`
```
Now, update your `searchFlights` tool to render the new `\<Flights /\>` component.
actions.tsx
```
`
...
searchFlights: {
description: 'search for flights',
inputSchema: z.object({
source: z.string().describe('The origin of the flight'),
destination: z.string().describe('The destination of the flight'),
date: z.string().describe('The date of the flight'),
}),
generate: async function\* ({ source, destination, date }) {
yield `Searching for flights from ${source} to ${destination} on ${date}...`;
const results = await searchFlights(source, destination, date);
return (\<Flights flights={results} /\>);
},
}
...
`
```
In the above example, the `Flights` component is used to display the search results. When the user clicks on a flight number, the `lookupFlight` tool is called with the flight number as a parameter. The `submitUserMessage` action is then called to trigger the next step in the conversation.
Learn more about tool calling in Next.js App Router by checking out examples [here](/examples/next-app/tools).
On this page
[Designing Multistep Interfaces](#designing-multistep-interfaces)
[Overview](#overview)
[Implementation](#implementation)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)