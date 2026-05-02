AI SDK by Vercel
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
AI SDK by Vercel
Copy markdown
# [AI SDK](#ai-sdk)
The AI SDK is the TypeScript toolkit designed to help developers build AI-powered applications and agents with React, Next.js, Vue, Svelte, Node.js, and more.
## [Why use the AI SDK?](#why-use-the-ai-sdk)
Integrating large language models (LLMs) into applications is complicated and heavily dependent on the specific model provider you use.
The AI SDK standardizes integrating artificial intelligence (AI) models across [supported providers](/docs/foundations/providers-and-models). This enables developers to focus on building great AI applications, not waste time on technical details.
For example, here’s how you can generate text with various models using the AI SDK:
Gateway
Provider
Custom
Claude Sonnet 4.5
```
`
import { generateText } from "ai";
const { text } = await generateText({
model: "anthropic/claude-sonnet-4.5",
prompt: "What is love?",
});
`
```
Love is a complex and multifaceted emotion that can be felt and expressed in many different ways. It involves deep affection, care, compassion, and connection towards another person or thing.
The AI SDK has two main libraries:
* **[AI SDK Core](/docs/ai-sdk-core):** A unified API for generating text, structured objects, tool calls, and building agents with LLMs.
* **[AI SDK UI](/docs/ai-sdk-ui):** A set of framework-agnostic hooks for quickly building chat and generative user interface.
## [Model Providers](#model-providers)
The AI SDK supports [multiple model providers](/providers).
[
Vercel AI Gateway
Image InputImage GenerationObject GenerationTool UsageTool Streaming
](/providers/ai-sdk-providers/ai-gateway)[
OpenAI
Image InputImage GenerationObject GenerationTool UsageTool Streaming
](/providers/ai-sdk-providers/openai)[
Anthropic
Image InputObject GenerationTool UsageTool Streaming
](/providers/ai-sdk-providers/anthropic)[
Google Generative AI
Image InputObject GenerationTool UsageTool Streaming
](/providers/ai-sdk-providers/google-generative-ai)[
xAI Grok
Image InputImage GenerationObject GenerationTool UsageTool Streaming
](/providers/ai-sdk-providers/xai)[
Azure
Image InputObject GenerationTool UsageTool Streaming
](/providers/ai-sdk-providers/azure)[
Amazon Bedrock
Image InputImage GenerationObject GenerationTool UsageTool Streaming
](/providers/ai-sdk-providers/amazon-bedrock)[
Groq
Image InputObject GenerationTool UsageTool Streaming
](/providers/ai-sdk-providers/groq)[
Fal AI
Image Generation
](/providers/ai-sdk-providers/fal)[
DeepInfra
Image InputObject GenerationTool UsageTool Streaming
](/providers/ai-sdk-providers/deepinfra)[
Google Vertex AI
Image InputImage GenerationObject GenerationTool UsageTool Streaming
](/providers/ai-sdk-providers/google-vertex)[
Mistral
Image InputObject GenerationTool UsageTool Streaming
](/providers/ai-sdk-providers/mistral)[
Together.ai
Object GenerationTool UsageTool Streaming
](/providers/ai-sdk-providers/togetherai)[
Cohere
Tool UsageTool Streaming
](/providers/ai-sdk-providers/cohere)[
Fireworks
Image GenerationObject GenerationTool UsageTool Streaming
](/providers/ai-sdk-providers/fireworks)[
DeepSeek
Object GenerationTool UsageTool Streaming
](/providers/ai-sdk-providers/deepseek)[
Cerebras
Object GenerationTool UsageTool Streaming
](/providers/ai-sdk-providers/cerebras)[
Perplexity
](/providers/ai-sdk-providers/perplexity)[
Luma AI
Image Generation
](/providers/ai-sdk-providers/luma)[
Baseten
Object GenerationTool Usage
](/providers/ai-sdk-providers/baseten)
## [Templates](#templates)
We've built some [templates](https://vercel.com/templates?type=ai) that include AI SDK integrations for different use cases, providers, and frameworks. You can use these templates to get started with your AI-powered application.
### [Starter Kits](#starter-kits)
[
Chatbot Starter Template
Uses the AI SDK and Next.js. Features persistence, multi-modal chat, and more.
](https://vercel.com/templates/next.js/nextjs-ai-chatbot)[
Internal Knowledge Base (RAG)
Uses AI SDK Language Model Middleware for RAG and enforcing guardrails.
](https://vercel.com/templates/next.js/ai-sdk-internal-knowledge-base)[
Multi-Modal Chat
Uses Next.js and AI SDK useChat hook for multi-modal message chat interface.
](https://vercel.com/templates/next.js/multi-modal-chatbot)[
Semantic Image Search
An AI semantic image search app template built with Next.js, AI SDK, and Postgres.
](https://vercel.com/templates/next.js/semantic-image-search)[
Natural Language PostgreSQL
Query PostgreSQL using natural language with AI SDK and GPT-4o.
](https://vercel.com/templates/next.js/natural-language-postgres)
### [Feature Exploration](#feature-exploration)
[
Feature Flags Example
AI SDK with Next.js, Feature Flags, and Edge Config for dynamic model switching.
](https://vercel.com/templates/next.js/ai-sdk-feature-flags-edge-config)[
Chatbot with Telemetry
AI SDK chatbot with OpenTelemetry support.
](https://vercel.com/templates/next.js/ai-chatbot-telemetry)[
Structured Object Streaming
Uses AI SDK useObject hook to stream structured object generation.
](https://vercel.com/templates/next.js/use-object)[
Multi-Step Tools
Uses AI SDK streamText function to handle multiple tool steps automatically.
](https://vercel.com/templates/next.js/ai-sdk-roundtrips)
### [Frameworks](#frameworks)
[
Next.js OpenAI Starter
Uses OpenAI GPT-4, AI SDK, and Next.js.
](https://github.com/vercel/ai/tree/main/examples/next-openai)[
Nuxt OpenAI Starter
Uses OpenAI GPT-4, AI SDK, and Nuxt.js.
](https://github.com/vercel/ai/tree/main/examples/nuxt-openai)[
SvelteKit OpenAI Starter
Uses OpenAI GPT-4, AI SDK, and SvelteKit.
](https://github.com/vercel/ai/tree/main/examples/sveltekit-openai)[
Solid OpenAI Starter
Uses OpenAI GPT-4, AI SDK, and Solid.
](https://github.com/vercel/ai/tree/main/examples/solidstart-openai)
### [Generative UI](#generative-ui)
[
Gemini Chatbot
Uses Google Gemini, AI SDK, and Next.js.
](https://vercel.com/templates/next.js/gemini-ai-chatbot)[
Generative UI with RSC (experimental)
Uses Next.js, AI SDK, and streamUI to create generative UIs with React Server Components.
](https://vercel.com/templates/next.js/rsc-genui)
### [Security](#security)
[
Bot Protection
Uses Kasada, OpenAI GPT-4, AI SDK, and Next.js.
](https://vercel.com/templates/next.js/advanced-ai-bot-protection)[
Rate Limiting
Uses Vercel KV, OpenAI GPT-4, AI SDK, and Next.js.
](https://github.com/vercel/ai/tree/main/examples/next-openai-upstash-rate-limits)
## [Join our Community](#join-our-community)
If you have questions about anything related to the AI SDK, you're always welcome to ask our community on [the Vercel Community](https://community.vercel.com/c/ai-sdk/62).
## [`llms.txt` (for Cursor, Windsurf, Copilot, Claude etc.)](#llmstxt-for-cursor-windsurf-copilot-claude-etc)
You can access the entire AI SDK documentation in Markdown format at [ai-sdk.dev/llms.txt](/llms.txt). This can be used to ask any LLM (assuming it has a big enough context window) questions about the AI SDK based on the most up-to-date documentation.
### [Example Usage](#example-usage)
For instance, to prompt an LLM with questions about the AI SDK:
1. Copy the documentation contents from [ai-sdk.dev/llms.txt](/llms.txt)
2. Use the following prompt format:
```
`
Documentation:
{paste documentation here}
---
Based on the above documentation, answer the following:
{your question}
`
```
On this page
[AI SDK](#ai-sdk)
[Why use the AI SDK?](#why-use-the-ai-sdk)
[Model Providers](#model-providers)
[Templates](#templates)
[Starter Kits](#starter-kits)
[Feature Exploration](#feature-exploration)
[Frameworks](#frameworks)
[Generative UI](#generative-ui)
[Security](#security)
[Join our Community](#join-our-community)
[llms.txt (for Cursor, Windsurf, Copilot, Claude etc.)](#llmstxt-for-cursor-windsurf-copilot-claude-etc)
[Example Usage](#example-usage)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)