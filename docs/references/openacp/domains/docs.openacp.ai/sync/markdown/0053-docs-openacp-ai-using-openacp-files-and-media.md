Files & Media | OpenACP Docs
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
You can send files, images, and audio directly to an active session. The agent receives them as attachments alongside your text message.
##
[](#sending-files)
Sending files
In a session topic or thread, attach a file to your message the same way you would in any other chat. OpenACP detects the attachment, saves it, and includes it in the prompt sent to the agent.
You can combine text and files in a single message:
Copy
```
`Here is the screenshot of the error — can you explain what went wrong?
[attach: screenshot.png]`
```
If you send an attachment without text, OpenACP still forwards it to the agent.
##
[](#supported-types)
Supported types
Type
Formats
Images
JPEG, PNG, GIF, WebP, SVG
Audio
OGG, MP3, WAV, M4A, WebM
Video
MP4, WebM
Documents
PDF, plain text (.txt)
Other
Any file type — passed as a generic attachment
Images and audio are classified automatically. Everything else is treated as a generic file attachment.
##
[](#how-it-works)
How it works
When you send a file, OpenACP:
1.
Downloads the file from the messaging platform
2.
Saves it to `\~/.openacp/files/{sessionId}/` with a timestamp prefix
3.
Constructs an `Attachment` object with the file path, MIME type, and size
4.
Includes the attachment in the prompt sent to the agent via ACP
The agent receives the file path and can read the file from disk. Files persist for the lifetime of the session.
###
[](#audio-attachments-and-stt)
Audio attachments and STT
If you send an audio file (including Telegram voice messages) and STT is configured, OpenACP transcribes the audio and sends the text to the agent instead of the raw file. See [Voice and Speech](/using-openacp/voice-and-speech) for details.
If the agent natively supports audio input, the audio is passed directly without transcription.
Telegram voice messages are in OGG Opus format. OpenACP can convert them to WAV for agents that cannot read OGG directly.
##
[](#file-viewer-via-tunnel)
File viewer via tunnel
When an agent produces output files — generated images, edited documents, reports — you can view them through the tunnel feature. Use `/tunnel 3000` (or whichever port) to expose a local web server with a public URL.
OpenACP's tunnel integration supports Monaco editor for code files and inline image preview.
See [Chat Commands — /tunnel](/using-openacp/chat-commands#tunnel-port-label-telegram-only) for how to create and manage tunnels.
##
[](#size-limits)
Size limits
Platform-imposed limits apply before OpenACP processes the file:
Platform
Limit
Telegram
20 MB for bots (standard API)
Discord
8 MB (free), 50 MB (Nitro)
For audio transcription via Groq STT, the additional limit is 25 MB per file.
Files that exceed the platform limit are never delivered to OpenACP. If you need to share large files, point the agent at a path on the server's local filesystem in your message text instead.
[PreviousVoice & Speech](/using-openacp/voice-and-speech)[NextOverview](/self-hosting/self-hosting)
Last updated 1 month ago
Was this helpful?