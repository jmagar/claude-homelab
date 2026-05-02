For Contributors | OpenACP Docs
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
Welcome, and thank you for wanting to contribute! This guide gets your local development environment running so you can explore the code, fix bugs, or build new features.
##
[](#prerequisites)
Prerequisites
*
**Node.js 20 or later** — check with `node --version`
*
**pnpm** — OpenACP uses pnpm for package management. Install it with `npm install -g pnpm`
*
**Git**
##
[](#set-up-the-repository)
Set up the repository
Copy
```
`# Clone the repo
git clone https://github.com/Open-ACP/OpenACP.git
cd OpenACP
# Install dependencies
pnpm install
# Build the project
pnpm build
# Run the tests — everything should pass
pnpm test
# Start watch mode (rebuilds on every file save)
pnpm dev`
```
That's it. You now have a fully working local build.
To run your local build instead of the globally installed version:
##
[](#project-structure)
Project structure
##
[](#key-concepts)
Key concepts
Understanding these three abstractions covers most of the codebase:
**ChannelAdapter** (`src/core/channel.ts`) The abstract base that every platform integration extends. Implementations provide `sendMessage`, `sendPermissionRequest`, `sendNotification`, `createSessionThread`, and `renameSessionThread`. If you're adding a new platform, you're writing a ChannelAdapter.
**Session** (`src/core/session.ts`) Represents one conversation between a user and an agent. It owns a prompt queue (so messages are processed serially, never in parallel), handles auto-naming after the first prompt, and manages the lifecycle of the underlying agent instance.
**AgentInstance** (`src/core/agent-instance.ts`) The bridge between OpenACP and an AI agent. It spawns the agent as a subprocess, communicates via the ACP protocol, and converts ACP events into the internal `AgentEvent` types that the rest of the system understands.
##
[](#running-a-single-test-file)
Running a single test file
Or run all tests in watch mode:
##
[](#before-you-open-a-pr)
Before you open a PR
*
Make sure `pnpm build` completes without errors.
*
Make sure `pnpm test` passes.
*
For new features, add tests in `src/core/\_\_tests\_\_/` or alongside the relevant module.
*
Follow the ESM-only convention — all imports use `.js` extensions, even for TypeScript source files.
##
[](#where-to-go-next)
Where to go next
*
[Contributing](/extending/contributing) — PR process, code conventions, and testing guidelines
*
[Building Adapters](/extending/building-adapters) — step-by-step guide to adding a new platform
*
[Plugin System](/extending/plugin-system) — how the plugin system works
[PreviousQuick Start](/getting-started/quick-start)[NextChoose Your Platform](/platform-setup/platform-setup)
Last updated 4 days ago
Was this helpful?