AI SDK Core: Reranking
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
# [Reranking](#reranking)
Reranking is a technique used to improve search relevance by reordering a set of documents based on their relevance to a query.
Unlike embedding-based similarity search, reranking models are specifically trained to understand the relationship between queries and documents,
often producing more accurate relevance scores.
## [Reranking Documents](#reranking-documents)
The AI SDK provides the [`rerank`](/docs/reference/ai-sdk-core/rerank) function to rerank documents based on their relevance to a query.
You can use it with reranking models, e.g. `cohere.reranking('rerank-v3.5')` or `bedrock.reranking('cohere.rerank-v3-5:0')`.
```
`
import { rerank } from 'ai';
import { cohere } from '@ai-sdk/cohere';
const documents = [
'sunny day at the beach',
'rainy afternoon in the city',
'snowy night in the mountains',
];
const { ranking } = await rerank({
model: cohere.reranking('rerank-v3.5'),
documents,
query: 'talk about rain',
topN: 2, // Return top 2 most relevant documents
});
console.log(ranking);
// [
// { originalIndex: 1, score: 0.9, document: 'rainy afternoon in the city' },
// { originalIndex: 0, score: 0.3, document: 'sunny day at the beach' }
// ]
`
```
## [Working with Object Documents](#working-with-object-documents)
Reranking also supports structured documents (JSON objects), making it ideal for searching through databases, emails, or other structured content:
```
`
import { rerank } from 'ai';
import { cohere } from '@ai-sdk/cohere';
const documents = [
{
from: 'Paul Doe',
subject: 'Follow-up',
text: 'We are happy to give you a discount of 20% on your next order.',
},
{
from: 'John McGill',
subject: 'Missing Info',
text: 'Sorry, but here is the pricing information from Oracle: $5000/month',
},
];
const { ranking, rerankedDocuments } = await rerank({
model: cohere.reranking('rerank-v3.5'),
documents,
query: 'Which pricing did we get from Oracle?',
topN: 1,
});
console.log(rerankedDocuments[0]);
// { from: 'John McGill', subject: 'Missing Info', text: '...' }
`
```
## [Understanding the Results](#understanding-the-results)
The `rerank` function returns a comprehensive result object:
```
`
import { cohere } from '@ai-sdk/cohere';
import { rerank } from 'ai';
const { ranking, rerankedDocuments, originalDocuments } = await rerank({
model: cohere.reranking('rerank-v3.5'),
documents: ['sunny day at the beach', 'rainy afternoon in the city'],
query: 'talk about rain',
});
// ranking: sorted array of { originalIndex, score, document }
// rerankedDocuments: documents sorted by relevance (convenience property)
// originalDocuments: original documents array
`
```
Each item in the `ranking` array contains:
* `originalIndex`: Position in the original documents array
* `score`: Relevance score (typically 0-1, where higher is more relevant)
* `document`: The original document
## [Settings](#settings)
### [Top-N Results](#top-n-results)
Use `topN` to limit the number of results returned. This is useful for retrieving only the most relevant documents:
```
`
import { cohere } from '@ai-sdk/cohere';
import { rerank } from 'ai';
const { ranking } = await rerank({
model: cohere.reranking('rerank-v3.5'),
documents: ['doc1', 'doc2', 'doc3', 'doc4', 'doc5'],
query: 'relevant information',
topN: 3, // Return only top 3 most relevant documents
});
`
```
### [Provider Options](#provider-options)
Reranking model settings can be configured using `providerOptions` for provider-specific parameters:
```
`
import { cohere } from '@ai-sdk/cohere';
import { rerank } from 'ai';
const { ranking } = await rerank({
model: cohere.reranking('rerank-v3.5'),
documents: ['sunny day at the beach', 'rainy afternoon in the city'],
query: 'talk about rain',
providerOptions: {
cohere: {
maxTokensPerDoc: 1000, // Limit tokens per document
},
},
});
`
```
### [Retries](#retries)
The `rerank` function accepts an optional `maxRetries` parameter of type `number`
that you can use to set the maximum number of retries for the reranking process.
It defaults to `2` retries (3 attempts in total). You can set it to `0` to disable retries.
```
`
import { cohere } from '@ai-sdk/cohere';
import { rerank } from 'ai';
const { ranking } = await rerank({
model: cohere.reranking('rerank-v3.5'),
documents: ['sunny day at the beach', 'rainy afternoon in the city'],
query: 'talk about rain',
maxRetries: 0, // Disable retries
});
`
```
### [Abort Signals and Timeouts](#abort-signals-and-timeouts)
The `rerank` function accepts an optional `abortSignal` parameter of
type [`AbortSignal`](https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal)
that you can use to abort the reranking process or set a timeout.
```
`
import { cohere } from '@ai-sdk/cohere';
import { rerank } from 'ai';
const { ranking } = await rerank({
model: cohere.reranking('rerank-v3.5'),
documents: ['sunny day at the beach', 'rainy afternoon in the city'],
query: 'talk about rain',
abortSignal: AbortSignal.timeout(5000), // Abort after 5 seconds
});
`
```
### [Custom Headers](#custom-headers)
The `rerank` function accepts an optional `headers` parameter of type `Record\<string, string\>`
that you can use to add custom headers to the reranking request.
```
`
import { cohere } from '@ai-sdk/cohere';
import { rerank } from 'ai';
const { ranking } = await rerank({
model: cohere.reranking('rerank-v3.5'),
documents: ['sunny day at the beach', 'rainy afternoon in the city'],
query: 'talk about rain',
headers: { 'X-Custom-Header': 'custom-value' },
});
`
```
## [Response Information](#response-information)
The `rerank` function returns response information that includes the raw provider response:
```
`
import { cohere } from '@ai-sdk/cohere';
import { rerank } from 'ai';
const { ranking, response } = await rerank({
model: cohere.reranking('rerank-v3.5'),
documents: ['sunny day at the beach', 'rainy afternoon in the city'],
query: 'talk about rain',
});
console.log(response); // { id, timestamp, modelId, headers, body }
`
```
## [Reranking Providers & Models](#reranking-providers--models)
Several providers offer reranking models:
|Provider|Model|
|[Cohere](/providers/ai-sdk-providers/cohere#reranking-models)|`rerank-v3.5`|
|[Cohere](/providers/ai-sdk-providers/cohere#reranking-models)|`rerank-english-v3.0`|
|[Cohere](/providers/ai-sdk-providers/cohere#reranking-models)|`rerank-multilingual-v3.0`|
|[Amazon Bedrock](/providers/ai-sdk-providers/amazon-bedrock#reranking-models)|`amazon.rerank-v1:0`|
|[Amazon Bedrock](/providers/ai-sdk-providers/amazon-bedrock#reranking-models)|`cohere.rerank-v3-5:0`|
|[Together.ai](/providers/ai-sdk-providers/togetherai#reranking-models)|`Salesforce/Llama-Rank-v1`|
|[Together.ai](/providers/ai-sdk-providers/togetherai#reranking-models)|`mixedbread-ai/Mxbai-Rerank-Large-V2`|
On this page
[Reranking](#reranking)
[Reranking Documents](#reranking-documents)
[Working with Object Documents](#working-with-object-documents)
[Understanding the Results](#understanding-the-results)
[Settings](#settings)
[Top-N Results](#top-n-results)
[Provider Options](#provider-options)
[Retries](#retries)
[Abort Signals and Timeouts](#abort-signals-and-timeouts)
[Custom Headers](#custom-headers)
[Response Information](#response-information)
[Reranking Providers & Models](#reranking-providers--models)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)