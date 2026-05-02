Tunnel & Port Forwarding | OpenACP Docs
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
##
[](#what-it-is-and-why-it-matters)
What it is and why it matters
When your AI agent spins up a local development server — a React app on port 3000, a FastAPI service on port 8000, a database UI on port 5432 — that server is only reachable from your own machine. The tunnel feature solves this by establishing a secure public URL that proxies traffic to any local port.
You can share the URL with teammates, preview your app on a phone, or let a webhook service reach your local API. No manual port-forwarding or cloud deployment required.
OpenACP also runs an internal file viewer server. When an agent edits a file or produces a diff, the viewer generates a shareable link that renders the content with syntax highlighting (via Monaco editor) or side-by-side diff view.
##
[](#providers)
Providers
OpenACP supports four tunnel providers. The active provider is configured once in `\~/.openacp/config.json` and applies to all tunnels.
###
[](#cloudflare-default-free)
Cloudflare (default, free)
Uses the `cloudflared` binary to create ephemeral `\*.trycloudflare.com` URLs. No account required. OpenACP installs `cloudflared` automatically to `\~/.openacp/bin/cloudflared` if it is not already on your PATH.
Supports an optional custom `domain` if you have a Cloudflare account with a zone configured.
###
[](#ngrok)
ngrok
Uses the `ngrok` binary. Requires `ngrok` to be installed separately (https://ngrok.com/download). Supports `authtoken`, `domain`, and `region` options.
###
[](#bore)
bore
Uses the `bore` CLI to tunnel through `bore.pub` (or a self-hosted bore server). Requires `bore` to be installed (https://github.com/ekzhang/bore). Supports custom `server`, `port`, and `secret` options.
###
[](#tailscale-funnel)
Tailscale Funnel
Uses `tailscale funnel` to expose a port over your Tailscale network. Requires Tailscale to be installed and authenticated (https://tailscale.com/download). The provider resolves your Tailscale hostname via `tailscale status --json` to construct the public URL.
##
[](#configuration)
Configuration
Add a `tunnel` block to `\<instance-root\>/config.json` (see [Configuration](/self-hosting/configuration) for the full `tunnel` config reference):
Field
Default
Description
`enabled`
`false`
Enable or disable the tunnel feature. When `true`, the tunnel auto-starts on server boot.
`provider`
`"cloudflare"`
One of `cloudflare`, `ngrok`, `bore`, `tailscale`
`maxUserTunnels`
`5`
Maximum number of simultaneous user-created tunnels
`storeTtlMinutes`
`60`
How long file/diff viewer entries are kept in memory
`options`
`{}`
Provider-specific options (see below)
###
[](#provider-specific-options)
Provider-specific options
**Cloudflare:**
**ngrok:**
**bore:**
**Tailscale:**
##
[](#cli-commands)
CLI commands
Tunnels can be managed from the terminal:
Inside Telegram or Discord, if you have the agent integration installed, the agent can run these commands on your behalf — just ask it to "expose port 3000" or "give me a public URL for this Vite app."
##
[](#file-viewer)
File viewer
When an agent reads, edits, or writes a file, OpenACP can generate a clickable link that opens the content in a web-based viewer with syntax highlighting and side-by-side diff view. This is especially useful when reviewing changes from your phone.
The viewer supports dozens of languages including TypeScript, JavaScript, Python, Rust, Go, Java, and many more. Large tool output that does not fit inline in chat is also viewable through these links.
Viewer links expire automatically after the configured `storeTtlMinutes` (default 60 minutes).
##
[](#limits-and-auto-recovery)
Limits and auto-recovery
*
Each user or session can open up to `maxUserTunnels` tunnels simultaneously (default 5).
*
When `tunnel.enabled` is `true`, the tunnel starts automatically on server boot — no manual start needed.
*
If the tunnel connection drops, OpenACP automatically detects the failure and restarts the tunnel within about 90 seconds.
##
[](#security)
Security
*
Files outside the session's working directory cannot be viewed — path access is restricted to prevent unauthorized file access.
*
Viewer entries expire automatically and are cleaned up periodically.
*
When connecting apps remotely, `openacp remote` generates a single-use access code instead of embedding secrets in the URL. See [App Connectivity](/features/app-connectivity) for details.
[PreviousOverview](/features/features)[NextContext Resume](/features/context-resume)
Last updated 20 days ago
Was this helpful?