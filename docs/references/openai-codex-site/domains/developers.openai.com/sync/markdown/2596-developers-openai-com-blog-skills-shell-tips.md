Shell + Skills + Compaction: Tips for long-running agents that do real work | OpenAI Developers
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
We’re shifting from single-turn assistants to long-running agents that handle real knowledge work: reading large datasets, updating files, and writing apps.
Based on developer feedback and our own experience building Codex and internal agents, we’re releasing a new set of agentic primitives that make long-horizon work more practical:
* [**Skills**](/api/docs/guides/tools-skills) (aligned with the Agent Skills open standard): reusable, versioned instructions you can mount into containers so that agents can execute tasks more reliably.
* Upgraded [**shell**](/api/docs/guides/tools-shell) tool: an OpenAI hosted container with controlled internet access, where an agent can install dependencies, run scripts, and write outputs (for example, reports and artifacts).
* [**Server-side compaction**](/api/docs/guides/context-management): an easy way to automatically compact long agentic runs so that you never hit context limits.
The docs and API reference cover each item above individually. This post focuses on the nonobvious tips and patterns we’ve seen work best so far, both in our work at OpenAI and in production at Glean, an early skills customer.
## A brief mental model
### Skills: “Procedures” the model can load on demand
A skill is a bundle of files plus a `SKILL.md` manifest containing frontmatter and instructions. Think: a versioned playbook the model can consult when it’s time to do real work.
When skills are available, the platform exposes each skill’s `name`, `description`, and `path` to the model. The model uses that metadata to decide whether to invoke a skill. If it does, it reads `SKILL.md` for the full workflow.
### Shell tool: “Execution” for agents
The shell tool lets models work inside a real terminal environment, either:
* Hosted containers managed by OpenAI.
* A local shell runtime you execute yourself (same tool semantics, but you control the machine).
Hosted shell runs through the Responses API, which means your requests come with stateful work, tool calls, multi-turn continuation, and artifacts.
### Compaction: Keep long runs moving
As workflows get longer, they run into context window limits. Server-side compaction keeps long runs moving by managing the context window and compressing conversation history automatically.
Compaction in the Responses API gives you two ways to handle that:
* **Server-side compaction (new):** When context crosses the threshold, compaction runs automatically in-stream, so there’s no separate compaction call.
* **Standalone compact endpoint:** Use `/responses/compact` when you want explicit control over when compaction happens.
### Why they’re better together
* Skills reduce prompt spaghetti by moving stable procedures and examples into a reusable bundle.
* Shell provides a full execution environment, letting you install code, run scripts, and write outputs.
* Compaction preserves continuity on long runs, so the same workflow can keep executing without manual context surgery.
* Together, you get repeatable workflows with real execution, without turning your system prompt into a brittle megadoc.
## Tips and tricks
### 1) Write skill descriptions like routing logic (not marketing copy)
Your skill’s description is effectively the model’s decision boundary. It should answer:
* When should I use this?
* When should I not use this?
* What are the outputs and success criteria?
A practical pattern is to include a short “Use when vs. don’t use when” block directly in the description, and keep it concrete (inputs, tools involved, expected artifacts).
### 2) Add negative examples and edge cases to reduce misfires
A surprising failure mode is that making skills available can initially reduce correct triggering. One fix we’ve seen work is negative examples plus edge case coverage.
In practice, that means writing a few explicit “Don’t call this skill when…” cases (and what to do instead). This helps the model route more cleanly, especially when you have multiple skills that look similar at a glance.
Glean saw this directly: skill-based routing initially dropped triggering by about **20%** in targeted evals, then recovered after they added negative examples and edge case coverage in descriptions.
### 3) Put templates and examples inside the skill (they’re basically free when unused)
If you’ve been cramming templates into the system prompt, stop.
Templates and worked examples inside skills have two advantages:
* They’re available exactly when needed (when the skill is invoked).
* They don’t inflate tokens for unrelated queries.
This is especially effective for knowledge work outputs, like:
* Structured reports.
* Escalation triage summaries.
* Account plans.
* Data analysis writeups.
Glean reported that this pattern drove some of their biggest quality and latency gains in production because those examples are loaded only when the skill triggers.
### 4) Design for long runs early with container reuse and compaction
Long-horizon agents rarely succeed as one-shot prompts. Plan for continuity at the start:
* Reuse the same container across steps when you want stable dependencies, cached files, and intermediate outputs.
* Pass `previous\_response\_id` so the model can continue work in the same thread.
* Use compaction as a default long-run primitive, not an emergency fallback.
This combination reduces restart behavior and keeps multi-step jobs coherent as the thread grows.
### 5) When you need determinism, explicitly tell the model to use the skill
The default behavior is the model decides when to use a skill. That’s often what you want.
But when you’re running a production workflow with a clear contract (and you’d rather be deterministic than clever), just say:
“Use the `\<skill name\>` skill.”
This is the simplest reliability lever you can pull. It turns fuzzy routing into an explicit contract.
### 6) Treat skills plus networking as a high-risk combo (design for containment)
This is the security tip that’s easy to gloss over now and hard to fix later.
**Combining skills with open network access creates a high-risk path for data exfiltration.** If you use networking, keep network allowlists strict, assume tool output is untrusted, and avoid open internet plus powerful procedures in consumer-facing flows where users expect strong confirmation controls.
A strong default posture:
* Skills: **allowed**
* Shell: **allowed**
* Network: **enabled only with a minimal allowlist**, per request, for narrowly scoped tasks
### 7) Make `/mnt/data` your handoff boundary for artifacts
For hosted shell workflows, treat `/mnt/data` as the standard place to write outputs you’ll retrieve, review, or pass back into subsequent steps. Examples include reports, cleaned datasets, and finished spreadsheets.
A good mental model: tools write to disk, models reason over disk, developers retrieve from disk.
### 8) Understand allowlists as a two-layer system (org-level and request-level)
Networking is controlled in two places:
* An org-level allowlist (configured by an admin), which sets the maximum allowed destinations.
* A request-level `network\_policy` that must be a subset of the org allowlist.
Two implications that matter operationally:
1. Keep the org allowlist small and stable (the “approved destinations you trust” set).
2. Keep request allowlists even smaller (the “destinations needed for this one job” set).
If a request includes domains outside the org allowlist, it will error.
### 9) Use `domain\_secrets` for authenticated calls (avoid credential leakage)
If an allowed domain needs auth headers, use `domain\_secrets` so the model never sees raw credentials.
At runtime, the model sees placeholders (for example, `$API\_KEY`), and a sidecar injects the real values only for approved destinations. This is a strong default any time your agent needs to call a protected API from within a container.
### 10) Use the same APIs in the cloud and locally
You can use both primitives without committing to hosting everything:
* Skills work with hosted shell and local shell mode.
* Shell has a local execution mode where you execute `shell\_call` yourself and return `shell\_call\_output` back to the model.
* If you’re using the Agents SDK, you can also plug in your own shell executor.
A practical dev loop looks like:
1. Start local (fast iteration, access to internal tooling, easy debugging).
2. Move to hosted containers when you want repeatability, isolation, and deployment consistency.
3. Keep skills the same across both modes (the workflow stays stable even when execution moves).
## Three build patterns
While you should feel free to experiment with these new agentic primitives, here are three examples of how to combine them to build useful applications.
### Pattern A: Install -\> fetch -\> write artifact
This is the simplest way to benefit from hosted shell: an agent installs dependencies, fetches external data, and produces a concrete deliverable.
For example:
* Install a couple libraries.
* Scrape or call an API.
* Write a report to `/mnt/data/report.md`.
This pattern is the foundation for real-work agents because it creates a clean review boundary: your app can show the artifact to the user, log it, diff it, or feed it into a later step.
### Pattern B: Skills + shell for repeatable workflows
Once you’ve built one or two successful shell workflows, you’ll notice the next problem: this works, but reliability degrades when prompts drift.
That’s where skills come in. Here’s a durable structure to follow:
1. Encode the workflow (steps, guardrails, templates) in a skill.
2. Mount the skill into your shell environment.
3. Have the agent follow the skill to produce artifacts deterministically.
This is particularly effective for workflows like:
* Spreadsheet analysis or editing.
* Dataset cleaning plus summary generation.
* Standardized report generation for recurring business processes.
### Pattern C (advanced): Skills as enterprise workflow carriers
One early pattern we’ve seen is a loss of accuracy in the gap between single tool invocation and multi-tool orchestration. Skills can close that gap by making tool reasoning more procedural without bloating system prompts.
A concrete example from Glean:
* A Salesforce-oriented skill increased eval accuracy from **73% -\> 85%** and reduced **time-to-first-token** by **18.1%**.
* Practical tactics included careful routing, negative examples, and embedding templates/examples inside the skill.
* Glean also uses skills to encode recurring tasks within enterprise workflows, including account planning, escalation triage, and brand-aligned content generation.
This is the shape of where things get powerful. Skills become living SOPs (standard operating procedures): updated as your org evolves, and executed consistently by agents.
## Build once, run anywhere
Long-running agents get dramatically more useful when they can both follow procedures and do real work on a computer. Skills, hosted shell, and compaction create that foundation. To recap:
* Use skills to encode the how (procedures, templates, guardrails).
* Use shell to execute the do (install, run, write artifacts).
* Use compaction to keep long runs coherent (without hand-managing context).
* Start locally when you’re iterating quickly.
* Move to hosted containers when you want repeatable, isolated execution.
* Keep networking locked down with org-level and request-level allowlists, and use domain secrets for authenticated calls.
Get started in your own application. See the [skills docs](/api/docs/guides/tools-skills), [shell docs](/api/docs/guides/tools-shell), and [compaction docs](/api/docs/guides/context-management) to learn how.