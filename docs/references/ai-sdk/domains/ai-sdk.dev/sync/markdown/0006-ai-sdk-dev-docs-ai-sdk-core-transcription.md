AI SDK Core: Transcription
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
# [Transcription](#transcription)
Transcription is an experimental feature.
The AI SDK provides the [`transcribe`](/docs/reference/ai-sdk-core/transcribe)
function to transcribe audio using a transcription model.
```
`
import { experimental\_transcribe as transcribe } from 'ai';
import { openai } from '@ai-sdk/openai';
import { readFile } from 'fs/promises';
const transcript = await transcribe({
model: openai.transcription('whisper-1'),
audio: await readFile('audio.mp3'),
});
`
```
The `audio` property can be a `Uint8Array`, `ArrayBuffer`, `Buffer`, `string` (base64 encoded audio data), or a `URL`.
To access the generated transcript:
```
`
const text = transcript.text; // transcript text e.g. "Hello, world!"
const segments = transcript.segments; // array of segments with start and end times, if available
const language = transcript.language; // language of the transcript e.g. "en", if available
const durationInSeconds = transcript.durationInSeconds; // duration of the transcript in seconds, if available
`
```
## [Settings](#settings)
### [Provider-Specific settings](#provider-specific-settings)
Transcription models often have provider or model-specific settings which you can set using the `providerOptions` parameter.
```
`
import { experimental\_transcribe as transcribe } from 'ai';
import { openai } from '@ai-sdk/openai';
import { readFile } from 'fs/promises';
const transcript = await transcribe({
model: openai.transcription('whisper-1'),
audio: await readFile('audio.mp3'),
providerOptions: {
openai: {
timestampGranularities: ['word'],
},
},
});
`
```
### [Download Size Limits](#download-size-limits)
When `audio` is a URL, the SDK downloads the file with a default **2 GiB** size limit.
You can customize this using `createDownload`:
```
`
import { experimental\_transcribe as transcribe, createDownload } from 'ai';
import { openai } from '@ai-sdk/openai';
const transcript = await transcribe({
model: openai.transcription('whisper-1'),
audio: new URL('https://example.com/audio.mp3'),
download: createDownload({ maxBytes: 50 \* 1024 \* 1024 }), // 50 MB limit
});
`
```
You can also provide a fully custom download function:
```
`
import { experimental\_transcribe as transcribe } from 'ai';
import { openai } from '@ai-sdk/openai';
const transcript = await transcribe({
model: openai.transcription('whisper-1'),
audio: new URL('https://example.com/audio.mp3'),
download: async ({ url }) =\> {
const res = await myAuthenticatedFetch(url);
return {
data: new Uint8Array(await res.arrayBuffer()),
mediaType: res.headers.get('content-type') ?? undefined,
};
},
});
`
```
If a download exceeds the size limit, a `DownloadError` is thrown:
```
`
import { experimental\_transcribe as transcribe, DownloadError } from 'ai';
import { openai } from '@ai-sdk/openai';
try {
await transcribe({
model: openai.transcription('whisper-1'),
audio: new URL('https://example.com/audio.mp3'),
});
} catch (error) {
if (DownloadError.isInstance(error)) {
console.log('Download failed:', error.message);
}
}
`
```
### [Abort Signals and Timeouts](#abort-signals-and-timeouts)
`transcribe` accepts an optional `abortSignal` parameter of
type [`AbortSignal`](https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal)
that you can use to abort the transcription process or set a timeout.
This is particularly useful when combined with URL downloads to prevent long-running requests:
```
`
import { openai } from '@ai-sdk/openai';
import { experimental\_transcribe as transcribe } from 'ai';
const transcript = await transcribe({
model: openai.transcription('whisper-1'),
audio: new URL('https://example.com/audio.mp3'),
abortSignal: AbortSignal.timeout(5000), // Abort after 5 seconds
});
`
```
### [Custom Headers](#custom-headers)
`transcribe` accepts an optional `headers` parameter of type `Record\<string, string\>`
that you can use to add custom headers to the transcription request.
```
`
import { openai } from '@ai-sdk/openai';
import { experimental\_transcribe as transcribe } from 'ai';
import { readFile } from 'fs/promises';
const transcript = await transcribe({
model: openai.transcription('whisper-1'),
audio: await readFile('audio.mp3'),
headers: { 'X-Custom-Header': 'custom-value' },
});
`
```
### [Warnings](#warnings)
Warnings (e.g. unsupported parameters) are available on the `warnings` property.
```
`
import { openai } from '@ai-sdk/openai';
import { experimental\_transcribe as transcribe } from 'ai';
import { readFile } from 'fs/promises';
const transcript = await transcribe({
model: openai.transcription('whisper-1'),
audio: await readFile('audio.mp3'),
});
const warnings = transcript.warnings;
`
```
### [Error Handling](#error-handling)
When `transcribe` cannot generate a valid transcript, it throws a [`AI\_NoTranscriptGeneratedError`](/docs/reference/ai-sdk-errors/ai-no-transcript-generated-error).
This error can arise for any of the following reasons:
* The model failed to generate a response
* The model generated a response that could not be parsed
The error preserves the following information to help you log the issue:
* `responses`: Metadata about the transcription model responses, including timestamp, model, and headers.
* `cause`: The cause of the error. You can use this for more detailed error handling.
```
`
import {
experimental\_transcribe as transcribe,
NoTranscriptGeneratedError,
} from 'ai';
import { openai } from '@ai-sdk/openai';
import { readFile } from 'fs/promises';
try {
await transcribe({
model: openai.transcription('whisper-1'),
audio: await readFile('audio.mp3'),
});
} catch (error) {
if (NoTranscriptGeneratedError.isInstance(error)) {
console.log('NoTranscriptGeneratedError');
console.log('Cause:', error.cause);
console.log('Responses:', error.responses);
}
}
`
```
## [Transcription Models](#transcription-models)
|Provider|Model|
|[OpenAI](/providers/ai-sdk-providers/openai#transcription-models)|`whisper-1`|
|[OpenAI](/providers/ai-sdk-providers/openai#transcription-models)|`gpt-4o-transcribe`|
|[OpenAI](/providers/ai-sdk-providers/openai#transcription-models)|`gpt-4o-mini-transcribe`|
|[ElevenLabs](/providers/ai-sdk-providers/elevenlabs#transcription-models)|`scribe\_v1`|
|[ElevenLabs](/providers/ai-sdk-providers/elevenlabs#transcription-models)|`scribe\_v1\_experimental`|
|[Groq](/providers/ai-sdk-providers/groq#transcription-models)|`whisper-large-v3-turbo`|
|[Groq](/providers/ai-sdk-providers/groq#transcription-models)|`whisper-large-v3`|
|[Azure OpenAI](/providers/ai-sdk-providers/azure#transcription-models)|`whisper-1`|
|[Azure OpenAI](/providers/ai-sdk-providers/azure#transcription-models)|`gpt-4o-transcribe`|
|[Azure OpenAI](/providers/ai-sdk-providers/azure#transcription-models)|`gpt-4o-mini-transcribe`|
|[Rev.ai](/providers/ai-sdk-providers/revai#transcription-models)|`machine`|
|[Rev.ai](/providers/ai-sdk-providers/revai#transcription-models)|`low\_cost`|
|[Rev.ai](/providers/ai-sdk-providers/revai#transcription-models)|`fusion`|
|[Deepgram](/providers/ai-sdk-providers/deepgram#transcription-models)|`base` (+ variants)|
|[Deepgram](/providers/ai-sdk-providers/deepgram#transcription-models)|`enhanced` (+ variants)|
|[Deepgram](/providers/ai-sdk-providers/deepgram#transcription-models)|`nova` (+ variants)|
|[Deepgram](/providers/ai-sdk-providers/deepgram#transcription-models)|`nova-2` (+ variants)|
|[Deepgram](/providers/ai-sdk-providers/deepgram#transcription-models)|`nova-3` (+ variants)|
|[Gladia](/providers/ai-sdk-providers/gladia#transcription-models)|`default`|
|[AssemblyAI](/providers/ai-sdk-providers/assemblyai#transcription-models)|`best`|
|[AssemblyAI](/providers/ai-sdk-providers/assemblyai#transcription-models)|`nano`|
|[Fal](/providers/ai-sdk-providers/fal#transcription-models)|`whisper`|
|[Fal](/providers/ai-sdk-providers/fal#transcription-models)|`wizper`|
Above are a small subset of the transcription models supported by the AI SDK providers. For more, see the respective provider documentation.
On this page
[Transcription](#transcription)
[Settings](#settings)
[Provider-Specific settings](#provider-specific-settings)
[Download Size Limits](#download-size-limits)
[Abort Signals and Timeouts](#abort-signals-and-timeouts)
[Custom Headers](#custom-headers)
[Warnings](#warnings)
[Error Handling](#error-handling)
[Transcription Models](#transcription-models)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)