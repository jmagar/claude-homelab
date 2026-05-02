Getting Started: Node.js
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
# [Node.js Quickstart](#nodejs-quickstart)
The AI SDK is a powerful TypeScript library designed to help developers build AI-powered applications.
In this quickstart tutorial, you'll build a simple agent with a streaming chat user interface. Along the way, you'll learn key concepts and techniques that are fundamental to using the SDK in your own projects.
If you are unfamiliar with the concepts of [Prompt Engineering](/docs/advanced/prompt-engineering) and [HTTP Streaming](/docs/foundations/streaming), you can optionally read these documents first.
## [Prerequisites](#prerequisites)
To follow this quickstart, you'll need:
* Node.js 18+ and pnpm installed on your local development machine.
* A [ Vercel AI Gateway ](https://vercel.com/ai-gateway) API key.
If you haven't obtained your Vercel AI Gateway API key, you can do so by [signing up](https://vercel.com/d?to=/[team]/~/ai&amp;title=Go+to+AI+Gateway) on the Vercel website.
## [Setup Your Application](#setup-your-application)
Start by creating a new directory using the `mkdir` command. Change into your new directory and then run the `pnpm init` command. This will create a `package.json` in your new directory.
```
`
mkdir my-ai-app
cd my-ai-app
pnpm init
`
```
### [Install Dependencies](#install-dependencies)
Install `ai`, the AI SDK, along with other necessary dependencies.
The AI SDK is designed to be a unified interface to interact with any large
language model. This means that you can change model and providers with just
one line of code! Learn more about [available providers](/providers) and
[building custom providers](/providers/community-providers/custom-providers)
in the [providers](/providers) section.
```
`
pnpm add ai zod dotenv
pnpm add -D @types/node tsx typescript
`
```
The `ai` package contains the AI SDK. You will use `zod` to define type-safe schemas that you will pass to the large language model (LLM). You will use `dotenv` to access environment variables (your Vercel AI Gateway key) within your application. There are also three development dependencies, installed with the `-D` flag, that are necessary to run your TypeScript code.
### [Configure Vercel AI Gateway API key](#configure-vercel-ai-gateway-api-key)
Create a `.env` file in your project's root directory and add your Vercel AI Gateway API Key. This key is used to authenticate your application with the Vercel AI Gateway service.
```
touch .env
```
Edit the `.env` file:
.env
```
`
AI\_GATEWAY\_API\_KEY=xxxxxxxxx
`
```
Replace `xxxxxxxxx` with your actual Vercel AI Gateway API key.
The AI SDK will use the `AI\_GATEWAY\_API\_KEY` environment variable to
authenticate with Vercel AI Gateway.
## [Create Your Application](#create-your-application)
Create an `index.ts` file in the root of your project and add the following code:
Gateway
Provider
Custom
Claude Sonnet 4.5
index.ts
```
`
import { ModelMessage, streamText } from 'ai';
import 'dotenv/config';
import \* as readline from 'node:readline/promises';
const terminal = readline.createInterface({
input: process.stdin,
output: process.stdout,
});
const messages: ModelMessage[] = [];
async function main() {
while (true) {
const userInput = await terminal.question('You: ');
messages.push({ role: 'user', content: userInput });
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages,
});
let fullResponse = '';
process.stdout.write('\\nAssistant: ');
for await (const delta of result.textStream) {
fullResponse += delta;
process.stdout.write(delta);
}
process.stdout.write('\\n\\n');
messages.push({ role: 'assistant', content: fullResponse });
}
}
main().catch(console.error);
`
```
Let's take a look at what is happening in this code:
1. Set up a readline interface to take input from the terminal, enabling interactive sessions directly from the command line.
2. Initialize an array called `messages` to store the history of your conversation. This history allows the agent to maintain context in ongoing dialogues.
3. In the `main` function:
* Prompt for and capture user input, storing it in `userInput`.
* Add user input to the `messages` array as a user message.
* Call [`streamText`](/docs/reference/ai-sdk-core/stream-text), which is imported from the `ai` package. This function accepts a configuration object that contains a `model` provider and `messages`.
* Iterate over the text stream returned by the `streamText` function (`result.textStream`) and print the contents of the stream to the terminal.
* Add the assistant's response to the `messages` array.
## [Running Your Application](#running-your-application)
With that, you have built everything you need for your agent! To start your application, use the command:
```
pnpm tsx index.ts
```
You should see a prompt in your terminal. Test it out by entering a message and see the AI agent respond in real-time! The AI SDK makes it fast and easy to build AI chat interfaces with Node.js.
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
## [Enhance Your Agent with Tools](#enhance-your-agent-with-tools)
While large language models (LLMs) have incredible generation capabilities, they struggle with discrete tasks (e.g. mathematics) and interacting with the outside world (e.g. getting the weather). This is where [tools](/docs/ai-sdk-core/tools-and-tool-calling) come in.
Tools are actions that an LLM can invoke. The results of these actions can be reported back to the LLM to be considered in the next response.
For example, if a user asks about the current weather, without tools, the agent would only be able to provide general information based on its training data. But with a weather tool, it can fetch and provide up-to-date, location-specific weather information.
Let's enhance your agent by adding a simple weather tool.
### [Update Your Application](#update-your-application)
Modify your `index.ts` file to include the new weather tool:
Gateway
Provider
Custom
Claude Sonnet 4.5
index.ts
```
`
import { ModelMessage, streamText, tool } from 'ai';
import 'dotenv/config';
import { z } from 'zod';
import \* as readline from 'node:readline/promises';
const terminal = readline.createInterface({
input: process.stdin,
output: process.stdout,
});
const messages: ModelMessage[] = [];
async function main() {
while (true) {
const userInput = await terminal.question('You: ');
messages.push({ role: 'user', content: userInput });
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages,
tools: {
weather: tool({
description: 'Get the weather in a location (fahrenheit)',
inputSchema: z.object({
location: z
.string()
.describe('The location to get the weather for'),
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
let fullResponse = '';
process.stdout.write('\\nAssistant: ');
for await (const delta of result.textStream) {
fullResponse += delta;
process.stdout.write(delta);
}
process.stdout.write('\\n\\n');
messages.push({ role: 'assistant', content: fullResponse });
}
}
main().catch(console.error);
`
```
In this updated code:
1. You import the `tool` function from the `ai` package.
2. You define a `tools` object with a `weather` tool. This tool:
* Has a description that helps the agent understand when to use it.
* Defines `inputSchema` using a Zod schema, specifying that it requires a `location` string to execute this tool. The agent will attempt to extract this input from the context of the conversation. If it can't, it will ask the user for the missing information.
* Defines an `execute` function that simulates getting weather data (in this case, it returns a random temperature). This is an asynchronous function running on the server so you can fetch real data from an external API.
Now your agent can "fetch" weather information for any location the user asks about. When the agent determines it needs to use the weather tool, it will generate a tool call with the necessary parameters. The `execute` function will then be automatically run, and the results will be used by the agent to generate its response.
Try asking something like "What's the weather in New York?" and see how the agent uses the new tool.
Notice the blank "assistant" response? This is because instead of generating a text response, the agent generated a tool call. You can access the tool call and subsequent tool result in the `toolCall` and `toolResult` keys of the result object.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ModelMessage, streamText, tool } from 'ai';
import 'dotenv/config';
import { z } from 'zod';
import \* as readline from 'node:readline/promises';
const terminal = readline.createInterface({
input: process.stdin,
output: process.stdout,
});
const messages: ModelMessage[] = [];
async function main() {
while (true) {
const userInput = await terminal.question('You: ');
messages.push({ role: 'user', content: userInput });
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages,
tools: {
weather: tool({
description: 'Get the weather in a location (fahrenheit)',
inputSchema: z.object({
location: z
.string()
.describe('The location to get the weather for'),
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
let fullResponse = '';
process.stdout.write('\\nAssistant: ');
for await (const delta of result.textStream) {
fullResponse += delta;
process.stdout.write(delta);
}
process.stdout.write('\\n\\n');
console.log(await result.toolCalls);
console.log(await result.toolResults);
messages.push({ role: 'assistant', content: fullResponse });
}
}
main().catch(console.error);
`
```
Now, when you ask about the weather, you'll see the tool call and its result displayed in your chat interface.
## [Enabling Multi-Step Tool Calls](#enabling-multi-step-tool-calls)
You may have noticed that while the tool results are visible in the chat interface, the agent isn't using this information to answer your original query. This is because once the agent generates a tool call, it has technically completed its generation.
To solve this, you can enable multi-step tool calls using `stopWhen`. This feature will automatically send tool results back to the agent to trigger an additional generation until the stopping condition you define is met. In this case, you want the agent to answer your question using the results from the weather tool.
### [Update Your Application](#update-your-application-1)
Modify your `index.ts` file to configure stopping conditions with `stopWhen`:
Gateway
Provider
Custom
Claude Sonnet 4.5
index.ts
```
`
import { ModelMessage, streamText, tool, stepCountIs } from 'ai';
import 'dotenv/config';
import { z } from 'zod';
import \* as readline from 'node:readline/promises';
const terminal = readline.createInterface({
input: process.stdin,
output: process.stdout,
});
const messages: ModelMessage[] = [];
async function main() {
while (true) {
const userInput = await terminal.question('You: ');
messages.push({ role: 'user', content: userInput });
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages,
tools: {
weather: tool({
description: 'Get the weather in a location (fahrenheit)',
inputSchema: z.object({
location: z
.string()
.describe('The location to get the weather for'),
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
stopWhen: stepCountIs(5),
onStepFinish: async ({ toolResults }) =\> {
if (toolResults.length) {
console.log(JSON.stringify(toolResults, null, 2));
}
},
});
let fullResponse = '';
process.stdout.write('\\nAssistant: ');
for await (const delta of result.textStream) {
fullResponse += delta;
process.stdout.write(delta);
}
process.stdout.write('\\n\\n');
messages.push({ role: 'assistant', content: fullResponse });
}
}
main().catch(console.error);
`
```
In this updated code:
1. You set `stopWhen` to be when `stepCountIs` 5, allowing the agent to use up to 5 "steps" for any given generation.
2. You add an `onStepFinish` callback to log any `toolResults` from each step of the interaction, helping you understand the agent's tool usage. This means we can also delete the `toolCall` and `toolResult` `console.log` statements from the previous example.
Now, when you ask about the weather in a location, you should see the agent using the weather tool results to answer your question.
By setting `stopWhen: stepCountIs(5)`, you're allowing the agent to use up to 5 "steps" for any given generation. This enables more complex interactions and allows the agent to gather and process information over several steps if needed. You can see this in action by adding another tool to convert the temperature from Celsius to Fahrenheit.
### [Adding a second tool](#adding-a-second-tool)
Update your `index.ts` file to add a new tool to convert the temperature from Celsius to Fahrenheit:
Gateway
Provider
Custom
Claude Sonnet 4.5
index.ts
```
`
import { ModelMessage, streamText, tool, stepCountIs } from 'ai';
import 'dotenv/config';
import { z } from 'zod';
import \* as readline from 'node:readline/promises';
const terminal = readline.createInterface({
input: process.stdin,
output: process.stdout,
});
const messages: ModelMessage[] = [];
async function main() {
while (true) {
const userInput = await terminal.question('You: ');
messages.push({ role: 'user', content: userInput });
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
messages,
tools: {
weather: tool({
description: 'Get the weather in a location (fahrenheit)',
inputSchema: z.object({
location: z
.string()
.describe('The location to get the weather for'),
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
stopWhen: stepCountIs(5),
onStepFinish: async ({ toolResults }) =\> {
if (toolResults.length) {
console.log(JSON.stringify(toolResults, null, 2));
}
},
});
let fullResponse = '';
process.stdout.write('\\nAssistant: ');
for await (const delta of result.textStream) {
fullResponse += delta;
process.stdout.write(delta);
}
process.stdout.write('\\n\\n');
messages.push({ role: 'assistant', content: fullResponse });
}
}
main().catch(console.error);
`
```
Now, when you ask "What's the weather in New York in celsius?", you should see a more complete interaction:
1. The agent will call the weather tool for New York.
2. You'll see the tool result logged.
3. It will then call the temperature conversion tool to convert the temperature from Fahrenheit to Celsius.
4. The agent will then use that information to provide a natural language response about the weather in New York.
This multi-step approach allows the agent to gather information and use it to provide more accurate and contextual responses, making your agent considerably more useful.
This example demonstrates how tools can expand your agent's capabilities. You can create more complex tools to integrate with real APIs, databases, or any other external systems, allowing the agent to access and process real-world data in real-time and perform actions that interact with the outside world. Tools bridge the gap between the agent's knowledge cutoff and current information, while also enabling it to take meaningful actions beyond just generating text responses.
## [Where to Next?](#where-to-next)
You've built an AI agent using the AI SDK! From here, you have several paths to explore:
* To learn more about the AI SDK, read through the [documentation](/docs).
* If you're interested in diving deeper with guides, check out the [RAG (retrieval-augmented generation)](/cookbook/guides/rag-chatbot) and [multi-modal chatbot](/cookbook/guides/multi-modal-chatbot) guides.
* To jumpstart your first AI project, explore available [templates](https://vercel.com/templates?type=ai).
On this page
[Node.js Quickstart](#nodejs-quickstart)
[Prerequisites](#prerequisites)
[Setup Your Application](#setup-your-application)
[Install Dependencies](#install-dependencies)
[Configure Vercel AI Gateway API key](#configure-vercel-ai-gateway-api-key)
[Create Your Application](#create-your-application)
[Running Your Application](#running-your-application)
[Choosing a Provider](#choosing-a-provider)
[Using other providers](#using-other-providers)
[Enhance Your Agent with Tools](#enhance-your-agent-with-tools)
[Update Your Application](#update-your-application)
[Enabling Multi-Step Tool Calls](#enabling-multi-step-tool-calls)
[Update Your Application](#update-your-application-1)
[Adding a second tool](#adding-a-second-tool)
[Where to Next?](#where-to-next)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)