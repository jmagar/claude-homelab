AI SDK Core: Language Model Middleware
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
# [Language Model Middleware](#language-model-middleware)
Language model middleware is a way to enhance the behavior of language models
by intercepting and modifying the calls to the language model.
It can be used to add features like guardrails, RAG, caching, and logging
in a language model agnostic way. Such middleware can be developed and
distributed independently from the language models that they are applied to.
## [Using Language Model Middleware](#using-language-model-middleware)
You can use language model middleware with the `wrapLanguageModel` function.
It takes a language model and a language model middleware and returns a new
language model that incorporates the middleware.
```
`
import { wrapLanguageModel, streamText } from 'ai';
const wrappedLanguageModel = wrapLanguageModel({
model: yourModel,
middleware: yourLanguageModelMiddleware,
});
`
```
The wrapped language model can be used just like any other language model, e.g. in `streamText`:
```
`
const result = streamText({
model: wrappedLanguageModel,
prompt: 'What cities are in the United States?',
});
`
```
## [Multiple middlewares](#multiple-middlewares)
You can provide multiple middlewares to the `wrapLanguageModel` function.
The middlewares will be applied in the order they are provided.
```
`
const wrappedLanguageModel = wrapLanguageModel({
model: yourModel,
middleware: [firstMiddleware, secondMiddleware],
});
// applied as: firstMiddleware(secondMiddleware(yourModel))
`
```
## [Built-in Middleware](#built-in-middleware)
The AI SDK comes with several built-in middlewares that you can use to configure language models:
* `extractReasoningMiddleware`: Extracts reasoning information from the generated text and exposes it as a `reasoning` property on the result.
* `extractJsonMiddleware`: Extracts JSON from text content by stripping markdown code fences. Useful when using `Output.object()` with models that wrap JSON responses in code blocks.
* `simulateStreamingMiddleware`: Simulates streaming behavior with responses from non-streaming language models.
* `defaultSettingsMiddleware`: Applies default settings to a language model.
* `addToolInputExamplesMiddleware`: Adds tool input examples to tool descriptions for providers that don't natively support the `inputExamples` property.
### [Extract Reasoning](#extract-reasoning)
Some providers and models expose reasoning information in the generated text using special tags,
e.g. \<think\> and \</think\>.
The `extractReasoningMiddleware` function can be used to extract this reasoning information and expose it as a `reasoning` property on the result.
```
`
import { wrapLanguageModel, extractReasoningMiddleware } from 'ai';
const model = wrapLanguageModel({
model: yourModel,
middleware: extractReasoningMiddleware({ tagName: 'think' }),
});
`
```
You can then use that enhanced model in functions like `generateText` and `streamText`.
The `extractReasoningMiddleware` function also includes a `startWithReasoning` option.
When set to `true`, the reasoning tag will be prepended to the generated text.
This is useful for models that do not include the reasoning tag at the beginning of the response.
For more details, see the [DeepSeek R1 guide](/cookbook/guides/r1#deepseek-r1-middleware).
### [Extract JSON](#extract-json)
Some models wrap JSON responses in markdown code fences (e.g., ````json ... ````) even when you request structured output.
The `extractJsonMiddleware` function strips these code fences from the response, making it compatible with `Output.object()`.
```
`
import {
wrapLanguageModel,
extractJsonMiddleware,
Output,
generateText,
} from 'ai';
import { z } from 'zod';
const model = wrapLanguageModel({
model: yourModel,
middleware: extractJsonMiddleware(),
});
const result = await generateText({
model,
output: Output.object({
schema: z.object({
name: z.string(),
ingredients: z.array(z.string()),
}),
}),
prompt: 'Generate a recipe.',
});
`
```
You can also provide a custom transform function for models that use different formatting:
```
`
const model = wrapLanguageModel({
model: yourModel,
middleware: extractJsonMiddleware({
transform: text =\> text.replace(/^PREFIX/, '').replace(/SUFFIX$/, ''),
}),
});
`
```
### [Simulate Streaming](#simulate-streaming)
The `simulateStreamingMiddleware` function can be used to simulate streaming behavior with responses from non-streaming language models.
This is useful when you want to maintain a consistent streaming interface even when using models that only provide complete responses.
```
`
import { wrapLanguageModel, simulateStreamingMiddleware } from 'ai';
const model = wrapLanguageModel({
model: yourModel,
middleware: simulateStreamingMiddleware(),
});
`
```
### [Default Settings](#default-settings)
The `defaultSettingsMiddleware` function can be used to apply default settings to a language model.
```
`
import { wrapLanguageModel, defaultSettingsMiddleware } from 'ai';
const model = wrapLanguageModel({
model: yourModel,
middleware: defaultSettingsMiddleware({
settings: {
temperature: 0.5,
maxOutputTokens: 800,
providerOptions: { openai: { store: false } },
},
}),
});
`
```
### [Add Tool Input Examples](#add-tool-input-examples)
The `addToolInputExamplesMiddleware` function adds tool input examples to tool descriptions.
This is useful for providers that don't natively support the `inputExamples` property on tools.
The middleware serializes the examples into the tool's description text so models can still benefit from seeing example inputs.
```
`
import { wrapLanguageModel, addToolInputExamplesMiddleware } from 'ai';
const model = wrapLanguageModel({
model: yourModel,
middleware: addToolInputExamplesMiddleware({
prefix: 'Input Examples:',
}),
});
`
```
When you define a tool with `inputExamples`, the middleware will append them to the tool's description:
```
`
import { generateText, tool } from 'ai';
import { z } from 'zod';
const result = await generateText({
model, // wrapped model from above
tools: {
weather: tool({
description: 'Get the weather in a location',
inputSchema: z.object({
location: z.string(),
}),
inputExamples: [
{ input: { location: 'San Francisco' } },
{ input: { location: 'London' } },
],
}),
},
prompt: 'What is the weather in Tokyo?',
});
`
```
The tool description will be transformed to:
```
`
Get the weather in a location
Input Examples:
{"location":"San Francisco"}
{"location":"London"}
`
```
#### [Options](#options)
* `prefix` (optional): A prefix text to prepend before the examples. Default: `'Input Examples:'`.
* `format` (optional): A custom formatter function for each example. Receives the example object and its index. Default: `JSON.stringify(example.input)`.
* `remove` (optional): Whether to remove the `inputExamples` property from the tool after adding them to the description. Default: `true`.
```
`
const model = wrapLanguageModel({
model: yourModel,
middleware: addToolInputExamplesMiddleware({
prefix: 'Input Examples:',
format: (example, index) =\>
`${index + 1}. ${JSON.stringify(example.input)}`,
remove: true,
}),
});
`
```
## [Community Middleware](#community-middleware)
The AI SDK provides a Language Model Middleware specification. Community members can develop middleware that adheres to this specification, making it compatible with the AI SDK ecosystem.
Here are some community middlewares that you can explore:
### [Custom tool call parser](#custom-tool-call-parser)
The [Custom tool call parser](https://github.com/minpeter/ai-sdk-tool-call-middleware) middleware extends tool call capabilities to models that don't natively support the OpenAI-style `tools` parameter. This includes many self-hosted and third-party models that lack native function calling features.
Using this middleware on models that support native function calls may result
in unintended performance degradation, so check whether your model supports
native function calls before deciding to use it.
This middleware enables function calling capabilities by converting function schemas into prompt instructions and parsing the model's responses into structured function calls. It works by transforming the JSON function definitions into natural language instructions the model can understand, then analyzing the generated text to extract function call attempts. This approach allows developers to use the same function calling API across different model providers, even with models that don't natively support the OpenAI-style function calling format, providing a consistent function calling experience regardless of the underlying model implementation.
The `@ai-sdk-tool/parser` package offers three middleware variants:
* `createToolMiddleware`: A flexible function for creating custom tool call middleware tailored to specific models
* `hermesToolMiddleware`: Ready-to-use middleware for Hermes & Qwen format function calls
* `gemmaToolMiddleware`: Pre-configured middleware for Gemma 3 model series function call format
Here's how you can enable function calls with Gemma models that don't support them natively:
```
`
import { wrapLanguageModel } from 'ai';
import { gemmaToolMiddleware } from '@ai-sdk-tool/parser';
const model = wrapLanguageModel({
model: openrouter('google/gemma-3-27b-it'),
middleware: gemmaToolMiddleware,
});
`
```
Find more examples at this [link](https://github.com/minpeter/ai-sdk-tool-call-middleware/tree/main/examples/core/src).
## [Implementing Language Model Middleware](#implementing-language-model-middleware)
Implementing language model middleware is advanced functionality and requires
a solid understanding of the [language model
specification](https://github.com/vercel/ai/blob/v5/packages/provider/src/language-model/v2/language-model-v2.ts).
You can implement any of the following three function to modify the behavior of the language model:
1. `transformParams`: Transforms the parameters before they are passed to the language model, for both `doGenerate` and `doStream`.
2. `wrapGenerate`: Wraps the `doGenerate` method of the [language model](https://github.com/vercel/ai/blob/v5/packages/provider/src/language-model/v2/language-model-v2.ts).
You can modify the parameters, call the language model, and modify the result.
3. `wrapStream`: Wraps the `doStream` method of the [language model](https://github.com/vercel/ai/blob/v5/packages/provider/src/language-model/v2/language-model-v2.ts).
You can modify the parameters, call the language model, and modify the result.
Here are some examples of how to implement language model middleware:
## [Examples](#examples)
These examples are not meant to be used in production. They are just to show
how you can use middleware to enhance the behavior of language models.
### [Logging](#logging)
This example shows how to log the parameters and generated text of a language model call.
```
`
import type {
LanguageModelV3Middleware,
LanguageModelV3StreamPart,
} from '@ai-sdk/provider';
export const yourLogMiddleware: LanguageModelV3Middleware = {
wrapGenerate: async ({ doGenerate, params }) =\> {
console.log('doGenerate called');
console.log(`params: ${JSON.stringify(params, null, 2)}`);
const result = await doGenerate();
console.log('doGenerate finished');
console.log(`generated text: ${result.text}`);
return result;
},
wrapStream: async ({ doStream, params }) =\> {
console.log('doStream called');
console.log(`params: ${JSON.stringify(params, null, 2)}`);
const { stream, ...rest } = await doStream();
let generatedText = '';
const textBlocks = new Map\<string, string\>();
const transformStream = new TransformStream\<
LanguageModelV3StreamPart,
LanguageModelV3StreamPart
\>({
transform(chunk, controller) {
switch (chunk.type) {
case 'text-start': {
textBlocks.set(chunk.id, '');
break;
}
case 'text-delta': {
const existing = textBlocks.get(chunk.id) || '';
textBlocks.set(chunk.id, existing + chunk.delta);
generatedText += chunk.delta;
break;
}
case 'text-end': {
console.log(
`Text block ${chunk.id} completed:`,
textBlocks.get(chunk.id),
);
break;
}
}
controller.enqueue(chunk);
},
flush() {
console.log('doStream finished');
console.log(`generated text: ${generatedText}`);
},
});
return {
stream: stream.pipeThrough(transformStream),
...rest,
};
},
};
`
```
### [Caching](#caching)
This example shows how to build a simple cache for the generated text of a language model call.
```
`
import type { LanguageModelV3Middleware } from '@ai-sdk/provider';
const cache = new Map\<string, any\>();
export const yourCacheMiddleware: LanguageModelV3Middleware = {
wrapGenerate: async ({ doGenerate, params }) =\> {
const cacheKey = JSON.stringify(params);
if (cache.has(cacheKey)) {
return cache.get(cacheKey);
}
const result = await doGenerate();
cache.set(cacheKey, result);
return result;
},
// here you would implement the caching logic for streaming
};
`
```
### [Retrieval Augmented Generation (RAG)](#retrieval-augmented-generation-rag)
This example shows how to use RAG as middleware.
Helper functions like `getLastUserMessageText` and `findSources` are not part
of the AI SDK. They are just used in this example to illustrate the concept of
RAG.
```
`
import type { LanguageModelV3Middleware } from '@ai-sdk/provider';
export const yourRagMiddleware: LanguageModelV3Middleware = {
transformParams: async ({ params }) =\> {
const lastUserMessageText = getLastUserMessageText({
prompt: params.prompt,
});
if (lastUserMessageText == null) {
return params; // do not use RAG (send unmodified parameters)
}
const instruction =
'Use the following information to answer the question:\\n' +
findSources({ text: lastUserMessageText })
.map(chunk =\> JSON.stringify(chunk))
.join('\\n');
return addToLastUserMessage({ params, text: instruction });
},
};
`
```
### [Guardrails](#guardrails)
Guard rails are a way to ensure that the generated text of a language model call
is safe and appropriate. This example shows how to use guardrails as middleware.
```
`
import type { LanguageModelV3Middleware } from '@ai-sdk/provider';
export const yourGuardrailMiddleware: LanguageModelV3Middleware = {
wrapGenerate: async ({ doGenerate }) =\> {
const { text, ...rest } = await doGenerate();
// filtering approach, e.g. for PII or other sensitive information:
const cleanedText = text?.replace(/badword/g, '\<REDACTED\>');
return { text: cleanedText, ...rest };
},
// here you would implement the guardrail logic for streaming
// Note: streaming guardrails are difficult to implement, because
// you do not know the full content of the stream until it's finished.
};
`
```
## [Configuring Per Request Custom Metadata](#configuring-per-request-custom-metadata)
To send and access custom metadata in Middleware, you can use `providerOptions`. This is useful when building logging middleware where you want to pass additional context like user IDs, timestamps, or other contextual data that can help with tracking and debugging.
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText, wrapLanguageModel } from 'ai';
import type { LanguageModelV3Middleware } from '@ai-sdk/provider';
export const yourLogMiddleware: LanguageModelV3Middleware = {
wrapGenerate: async ({ doGenerate, params }) =\> {
console.log('METADATA', params?.providerMetadata?.yourLogMiddleware);
const result = await doGenerate();
return result;
},
};
const { text } = await generateText({
model: wrapLanguageModel({
model: "anthropic/claude-sonnet-4.5",
middleware: yourLogMiddleware,
}),
prompt: 'Invent a new holiday and describe its traditions.',
providerOptions: {
yourLogMiddleware: {
hello: 'world',
},
},
});
console.log(text);
`
```
On this page
[Language Model Middleware](#language-model-middleware)
[Using Language Model Middleware](#using-language-model-middleware)
[Multiple middlewares](#multiple-middlewares)
[Built-in Middleware](#built-in-middleware)
[Extract Reasoning](#extract-reasoning)
[Extract JSON](#extract-json)
[Simulate Streaming](#simulate-streaming)
[Default Settings](#default-settings)
[Add Tool Input Examples](#add-tool-input-examples)
[Options](#options)
[Community Middleware](#community-middleware)
[Custom tool call parser](#custom-tool-call-parser)
[Implementing Language Model Middleware](#implementing-language-model-middleware)
[Examples](#examples)
[Logging](#logging)
[Caching](#caching)
[Retrieval Augmented Generation (RAG)](#retrieval-augmented-generation-rag)
[Guardrails](#guardrails)
[Configuring Per Request Custom Metadata](#configuring-per-request-custom-metadata)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)