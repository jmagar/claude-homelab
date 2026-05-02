Guides: Slackbot Agent Guide
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
# [Building an AI Agent in Slack with the AI SDK](#building-an-ai-agent-in-slack-with-the-ai-sdk)
In this guide, you will learn how to build a Slackbot powered by the AI SDK. The bot will be able to respond to direct messages and mentions in channels using the full context of the thread.
## [Slack App Setup](#slack-app-setup)
Before we start building, you'll need to create and configure a Slack app:
1. Go to [api.slack.com/apps](https://api.slack.com/apps)
2. Click "Create New App" and choose "From scratch"
3. Give your app a name and select your workspace
4. Under "OAuth & Permissions", add the following bot token scopes:
* `app\_mentions:read`
* `chat:write`
* `im:history`
* `im:write`
* `assistant:write`
* Install the app to your workspace (button under "OAuth Tokens" subsection)
* Copy the Bot User OAuth Token and Signing Secret for the next step
* Under App Home -\> Show Tabs -\> Chat Tab, check "Allow users to send Slash commands and messages from the chat tab"
## [Project Setup](#project-setup)
This project uses the following stack:
* [AI SDK by Vercel](/docs)
* [Slack Web API](https://api.slack.com/web)
* [Vercel](https://vercel.com)
* [OpenAI](https://openai.com)
## [Getting Started](#getting-started)
1. Clone [the repository](https://github.com/vercel-labs/ai-sdk-slackbot) and check out the `starter` branch
```
git clone https://github.com/vercel-labs/ai-sdk-slackbot.git
```
```
cd ai-sdk-slackbot
```
```
git checkout starter
```
1. Install dependencies
```
pnpm install
```
## [Project Structure](#project-structure)
The starter repository already includes:
* Slack utilities (`lib/slack-utils.ts`) including functions for validating incoming requests, converting Slack threads to AI SDK compatible message formats, and getting the Slackbot's user ID
* General utility functions (`lib/utils.ts`) including initial Exa setup
* Files to handle the different types of Slack events (`lib/handle-messages.ts` and `lib/handle-app-mention.ts`)
* An API endpoint (`POST`) for Slack events (`api/events.ts`)
## [Event Handler](#event-handler)
First, let's take a look at our API route (`api/events.ts`):
```
`
import type { SlackEvent } from '@slack/web-api';
import {
assistantThreadMessage,
handleNewAssistantMessage,
} from '../lib/handle-messages';
import { waitUntil } from '@vercel/functions';
import { handleNewAppMention } from '../lib/handle-app-mention';
import { verifyRequest, getBotId } from '../lib/slack-utils';
export async function POST(request: Request) {
const rawBody = await request.text();
const payload = JSON.parse(rawBody);
const requestType = payload.type as 'url\_verification' | 'event\_callback';
// See https://api.slack.com/events/url\_verification
if (requestType === 'url\_verification') {
return new Response(payload.challenge, { status: 200 });
}
await verifyRequest({ requestType, request, rawBody });
try {
const botUserId = await getBotId();
const event = payload.event as SlackEvent;
if (event.type === 'app\_mention') {
waitUntil(handleNewAppMention(event, botUserId));
}
if (event.type === 'assistant\_thread\_started') {
waitUntil(assistantThreadMessage(event));
}
if (
event.type === 'message' &&
!event.subtype &&
event.channel\_type === 'im' &&
!event.bot\_id &&
!event.bot\_profile &&
event.bot\_id !== botUserId
) {
waitUntil(handleNewAssistantMessage(event, botUserId));
}
return new Response('Success!', { status: 200 });
} catch (error) {
console.error('Error generating response', error);
return new Response('Error generating response', { status: 500 });
}
}
`
```
This file defines a `POST` function that handles incoming requests from Slack. First, you check the request type to see if it's a URL verification request. If it is, you respond with the challenge string provided by Slack. If it's an event callback, you verify the request and then have access to the event data. This is where you can implement your event handling logic.
You then handle three types of events: `app\_mention`, `assistant\_thread\_started`, and `message`:
* For `app\_mention`, you call `handleNewAppMention` with the event and the bot user ID.
* For `assistant\_thread\_started`, you call `assistantThreadMessage` with the event.
* For `message`, you call `handleNewAssistantMessage` with the event and the bot user ID.
Finally, you respond with a success message to Slack. Note, each handler function is wrapped in a `waitUntil` function. Let's take a look at what this means and why it's important.
### [The waitUntil Function](#the-waituntil-function)
Slack expects a response within 3 seconds to confirm the request is being handled. However, generating AI responses can take longer. If you don't respond to the Slack request within 3 seconds, Slack will send another request, leading to another invocation of your API route, another call to the LLM, and ultimately another response to the user. To solve this, you can use the `waitUntil` function, which allows you to run your AI logic after the response is sent, without blocking the response itself.
This means, your API endpoint will:
1. Immediately respond to Slack (within 3 seconds)
2. Continue processing the message asynchronously
3. Send the AI response when it's ready
## [Event Handlers](#event-handlers)
Let's look at how each event type is currently handled.
### [App Mentions](#app-mentions)
When a user mentions your bot in a channel, the `app\_mention` event is triggered. The `handleNewAppMention` function in `handle-app-mention.ts` processes these mentions:
1. Checks if the message is from a bot to avoid infinite response loops
2. Creates a status updater to show the bot is "thinking"
3. If the mention is in a thread, it retrieves the thread history
4. Calls the LLM with the message content (using the `generateResponse` function which you will implement in the next section)
5. Updates the initial "thinking" message with the AI response
Here's the code for the `handleNewAppMention` function:
lib/handle-app-mention.ts
```
`
import { AppMentionEvent } from '@slack/web-api';
import { client, getThread } from './slack-utils';
import { generateResponse } from './ai';
const updateStatusUtil = async (
initialStatus: string,
event: AppMentionEvent,
) =\> {
const initialMessage = await client.chat.postMessage({
channel: event.channel,
thread\_ts: event.thread\_ts ?? event.ts,
text: initialStatus,
});
if (!initialMessage || !initialMessage.ts)
throw new Error('Failed to post initial message');
const updateMessage = async (status: string) =\> {
await client.chat.update({
channel: event.channel,
ts: initialMessage.ts as string,
text: status,
});
};
return updateMessage;
};
export async function handleNewAppMention(
event: AppMentionEvent,
botUserId: string,
) {
console.log('Handling app mention');
if (event.bot\_id || event.bot\_id === botUserId || event.bot\_profile) {
console.log('Skipping app mention');
return;
}
const { thread\_ts, channel } = event;
const updateMessage = await updateStatusUtil('is thinking...', event);
if (thread\_ts) {
const messages = await getThread(channel, thread\_ts, botUserId);
const result = await generateResponse(messages, updateMessage);
updateMessage(result);
} else {
const result = await generateResponse(
[{ role: 'user', content: event.text }],
updateMessage,
);
updateMessage(result);
}
}
`
```
Now let's see how new assistant threads and messages are handled.
### [Assistant Thread Messages](#assistant-thread-messages)
When a user starts a thread with your assistant, the `assistant\_thread\_started` event is triggered. The `assistantThreadMessage` function in `handle-messages.ts` handles this:
1. Posts a welcome message to the thread
2. Sets up suggested prompts to help users get started
Here's the code for the `assistantThreadMessage` function:
lib/handle-messages.ts
```
`
import type { AssistantThreadStartedEvent } from '@slack/web-api';
import { client } from './slack-utils';
export async function assistantThreadMessage(
event: AssistantThreadStartedEvent,
) {
const { channel\_id, thread\_ts } = event.assistant\_thread;
console.log(`Thread started: ${channel\_id} ${thread\_ts}`);
console.log(JSON.stringify(event));
await client.chat.postMessage({
channel: channel\_id,
thread\_ts: thread\_ts,
text: "Hello, I'm an AI assistant built with the AI SDK by Vercel!",
});
await client.assistant.threads.setSuggestedPrompts({
channel\_id: channel\_id,
thread\_ts: thread\_ts,
prompts: [
{
title: 'Get the weather',
message: 'What is the current weather in London?',
},
{
title: 'Get the news',
message: 'What is the latest Premier League news from the BBC?',
},
],
});
}
`
```
### [Direct Messages](#direct-messages)
For direct messages to your bot, the `message` event is triggered and the event is handled by the `handleNewAssistantMessage` function in `handle-messages.ts`:
1. Verifies the message isn't from a bot
2. Updates the status to show the response is being generated
3. Retrieves the conversation history
4. Calls the LLM with the conversation context
5. Posts the LLM's response to the thread
Here's the code for the `handleNewAssistantMessage` function:
lib/handle-messages.ts
```
`
import type { GenericMessageEvent } from '@slack/web-api';
import { client, getThread } from './slack-utils';
import { generateResponse } from './ai';
export async function handleNewAssistantMessage(
event: GenericMessageEvent,
botUserId: string,
) {
if (
event.bot\_id ||
event.bot\_id === botUserId ||
event.bot\_profile ||
!event.thread\_ts
)
return;
const { thread\_ts, channel } = event;
const updateStatus = updateStatusUtil(channel, thread\_ts);
updateStatus('is thinking...');
const messages = await getThread(channel, thread\_ts, botUserId);
const result = await generateResponse(messages, updateStatus);
await client.chat.postMessage({
channel: channel,
thread\_ts: thread\_ts,
text: result,
unfurl\_links: false,
blocks: [
{
type: 'section',
text: {
type: 'mrkdwn',
text: result,
},
},
],
});
updateStatus('');
}
`
```
With the event handlers in place, let's now implement the AI logic.
## [Implementing AI Logic](#implementing-ai-logic)
The core of our application is the `generateResponse` function in `lib/generate-response.ts`, which processes messages and generates responses using the AI SDK.
Here's how to implement it:
Gateway
Provider
Custom
Claude Sonnet 4.5
lib/generate-response.ts
```
`
import { generateText, ModelMessage } from 'ai';
export const generateResponse = async (
messages: ModelMessage[],
updateStatus?: (status: string) =\> void,
) =\> {
const { text } = await generateText({
model: "anthropic/claude-sonnet-4.5",
system: `You are a Slack bot assistant. Keep your responses concise and to the point.
- Do not tag users.
- Current date is: ${new Date().toISOString().split('T')[0]}`,
messages,
});
// Convert markdown to Slack mrkdwn format
return text.replace(/\\[(.\*?)\\]\\((.\*?)\\)/g, '\<$2|$1\>').replace(/\\\*\\\*/g, '\*');
};
`
```
This basic implementation:
1. Uses the AI SDK's `generateText` function to call Anthropic's `claude-sonnet-4.5` model
2. Provides a system prompt to guide the model's behavior
3. Formats the response for Slack's markdown format
## [Enhancing with Tools](#enhancing-with-tools)
The real power of the AI SDK comes from tools that enable your bot to perform actions. Let's add two useful tools:
Gateway
Provider
Custom
Claude Sonnet 4.5
lib/generate-response.ts
```
`
import { generateText, tool, ModelMessage, stepCountIs } from 'ai';
import { z } from 'zod';
import { exa } from './utils';
export const generateResponse = async (
messages: ModelMessage[],
updateStatus?: (status: string) =\> void,
) =\> {
const { text } = await generateText({
model: "anthropic/claude-sonnet-4.5",
system: `You are a Slack bot assistant. Keep your responses concise and to the point.
- Do not tag users.
- Current date is: ${new Date().toISOString().split('T')[0]}
- Always include sources in your final response if you use web search.`,
messages,
stopWhen: stepCountIs(10),
tools: {
getWeather: tool({
description: 'Get the current weather at a location',
inputSchema: z.object({
latitude: z.number(),
longitude: z.number(),
city: z.string(),
}),
execute: async ({ latitude, longitude, city }) =\> {
updateStatus?.(`is getting weather for ${city}...`);
const response = await fetch(
`https://api.open-meteo.com/v1/forecast?latitude=${latitude}&longitude=${longitude}&current=temperature\_2m,weathercode,relativehumidity\_2m&timezone=auto`,
);
const weatherData = await response.json();
return {
temperature: weatherData.current.temperature\_2m,
weatherCode: weatherData.current.weathercode,
humidity: weatherData.current.relativehumidity\_2m,
city,
};
},
}),
searchWeb: tool({
description: 'Use this to search the web for information',
inputSchema: z.object({
query: z.string(),
specificDomain: z
.string()
.nullable()
.describe(
'a domain to search if the user specifies e.g. bbc.com. Should be only the domain name without the protocol',
),
}),
execute: async ({ query, specificDomain }) =\> {
updateStatus?.(`is searching the web for ${query}...`);
const { results } = await exa.searchAndContents(query, {
livecrawl: 'always',
numResults: 3,
includeDomains: specificDomain ? [specificDomain] : undefined,
});
return {
results: results.map(result =\> ({
title: result.title,
url: result.url,
snippet: result.text.slice(0, 1000),
})),
};
},
}),
},
});
// Convert markdown to Slack mrkdwn format
return text.replace(/\\[(.\*?)\\]\\((.\*?)\\)/g, '\<$2|$1\>').replace(/\\\*\\\*/g, '\*');
};
`
```
In this updated implementation:
1. You added two tools:
* `getWeather`: Fetches weather data for a specified location
* `searchWeb`: Searches the web for information using the Exa API
* You set `stopWhen: stepCountIs(10)` to enable multi-step conversations. This defines the stopping conditions of your agent, when the model generates a tool call. This will automatically send any tool results back to the LLM to trigger additional tool calls or responses as the LLM deems necessary. This turns your LLM call from a one-off operation into a multi-step agentic flow.
## [How It Works](#how-it-works)
When a user interacts with your bot:
1. The Slack event is received and processed by your API endpoint
2. The user's message and the thread history is passed to the `generateResponse` function
3. The AI SDK processes the message and may invoke tools as needed
4. The response is formatted for Slack and sent back to the user
The tools are automatically invoked based on the user's intent. For example, if a user asks "What's the weather in London?", the AI will:
1. Recognize this as a weather query
2. Call the `getWeather` tool with London's coordinates (inferred by the LLM)
3. Process the weather data
4. Generate a final response, answering the user's question
## [Deploying the App](#deploying-the-app)
1. Install the Vercel CLI
```
pnpm install -g vercel
```
1. Deploy the app
```
vercel deploy
```
1. Copy the deployment URL and update the Slack app's Event Subscriptions to point to your Vercel URL
2. Go to your project's deployment settings (Your project -\> Settings -\> Environment Variables) and add your environment variables
```
`
SLACK\_BOT\_TOKEN=your\_slack\_bot\_token
SLACK\_SIGNING\_SECRET=your\_slack\_signing\_secret
OPENAI\_API\_KEY=your\_openai\_api\_key
EXA\_API\_KEY=your\_exa\_api\_key
`
```
Make sure to redeploy your app after updating environment variables.
1. Head back to the [https://api.slack.com/](https://api.slack.com/) and navigate to the "Event Subscriptions" page. Enable events and add your deployment URL.
```
`
https://your-vercel-url.vercel.app/api/events
`
```
1. On the Events Subscription page, subscribe to the following events.
* `app\_mention`
* `assistant\_thread\_started`
* `message:im`
Finally, head to Slack and test the app by sending a message to the bot.
## [Next Steps](#next-steps)
You've built a Slack chatbot powered by the AI SDK! Here are some ways you could extend it:
1. Add memory for specific users to give the LLM context of previous interactions
2. Implement more tools like database queries or knowledge base searches
3. Add support for rich message formatting with blocks
4. Add analytics to track usage patterns
In a production environment, it is recommended to implement a robust queueing
system to ensure messages are properly handled.
On this page
[Building an AI Agent in Slack with the AI SDK](#building-an-ai-agent-in-slack-with-the-ai-sdk)
[Slack App Setup](#slack-app-setup)
[Project Setup](#project-setup)
[Getting Started](#getting-started)
[Project Structure](#project-structure)
[Event Handler](#event-handler)
[The waitUntil Function](#the-waituntil-function)
[Event Handlers](#event-handlers)
[App Mentions](#app-mentions)
[Assistant Thread Messages](#assistant-thread-messages)
[Direct Messages](#direct-messages)
[Implementing AI Logic](#implementing-ai-logic)
[Enhancing with Tools](#enhancing-with-tools)
[How It Works](#how-it-works)
[Deploying the App](#deploying-the-app)
[Next Steps](#next-steps)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)