AI SDK Core: Settings
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
# [Settings](#settings)
Large language models (LLMs) typically provide settings to augment their output.
All AI SDK functions support the following common settings in addition to the model, the [prompt](./prompts), and additional provider-specific settings:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
maxOutputTokens: 512,
temperature: 0.3,
maxRetries: 5,
prompt: 'Invent a new holiday and describe its traditions.',
});
`
```
Some providers do not support all common settings. If you use a setting with a
provider that does not support it, a warning will be generated. You can check
the `warnings` property in the result object to see if any warnings were
generated.
### [`maxOutputTokens`](#maxoutputtokens)
Maximum number of tokens to generate.
### [`temperature`](#temperature)
Temperature setting.
The value is passed through to the provider. The range depends on the provider and model.
For most providers, `0` means almost deterministic results, and higher values mean more randomness.
It is recommended to set either `temperature` or `topP`, but not both.
In AI SDK 5.0, temperature is no longer set to `0` by default.
### [`topP`](#topp)
Nucleus sampling.
The value is passed through to the provider. The range depends on the provider and model.
For most providers, nucleus sampling is a number between 0 and 1.
E.g. 0.1 would mean that only tokens with the top 10% probability mass are considered.
It is recommended to set either `temperature` or `topP`, but not both.
### [`topK`](#topk)
Only sample from the top K options for each subsequent token.
Used to remove "long tail" low probability responses.
Recommended for advanced use cases only. You usually only need to use `temperature`.
### [`presencePenalty`](#presencepenalty)
The presence penalty affects the likelihood of the model to repeat information that is already in the prompt.
The value is passed through to the provider. The range depends on the provider and model.
For most providers, `0` means no penalty.
### [`frequencyPenalty`](#frequencypenalty)
The frequency penalty affects the likelihood of the model to repeatedly use the same words or phrases.
The value is passed through to the provider. The range depends on the provider and model.
For most providers, `0` means no penalty.
### [`stopSequences`](#stopsequences)
The stop sequences to use for stopping the text generation.
If set, the model will stop generating text when one of the stop sequences is generated.
Providers may have limits on the number of stop sequences.
### [`seed`](#seed)
It is the seed (integer) to use for random sampling.
If set and supported by the model, calls will generate deterministic results.
### [`maxRetries`](#maxretries)
Maximum number of retries. Set to 0 to disable retries. Default: `2`.
### [`abortSignal`](#abortsignal)
An optional abort signal that can be used to cancel the call.
The abort signal can e.g. be forwarded from a user interface to cancel the call,
or to define a timeout using `AbortSignal.timeout`.
#### [Example: AbortSignal.timeout](#example-abortsignaltimeout)
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Invent a new holiday and describe its traditions.',
abortSignal: AbortSignal.timeout(5000), // 5 seconds
});
`
```
### [`timeout`](#timeout)
An optional timeout in milliseconds. The call will be aborted if it takes longer than the specified duration.
This is a convenience parameter that creates an abort signal internally. It can be used alongside `abortSignal` - if both are provided, the call will abort when either condition is met.
You can specify the timeout either as a number (milliseconds) or as an object with `totalMs`, `stepMs`, and/or `chunkMs` properties:
* `totalMs`: The total timeout for the entire call including all steps.
* `stepMs`: The timeout for each individual step (LLM call). This is useful for multi-step generations where you want to limit the time spent on each step independently.
* `chunkMs`: The timeout between stream chunks (streaming only). The call will abort if no new chunk is received within this duration. This is useful for detecting stalled streams.
#### [Example: 5 second timeout (number format)](#example-5-second-timeout-number-format)
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Invent a new holiday and describe its traditions.',
timeout: 5000, // 5 seconds
});
`
```
#### [Example: 5 second total timeout (object format)](#example-5-second-total-timeout-object-format)
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Invent a new holiday and describe its traditions.',
timeout: { totalMs: 5000 }, // 5 seconds
});
`
```
#### [Example: 10 second step timeout](#example-10-second-step-timeout)
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Invent a new holiday and describe its traditions.',
timeout: { stepMs: 10000 }, // 10 seconds per step
});
`
```
#### [Example: Combined total and step timeout](#example-combined-total-and-step-timeout)
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Invent a new holiday and describe its traditions.',
timeout: {
totalMs: 60000, // 60 seconds total
stepMs: 10000, // 10 seconds per step
},
});
`
```
#### [Example: Per-chunk timeout for streaming (streamText only)](#example-per-chunk-timeout-for-streaming-streamtext-only)
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Invent a new holiday and describe its traditions.',
timeout: { chunkMs: 5000 }, // abort if no chunk received for 5 seconds
});
`
```
### [`headers`](#headers)
Additional HTTP headers to be sent with the request. Only applicable for HTTP-based providers.
You can use the request headers to provide additional information to the provider,
depending on what the provider supports. For example, some observability providers support
headers such as `Prompt-Id`.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText } from 'ai';
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Invent a new holiday and describe its traditions.',
headers: {
'Prompt-Id': 'my-prompt-id',
},
});
`
```
The `headers` setting is for request-specific headers. You can also set
`headers` in the provider configuration. These headers will be sent with every
request made by the provider.
On this page
[Settings](#settings)
[maxOutputTokens](#maxoutputtokens)
[temperature](#temperature)
[topP](#topp)
[topK](#topk)
[presencePenalty](#presencepenalty)
[frequencyPenalty](#frequencypenalty)
[stopSequences](#stopsequences)
[seed](#seed)
[maxRetries](#maxretries)
[abortSignal](#abortsignal)
[Example: AbortSignal.timeout](#example-abortsignaltimeout)
[timeout](#timeout)
[Example: 5 second timeout (number format)](#example-5-second-timeout-number-format)
[Example: 5 second total timeout (object format)](#example-5-second-total-timeout-object-format)
[Example: 10 second step timeout](#example-10-second-step-timeout)
[Example: Combined total and step timeout](#example-combined-total-and-step-timeout)
[Example: Per-chunk timeout for streaming (streamText only)](#example-per-chunk-timeout-for-streaming-streamtext-only)
[headers](#headers)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)