Migration Guides: Migrate AI SDK 5.x to 6.0
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
# [Migrate AI SDK 5.x to 6.0](#migrate-ai-sdk-5x-to-60)
## [Recommended Migration Process](#recommended-migration-process)
1. Backup your project. If you use a versioning control system, make sure all previous versions are committed.
2. Upgrade to AI SDK 6.0.
3. Follow the breaking changes guide below.
4. Verify your project is working as expected.
5. Commit your changes.
## [AI SDK 6.0 Package Versions](#ai-sdk-60-package-versions)
You need to update the following packages to the latest versions in your `package.json` file(s):
* `ai` package: `^6.0.0`
* `@ai-sdk/provider` package: `^3.0.0`
* `@ai-sdk/provider-utils` package: `^4.0.0`
* `@ai-sdk/\*` packages: `^3.0.0`
An example upgrade command would be:
```
`
pnpm install ai@latest @ai-sdk/react@latest @ai-sdk/openai@latest
`
```
## [Codemods](#codemods)
The AI SDK provides Codemod transformations to help upgrade your codebase when a
feature is deprecated, removed, or otherwise changed.
Codemods are transformations that run on your codebase automatically. They
allow you to easily apply many changes without having to manually go through
every file.
You can run all v6 codemods (v5 → v6 migration) by running the following command
from the root of your project:
```
`
npx @ai-sdk/codemod v6
`
```
There is also an `npx @ai-sdk/codemod upgrade` command, but it runs all
codemods from all versions (v4, v5, and v6). Use `v6` when upgrading from v5.
Individual codemods can be run by specifying the name of the codemod:
```
`
npx @ai-sdk/codemod \<codemod-name\> \<path\>
`
```
For example, to run a specific v6 codemod:
```
`
npx @ai-sdk/codemod v6/rename-text-embedding-to-embedding src/
`
```
Codemods are intended as a tool to help you with the upgrade process. They may
not cover all of the changes you need to make. You may need to make additional
changes manually.
## [Codemod Table](#codemod-table)
|Codemod Name|Description|
|`rename-text-embedding-to-embedding`|Renames `textEmbeddingModel` to `embeddingModel` and `textEmbedding` to `embedding` on providers|
|`rename-mock-v2-to-v3`|Renames V2 mock classes from `ai/test` to V3 (e.g., `MockLanguageModelV2` → `MockLanguageModelV3`)|
|`rename-tool-call-options-to-tool-execution-options`|Renames the `ToolCallOptions` type to `ToolExecutionOptions`|
|`rename-core-message-to-model-message`|Renames the `CoreMessage` type to `ModelMessage`|
|`rename-converttocoremessages-to-converttomodelmessages`|Renames `convertToCoreMessages` function to `convertToModelMessages`|
|`rename-vertex-provider-metadata-key`|Renames `google` to `vertex` in `providerMetadata` and `providerOptions` for Google Vertex files|
|`wrap-tomodeloutput-parameter`|Wraps `toModelOutput` parameter in object destructuring (`output` → `{ output }`)|
|`add-await-converttomodelmessages`|Adds `await` to `convertToModelMessages` calls (now async in AI SDK 6)|
## [AI SDK Core](#ai-sdk-core)
### [`Experimental\_Agent` to `ToolLoopAgent` Class](#experimental_agent-to-toolloopagent-class)
The `Experimental\_Agent` class has been replaced with the `ToolLoopAgent` class. Two key changes:
1. The `system` parameter has been renamed to `instructions`
2. The default `stopWhen` has changed from `stepCountIs(1)` to `stepCountIs(20)`
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5
```
`
import { Experimental\_Agent as Agent, stepCountIs } from 'ai';
const agent = new Agent({
model: "anthropic/claude-sonnet-4.5",
system: 'You are a helpful assistant.',
tools: {
// your tools here
},
stopWhen: stepCountIs(20), // Required for multi-step agent loops
});
const result = await agent.generate({
prompt: 'What is the weather in San Francisco?',
});
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 6
```
`
import { ToolLoopAgent } from 'ai';
const agent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
instructions: 'You are a helpful assistant.',
tools: {
// your tools here
},
// stopWhen defaults to stepCountIs(20)
});
const result = await agent.generate({
prompt: 'What is the weather in San Francisco?',
});
`
```
Learn more about [building agents](/docs/agents/building-agents).
### [`CoreMessage` Removal](#coremessage-removal)
The deprecated `CoreMessage` type and related functions have been removed ([PR #10710](https://github.com/vercel/ai/pull/10710)). Replace `convertToCoreMessages` with `convertToModelMessages`.
AI SDK 5
```
`
import { convertToCoreMessages, type CoreMessage } from 'ai';
const coreMessages = convertToCoreMessages(messages); // CoreMessage[]
`
```
AI SDK 6
```
`
import { convertToModelMessages, type ModelMessage } from 'ai';
const modelMessages = await convertToModelMessages(messages); // ModelMessage[]
`
```
Use the `rename-core-message-to-model-message` and
`rename-converttocoremessages-to-converttomodelmessages` codemods to
automatically update your codebase.
### [`generateObject` and `streamObject` Deprecation](#generateobject-and-streamobject-deprecation)
`generateObject` and `streamObject` have been deprecated ([PR #10754](https://github.com/vercel/ai/pull/10754)).
They will be removed in a future version.
Use `generateText` and `streamText` with an `output` setting instead.
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5
```
`
import { generateObject } from 'ai';
import { z } from 'zod';
const { object } = await generateObject({
model: "anthropic/claude-sonnet-4.5",
schema: z.object({
recipe: z.object({
name: z.string(),
ingredients: z.array(z.object({ name: z.string(), amount: z.string() })),
steps: z.array(z.string()),
}),
}),
prompt: 'Generate a lasagna recipe.',
});
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 6
```
`
import { generateText, Output } from 'ai';
import { z } from 'zod';
const { output } = await generateText({
model: "anthropic/claude-sonnet-4.5",
output: Output.object({
schema: z.object({
recipe: z.object({
name: z.string(),
ingredients: z.array(
z.object({ name: z.string(), amount: z.string() }),
),
steps: z.array(z.string()),
}),
}),
}),
prompt: 'Generate a lasagna recipe.',
});
`
```
For streaming structured data, replace `streamObject` with `streamText`:
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5
```
`
import { streamObject } from 'ai';
import { z } from 'zod';
const { partialObjectStream } = streamObject({
model: "anthropic/claude-sonnet-4.5",
schema: z.object({
recipe: z.object({
name: z.string(),
ingredients: z.array(z.object({ name: z.string(), amount: z.string() })),
steps: z.array(z.string()),
}),
}),
prompt: 'Generate a lasagna recipe.',
});
for await (const partialObject of partialObjectStream) {
console.log(partialObject);
}
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 6
```
`
import { streamText, Output } from 'ai';
import { z } from 'zod';
const { partialOutputStream } = streamText({
model: "anthropic/claude-sonnet-4.5",
output: Output.object({
schema: z.object({
recipe: z.object({
name: z.string(),
ingredients: z.array(
z.object({ name: z.string(), amount: z.string() }),
),
steps: z.array(z.string()),
}),
}),
}),
prompt: 'Generate a lasagna recipe.',
});
for await (const partialObject of partialOutputStream) {
console.log(partialObject);
}
`
```
Learn more about [generating structured data](/docs/ai-sdk-core/generating-structured-data).
### [async `convertToModelMessages`](#async-converttomodelmessages)
`convertToModelMessages()` is async in AI SDK 6 to support async `Tool.toModelOutput()`.
AI SDK 5
```
`
import { convertToModelMessages } from 'ai';
const modelMessages = convertToModelMessages(uiMessages);
`
```
AI SDK 6
```
`
import { convertToModelMessages } from 'ai';
const modelMessages = await convertToModelMessages(uiMessages);
`
```
Use the `add-await-converttomodelmessages` codemod to automatically update
your codebase.
### [`Tool.toModelOutput` changes](#tooltomodeloutput-changes)
`toModelOutput()` receives a parameter object with an `output` property in AI SDK 6.
In AI SDK 5, the `output` was the arguments.
AI SDK 5
```
`
import { tool } from 'ai';
const someTool = tool({
// ...
toModelOutput: output =\> {
// ...
},
});
`
```
AI SDK 6
```
`
import { tool } from 'ai';
const someTool = tool({
// ...
toModelOutput: ({ output }) =\> {
// ...
},
});
`
```
Use the `wrap-tomodeloutput-parameter` codemod to automatically update your
codebase.
### [`cachedInputTokens` and `reasoningTokens` in `LanguageModelUsage` Deprecation](#cachedinputtokens-and-reasoningtokens-in-languagemodelusage-deprecation)
`cachedInputTokens` and `reasoningTokens` in `LanguageModelUsage` have been deprecated.
You can replace `cachedInputTokens` with `inputTokenDetails.cacheReadTokens`
and `reasoningTokens` with `outputTokenDetails.reasoningTokens`.
### [`ToolCallOptions` to `ToolExecutionOptions` Rename](#toolcalloptions-to-toolexecutionoptions-rename)
The `ToolCallOptions` type has been renamed to `ToolExecutionOptions`
and is now deprecated.
Use the `rename-tool-call-options-to-tool-execution-options` codemod to
automatically update your codebase.
### [Per-Tool Strict Mode](#per-tool-strict-mode)
Strict mode for tools is now controlled by setting `strict` on each tool ([PR #10817](https://github.com/vercel/ai/pull/10817)). This enables fine-grained control over strict tool calls, which is important since strict mode depends on the specific tool input schema.
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 5
```
`
import { streamText, tool } from 'ai';
import { z } from 'zod';
// Tool strict mode was controlled by strictJsonSchema
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
tools: {
calculator: tool({
description: 'A simple calculator',
inputSchema: z.object({
expression: z.string(),
}),
execute: async ({ expression }) =\> {
const result = eval(expression);
return { result };
},
}),
},
providerOptions: {
openai: {
strictJsonSchema: true, // Applied to all tools
},
},
});
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
AI SDK 6
```
`
import { streamText, tool } from 'ai';
import { z } from 'zod';
const result = streamText({
model: "anthropic/claude-sonnet-4.5",
tools: {
calculator: tool({
description: 'A simple calculator',
inputSchema: z.object({
expression: z.string(),
}),
execute: async ({ expression }) =\> {
const result = eval(expression);
return { result };
},
strict: true, // Control strict mode per tool
}),
},
});
`
```
### [Flexible Tool Content](#flexible-tool-content)
AI SDK 6 introduces more flexible tool output and result content support ([PR #9605](https://github.com/vercel/ai/pull/9605)), enabling richer tool interactions and better support for complex tool execution patterns.
### [`ToolCallRepairFunction` Signature](#toolcallrepairfunction-signature)
The `system` parameter in the `ToolCallRepairFunction` type now accepts `SystemModelMessage` in addition to `string` ([PR #10635](https://github.com/vercel/ai/pull/10635)). This allows for more flexible system message configuration, including provider-specific options like caching.
AI SDK 5
```
`
import type { ToolCallRepairFunction } from 'ai';
const repairToolCall: ToolCallRepairFunction\<MyTools\> = async ({
system, // type: string | undefined
messages,
toolCall,
tools,
inputSchema,
error,
}) =\> {
// ...
};
`
```
AI SDK 6
```
`
import type { ToolCallRepairFunction, SystemModelMessage } from 'ai';
const repairToolCall: ToolCallRepairFunction\<MyTools\> = async ({
system, // type: string | SystemModelMessage | undefined
messages,
toolCall,
tools,
inputSchema,
error,
}) =\> {
// Handle both string and SystemModelMessage
const systemText = typeof system === 'string' ? system : system?.content;
// ...
};
`
```
### [Embedding Model Method Rename](#embedding-model-method-rename)
The `textEmbeddingModel` and `textEmbedding` methods on providers have been renamed to `embeddingModel` and `embedding` respectively. Additionally, generics have been removed from `EmbeddingModel`, `embed`, and `embedMany` ([PR #10592](https://github.com/vercel/ai/pull/10592)).
AI SDK 5
```
`
import { openai } from '@ai-sdk/openai';
import { embed } from 'ai';
// Using the full method name
const model = openai.textEmbeddingModel('text-embedding-3-small');
// Using the shorthand
const model = openai.textEmbedding('text-embedding-3-small');
const { embedding } = await embed({
model: openai.textEmbedding('text-embedding-3-small'),
value: 'sunny day at the beach',
});
`
```
AI SDK 6
```
`
import { openai } from '@ai-sdk/openai';
import { embed } from 'ai';
// Using the full method name
const model = openai.embeddingModel('text-embedding-3-small');
// Using the shorthand
const model = openai.embedding('text-embedding-3-small');
const { embedding } = await embed({
model: openai.embedding('text-embedding-3-small'),
value: 'sunny day at the beach',
});
`
```
Use the `rename-text-embedding-to-embedding` codemod to automatically update
your codebase.
### [Warning Logger](#warning-logger)
AI SDK 6 introduces a warning logger that outputs deprecation warnings and best practice recommendations ([PR #8343](https://github.com/vercel/ai/pull/8343)).
To disable warning logging, set the `AI\_SDK\_LOG\_WARNINGS` environment variable to `false`:
```
`
export AI\_SDK\_LOG\_WARNINGS=false
`
```
### [Warning Type Unification](#warning-type-unification)
Separate warning types for each generation function have been consolidated into a single `Warning` type exported from the `ai` package ([PR #10631](https://github.com/vercel/ai/pull/10631)).
AI SDK 5
```
`
// Separate warning types for each generation function
import type {
CallWarning,
ImageModelCallWarning,
SpeechWarning,
TranscriptionWarning,
} from 'ai';
`
```
AI SDK 6
```
`
// Single Warning type for all generation functions
import type { Warning } from 'ai';
`
```
### [Finish reason "unknown" merged into "other"](#finish-reason-unknown-merged-into-other)
The `unknown` finish reason has been removed. It is now returned as `other`.
## [AI SDK UI](#ai-sdk-ui)
### [Tool UI Part Helper Functions Rename](#tool-ui-part-helper-functions-rename)
The tool UI part helper functions have been renamed to better reflect their purpose and to accommodate both static and dynamic tool parts ([PR #XXXX](https://github.com/vercel/ai/pull/XXXX)).
#### [`isToolUIPart` → `isStaticToolUIPart`](#istooluipart--isstatictooluipart)
The `isToolUIPart` function has been renamed to `isStaticToolUIPart` to clarify that it checks for static tool parts only.
AI SDK 5
```
`
import { isToolUIPart } from 'ai';
// Check if a part is a tool UI part
if (isToolUIPart(part)) {
console.log(part.toolName);
}
`
```
AI SDK 6
```
`
import { isStaticToolUIPart } from 'ai';
// Check if a part is a static tool UI part
if (isStaticToolUIPart(part)) {
console.log(part.toolName);
}
`
```
#### [`isToolOrDynamicToolUIPart` → `isToolUIPart`](#istoolordynamictooluipart--istooluipart)
The `isToolOrDynamicToolUIPart` function has been renamed to `isToolUIPart`. The old name is deprecated but still available.
AI SDK 5
```
`
import { isToolOrDynamicToolUIPart } from 'ai';
// Check if a part is either a static or dynamic tool UI part
if (isToolOrDynamicToolUIPart(part)) {
console.log('Tool part found');
}
`
```
AI SDK 6
```
`
import { isToolUIPart } from 'ai';
// Check if a part is either a static or dynamic tool UI part
if (isToolUIPart(part)) {
console.log('Tool part found');
}
`
```
#### [`getToolName` → `getStaticToolName`](#gettoolname--getstatictoolname)
The `getToolName` function has been renamed to `getStaticToolName` to clarify that it returns the tool name from static tool parts only.
AI SDK 5
```
`
import { getToolName } from 'ai';
// Get the tool name from a tool part
const name = getToolName(toolPart);
`
```
AI SDK 6
```
`
import { getStaticToolName } from 'ai';
// Get the tool name from a static tool part
const name = getStaticToolName(toolPart);
`
```
#### [`getToolOrDynamicToolName` → `getToolName`](#gettoolordynamictoolname--gettoolname)
The `getToolOrDynamicToolName` function has been renamed to `getToolName`. The old name is deprecated but still available.
AI SDK 5
```
`
import { getToolOrDynamicToolName } from 'ai';
// Get the tool name from either a static or dynamic tool part
const name = getToolOrDynamicToolName(toolPart);
`
```
AI SDK 6
```
`
import { getToolName } from 'ai';
// Get the tool name from either a static or dynamic tool part
const name = getToolName(toolPart);
`
```
## [Providers](#providers)
### [OpenAI](#openai)
#### [`strictJsonSchema` Defaults to True](#strictjsonschema-defaults-to-true)
The `strictJsonSchema` setting for JSON outputs and tool calls is enabled by default ([PR #10752](https://github.com/vercel/ai/pull/10752)). This improves stability and ensures valid JSON output that matches your schema.
However, strict mode is stricter about schema requirements. If you receive schema rejection errors, adjust your schema (for example, use `null` instead of `undefined`) or disable strict mode.
AI SDK 5
```
`
import { openai } from '@ai-sdk/openai';
import { generateObject } from 'ai';
import { z } from 'zod';
// strictJsonSchema was false by default
const result = await generateObject({
model: openai('gpt-5.1'),
schema: z.object({
name: z.string(),
}),
prompt: 'Generate a person',
});
`
```
AI SDK 6
```
`
import { openai } from '@ai-sdk/openai';
import { generateObject } from 'ai';
import { z } from 'zod';
// strictJsonSchema is true by default
const result = await generateObject({
model: openai('gpt-5.1'),
schema: z.object({
name: z.string(),
}),
prompt: 'Generate a person',
});
// Disable strict mode if needed
const resultNoStrict = await generateObject({
model: openai('gpt-5.1'),
schema: z.object({
name: z.string(),
}),
prompt: 'Generate a person',
providerOptions: {
openai: {
strictJsonSchema: false,
} satisfies OpenAIResponsesProviderOptions,
},
});
`
```
#### [`structuredOutputs` Option Removed from Chat Model](#structuredoutputs-option-removed-from-chat-model)
The `structuredOutputs` provider option has been removed from chat models ([PR #10752](https://github.com/vercel/ai/pull/10752)). Use `strictJsonSchema` instead.
### [Azure](#azure)
#### [Default Provider Uses Responses API](#default-provider-uses-responses-api)
The `@ai-sdk/azure` provider now uses the Responses API by default when calling `azure()` ([PR #9868](https://github.com/vercel/ai/pull/9868)). To use the previous Chat Completions API behavior, use `azure.chat()` instead.
AI SDK 5
```
`
import { azure } from '@ai-sdk/azure';
// Used Chat Completions API
const model = azure('gpt-4o');
`
```
AI SDK 6
```
`
import { azure } from '@ai-sdk/azure';
// Now uses Responses API by default
const model = azure('gpt-4o');
// Use azure.chat() for Chat Completions API
const chatModel = azure.chat('gpt-4o');
// Use azure.responses() explicitly for Responses API
const responsesModel = azure.responses('gpt-4o');
`
```
The Responses and Chat Completions APIs have different behavior and defaults.
If you depend on the Chat Completions API, switch your model instance to
`azure.chat()` and audit your configuration.
#### [Responses API `providerMetadata` and `providerOptions` Key](#responses-api-providermetadata-and-provideroptions-key)
For the **Responses API**, the `@ai-sdk/azure` provider now uses `azure` as the key for `providerMetadata` and `providerOptions` instead of `openai`. The `openai` key is still supported for `providerOptions` input, but resulting `providerMetadata` output now uses `azure`.
AI SDK 5
```
`
import { azure } from '@ai-sdk/azure';
import { generateText } from 'ai';
const result = await generateText({
model: azure.responses('gpt-5-mini'), // use your own deployment
prompt: 'Hello',
providerOptions: {
openai: {
// AI SDK 5: use `openai` key for Responses API options
reasoningSummary: 'auto',
},
},
});
// Accessed metadata via 'openai' key
console.log(result.providerMetadata?.openai?.responseId);
`
```
AI SDK 6
```
`
import { azure } from '@ai-sdk/azure';
import { generateText } from 'ai';
const result = await generateText({
// azure() now uses the Responses API by default
model: azure('gpt-5-mini'), // use your own deployment
prompt: 'Hello',
providerOptions: {
azure: {
// AI SDK 6: use `azure` key for Responses API options
reasoningSummary: 'auto',
},
},
});
// Access metadata via 'azure' key
console.log(result.providerMetadata?.azure?.responseId);
`
```
### [Anthropic](#anthropic)
#### [Structured Outputs Mode](#structured-outputs-mode)
Anthropic has [ introduced native structured outputs for Claude Sonnet 4.5 and later models ](https://www.claude.com/blog/structured-outputs-on-the-claude-developer-platform). The `@ai-sdk/anthropic` provider now includes a `structuredOutputMode` option to control how structured outputs are generated ([PR #10502](https://github.com/vercel/ai/pull/10502)).
The available modes are:
* `'outputFormat'`: Use Anthropic's native `output\_format` parameter
* `'jsonTool'`: Use a special JSON tool to specify the structured output format
* `'auto'` (default): Use `'outputFormat'` when supported by the model, otherwise fall back to `'jsonTool'`
AI SDK 6
```
`
import { anthropic } from '@ai-sdk/anthropic';
import { generateObject } from 'ai';
import { z } from 'zod';
const result = await generateObject({
model: anthropic('claude-sonnet-4-5-20250929'),
schema: z.object({
name: z.string(),
age: z.number(),
}),
prompt: 'Generate a person',
providerOptions: {
anthropic: {
// Explicitly set the structured output mode (optional)
structuredOutputMode: 'outputFormat',
} satisfies AnthropicProviderOptions,
},
});
`
```
### [Google Vertex](#google-vertex)
#### [`providerMetadata` and `providerOptions` Key](#providermetadata-and-provideroptions-key)
The `@ai-sdk/google-vertex` provider now uses `vertex` as the key for `providerMetadata` and `providerOptions` instead of `google`. The `google` key is still supported for `providerOptions` input, but resulting `providerMetadata` output now uses `vertex`.
AI SDK 5
```
`
import { vertex } from '@ai-sdk/google-vertex';
import { generateText } from 'ai';
const result = await generateText({
model: vertex('gemini-2.5-flash'),
providerOptions: {
google: {
safetySettings: [
/\* ... \*/
],
}, // Used 'google' key
},
prompt: 'Hello',
});
// Accessed metadata via 'google' key
console.log(result.providerMetadata?.google?.safetyRatings);
`
```
AI SDK 6
```
`
import { vertex } from '@ai-sdk/google-vertex';
import { generateText } from 'ai';
const result = await generateText({
model: vertex('gemini-2.5-flash'),
providerOptions: {
vertex: {
safetySettings: [
/\* ... \*/
],
}, // Now uses 'vertex' key
},
prompt: 'Hello',
});
// Access metadata via 'vertex' key
console.log(result.providerMetadata?.vertex?.safetyRatings);
`
```
Use the `rename-vertex-provider-metadata-key` codemod to automatically update
your codebase.
## [`ai/test`](#aitest)
### [Mock Classes](#mock-classes)
V2 mock classes have been removed from the `ai/test` module. Use the new V3 mock classes instead for testing.
AI SDK 5
```
`
import {
MockEmbeddingModelV2,
MockImageModelV2,
MockLanguageModelV2,
MockProviderV2,
MockSpeechModelV2,
MockTranscriptionModelV2,
} from 'ai/test';
`
```
AI SDK 6
```
`
import {
MockEmbeddingModelV3,
MockImageModelV3,
MockLanguageModelV3,
MockProviderV3,
MockSpeechModelV3,
MockTranscriptionModelV3,
} from 'ai/test';
`
```
Use the `rename-mock-v2-to-v3` codemod to automatically update your codebase.
On this page
[Migrate AI SDK 5.x to 6.0](#migrate-ai-sdk-5x-to-60)
[Recommended Migration Process](#recommended-migration-process)
[AI SDK 6.0 Package Versions](#ai-sdk-60-package-versions)
[Codemods](#codemods)
[Codemod Table](#codemod-table)
[AI SDK Core](#ai-sdk-core)
[Experimental\_Agent to ToolLoopAgent Class](#experimental_agent-to-toolloopagent-class)
[CoreMessage Removal](#coremessage-removal)
[generateObject and streamObject Deprecation](#generateobject-and-streamobject-deprecation)
[async convertToModelMessages](#async-converttomodelmessages)
[Tool.toModelOutput changes](#tooltomodeloutput-changes)
[cachedInputTokens and reasoningTokens in LanguageModelUsage Deprecation](#cachedinputtokens-and-reasoningtokens-in-languagemodelusage-deprecation)
[ToolCallOptions to ToolExecutionOptions Rename](#toolcalloptions-to-toolexecutionoptions-rename)
[Per-Tool Strict Mode](#per-tool-strict-mode)
[Flexible Tool Content](#flexible-tool-content)
[ToolCallRepairFunction Signature](#toolcallrepairfunction-signature)
[Embedding Model Method Rename](#embedding-model-method-rename)
[Warning Logger](#warning-logger)
[Warning Type Unification](#warning-type-unification)
[Finish reason "unknown" merged into "other"](#finish-reason-unknown-merged-into-other)
[AI SDK UI](#ai-sdk-ui)
[Tool UI Part Helper Functions Rename](#tool-ui-part-helper-functions-rename)
[isToolUIPart → isStaticToolUIPart](#istooluipart--isstatictooluipart)
[isToolOrDynamicToolUIPart → isToolUIPart](#istoolordynamictooluipart--istooluipart)
[getToolName → getStaticToolName](#gettoolname--getstatictoolname)
[getToolOrDynamicToolName → getToolName](#gettoolordynamictoolname--gettoolname)
[Providers](#providers)
[OpenAI](#openai)
[strictJsonSchema Defaults to True](#strictjsonschema-defaults-to-true)
[structuredOutputs Option Removed from Chat Model](#structuredoutputs-option-removed-from-chat-model)
[Azure](#azure)
[Default Provider Uses Responses API](#default-provider-uses-responses-api)
[Responses API providerMetadata and providerOptions Key](#responses-api-providermetadata-and-provideroptions-key)
[Anthropic](#anthropic)
[Structured Outputs Mode](#structured-outputs-mode)
[Google Vertex](#google-vertex)
[providerMetadata and providerOptions Key](#providermetadata-and-provideroptions-key)
[ai/test](#aitest)
[Mock Classes](#mock-classes)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)