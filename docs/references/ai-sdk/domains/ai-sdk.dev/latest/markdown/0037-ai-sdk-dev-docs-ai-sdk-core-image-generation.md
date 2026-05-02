AI SDK Core: Image Generation
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
# [Image Generation](#image-generation)
The AI SDK provides the [`generateImage`](/docs/reference/ai-sdk-core/generate-image)
function to generate images based on a given prompt using an image model.
Gateway
Provider
Custom
GPT Image 1
```
`
import { generateImage } from 'ai';
const { image } = await generateImage({
model: "openai/gpt-image-1",
prompt: 'Santa Claus driving a Cadillac',
});
`
```
You can access the image data using the `base64` or `uint8Array` properties:
```
`
const base64 = image.base64; // base64 image data
const uint8Array = image.uint8Array; // Uint8Array image data
`
```
## [Settings](#settings)
### [Size and Aspect Ratio](#size-and-aspect-ratio)
Depending on the model, you can either specify the size or the aspect ratio.
##### [Size](#size)
The size is specified as a string in the format `{width}x{height}`.
Models only support a few sizes, and the supported sizes are different for each model and provider.
Gateway
Provider
Custom
GPT Image 1
```
`
import { generateImage } from 'ai';
const { image } = await generateImage({
model: "openai/gpt-image-1",
prompt: 'Santa Claus driving a Cadillac',
size: '1024x1024',
});
`
```
##### [Aspect Ratio](#aspect-ratio)
The aspect ratio is specified as a string in the format `{width}:{height}`.
Models only support a few aspect ratios, and the supported aspect ratios are different for each model and provider.
Gateway
Provider
Custom
GPT Image 1
```
`
import { generateImage } from 'ai';
const { image } = await generateImage({
model: "openai/gpt-image-1",
prompt: 'Santa Claus driving a Cadillac',
aspectRatio: '16:9',
});
`
```
### [Generating Multiple Images](#generating-multiple-images)
`generateImage` also supports generating multiple images at once:
Gateway
Provider
Custom
GPT Image 1
```
`
import { generateImage } from 'ai';
const { images } = await generateImage({
model: "openai/gpt-image-1",
prompt: 'Santa Claus driving a Cadillac',
n: 4, // number of images to generate
});
`
```
`generateImage` will automatically call the model as often as needed (in
parallel) to generate the requested number of images.
Each image model has an internal limit on how many images it can generate in a single API call. The AI SDK manages this automatically by batching requests appropriately when you request multiple images using the `n` parameter. By default, the SDK uses provider-documented limits (for example, DALL-E 3 can only generate 1 image per call, while DALL-E 2 supports up to 10).
If needed, you can override this behavior using the `maxImagesPerCall` setting when generating your image. This is particularly useful when working with new or custom models where the default batch size might not be optimal:
Gateway
Provider
Custom
GPT Image 1
```
`
const { images } = await generateImage({
model: "openai/gpt-image-1",
prompt: 'Santa Claus driving a Cadillac',
maxImagesPerCall: 5, // Override the default batch size
n: 10, // Will make 2 calls of 5 images each
});
`
```
### [Providing a Seed](#providing-a-seed)
You can provide a seed to the `generateImage` function to control the output of the image generation process.
If supported by the model, the same seed will always produce the same image.
Gateway
Provider
Custom
GPT Image 1
```
`
import { generateImage } from 'ai';
const { image } = await generateImage({
model: "openai/gpt-image-1",
prompt: 'Santa Claus driving a Cadillac',
seed: 1234567890,
});
`
```
### [Provider-specific Settings](#provider-specific-settings)
Image models often have provider- or even model-specific settings.
You can pass such settings to the `generateImage` function
using the `providerOptions` parameter. The options for the provider
(`openai` in the example below) become request body properties.
```
`
import { generateImage } from 'ai';
import { openai } from '@ai-sdk/openai';
const { image } = await generateImage({
model: openai.image('dall-e-3'),
prompt: 'Santa Claus driving a Cadillac',
size: '1024x1024',
providerOptions: {
openai: { style: 'vivid', quality: 'hd' },
},
});
`
```
### [Abort Signals and Timeouts](#abort-signals-and-timeouts)
`generateImage` accepts an optional `abortSignal` parameter of
type [`AbortSignal`](https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal)
that you can use to abort the image generation process or set a timeout.
Gateway
Provider
Custom
GPT Image 1
```
`
import { generateImage } from 'ai';
const { image } = await generateImage({
model: "openai/gpt-image-1",
prompt: 'Santa Claus driving a Cadillac',
abortSignal: AbortSignal.timeout(1000), // Abort after 1 second
});
`
```
### [Custom Headers](#custom-headers)
`generateImage` accepts an optional `headers` parameter of type `Record\<string, string\>`
that you can use to add custom headers to the image generation request.
Gateway
Provider
Custom
GPT Image 1
```
`
import { generateImage } from 'ai';
const { image } = await generateImage({
model: "openai/gpt-image-1",
prompt: 'Santa Claus driving a Cadillac',
headers: { 'X-Custom-Header': 'custom-value' },
});
`
```
### [Warnings](#warnings)
If the model returns warnings, e.g. for unsupported parameters, they will be available in the `warnings` property of the response.
Gateway
Provider
Custom
GPT Image 1
```
`
const { image, warnings } = await generateImage({
model: "openai/gpt-image-1",
prompt: 'Santa Claus driving a Cadillac',
});
`
```
### [Additional provider-specific meta data](#additional-provider-specific-meta-data)
Some providers expose additional meta data for the result overall or per image.
```
`
const prompt = 'Santa Claus driving a Cadillac';
const { image, providerMetadata } = await generateImage({
model: openai.image('dall-e-3'),
prompt,
});
const revisedPrompt = providerMetadata.openai.images[0]?.revisedPrompt;
console.log({
prompt,
revisedPrompt,
});
`
```
The outer key of the returned `providerMetadata` is the provider name. The inner values are the metadata. An `images` key is always present in the metadata and is an array with the same length as the top level `images` key.
### [Error Handling](#error-handling)
When `generateImage` cannot generate a valid image, it throws a [`AI\_NoImageGeneratedError`](/docs/reference/ai-sdk-errors/ai-no-image-generated-error).
This error occurs when the AI provider fails to generate an image. It can arise due to the following reasons:
* The model failed to generate a response
* The model generated a response that could not be parsed
The error preserves the following information to help you log the issue:
* `responses`: Metadata about the image model responses, including timestamp, model, and headers.
* `cause`: The cause of the error. You can use this for more detailed error handling
```
`
import { generateImage, NoImageGeneratedError } from 'ai';
try {
await generateImage({ model, prompt });
} catch (error) {
if (NoImageGeneratedError.isInstance(error)) {
console.log('NoImageGeneratedError');
console.log('Cause:', error.cause);
console.log('Responses:', error.responses);
}
}
`
```
## [Image Middleware](#image-middleware)
You can enhance image models, e.g. to set default values or implement logging, using
`wrapImageModel` and `ImageModelV3Middleware`.
Here is an example that sets a default size when none is provided:
Gateway
Provider
Custom
GPT Image 1
```
`
import { generateImage, wrapImageModel } from 'ai';
const model = wrapImageModel({
model: "openai/gpt-image-1",
middleware: {
specificationVersion: 'v3',
transformParams: async ({ params }) =\> ({
...params,
size: params.size ?? '1024x1024',
}),
},
});
const { image } = await generateImage({
model,
prompt: 'Santa Claus driving a Cadillac',
});
`
```
## [Generating Images with Language Models](#generating-images-with-language-models)
Some language models such as Google `gemini-2.5-flash-image` support multi-modal outputs including images.
With such models, you can access the generated images using the `files` property of the response.
```
`
import { google } from '@ai-sdk/google';
import { generateText } from 'ai';
const result = await generateText({
model: google('gemini-2.5-flash-image'),
prompt: 'Generate an image of a comic cat',
});
for (const file of result.files) {
if (file.mediaType.startsWith('image/')) {
// The file object provides multiple data formats:
// Access images as base64 string, Uint8Array binary data, or check type
// - file.base64: string (data URL format)
// - file.uint8Array: Uint8Array (binary data)
// - file.mediaType: string (e.g. "image/png")
}
}
`
```
## [Image Models](#image-models)
|Provider|Model|Support sizes (`width x height`) or aspect ratios (`width : height`)|
|[xAI Grok](/providers/ai-sdk-providers/xai#image-models)|`grok-imagine-image`|`1:1`, `16:9`, `9:16`, `4:3`, `3:4`, `3:2`, `2:3`, `2:1`, `1:2`, `19.5:9`, `9:19.5`, `20:9`, `9:20`, `auto`|
|[OpenAI](/providers/ai-sdk-providers/openai#image-models)|`gpt-image-1`|1024x1024, 1536x1024, 1024x1536|
|[OpenAI](/providers/ai-sdk-providers/openai#image-models)|`dall-e-3`|1024x1024, 1792x1024, 1024x1792|
|[OpenAI](/providers/ai-sdk-providers/openai#image-models)|`dall-e-2`|256x256, 512x512, 1024x1024|
|[Amazon Bedrock](/providers/ai-sdk-providers/amazon-bedrock#image-models)|`amazon.nova-canvas-v1:0`|320-4096 (multiples of 16), 1:4 to 4:1, max 4.2M pixels|
|[Fal](/providers/ai-sdk-providers/fal#image-models)|`fal-ai/flux/dev`|1:1, 3:4, 4:3, 9:16, 16:9, 9:21, 21:9|
|[Fal](/providers/ai-sdk-providers/fal#image-models)|`fal-ai/flux-lora`|1:1, 3:4, 4:3, 9:16, 16:9, 9:21, 21:9|
|[Fal](/providers/ai-sdk-providers/fal#image-models)|`fal-ai/fast-sdxl`|1:1, 3:4, 4:3, 9:16, 16:9, 9:21, 21:9|
|[Fal](/providers/ai-sdk-providers/fal#image-models)|`fal-ai/flux-pro/v1.1-ultra`|1:1, 3:4, 4:3, 9:16, 16:9, 9:21, 21:9|
|[Fal](/providers/ai-sdk-providers/fal#image-models)|`fal-ai/ideogram/v2`|1:1, 3:4, 4:3, 9:16, 16:9, 9:21, 21:9|
|[Fal](/providers/ai-sdk-providers/fal#image-models)|`fal-ai/recraft-v3`|1:1, 3:4, 4:3, 9:16, 16:9, 9:21, 21:9|
|[Fal](/providers/ai-sdk-providers/fal#image-models)|`fal-ai/stable-diffusion-3.5-large`|1:1, 3:4, 4:3, 9:16, 16:9, 9:21, 21:9|
|[Fal](/providers/ai-sdk-providers/fal#image-models)|`fal-ai/hyper-sdxl`|1:1, 3:4, 4:3, 9:16, 16:9, 9:21, 21:9|
|[DeepInfra](/providers/ai-sdk-providers/deepinfra#image-models)|`stabilityai/sd3.5`|1:1, 16:9, 1:9, 3:2, 2:3, 4:5, 5:4, 9:16, 9:21|
|[DeepInfra](/providers/ai-sdk-providers/deepinfra#image-models)|`black-forest-labs/FLUX-1.1-pro`|256-1440 (multiples of 32)|
|[DeepInfra](/providers/ai-sdk-providers/deepinfra#image-models)|`black-forest-labs/FLUX-1-schnell`|256-1440 (multiples of 32)|
|[DeepInfra](/providers/ai-sdk-providers/deepinfra#image-models)|`black-forest-labs/FLUX-1-dev`|256-1440 (multiples of 32)|
|[DeepInfra](/providers/ai-sdk-providers/deepinfra#image-models)|`black-forest-labs/FLUX-pro`|256-1440 (multiples of 32)|
|[DeepInfra](/providers/ai-sdk-providers/deepinfra#image-models)|`stabilityai/sd3.5-medium`|1:1, 16:9, 1:9, 3:2, 2:3, 4:5, 5:4, 9:16, 9:21|
|[DeepInfra](/providers/ai-sdk-providers/deepinfra#image-models)|`stabilityai/sdxl-turbo`|1:1, 16:9, 1:9, 3:2, 2:3, 4:5, 5:4, 9:16, 9:21|
|[Replicate](/providers/ai-sdk-providers/replicate)|`black-forest-labs/flux-schnell`|1:1, 2:3, 3:2, 4:5, 5:4, 16:9, 9:16, 9:21, 21:9|
|[Replicate](/providers/ai-sdk-providers/replicate)|`recraft-ai/recraft-v3`|1024x1024, 1365x1024, 1024x1365, 1536x1024, 1024x1536, 1820x1024, 1024x1820, 1024x2048, 2048x1024, 1434x1024, 1024x1434, 1024x1280, 1280x1024, 1024x1707, 1707x1024|
|[Google](/providers/ai-sdk-providers/google-generative-ai#image-models)|`imagen-4.0-generate-001`|1:1, 3:4, 4:3, 9:16, 16:9|
|[Google](/providers/ai-sdk-providers/google-generative-ai#image-models)|`imagen-4.0-fast-generate-001`|1:1, 3:4, 4:3, 9:16, 16:9|
|[Google](/providers/ai-sdk-providers/google-generative-ai#image-models)|`imagen-4.0-ultra-generate-001`|1:1, 3:4, 4:3, 9:16, 16:9|
|[Google Vertex](/providers/ai-sdk-providers/google-vertex#image-models)|`imagen-4.0-generate-001`|1:1, 3:4, 4:3, 9:16, 16:9|
|[Google Vertex](/providers/ai-sdk-providers/google-vertex#image-models)|`imagen-4.0-fast-generate-001`|1:1, 3:4, 4:3, 9:16, 16:9|
|[Google Vertex](/providers/ai-sdk-providers/google-vertex#image-models)|`imagen-4.0-ultra-generate-001`|1:1, 3:4, 4:3, 9:16, 16:9|
|[Google Vertex](/providers/ai-sdk-providers/google-vertex#image-models)|`imagen-3.0-fast-generate-001`|1:1, 3:4, 4:3, 9:16, 16:9|
|[Fireworks](/providers/ai-sdk-providers/fireworks#image-models)|`accounts/fireworks/models/flux-1-dev-fp8`|1:1, 2:3, 3:2, 4:5, 5:4, 16:9, 9:16, 9:21, 21:9|
|[Fireworks](/providers/ai-sdk-providers/fireworks#image-models)|`accounts/fireworks/models/flux-1-schnell-fp8`|1:1, 2:3, 3:2, 4:5, 5:4, 16:9, 9:16, 9:21, 21:9|
|[Fireworks](/providers/ai-sdk-providers/fireworks#image-models)|`accounts/fireworks/models/playground-v2-5-1024px-aesthetic`|640x1536, 768x1344, 832x1216, 896x1152, 1024x1024, 1152x896, 1216x832, 1344x768, 1536x640|
|[Fireworks](/providers/ai-sdk-providers/fireworks#image-models)|`accounts/fireworks/models/japanese-stable-diffusion-xl`|640x1536, 768x1344, 832x1216, 896x1152, 1024x1024, 1152x896, 1216x832, 1344x768, 1536x640|
|[Fireworks](/providers/ai-sdk-providers/fireworks#image-models)|`accounts/fireworks/models/playground-v2-1024px-aesthetic`|640x1536, 768x1344, 832x1216, 896x1152, 1024x1024, 1152x896, 1216x832, 1344x768, 1536x640|
|[Fireworks](/providers/ai-sdk-providers/fireworks#image-models)|`accounts/fireworks/models/SSD-1B`|640x1536, 768x1344, 832x1216, 896x1152, 1024x1024, 1152x896, 1216x832, 1344x768, 1536x640|
|[Fireworks](/providers/ai-sdk-providers/fireworks#image-models)|`accounts/fireworks/models/stable-diffusion-xl-1024-v1-0`|640x1536, 768x1344, 832x1216, 896x1152, 1024x1024, 1152x896, 1216x832, 1344x768, 1536x640|
|[Luma](/providers/ai-sdk-providers/luma#image-models)|`photon-1`|1:1, 3:4, 4:3, 9:16, 16:9, 9:21, 21:9|
|[Luma](/providers/ai-sdk-providers/luma#image-models)|`photon-flash-1`|1:1, 3:4, 4:3, 9:16, 16:9, 9:21, 21:9|
|[Together.ai](/providers/ai-sdk-providers/togetherai#image-models)|`stabilityai/stable-diffusion-xl-base-1.0`|512x512, 768x768, 1024x1024|
|[Together.ai](/providers/ai-sdk-providers/togetherai#image-models)|`black-forest-labs/FLUX.1-dev`|512x512, 768x768, 1024x1024|
|[Together.ai](/providers/ai-sdk-providers/togetherai#image-models)|`black-forest-labs/FLUX.1-dev-lora`|512x512, 768x768, 1024x1024|
|[Together.ai](/providers/ai-sdk-providers/togetherai#image-models)|`black-forest-labs/FLUX.1-schnell`|512x512, 768x768, 1024x1024|
|[Together.ai](/providers/ai-sdk-providers/togetherai#image-models)|`black-forest-labs/FLUX.1-canny`|512x512, 768x768, 1024x1024|
|[Together.ai](/providers/ai-sdk-providers/togetherai#image-models)|`black-forest-labs/FLUX.1-depth`|512x512, 768x768, 1024x1024|
|[Together.ai](/providers/ai-sdk-providers/togetherai#image-models)|`black-forest-labs/FLUX.1-redux`|512x512, 768x768, 1024x1024|
|[Together.ai](/providers/ai-sdk-providers/togetherai#image-models)|`black-forest-labs/FLUX.1.1-pro`|512x512, 768x768, 1024x1024|
|[Together.ai](/providers/ai-sdk-providers/togetherai#image-models)|`black-forest-labs/FLUX.1-pro`|512x512, 768x768, 1024x1024|
|[Together.ai](/providers/ai-sdk-providers/togetherai#image-models)|`black-forest-labs/FLUX.1-schnell-Free`|512x512, 768x768, 1024x1024|
|[Black Forest Labs](/providers/ai-sdk-providers/black-forest-labs#image-models)|`flux-kontext-pro`|From 3:7 (portrait) to 7:3 (landscape)|
|[Black Forest Labs](/providers/ai-sdk-providers/black-forest-labs#image-models)|`flux-kontext-max`|From 3:7 (portrait) to 7:3 (landscape)|
|[Black Forest Labs](/providers/ai-sdk-providers/black-forest-labs#image-models)|`flux-pro-1.1-ultra`|From 3:7 (portrait) to 7:3 (landscape)|
|[Black Forest Labs](/providers/ai-sdk-providers/black-forest-labs#image-models)|`flux-pro-1.1`|From 3:7 (portrait) to 7:3 (landscape)|
|[Black Forest Labs](/providers/ai-sdk-providers/black-forest-labs#image-models)|`flux-pro-1.0-fill`|From 3:7 (portrait) to 7:3 (landscape)|
Above are a small subset of the image models supported by the AI SDK providers. For more, see the respective provider documentation.
On this page
[Image Generation](#image-generation)
[Settings](#settings)
[Size and Aspect Ratio](#size-and-aspect-ratio)
[Size](#size)
[Aspect Ratio](#aspect-ratio)
[Generating Multiple Images](#generating-multiple-images)
[Providing a Seed](#providing-a-seed)
[Provider-specific Settings](#provider-specific-settings)
[Abort Signals and Timeouts](#abort-signals-and-timeouts)
[Custom Headers](#custom-headers)
[Warnings](#warnings)
[Additional provider-specific meta data](#additional-provider-specific-meta-data)
[Error Handling](#error-handling)
[Image Middleware](#image-middleware)
[Generating Images with Language Models](#generating-images-with-language-models)
[Image Models](#image-models)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)