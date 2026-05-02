Migration Guides: Migrate AI SDK 3.4 to 4.0
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
# [Migrate AI SDK 3.4 to 4.0](#migrate-ai-sdk-34-to-40)
Check out the [AI SDK 4.0 release blog
post](https://vercel.com/blog/ai-sdk-4-0) for more information about the
release.
## [Recommended Migration Process](#recommended-migration-process)
1. Backup your project. If you use a versioning control system, make sure all previous versions are committed.
2. [Migrate to AI SDK 3.4](/docs/migration-guides/migration-guide-3-4).
3. Upgrade to AI SDK 4.0.
4. Automatically migrate your code using [codemods](#codemods).
>
> If you don&#x27;t want to use codemods, we recommend resolving all deprecation warnings before upgrading to AI SDK 4.0.
>
5. Follow the breaking changes guide below.
6. Verify your project is working as expected.
7. Commit your changes.
## [AI SDK 4.0 package versions](#ai-sdk-40-package-versions)
You need to update the following packages to the following versions in your `package.json` file(s):
* `ai` package: `4.0.\*`
* `ai-sdk@provider-utils` package: `2.0.\*`
* `ai-sdk/\*` packages: `1.0.\*` (other `@ai-sdk` packages)
## [Codemods](#codemods)
The AI SDK provides Codemod transformations to help upgrade your codebase when a
feature is deprecated, removed, or otherwise changed.
Codemods are transformations that run on your codebase programmatically. They
allow you to easily apply many changes without having to manually go through
every file.
Codemods are intended as a tool to help you with the upgrade process. They may
not cover all of the changes you need to make. You may need to make additional
changes manually.
You can run all codemods provided as part of the 4.0 upgrade process by running
the following command from the root of your project:
```
`
npx @ai-sdk/codemod upgrade
`
```
To run only the v4 codemods:
```
`
npx @ai-sdk/codemod v4
`
```
Individual codemods can be run by specifying the name of the codemod:
```
`
npx @ai-sdk/codemod \<codemod-name\> \<path\>
`
```
For example, to run a specific v4 codemod:
```
`
npx @ai-sdk/codemod v4/replace-baseurl src/
`
```
See also the [table of codemods](#codemod-table). In addition, the latest set of
codemods can be found in the
[`@ai-sdk/codemod`](https://github.com/vercel/ai/tree/main/packages/codemod/src/codemods)
repository.
## [Provider Changes](#provider-changes)
### [Removed `baseUrl` option](#removed-baseurl-option)
The `baseUrl` option has been removed from all providers. Please use the `baseURL` option instead.
AI SDK 3.4
```
`
const perplexity = createOpenAI({
// ...
baseUrl: 'https://api.perplexity.ai/',
});
`
```
AI SDK 4.0
```
`
const perplexity = createOpenAI({
// ...
baseURL: 'https://api.perplexity.ai/',
});
`
```
### [Anthropic Provider](#anthropic-provider)
#### [Removed `Anthropic` facade](#removed-anthropic-facade)
The `Anthropic` facade has been removed from the Anthropic provider.
Please use the `anthropic` object or the `createAnthropic` function instead.
AI SDK 3.4
```
`
const anthropic = new Anthropic({
// ...
});
`
```
AI SDK 4.0
```
`
const anthropic = createAnthropic({
// ...
});
`
```
#### [Removed `topK` setting](#removed-topk-setting)
There is no codemod available for this change. Please review and update your
code manually.
The model specific `topK` setting has been removed from the Anthropic provider.
You can use the standard `topK` setting instead.
AI SDK 3.4
```
`
const result = await generateText({
model: anthropic('claude-3-5-sonnet-latest', {
topK: 0.5,
}),
});
`
```
AI SDK 4.0
```
`
const result = await generateText({
model: anthropic('claude-3-5-sonnet-latest'),
topK: 0.5,
});
`
```
### [Google Generative AI Provider](#google-generative-ai-provider)
#### [Removed `Google` facade](#removed-google-facade)
The `Google` facade has been removed from the Google Generative AI provider.
Please use the `google` object or the `createGoogleGenerativeAI` function instead.
AI SDK 3.4
```
`
const google = new Google({
// ...
});
`
```
AI SDK 4.0
```
`
const google = createGoogleGenerativeAI({
// ...
});
`
```
#### [Removed `topK` setting](#removed-topk-setting-1)
There is no codemod available for this change. Please review and update your
code manually.
The model-specific `topK` setting has been removed from the Google Generative AI provider.
You can use the standard `topK` setting instead.
AI SDK 3.4
```
`
const result = await generateText({
model: google('gemini-1.5-flash', {
topK: 0.5,
}),
});
`
```
AI SDK 4.0
```
`
const result = await generateText({
model: google('gemini-1.5-flash'),
topK: 0.5,
});
`
```
### [Google Vertex Provider](#google-vertex-provider)
#### [Removed `topK` setting](#removed-topk-setting-2)
There is no codemod available for this change. Please review and update your
code manually.
The model-specific `topK` setting has been removed from the Google Vertex provider.
You can use the standard `topK` setting instead.
AI SDK 3.4
```
`
const result = await generateText({
model: vertex('gemini-1.5-flash', {
topK: 0.5,
}),
});
`
```
AI SDK 4.0
```
`
const result = await generateText({
model: vertex('gemini-1.5-flash'),
topK: 0.5,
});
`
```
### [Mistral Provider](#mistral-provider)
#### [Removed `Mistral` facade](#removed-mistral-facade)
The `Mistral` facade has been removed from the Mistral provider.
Please use the `mistral` object or the `createMistral` function instead.
AI SDK 3.4
```
`
const mistral = new Mistral({
// ...
});
`
```
AI SDK 4.0
```
`
const mistral = createMistral({
// ...
});
`
```
### [OpenAI Provider](#openai-provider)
#### [Removed `OpenAI` facade](#removed-openai-facade)
The `OpenAI` facade has been removed from the OpenAI provider.
Please use the `openai` object or the `createOpenAI` function instead.
AI SDK 3.4
```
`
const openai = new OpenAI({
// ...
});
`
```
AI SDK 4.0
```
`
const openai = createOpenAI({
// ...
});
`
```
### [LangChain Adapter](#langchain-adapter)
#### [Removed `toAIStream`](#removed-toaistream)
The `toAIStream` function has been removed from the LangChain adapter.
Please use the `toDataStream` function instead.
AI SDK 3.4
```
`
LangChainAdapter.toAIStream(stream);
`
```
AI SDK 4.0
```
`
LangChainAdapter.toDataStream(stream);
`
```
## [AI SDK Core Changes](#ai-sdk-core-changes)
### [`streamText` returns immediately](#streamtext-returns-immediately)
Instead of returning a Promise, the `streamText` function now returns immediately.
It is not necessary to await the result of `streamText`.
AI SDK 3.4
```
`
const result = await streamText({
// ...
});
`
```
AI SDK 4.0
```
`
const result = streamText({
// ...
});
`
```
### [`streamObject` returns immediately](#streamobject-returns-immediately)
Instead of returning a Promise, the `streamObject` function now returns immediately.
It is not necessary to await the result of `streamObject`.
AI SDK 3.4
```
`
const result = await streamObject({
// ...
});
`
```
AI SDK 4.0
```
`
const result = streamObject({
// ...
});
`
```
### [Remove roundtrips](#remove-roundtrips)
The `maxToolRoundtrips` and `maxAutomaticRoundtrips` options have been removed from the `generateText` and `streamText` functions.
Please use the `maxSteps` option instead.
The `roundtrips` property has been removed from the `GenerateTextResult` type.
Please use the `steps` property instead.
AI SDK 3.4
```
`
const { text, roundtrips } = await generateText({
maxToolRoundtrips: 1, // or maxAutomaticRoundtrips
// ...
});
`
```
AI SDK 4.0
```
`
const { text, steps } = await generateText({
maxSteps: 2,
// ...
});
`
```
### [Removed `nanoid` export](#removed-nanoid-export)
The `nanoid` export has been removed. Please use [`generateId`](/docs/reference/ai-sdk-core/generate-id) instead.
AI SDK 3.4
```
`
import { nanoid } from 'ai';
`
```
AI SDK 4.0
```
`
import { generateId } from 'ai';
`
```
### [Increased default size of generated IDs](#increased-default-size-of-generated-ids)
There is no codemod available for this change. Please review and update your
code manually.
The [`generateId`](/docs/reference/ai-sdk-core/generate-id) function now
generates 16-character IDs. The previous default was 7 characters.
This might e.g. require updating your database schema if you limit the length of
IDs.
AI SDK 4.0
```
`
import { generateId } from 'ai';
const id = generateId(); // now 16 characters
`
```
### [Removed `ExperimentalMessage` types](#removed-experimentalmessage-types)
The following types have been removed:
* `ExperimentalMessage` (use `ModelMessage` instead)
* `ExperimentalUserMessage` (use `CoreUserMessage` instead)
* `ExperimentalAssistantMessage` (use `CoreAssistantMessage` instead)
* `ExperimentalToolMessage` (use `CoreToolMessage` instead)
AI SDK 3.4
```
`
import {
ExperimentalMessage,
ExperimentalUserMessage,
ExperimentalAssistantMessage,
ExperimentalToolMessage,
} from 'ai';
`
```
AI SDK 4.0
```
`
import {
ModelMessage,
CoreUserMessage,
CoreAssistantMessage,
CoreToolMessage,
} from 'ai';
`
```
### [Removed `ExperimentalTool` type](#removed-experimentaltool-type)
The `ExperimentalTool` type has been removed. Please use the `CoreTool` type instead.
AI SDK 3.4
```
`
import { ExperimentalTool } from 'ai';
`
```
AI SDK 4.0
```
`
import { CoreTool } from 'ai';
`
```
### [Removed experimental AI function exports](#removed-experimental-ai-function-exports)
The following exports have been removed:
* `experimental\_generateText` (use `generateText` instead)
* `experimental\_streamText` (use `streamText` instead)
* `experimental\_generateObject` (use `generateObject` instead)
* `experimental\_streamObject` (use `streamObject` instead)
AI SDK 3.4
```
`
import {
experimental\_generateText,
experimental\_streamText,
experimental\_generateObject,
experimental\_streamObject,
} from 'ai';
`
```
AI SDK 4.0
```
`
import { generateText, streamText, generateObject, streamObject } from 'ai';
`
```
### [Removed AI-stream related methods from `streamText`](#removed-ai-stream-related-methods-from-streamtext)
The following methods have been removed from the `streamText` result:
* `toAIStream`
* `pipeAIStreamToResponse`
* `toAIStreamResponse`
Use the `toDataStream`, `pipeDataStreamToResponse`, and `toDataStreamResponse` functions instead.
AI SDK 3.4
```
`
const result = await streamText({
// ...
});
result.toAIStream();
result.pipeAIStreamToResponse(response);
result.toAIStreamResponse();
`
```
AI SDK 4.0
```
`
const result = streamText({
// ...
});
result.toDataStream();
result.pipeDataStreamToResponse(response);
result.toUIMessageStreamResponse();
`
```
### [Renamed "formatStreamPart" to "formatDataStreamPart"](#renamed-formatstreampart-to-formatdatastreampart)
The `formatStreamPart` function has been renamed to `formatDataStreamPart`.
AI SDK 3.4
```
`
formatStreamPart('text', 'Hello, world!');
`
```
AI SDK 4.0
```
`
formatDataStreamPart('text', 'Hello, world!');
`
```
### [Renamed "parseStreamPart" to "parseDataStreamPart"](#renamed-parsestreampart-to-parsedatastreampart)
The `parseStreamPart` function has been renamed to `parseDataStreamPart`.
AI SDK 3.4
```
`
const part = parseStreamPart(line);
`
```
AI SDK 4.0
```
`
const part = parseDataStreamPart(line);
`
```
### [Renamed `TokenUsage`, `CompletionTokenUsage` and `EmbeddingTokenUsage` types](#renamed-tokenusage-completiontokenusage-and-embeddingtokenusage-types)
The `TokenUsage`, `CompletionTokenUsage` and `EmbeddingTokenUsage` types have
been renamed to `LanguageModelUsage` (for the first two) and
`EmbeddingModelUsage` (for the last).
AI SDK 3.4
```
`
import { TokenUsage, CompletionTokenUsage, EmbeddingTokenUsage } from 'ai';
`
```
AI SDK 4.0
```
`
import { LanguageModelUsage, EmbeddingModelUsage } from 'ai';
`
```
### [Removed deprecated telemetry data](#removed-deprecated-telemetry-data)
There is no codemod available for this change. Please review and update your
code manually.
The following telemetry data values have been removed:
* `ai.finishReason` (now in `ai.response.finishReason`)
* `ai.result.object` (now in `ai.response.object`)
* `ai.result.text` (now in `ai.response.text`)
* `ai.result.toolCalls` (now in `ai.response.toolCalls`)
* `ai.stream.msToFirstChunk` (now in `ai.response.msToFirstChunk`)
This change will apply to observability providers and any scripts or automation that you use for processing telemetry data.
### [Provider Registry](#provider-registry)
#### [Removed experimental\_Provider, experimental\_ProviderRegistry, and experimental\_ModelRegistry](#removed-experimental_provider-experimental_providerregistry-and-experimental_modelregistry)
The `experimental\_Provider` interface, `experimental\_ProviderRegistry` interface, and `experimental\_ModelRegistry` interface have been removed.
Please use the `Provider` interface instead.
AI SDK 3.4
```
`
import { experimental\_Provider, experimental\_ProviderRegistry } from 'ai';
`
```
AI SDK 4.0
```
`
import { Provider } from 'ai';
`
```
The model registry is not available any more. Please [register
providers](/docs/reference/ai-sdk-core/provider-registry#setup) instead.
#### [Removed `experimental\_​createModelRegistry` function](#removed-experimental_createmodelregistry-function)
The `experimental\_createModelRegistry` function has been removed.
Please use the `experimental\_createProviderRegistry` function instead.
AI SDK 3.4
```
`
import { experimental\_createModelRegistry } from 'ai';
`
```
AI SDK 4.0
```
`
import { experimental\_createProviderRegistry } from 'ai';
`
```
The model registry is not available any more. Please [register
providers](/docs/reference/ai-sdk-core/provider-registry#setup) instead.
### [Removed `rawResponse` from results](#removed-rawresponse-from-results)
There is no codemod available for this change. Please review and update your
code manually.
The `rawResponse` property has been removed from the `generateText`, `streamText`, `generateObject`, and `streamObject` results.
You can use the `response` property instead.
AI SDK 3.4
```
`
const { text, rawResponse } = await generateText({
// ...
});
`
```
AI SDK 4.0
```
`
const { text, response } = await generateText({
// ...
});
`
```
### [Removed `init` option from `pipeDataStreamToResponse` and `toDataStreamResponse`](#removed-init-option-from-pipedatastreamtoresponse-and-todatastreamresponse)
There is no codemod available for this change. Please review and update your
code manually.
The `init` option has been removed from the `pipeDataStreamToResponse` and `toDataStreamResponse` functions.
You can set the values from `init` directly into the `options` object.
AI SDK 3.4
```
`
const result = await streamText({
// ...
});
result.toUIMessageStreamResponse(response, {
init: {
headers: {
'X-Custom-Header': 'value',
},
},
// ...
});
`
```
AI SDK 4.0
```
`
const result = streamText({
// ...
});
result.toUIMessageStreamResponse(response, {
headers: {
'X-Custom-Header': 'value',
},
// ...
});
`
```
### [Removed `responseMessages` from `generateText` and `streamText`](#removed-responsemessages-from-generatetext-and-streamtext)
There is no codemod available for this change. Please review and update your
code manually.
The `responseMessages` property has been removed from the `generateText` and `streamText` results.
This includes the `onFinish` callback.
Please use the `response.messages` property instead.
AI SDK 3.4
```
`
const { text, responseMessages } = await generateText({
// ...
});
`
```
AI SDK 4.0
```
`
const { text, response } = await generateText({
// ...
});
const responseMessages = response.messages;
`
```
### [Removed `experimental\_​continuationSteps` option](#removed-experimental_continuationsteps-option)
The `experimental\_continuationSteps` option has been removed from the `generateText` function.
Please use the `experimental\_continueSteps` option instead.
AI SDK 3.4
```
`
const result = await generateText({
experimental\_continuationSteps: true,
// ...
});
`
```
AI SDK 4.0
```
`
const result = await generateText({
experimental\_continueSteps: true,
// ...
});
`
```
### [Removed `LanguageModelResponseMetadataWithHeaders` type](#removed-languagemodelresponsemetadatawithheaders-type)
The `LanguageModelResponseMetadataWithHeaders` type has been removed.
Please use the `LanguageModelResponseMetadata` type instead.
AI SDK 3.4
```
`
import { LanguageModelResponseMetadataWithHeaders } from 'ai';
`
```
AI SDK 4.0
```
`
import { LanguageModelResponseMetadata } from 'ai';
`
```
#### [Changed `streamText` warnings result to Promise](#changed-streamtext-warnings-result-to-promise)
There is no codemod available for this change. Please review and update your
code manually.
The `warnings` property of the `StreamTextResult` type is now a Promise.
AI SDK 3.4
```
`
const result = await streamText({
// ...
});
const warnings = result.warnings;
`
```
AI SDK 4.0
```
`
const result = streamText({
// ...
});
const warnings = await result.warnings;
`
```
#### [Changed `streamObject` warnings result to Promise](#changed-streamobject-warnings-result-to-promise)
There is no codemod available for this change. Please review and update your
code manually.
The `warnings` property of the `StreamObjectResult` type is now a Promise.
AI SDK 3.4
```
`
const result = await streamObject({
// ...
});
const warnings = result.warnings;
`
```
AI SDK 4.0
```
`
const result = streamObject({
// ...
});
const warnings = await result.warnings;
`
```
#### [Renamed `simulateReadableStream` `values` to `chunks`](#renamed-simulatereadablestream-values-to-chunks)
There is no codemod available for this change. Please review and update your
code manually.
The `simulateReadableStream` function from `ai/test` has been renamed to `chunks`.
AI SDK 3.4
```
`
import { simulateReadableStream } from 'ai/test';
const stream = simulateReadableStream({
values: [1, 2, 3],
chunkDelayInMs: 100,
});
`
```
AI SDK 4.0
```
`
import { simulateReadableStream } from 'ai/test';
const stream = simulateReadableStream({
chunks: [1, 2, 3],
chunkDelayInMs: 100,
});
`
```
## [AI SDK RSC Changes](#ai-sdk-rsc-changes)
There are no codemods available for the changes in this section. Please review
and update your code manually.
### [Removed `render` function](#removed-render-function)
The AI SDK RSC 3.0 `render` function has been removed.
Please use the `streamUI` function instead or [switch to AI SDK UI](/docs/ai-sdk-rsc/migrating-to-ui).
AI SDK 3.0
```
`
import { render } from '@ai-sdk/rsc';
`
```
AI SDK 4.0
```
`
import { streamUI } from '@ai-sdk/rsc';
`
```
## [AI SDK UI Changes](#ai-sdk-ui-changes)
### [Removed Svelte, Vue, and SolidJS exports](#removed-svelte-vue-and-solidjs-exports)
This codemod only operates on `.ts` and `.tsx` files. If you have code in
files with other suffixes, please review and update your code manually.
The `ai` package no longer exports Svelte, Vue, and SolidJS UI integrations.
You need to install the `@ai-sdk/svelte`, `@ai-sdk/vue`, and `@ai-sdk/solid` packages directly.
AI SDK 3.4
```
`
import { useChat } from 'ai/svelte';
`
```
AI SDK 4.0
```
`
import { useChat } from '@ai-sdk/svelte';
`
```
### [Removed `experimental\_StreamData`](#removed-experimental_streamdata)
The `experimental\_StreamData` export has been removed.
Please use the `StreamData` export instead.
AI SDK 3.4
```
`
import { experimental\_StreamData } from 'ai';
`
```
AI SDK 4.0
```
`
import { StreamData } from 'ai';
`
```
### [`useChat` hook](#usechat-hook)
There are no codemods available for the changes in this section. Please review
and update your code manually.
#### [Removed `streamMode` setting](#removed-streammode-setting)
The `streamMode` options has been removed from the `useChat` hook.
Please use the `streamProtocol` parameter instead.
AI SDK 3.4
```
`
const { messages } = useChat({
streamMode: 'text',
// ...
});
`
```
AI SDK 4.0
```
`
const { messages } = useChat({
streamProtocol: 'text',
// ...
});
`
```
#### [Replaced roundtrip setting with `maxSteps`](#replaced-roundtrip-setting-with-maxsteps)
The following options have been removed from the `useChat` hook:
* `experimental\_maxAutomaticRoundtrips`
* `maxAutomaticRoundtrips`
* `maxToolRoundtrips`
Please use the [`maxSteps`](/docs/ai-sdk-core/tools-and-tool-calling#multi-step-calls) option instead.
The value of `maxSteps` is equal to roundtrips + 1.
AI SDK 3.4
```
`
const { messages } = useChat({
experimental\_maxAutomaticRoundtrips: 2,
// or maxAutomaticRoundtrips
// or maxToolRoundtrips
// ...
});
`
```
AI SDK 4.0
```
`
const { messages } = useChat({
maxSteps: 3, // 2 roundtrips + 1
// ...
});
`
```
#### [Removed `options` setting](#removed-options-setting)
The `options` parameter in the `useChat` hook has been removed.
Please use the `headers` and `body` parameters instead.
AI SDK 3.4
```
`
const { messages } = useChat({
options: {
headers: {
'X-Custom-Header': 'value',
},
},
// ...
});
`
```
AI SDK 4.0
```
`
const { messages } = useChat({
headers: {
'X-Custom-Header': 'value',
},
// ...
});
`
```
#### [Removed `experimental\_addToolResult` method](#removed-experimental_addtoolresult-method)
The `experimental\_addToolResult` method has been removed from the `useChat` hook.
Please use the `addToolResult` method instead.
AI SDK 3.4
```
`
const { messages, experimental\_addToolResult } = useChat({
// ...
});
`
```
AI SDK 4.0
```
`
const { messages, addToolResult } = useChat({
// ...
});
`
```
#### [Changed default value of `keepLastMessageOnError` to true and deprecated the option](#changed-default-value-of-keeplastmessageonerror-to-true-and-deprecated-the-option)
The `keepLastMessageOnError` option has been changed to default to `true`.
The option will be removed in the next major release.
AI SDK 3.4
```
`
const { messages } = useChat({
keepLastMessageOnError: true,
// ...
});
`
```
AI SDK 4.0
```
`
const { messages } = useChat({
// ...
});
`
```
### [`useCompletion` hook](#usecompletion-hook)
There are no codemods available for the changes in this section. Please review
and update your code manually.
#### [Removed `streamMode` setting](#removed-streammode-setting-1)
The `streamMode` options has been removed from the `useCompletion` hook.
Please use the `streamProtocol` parameter instead.
AI SDK 3.4
```
`
const { text } = useCompletion({
streamMode: 'text',
// ...
});
`
```
AI SDK 4.0
```
`
const { text } = useCompletion({
streamProtocol: 'text',
// ...
});
`
```
### [`useAssistant` hook](#useassistant-hook)
#### [Removed `experimental\_useAssistant` export](#removed-experimental_useassistant-export)
The `experimental\_useAssistant` export has been removed from the `useAssistant` hook.
Please use the `useAssistant` hook directly instead.
AI SDK 3.4
```
`
import { experimental\_useAssistant } from '@ai-sdk/react';
`
```
AI SDK 4.0
```
`
import { useAssistant } from '@ai-sdk/react';
`
```
#### [Removed `threadId` and `messageId` from `AssistantResponse`](#removed-threadid-and-messageid-from-assistantresponse)
There is no codemod available for this change. Please review and update your
code manually.
The `threadId` and `messageId` parameters have been removed from the `AssistantResponse` function.
Please use the `threadId` and `messageId` variables from the outer scope instead.
AI SDK 3.4
```
`
return AssistantResponse(
{ threadId: myThreadId, messageId: myMessageId },
async ({ forwardStream, sendDataMessage, threadId, messageId }) =\> {
// use threadId and messageId here
},
);
`
```
AI SDK 4.0
```
`
return AssistantResponse(
{ threadId: myThreadId, messageId: myMessageId },
async ({ forwardStream, sendDataMessage }) =\> {
// use myThreadId and myMessageId here
},
);
`
```
#### [Removed `experimental\_​AssistantResponse` export](#removed-experimental_assistantresponse-export)
There is no codemod available for this change. Please review and update your
code manually.
The `experimental\_AssistantResponse` export has been removed.
Please use the `AssistantResponse` function directly instead.
AI SDK 3.4
```
`
import { experimental\_AssistantResponse } from 'ai';
`
```
AI SDK 4.0
```
`
import { AssistantResponse } from 'ai';
`
```
### [`experimental\_useObject` hook](#experimental_useobject-hook)
There are no codemods available for the changes in this section. Please review
and update your code manually.
The `setInput` helper has been removed from the `experimental\_useObject` hook.
Please use the `submit` helper instead.
AI SDK 3.4
```
`
const { object, setInput } = useObject({
// ...
});
`
```
AI SDK 4.0
```
`
const { object, submit } = useObject({
// ...
});
`
```
## [AI SDK Errors](#ai-sdk-errors)
### [Removed `isXXXError` static methods](#removed-isxxxerror-static-methods)
The `isXXXError` static methods have been removed from AI SDK errors.
Please use the `isInstance` method of the corresponding error class instead.
AI SDK 3.4
```
`
import { APICallError } from 'ai';
APICallError.isAPICallError(error);
`
```
AI SDK 4.0
```
`
import { APICallError } from 'ai';
APICallError.isInstance(error);
`
```
### [Removed `toJSON` method](#removed-tojson-method)
There is no codemod available for this change. Please review and update your
code manually.
The `toJSON` method has been removed from AI SDK errors.
## [AI SDK 2.x Legacy Changes](#ai-sdk-2x-legacy-changes)
There are no codemods available for the changes in this section. Please review
and update your code manually.
### [Removed 2.x legacy providers](#removed-2x-legacy-providers)
Legacy providers from AI SDK 2.x have been removed. Please use the new [AI SDK provider architecture](/docs/foundations/providers-and-models) instead.
#### [Removed 2.x legacy function and tool calling](#removed-2x-legacy-function-and-tool-calling)
The legacy `function\_call` and `tools` options have been removed from `useChat` and `Message`.
The `name` property from the `Message` type has been removed.
Please use the [AI SDK Core tool calling](/docs/ai-sdk-core/tools-and-tool-calling) instead.
### [Removed 2.x prompt helpers](#removed-2x-prompt-helpers)
Prompt helpers for constructing message prompts are no longer needed with the AI SDK provider architecture and have been removed.
### [Removed 2.x `AIStream`](#removed-2x-aistream)
The `AIStream` function and related exports have been removed.
Please use the [`streamText`](/docs/reference/ai-sdk-core/stream-text) function and its `toDataStream()` method instead.
### [Removed 2.x `StreamingTextResponse`](#removed-2x-streamingtextresponse)
The `StreamingTextResponse` function has been removed.
Please use the [`streamText`](/docs/reference/ai-sdk-core/stream-text) function and its `toDataStreamResponse()` method instead.
### [Removed 2.x `streamToResponse`](#removed-2x-streamtoresponse)
The `streamToResponse` function has been removed.
Please use the [`streamText`](/docs/reference/ai-sdk-core/stream-text) function and its `pipeDataStreamToResponse()` method instead.
### [Removed 2.x RSC `Tokens` streaming](#removed-2x-rsc-tokens-streaming)
The legacy `Tokens` RSC streaming from 2.x has been removed.
`Tokens` were implemented prior to AI SDK RSC and are no longer needed.
## [Codemod Table](#codemod-table)
The following table lists codemod availability for the AI SDK 4.0 upgrade
process. Note the codemod `upgrade` command will run all of them for you. This
list is provided to give visibility into which migrations have some automation.
It can also be helpful to find the codemod names if you'd like to run a subset
of codemods. For more, see the [Codemods](#codemods) section.
|Change|Codemod|
|**Provider Changes**||
|Removed baseUrl option|`v4/replace-baseurl`|
|**Anthropic Provider**||
|Removed Anthropic facade|`v4/remove-anthropic-facade`|
|Removed topK setting|*N/A*|
|**Google Generative AI Provider**||
|Removed Google facade|`v4/remove-google-facade`|
|Removed topK setting|*N/A*|
|**Google Vertex Provider**||
|Removed topK setting|*N/A*|
|**Mistral Provider**||
|Removed Mistral facade|`v4/remove-mistral-facade`|
|**OpenAI Provider**||
|Removed OpenAI facade|`v4/remove-openai-facade`|
|**LangChain Adapter**||
|Removed toAIStream|`v4/replace-langchain-toaistream`|
|**AI SDK Core Changes**||
|streamText returns immediately|`v4/remove-await-streamtext`|
|streamObject returns immediately|`v4/remove-await-streamobject`|
|Remove roundtrips|`v4/replace-roundtrips-with-maxsteps`|
|Removed nanoid export|`v4/replace-nanoid`|
|Increased default size of generated IDs|*N/A*|
|Removed ExperimentalMessage types|`v4/remove-experimental-message-types`|
|Removed ExperimentalTool type|`v4/remove-experimental-tool`|
|Removed experimental AI function exports|`v4/remove-experimental-ai-fn-exports`|
|Removed AI-stream related methods from streamText|`v4/remove-ai-stream-methods-from-stream-text-result`|
|Renamed "formatStreamPart" to "formatDataStreamPart"|`v4/rename-format-stream-part`|
|Renamed "parseStreamPart" to "parseDataStreamPart"|`v4/rename-parse-stream-part`|
|Renamed TokenUsage, CompletionTokenUsage and EmbeddingTokenUsage types|`v4/replace-token-usage-types`|
|Removed deprecated telemetry data|*N/A*|
|**Provider Registry**||
|→ Removed experimental\_Provider, experimental\_ProviderRegistry, and experimental\_ModelRegistry|`v4/remove-deprecated-provider-registry-exports`|
|→ Removed experimental\_createModelRegistry function|*N/A*|
|Removed rawResponse from results|*N/A*|
|Removed init option from pipeDataStreamToResponse and toDataStreamResponse|*N/A*|
|Removed responseMessages from generateText and streamText|*N/A*|
|Removed experimental\_continuationSteps option|`v4/replace-continuation-steps`|
|Removed LanguageModelResponseMetadataWithHeaders type|`v4/remove-metadata-with-headers`|
|Changed streamText warnings result to Promise|*N/A*|
|Changed streamObject warnings result to Promise|*N/A*|
|Renamed simulateReadableStream values to chunks|*N/A*|
|**AI SDK RSC Changes**||
|Removed render function|*N/A*|
|**AI SDK UI Changes**||
|Removed Svelte, Vue, and SolidJS exports|`v4/rewrite-framework-imports`|
|Removed experimental\_StreamData|`v4/remove-experimental-streamdata`|
|**useChat hook**||
|Removed streamMode setting|*N/A*|
|Replaced roundtrip setting with maxSteps|`v4/replace-roundtrips-with-maxsteps`|
|Removed options setting|*N/A*|
|Removed experimental\_addToolResult method|*N/A*|
|Changed default value of keepLastMessageOnError to true and deprecated the option|*N/A*|
|**useCompletion hook**||
|Removed streamMode setting|*N/A*|
|**useAssistant hook**||
|Removed experimental\_useAssistant export|`v4/remove-experimental-useassistant`|
|Removed threadId and messageId from AssistantResponse|*N/A*|
|Removed experimental\_AssistantResponse export|*N/A*|
|**experimental\_useObject hook**||
|Removed setInput helper|*N/A*|
|**AI SDK Errors**||
|Removed isXXXError static methods|`v4/remove-isxxxerror`|
|Removed toJSON method|*N/A*|
|**AI SDK 2.x Legacy Changes**||
|Removed 2.x legacy providers|*N/A*|
|Removed 2.x legacy function and tool calling|*N/A*|
|Removed 2.x prompt helpers|*N/A*|
|Removed 2.x AIStream|*N/A*|
|Removed 2.x StreamingTextResponse|*N/A*|
|Removed 2.x streamToResponse|*N/A*|
|Removed 2.x RSC Tokens streaming|*N/A*|
On this page
[Migrate AI SDK 3.4 to 4.0](#migrate-ai-sdk-34-to-40)
[Recommended Migration Process](#recommended-migration-process)
[AI SDK 4.0 package versions](#ai-sdk-40-package-versions)
[Codemods](#codemods)
[Provider Changes](#provider-changes)
[Removed baseUrl option](#removed-baseurl-option)
[Anthropic Provider](#anthropic-provider)
[Removed Anthropic facade](#removed-anthropic-facade)
[Removed topK setting](#removed-topk-setting)
[Google Generative AI Provider](#google-generative-ai-provider)
[Removed Google facade](#removed-google-facade)
[Removed topK setting](#removed-topk-setting-1)
[Google Vertex Provider](#google-vertex-provider)
[Removed topK setting](#removed-topk-setting-2)
[Mistral Provider](#mistral-provider)
[Removed Mistral facade](#removed-mistral-facade)
[OpenAI Provider](#openai-provider)
[Removed OpenAI facade](#removed-openai-facade)
[LangChain Adapter](#langchain-adapter)
[Removed toAIStream](#removed-toaistream)
[AI SDK Core Changes](#ai-sdk-core-changes)
[streamText returns immediately](#streamtext-returns-immediately)
[streamObject returns immediately](#streamobject-returns-immediately)
[Remove roundtrips](#remove-roundtrips)
[Removed nanoid export](#removed-nanoid-export)
[Increased default size of generated IDs](#increased-default-size-of-generated-ids)
[Removed ExperimentalMessage types](#removed-experimentalmessage-types)
[Removed ExperimentalTool type](#removed-experimentaltool-type)
[Removed experimental AI function exports](#removed-experimental-ai-function-exports)
[Removed AI-stream related methods from streamText](#removed-ai-stream-related-methods-from-streamtext)
[Renamed "formatStreamPart" to "formatDataStreamPart"](#renamed-formatstreampart-to-formatdatastreampart)
[Renamed "parseStreamPart" to "parseDataStreamPart"](#renamed-parsestreampart-to-parsedatastreampart)
[Renamed TokenUsage, CompletionTokenUsage and EmbeddingTokenUsage types](#renamed-tokenusage-completiontokenusage-and-embeddingtokenusage-types)
[Removed deprecated telemetry data](#removed-deprecated-telemetry-data)
[Provider Registry](#provider-registry)
[Removed experimental\_Provider, experimental\_ProviderRegistry, and experimental\_ModelRegistry](#removed-experimental_provider-experimental_providerregistry-and-experimental_modelregistry)
[Removed experimental\_​createModelRegistry function](#removed-experimental_createmodelregistry-function)
[Removed rawResponse from results](#removed-rawresponse-from-results)
[Removed init option from pipeDataStreamToResponse and toDataStreamResponse](#removed-init-option-from-pipedatastreamtoresponse-and-todatastreamresponse)
[Removed responseMessages from generateText and streamText](#removed-responsemessages-from-generatetext-and-streamtext)
[Removed experimental\_​continuationSteps option](#removed-experimental_continuationsteps-option)
[Removed LanguageModelResponseMetadataWithHeaders type](#removed-languagemodelresponsemetadatawithheaders-type)
[Changed streamText warnings result to Promise](#changed-streamtext-warnings-result-to-promise)
[Changed streamObject warnings result to Promise](#changed-streamobject-warnings-result-to-promise)
[Renamed simulateReadableStream values to chunks](#renamed-simulatereadablestream-values-to-chunks)
[AI SDK RSC Changes](#ai-sdk-rsc-changes)
[Removed render function](#removed-render-function)
[AI SDK UI Changes](#ai-sdk-ui-changes)
[Removed Svelte, Vue, and SolidJS exports](#removed-svelte-vue-and-solidjs-exports)
[Removed experimental\_StreamData](#removed-experimental_streamdata)
[useChat hook](#usechat-hook)
[Removed streamMode setting](#removed-streammode-setting)
[Replaced roundtrip setting with maxSteps](#replaced-roundtrip-setting-with-maxsteps)
[Removed options setting](#removed-options-setting)
[Removed experimental\_addToolResult method](#removed-experimental_addtoolresult-method)
[Changed default value of keepLastMessageOnError to true and deprecated the option](#changed-default-value-of-keeplastmessageonerror-to-true-and-deprecated-the-option)
[useCompletion hook](#usecompletion-hook)
[Removed streamMode setting](#removed-streammode-setting-1)
[useAssistant hook](#useassistant-hook)
[Removed experimental\_useAssistant export](#removed-experimental_useassistant-export)
[Removed threadId and messageId from AssistantResponse](#removed-threadid-and-messageid-from-assistantresponse)
[Removed experimental\_​AssistantResponse export](#removed-experimental_assistantresponse-export)
[experimental\_useObject hook](#experimental_useobject-hook)
[AI SDK Errors](#ai-sdk-errors)
[Removed isXXXError static methods](#removed-isxxxerror-static-methods)
[Removed toJSON method](#removed-tojson-method)
[AI SDK 2.x Legacy Changes](#ai-sdk-2x-legacy-changes)
[Removed 2.x legacy providers](#removed-2x-legacy-providers)
[Removed 2.x legacy function and tool calling](#removed-2x-legacy-function-and-tool-calling)
[Removed 2.x prompt helpers](#removed-2x-prompt-helpers)
[Removed 2.x AIStream](#removed-2x-aistream)
[Removed 2.x StreamingTextResponse](#removed-2x-streamingtextresponse)
[Removed 2.x streamToResponse](#removed-2x-streamtoresponse)
[Removed 2.x RSC Tokens streaming](#removed-2x-rsc-tokens-streaming)
[Codemod Table](#codemod-table)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)