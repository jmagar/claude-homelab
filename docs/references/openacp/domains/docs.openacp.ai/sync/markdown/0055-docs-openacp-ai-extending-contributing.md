Contributing | OpenACP Docs
GitBook Assistant
##### Good morning
I'm here to help you with the docs.
What is this page about?What should I read next?Can you give an example?
⌘Ctrli
AI Based on your context
Send
[](/)
* [README](/)
*
Getting Started
* [Overview](/getting-started/getting-started)
* [What is OpenACP?](/getting-started/what-is-openacp)
* [Quick Start](/getting-started/quick-start)
* [For Contributors](/getting-started/for-contributors)
*
Platform Setup
* [Choose Your Platform](/platform-setup/platform-setup)
* [Telegram](/platform-setup/telegram)
* [Discord](/platform-setup/discord)
* [Slack](/platform-setup/slack)
*
Using OpenACP
* [Overview](/using-openacp/using-openacp)
* [Chat Commands](/using-openacp/chat-commands)
* [Sessions](/using-openacp/sessions)
* [Agents](/using-openacp/agents)
* [Permissions](/using-openacp/permissions)
* [Voice & Speech](/using-openacp/voice-and-speech)
* [Files & Media](/using-openacp/files-and-media)
*
Self-Hosting
* [Overview](/self-hosting/self-hosting)
* [Installation](/self-hosting/installation)
* [Configuration](/self-hosting/configuration)
* [Daemon Mode](/self-hosting/daemon-mode)
* [Security](/self-hosting/security)
* [Logging](/self-hosting/logging)
* [Updating](/self-hosting/updating)
*
Features
* [Overview](/features/features)
* [Tunnel & Port Forwarding](/features/tunnel)
* [Context Resume](/features/context-resume)
* [Output Modes](/features/output-modes)
* [Usage & Budget](/features/usage-and-budget)
* [Session Persistence](/features/session-persistence)
* [Session Handoff](/features/session-handoff)
* [Agent Switch](/features/agent-switch)
* [Workspaces](/features/multi-instance)
* [App Connectivity](/features/app-connectivity)
* [Doctor Diagnostics](/features/doctor)
* [Assistant Mode](/features/assistant-mode)
*
Architecture
* [Overview](/architecture/architecture)
* [Core Design](/architecture/core-design)
* [Plugin System](/architecture/plugin-system)
* [Command System](/architecture/command-system)
* [Built-in Plugins](/architecture/built-in-plugins)
* [Writing Plugins](/architecture/writing-plugins)
*
Extending
* [Overview](/extending/extending)
* [Getting Started: Your First Plugin](/extending/getting-started-plugin)
* [Plugin System](/extending/plugin-system)
* [Plugin SDK Reference](/extending/plugin-sdk-reference)
* [Dev Mode](/extending/dev-mode)
* [Building Adapters](/extending/building-adapters)
* [Adapter Reference](/extending/adapter-reference)
* [Contributing](/extending/contributing)
*
API Reference
* [Overview](/api-reference/api-reference)
* [CLI Commands](/api-reference/cli-commands)
* [REST API](/api-reference/rest-api)
* [Configuration Schema](/api-reference/configuration-schema)
* [Environment Variables](/api-reference/environment-variables)
*
Troubleshooting
* [Common Issues](/troubleshooting/troubleshooting)
* [Telegram Issues](/troubleshooting/telegram-issues)
* [Discord Issues](/troubleshooting/discord-issues)
* [Slack Issues](/troubleshooting/slack-issues)
* [Agent Issues](/troubleshooting/agent-issues)
* [FAQ](/troubleshooting/faq)
[Powered by GitBook](https://www.gitbook.com/?utm_source=content&amp;utm_medium=trademark&amp;utm_campaign=xDIegDd7TZzhXcvU0Y6N&amp;utm_content=site_RPD3m)[](https://www.gitbook.com/?utm_source=content&amp;utm_medium=trademark&amp;utm_campaign=xDIegDd7TZzhXcvU0Y6N&amp;utm_content=site_RPD3m)
On this page
Contributions are welcome. This page covers how to set up a development environment, project conventions, testing expectations, and the PR process.
##
[](#dev-setup)
Dev Setup
**Requirements:** Node.js \>= 20, pnpm \>= 10.
Copy
```
`# 1. Fork https://github.com/Open-ACP/OpenACP and clone your fork
git clone https://github.com/\<your-username\>/OpenACP.git
cd OpenACP
# 2. Install dependencies
pnpm install
# 3. Compile TypeScript
pnpm build
# 4. Run the CLI locally
pnpm start
# 5. Watch mode (recompiles on save)
pnpm dev
# 6. Run the test suite
pnpm test`
```
The compiled output lands in `dist/`. The entry point is `dist/cli.js`.
For publishing-related work, `pnpm build:publish` bundles via tsup into `dist-publish/` — this is what gets shipped to npm as `@openacp/cli`.
##
[](#project-conventions)
Project Conventions
###
[](#esm-only)
ESM-only
The package uses `"type": "module"`. All `import` statements must use `.js` extensions, even when importing `.ts` source files:
###
[](#typescript)
TypeScript
*
`strict: true` is enforced.
*
Target: ES2022.
*
Module resolution: NodeNext.
*
All new files must be `.ts`. No plain `.js` in `src/`.
###
[](#file-and-module-layout)
File and Module Layout
*
Source lives in `src/`. Tests live in `src/\*\*/\_\_tests\_\_/` or next to the file they test.
*
Core abstractions belong in `src/core/`. Plugin implementations (including adapters) belong in `src/plugins/\<name\>/`.
*
Public API exports flow through `src/index.ts` → `src/core/index.ts`.
##
[](#testing-guidelines)
Testing Guidelines
The test framework is [Vitest](https://vitest.dev/). Run with `pnpm test` (single run) or `pnpm test:watch` (interactive watch mode).
###
[](#test-flows-not-internals)
Test Flows, Not Internals
Tests should validate behavior against specifications, not implementation details. Focus on observable outcomes: what events are emitted, what methods are called, what state changes result.
###
[](#mock-at-boundaries)
Mock at Boundaries
Mock `AgentInstance`, `ChannelAdapter`, and `SessionStore` — not internal classes. Use `vi.fn()` for mocks. For event-driven mocks, use `TypedEmitter` from `openacp`:
###
[](#async-assertions)
Async Assertions
For fire-and-forget operations, use `vi.waitFor()` rather than arbitrary sleeps:
Use `await Promise.resolve()` for microtask timing when you just need to flush the microtask queue.
###
[](#timer-based-tests)
Timer-Based Tests
Use `vi.useFakeTimers()` for anything involving timeouts (e.g. permission gate expiry, session TTL):
###
[](#what-to-cover)
What to Cover
Good contributions include tests for:
*
**All state machine transitions** — both valid paths and invalid ones. Verify events emitted on each.
*
**Error recovery** — after an error, the system must remain usable.
*
**Concurrency** — serial processing guarantees, queue ordering, race conditions.
*
**Boundary values** — at exactly the limit (e.g. `maxConcurrentSessions`).
*
**Cleanup** — timers, listeners, and files are removed in `afterEach`.
*
**Idempotency** — double `connect()`, double `resolve()`, double `stop()` must be safe.
###
[](#cleanup)
Cleanup
Always clean up in `afterEach`:
##
[](#pr-process)
PR Process
1.
**Branch from **`**develop**`, not `main`:
2.
**Write tests** before or alongside your implementation. PRs without tests for new behavior will be asked to add them.
3.
**Build and test** before pushing:
4.
**Open a PR against **`**develop**`. In your PR description:
*
Explain what the change does and why.
*
List any breaking changes.
*
Note any backward compatibility considerations (see the `CLAUDE.md` backward-compat section for the full policy).
*
**Backward compatibility**: if you change config fields, storage formats, CLI commands, or plugin APIs, you must handle old data gracefully. New config fields need `.default()` or `.optional()` in the Zod schema. See the project `CLAUDE.md` for the full policy.
##
[](#publishing-a-plugin-to-the-registry)
Publishing a Plugin to the Registry
Built a plugin? Share it with the community by adding it to the [OpenACP Plugin Registry](https://github.com/Open-ACP/plugin-registry).
###
[](#step-1-publish-to-npm)
Step 1: Publish to npm
###
[](#step-2-create-a-registry-entry)
Step 2: Create a registry entry
Fork [Open-ACP/plugin-registry](https://github.com/Open-ACP/plugin-registry) and create a JSON file in `plugins/`:
**Filename:** your npm package name with `@` removed and `/` replaced by `--`.
*
`@yourname/openacp-translator` → `yourname--openacp-translator.json`
*
`openacp-plugin-tts` → `openacp-plugin-tts.json`
**Content:**
**Categories:** `adapter`, `utility`, `integration`, `ai`, `security`, `media`
###
[](#step-3-submit-a-pull-request)
Step 3: Submit a Pull Request
Submit your PR to the registry repo. CI will automatically:
1.
Validate your JSON format
2.
Verify your npm package exists
3.
Auto-merge if everything passes
###
[](#after-submission)
After submission
*
Your plugin appears in `openacp plugin search` within minutes
*
A daily CI job keeps the version synced with npm — no need to update manually
*
Maintainers may review your plugin and mark it as **verified** (✓)
###
[](#requirements)
Requirements
*
Plugin **must be published on npm** before submitting
*
Plugin **must export a valid **`**OpenACPPlugin**`** interface**
*
Plugin **must have a README** with installation instructions
*
Plugin **must specify a license**
##
[](#code-style)
Code Style
*
Follow the patterns of the file you are editing — consistency within a file takes priority.
*
Prefer explicit types over `any`. Use `unknown` when the type is genuinely unknown.
*
Use `createChildLogger({ module: 'my-module' })` for structured logging instead of `console.log`.
*
Keep files focused. If a file grows beyond \~300 lines, consider splitting it.
*
No default exports from core modules — use named exports so tree-shaking and refactoring tools work reliably.
[PreviousAdapter Reference](/extending/adapter-reference)[NextOverview](/api-reference/api-reference)
Last updated 1 month ago
Was this helpful?