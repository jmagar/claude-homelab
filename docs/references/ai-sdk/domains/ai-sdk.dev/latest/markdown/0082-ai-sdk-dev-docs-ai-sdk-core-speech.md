AI SDK Core: Speech
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
# [Speech](#speech)
Speech is an experimental feature.
The AI SDK provides the [`generateSpeech`](/docs/reference/ai-sdk-core/generate-speech)
function to generate speech from text using a speech model.
```
`
import { experimental\_generateSpeech as generateSpeech } from 'ai';
import { openai } from '@ai-sdk/openai';
const audio = await generateSpeech({
model: openai.speech('tts-1'),
text: 'Hello, world!',
voice: 'alloy',
});
`
```
### [Language Setting](#language-setting)
You can specify the language for speech generation (provider support varies):
```
`
import { experimental\_generateSpeech as generateSpeech } from 'ai';
import { lmnt } from '@ai-sdk/lmnt';
const audio = await generateSpeech({
model: lmnt.speech('aurora'),
text: 'Hola, mundo!',
language: 'es', // Spanish
});
`
```
To access the generated audio:
```
`
const audioData = result.audio.uint8Array; // audio data as Uint8Array
// or
const audioBase64 = result.audio.base64; // audio data as base64 string
`
```
## [Settings](#settings)
### [Provider-Specific settings](#provider-specific-settings)
You can set model-specific settings with the `providerOptions` parameter.
```
`
import { experimental\_generateSpeech as generateSpeech } from 'ai';
import { openai } from '@ai-sdk/openai';
const audio = await generateSpeech({
model: openai.speech('tts-1'),
text: 'Hello, world!',
providerOptions: {
openai: {
// ...
},
},
});
`
```
### [Abort Signals and Timeouts](#abort-signals-and-timeouts)
`generateSpeech` accepts an optional `abortSignal` parameter of
type [`AbortSignal`](https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal)
that you can use to abort the speech generation process or set a timeout.
```
`
import { openai } from '@ai-sdk/openai';
import { experimental\_generateSpeech as generateSpeech } from 'ai';
const audio = await generateSpeech({
model: openai.speech('tts-1'),
text: 'Hello, world!',
abortSignal: AbortSignal.timeout(1000), // Abort after 1 second
});
`
```
### [Custom Headers](#custom-headers)
`generateSpeech` accepts an optional `headers` parameter of type `Record\<string, string\>`
that you can use to add custom headers to the speech generation request.
```
`
import { openai } from '@ai-sdk/openai';
import { experimental\_generateSpeech as generateSpeech } from 'ai';
const audio = await generateSpeech({
model: openai.speech('tts-1'),
text: 'Hello, world!',
headers: { 'X-Custom-Header': 'custom-value' },
});
`
```
### [Warnings](#warnings)
Warnings (e.g. unsupported parameters) are available on the `warnings` property.
```
`
import { openai } from '@ai-sdk/openai';
import { experimental\_generateSpeech as generateSpeech } from 'ai';
const audio = await generateSpeech({
model: openai.speech('tts-1'),
text: 'Hello, world!',
});
const warnings = audio.warnings;
`
```
### [Error Handling](#error-handling)
When `generateSpeech` cannot generate a valid audio, it throws a [`AI\_NoSpeechGeneratedError`](/docs/reference/ai-sdk-errors/ai-no-speech-generated-error).
This error can arise for any of the following reasons:
* The model failed to generate a response
* The model generated a response that could not be parsed
The error preserves the following information to help you log the issue:
* `responses`: Metadata about the speech model responses, including timestamp, model, and headers.
* `cause`: The cause of the error. You can use this for more detailed error handling.
```
`
import {
experimental\_generateSpeech as generateSpeech,
NoSpeechGeneratedError,
} from 'ai';
import { openai } from '@ai-sdk/openai';
try {
await generateSpeech({
model: openai.speech('tts-1'),
text: 'Hello, world!',
});
} catch (error) {
if (NoSpeechGeneratedError.isInstance(error)) {
console.log('AI\_NoSpeechGeneratedError');
console.log('Cause:', error.cause);
console.log('Responses:', error.responses);
}
}
`
```
## [Speech Models](#speech-models)
|Provider|Model|
|[OpenAI](/providers/ai-sdk-providers/openai#speech-models)|`tts-1`|
|[OpenAI](/providers/ai-sdk-providers/openai#speech-models)|`tts-1-hd`|
|[OpenAI](/providers/ai-sdk-providers/openai#speech-models)|`gpt-4o-mini-tts`|
|[ElevenLabs](/providers/ai-sdk-providers/elevenlabs#speech-models)|`eleven\_v3`|
|[ElevenLabs](/providers/ai-sdk-providers/elevenlabs#speech-models)|`eleven\_multilingual\_v2`|
|[ElevenLabs](/providers/ai-sdk-providers/elevenlabs#speech-models)|`eleven\_flash\_v2\_5`|
|[ElevenLabs](/providers/ai-sdk-providers/elevenlabs#speech-models)|`eleven\_flash\_v2`|
|[ElevenLabs](/providers/ai-sdk-providers/elevenlabs#speech-models)|`eleven\_turbo\_v2\_5`|
|[ElevenLabs](/providers/ai-sdk-providers/elevenlabs#speech-models)|`eleven\_turbo\_v2`|
|[LMNT](/providers/ai-sdk-providers/lmnt#speech-models)|`aurora`|
|[LMNT](/providers/ai-sdk-providers/lmnt#speech-models)|`blizzard`|
|[Hume](/providers/ai-sdk-providers/hume#speech-models)|`default`|
Above are a small subset of the speech models supported by the AI SDK providers. For more, see the respective provider documentation.
On this page
[Speech](#speech)
[Language Setting](#language-setting)
[Settings](#settings)
[Provider-Specific settings](#provider-specific-settings)
[Abort Signals and Timeouts](#abort-signals-and-timeouts)
[Custom Headers](#custom-headers)
[Warnings](#warnings)
[Error Handling](#error-handling)
[Speech Models](#speech-models)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)