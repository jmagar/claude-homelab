Advanced: Sequential Generations
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
[Prompt Engineering](/docs/advanced/prompt-engineering)
[Stopping Streams](/docs/advanced/stopping-streams)
[Backpressure](/docs/advanced/backpressure)
[Caching](/docs/advanced/caching)
[Multiple Streamables](/docs/advanced/multiple-streamables)
[Rate Limiting](/docs/advanced/rate-limiting)
[Rendering UI with Language Models](/docs/advanced/rendering-ui-with-language-models)
[Language Models as Routers](/docs/advanced/model-as-router)
[Multistep Interfaces](/docs/advanced/multistep-interfaces)
[Sequential Generations](/docs/advanced/sequential-generations)
[Vercel Deployment Guide](/docs/advanced/vercel-deployment-guide)
[Reference](/docs/reference)
[AI SDK Core](/docs/reference/ai-sdk-core)
[AI SDK UI](/docs/reference/ai-sdk-ui)
[AI SDK RSC](/docs/reference/ai-sdk-rsc)
[AI SDK Errors](/docs/reference/ai-sdk-errors)
[Migration Guides](/docs/migration-guides)
[Troubleshooting](/docs/troubleshooting)
Copy markdown
# [Sequential Generations](#sequential-generations)
When working with the AI SDK, you may want to create sequences of generations (often referred to as "chains" or "pipes"), where the output of one becomes the input for the next. This can be useful for creating more complex AI-powered workflows or for breaking down larger tasks into smaller, more manageable steps.
## [Example](#example)
In a sequential chain, the output of one generation is directly used as input for the next generation. This allows you to create a series of dependent generations, where each step builds upon the previous one.
Here's an example of how you can implement sequential actions:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText } from 'ai';
async function sequentialActions() {
// Generate blog post ideas
const ideasGeneration = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: 'Generate 10 ideas for a blog post about making spaghetti.',
});
console.log('Generated Ideas:\\n', ideasGeneration);
// Pick the best idea
const bestIdeaGeneration = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: `Here are some blog post ideas about making spaghetti:
${ideasGeneration}
Pick the best idea from the list above and explain why it's the best.`,
});
console.log('\\nBest Idea:\\n', bestIdeaGeneration);
// Generate an outline
const outlineGeneration = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: `We've chosen the following blog post idea about making spaghetti:
${bestIdeaGeneration}
Create a detailed outline for a blog post based on this idea.`,
});
console.log('\\nBlog Post Outline:\\n', outlineGeneration);
}
sequentialActions().catch(console.error);
`
```
In this example, we first generate ideas for a blog post, then pick the best idea, and finally create an outline based on that idea. Each step uses the output from the previous step as input for the next generation.
On this page
[Sequential Generations](#sequential-generations)
[Example](#example)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)