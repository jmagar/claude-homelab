Agents: Memory
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
# [Memory](#memory)
Memory lets your agent save information and recall it later. Without memory, every conversation starts fresh. With memory, your agent builds context over time, recalls previous interactions, and adapts to the user.
## [Three Approaches](#three-approaches)
You can add memory to your agent with the AI SDK in three ways, each with different tradeoffs:
|Approach|Effort|Flexibility|Provider Lock-in|
|[Provider-Defined Tools](#provider-defined-tools)|Low|Medium|Yes|
|[Memory Providers](#memory-providers)|Low|Low|Depends on memory provider|
|[Custom Tool](#custom-tool)|High|High|No|
## [Provider-Defined Tools](#provider-defined-tools)
[Provider-defined tools](/docs/foundations/tools#types-of-tools) are tools where the provider specifies the tool's `inputSchema` and `description`, but you provide the `execute` function. The model has been trained to use these tools, which can result in better performance compared to custom tools.
### [Anthropic Memory Tool](#anthropic-memory-tool)
The [Anthropic Memory Tool](https://platform.claude.com/docs/en/agents-and-tools/tool-use/memory-tool) gives Claude a structured interface for managing a `/memories` directory. Claude reads its memory before starting tasks, creates and updates files as it works, and references them in future conversations.
```
`
import { anthropic } from '@ai-sdk/anthropic';
import { ToolLoopAgent } from 'ai';
const memory = anthropic.tools.memory\_20250818({
execute: async action =\> {
// `action` contains `command`, `path`, and other fields
// depending on the command (view, create, str\_replace,
// insert, delete, rename).
// Implement your storage backend here.
// Return the result as a string.
},
});
const agent = new ToolLoopAgent({
model: 'anthropic/claude-haiku-4.5',
tools: { memory },
});
const result = await agent.generate({
prompt: 'Remember that my favorite editor is Neovim',
});
`
```
The tool receives structured commands (`view`, `create`, `str\_replace`, `insert`, `delete`, `rename`), each with a `path` scoped to `/memories`. Your `execute` function maps these to your storage backend (the filesystem, a database, or any other persistence layer).
**When to use this**: you want memory with minimal implementation effort and are already using Anthropic models. The tradeoff is provider lock-in, since this tool only works with Claude.
## [Memory Providers](#memory-providers)
Another approach is to use a provider that has memory built in. These providers wrap an external memory service and expose it through the AI SDK's standard interface. Memory storage, retrieval, and injection happen transparently, and you do not define any tools yourself.
### [Letta](#letta)
[Letta](https://letta.com) provides agents with persistent long-term memory. You create an agent on Letta's platform (cloud or self-hosted), configure its memory there, and use the AI SDK provider to interact with it. Letta's agent runtime handles memory management (core memory, archival memory, recall).
```
`
pnpm add @letta-ai/vercel-ai-sdk-provider
`
```
```
`
import { lettaCloud } from '@letta-ai/vercel-ai-sdk-provider';
import { ToolLoopAgent } from 'ai';
const agent = new ToolLoopAgent({
model: lettaCloud(),
providerOptions: {
letta: {
agent: { id: 'your-agent-id' },
},
},
});
const result = await agent.generate({
prompt: 'Remember that my favorite editor is Neovim',
});
`
```
You can also use Letta's built-in memory tools alongside custom tools:
```
`
import { lettaCloud } from '@letta-ai/vercel-ai-sdk-provider';
import { ToolLoopAgent } from 'ai';
const agent = new ToolLoopAgent({
model: lettaCloud(),
tools: {
core\_memory\_append: lettaCloud.tool('core\_memory\_append'),
memory\_insert: lettaCloud.tool('memory\_insert'),
memory\_replace: lettaCloud.tool('memory\_replace'),
},
providerOptions: {
letta: {
agent: { id: 'your-agent-id' },
},
},
});
const stream = agent.stream({
prompt: 'What do you remember about me?',
});
`
```
See the [Letta provider documentation](/providers/community-providers/letta) for full setup and configuration.
### [Mem0](#mem0)
[Mem0](https://mem0.ai) adds a memory layer on top of any supported LLM provider. It automatically extracts memories from conversations, stores them, and retrieves relevant ones for future prompts.
```
`
pnpm add @mem0/vercel-ai-provider
`
```
```
`
import { createMem0 } from '@mem0/vercel-ai-provider';
import { ToolLoopAgent } from 'ai';
const mem0 = createMem0({
provider: 'openai',
mem0ApiKey: process.env.MEM0\_API\_KEY,
apiKey: process.env.OPENAI\_API\_KEY,
});
const agent = new ToolLoopAgent({
model: mem0('gpt-4.1', { user\_id: 'user-123' }),
});
const { text } = await agent.generate({
prompt: 'Remember that my favorite editor is Neovim',
});
`
```
Mem0 works across multiple LLM providers (OpenAI, Anthropic, Google, Groq, Cohere). You can also manage memories explicitly:
```
`
import { addMemories, retrieveMemories } from '@mem0/vercel-ai-provider';
await addMemories(messages, { user\_id: 'user-123' });
const context = await retrieveMemories(prompt, { user\_id: 'user-123' });
`
```
See the [Mem0 provider documentation](/providers/community-providers/mem0) for full setup and configuration.
### [Supermemory](#supermemory)
[Supermemory](https://supermemory.ai) is a long-term memory platform that adds persistent, self-growing memory to your AI applications. It provides tools that handle saving and retrieving memories automatically through semantic search.
```
`
pnpm add @supermemory/tools
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { supermemoryTools } from '@supermemory/tools/ai-sdk';
import { ToolLoopAgent } from 'ai';
const agent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
tools: supermemoryTools(process.env.SUPERMEMORY\_API\_KEY!),
});
const result = await agent.generate({
prompt: 'Remember that my favorite editor is Neovim',
});
`
```
Supermemory works with any AI SDK provider. The tools give the model `addMemory` and `searchMemories` operations that handle storage and retrieval.
See the [Supermemory provider documentation](/providers/community-providers/supermemory) for full setup and configuration.
### [Hindsight](#hindsight)
[Hindsight](/providers/community-providers/hindsight) provides agents with persistent memory through five tools: `retain`, `recall`, `reflect`, `getMentalModel`, and `getDocument`. It can be self-hosted with Docker or used as a cloud service.
```
`
pnpm add @vectorize-io/hindsight-ai-sdk @vectorize-io/hindsight-client
`
```
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { HindsightClient } from '@vectorize-io/hindsight-client';
import { createHindsightTools } from '@vectorize-io/hindsight-ai-sdk';
import { ToolLoopAgent } from 'ai';
import { openai } from '@ai-sdk/openai';
const client = new HindsightClient({ baseUrl: process.env.HINDSIGHT\_API\_URL });
const agent = new ToolLoopAgent({
model: "anthropic/claude-sonnet-4.5",
tools: createHindsightTools({ client, bankId: 'user-123' }),
instructions: 'You are a helpful assistant with long-term memory.',
});
const result = await agent.generate({
prompt: 'Remember that my favorite editor is Neovim',
});
`
```
The `bankId` identifies the memory store and is typically a user ID. In multi-user apps, call `createHindsightTools` inside your request handler so each request gets the right bank. Hindsight works with any AI SDK provider.
See the [Hindsight provider documentation](/providers/community-providers/hindsight) for full setup and configuration.
**When to use memory providers**: these providers are a good fit when you want memory without building any storage infrastructure. The tradeoff is that the provider controls memory behavior, so you have less visibility into what gets stored and how it is retrieved. You also take on a dependency on an external service.
## [Custom Tool](#custom-tool)
Building your own memory tool from scratch is the most flexible approach. You control the storage format, the interface, and the retrieval logic. This requires the most upfront work but gives you full ownership of how memory works, with no provider lock-in and no external dependencies.
There are two common patterns:
* **Structured actions**: you define explicit operations (`view`, `create`, `update`, `search`) and handle structured input yourself. Safe by design since you control every operation.
* **Bash-backed**: you give the model a sandboxed bash environment to compose shell commands (`cat`, `grep`, `sed`, `echo`) for flexible memory access. More powerful but requires command validation for safety.
For a full walkthrough of implementing a custom memory tool with a bash-backed interface, AST-based command validation, and filesystem persistence, see the **[Build a Custom Memory Tool](/cookbook/guides/custom-memory-tool)** recipe.
On this page
[Memory](#memory)
[Three Approaches](#three-approaches)
[Provider-Defined Tools](#provider-defined-tools)
[Anthropic Memory Tool](#anthropic-memory-tool)
[Memory Providers](#memory-providers)
[Letta](#letta)
[Mem0](#mem0)
[Supermemory](#supermemory)
[Hindsight](#hindsight)
[Custom Tool](#custom-tool)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)