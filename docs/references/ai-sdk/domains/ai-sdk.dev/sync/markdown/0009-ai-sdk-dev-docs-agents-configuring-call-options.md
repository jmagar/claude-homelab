Agents: Configuring Call Options
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
# [Configuring Call Options](#configuring-call-options)
Call options allow you to pass type-safe structured inputs to your agent. Use them to dynamically modify any agent setting based on the specific request.
## [Why Use Call Options?](#why-use-call-options)
When you need agent behavior to change based on runtime context:
* **Add dynamic context** - Inject retrieved documents, user preferences, or session data into prompts
* **Select models dynamically** - Choose faster or more capable models based on request complexity
* **Configure tools per request** - Pass user location to search tools or adjust tool behavior
* **Customize provider options** - Set reasoning effort, temperature, or other provider-specific settings
Without call options, you'd need to create multiple agents or handle configuration logic outside the agent.
## [How It Works](#how-it-works)
Define call options in three steps:
1. **Define the schema** - Specify what inputs you accept using `callOptionsSchema`
2. **Configure with `prepareCall`** - Use those inputs to modify agent settings
3. **Pass options at runtime** - Provide the options when calling `generate()` or `stream()`
## [Basic Example](#basic-example)
Add user context to your agent's prompt at runtime:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent } from 'ai';
import { z } from 'zod';
const supportAgent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
callOptionsSchema: z.object({
userId: z.string(),
accountType: z.enum(['free', 'pro', 'enterprise']),
}),
instructions: 'You are a helpful customer support agent.',
prepareCall: ({ options, ...settings }) =\> ({
...settings,
instructions:
settings.instructions +
`\\nUser context:
- Account type: ${options.accountType}
- User ID: ${options.userId}
Adjust your response based on the user's account level.`,
}),
});
// Call the agent with specific user context
const result = await supportAgent.generate({
prompt: 'How do I upgrade my account?',
options: {
userId: 'user\_123',
accountType: 'free',
},
});
`
```
The `options` parameter is now required and type-checked. If you don't provide it or pass incorrect types, TypeScript will error.
## [Modifying Agent Settings](#modifying-agent-settings)
Use `prepareCall` to modify any agent setting. Return only the settings you want to change.
### [Dynamic Model Selection](#dynamic-model-selection)
Choose models based on request characteristics:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent } from 'ai';
import { z } from 'zod';
const agent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5", // Default model
callOptionsSchema: z.object({
complexity: z.enum(['simple', 'complex']),
}),
prepareCall: ({ options, ...settings }) =\> ({
...settings,
model:
options.complexity === 'simple' ? 'openai/gpt-4o-mini' : 'openai/o1-mini',
}),
});
// Use faster model for simple queries
await agent.generate({
prompt: 'What is 2+2?',
options: { complexity: 'simple' },
});
// Use more capable model for complex reasoning
await agent.generate({
prompt: 'Explain quantum entanglement',
options: { complexity: 'complex' },
});
`
```
### [Dynamic Tool Configuration](#dynamic-tool-configuration)
Configure tools based on runtime context:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { openai } from '@ai-sdk/openai';
import { ToolLoopAgent } from 'ai';
import { z } from 'zod';
const newsAgent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
callOptionsSchema: z.object({
userCity: z.string().optional(),
userRegion: z.string().optional(),
}),
tools: {
web\_search: openai.tools.webSearch(),
},
prepareCall: ({ options, ...settings }) =\> ({
...settings,
tools: {
web\_search: openai.tools.webSearch({
searchContextSize: 'low',
userLocation: {
type: 'approximate',
city: options.userCity,
region: options.userRegion,
country: 'US',
},
}),
},
}),
});
await newsAgent.generate({
prompt: 'What are the top local news stories?',
options: {
userCity: 'San Francisco',
userRegion: 'California',
},
});
`
```
### [Provider-Specific Options](#provider-specific-options)
Configure provider settings dynamically:
```
`
import { OpenAILanguageModelResponsesOptions } from '@ai-sdk/openai';
import { ToolLoopAgent } from 'ai';
import { z } from 'zod';
const agent = new ToolLoopAgent({
model: 'openai/o3',
callOptionsSchema: z.object({
taskDifficulty: z.enum(['low', 'medium', 'high']),
}),
prepareCall: ({ options, ...settings }) =\> ({
...settings,
providerOptions: {
openai: {
reasoningEffort: options.taskDifficulty,
} satisfies OpenAILanguageModelResponsesOptions,
},
}),
});
await agent.generate({
prompt: 'Analyze this complex scenario...',
options: { taskDifficulty: 'high' },
});
`
```
## [Advanced Patterns](#advanced-patterns)
### [Retrieval Augmented Generation (RAG)](#retrieval-augmented-generation-rag)
Fetch relevant context and inject it into your prompt:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent } from 'ai';
import { z } from 'zod';
const ragAgent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
callOptionsSchema: z.object({
query: z.string(),
}),
prepareCall: async ({ options, ...settings }) =\> {
// Fetch relevant documents (this can be async)
const documents = await vectorSearch(options.query);
return {
...settings,
instructions: `Answer questions using the following context:
${documents.map(doc =\> doc.content).join('\\n\\n')}`,
};
},
});
await ragAgent.generate({
prompt: 'What is our refund policy?',
options: { query: 'refund policy' },
});
`
```
The `prepareCall` function can be async, enabling you to fetch data before configuring the agent.
### [Combining Multiple Modifications](#combining-multiple-modifications)
Modify multiple settings together:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { ToolLoopAgent } from 'ai';
import { z } from 'zod';
const agent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
callOptionsSchema: z.object({
userRole: z.enum(['admin', 'user']),
urgency: z.enum(['low', 'high']),
}),
tools: {
readDatabase: readDatabaseTool,
writeDatabase: writeDatabaseTool,
},
prepareCall: ({ options, ...settings }) =\> ({
...settings,
// Upgrade model for urgent requests
model: options.urgency === 'high' ? "anthropic/claude-sonnet-4.5" : settings.model,
// Limit tools based on user role
activeTools:
options.userRole === 'admin'
? ['readDatabase', 'writeDatabase']
: ['readDatabase'],
// Adjust instructions
instructions: `You are a ${options.userRole} assistant.
${options.userRole === 'admin' ? 'You have full database access.' : 'You have read-only access.'}`,
}),
});
await agent.generate({
prompt: 'Update the user record',
options: {
userRole: 'admin',
urgency: 'high',
},
});
`
```
## [Using with createAgentUIStreamResponse](#using-with-createagentuistreamresponse)
Pass call options through API routes to your agent:
app/api/chat/route.ts
```
`
import { createAgentUIStreamResponse } from 'ai';
import { myAgent } from '@/ai/agents/my-agent';
export async function POST(request: Request) {
const { messages, userId, accountType } = await request.json();
return createAgentUIStreamResponse({
agent: myAgent,
messages,
options: {
userId,
accountType,
},
});
}
`
```
## [Next Steps](#next-steps)
* Learn about [loop control](/docs/agents/loop-control) for execution management
* Explore [workflow patterns](/docs/agents/workflows) for complex multi-step processes
On this page
[Configuring Call Options](#configuring-call-options)
[Why Use Call Options?](#why-use-call-options)
[How It Works](#how-it-works)
[Basic Example](#basic-example)
[Modifying Agent Settings](#modifying-agent-settings)
[Dynamic Model Selection](#dynamic-model-selection)
[Dynamic Tool Configuration](#dynamic-tool-configuration)
[Provider-Specific Options](#provider-specific-options)
[Advanced Patterns](#advanced-patterns)
[Retrieval Augmented Generation (RAG)](#retrieval-augmented-generation-rag)
[Combining Multiple Modifications](#combining-multiple-modifications)
[Using with createAgentUIStreamResponse](#using-with-createagentuistreamresponse)
[Next Steps](#next-steps)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)