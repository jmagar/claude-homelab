AI SDK Core: Video Generation
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
# [Video Generation](#video-generation)
Video generation is an experimental feature. The API may change in future
versions.
The AI SDK provides the [`experimental\_generateVideo`](/docs/reference/ai-sdk-core/generate-video)
function to generate videos based on a given prompt using a video model.
Gateway
Provider
Custom
Veo 3.1
```
`
import { experimental\_generateVideo as generateVideo } from 'ai';
const { video } = await generateVideo({
model: "google/veo-3.1-generate-001",
prompt: 'A cat walking on a treadmill',
});
`
```
You can access the video data using the `base64` or `uint8Array` properties:
```
`
const base64 = video.base64; // base64 video data
const uint8Array = video.uint8Array; // Uint8Array video data
`
```
## [Settings](#settings)
### [Aspect Ratio](#aspect-ratio)
The aspect ratio is specified as a string in the format `{width}:{height}`.
Models only support a few aspect ratios, and the supported aspect ratios are different for each model and provider.
Gateway
Provider
Custom
Veo 3.1
```
`
import { experimental\_generateVideo as generateVideo } from 'ai';
const { video } = await generateVideo({
model: "google/veo-3.1-generate-001",
prompt: 'A cat walking on a treadmill',
aspectRatio: '16:9',
});
`
```
### [Resolution](#resolution)
The resolution is specified as a string in the format `{width}x{height}`.
Models only support specific resolutions, and the supported resolutions are different for each model and provider.
Gateway
Provider
Custom
Veo 3.1
```
`
import { experimental\_generateVideo as generateVideo } from 'ai';
const { video } = await generateVideo({
model: "google/veo-3.1-generate-001",
prompt: 'A serene mountain landscape at sunset',
resolution: '1280x720',
});
`
```
### [Duration](#duration)
Some video models support specifying the duration of the generated video in seconds.
Gateway
Provider
Custom
Veo 3.1
```
`
import { experimental\_generateVideo as generateVideo } from 'ai';
const { video } = await generateVideo({
model: "google/veo-3.1-generate-001",
prompt: 'A timelapse of clouds moving across the sky',
duration: 5,
});
`
```
### [Frames Per Second (FPS)](#frames-per-second-fps)
Some video models allow you to specify the frames per second for the generated video.
Gateway
Provider
Custom
Veo 3.1
```
`
import { experimental\_generateVideo as generateVideo } from 'ai';
const { video } = await generateVideo({
model: "google/veo-3.1-generate-001",
prompt: 'A hummingbird in slow motion',
fps: 24,
});
`
```
### [Generating Multiple Videos](#generating-multiple-videos)
`experimental\_generateVideo` supports generating multiple videos at once:
Gateway
Provider
Custom
Veo 3.1
```
`
import { experimental\_generateVideo as generateVideo } from 'ai';
const { videos } = await generateVideo({
model: "google/veo-3.1-generate-001",
prompt: 'A rocket launching into space',
n: 3, // number of videos to generate
});
`
```
`experimental\_generateVideo` will automatically call the model as often as
needed (in parallel) to generate the requested number of videos.
Each video model has an internal limit on how many videos it can generate in a single API call. The AI SDK manages this automatically by batching requests appropriately when you request multiple videos using the `n` parameter. Most video models only support generating 1 video per call due to computational cost.
If needed, you can override this behavior using the `maxVideosPerCall` setting:
Gateway
Provider
Custom
Veo 3.1
```
`
const { videos } = await generateVideo({
model: "google/veo-3.1-generate-001",
prompt: 'A rocket launching into space',
maxVideosPerCall: 2, // Override the default batch size
n: 4, // Will make 2 calls of 2 videos each
});
`
```
### [Image-to-Video Generation](#image-to-video-generation)
Some video models support generating videos from an input image. You can provide an image using the prompt object:
Gateway
Provider
Custom
Veo 3.1
```
`
import { experimental\_generateVideo as generateVideo } from 'ai';
const { video } = await generateVideo({
model: "google/veo-3.1-generate-001",
prompt: {
image: 'https://example.com/my-image.png',
text: 'Animate this image with gentle motion',
},
});
`
```
You can also provide the image as a base64-encoded string or `Uint8Array`:
Gateway
Provider
Custom
Veo 3.1
```
`
const { video } = await generateVideo({
model: "google/veo-3.1-generate-001",
prompt: {
image: imageBase64String, // or imageUint8Array
text: 'Animate this image',
},
});
`
```
### [Providing a Seed](#providing-a-seed)
You can provide a seed to the `experimental\_generateVideo` function to control the output of the video generation process.
If supported by the model, the same seed will always produce the same video.
Gateway
Provider
Custom
Veo 3.1
```
`
import { experimental\_generateVideo as generateVideo } from 'ai';
const { video } = await generateVideo({
model: "google/veo-3.1-generate-001",
prompt: 'A cat walking on a treadmill',
seed: 1234567890,
});
`
```
### [Provider-specific Settings](#provider-specific-settings)
Video models often have provider- or even model-specific settings.
You can pass such settings to the `experimental\_generateVideo` function
using the `providerOptions` parameter. The options for the provider
become request body properties.
```
`
import { experimental\_generateVideo as generateVideo } from 'ai';
import { fal } from '@ai-sdk/fal';
const { video } = await generateVideo({
model: fal.video('luma-dream-machine/ray-2'),
prompt: 'A cat walking on a treadmill',
aspectRatio: '16:9',
providerOptions: {
fal: { loop: true, motionStrength: 0.8 },
},
});
`
```
### [Abort Signals and Timeouts](#abort-signals-and-timeouts)
`experimental\_generateVideo` accepts an optional `abortSignal` parameter of
type [`AbortSignal`](https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal)
that you can use to abort the video generation process or set a timeout.
Gateway
Provider
Custom
Veo 3.1
```
`
import { experimental\_generateVideo as generateVideo } from 'ai';
const { video } = await generateVideo({
model: "google/veo-3.1-generate-001",
prompt: 'A cat walking on a treadmill',
abortSignal: AbortSignal.timeout(60000), // Abort after 60 seconds
});
`
```
Video generation typically takes longer than image generation. Consider using
longer timeouts (60 seconds or more) depending on the model and video length.
### [Polling Timeout](#polling-timeout)
Video generation is an asynchronous process that can take several minutes to complete. Most providers use a polling mechanism where the SDK periodically checks if the video is ready. The default polling timeout is typically 5 minutes, which may not be sufficient for longer videos or certain models.
You can configure the polling timeout using provider-specific options. Each provider exports a type for its options that you can use with `satisfies` for type safety:
```
`
import { experimental\_generateVideo as generateVideo } from 'ai';
import { fal, type FalVideoModelOptions } from '@ai-sdk/fal';
const { video } = await generateVideo({
model: fal.video('luma-dream-machine/ray-2'),
prompt: 'A cinematic timelapse of a city from dawn to dusk',
duration: 10,
providerOptions: {
fal: {
pollTimeoutMs: 600000, // 10 minutes
} satisfies FalVideoModelOptions,
},
});
`
```
For production use, we recommend setting `pollTimeoutMs` to at least 10
minutes (600000ms) to account for varying generation times across different
models and video lengths.
### [Custom Headers](#custom-headers)
`experimental\_generateVideo` accepts an optional `headers` parameter of type `Record\<string, string\>`
that you can use to add custom headers to the video generation request.
Gateway
Provider
Custom
Veo 3.1
```
`
import { experimental\_generateVideo as generateVideo } from 'ai';
const { video } = await generateVideo({
model: "google/veo-3.1-generate-001",
prompt: 'A cat walking on a treadmill',
headers: { 'X-Custom-Header': 'custom-value' },
});
`
```
### [Warnings](#warnings)
If the model returns warnings, e.g. for unsupported parameters, they will be available in the `warnings` property of the response.
Gateway
Provider
Custom
Veo 3.1
```
`
const { video, warnings } = await generateVideo({
model: "google/veo-3.1-generate-001",
prompt: 'A cat walking on a treadmill',
});
`
```
### [Additional Provider-specific Metadata](#additional-provider-specific-metadata)
Some providers expose additional metadata for the result overall or per video.
```
`
const prompt = 'A cat walking on a treadmill';
const { video, providerMetadata } = await generateVideo({
model: fal.video('luma-dream-machine/ray-2'),
prompt,
});
// Access provider-specific metadata
const videoMetadata = providerMetadata.fal?.videos[0];
console.log({
duration: videoMetadata?.duration,
fps: videoMetadata?.fps,
width: videoMetadata?.width,
height: videoMetadata?.height,
});
`
```
The outer key of the returned `providerMetadata` is the provider name. The inner values are the metadata. A `videos` key is typically present in the metadata and is an array with the same length as the top level `videos` key.
When generating multiple videos with `n \> 1`, you can also access per-call metadata through the `responses` array:
Gateway
Provider
Custom
Veo 3.1
```
`
const { videos, responses } = await generateVideo({
model: "google/veo-3.1-generate-001",
prompt: 'A rocket launching into space',
n: 5, // May require multiple API calls
});
// Access metadata from each individual API call
for (const response of responses) {
console.log({
timestamp: response.timestamp,
modelId: response.modelId,
// Per-call provider metadata (lossless)
providerMetadata: response.providerMetadata,
});
}
`
```
### [Error Handling](#error-handling)
When `experimental\_generateVideo` cannot generate a valid video, it throws a [`AI\_NoVideoGeneratedError`](/docs/reference/ai-sdk-errors/ai-no-video-generated-error).
This error occurs when the AI provider fails to generate a video. It can arise due to the following reasons:
* The model failed to generate a response
* The model generated a response that could not be parsed
The error preserves the following information to help you log the issue:
* `responses`: Metadata about the video model responses, including timestamp, model, and headers.
* `cause`: The cause of the error. You can use this for more detailed error handling
```
`
import {
experimental\_generateVideo as generateVideo,
NoVideoGeneratedError,
} from 'ai';
try {
await generateVideo({ model, prompt });
} catch (error) {
if (NoVideoGeneratedError.isInstance(error)) {
console.log('NoVideoGeneratedError');
console.log('Cause:', error.cause);
console.log('Responses:', error.responses);
}
}
`
```
## [Video Models](#video-models)
|Provider|Model|Features|
|[FAL](/providers/ai-sdk-providers/fal#video-models)|`luma-dream-machine/ray-2`|Text-to-video, image-to-video|
|[FAL](/providers/ai-sdk-providers/fal#video-models)|`minimax-video`|Text-to-video|
|[Google](/providers/ai-sdk-providers/google-generative-ai#video-models)|`veo-2.0-generate-001`|Text-to-video, up to 4 videos per call|
|[Google Vertex](/providers/ai-sdk-providers/google-vertex#video-models)|`veo-3.1-generate-001`|Text-to-video, audio generation|
|[Google Vertex](/providers/ai-sdk-providers/google-vertex#video-models)|`veo-3.1-fast-generate-001`|Text-to-video, audio generation|
|[Google Vertex](/providers/ai-sdk-providers/google-vertex#video-models)|`veo-3.0-generate-001`|Text-to-video, audio generation|
|[Google Vertex](/providers/ai-sdk-providers/google-vertex#video-models)|`veo-3.0-fast-generate-001`|Text-to-video, audio generation|
|[Google Vertex](/providers/ai-sdk-providers/google-vertex#video-models)|`veo-2.0-generate-001`|Text-to-video, up to 4 videos per call|
|[Kling AI](/providers/ai-sdk-providers/klingai#video-models)|`kling-v2.6-t2v`|Text-to-video|
|[Kling AI](/providers/ai-sdk-providers/klingai#video-models)|`kling-v2.6-i2v`|Image-to-video|
|[Kling AI](/providers/ai-sdk-providers/klingai#video-models)|`kling-v2.6-motion-control`|Motion control|
|[Replicate](/providers/ai-sdk-providers/replicate#video-models)|`minimax/video-01`|Text-to-video|
|[xAI](/providers/ai-sdk-providers/xai#video-models)|`grok-imagine-video`|Text-to-video, image-to-video, editing, extension, R2V|
Above are a small subset of the video models supported by the AI SDK providers. For more, see the respective provider documentation.
On this page
[Video Generation](#video-generation)
[Settings](#settings)
[Aspect Ratio](#aspect-ratio)
[Resolution](#resolution)
[Duration](#duration)
[Frames Per Second (FPS)](#frames-per-second-fps)
[Generating Multiple Videos](#generating-multiple-videos)
[Image-to-Video Generation](#image-to-video-generation)
[Providing a Seed](#providing-a-seed)
[Provider-specific Settings](#provider-specific-settings)
[Abort Signals and Timeouts](#abort-signals-and-timeouts)
[Polling Timeout](#polling-timeout)
[Custom Headers](#custom-headers)
[Warnings](#warnings)
[Additional Provider-specific Metadata](#additional-provider-specific-metadata)
[Error Handling](#error-handling)
[Video Models](#video-models)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)