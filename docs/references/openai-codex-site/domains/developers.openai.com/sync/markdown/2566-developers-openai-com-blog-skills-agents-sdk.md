Using skills to accelerate OSS maintenance | OpenAI Developers
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
We use Codex to change how we maintain the [OpenAI Agents SDK](/api/docs/guides/agents) repos. Repo-local skills, `AGENTS.md`, and GitHub Actions let us turn recurring engineering work, such as verification, release preparation, integration testing for examples, and PR review, into repeatable workflows. Even with a fairly simple setup, this has helped us increase development throughput in these active repos. Between December 1, 2025 and February 28, 2026, the two repos merged 457 PRs, up from 316 in the previous three months from September 1, 2025 through November 30, 2025 (Python: 182 -\> 226, TypeScript: 134 -\> 231).
For quick background, the SDK is available in [Python](https://github.com/openai/openai-agents-python) and [TypeScript](https://github.com/openai/openai-agents-js). It provides the core pieces for building agentic applications and is also a concise way to build voice agents on top of the [Realtime API](/api/docs/guides/realtime) with multiple agents, tools, and human-in-the-loop controls. It is used at significant scale: in recent 30-day windows as of March 6, 2026, the Python package saw about 14.7 million downloads on PyPI, and the TypeScript package saw about 1.5 million downloads on npm.
The setup is simple:
* repository policy in [`AGENTS.md`](https://agents.md/)
* repo-local skills in `.agents/skills/`
* optional scripts and references inside those skills
* [Codex GitHub Action](/codex/github-action) when the same workflow should run in CI
This setup gives Codex stable context about how the repository works, which improves the speed and accuracy of recurring engineering work.
If you maintain a public open-source project, see [Codex for
OSS](/community/codex-for-oss). Eligible maintainers can apply for ChatGPT Pro
with Codex, API credits, and conditional access to Codex Security.
## Keep workflows in the repo
In these repos, we use skills to capture repository-specific workflows. A skill is a small package of operational knowledge: a `SKILL.md` manifest, plus optional `scripts/`, `references/`, and `assets/`. The [Codex customization docs](/codex/concepts/customization#skills) describe why this works well: skills are a good fit for repeatable workflows because they can carry richer instructions, scripts, and references without bloating the agent’s context up front.
This matches the progressive-disclosure model used by skills:
* it sees metadata such as `name` and `description` first
* it loads `SKILL.md` only when the skill is selected
* it reads references or runs scripts only when needed
Both SDK repos keep these workflows close to the code:
* [.agents/skills in openai-agents-python](https://github.com/openai/openai-agents-python/tree/main/.agents/skills)
* [.agents/skills in openai-agents-js](https://github.com/openai/openai-agents-js/tree/main/.agents/skills)
The Python repo is the simpler baseline:
* `code-change-verification` runs the required formatting, lint, type-checking, and test stack when code or build behavior changes.
* `docs-sync` audits the docs against the codebase and finds missing, incorrect, or outdated documentation.
* `examples-auto-run` runs examples in auto mode with logs and rerun helpers.
* `final-release-review` compares the previous release tag with the current release candidate and checks release readiness.
* `implementation-strategy` decides the compatibility boundary and implementation approach before editing runtime or API changes.
* `openai-knowledge` pulls current OpenAI API and platform docs through the official Docs MCP workflow.
* `pr-draft-summary` prepares the branch name suggestion, PR title, and draft description at handoff time.
* `test-coverage-improver` runs coverage, finds the biggest gaps, and proposes high-impact tests.
The JavaScript repo follows the same general pattern, then adds a few repo-specific skills for its npm monorepo and release process:
* `changeset-validation` checks that changesets and bump levels actually match the package diff.
* `integration-tests` publishes packages to a local Verdaccio registry and verifies install-and-run behavior across supported runtimes.
* `pnpm-upgrade` updates the pnpm toolchain and CI pins in a coordinated way.
What matters more than the exact list is the pattern. Each skill has a narrow contract, a clear trigger, and a concrete output.
Some of the most useful skills are not hard gates. `docs-sync` and `test-coverage-improver` are report-first workflows: they inspect the current diff or coverage artifacts, prioritize what matters, and ask for approval before making edits. In the Python repo, `docs-sync` also treats source docstrings and comments as the source of truth for generated reference docs instead of patching generated output by hand. The JavaScript-only `pnpm-upgrade` skill is another good example of a narrow maintenance workflow: it updates the local pnpm version, `packageManager`, and workflow pins together instead of falling back to broad search-and-replace.
## Make workflows mandatory
Skills become more useful when the repository requires them at the right time. That is where `AGENTS.md` comes in.
The [AGENTS.md guide](/codex/guides/agents-md#layer-project-instructions) describes these files as repository-level instructions that travel with the codebase and apply before the agent starts work. It also recommends keeping them small. In the Agents SDK repos, we use that space for the rules Codex should follow every time, and we put the highest-value ones near the top.
In practice, both repos use short if/then rules for mandatory skill usage. Before editing runtime or API changes, call `$implementation-strategy` to decide the compatibility boundary and implementation approach first. If the change affects SDK code, tests, examples, or build behavior, call `$code-change-verification`. If a JavaScript package change affects release metadata, call `$changeset-validation`. If the work touches OpenAI API or platform integrations, call `$openai-knowledge`. When the work is finished and ready to hand off, call `$pr-draft-summary`.
That structure also lines up with the [agents.md](https://agents.md/) recommendations: keep the project overview, build and test commands, code style, testing guidance, security considerations, and other repo-specific rules in one place. The Agents SDK repos follow that shape, but they lead with the operational triggers that matter most in day-to-day work. A compact version looks like this:
```
`# AGENTS.md
## Project overview
- Core SDK code lives under `src/agents/` or `packages/\*/src/`.
- Tests live under `tests/` or `packages/\*/test/`.
- Sample apps and integration surfaces live under `examples/`.
## Mandatory skill usage
- Use `$implementation-strategy` before editing runtime or API changes that may affect compatibility boundaries.
- Run `$code-change-verification` when runtime code, tests, examples, or build/test behavior changes.
- Use `$openai-knowledge` for OpenAI API or platform work.
- Use `$pr-draft-summary` when substantial code work is ready for review.
## Build and test commands
- Python: `make format`, `make lint`, `make typecheck`, `make tests`
- TypeScript: `pnpm i`, `pnpm build`, `pnpm -r build-check`, `pnpm lint`, `pnpm test`
## Compatibility rules
- Preserve positional compatibility for public constructors and dataclass fields.`
```
The real files then add repo-specific details on top of that baseline, such as `$changeset-validation` in the JavaScript repo and the more detailed runtime, docs, and release guidance in both files. If you want full examples, see [AGENTS.md in openai-agents-python](https://github.com/openai/openai-agents-python/blob/main/AGENTS.md) and [AGENTS.md in openai-agents-js](https://github.com/openai/openai-agents-js/blob/main/AGENTS.md).
`AGENTS.md` is not only for skill triggers. The Python repo also records a public API compatibility rule there: preserve the positional meaning of exported constructor parameters and dataclass fields, append new optional ones at the end when possible, and add compatibility tests if reordering is unavoidable. That is another good pattern: keep release-critical compatibility rules in the same place as the skill triggers.
### Verification rules
One clear example is `$code-change-verification`.
In both repos, the rule is not “always run a long validation stack.” The rule is “run it when runtime code, tests, examples, or build/test behavior changed, and do not mark the work complete until it passes.”
The conditional part keeps docs-only work lightweight. The mandatory part ensures that SDK code changes go through the repository’s standard verification steps.
The actual verification stacks are encoded in the skills themselves.
In the Python repo, it requires:
```
`make format
make lint
make typecheck
make tests`
```
In the JavaScript repo, the skill requires this exact order:
```
`pnpm i
pnpm build
pnpm -r build-check
pnpm -r -F "@openai/\*" dist:check
pnpm lint
pnpm test`
```
The skill encodes the repository’s definition of “verified,” and `AGENTS.md` makes that definition enforceable.
### Changeset validation
The JavaScript repo has one more mandatory step for package changes: `$changeset-validation`, built around [Changesets](https://github.com/changesets/changesets).
When anything under `packages/` changes, or when `.changeset/` changes, the model has to do more than just run tests. It has to create or update the right changeset, validate the bump level, and confirm that the changeset actually matches the diff.
This skill does more than check that a file exists. It asks Codex to judge the git diff, and it keeps the validation rules in a shared prompt so local runs and GitHub Actions use the same logic. It also encodes repo-specific policy, such as:
* use the existing branch changeset instead of creating another one when one already exists
* keep the summary to one line in Conventional Commit style so it can double as a commit title
* before 1.0, avoid major bumps for normal feature work, and treat explicitly labeled preview-only additions as patch changes if they do not change existing behavior
* validate the required bump level against the actual package changes
That makes Codex responsible for validating the release metadata it creates before it can say the work is done.
### Use current docs
Both repos also require `$openai-knowledge` when work touches OpenAI API or platform integrations.
That skill is a thin wrapper around the official [OpenAI Docs MCP](https://developers.openai.com/learn/docs-mcp). Instead of letting the model answer from memory, it tells Codex to use the OpenAI Developer Documentation MCP server to look up the current docs for surfaces such as the Responses API, tools, streaming, Realtime, and MCP.
If the MCP server is not already configured in the local Codex environment, the skill points maintainers to the [Docs MCP quickstart](https://developers.openai.com/learn/docs-mcp#quickstart) and the [official MCP server endpoint](https://developers.openai.com/mcp).
### Prepare the PR handoff
At the end of substantive work, both repos use `$pr-draft-summary`.
That skill triggers only when the task is effectively finished or ready for review and the change touched meaningful code, tests, examples, docs with behavior impact, or build/test configuration. It then collects the branch name, working tree status, changed files, diff stats, and recent commits automatically, and produces:
* a branch name suggestion
* a PR title
* a draft PR description
The output format is intentionally rigid. A typical result looks like this:
```
`# Pull Request Draft
## Branch name suggestion
git checkout -b fix/tracing-lazy-init-fork-safety
## Title
fix: #2489 lazily initialize tracing globals to avoid import-time fork hazards
## Description
This pull request fixes import-time tracing side effects that could break fork-based process models by moving tracing bootstrap to lazy, first-use initialization.
It updates tracing setup so initialization happens once on first access while preserving the existing public tracing APIs.
It also adds regression tests for import-time behavior, one-time bootstrap, and custom provider handling.
This pull request resolves #2489.`
```
Once you trust the model to validate and summarize its own work, asking it to produce the PR draft is a natural last step. It keeps the handoff consistent and reduces repetitive writing after the coding work is already complete.
## Write better descriptions
The `description` field in a skill’s `SKILL.md` frontmatter is part of the routing contract.
This is structural, not stylistic. The [Agent Skills specification](https://agentskills.io/specification) makes `name` and `description` the required `SKILL.md` frontmatter fields, and its progressive-disclosure model says those fields are what get loaded at startup for all skills. The full `SKILL.md` body and any `scripts/`, `references/`, or `assets/` are loaded only later, when the skill is actually activated.
The [Codex skills docs](/codex/skills) and [customization docs](/codex/concepts/customization#skills) describe the same behavior from the Codex side: Codex starts with each skill’s metadata for discovery, loads `SKILL.md` only when it chooses the skill, and reads references or runs scripts only when needed. The [Skills in OpenAI API cookbook](https://developers.openai.com/cookbook/examples/skills_in_api/#what-is-a-skill) describes the hosted-shell side just as explicitly: OpenAI reads each skill’s `name`, `description`, and path first, and the model uses that information to decide when to read the full `SKILL.md`. Its [SKILL.md frontmatter section](https://developers.openai.com/cookbook/examples/skills_in_api/#skillmd-frontmatter) makes the same point more directly: `name` and `description` are important for discovery and routing.
In the Agents SDK repos, that makes `description` one of the main routing signals before Codex has read the rest of the skill.
Here is a concrete example from `code-change-verification`.
Too vague:
```
`description: Run the mandatory verification stack in the OpenAI Agents JS monorepo.`
```
Better (the actual description):
```
`description: Run the mandatory verification stack when changes affect runtime code, tests, or build/test behavior in the OpenAI Agents JS monorepo.`
```
The shorter version already tells Codex what the skill does, but it still does not say when the skill applies, what kinds of changes should trigger it, or whether the checks are optional. The more specific version tells the model all three.
The same pattern shows up in `pr-draft-summary`.
Too vague:
```
`description: Create a PR title and draft description for a pull request.`
```
Better (the actual description):
```
`description: Create a PR title and draft description after substantive code changes are finished. Trigger when wrapping up a moderate-or-larger change (runtime code, tests, build config, docs with behavior impact) and you need the PR-ready summary block with change summary plus PR draft text.`
```
Again, the real description is routing metadata. It tells Codex:
* this is an end-of-task skill
* it is for substantive changes, not every chat turn
* the output is a PR-ready block, not just a prose summary
One practical lesson from these repos is to spend time on `description`. If routing feels unreliable, fix the metadata before you add more code.
## Put mechanics in scripts
After that, the next question is what belongs in the model and what should be pushed down into a script.
A reliable split is:
* interpretation, comparison, and reporting stay with the model
* deterministic, repeated shell work goes in `scripts/`
This matches the public guidance. The [Codex customization docs](/codex/concepts/customization#skills) describe skills as a way to give Codex richer instructions, scripts, and references for repeatable workflows without bloating context up front. That fits a model-first setup: let Codex handle the context-dependent parts of the job, and bring in scripts for the deterministic parts only when needed. The [Skills in OpenAI API cookbook](https://developers.openai.com/cookbook/examples/skills_in_api/#operational-best-practices) also recommends designing skill scripts like tiny CLIs: scripts that run from the command line, print deterministic stdout, fail loudly with usage or error messages, and write outputs to known file paths when needed.
In the Agents SDK repos, we try to use the model where its intelligence is actually useful, for example:
* reading source code to infer intended behavior
* comparing logs with that intended behavior
* deciding whether a release diff contains a real compatibility risk
* producing an explanation that a maintainer can act on
Scripts then handle the mechanics around that work, for example:
* running the repository’s required verification commands in a fixed order
* starting example runs, collecting per-example logs, and writing rerun files for failures
* fetching the previous release tag before a release-readiness review
* exposing helper commands such as `start`, `stop`, `status`, `logs`, `tail`, `collect`, and `rerun` so the same workflow is easy to run repeatedly
If the model has to rediscover the same shell recipe every time, that is usually a sign that the recipe should be a script. If the task depends on context, tradeoffs, or explanation, that part should stay with the model.
## Automate integration tests
One of the most useful workflow areas in both repos is automated integration testing. There are two related layers here: validating in-repo examples automatically in both repos, and, in the JavaScript repo, separately validating that published packages still work when installed the way users consume them.
Before this setup, validating examples was partly manual. You could run the examples, but the last mile often depended on visually checking logs or deciding by inspection whether the output looked right. That is manageable for one example. It does not scale well across a growing SDK repository.
The first layer is `examples-auto-run`, but the skill came after the runner. To automate example validation at all, we first had to build the underlying support for non-interactive example execution in both repos. That meant making it possible to run example scripts in an auto mode, including examples that normally involve prompts or approvals.
That groundwork included:
* auto-answering common interactive prompts
* auto-approving HITL, MCP, `apply\_patch`, and shell actions where the runner supports them
* keeping examples that are still not suitable for automation on an auto-skip list, such as realtime or Next.js app examples that need extra runtime setup
* writing structured logs for each example run
* generating rerun files so failures can be retried without rerunning everything
Once that foundation was in place, we organized it as a skill so the workflow became reusable and easy to invoke. In the Python repo, `examples-auto-run` wraps `uv run examples/run\_examples.py --auto-mode --write-rerun --main-log ... --logs-dir ...`. In the JavaScript repo, it wraps the build checks and then runs `pnpm examples:start-all` in auto mode with per-example logging and rerun support.
To improve validation quality, the runner’s job is to execute the examples and preserve their stdout and stderr in per-example logs. The skill then has Codex go through those logs one by one and compare them with the source code:
* read the example source and comments
* infer the intended flow
* open the matching log
* compare intended behavior with actual stdout and stderr
* do that for every successful example, not just one sample
This is more accurate and more flexible than trying to encode correctness as a fixed script-level assertion. A successful exit code is useful, but it is not enough for examples that talk to real APIs, use tools, or produce structured output. By recording the actual output first and then checking it carefully against the source code, we can validate each example according to its real intent.
In the JavaScript repo, there is then a second layer: the separate `integration-tests` skill. That workflow goes beyond running source examples in-place. It publishes the packages to a local Verdaccio registry and tests installing and running them in multiple environments, including Node.js, Bun, Deno, Cloudflare Workers, and a Vite React app. This catches a different class of problems: not “does the example run in the repo?” but “does the package still behave correctly after publish, install, and runtime integration?”
Taken together, these workflows show why it is useful to combine skills, scripts, and model judgment. The scripts make the runs repeatable, capture the evidence, and cover installation paths that are tedious to check by hand. Codex then uses that evidence to do a more careful comparison than a simple scripted pass/fail check.
## Add release checks
Release preparation is another area where this pattern helps.
The release-review workflow in both repos starts by finding the previous release tag, diffing it against the latest `main`, and then asking Codex to inspect that diff for:
* backward compatibility issues in public APIs and user-facing SDK behavior
* regressions, including smaller changes in expected behavior
* missing migration notes or release-note updates for changes that need them
Based on those findings, the skill makes an overall release-readiness call.
A concrete example is [openai/openai-agents-python#2480](https://github.com/openai/openai-agents-python/pull/2480), where the release review stays green overall while still calling out the Python 3.9 drop and the release-note follow-up it requires:
```
`Release readiness review (excerpt)
Release call:
🟢 GREEN LIGHT TO SHIP. Minor-version bump includes expected breaking change
(Python 3.9 drop) with no concrete regressions found.
Scope summary:
- 38 files changed (+1450/-789); key areas touched: `src/agents/tool.py`,
`src/agents/extensions/`, `src/agents/realtime/`, `tests/`,
`pyproject.toml`, `uv.lock`.
Python 3.9 support removed
- Risk: 🟡 MODERATE. Users pinned to Python 3.9 will be unable to install the
0.9.0 release.
- Evidence: `pyproject.toml` now sets `requires-python = "\>=3.10"` and drops
the Python 3.9 classifier; CI skip logic for 3.9 was removed.
- Action: Ensure release notes clearly call out the Python 3.9 drop and that
packaging metadata remains `\>=3.10`.`
```
The skill also defines how the gate decision is made. The review starts from “safe to release” and switches to a blocked call only when the diff shows concrete evidence of a real problem. Every blocked call must come with a specific unblock checklist. That makes the output much easier to use: a green result means no release-blocking issue was found in the diff, and a blocked result means there is a real issue with a clear next step.
This is more useful than a generic “please review the release.” It forces the model to reason over a concrete diff and explain the result in operational terms. If the release is safe, say so. If it is not, point at the exact evidence and the exact follow-up needed.
## Run workflows in CI
Once a skill is useful locally, [Codex GitHub Action](/codex/github-action) makes it easy to automate the same workflow in CI. That works best when the local workflow is already stable, because manual use is where you debug the instructions, refine the scripts, and find the real edge cases.
For public repositories, the trigger design matters as much as the skill. The [GitHub Action security checklist](/codex/github-action#security-checklist) recommends limiting who can start the workflow, preferring trusted events or explicit approvals, sanitizing prompt inputs from PRs, commits, issues, or comments, keeping `OPENAI\_API\_KEY` protected with `drop-sudo` or an unprivileged user, and running Codex as the last step in the job.
If a workflow is write-capable and takes untrusted public input, the risk is usually in the trigger design, input handling, and runtime privileges around the skill.
## Use Codex in PR review
Skills are one part of the productivity story in these repos. [Codex GitHub PR auto review](/codex/integrations/github) is another.
Since Codex GitHub PR auto review became available, Codex has been a useful reviewer across most code changes in these repos. We use it as a regular part of review, not as a special-case tool.
For straightforward program bugs, regressions, and missing tests, relying on Codex as the required review path is now safe enough in practice. It is consistent at checking the same correctness patterns over and over, and it has removed a major bottleneck for small fixes and routine improvements.
Peer review is still important, but for a different class of changes.
Human review is still essential when the main question is not “is this code correct?” but “which of several valid options should we choose, and how should we ship it?” That includes:
* API or architecture changes where there are multiple reasonable designs and maintainers need to make an explicit choice
* behavior changes that affect product expectations, backward-compatibility promises, or rollout policy
* naming, migration, and release-communication decisions where the hard part is choosing what will be clearest for users and contributors
* changes that require alignment across maintainers or teams, such as scoping work, sequencing it, or deciding what should ship now versus later
Codex can still contribute usefully in all of those cases, but they still benefit from a human decision-maker and direct discussion.
`AGENTS.md` can also encode that split: the repo can tell Codex what counts as important for correctness review, and Codex can apply that guidance consistently.
This has also been a significant contributor to throughput. Repetitive review and validation work no longer waits on scarce reviewer time for every low-risk change, while maintainers can stay focused on higher-context review where their judgment matters most. That shift has helped us move through backlog bugs and smaller feature improvements much faster.
## Final thoughts
In the OpenAI Agents SDK repos, skills work best when they are part of the repository’s normal working setup.
`AGENTS.md` tells Codex which workflows are required. `description` tells it when to route into those workflows. `scripts/` handles the deterministic parts. The model handles the contextual parts. And once a workflow is solid locally, [Codex GitHub Action](/codex/github-action) can carry the same process into CI.
That has made everyday engineering work in these repos more explicit and more reliable. It has also made it easier to ship small improvements faster, because verification, release review, and PR handoff now follow the same repeatable process.
## Resources
* [OpenAI Agents SDK for Python](https://github.com/openai/openai-agents-python)
* [OpenAI Agents SDK for JS](https://github.com/openai/openai-agents-js)
* [Skills in Codex](/codex/concepts/customization#skills)
* [Custom instructions with AGENTS.md](/codex/guides/agents-md)
* [Codex GitHub Action](/codex/github-action)
* [Use Codex in GitHub](/codex/integrations/github)
* [Skills in OpenAI API cookbook](https://developers.openai.com/cookbook/examples/skills_in_api)
* [Agent Skills specification](https://agentskills.io/specification)
* [Skills in OpenAI API: operational best practices](https://developers.openai.com/cookbook/examples/skills_in_api/#operational-best-practices)