Migration Guides: Versioning
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
# [Versioning](#versioning)
Each version number follows the format: `MAJOR.MINOR.PATCH`
* **Major**: Breaking API updates that require code changes.
* **Minor**: Blog post that aggregates new features and improvements into a public release that highlights benefits.
* **Patch**: New features and bug fixes.
## [API Stability](#api-stability)
We communicate the stability of our APIs as follows:
### [Stable APIs](#stable-apis)
All APIs without special prefixes are considered stable and ready for production use. We maintain backward compatibility for stable features and only introduce breaking changes in major releases.
### [Experimental APIs](#experimental-apis)
APIs prefixed with `experimental\_` or `Experimental\_` (e.g. `experimental\_generateImage()`) are in development and can change in any releases. To use experimental APIs safely:
1. Test them first in development, not production
2. Review release notes before upgrading
3. Prepare for potential code updates
If you use experimental APIs, make sure to pin your AI SDK version number
exactly (avoid using ^ or \~ version ranges) to prevent unexpected breaking
changes.
### [Deprecated APIs](#deprecated-apis)
APIs marked as `deprecated` will be removed in future major releases. You can wait until the major release to update your code. To handle deprecations:
1. Switch to the recommended alternative API
2. Follow the migration guide (released alongside major releases)
For major releases, we provide automated codemods where possible to help
migrate your code to the new version.
On this page
[Versioning](#versioning)
[API Stability](#api-stability)
[Stable APIs](#stable-apis)
[Experimental APIs](#experimental-apis)
[Deprecated APIs](#deprecated-apis)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)