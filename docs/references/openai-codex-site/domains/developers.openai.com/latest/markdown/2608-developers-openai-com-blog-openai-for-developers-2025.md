OpenAI for Developers in 2025
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
* [ All posts ](/blog)
### Recent
* [ How Perplexity Brought Voice Search to Millions Using the Realtime API ](/blog/realtime-perplexity-computer)
* [ Designing delightful frontends with GPT-5.4 ](/blog/designing-delightful-frontends-with-gpt-5-4)
* [ From prompts to products: One year of Responses ](/blog/one-year-of-responses)
* [ Using skills to accelerate OSS maintenance ](/blog/skills-agents-sdk)
* [ Building frontend UIs with Codex and Figma ](/blog/building-frontend-uis-with-codex-and-figma)
### Topics
* [ General ](/blog/topic/general)
* [ API ](/blog/topic/api)
* [ Apps SDK ](/blog/topic/apps-sdk)
* [ Audio ](/blog/topic/audio)
* [ Codex ](/blog/topic/codex)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Copy Page
2025 wasn’t about a single model launch–it was the year AI got easier to run in production. As models improved at planning, tool use, and longer-horizon tasks, more teams shifted from “prompting step-by-step” to delegating work to agents.
For developers, that shift showed up in a few concrete places:
* **Reasoning became a core dial** and increasingly converged with general-purpose chat models.
* **Multimodality (docs, audio, images, video)** became a first-class citizen in the API.
* **Agent building blocks** (Responses API, Agents SDK, AgentKit) made multi-step workflows easier to ship and operate.
* **Codex** made it possible to build faster and better than ever.
## TL;DR
* The big shift was **agent-native APIs** plus **better models** that can perform more complex tasks, requiring reasoning and tool use.
* Codex matured across both models and tooling, pairing GPT-5.2-Codex’s repo-scale reasoning with a production-ready CLI, web, and IDE workflows for long-horizon coding tasks.
* Improved tooling made it easier to connect models to real systems with fewer rough edges.
* Multimodal inputs and outputs (PDFs, images, audio, video) became a practical default in end-to-end workflows.
* Evals, graders, and tuning features matured into a more repeatable “measure -\> improve -\> ship” loop.
Read on for a roundup of major model, API, and platform updates in 2025, and learn how it can help you ship production-grade agents.
## Reasoning: from separate models to a unified line
After we first introduced the *reasoning* paradigm at the end of 2024, where we started giving models “time to think”, early 2025 was the era of *reasoning models* as a distinct family. Models like **o1**, **o3**, and **o4-mini** made it clear that spending extra compute to think before answering could dramatically improve reliability on complex, multi-step work.
It’s also worth calling out that **o3-mini** was one of the first signals that reasoning wouldn’t just be a frontier-only feature; it could be delivered in cost-efficient, developer-friendly form factors.
By mid-late 2025, the big trend was **convergence**: reasoning depth, tool use, and conversational quality increasingly lived inside the same flagship model line (for most teams, “pick a model” became more about cost/latency/quality tradeoffs than choosing between fundamentally different families).
Reasoning-first releases like [**o1**](https://platform.openai.com/docs/models/compare), [**o3 / o4-mini**](https://openai.com/index/introducing-o3-and-o4-mini), and [**o3-mini**](https://openai.com/research/openai-o3-mini) helped make “think harder vs. respond faster” a tunable developer decision. As the year progressed, those ideas were increasingly absorbed into the GPT-5.x family, unifying general intelligence, reasoning depth, coding specialization, and multimodality under a single model line.
## Multimodality: audio, vision, images, and video
By the end of 2025, *multimodal* stopped meaning “it can accept an image input” and started meaning “you can build an end-to-end product across modalities”—often in a single workflow.
### Audio + realtime
* [**Next-generation audio models**](https://openai.com/index/introducing-our-next-generation-audio-models) improved speech-to-text accuracy and added more controllable text-to-speech, supporting production-grade voice pipelines.
* The [**Realtime API**](https://developers.openai.com/blog/realtime-api) went GA and enabled low-latency, bidirectional audio streaming, making production-grade live voice agents and conversational interfaces viable.
### Images
* [**GPT Image 1**](https://platform.openai.com/docs/models/gpt-image-1) introduced a new generation of image generation models, producing high-quality images and structured edits with a strong understanding of the world and better instruction following.
* High input fidelity made it possible to preserve details like faces and logos more consistently when editing images.
* [**GPT Image 1 mini**](https://platform.openai.com/docs/models/gpt-image-1-mini) made native image generation more cost efficient.
* [**GPT Image 1.5**](https://openai.com/index/new-chatgpt-images-is-here/), our most advanced generation model, marked a step change in image quality and edit consistency.
* Image generation as a tool in the Responses API enabled image creation as part of multi-turn conversations, in combination with other tools.
### Video
* [**Sora 2 & Sora 2 Pro models**](https://platform.openai.com/docs/guides/video-generation#sora-2) introduced higher-fidelity video generation with stronger temporal coherence and remixing support.
* The [**Video API**](https://platform.openai.com/docs/api-reference/videos) exposed video generation and editing via `v1/videos`, making video a first-class modality in the API alongside text, images, and audio.
### PDFs and documents
* [**PDF inputs**](https://platform.openai.com/docs/guides/file-inputs) enabled document-heavy workflows directly in the API.
* [**PDF-by-URL**](https://platform.openai.com/docs/guides/file-inputs#file-urls) reduced friction by referencing documents without upload.
**Why it matters:** you can now rely on the OpenAI platform for not only text & vision but also your image and video generation workflows as well as speech-to-speech use cases.
## Codex
In 2025, Codex moved beyond being just a coding model and became your Software Engineer teammate: connecting models, local tooling, and cloud to help developers tackle longer, more complex coding tasks.
### Models
Early reasoning models demonstrated strong gains on complex coding tasks (multi-file edits, debugging, planning). By mid-late 2025, these capabilities were consolidated into the **GPT-5 family**, with [**GPT-5.2-Codex**](https://openai.com/index/introducing-gpt-5-2-codex/) becoming the latest default choice for code generation, review, and repo-scale reasoning—no longer separate from general-purpose models, but specialized within them.
### CLI
The open-source [**Codex CLI**](https://developers.openai.com/codex/cli) ([GitHub](https://github.com/openai/codex)) brought agent-style coding directly into local environments, enabling developers to run Codex over real repositories, iteratively review changes, and apply edits to files with human oversight. This made long-horizon coding tasks practical in day-to-day workflows.
Codex also became easier to operationalize beyond interactive use, with built-in support for repeatable automation patterns like [**scripting Codex**](https://developers.openai.com/codex/sdk#using-codex-cli-programmatically).
### Safety, control, and integrations
Codex leaned into the realities of shipping: [**sandboxing**](https://developers.openai.com/codex/sandbox) and [**approval modes**](https://developers.openai.com/codex/cli/features#approval-modes) made it easier to keep humans in the loop. At the same time, support for [**AGENTS.md**](https://developers.openai.com/codex/guides/agents-md) and [**MCP**](https://developers.openai.com/codex/mcp) made Codex easier to adapt to your repo, extend with third-party tools and context, and even [**orchestrate Codex via the Agents SDK**](https://developers.openai.com/codex/guides/agents-sdk) (by running the CLI as an MCP server).
### Web, cloud, and IDE
Beyond the CLI, Codex expanded support for longer sessions and iterative problem solving across the [**web + cloud**](https://developers.openai.com/codex/cloud) and the [**IDE extension**](https://developers.openai.com/codex/ide), tightening the loop between conversational reasoning and concrete code changes. Teams could also automate parts of the workflow with [**Codex Autofix**](https://developers.openai.com/codex/guides/autofix-ci) in CI.
**Why it matters:** by the end of 2025, Codex functioned less as “a model you prompt” and more as a coding surface–combining reasoning-capable models with tools developers already use.
## Platform shift: Responses API and agentic building blocks
One of the most important platform changes in 2025 was the move toward **agent-native APIs**.
The [**Responses API**](https://developers.openai.com/blog/responses-api) made it easier to build for the new generation of models:
* Support for multiple inputs and outputs, including different modalities
* Support for reasoning controls and summaries
* Better support for tool calling, including during reasoning
On top of that foundation, 2025 also brought higher-level building blocks like the open-source [**Agents SDK**](https://openai.github.io/openai-agents-python/) and [**AgentKit**](https://openai.com/index/introducing-agentkit/), making it easier to build and orchestrate agents.
State and persistence also became easier to manage:
* [**Conversation state**](https://platform.openai.com/docs/guides/conversation-state) (plus the [**Conversations API**](https://platform.openai.com/docs/api-reference/conversations/create-item)) for durable threads and replayable state
* [**Connectors and MCP servers**](https://platform.openai.com/docs/guides/tools-connectors-mcp) for incorporating external context and taking actions through trusted tool surfaces
**Why it matters**: building multi-step agents and long-running workflows now requires less custom glue code and state management.
Alongside strong primitives, we introduced a set of powerful built-in [**tools**](https://platform.openai.com/docs/guides/tools#available-tools) to maximize the utility of models.
## Tools: from web search to workflows
In 2025, we launched a set of standardized, composable capabilities that let agents do useful work safely.
* [**Web search**](https://platform.openai.com/docs/guides/tools-web-search) provided a simple retrieval primitive for agents that need up-to-date information and citations.
* [**File search**](https://platform.openai.com/docs/guides/tools-file-search/) (vector stores) provided a default hosted RAG primitive that composes cleanly with Responses + Structured Outputs.
* [**Code Interpreter**](https://platform.openai.com/docs/guides/tools-code-interpreter) ran Python in sandboxed containers for data work, file transforms, and iterative debugging.
* [**Computer use**](https://platform.openai.com/docs/guides/tools-computer-use) enabled “click/type/scroll” automation loops (best paired with sandboxing and human-in-the-loop).
**Why it matters:** agents can reliably retrieve, compute, and act without every team reinventing a custom tool runtime.
## Run and scale: async, events, and cost controls
Once agents moved from “single request” to “multi-step jobs,” production teams needed primitives for cost, latency, and reliability.
* [**Prompt caching**](https://platform.openai.com/docs/guides/prompt-caching) reduced latency and input costs when prompts share long, repeated prefixes (system prompts, tools, schemas).
* [**Background mode**](https://platform.openai.com/docs/guides/background) enabled long-running responses without holding a client connection open.
* [**Webhooks**](https://platform.openai.com/docs/guides/webhooks) turned “polling everything” into event-driven systems (batch completion, background completion, fine-tuning completion).
* [**Rate limits**](https://platform.openai.com/docs/guides/rate-limits) and workload optimization guidance matured as usage tiers and model families expanded.
**Why it matters:** building agents became as much about system design (async + events + budgets) as prompting.
## Open standards and open-source agent building blocks
Alongside API consolidation, 2025 emphasized **interoperability and composability** for agentic systems.
* The open-source **Agents SDK** for [**Python**](https://openai.github.io/openai-agents-python/) ([GitHub](https://github.com/openai/openai-agents-python)) and [**TypeScript**](https://openai.github.io/openai-agents-js/) ([GitHub](https://github.com/openai/openai-agents-js)) established practical building blocks for tool use, handoffs, guardrails, and tracing—and is **provider-agnostic**, with documented paths for using non-OpenAI models.
* [**AgentKit**](https://openai.com/index/introducing-agentkit/) added higher-level tooling around agent development (including Agent Builder, ChatKit, Connector Registry, and evaluation loops) for teams that want to ship and iterate faster.
* On the standards side, OpenAI pushed **AGENTS.md** ([spec](https://agents.md/)) and participated in the [**AAIF (Agentic AI Foundation)**](https://aaif.io/news/linux-foundation-announces-the-formation-of-the-agentic-ai-foundation-aaif-anchored-by-new-project-contributions-including-model-context-protocol-mcp-goose-and-agents-md/) alongside other ecosystem standards like [**Model Context Protocol (MCP)**](https://modelcontextprotocol.io/) and [**Skills**](https://developers.openai.com/codex/skills). The value for developers: more portable agent tooling and fewer one-off integrations as the ecosystem converges on shared conventions.
In addition to our work on agents and related standards, we introduced the [Apps SDK](/apps-sdk)—an open-source framework that extends the Model Context Protocol (MCP) to let developers build UIs alongside their MCP servers, defining both the logic and interactive interface of applications that can run in clients like ChatGPT.
**Why it matters**: developers can build agents that are less tightly coupled to a single runtime or UI surface, and more easily integrate OpenAI-powered agents into heterogeneous systems.
## Open-weight models
In addition to hosted APIs, OpenAI released **open-weight models** designed for transparency, research, and on-prem or self-hosted deployment while retaining strong reasoning and instruction-following capabilities.
* [**gpt-oss 120b & 20b**](https://huggingface.co/collections/openai/gpt-oss) reasoning models designed for self-hosting and on-prem deployments.
* [**gpt-oss-safeguard 120b & 20b**](https://huggingface.co/collections/openai/gpt-oss-safeguard) safety and policy models intended to run alongside gpt-oss.
## Evaluation, tuning, and shipping safely
* [**Evals API**](https://platform.openai.com/docs/api-reference/evals/getRun) for eval-driven development.
* [**Reinforcement fine-tuning (RFT)**](https://platform.openai.com/docs/guides/reinforcement-fine-tuning) using programmable graders.
* [**Supervised fine-tuning / distillation**](https://platform.openai.com/docs/guides/distillation) for pushing quality down into smaller, cheaper models once you’ve validated a task with a larger one.
* [**Graders**](https://platform.openai.com/docs/guides/graders) and the [**Prompt optimizer**](https://platform.openai.com/docs/guides/prompt-optimizer) helped teams run a tighter “eval → improve → re-eval” loop.
## Wrapping up
Throughout 2025, we focused on a few consistent themes aimed at making it easier for developers to build and ship on our platform:
* Scaled, controllable reasoning as a core capability
* A unified, agent-native API surface
* Open building blocks and emerging interoperability standards
* Deep multimodal support across text, images, audio, video, and documents
* Stronger production tooling for evaluation, tuning, and deployment
### Recommended models by task (end of 2025)
If you’re starting a new build or modernizing an integration, these are reasonable “default picks” for your task.
* **General-purpose (text + multimodal):** [**GPT-5.2**](https://openai.com/index/introducing-gpt-5-2/) for chat, long-context work, and multimodal inputs.
* **Deeper reasoning / reliability-sensitive workloads:** [**GPT-5.2 Pro**](https://platform.openai.com/docs/models/compare) for planning and tasks where quality is worth additional compute.
* **Coding and software engineering:** [**GPT-5.2-Codex**](https://platform.openai.com/docs/models/compare) for code generation, review, repo-scale reasoning, and tool-driven coding agents.
* **Image generation and editing:** [**GPT Image 1.5**](https://openai.com/index/new-chatgpt-images-is-here/) for higher-fidelity image generation and iterative edits.
* **Realtime voice:** [**gpt-realtime**](https://platform.openai.com/docs/guides/realtime) for low-latency speech-to-speech and live voice agents.
For up-to-date availability and tiering, see the official [**model comparison page**](https://platform.openai.com/docs/models/compare).
These updates set the foundation for what comes next. Thank you for building with us in 2025—we’re looking forward to what you’ll create in 2026.
## Links and resources
* [Prompt Optimizer](https://platform.openai.com/chat/edit?models=gpt-5&#38;optimize=true)
* [Model comparison](https://platform.openai.com/docs/models/compare) (current names, availability, and tiering)
* [Agents SDK (Python)](https://openai.github.io/openai-agents-python/) and [Agents SDK (TypeScript)](https://openai.github.io/openai-agents-js/)
* [Codex docs](https://developers.openai.com/codex/) and [Codex CLI GitHub](https://github.com/openai/codex)
* [Image Playground](https://platform.openai.com/playground/images)
* [Platform changelog](https://platform.openai.com/docs/changelog) (what shipped, when)