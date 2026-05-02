AI SDK Core: Telemetry
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
# [Telemetry](#telemetry)
AI SDK Telemetry is experimental and may change in the future.
The AI SDK uses [OpenTelemetry](https://opentelemetry.io/) to collect telemetry data.
OpenTelemetry is an open-source observability framework designed to provide
standardized instrumentation for collecting telemetry data.
Check out the [AI SDK Observability Integrations](/providers/observability)
to see providers that offer monitoring and tracing for AI SDK applications.
## [Enabling telemetry](#enabling-telemetry)
For Next.js applications, please follow the [Next.js OpenTelemetry guide](https://nextjs.org/docs/app/building-your-application/optimizing/open-telemetry) to enable telemetry first.
You can then use the `experimental\_telemetry` option to enable telemetry on specific function calls while the feature is experimental:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Write a short story about a cat.',
experimental\_telemetry: { isEnabled: true },
});
`
```
When telemetry is enabled, you can also control if you want to record the input values and the output values for the function.
By default, both are enabled. You can disable them by setting the `recordInputs` and `recordOutputs` options to `false`.
Disabling the recording of inputs and outputs can be useful for privacy, data transfer, and performance reasons.
You might for example want to disable recording inputs if they contain sensitive information.
## [Telemetry Metadata](#telemetry-metadata)
You can provide a `functionId` to identify the function that the telemetry data is for,
and `metadata` to include additional information in the telemetry data.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Write a short story about a cat.',
experimental\_telemetry: {
isEnabled: true,
functionId: 'my-awesome-function',
metadata: {
something: 'custom',
someOtherThing: 'other-value',
},
},
});
`
```
## [Custom Tracer](#custom-tracer)
You may provide a `tracer` which must return an OpenTelemetry `Tracer`. This is useful in situations where
you want your traces to use a `TracerProvider` other than the one provided by the `@opentelemetry/api` singleton.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
const tracerProvider = new NodeTracerProvider();
const result = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Write a short story about a cat.',
experimental\_telemetry: {
isEnabled: true,
tracer: tracerProvider.getTracer('ai'),
},
});
`
```
## [Telemetry Integrations](#telemetry-integrations)
Telemetry integrations let you hook into the generation lifecycle to build custom observability — logging, analytics, DevTools, or any other monitoring system. Instead of wiring up individual callbacks on every call, you implement a `TelemetryIntegration` once and pass it via `experimental\_telemetry.integrations`.
### [Using an integration](#using-an-integration)
Pass one or more integrations to any `generateText` or `streamText` call:
```
`
import { streamText } from 'ai';
import { devToolsIntegration } from '@ai-sdk/devtools';
const result = streamText({
model: openai('gpt-4o'),
prompt: 'Hello!',
experimental\_telemetry: {
isEnabled: true,
integrations: [devToolsIntegration()],
},
});
`
```
You can combine multiple integrations — they all receive the same lifecycle events:
```
`
experimental\_telemetry: {
isEnabled: true,
integrations: [devToolsIntegration(), otelIntegration(), customLogger()],
},
`
```
Errors inside integrations are caught and do not break the generation flow.
### [Building a custom integration](#building-a-custom-integration)
Implement the `TelemetryIntegration` interface from the `ai` package. All methods are optional — implement only the lifecycle events you care about:
```
`
import type { TelemetryIntegration } from 'ai';
import { bindTelemetryIntegration } from 'ai';
class MyIntegration implements TelemetryIntegration {
async onStart(event) {
console.log('Generation started:', event.model.modelId);
}
async onStepFinish(event) {
console.log(
`Step ${event.stepNumber} done:`,
event.usage.totalTokens,
'tokens',
);
}
async onToolCallFinish(event) {
if (event.success) {
console.log(
`Tool "${event.toolCall.toolName}" took ${event.durationMs}ms`,
);
} else {
console.error(`Tool "${event.toolCall.toolName}" failed:`, event.error);
}
}
async onFinish(event) {
console.log('Done. Total tokens:', event.totalUsage.totalTokens);
}
}
export function myIntegration(): TelemetryIntegration {
return bindTelemetryIntegration(new MyIntegration());
}
`
```
Use `bindTelemetryIntegration` for class-based integrations to ensure `this` is correctly bound when methods are extracted and called as callbacks.
### [Available lifecycle methods](#available-lifecycle-methods)
### onStart:
(event: OnStartEvent) =\> void | PromiseLike\<void\>
### onStepStart:
(event: OnStepStartEvent) =\> void | PromiseLike\<void\>
### onToolCallStart:
(event: OnToolCallStartEvent) =\> void | PromiseLike\<void\>
### onToolCallFinish:
(event: OnToolCallFinishEvent) =\> void | PromiseLike\<void\>
### onStepFinish:
(event: OnStepFinishEvent) =\> void | PromiseLike\<void\>
### onFinish:
(event: OnFinishEvent) =\> void | PromiseLike\<void\>
The event types for each method are the same as the corresponding [event callbacks](/docs/ai-sdk-core/event-listeners). See the event callbacks documentation for the full property reference of each event.
## [Collected Data](#collected-data)
### [generateText function](#generatetext-function)
`generateText` records 3 types of spans:
* `ai.generateText` (span): the full length of the generateText call. It contains 1 or more `ai.generateText.doGenerate` spans.
It contains the [basic LLM span information](#basic-llm-span-information) and the following attributes:
* `operation.name`: `ai.generateText` and the functionId that was set through `telemetry.functionId`
* `ai.operationId`: `"ai.generateText"`
* `ai.prompt`: the prompt that was used when calling `generateText`
* `ai.response.text`: the text that was generated
* `ai.response.toolCalls`: the tool calls that were made as part of the generation (stringified JSON)
* `ai.response.finishReason`: the reason why the generation finished
* `ai.settings.maxOutputTokens`: the maximum number of output tokens that were set
* `ai.generateText.doGenerate` (span): a provider doGenerate call. It can contain `ai.toolCall` spans.
It contains the [call LLM span information](#call-llm-span-information) and the following attributes:
* `operation.name`: `ai.generateText.doGenerate` and the functionId that was set through `telemetry.functionId`
* `ai.operationId`: `"ai.generateText.doGenerate"`
* `ai.prompt.messages`: the messages that were passed into the provider
* `ai.prompt.tools`: array of stringified tool definitions. The tools can be of type `function` or `provider-defined-client`.
Function tools have a `name`, `description` (optional), and `inputSchema` (JSON schema).
Provider-defined-client tools have a `name`, `id`, and `input` (Record).
* `ai.prompt.toolChoice`: the stringified tool choice setting (JSON). It has a `type` property
(`auto`, `none`, `required`, `tool`), and if the type is `tool`, a `toolName` property with the specific tool.
* `ai.response.text`: the text that was generated
* `ai.response.toolCalls`: the tool calls that were made as part of the generation (stringified JSON)
* `ai.response.finishReason`: the reason why the generation finished
* `ai.toolCall` (span): a tool call that is made as part of the generateText call. See [Tool call spans](#tool-call-spans) for more details.
### [streamText function](#streamtext-function)
`streamText` records 3 types of spans and 2 types of events:
* `ai.streamText` (span): the full length of the streamText call. It contains a `ai.streamText.doStream` span.
It contains the [basic LLM span information](#basic-llm-span-information) and the following attributes:
* `operation.name`: `ai.streamText` and the functionId that was set through `telemetry.functionId`
* `ai.operationId`: `"ai.streamText"`
* `ai.prompt`: the prompt that was used when calling `streamText`
* `ai.response.text`: the text that was generated
* `ai.response.toolCalls`: the tool calls that were made as part of the generation (stringified JSON)
* `ai.response.finishReason`: the reason why the generation finished
* `ai.settings.maxOutputTokens`: the maximum number of output tokens that were set
* `ai.streamText.doStream` (span): a provider doStream call.
This span contains an `ai.stream.firstChunk` event and `ai.toolCall` spans.
It contains the [call LLM span information](#call-llm-span-information) and the following attributes:
* `operation.name`: `ai.streamText.doStream` and the functionId that was set through `telemetry.functionId`
* `ai.operationId`: `"ai.streamText.doStream"`
* `ai.prompt.messages`: the messages that were passed into the provider
* `ai.prompt.tools`: array of stringified tool definitions. The tools can be of type `function` or `provider-defined-client`.
Function tools have a `name`, `description` (optional), and `inputSchema` (JSON schema).
Provider-defined-client tools have a `name`, `id`, and `input` (Record).
* `ai.prompt.toolChoice`: the stringified tool choice setting (JSON). It has a `type` property
(`auto`, `none`, `required`, `tool`), and if the type is `tool`, a `toolName` property with the specific tool.
* `ai.response.text`: the text that was generated
* `ai.response.toolCalls`: the tool calls that were made as part of the generation (stringified JSON)
* `ai.response.msToFirstChunk`: the time it took to receive the first chunk in milliseconds
* `ai.response.msToFinish`: the time it took to receive the finish part of the LLM stream in milliseconds
* `ai.response.avgCompletionTokensPerSecond`: the average number of completion tokens per second
* `ai.response.finishReason`: the reason why the generation finished
* `ai.toolCall` (span): a tool call that is made as part of the generateText call. See [Tool call spans](#tool-call-spans) for more details.
* `ai.stream.firstChunk` (event): an event that is emitted when the first chunk of the stream is received.
* `ai.response.msToFirstChunk`: the time it took to receive the first chunk
* `ai.stream.finish` (event): an event that is emitted when the finish part of the LLM stream is received.
It also records a `ai.stream.firstChunk` event when the first chunk of the stream is received.
### [Deprecated object APIs](#deprecated-object-apis)
`generateObject` and `streamObject` are deprecated. Use `generateText` and
`streamText` with the `output` property instead.
If you still run deprecated object APIs, you will see legacy span names:
* `generateObject`: `ai.generateObject`, `ai.generateObject.doGenerate`
* `streamObject`: `ai.streamObject`, `ai.streamObject.doStream`, `ai.stream.firstChunk`
Legacy object spans include the same core metadata as other LLM spans, plus
object-specific attributes such as `ai.schema.\*`, `ai.response.object`, and
`ai.settings.output`.
### [embed function](#embed-function)
`embed` records 2 types of spans:
* `ai.embed` (span): the full length of the embed call. It contains 1 `ai.embed.doEmbed` spans.
It contains the [basic embedding span information](#basic-embedding-span-information) and the following attributes:
* `operation.name`: `ai.embed` and the functionId that was set through `telemetry.functionId`
* `ai.operationId`: `"ai.embed"`
* `ai.value`: the value that was passed into the `embed` function
* `ai.embedding`: a JSON-stringified embedding
* `ai.embed.doEmbed` (span): a provider doEmbed call.
It contains the [basic embedding span information](#basic-embedding-span-information) and the following attributes:
* `operation.name`: `ai.embed.doEmbed` and the functionId that was set through `telemetry.functionId`
* `ai.operationId`: `"ai.embed.doEmbed"`
* `ai.values`: the values that were passed into the provider (array)
* `ai.embeddings`: an array of JSON-stringified embeddings
### [embedMany function](#embedmany-function)
`embedMany` records 2 types of spans:
* `ai.embedMany` (span): the full length of the embedMany call. It contains 1 or more `ai.embedMany.doEmbed` spans.
It contains the [basic embedding span information](#basic-embedding-span-information) and the following attributes:
* `operation.name`: `ai.embedMany` and the functionId that was set through `telemetry.functionId`
* `ai.operationId`: `"ai.embedMany"`
* `ai.values`: the values that were passed into the `embedMany` function
* `ai.embeddings`: an array of JSON-stringified embedding
* `ai.embedMany.doEmbed` (span): a provider doEmbed call.
It contains the [basic embedding span information](#basic-embedding-span-information) and the following attributes:
* `operation.name`: `ai.embedMany.doEmbed` and the functionId that was set through `telemetry.functionId`
* `ai.operationId`: `"ai.embedMany.doEmbed"`
* `ai.values`: the values that were sent to the provider
* `ai.embeddings`: an array of JSON-stringified embeddings for each value
## [Span Details](#span-details)
### [Basic LLM span information](#basic-llm-span-information)
Many spans that use LLMs (`ai.generateText`, `ai.generateText.doGenerate`, `ai.streamText`, `ai.streamText.doStream`) contain the following attributes:
* `resource.name`: the functionId that was set through `telemetry.functionId`
* `ai.model.id`: the id of the model
* `ai.model.provider`: the provider of the model
* `ai.request.headers.\*`: the request headers that were passed in through `headers`
* `ai.response.providerMetadata`: provider specific metadata returned with the generation response
* `ai.settings.maxRetries`: the maximum number of retries that were set
* `ai.telemetry.functionId`: the functionId that was set through `telemetry.functionId`
* `ai.telemetry.metadata.\*`: the metadata that was passed in through `telemetry.metadata`
* `ai.usage.completionTokens`: the number of completion tokens that were used
* `ai.usage.promptTokens`: the number of prompt tokens that were used
### [Call LLM span information](#call-llm-span-information)
Spans that correspond to individual LLM calls (`ai.generateText.doGenerate`, `ai.streamText.doStream`) contain
[basic LLM span information](#basic-llm-span-information) and the following attributes:
* `ai.response.model`: the model that was used to generate the response. This can be different from the model that was requested if the provider supports aliases.
* `ai.response.id`: the id of the response. Uses the ID from the provider when available.
* `ai.response.timestamp`: the timestamp of the response. Uses the timestamp from the provider when available.
* [Semantic Conventions for GenAI operations](https://opentelemetry.io/docs/specs/semconv/gen-ai/gen-ai-spans/)
* `gen\_ai.system`: the provider that was used
* `gen\_ai.request.model`: the model that was requested
* `gen\_ai.request.temperature`: the temperature that was set
* `gen\_ai.request.max\_tokens`: the maximum number of tokens that were set
* `gen\_ai.request.frequency\_penalty`: the frequency penalty that was set
* `gen\_ai.request.presence\_penalty`: the presence penalty that was set
* `gen\_ai.request.top\_k`: the topK parameter value that was set
* `gen\_ai.request.top\_p`: the topP parameter value that was set
* `gen\_ai.request.stop\_sequences`: the stop sequences
* `gen\_ai.response.finish\_reasons`: the finish reasons that were returned by the provider
* `gen\_ai.response.model`: the model that was used to generate the response. This can be different from the model that was requested if the provider supports aliases.
* `gen\_ai.response.id`: the id of the response. Uses the ID from the provider when available.
* `gen\_ai.usage.input\_tokens`: the number of prompt tokens that were used
* `gen\_ai.usage.output\_tokens`: the number of completion tokens that were used
### [Basic embedding span information](#basic-embedding-span-information)
Many spans that use embedding models (`ai.embed`, `ai.embed.doEmbed`, `ai.embedMany`, `ai.embedMany.doEmbed`) contain the following attributes:
* `ai.model.id`: the id of the model
* `ai.model.provider`: the provider of the model
* `ai.request.headers.\*`: the request headers that were passed in through `headers`
* `ai.settings.maxRetries`: the maximum number of retries that were set
* `ai.telemetry.functionId`: the functionId that was set through `telemetry.functionId`
* `ai.telemetry.metadata.\*`: the metadata that was passed in through `telemetry.metadata`
* `ai.usage.tokens`: the number of tokens that were used
* `resource.name`: the functionId that was set through `telemetry.functionId`
### [Tool call spans](#tool-call-spans)
Tool call spans (`ai.toolCall`) contain the following attributes:
* `operation.name`: `"ai.toolCall"`
* `ai.operationId`: `"ai.toolCall"`
* `ai.toolCall.name`: the name of the tool
* `ai.toolCall.id`: the id of the tool call
* `ai.toolCall.args`: the input parameters of the tool call
* `ai.toolCall.result`: the output result of the tool call. Only available if the tool call is successful and the result is serializable.
On this page
[Telemetry](#telemetry)
[Enabling telemetry](#enabling-telemetry)
[Telemetry Metadata](#telemetry-metadata)
[Custom Tracer](#custom-tracer)
[Telemetry Integrations](#telemetry-integrations)
[Using an integration](#using-an-integration)
[Building a custom integration](#building-a-custom-integration)
[Available lifecycle methods](#available-lifecycle-methods)
[Collected Data](#collected-data)
[generateText function](#generatetext-function)
[streamText function](#streamtext-function)
[Deprecated object APIs](#deprecated-object-apis)
[embed function](#embed-function)
[embedMany function](#embedmany-function)
[Span Details](#span-details)
[Basic LLM span information](#basic-llm-span-information)
[Call LLM span information](#call-llm-span-information)
[Basic embedding span information](#basic-embedding-span-information)
[Tool call spans](#tool-call-spans)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)