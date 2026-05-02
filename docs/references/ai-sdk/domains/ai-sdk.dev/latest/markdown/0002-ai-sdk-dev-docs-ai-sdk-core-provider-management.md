AI SDK Core: Provider & Model Management
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
# [Provider & Model Management](#provider--model-management)
When you work with multiple providers and models, it is often desirable to manage them in a central place
and access the models through simple string ids.
The AI SDK offers [custom providers](/docs/reference/ai-sdk-core/custom-provider) and
a [provider registry](/docs/reference/ai-sdk-core/provider-registry) for this purpose:
* With **custom providers**, you can pre-configure model settings, provide model name aliases,
and limit the available models.
* The **provider registry** lets you mix multiple providers and access them through simple string ids.
You can mix and match custom providers, the provider registry, and [middleware](/docs/ai-sdk-core/middleware) in your application.
## [Custom Providers](#custom-providers)
You can create a [custom provider](/docs/reference/ai-sdk-core/custom-provider) using `customProvider`.
### [Example: custom model settings](#example-custom-model-settings)
You might want to override the default model settings for a provider or provide model name aliases
with pre-configured settings.
```
`
import {
gateway,
customProvider,
defaultSettingsMiddleware,
wrapLanguageModel,
} from 'ai';
// custom provider with different provider options:
export const openai = customProvider({
languageModels: {
// replacement model with custom provider options:
'gpt-5.1': wrapLanguageModel({
model: gateway('openai/gpt-5.1'),
middleware: defaultSettingsMiddleware({
settings: {
providerOptions: {
openai: {
reasoningEffort: 'high',
},
},
},
}),
}),
// alias model with custom provider options:
'gpt-5.1-high-reasoning': wrapLanguageModel({
model: gateway('openai/gpt-5.1'),
middleware: defaultSettingsMiddleware({
settings: {
providerOptions: {
openai: {
reasoningEffort: 'high',
},
},
},
}),
}),
},
fallbackProvider: gateway,
});
`
```
### [Example: model name alias](#example-model-name-alias)
You can also provide model name aliases, so you can update the model version in one place in the future:
```
`
import { customProvider, gateway } from 'ai';
// custom provider with alias names:
export const anthropic = customProvider({
languageModels: {
opus: gateway('anthropic/claude-opus-4.1'),
sonnet: gateway('anthropic/claude-sonnet-4.5'),
haiku: gateway('anthropic/claude-haiku-4.5'),
},
fallbackProvider: gateway,
});
`
```
### [Example: limit available models](#example-limit-available-models)
You can limit the available models in the system, even if you have multiple providers.
```
`
import {
customProvider,
defaultSettingsMiddleware,
wrapLanguageModel,
gateway,
} from 'ai';
export const myProvider = customProvider({
languageModels: {
'text-medium': gateway('anthropic/claude-3-5-sonnet-20240620'),
'text-small': gateway('openai/gpt-5-mini'),
'reasoning-medium': wrapLanguageModel({
model: gateway('openai/gpt-5.1'),
middleware: defaultSettingsMiddleware({
settings: {
providerOptions: {
openai: {
reasoningEffort: 'high',
},
},
},
}),
}),
'reasoning-fast': wrapLanguageModel({
model: gateway('openai/gpt-5.1'),
middleware: defaultSettingsMiddleware({
settings: {
providerOptions: {
openai: {
reasoningEffort: 'low',
},
},
},
}),
}),
},
embeddingModels: {
embedding: gateway.embeddingModel('openai/text-embedding-3-small'),
},
// no fallback provider
});
`
```
## [Provider Registry](#provider-registry)
You can create a [provider registry](/docs/reference/ai-sdk-core/provider-registry) with multiple providers and models using `createProviderRegistry`.
### [Setup](#setup)
registry.ts
```
`
import { anthropic } from '@ai-sdk/anthropic';
import { openai } from '@ai-sdk/openai';
import { createProviderRegistry, gateway } from 'ai';
export const registry = createProviderRegistry({
// register provider with prefix and default setup using gateway:
gateway,
// register provider with prefix and direct provider import:
anthropic,
openai,
});
`
```
### [Setup with Custom Separator](#setup-with-custom-separator)
By default, the registry uses `:` as the separator between provider and model IDs. You can customize this separator:
registry.ts
```
`
import { anthropic } from '@ai-sdk/anthropic';
import { openai } from '@ai-sdk/openai';
import { createProviderRegistry, gateway } from 'ai';
export const customSeparatorRegistry = createProviderRegistry(
{
gateway,
anthropic,
openai,
},
{ separator: ' \> ' },
);
`
```
### [Example: Use language models](#example-use-language-models)
You can access language models by using the `languageModel` method on the registry.
The provider id will become the prefix of the model id: `providerId:modelId`.
```
`
import { generateText } from 'ai';
import { registry } from './registry';
const { text } = await generateText({
model: registry.languageModel('openai:gpt-5.1'), // default separator
// or with custom separator:
// model: customSeparatorRegistry.languageModel('openai \> gpt-5.1'),
prompt: 'Invent a new holiday and describe its traditions.',
});
`
```
### [Example: Use text embedding models](#example-use-text-embedding-models)
You can access text embedding models by using the `.embeddingModel` method on the registry.
The provider id will become the prefix of the model id: `providerId:modelId`.
```
`
import { embed } from 'ai';
import { registry } from './registry';
const { embedding } = await embed({
model: registry.embeddingModel('openai:text-embedding-3-small'),
value: 'sunny day at the beach',
});
`
```
### [Example: Use image models](#example-use-image-models)
You can access image models by using the `imageModel` method on the registry.
The provider id will become the prefix of the model id: `providerId:modelId`.
```
`
import { generateImage } from 'ai';
import { registry } from './registry';
const { image } = await generateImage({
model: registry.imageModel('openai:dall-e-3'),
prompt: 'A beautiful sunset over a calm ocean',
});
`
```
## [Combining Custom Providers, Provider Registry, and Middleware](#combining-custom-providers-provider-registry-and-middleware)
The central idea of provider management is to set up a file that contains all the providers and models you want to use.
You may want to pre-configure model settings, provide model name aliases, limit the available models, and more.
Here is an example that implements the following concepts:
* pass through gateway with a namespace prefix (here: `gateway \> \*`)
* pass through a full provider with a namespace prefix (here: `xai \> \*`)
* setup an OpenAI-compatible provider with custom api key and base URL (here: `custom \> \*`)
* setup model name aliases (here: `anthropic \> fast`, `anthropic \> writing`, `anthropic \> reasoning`)
* pre-configure model settings (here: `anthropic \> reasoning`)
* validate the provider-specific options (here: `AnthropicLanguageModelOptions`)
* use a fallback provider (here: `anthropic \> \*`)
* limit a provider to certain models without a fallback (here: `groq \> gemma2-9b-it`, `groq \> qwen-qwq-32b`)
* define a custom separator for the provider registry (here: `\>`)
```
`
import { anthropic, AnthropicLanguageModelOptions } from '@ai-sdk/anthropic';
import { createOpenAICompatible } from '@ai-sdk/openai-compatible';
import { xai } from '@ai-sdk/xai';
import { groq } from '@ai-sdk/groq';
import {
createProviderRegistry,
customProvider,
defaultSettingsMiddleware,
gateway,
wrapLanguageModel,
} from 'ai';
export const registry = createProviderRegistry(
{
// pass through gateway with a namespace prefix
gateway,
// pass through full providers with namespace prefixes
xai,
// access an OpenAI-compatible provider with custom setup
custom: createOpenAICompatible({
name: 'provider-name',
apiKey: process.env.CUSTOM\_API\_KEY,
baseURL: 'https://api.custom.com/v1',
}),
// setup model name aliases
anthropic: customProvider({
languageModels: {
fast: anthropic('claude-haiku-4-5'),
// simple model
writing: anthropic('claude-sonnet-4-5'),
// extended reasoning model configuration:
reasoning: wrapLanguageModel({
model: anthropic('claude-sonnet-4-5'),
middleware: defaultSettingsMiddleware({
settings: {
maxOutputTokens: 100000, // example default setting
providerOptions: {
anthropic: {
thinking: {
type: 'enabled',
budgetTokens: 32000,
},
} satisfies AnthropicLanguageModelOptions,
},
},
}),
}),
},
fallbackProvider: anthropic,
}),
// limit a provider to certain models without a fallback
groq: customProvider({
languageModels: {
'gemma2-9b-it': groq('gemma2-9b-it'),
'qwen-qwq-32b': groq('qwen-qwq-32b'),
},
}),
},
{ separator: ' \> ' },
);
// usage:
const model = registry.languageModel('anthropic \> reasoning');
`
```
## [Global Provider Configuration](#global-provider-configuration)
The AI SDK 5 includes a global provider feature that allows you to specify a model using just a plain model ID string:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { streamText } from 'ai';
const result = await streamText({
model: "anthropic/claude-sonnet-4.5", // Uses the global provider (defaults to gateway)
prompt: 'Invent a new holiday and describe its traditions.',
});
`
```
By default, the global provider is set to the Vercel AI Gateway.
### [Customizing the Global Provider](#customizing-the-global-provider)
You can set your own preferred global provider:
setup.ts
```
`
import { openai } from '@ai-sdk/openai';
// Initialize once during startup:
globalThis.AI\_SDK\_DEFAULT\_PROVIDER = openai;
`
```
app.ts
```
`
import { streamText } from 'ai';
const result = await streamText({
model: 'gpt-5.1', // Uses OpenAI provider without prefix
prompt: 'Invent a new holiday and describe its traditions.',
});
`
```
This simplifies provider usage and makes it easier to switch between providers without changing your model references throughout your codebase.
On this page
[Provider & Model Management](#provider--model-management)
[Custom Providers](#custom-providers)
[Example: custom model settings](#example-custom-model-settings)
[Example: model name alias](#example-model-name-alias)
[Example: limit available models](#example-limit-available-models)
[Provider Registry](#provider-registry)
[Setup](#setup)
[Setup with Custom Separator](#setup-with-custom-separator)
[Example: Use language models](#example-use-language-models)
[Example: Use text embedding models](#example-use-text-embedding-models)
[Example: Use image models](#example-use-image-models)
[Combining Custom Providers, Provider Registry, and Middleware](#combining-custom-providers-provider-registry-and-middleware)
[Global Provider Configuration](#global-provider-configuration)
[Customizing the Global Provider](#customizing-the-global-provider)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)