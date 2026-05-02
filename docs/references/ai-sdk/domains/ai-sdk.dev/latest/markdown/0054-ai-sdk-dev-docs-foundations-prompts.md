Foundations: Prompts
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
# [Prompts](#prompts)
Prompts are instructions that you give a [large language model (LLM)](/docs/foundations/overview#large-language-models) to tell it what to do.
It's like when you ask someone for directions; the clearer your question, the better the directions you'll get.
Many LLM providers offer complex interfaces for specifying prompts. They involve different roles and message types.
While these interfaces are powerful, they can be hard to use and understand.
In order to simplify prompting, the AI SDK supports text, message, and system prompts.
## [Text Prompts](#text-prompts)
Text prompts are strings.
They are ideal for simple generation use cases,
e.g. repeatedly generating content for variants of the same prompt text.
You can set text prompts using the `prompt` property made available by AI SDK functions like [`streamText`](/docs/reference/ai-sdk-core/stream-text) or [`generateText`](/docs/reference/ai-sdk-core/generate-text).
You can structure the text in any way and inject variables, e.g. using a template literal.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Invent a new holiday and describe its traditions.',
});
`
```
You can also use template literals to provide dynamic data to your prompt.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt:
`I am planning a trip to ${destination} for ${lengthOfStay} days. ` +
`Please suggest the best tourist activities for me to do.`,
});
`
```
## [System Prompts](#system-prompts)
System prompts are the initial set of instructions given to models that help guide and constrain the models' behaviors and responses.
You can set system prompts using the `system` property.
System prompts work with both the `prompt` and the `messages` properties.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
system:
`You help planning travel itineraries. ` +
`Respond to the users' request with a list ` +
`of the best stops to make in their destination.`,
prompt:
`I am planning a trip to ${destination} for ${lengthOfStay} days. ` +
`Please suggest the best tourist activities for me to do.`,
});
`
```
When you use a message prompt, you can also use system messages instead of a
system prompt.
## [Message Prompts](#message-prompts)
A message prompt is an array of user, assistant, and tool messages.
They are great for chat interfaces and more complex, multi-modal prompts.
You can use the `messages` property to set message prompts.
Each message has a `role` and a `content` property. The content can either be text (for user and assistant messages), or an array of relevant parts (data) for that message type.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages: [
{ role: 'user', content: 'Hi!' },
{ role: 'assistant', content: 'Hello, how can I help?' },
{ role: 'user', content: 'Where can I buy the best Currywurst in Berlin?' },
],
});
`
```
Instead of sending a text in the `content` property, you can send an array of parts that includes a mix of text and other content parts.
Not all language models support all message and content types. For example,
some models might not be capable of handling multi-modal inputs or tool
messages. [Learn more about the capabilities of select
models](./providers-and-models#model-capabilities).
### [Provider Options](#provider-options)
You can pass through additional provider-specific metadata to enable provider-specific functionality at 3 levels.
#### [Function Call Level](#function-call-level)
Functions like [`streamText`](/docs/reference/ai-sdk-core/stream-text#provider-options) or [`generateText`](/docs/reference/ai-sdk-core/generate-text#provider-options) accept a `providerOptions` property.
Adding provider options at the function call level should be used when you do not need granular control over where the provider options are applied.
```
`
const { text } = await generateText({
model: azure('your-deployment-name'),
providerOptions: {
openai: {
reasoningEffort: 'low',
},
},
});
`
```
#### [Message Level](#message-level)
For granular control over applying provider options at the message level, you can pass `providerOptions` to the message object:
```
`
import { ModelMessage } from 'ai';
const messages: ModelMessage[] = [
{
role: 'system',
content: 'Cached system message',
providerOptions: {
// Sets a cache control breakpoint on the system message
anthropic: { cacheControl: { type: 'ephemeral' } },
},
},
];
`
```
#### [Message Part Level](#message-part-level)
Certain provider-specific options require configuration at the message part level:
```
`
import { ModelMessage } from 'ai';
const messages: ModelMessage[] = [
{
role: 'user',
content: [
{
type: 'text',
text: 'Describe the image in detail.',
providerOptions: {
openai: { imageDetail: 'low' },
},
},
{
type: 'image',
image:
'https://github.com/vercel/ai/blob/main/examples/ai-functions/data/comic-cat.png?raw=true',
// Sets image detail configuration for image part:
providerOptions: {
openai: { imageDetail: 'low' },
},
},
],
},
];
`
```
AI SDK UI hooks like [`useChat`](/docs/reference/ai-sdk-ui/use-chat) return
arrays of `UIMessage` objects, which do not support provider options. We
recommend using the
[`convertToModelMessages`](/docs/reference/ai-sdk-ui/convert-to-model-messages)
function to convert `UIMessage` objects to
[`ModelMessage`](/docs/reference/ai-sdk-core/model-message) objects before
applying or appending message(s) or message parts with `providerOptions`.
### [User Messages](#user-messages)
#### [Text Parts](#text-parts)
Text content is the most common type of content. It is a string that is passed to the model.
If you only need to send text content in a message, the `content` property can be a string,
but you can also use it to send multiple content parts.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages: [
{
role: 'user',
content: [
{
type: 'text',
text: 'Where can I buy the best Currywurst in Berlin?',
},
],
},
],
});
`
```
#### [Image Parts](#image-parts)
User messages can include image parts. An image can be one of the following:
* base64-encoded image:
* `string` with base-64 encoded content
* data URL `string`, e.g. `data:image/png;base64,...`
* binary image:
* `ArrayBuffer`
* `Uint8Array`
* `Buffer`
* URL:
* http(s) URL `string`, e.g. `https://example.com/image.png`
* `URL` object, e.g. `new URL('https://example.com/image.png')`
##### [Example: Binary image (Buffer)](#example-binary-image-buffer)
```
`
const result = await generateText({
model,
messages: [
{
role: 'user',
content: [
{ type: 'text', text: 'Describe the image in detail.' },
{
type: 'image',
image: fs.readFileSync('./data/comic-cat.png'),
},
],
},
],
});
`
```
##### [Example: Base-64 encoded image (string)](#example-base-64-encoded-image-string)
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages: [
{
role: 'user',
content: [
{ type: 'text', text: 'Describe the image in detail.' },
{
type: 'image',
image: fs.readFileSync('./data/comic-cat.png').toString('base64'),
},
],
},
],
});
`
```
##### [Example: Image URL (string)](#example-image-url-string)
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages: [
{
role: 'user',
content: [
{ type: 'text', text: 'Describe the image in detail.' },
{
type: 'image',
image:
'https://github.com/vercel/ai/blob/main/examples/ai-functions/data/comic-cat.png?raw=true',
},
],
},
],
});
`
```
#### [File Parts](#file-parts)
Only a few providers and models currently support file parts: [Google
Generative AI](/providers/ai-sdk-providers/google-generative-ai), [Google
Vertex AI](/providers/ai-sdk-providers/google-vertex),
[OpenAI](/providers/ai-sdk-providers/openai) (for `wav` and `mp3` audio with
`gpt-4o-audio-preview`), [Anthropic](/providers/ai-sdk-providers/anthropic),
[OpenAI](/providers/ai-sdk-providers/openai) (for `pdf`).
User messages can include file parts. A file can be one of the following:
* base64-encoded file:
* `string` with base-64 encoded content
* data URL `string`, e.g. `data:image/png;base64,...`
* binary data:
* `ArrayBuffer`
* `Uint8Array`
* `Buffer`
* URL:
* http(s) URL `string`, e.g. `https://example.com/some.pdf`
* `URL` object, e.g. `new URL('https://example.com/some.pdf')`
You need to specify the MIME type of the file you are sending.
##### [Example: PDF file from Buffer](#example-pdf-file-from-buffer)
```
`
import { google } from '@ai-sdk/google';
import { generateText } from 'ai';
const result = await generateText({
model: google('gemini-2.5-flash'),
messages: [
{
role: 'user',
content: [
{ type: 'text', text: 'What is the file about?' },
{
type: 'file',
mediaType: 'application/pdf',
data: fs.readFileSync('./data/example.pdf'),
filename: 'example.pdf', // optional, not used by all providers
},
],
},
],
});
`
```
##### [Example: mp3 audio file from Buffer](#example-mp3-audio-file-from-buffer)
```
`
import { openai } from '@ai-sdk/openai';
import { generateText } from 'ai';
const result = await generateText({
model: openai('gpt-4o-audio-preview'),
messages: [
{
role: 'user',
content: [
{ type: 'text', text: 'What is the audio saying?' },
{
type: 'file',
mediaType: 'audio/mpeg',
data: fs.readFileSync('./data/galileo.mp3'),
},
],
},
],
});
`
```
#### [Custom Download Function (Experimental)](#custom-download-function-experimental)
You can use custom download functions to implement throttling, retries, authentication, caching, and more.
The default download implementation automatically downloads files in parallel when they are not supported by the model.
Custom download function can be passed via the `experimental\_download` property:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
experimental\_download: async (
requestedDownloads: Array\<{
url: URL;
isUrlSupportedByModel: boolean;
}\>,
): PromiseLike\<
Array\<{
data: Uint8Array;
mediaType: string | undefined;
} | null\>
\> =\> {
// ... download the files and return an array with similar order
},
messages: [
{
role: 'user',
content: [
{
type: 'file',
data: new URL('https://api.company.com/private/document.pdf'),
mediaType: 'application/pdf',
},
],
},
],
});
`
```
The `experimental\_download` option is experimental and may change in future
releases.
### [Assistant Messages](#assistant-messages)
Assistant messages are messages that have a role of `assistant`.
They are typically previous responses from the assistant
and can contain text, reasoning, and tool call parts.
#### [Example: Assistant message with text content](#example-assistant-message-with-text-content)
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages: [
{ role: 'user', content: 'Hi!' },
{ role: 'assistant', content: 'Hello, how can I help?' },
],
});
`
```
#### [Example: Assistant message with text content in array](#example-assistant-message-with-text-content-in-array)
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages: [
{ role: 'user', content: 'Hi!' },
{
role: 'assistant',
content: [{ type: 'text', text: 'Hello, how can I help?' }],
},
],
});
`
```
#### [Example: Assistant message with tool call content](#example-assistant-message-with-tool-call-content)
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages: [
{ role: 'user', content: 'How many calories are in this block of cheese?' },
{
role: 'assistant',
content: [
{
type: 'tool-call',
toolCallId: '12345',
toolName: 'get-nutrition-data',
input: { cheese: 'Roquefort' },
},
],
},
],
});
`
```
#### [Example: Assistant message with file content](#example-assistant-message-with-file-content)
This content part is for model-generated files. Only a few models support
this, and only for file types that they can generate.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages: [
{ role: 'user', content: 'Generate an image of a roquefort cheese!' },
{
role: 'assistant',
content: [
{
type: 'file',
mediaType: 'image/png',
data: fs.readFileSync('./data/roquefort.jpg'),
},
],
},
],
});
`
```
### [Tool messages](#tool-messages)
[Tools](/docs/foundations/tools) (also known as function calling) are programs
that you can provide an LLM to extend its built-in functionality. This can be
anything from calling an external API to calling functions within your UI.
Learn more about Tools in [the next section](/docs/foundations/tools).
For models that support [tool](/docs/foundations/tools) calls, assistant messages can contain tool call parts, and tool messages can contain tool output parts.
A single assistant message can call multiple tools, and a single tool message can contain multiple tool results.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages: [
{
role: 'user',
content: [
{
type: 'text',
text: 'How many calories are in this block of cheese?',
},
{ type: 'image', image: fs.readFileSync('./data/roquefort.jpg') },
],
},
{
role: 'assistant',
content: [
{
type: 'tool-call',
toolCallId: '12345',
toolName: 'get-nutrition-data',
input: { cheese: 'Roquefort' },
},
// there could be more tool calls here (parallel calling)
],
},
{
role: 'tool',
content: [
{
type: 'tool-result',
toolCallId: '12345', // needs to match the tool call id
toolName: 'get-nutrition-data',
output: {
type: 'json',
value: {
name: 'Cheese, roquefort',
calories: 369,
fat: 31,
protein: 22,
},
},
},
// there could be more tool results here (parallel calling)
],
},
],
});
`
```
#### [Multi-modal Tool Results](#multi-modal-tool-results)
Tool results can be multi-part and multi-modal, e.g. a text and an image.
You can use `output: { type: 'content', value: [...] }` to specify multi-part tool results.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages: [
// ...
{
role: 'tool',
content: [
{
type: 'tool-result',
toolCallId: '12345', // needs to match the tool call id
toolName: 'get-nutrition-data',
// for models that do not support multi-part tool results,
// you can include a regular output part:
output: {
type: 'json',
value: {
name: 'Cheese, roquefort',
calories: 369,
fat: 31,
protein: 22,
},
},
},
{
type: 'tool-result',
toolCallId: '12345', // needs to match the tool call id
toolName: 'get-nutrition-data',
// for models that support multi-part tool results,
// you can include a multi-part content part:
output: {
type: 'content',
value: [
{
type: 'text',
text: 'Here is the nutrition data for the cheese:',
},
{
type: 'image-data',
data: fs
.readFileSync('./data/roquefort-nutrition-data.png')
.toString('base64'),
mediaType: 'image/png',
},
],
},
},
],
},
],
});
`
```
### [System Messages](#system-messages)
System messages are messages that are sent to the model before the user messages to guide the assistant's behavior.
You can alternatively use the `system` property.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
messages: [
{ role: 'system', content: 'You help planning travel itineraries.' },
{
role: 'user',
content:
'I am planning a trip to Berlin for 3 days. Please suggest the best tourist activities for me to do.',
},
],
});
`
```
On this page
[Prompts](#prompts)
[Text Prompts](#text-prompts)
[System Prompts](#system-prompts)
[Message Prompts](#message-prompts)
[Provider Options](#provider-options)
[Function Call Level](#function-call-level)
[Message Level](#message-level)
[Message Part Level](#message-part-level)
[User Messages](#user-messages)
[Text Parts](#text-parts)
[Image Parts](#image-parts)
[Example: Binary image (Buffer)](#example-binary-image-buffer)
[Example: Base-64 encoded image (string)](#example-base-64-encoded-image-string)
[Example: Image URL (string)](#example-image-url-string)
[File Parts](#file-parts)
[Example: PDF file from Buffer](#example-pdf-file-from-buffer)
[Example: mp3 audio file from Buffer](#example-mp3-audio-file-from-buffer)
[Custom Download Function (Experimental)](#custom-download-function-experimental)
[Assistant Messages](#assistant-messages)
[Example: Assistant message with text content](#example-assistant-message-with-text-content)
[Example: Assistant message with text content in array](#example-assistant-message-with-text-content-in-array)
[Example: Assistant message with tool call content](#example-assistant-message-with-tool-call-content)
[Example: Assistant message with file content](#example-assistant-message-with-file-content)
[Tool messages](#tool-messages)
[Multi-modal Tool Results](#multi-modal-tool-results)
[System Messages](#system-messages)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)