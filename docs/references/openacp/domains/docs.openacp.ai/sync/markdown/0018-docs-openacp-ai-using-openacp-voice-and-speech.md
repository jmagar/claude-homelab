Voice & Speech | OpenACP Docs
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
OpenACP supports two speech features: speech-to-text (STT) for voice input and text-to-speech (TTS) for spoken responses. Both are optional and configured independently.
##
[](#speech-to-text-stt)
Speech-to-text (STT)
**Provider:** Groq (uses the Whisper large v3 turbo model) **Cost:** Free tier available at [console.groq.com](https://console.groq.com) — 28,800 seconds of audio per day
When STT is configured, you can send voice messages to a session topic and OpenACP transcribes them before passing the text to the agent. The transcribed text appears in the topic as a system message:
Copy
```
`You said: "Add a unit test for the login function"`
```
The agent then receives the transcription as a normal text prompt. If the agent natively supports audio input, the audio attachment is passed directly instead.
**Supported audio formats:** OGG, WAV, MP3, M4A, WebM, FLAC (maximum 25 MB per file).
###
[](#configuring-stt)
Configuring STT
Add your Groq API key to the config (see [Configuration](/self-hosting/configuration) for the full `speech` config reference):
Copy
```
`{
"speech": {
"stt": {
"provider": "groq",
"providers": {
"groq": {
"apiKey": "gsk\_..."
}
}
}
}
}`
```
Or use `/settings` in Telegram — tap the STT provider field and the assistant will walk you through entering an API key.
###
[](#stt-error-handling)
STT error handling
If transcription fails (network issue, rate limit, invalid key), the audio attachment is kept and passed to the agent as-is, with an error message in the topic. The Groq free tier limit is 28,800 seconds per day; if exceeded, transcription fails gracefully.
##
[](#text-to-speech-tts)
Text-to-speech (TTS)
**Provider:** Edge TTS (Microsoft's neural TTS service) **Cost:** Free, no API key required **Default voice:** `en-US-AriaNeural` **Output format:** MP3 (24 kHz, 48 kbps mono)
When TTS is active for a session, the agent is instructed to include a spoken-friendly summary of its response in a `[TTS]...[/TTS]` block. OpenACP extracts this block, synthesizes audio, and sends it back to the chat as a voice message. TTS synthesis has a 30-second timeout — if it exceeds this, the audio is skipped silently.
The agent decides what to include in the TTS block. It focuses on key information, decisions the user needs to make, or required actions. The response language matches whatever language you are using.
###
[](#voice-modes)
Voice modes
TTS operates in one of three modes per session:
Mode
Behavior
`off`
No TTS (default)
`next`
TTS for the next message only, then reverts to `off`
`on`
TTS for every subsequent message
###
[](#toggling-tts)
Toggling TTS
**Telegram — in a session topic:**
**Via the session control keyboard:** Tap the "Text to Speech" toggle button in the session setup message.
**Discord:**
###
[](#configuring-tts)
Configuring TTS
Edge TTS works out of the box with no configuration. To change the voice, update your config:
Microsoft Edge TTS supports a large number of voices across many languages. Voice names follow the pattern `{language}-{region}-{name}Neural`.
###
[](#enabling-tts-in-config)
Enabling TTS in config
Set `provider` to `null` to disable TTS entirely.
##
[](#using-both-together)
Using both together
STT and TTS work independently. You can use either or both at the same time. A typical voice workflow:
1.
Send a voice message in a session topic
2.
OpenACP transcribes it via Groq STT
3.
The transcription appears as "You said: ..."
4.
The agent processes the text and responds
5.
If TTS is on, the response summary is synthesized and sent as audio
[PreviousPermissions](/using-openacp/permissions)[NextFiles & Media](/using-openacp/files-and-media)
Last updated 1 month ago
Was this helpful?