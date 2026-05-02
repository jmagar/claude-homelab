AI SDK Core: Embeddings
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
# [Embeddings](#embeddings)
Embeddings are a way to represent words, phrases, or images as vectors in a high-dimensional space.
In this space, similar words are close to each other, and the distance between words can be used to measure their similarity.
## [Embedding a Single Value](#embedding-a-single-value)
The AI SDK provides the [`embed`](/docs/reference/ai-sdk-core/embed) function to embed single values, which is useful for tasks such as finding similar words
or phrases or clustering text.
You can use it with embeddings models, e.g. `openai.embeddingModel('text-embedding-3-large')` or `mistral.embeddingModel('mistral-embed')`.
```
`
import { embed } from 'ai';
// 'embedding' is a single embedding object (number[])
const { embedding } = await embed({
model: 'openai/text-embedding-3-small',
value: 'sunny day at the beach',
});
`
```
## [Embedding Many Values](#embedding-many-values)
When loading data, e.g. when preparing a data store for retrieval-augmented generation (RAG),
it is often useful to embed many values at once (batch embedding).
The AI SDK provides the [`embedMany`](/docs/reference/ai-sdk-core/embed-many) function for this purpose.
Similar to `embed`, you can use it with embeddings models,
e.g. `openai.embeddingModel('text-embedding-3-large')` or `mistral.embeddingModel('mistral-embed')`.
```
`
import { embedMany } from 'ai';
// 'embeddings' is an array of embedding objects (number[][]).
// It is sorted in the same order as the input values.
const { embeddings } = await embedMany({
model: 'openai/text-embedding-3-small',
values: [
'sunny day at the beach',
'rainy afternoon in the city',
'snowy night in the mountains',
],
});
`
```
## [Embedding Similarity](#embedding-similarity)
After embedding values, you can calculate the similarity between them using the [`cosineSimilarity`](/docs/reference/ai-sdk-core/cosine-similarity) function.
This is useful to e.g. find similar words or phrases in a dataset.
You can also rank and filter related items based on their similarity.
```
`
import { cosineSimilarity, embedMany } from 'ai';
const { embeddings } = await embedMany({
model: 'openai/text-embedding-3-small',
values: ['sunny day at the beach', 'rainy afternoon in the city'],
});
console.log(
`cosine similarity: ${cosineSimilarity(embeddings[0], embeddings[1])}`,
);
`
```
## [Token Usage](#token-usage)
Many providers charge based on the number of tokens used to generate embeddings.
Both `embed` and `embedMany` provide token usage information in the `usage` property of the result object:
```
`
import { embed } from 'ai';
const { embedding, usage } = await embed({
model: 'openai/text-embedding-3-small',
value: 'sunny day at the beach',
});
console.log(usage); // { tokens: 10 }
`
```
## [Settings](#settings)
### [Provider Options](#provider-options)
Embedding model settings can be configured using `providerOptions` for provider-specific parameters:
```
`
import { embed } from 'ai';
const { embedding } = await embed({
model: 'openai/text-embedding-3-small',
value: 'sunny day at the beach',
providerOptions: {
openai: {
dimensions: 512, // Reduce embedding dimensions
},
},
});
`
```
### [Parallel Requests](#parallel-requests)
The `embedMany` function now supports parallel processing with configurable `maxParallelCalls` to optimize performance:
```
`
import { embedMany } from 'ai';
const { embeddings, usage } = await embedMany({
maxParallelCalls: 2, // Limit parallel requests
model: 'openai/text-embedding-3-small',
values: [
'sunny day at the beach',
'rainy afternoon in the city',
'snowy night in the mountains',
],
});
`
```
### [Retries](#retries)
Both `embed` and `embedMany` accept an optional `maxRetries` parameter of type `number`
that you can use to set the maximum number of retries for the embedding process.
It defaults to `2` retries (3 attempts in total). You can set it to `0` to disable retries.
```
`
import { embed } from 'ai';
const { embedding } = await embed({
model: 'openai/text-embedding-3-small',
value: 'sunny day at the beach',
maxRetries: 0, // Disable retries
});
`
```
### [Abort Signals and Timeouts](#abort-signals-and-timeouts)
Both `embed` and `embedMany` accept an optional `abortSignal` parameter of
type [`AbortSignal`](https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal)
that you can use to abort the embedding process or set a timeout.
```
`
import { embed } from 'ai';
const { embedding } = await embed({
model: 'openai/text-embedding-3-small',
value: 'sunny day at the beach',
abortSignal: AbortSignal.timeout(1000), // Abort after 1 second
});
`
```
### [Custom Headers](#custom-headers)
Both `embed` and `embedMany` accept an optional `headers` parameter of type `Record\<string, string\>`
that you can use to add custom headers to the embedding request.
```
`
import { embed } from 'ai';
const { embedding } = await embed({
model: 'openai/text-embedding-3-small',
value: 'sunny day at the beach',
headers: { 'X-Custom-Header': 'custom-value' },
});
`
```
## [Response Information](#response-information)
Both `embed` and `embedMany` return response information that includes the raw provider response:
```
`
import { embed } from 'ai';
const { embedding, response } = await embed({
model: 'openai/text-embedding-3-small',
value: 'sunny day at the beach',
});
console.log(response); // Raw provider response
`
```
## [Embedding Middleware](#embedding-middleware)
You can enhance embedding models, e.g. to set default values, using
`wrapEmbeddingModel` and `EmbeddingModelMiddleware`.
Here is an example that uses the built-in `defaultEmbeddingSettingsMiddleware`:
```
`
import {
defaultEmbeddingSettingsMiddleware,
embed,
wrapEmbeddingModel,
gateway,
} from 'ai';
const embeddingModelWithDefaults = wrapEmbeddingModel({
model: gateway.embeddingModel('google/gemini-embedding-001'),
middleware: defaultEmbeddingSettingsMiddleware({
settings: {
providerOptions: {
google: {
outputDimensionality: 256,
taskType: 'CLASSIFICATION',
},
},
},
}),
});
`
```
## [Embedding Providers & Models](#embedding-providers--models)
Several providers offer embedding models:
|Provider|Model|Embedding Dimensions|Multimodal|
|[OpenAI](/providers/ai-sdk-providers/openai#embedding-models)|`text-embedding-3-large`|3072||
|[OpenAI](/providers/ai-sdk-providers/openai#embedding-models)|`text-embedding-3-small`|1536||
|[OpenAI](/providers/ai-sdk-providers/openai#embedding-models)|`text-embedding-ada-002`|1536||
|[Google Generative AI](/providers/ai-sdk-providers/google-generative-ai#embedding-models)|`gemini-embedding-001`|3072||
|[Google Generative AI](/providers/ai-sdk-providers/google-generative-ai#embedding-models)|`gemini-embedding-2-preview`|3072||
|[Mistral](/providers/ai-sdk-providers/mistral#embedding-models)|`mistral-embed`|1024||
|[Cohere](/providers/ai-sdk-providers/cohere#embedding-models)|`embed-english-v3.0`|1024||
|[Cohere](/providers/ai-sdk-providers/cohere#embedding-models)|`embed-multilingual-v3.0`|1024||
|[Cohere](/providers/ai-sdk-providers/cohere#embedding-models)|`embed-english-light-v3.0`|384||
|[Cohere](/providers/ai-sdk-providers/cohere#embedding-models)|`embed-multilingual-light-v3.0`|384||
|[Cohere](/providers/ai-sdk-providers/cohere#embedding-models)|`embed-english-v2.0`|4096||
|[Cohere](/providers/ai-sdk-providers/cohere#embedding-models)|`embed-english-light-v2.0`|1024||
|[Cohere](/providers/ai-sdk-providers/cohere#embedding-models)|`embed-multilingual-v2.0`|768||
|[Amazon Bedrock](/providers/ai-sdk-providers/amazon-bedrock#embedding-models)|`amazon.titan-embed-text-v1`|1536||
|[Amazon Bedrock](/providers/ai-sdk-providers/amazon-bedrock#embedding-models)|`amazon.titan-embed-text-v2:0`|1024||
On this page
[Embeddings](#embeddings)
[Embedding a Single Value](#embedding-a-single-value)
[Embedding Many Values](#embedding-many-values)
[Embedding Similarity](#embedding-similarity)
[Token Usage](#token-usage)
[Settings](#settings)
[Provider Options](#provider-options)
[Parallel Requests](#parallel-requests)
[Retries](#retries)
[Abort Signals and Timeouts](#abort-signals-and-timeouts)
[Custom Headers](#custom-headers)
[Response Information](#response-information)
[Embedding Middleware](#embedding-middleware)
[Embedding Providers & Models](#embedding-providers--models)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)