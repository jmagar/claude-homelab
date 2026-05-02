Foundations: Providers and Models
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
# [Providers and Models](#providers-and-models)
Companies such as OpenAI and Anthropic (providers) offer access to a range of large language models (LLMs) with differing strengths and capabilities through their own APIs.
Each provider typically has its own unique method for interfacing with their models, complicating the process of switching providers and increasing the risk of vendor lock-in.
To solve these challenges, AI SDK Core offers a standardized approach to interacting with LLMs through a [language model specification](https://github.com/vercel/ai/tree/main/packages/provider/src/language-model/v3) that abstracts differences between providers. This unified interface allows you to switch between providers with ease while using the same API for all providers.
Here is an overview of the AI SDK Provider Architecture:
## [AI SDK Providers](#ai-sdk-providers)
The AI SDK comes with a wide range of providers that you can use to interact with different language models:
* [xAI Grok Provider](/providers/ai-sdk-providers/xai) (`@ai-sdk/xai`)
* [OpenAI Provider](/providers/ai-sdk-providers/openai) (`@ai-sdk/openai`)
* [Azure OpenAI Provider](/providers/ai-sdk-providers/azure) (`@ai-sdk/azure`)
* [Anthropic Provider](/providers/ai-sdk-providers/anthropic) (`@ai-sdk/anthropic`)
* [Amazon Bedrock Provider](/providers/ai-sdk-providers/amazon-bedrock) (`@ai-sdk/amazon-bedrock`)
* [Google Generative AI Provider](/providers/ai-sdk-providers/google-generative-ai) (`@ai-sdk/google`)
* [Google Vertex Provider](/providers/ai-sdk-providers/google-vertex) (`@ai-sdk/google-vertex`)
* [Mistral Provider](/providers/ai-sdk-providers/mistral) (`@ai-sdk/mistral`)
* [Together.ai Provider](/providers/ai-sdk-providers/togetherai) (`@ai-sdk/togetherai`)
* [Cohere Provider](/providers/ai-sdk-providers/cohere) (`@ai-sdk/cohere`)
* [Fireworks Provider](/providers/ai-sdk-providers/fireworks) (`@ai-sdk/fireworks`)
* [DeepInfra Provider](/providers/ai-sdk-providers/deepinfra) (`@ai-sdk/deepinfra`)
* [DeepSeek Provider](/providers/ai-sdk-providers/deepseek) (`@ai-sdk/deepseek`)
* [Cerebras Provider](/providers/ai-sdk-providers/cerebras) (`@ai-sdk/cerebras`)
* [Groq Provider](/providers/ai-sdk-providers/groq) (`@ai-sdk/groq`)
* [Perplexity Provider](/providers/ai-sdk-providers/perplexity) (`@ai-sdk/perplexity`)
* [ElevenLabs Provider](/providers/ai-sdk-providers/elevenlabs) (`@ai-sdk/elevenlabs`)
* [LMNT Provider](/providers/ai-sdk-providers/lmnt) (`@ai-sdk/lmnt`)
* [Hume Provider](/providers/ai-sdk-providers/hume) (`@ai-sdk/hume`)
* [Rev.ai Provider](/providers/ai-sdk-providers/revai) (`@ai-sdk/revai`)
* [Deepgram Provider](/providers/ai-sdk-providers/deepgram) (`@ai-sdk/deepgram`)
* [Gladia Provider](/providers/ai-sdk-providers/gladia) (`@ai-sdk/gladia`)
* [AssemblyAI Provider](/providers/ai-sdk-providers/assemblyai) (`@ai-sdk/assemblyai`)
* [Baseten Provider](/providers/ai-sdk-providers/baseten) (`@ai-sdk/baseten`)
You can also use the [OpenAI Compatible provider](/providers/openai-compatible-providers) with OpenAI-compatible APIs:
* [LM Studio](/providers/openai-compatible-providers/lmstudio)
* [Heroku](/providers/openai-compatible-providers/heroku)
Our [language model specification](https://github.com/vercel/ai/tree/main/packages/provider/src/language-model/v3) is published as an open-source package, which you can use to create [custom providers](/providers/community-providers/custom-providers).
The open-source community has created the following providers:
* [Ollama Provider](/providers/community-providers/ollama) (`ollama-ai-provider`)
* [FriendliAI Provider](/providers/community-providers/friendliai) (`@friendliai/ai-provider`)
* [Portkey Provider](/providers/community-providers/portkey) (`@portkey-ai/vercel-provider`)
* [Cloudflare Workers AI Provider](/providers/community-providers/cloudflare-workers-ai) (`workers-ai-provider`)
* [OpenRouter Provider](/providers/community-providers/openrouter) (`@openrouter/ai-sdk-provider`)
* [Apertis Provider](/providers/community-providers/apertis) (`@apertis/ai-sdk-provider`)
* [Aihubmix Provider](/providers/community-providers/aihubmix) (`@aihubmix/ai-sdk-provider`)
* [Requesty Provider](/providers/community-providers/requesty) (`@requesty/ai-sdk`)
* [Crosshatch Provider](/providers/community-providers/crosshatch) (`@crosshatch/ai-provider`)
* [Mixedbread Provider](/providers/community-providers/mixedbread) (`mixedbread-ai-provider`)
* [Voyage AI Provider](/providers/community-providers/voyage-ai) (`voyage-ai-provider`)
* [Mem0 Provider](/providers/community-providers/mem0) (`@mem0/vercel-ai-provider`)
* [Letta Provider](/providers/community-providers/letta) (`@letta-ai/vercel-ai-sdk-provider`)
* [Hindsight Provider](/providers/community-providers/hindsight) (`@vectorize-io/hindsight-ai-sdk`)
* [Supermemory Provider](/providers/community-providers/supermemory) (`@supermemory/tools`)
* [Spark Provider](/providers/community-providers/spark) (`spark-ai-provider`)
* [AnthropicVertex Provider](/providers/community-providers/anthropic-vertex-ai) (`anthropic-vertex-ai`)
* [LangDB Provider](/providers/community-providers/langdb) (`@langdb/vercel-provider`)
* [Dify Provider](/providers/community-providers/dify) (`dify-ai-provider`)
* [Sarvam Provider](/providers/community-providers/sarvam) (`sarvam-ai-provider`)
* [Claude Code Provider](/providers/community-providers/claude-code) (`ai-sdk-provider-claude-code`)
* [Browser AI Provider](/providers/community-providers/browser-ai) (`browser-ai`)
* [Gemini CLI Provider](/providers/community-providers/gemini-cli) (`ai-sdk-provider-gemini-cli`)
* [A2A Provider](/providers/community-providers/a2a) (`a2a-ai-provider`)
* [SAP-AI Provider](/providers/community-providers/sap-ai) (`@mymediset/sap-ai-provider`)
* [AI/ML API Provider](/providers/community-providers/aimlapi) (`@ai-ml.api/aimlapi-vercel-ai`)
* [MCP Sampling Provider](/providers/community-providers/mcp-sampling) (`@mcpc-tech/mcp-sampling-ai-provider`)
* [ACP Provider](/providers/community-providers/acp) (`@mcpc-tech/acp-ai-provider`)
* [OpenCode Provider](/providers/community-providers/opencode-sdk) (`ai-sdk-provider-opencode-sdk`)
* [Codex CLI Provider](/providers/community-providers/codex-cli) (`ai-sdk-provider-codex-cli`)
* [Soniox Provider](/providers/community-providers/soniox) (`@soniox/vercel-ai-sdk-provider`)
* [Zhipu (Z.AI) Provider](/providers/community-providers/zhipu) (`zhipu-ai-provider`)
* [OLLM Provider](/providers/community-providers/ollm) (`@ofoundation/ollm`)
* [ZeroEntropy Provider](/providers/community-providers/zeroentropy) (`zeroentropy-ai-provider`)
## [Self-Hosted Models](#self-hosted-models)
You can access self-hosted models with the following providers:
* [Ollama Provider](/providers/community-providers/ollama)
* [LM Studio](/providers/openai-compatible-providers/lmstudio)
* [Baseten](/providers/ai-sdk-providers/baseten)
* [Browser AI](/providers/community-providers/browser-ai)
Additionally, any self-hosted provider that supports the OpenAI specification can be used with the [OpenAI Compatible Provider](/providers/openai-compatible-providers).
## [Model Capabilities](#model-capabilities)
The AI providers support different language models with various capabilities.
Here are the capabilities of popular models:
|Provider|Model|Image Input|Object Generation|Tool Usage|Tool Streaming|
|[xAI Grok](/providers/ai-sdk-providers/xai)|`grok-4`|||||
|[xAI Grok](/providers/ai-sdk-providers/xai)|`grok-3`|||||
|[xAI Grok](/providers/ai-sdk-providers/xai)|`grok-3-mini`|||||
|[Vercel](/providers/ai-sdk-providers/vercel)|`v0-1.0-md`|||||
|[OpenAI](/providers/ai-sdk-providers/openai)|`gpt-5.4-pro`|||||
|[OpenAI](/providers/ai-sdk-providers/openai)|`gpt-5.4`|||||
|[OpenAI](/providers/ai-sdk-providers/openai)|`gpt-5.4-mini`|||||
|[OpenAI](/providers/ai-sdk-providers/openai)|`gpt-5.4-nano`|||||
|[OpenAI](/providers/ai-sdk-providers/openai)|`gpt-5.3-chat-latest`|||||
|[OpenAI](/providers/ai-sdk-providers/openai)|`gpt-5.2-pro`|||||
|[OpenAI](/providers/ai-sdk-providers/openai)|`gpt-5.2-chat-latest`|||||
|[OpenAI](/providers/ai-sdk-providers/openai)|`gpt-5.2`|||||
|[OpenAI](/providers/ai-sdk-providers/openai)|`gpt-5`|||||
|[OpenAI](/providers/ai-sdk-providers/openai)|`gpt-5-mini`|||||
|[OpenAI](/providers/ai-sdk-providers/openai)|`gpt-5-nano`|||||
|[OpenAI](/providers/ai-sdk-providers/openai)|`gpt-5.1-chat-latest`|||||
|[OpenAI](/providers/ai-sdk-providers/openai)|`gpt-5.1-codex-mini`|||||
|[OpenAI](/providers/ai-sdk-providers/openai)|`gpt-5.1-codex`|||||
|[OpenAI](/providers/ai-sdk-providers/openai)|`gpt-5.1`|||||
|[OpenAI](/providers/ai-sdk-providers/openai)|`gpt-5-codex`|||||
|[OpenAI](/providers/ai-sdk-providers/openai)|`gpt-5-chat-latest`|||||
|[Anthropic](/providers/ai-sdk-providers/anthropic)|`claude-opus-4-7`|||||
|[Anthropic](/providers/ai-sdk-providers/anthropic)|`claude-opus-4-6`|||||
|[Anthropic](/providers/ai-sdk-providers/anthropic)|`claude-sonnet-4-6`|||||
|[Anthropic](/providers/ai-sdk-providers/anthropic)|`claude-opus-4-5`|||||
|[Anthropic](/providers/ai-sdk-providers/anthropic)|`claude-opus-4-1`|||||
|[Anthropic](/providers/ai-sdk-providers/anthropic)|`claude-opus-4-0`|||||
|[Anthropic](/providers/ai-sdk-providers/anthropic)|`claude-sonnet-4-0`|||||
|[Mistral](/providers/ai-sdk-providers/mistral)|`pixtral-large-latest`|||||
|[Mistral](/providers/ai-sdk-providers/mistral)|`mistral-large-latest`|||||
|[Mistral](/providers/ai-sdk-providers/mistral)|`mistral-medium-latest`|||||
|[Mistral](/providers/ai-sdk-providers/mistral)|`mistral-medium-2505`|||||
|[Mistral](/providers/ai-sdk-providers/mistral)|`mistral-small-latest`|||||
|[Mistral](/providers/ai-sdk-providers/mistral)|`pixtral-12b-2409`|||||
|[DeepSeek](/providers/ai-sdk-providers/deepseek)|`deepseek-chat`|||||
|[DeepSeek](/providers/ai-sdk-providers/deepseek)|`deepseek-reasoner`|||||
|[Cerebras](/providers/ai-sdk-providers/cerebras)|`llama3.1-8b`|||||
|[Cerebras](/providers/ai-sdk-providers/cerebras)|`llama3.1-70b`|||||
|[Cerebras](/providers/ai-sdk-providers/cerebras)|`llama3.3-70b`|||||
|[Groq](/providers/ai-sdk-providers/groq)|`meta-llama/llama-4-scout-17b-16e-instruct`|||||
|[Groq](/providers/ai-sdk-providers/groq)|`llama-3.3-70b-versatile`|||||
|[Groq](/providers/ai-sdk-providers/groq)|`llama-3.1-8b-instant`|||||
|[Groq](/providers/ai-sdk-providers/groq)|`mixtral-8x7b-32768`|||||
|[Groq](/providers/ai-sdk-providers/groq)|`gemma2-9b-it`|||||
This table is not exhaustive. Additional models can be found in the provider
documentation pages and on the provider websites.
On this page
[Providers and Models](#providers-and-models)
[AI SDK Providers](#ai-sdk-providers)
[Self-Hosted Models](#self-hosted-models)
[Model Capabilities](#model-capabilities)
Deploy and Scale AI Apps with Vercel
Deliver AI experiences globally with one push.
Trusted by industry leaders:
*
*
*
*
[Sign Up](https://vercel.com/signup?utm_source=ai-sdk_site&amp;utm_medium=docs_card&amp;utm_content=sign-up)