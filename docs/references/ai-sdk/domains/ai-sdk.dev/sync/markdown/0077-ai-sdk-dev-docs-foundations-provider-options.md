Foundations: Provider Options
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
# [Provider Options](#provider-options)
Provider options let you pass provider-specific configuration that goes beyond the [standard settings](/docs/ai-sdk-core/settings) shared by all providers. They are set via the `providerOptions` property on functions like `generateText` and `streamText`.
```
`
const result = await generateText({
model: openai('gpt-5.2'),
prompt: 'Explain quantum entanglement.',
providerOptions: {
openai: {
reasoningEffort: 'low',
},
},
});
`
```
Provider options are namespaced by the provider name (e.g. `openai`, `anthropic`) so you can even include options for multiple providers in the same call — only the options matching the active provider are used. See [Prompts: Provider Options](/docs/foundations/prompts#provider-options) for details on applying options at the message and message-part level.
## [Common Provider Options](#common-provider-options)
The sections below cover the most frequently used provider options, focusing on reasoning and output control for OpenAI and Anthropic. For a complete reference, see the individual provider pages:
* [OpenAI provider options](/providers/ai-sdk-providers/openai)
* [Anthropic provider options](/providers/ai-sdk-providers/anthropic)
## [OpenAI](#openai)
### [Reasoning Effort](#reasoning-effort)
For reasoning models (e.g. `o3`, `o4-mini`, `gpt-5.2`), `reasoningEffort` controls how much internal reasoning the model performs before responding. Lower values are faster and cheaper; higher values produce more thorough answers.
```
`
import {
openai,
type OpenAILanguageModelResponsesOptions,
} from '@ai-sdk/openai';
import { generateText } from 'ai';
const { text, usage, providerMetadata } = await generateText({
model: openai('gpt-5.2'),
prompt: 'Invent a new holiday and describe its traditions.',
providerOptions: {
openai: {
reasoningEffort: 'low', // 'none' | 'minimal' | 'low' | 'medium' | 'high' | 'xhigh'
} satisfies OpenAILanguageModelResponsesOptions,
},
});
console.log('Reasoning tokens:', providerMetadata?.openai?.reasoningTokens);
`
```
|Value|Behavior|
|`'none'`|No reasoning (GPT-5.1 models only)|
|`'minimal'`|Bare-minimum reasoning|
|`'low'`|Fast, concise reasoning|
|`'medium'`|Balanced (default)|
|`'high'`|Thorough reasoning|
|`'xhigh'`|Maximum reasoning (GPT-5.1-Codex-Max only)|
`'none'` and `'xhigh'` are only supported on specific models. Using them with
unsupported models will result in an error.
### [Reasoning Summary](#reasoning-summary)
When working with reasoning models, you may want to see *how* the model arrived at its answer. The `reasoningSummary` option surfaces the model's thought process.
#### [Streaming](#streaming)
```
`
import {
openai,
type OpenAILanguageModelResponsesOptions,
} from '@ai-sdk/openai';
import { streamText } from 'ai';
const result = streamText({
model: openai('gpt-5.2'),
prompt: 'Tell me about the Mission burrito debate in San Francisco.',
providerOptions: {
openai: {
reasoningSummary: 'detailed', // 'auto' | 'detailed'
} satisfies OpenAILanguageModelResponsesOptions,
},
});
for await (const part of result.fullStream) {
if (part.type === 'reasoning') {
console.log(`Reasoning: ${part.textDelta}`);
} else if (part.type === 'text-delta') {
process.stdout.write(part.textDelta);
}
}
`
```
#### [Non-streaming](#non-streaming)
```
`
import {
openai,
type OpenAILanguageModelResponsesOptions,
} from '@ai-sdk/openai';
import { generateText } from 'ai';
const result = await generateText({
model: openai('gpt-5.2'),
prompt: 'Tell me about the Mission burrito debate in San Francisco.',
providerOptions: {
openai: {
reasoningSummary: 'auto',
} satisfies OpenAILanguageModelResponsesOptions,
},
});
console.log('Reasoning:', result.reasoning);
`
```
|Value|Behavior|
|`'auto'`|Condensed summary of reasoning|
|`'detailed'`|Comprehensive reasoning output|
### [Text Verbosity](#text-verbosity)
Control the length and detail of the model's text response independently of reasoning:
```
`
import {
openai,
type OpenAILanguageModelResponsesOptions,
} from '@ai-sdk/openai';
import { generateText } from 'ai';
const result = await generateText({
model: openai('gpt-5-mini'),
prompt: 'Write a poem about a boy and his first pet dog.',
providerOptions: {
openai: {
textVerbosity: 'low', // 'low' | 'medium' | 'high'
} satisfies OpenAILanguageModelResponsesOptions,
},
});
`
```
|Value|Behavior|
|`'low'`|Terse, minimal responses|
|`'medium'`|Balanced detail (default)|
|`'high'`|Verbose, comprehensive responses|
## [Anthropic](#anthropic)
### [Thinking (Extended Reasoning)](#thinking-extended-reasoning)
Anthropic's thinking feature gives Claude models a dedicated "thinking" phase before they respond. You enable it by providing a `thinking` object with a token budget.
```
`
import { anthropic, AnthropicLanguageModelOptions } from '@ai-sdk/anthropic';
import { generateText } from 'ai';
const { text, reasoning, reasoningText } = await generateText({
model: anthropic('claude-opus-4-20250514'),
prompt: 'How many people will live in the world in 2040?',
providerOptions: {
anthropic: {
thinking: { type: 'enabled', budgetTokens: 12000 },
} satisfies AnthropicLanguageModelOptions,
},
});
console.log('Reasoning:', reasoningText);
console.log('Answer:', text);
`
```
The `budgetTokens` value sets the upper limit on how many tokens the model can use for its internal reasoning. Higher budgets allow deeper reasoning but increase latency and cost.
Thinking is supported on `claude-opus-4-20250514`, `claude-sonnet-4-20250514`,
and `claude-sonnet-4-5-20250929` models.
### [Effort](#effort)
The `effort` option provides a simpler way to control reasoning depth without specifying a token budget. It affects thinking, text responses, and function calls.
```
`
import { anthropic, AnthropicLanguageModelOptions } from '@ai-sdk/anthropic';
import { generateText } from 'ai';
const { text, usage } = await generateText({
model: anthropic('claude-opus-4-20250514'),
prompt: 'How many people will live in the world in 2040?',
providerOptions: {
anthropic: {
effort: 'low', // 'low' | 'medium' | 'high'
} satisfies AnthropicLanguageModelOptions,
},
});
`
```
|Value|Behavior|
|`'low'`|Minimal reasoning, fastest responses|
|`'medium'`|Balanced reasoning|
|`'high'`|Thorough reasoning (default)|
### [Fast Mode](#fast-mode)
For `claude-opus-4-6`, the `speed` option enables approximately 2.5x faster output token speeds:
```
`
import { anthropic, AnthropicLanguageModelOptions } from '@ai-sdk/anthropic';
import { generateText } from 'ai';
const { text } = await generateText({
model: anthropic('claude-opus-4-6'),
prompt: 'Write a short poem about the sea.',
providerOptions: {
anthropic: {
speed: 'fast', // 'fast' | 'standard'
} satisfies AnthropicLanguageModelOptions,
},
});
`
```
## [Combining Options](#combining-options)
You can combine multiple provider options in a single call. For example, using both reasoning effort and reasoning summaries with OpenAI:
```
`
import {
openai,
type OpenAILanguageModelResponsesOptions,
} from '@ai-sdk/openai';
import { generateText } from 'ai';
const result = await generateText({
model: openai('gpt-5.2'),
prompt: 'What are the implications of quantum computing for cryptography?',
providerOptions: {
openai: {
reasoningEffort: 'high',
reasoningSummary: 'detailed',
} satisfies OpenAILanguageModelResponsesOptions,
},
});
`
```
Or enabling thinking with a low effort level for Anthropic:
```
`
import { anthropic, AnthropicLanguageModelOptions } from '@ai-sdk/anthropic';
import { generateText } from 'ai';
const result = await generateText({
model: anthropic('claude-opus-4-20250514'),
prompt: 'Explain the Riemann hypothesis in simple terms.',
providerOptions: {
anthropic: {
thinking: { type: 'enabled', budgetTokens: 8000 },
effort: 'medium',
} satisfies AnthropicLanguageModelOptions,
},
});
`
```
## [Using Provider Options with the AI Gateway](#using-provider-options-with-the-ai-gateway)
Provider options work the same way when using the [Vercel AI Gateway](/providers/ai-sdk-providers/ai-gateway). Use the underlying provider name (e.g. `openai`, `anthropic`) as the key — not `gateway`. The AI Gateway forwards these options to the target provider automatically.
```
`
import type { OpenAILanguageModelResponsesOptions } from '@ai-sdk/openai';
import { generateText } from 'ai';
const result = await generateText({
model: 'openai/gpt-5.2', // AI Gateway model string
prompt: 'What are the implications of quantum computing for cryptography?',
providerOptions: {
openai: {
reasoningEffort: 'high',
reasoningSummary: 'detailed',
} satisfies OpenAILanguageModelResponsesOptions,
},
});
`
```
You can also combine gateway-specific options (like routing and fallbacks) with provider-specific options in the same call:
```
`
import type { AnthropicLanguageModelOptions } from '@ai-sdk/anthropic';
import type { GatewayProviderOptions } from '@ai-sdk/gateway';
import { generateText } from 'ai';
const result = await generateText({
model: 'anthropic/claude-sonnet-4',
prompt: 'Explain quantum computing',
providerOptions: {
// Gateway-specific: control routing
gateway: {
order: ['vertex', 'anthropic'],
} satisfies GatewayProviderOptions,
// Provider-specific: enable reasoning
anthropic: {
thinking: { type: 'enabled', budgetTokens: 12000 },
} satisfies AnthropicLanguageModelOptions,
},
});
`
```
For more on gateway routing, fallbacks, and other gateway-specific options, see the [AI Gateway provider documentation](/providers/ai-sdk-providers/ai-gateway#provider-options).
## [Type Safety](#type-safety)
Each provider exports a type for its options, which you can use with `satisfies` to get autocomplete and catch typos at build time:
```
`
import { type OpenAILanguageModelResponsesOptions } from '@ai-sdk/openai';
import { type AnthropicLanguageModelOptions } from '@ai-sdk/anthropic';
`
```
For a full list of available options, see the provider-specific documentation:
* [OpenAI Provider](/providers/ai-sdk-providers/openai)
* [Anthropic Provider](/providers/ai-sdk-providers/anthropic)
On this page
[Provider Options](#provider-options)
[Common Provider Options](#common-provider-options)
[OpenAI](#openai)
[Reasoning Effort](#reasoning-effort)
[Reasoning Summary](#reasoning-summary)
[Streaming](#streaming)
[Non-streaming](#non-streaming)
[Text Verbosity](#text-verbosity)
[Anthropic](#anthropic)
[Thinking (Extended Reasoning)](#thinking-extended-reasoning)
[Effort](#effort)
[Fast Mode](#fast-mode)
[Combining Options](#combining-options)
[Using Provider Options with the AI Gateway](#using-provider-options-with-the-ai-gateway)
[Type Safety](#type-safety)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)