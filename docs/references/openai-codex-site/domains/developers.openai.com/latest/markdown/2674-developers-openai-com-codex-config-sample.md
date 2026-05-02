Sample Configuration – Codex | OpenAI Developers
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
### Getting Started
* [ Overview ](/codex)
* [ Quickstart ](/codex/quickstart)
* [ Explore use cases ](/codex/use-cases)
* [ Pricing ](/codex/pricing)
* Concepts
* [ Prompting ](/codex/prompting)
* [ Customization ](/codex/concepts/customization)
* [ Memories ](/codex/memories)
* [ Chronicle ](/codex/memories/chronicle)
* [ Sandboxing ](/codex/concepts/sandboxing)
* [ Subagents ](/codex/concepts/subagents)
* [ Workflows ](/codex/workflows)
* [ Models ](/codex/models)
* [ Cyber Safety ](/codex/concepts/cyber-safety)
### Using Codex
* App
* [ Overview ](/codex/app)
* [ Features ](/codex/app/features)
* [ Settings ](/codex/app/settings)
* [ Review ](/codex/app/review)
* [ Automations ](/codex/app/automations)
* [ Worktrees ](/codex/app/worktrees)
* [ Local Environments ](/codex/app/local-environments)
* [ In-app browser ](/codex/app/browser)
* [ Computer Use ](/codex/app/computer-use)
* [ Commands ](/codex/app/commands)
* [ Windows ](/codex/app/windows)
* [ Troubleshooting ](/codex/app/troubleshooting)
* IDE Extension
* [ Overview ](/codex/ide)
* [ Features ](/codex/ide/features)
* [ Settings ](/codex/ide/settings)
* [ IDE Commands ](/codex/ide/commands)
* [ Slash commands ](/codex/ide/slash-commands)
* CLI
* [ Overview ](/codex/cli)
* [ Features ](/codex/cli/features)
* [ Command Line Options ](/codex/cli/reference)
* [ Slash commands ](/codex/cli/slash-commands)
* Web
* [ Overview ](/codex/cloud)
* [ Environments ](/codex/cloud/environments)
* [ Internet Access ](/codex/cloud/internet-access)
* Integrations
* [ GitHub ](/codex/integrations/github)
* [ Slack ](/codex/integrations/slack)
* [ Linear ](/codex/integrations/linear)
* Codex Security
* [ Overview ](/codex/security)
* [ Setup ](/codex/security/setup)
* [ Improving the threat model ](/codex/security/threat-model)
* [ FAQ ](/codex/security/faq)
### Configuration
* Config File
* [ Config Basics ](/codex/config-basic)
* [ Advanced Config ](/codex/config-advanced)
* [ Config Reference ](/codex/config-reference)
* [ Sample Config ](/codex/config-sample)
* [ Speed ](/codex/speed)
* [ Rules ](/codex/rules)
* [ Hooks ](/codex/hooks)
* [ AGENTS.md ](/codex/guides/agents-md)
* [ MCP ](/codex/mcp)
* Plugins
* [ Overview ](/codex/plugins)
* [ Build plugins ](/codex/plugins/build)
* [ Skills ](/codex/skills)
* [ Subagents ](/codex/subagents)
### Administration
* [ Authentication ](/codex/auth)
* [ Agent approvals & security ](/codex/agent-approvals-security)
* [ Remote connections ](/codex/remote-connections)
* Enterprise
* [ Admin Setup ](/codex/enterprise/admin-setup)
* [ Governance ](/codex/enterprise/governance)
* [ Managed configuration ](/codex/enterprise/managed-configuration)
* [ Windows ](/codex/windows)
### Automation
* [ Non-interactive Mode ](/codex/noninteractive)
* [ Codex SDK ](/codex/sdk)
* [ App Server ](/codex/app-server)
* [ MCP Server ](/codex/guides/agents-sdk)
* [ GitHub Action ](/codex/github-action)
### Learn
* [ Best practices ](/codex/learn/best-practices)
* [ Videos ](/codex/videos)
* [ Community ](/community)
* Blog
* [ Using skills to accelerate OSS maintenance ](/blog/skills-agents-sdk)
* [ Building frontend UIs with Codex and Figma ](/blog/building-frontend-uis-with-codex-and-figma)
* [ View all ](/blog/topic/codex)
* Cookbooks
* [ Codex Prompting Guide ](/cookbook/examples/gpt-5/codex_prompting_guide)
* [ Modernizing your Codebase with Codex ](/cookbook/examples/codex/code_modernization)
* [ View all ](/cookbook/topic/codex)
* [ Building AI Teams ](/codex/guides/build-ai-native-engineering-team)
### Releases
* [ Changelog ](/codex/changelog)
* [ Feature Maturity ](/codex/feature-maturity)
* [ Open Source ](/codex/open-source)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Use this example configuration as a starting point. It includes most keys Codex reads from `config.toml`, along with default behaviors, recommended values where helpful, and short notes.
For explanations and guidance, see:
* [Config basics](/codex/config-basic)
* [Advanced Config](/codex/config-advanced)
* [Config Reference](/codex/config-reference)
* [Sandbox and approvals](/codex/agent-approvals-security#sandbox-and-approvals)
* [Managed configuration](/codex/enterprise/managed-configuration)
Use the snippet below as a reference. Copy only the keys and sections you need into `\~/.codex/config.toml` (or into a project-scoped `.codex/config.toml`), then adjust values for your setup.
```
`# Codex example configuration (config.toml)
#
# This file lists the main keys Codex reads from config.toml, along with default
# behaviors, recommended examples, and concise explanations. Adjust as needed.
#
# Notes
# - Root keys must appear before tables in TOML.
# - Optional keys that default to "unset" are shown commented out with notes.
# - MCP servers, profiles, and model providers are examples; remove or edit.
################################################################################
# Core Model Selection
################################################################################
# Primary model used by Codex. Recommended example for most users: "gpt-5.5".
model = "gpt-5.5"
# Communication style for supported models. Allowed values: none | friendly | pragmatic
# personality = "pragmatic"
# Optional model override for /review. Default: unset (uses current session model).
# review\_model = "gpt-5.5"
# Provider id selected from [model\_providers]. Default: "openai".
model\_provider = "openai"
# Default OSS provider for --oss sessions. When unset, Codex prompts. Default: unset.
# oss\_provider = "ollama"
# Preferred service tier. `fast` is honored only when enabled in [features].
# service\_tier = "flex" # fast | flex
# Optional manual model metadata. When unset, Codex uses model or preset defaults.
# model\_context\_window = 128000 # tokens; default: auto for model
# model\_auto\_compact\_token\_limit = 64000 # tokens; unset uses model defaults
# tool\_output\_token\_limit = 12000 # tokens stored per tool output
# model\_catalog\_json = "/absolute/path/to/models.json" # optional startup-only model catalog override
# background\_terminal\_max\_timeout = 300000 # ms; max empty write\_stdin poll window (default 5m)
# log\_dir = "/absolute/path/to/codex-logs" # directory for Codex logs; default: "$CODEX\_HOME/log"
# sqlite\_home = "/absolute/path/to/codex-state" # optional SQLite-backed runtime state directory
################################################################################
# Reasoning & Verbosity (Responses API capable models)
################################################################################
# Reasoning effort: minimal | low | medium | high | xhigh
# model\_reasoning\_effort = "medium"
# Optional override used when Codex runs in plan mode: none | minimal | low | medium | high | xhigh
# plan\_mode\_reasoning\_effort = "high"
# Reasoning summary: auto | concise | detailed | none
# model\_reasoning\_summary = "auto"
# Text verbosity for GPT-5 family (Responses API): low | medium | high
# model\_verbosity = "medium"
# Force enable or disable reasoning summaries for current model.
# model\_supports\_reasoning\_summaries = true
################################################################################
# Instruction Overrides
################################################################################
# Additional user instructions are injected before AGENTS.md. Default: unset.
# developer\_instructions = ""
# Inline override for the history compaction prompt. Default: unset.
# compact\_prompt = ""
# Override the default commit co-author trailer. Set to "" to disable it.
# commit\_attribution = "Jane Doe \<jane@example.com\>"
# Override built-in base instructions with a file path. Default: unset.
# model\_instructions\_file = "/absolute/or/relative/path/to/instructions.txt"
# Load the compact prompt override from a file. Default: unset.
# experimental\_compact\_prompt\_file = "/absolute/or/relative/path/to/compact\_prompt.txt"
################################################################################
# Notifications
################################################################################
# External notifier program (argv array). When unset: disabled.
# notify = ["notify-send", "Codex"]
################################################################################
# Approval & Sandbox
################################################################################
# When to ask for command approval:
# - untrusted: only known-safe read-only commands auto-run; others prompt
# - on-request: model decides when to ask (default)
# - never: never prompt (risky)
# - { granular = { ... } }: allow or auto-reject selected prompt categories
approval\_policy = "on-request"
# Who reviews eligible approval prompts: user (default) | auto\_review
# approvals\_reviewer = "user"
# Example granular policy:
# approval\_policy = { granular = {
# sandbox\_approval = true,
# rules = true,
# mcp\_elicitations = true,
# request\_permissions = false,
# skill\_approval = false
# } }
# Allow login-shell semantics for shell-based tools when they request `login = true`.
# Default: true. Set false to force non-login shells and reject explicit login-shell requests.
allow\_login\_shell = true
# Filesystem/network sandbox policy for tool calls:
# - read-only (default)
# - workspace-write
# - danger-full-access (no sandbox; extremely risky)
sandbox\_mode = "read-only"
# Named permissions profile to apply by default. Built-ins:
# :read-only | :workspace | :danger-no-sandbox
# Use a custom name such as "workspace" only when you also define [permissions.workspace].
# default\_permissions = ":workspace"
# Example filesystem profile. Use `"none"` to deny reads for exact paths or
# glob patterns. On platforms that need pre-expanded glob matches, set
# glob\_scan\_max\_depth when using unbounded patterns such as `\*\*`.
# [permissions.workspace.filesystem]
# glob\_scan\_max\_depth = 3
# ":project\_roots" = { "." = "write", "\*\*/\*.env" = "none" }
# "/absolute/path/to/secrets" = "none"
################################################################################
# Authentication & Login
################################################################################
# Where to persist CLI login credentials: file (default) | keyring | auto
cli\_auth\_credentials\_store = "file"
# Base URL for ChatGPT auth flow (not OpenAI API).
chatgpt\_base\_url = "https://chatgpt.com/backend-api/"
# Optional base URL override for the built-in OpenAI provider.
# openai\_base\_url = "https://us.api.openai.com/v1"
# Restrict ChatGPT login to a specific workspace id. Default: unset.
# forced\_chatgpt\_workspace\_id = "00000000-0000-0000-0000-000000000000"
# Force login mechanism when Codex would normally auto-select. Default: unset.
# Allowed values: chatgpt | api
# forced\_login\_method = "chatgpt"
# Preferred store for MCP OAuth credentials: auto (default) | file | keyring
mcp\_oauth\_credentials\_store = "auto"
# Optional fixed port for MCP OAuth callback: 1-65535. Default: unset.
# mcp\_oauth\_callback\_port = 4321
# Optional redirect URI override for MCP OAuth login (for example, remote devbox ingress).
# Custom callback paths are supported. `mcp\_oauth\_callback\_port` still controls the listener port.
# mcp\_oauth\_callback\_url = "https://devbox.example.internal/callback"
################################################################################
# Project Documentation Controls
################################################################################
# Max bytes from AGENTS.md to embed into first-turn instructions. Default: 32768
project\_doc\_max\_bytes = 32768
# Ordered fallbacks when AGENTS.md is missing at a directory level. Default: []
project\_doc\_fallback\_filenames = []
# Project root marker filenames used when searching parent directories. Default: [".git"]
# project\_root\_markers = [".git"]
################################################################################
# History & File Opener
################################################################################
# URI scheme for clickable citations: vscode (default) | vscode-insiders | windsurf | cursor | none
file\_opener = "vscode"
################################################################################
# UI, Notifications, and Misc
################################################################################
# Suppress internal reasoning events from output. Default: false
hide\_agent\_reasoning = false
# Show raw reasoning content when available. Default: false
show\_raw\_agent\_reasoning = false
# Disable burst-paste detection in the TUI. Default: false
disable\_paste\_burst = false
# Track Windows onboarding acknowledgement (Windows only). Default: false
windows\_wsl\_setup\_acknowledged = false
# Check for updates on startup. Default: true
check\_for\_update\_on\_startup = true
################################################################################
# Web Search
################################################################################
# Web search mode: disabled | cached | live. Default: "cached"
# cached serves results from a web search cache (an OpenAI-maintained index).
# cached returns pre-indexed results; live fetches the most recent data.
# If you use --yolo or another full access sandbox setting, web search defaults to live.
web\_search = "cached"
# Active profile name. When unset, no profile is applied.
# profile = "default"
# Suppress the warning shown when under-development feature flags are enabled.
# suppress\_unstable\_features\_warning = true
################################################################################
# Agents (multi-agent roles and limits)
################################################################################
[agents]
# Maximum concurrently open agent threads. Default: 6
# max\_threads = 6
# Maximum nested spawn depth. Root session starts at depth 0. Default: 1
# max\_depth = 1
# Default timeout per worker for spawn\_agents\_on\_csv jobs. When unset, the tool defaults to 1800 seconds.
# job\_max\_runtime\_seconds = 1800
# [agents.reviewer]
# description = "Find correctness, security, and test risks in code."
# config\_file = "./agents/reviewer.toml" # relative to the config.toml that defines it
# nickname\_candidates = ["Athena", "Ada"]
################################################################################
# Skills (per-skill overrides)
################################################################################
# Disable or re-enable a specific skill without deleting it.
[[skills.config]]
# path = "/path/to/skill/SKILL.md"
# enabled = false
################################################################################
# Sandbox settings (tables)
################################################################################
# Extra settings used only when sandbox\_mode = "workspace-write".
[sandbox\_workspace\_write]
# Additional writable roots beyond the workspace (cwd). Default: []
writable\_roots = []
# Allow outbound network access inside the sandbox. Default: false
network\_access = false
# Exclude $TMPDIR from writable roots. Default: false
exclude\_tmpdir\_env\_var = false
# Exclude /tmp from writable roots. Default: false
exclude\_slash\_tmp = false
################################################################################
# Shell Environment Policy for spawned processes (table)
################################################################################
[shell\_environment\_policy]
# inherit: all (default) | core | none
inherit = "all"
# Skip default excludes for names containing KEY/SECRET/TOKEN (case-insensitive). Default: false
ignore\_default\_excludes = false
# Case-insensitive glob patterns to remove (e.g., "AWS\_\*", "AZURE\_\*"). Default: []
exclude = []
# Explicit key/value overrides (always win). Default: {}
set = {}
# Whitelist; if non-empty, keep only matching vars. Default: []
include\_only = []
# Experimental: run via user shell profile. Default: false
experimental\_use\_profile = false
################################################################################
# Managed network proxy settings
################################################################################
# Set `default\_permissions = "workspace"` before enabling this profile.
# [permissions.workspace.network]
# enabled = true
# proxy\_url = "http://127.0.0.1:43128"
# admin\_url = "http://127.0.0.1:43129"
# enable\_socks5 = false
# socks\_url = "http://127.0.0.1:43130"
# enable\_socks5\_udp = false
# allow\_upstream\_proxy = false
# dangerously\_allow\_non\_loopback\_proxy = false
# dangerously\_allow\_non\_loopback\_admin = false
# dangerously\_allow\_all\_unix\_sockets = false
# mode = "limited" # limited | full
# allow\_local\_binding = false
#
# [permissions.workspace.network.domains]
# "api.openai.com" = "allow"
# "example.com" = "deny"
#
# [permissions.workspace.network.unix\_sockets]
# "/var/run/docker.sock" = "allow"
################################################################################
# History (table)
################################################################################
[history]
# save-all (default) | none
persistence = "save-all"
# Maximum bytes for history file; oldest entries are trimmed when exceeded. Example: 5242880
# max\_bytes = 5242880
################################################################################
# UI, Notifications, and Misc (tables)
################################################################################
[tui]
# Desktop notifications from the TUI: boolean or filtered list. Default: true
# Examples: false | ["agent-turn-complete", "approval-requested"]
notifications = false
# Notification mechanism for terminal alerts: auto | osc9 | bel. Default: "auto"
# notification\_method = "auto"
# When notifications fire: unfocused (default) | always
# notification\_condition = "unfocused"
# Enables welcome/status/spinner animations. Default: true
animations = true
# Show onboarding tooltips in the welcome screen. Default: true
show\_tooltips = true
# Control alternate screen usage (auto skips it in Zellij to preserve scrollback).
# alternate\_screen = "auto"
# Ordered list of footer status-line item IDs. When unset, Codex uses:
# ["model-with-reasoning", "context-remaining", "current-dir"].
# Set to [] to hide the footer.
# status\_line = ["model", "context-remaining", "git-branch"]
# Ordered list of terminal window/tab title item IDs. When unset, Codex uses:
# ["spinner", "project"]. Set to [] to clear the title.
# Available IDs include app-name, project, spinner, status, thread, git-branch, model,
# and task-progress.
# terminal\_title = ["spinner", "project"]
# Syntax-highlighting theme (kebab-case). Use /theme in the TUI to preview and save.
# You can also add custom .tmTheme files under $CODEX\_HOME/themes.
# theme = "catppuccin-mocha"
# Custom key bindings. Context-specific bindings override [tui.keymap.global].
# Use [] to unbind an action.
# [tui.keymap.global]
# open\_transcript = "ctrl-t"
# open\_external\_editor = []
#
# [tui.keymap.composer]
# submit = ["enter", "ctrl-m"]
# Internal tooltip state keyed by model slug. Usually managed by Codex.
# [tui.model\_availability\_nux]
# "gpt-5.4" = 1
# Enable or disable analytics for this machine. When unset, Codex uses its default behavior.
[analytics]
enabled = true
# Control whether users can submit feedback from `/feedback`. Default: true
[feedback]
enabled = true
# In-product notices (mostly set automatically by Codex).
[notice]
# hide\_full\_access\_warning = true
# hide\_world\_writable\_warning = true
# hide\_rate\_limit\_model\_nudge = true
# hide\_gpt5\_1\_migration\_prompt = true
# "hide\_gpt-5.1-codex-max\_migration\_prompt" = true
# model\_migrations = { "gpt-5.3-codex" = "gpt-5.4" }
################################################################################
# Centralized Feature Flags (preferred)
################################################################################
[features]
# Leave this table empty to accept defaults. Set explicit booleans to opt in/out.
# shell\_tool = true
# apps = false
# codex\_hooks = false
# unified\_exec = true
# shell\_snapshot = true
# multi\_agent = true
# personality = true
# fast\_mode = true
# enable\_request\_compression = true
# skill\_mcp\_dependency\_install = true
# prevent\_idle\_sleep = false
################################################################################
# Memories (table)
################################################################################
# Enable memories with [features].memories, then tune memory behavior here.
# [memories]
# generate\_memories = true
# use\_memories = true
# disable\_on\_external\_context = false # legacy alias: no\_memories\_if\_mcp\_or\_web\_search
################################################################################
# Lifecycle hooks can be configured here inline or in a sibling hooks.json.
################################################################################
# [hooks]
# [[hooks.PreToolUse]]
# matcher = "^Bash$"
#
# [[hooks.PreToolUse.hooks]]
# type = "command"
# command = 'python3 "/absolute/path/to/pre\_tool\_use\_policy.py"'
# timeout = 30
# statusMessage = "Checking Bash command"
################################################################################
# Define MCP servers under this table. Leave empty to disable.
################################################################################
[mcp\_servers]
# --- Example: STDIO transport ---
# [mcp\_servers.docs]
# enabled = true # optional; default true
# required = true # optional; fail startup/resume if this server cannot initialize
# command = "docs-server" # required
# args = ["--port", "4000"] # optional
# env = { "API\_KEY" = "value" } # optional key/value pairs copied as-is
# env\_vars = ["ANOTHER\_SECRET"] # optional: forward local parent env vars
# env\_vars = ["LOCAL\_TOKEN", { name = "REMOTE\_TOKEN", source = "remote" }]
# cwd = "/path/to/server" # optional working directory override
# experimental\_environment = "remote" # experimental: run stdio via a remote executor
# startup\_timeout\_sec = 10.0 # optional; default 10.0 seconds
# # startup\_timeout\_ms = 10000 # optional alias for startup timeout (milliseconds)
# tool\_timeout\_sec = 60.0 # optional; default 60.0 seconds
# enabled\_tools = ["search", "summarize"] # optional allow-list
# disabled\_tools = ["slow-tool"] # optional deny-list (applied after allow-list)
# scopes = ["read:docs"] # optional OAuth scopes
# oauth\_resource = "https://docs.example.com/" # optional OAuth resource
# --- Example: Streamable HTTP transport ---
# [mcp\_servers.github]
# enabled = true # optional; default true
# required = true # optional; fail startup/resume if this server cannot initialize
# url = "https://github-mcp.example.com/mcp" # required
# bearer\_token\_env\_var = "GITHUB\_TOKEN" # optional; Authorization: Bearer \<token\>
# http\_headers = { "X-Example" = "value" } # optional static headers
# env\_http\_headers = { "X-Auth" = "AUTH\_ENV" } # optional headers populated from env vars
# startup\_timeout\_sec = 10.0 # optional
# tool\_timeout\_sec = 60.0 # optional
# enabled\_tools = ["list\_issues"] # optional allow-list
# disabled\_tools = ["delete\_issue"] # optional deny-list
# scopes = ["repo"] # optional OAuth scopes
################################################################################
# Model Providers
################################################################################
# Built-ins include:
# - openai
# - ollama
# - lmstudio
# - amazon-bedrock
# These IDs are reserved. Use a different ID for custom providers.
[model\_providers]
# --- Example: built-in Amazon Bedrock provider options ---
# model\_provider = "amazon-bedrock"
# model = "\<bedrock-model-id\>"
# [model\_providers.amazon-bedrock.aws]
# profile = "default"
# region = "eu-central-1"
# --- Example: OpenAI data residency with explicit base URL or headers ---
# [model\_providers.openaidr]
# name = "OpenAI Data Residency"
# base\_url = "https://us.api.openai.com/v1" # example with 'us' domain prefix
# wire\_api = "responses" # only supported value
# # requires\_openai\_auth = true # use only for providers backed by OpenAI auth
# # request\_max\_retries = 4 # default 4; max 100
# # stream\_max\_retries = 5 # default 5; max 100
# # stream\_idle\_timeout\_ms = 300000 # default 300\_000 (5m)
# # supports\_websockets = true # optional
# # experimental\_bearer\_token = "sk-example" # optional dev-only direct bearer token
# # http\_headers = { "X-Example" = "value" }
# # env\_http\_headers = { "OpenAI-Organization" = "OPENAI\_ORGANIZATION", "OpenAI-Project" = "OPENAI\_PROJECT" }
# --- Example: Azure/OpenAI-compatible provider ---
# [model\_providers.azure]
# name = "Azure"
# base\_url = "https://YOUR\_PROJECT\_NAME.openai.azure.com/openai"
# wire\_api = "responses"
# query\_params = { api-version = "2025-04-01-preview" }
# env\_key = "AZURE\_OPENAI\_API\_KEY"
# env\_key\_instructions = "Set AZURE\_OPENAI\_API\_KEY in your environment"
# # supports\_websockets = false
# --- Example: command-backed bearer token auth ---
# [model\_providers.proxy]
# name = "OpenAI using LLM proxy"
# base\_url = "https://proxy.example.com/v1"
# wire\_api = "responses"
#
# [model\_providers.proxy.auth]
# command = "/usr/local/bin/fetch-codex-token"
# args = ["--audience", "codex"]
# timeout\_ms = 5000
# refresh\_interval\_ms = 300000
# --- Example: Local OSS (e.g., Ollama-compatible) ---
# [model\_providers.local\_ollama]
# name = "Ollama"
# base\_url = "http://localhost:11434/v1"
# wire\_api = "responses"
################################################################################
# Apps / Connectors
################################################################################
# Optional per-app controls.
[apps]
# [\_default] applies to all apps unless overridden per app.
# [apps.\_default]
# enabled = true
# destructive\_enabled = true
# open\_world\_enabled = true
#
# [apps.google\_drive]
# enabled = false
# destructive\_enabled = false # block destructive-hint tools for this app
# default\_tools\_enabled = true
# default\_tools\_approval\_mode = "prompt" # auto | prompt | approve
#
# [apps.google\_drive.tools."files/delete"]
# enabled = false
# approval\_mode = "approve"
# Optional tool suggestion allowlist for connectors or plugins Codex can offer to install.
# [tool\_suggest]
# discoverables = [
# { type = "connector", id = "gmail" },
# { type = "plugin", id = "figma@openai-curated" },
# ]
# disabled\_tools = [
# { type = "plugin", id = "slack@openai-curated" },
# { type = "connector", id = "connector\_googlecalendar" },
# ]
################################################################################
# Profiles (named presets)
################################################################################
[profiles]
# [profiles.default]
# model = "gpt-5.4"
# model\_provider = "openai"
# approval\_policy = "on-request"
# sandbox\_mode = "read-only"
# service\_tier = "flex"
# oss\_provider = "ollama"
# model\_reasoning\_effort = "medium"
# plan\_mode\_reasoning\_effort = "high"
# model\_reasoning\_summary = "auto"
# model\_verbosity = "medium"
# personality = "pragmatic" # or "friendly" or "none"
# chatgpt\_base\_url = "https://chatgpt.com/backend-api/"
# model\_catalog\_json = "./models.json"
# model\_instructions\_file = "/absolute/or/relative/path/to/instructions.txt"
# experimental\_compact\_prompt\_file = "./compact\_prompt.txt"
# tools\_view\_image = true
# features = { unified\_exec = false }
################################################################################
# Projects (trust levels)
################################################################################
[projects]
# Mark specific worktrees as trusted or untrusted.
# [projects."/absolute/path/to/project"]
# trust\_level = "trusted" # or "untrusted"
################################################################################
# Tools
################################################################################
[tools]
# view\_image = true
################################################################################
# OpenTelemetry (OTEL) - disabled by default
################################################################################
[otel]
# Include user prompt text in logs. Default: false
log\_user\_prompt = false
# Environment label applied to telemetry. Default: "dev"
environment = "dev"
# Exporter: none (default) | otlp-http | otlp-grpc
exporter = "none"
# Trace exporter: none (default) | otlp-http | otlp-grpc
trace\_exporter = "none"
# Metrics exporter: none | statsig | otlp-http | otlp-grpc
metrics\_exporter = "statsig"
# Example OTLP/HTTP exporter configuration
# [otel.exporter."otlp-http"]
# endpoint = "https://otel.example.com/v1/logs"
# protocol = "binary" # "binary" | "json"
# [otel.exporter."otlp-http".headers]
# "x-otlp-api-key" = "${OTLP\_TOKEN}"
# [otel.exporter."otlp-http".tls]
# ca-certificate = "certs/otel-ca.pem"
# client-certificate = "/etc/codex/certs/client.pem"
# client-private-key = "/etc/codex/certs/client-key.pem"
# Example OTLP/gRPC trace exporter configuration
# [otel.trace\_exporter."otlp-grpc"]
# endpoint = "https://otel.example.com:4317"
# headers = { "x-otlp-meta" = "abc123" }
################################################################################
# Windows
################################################################################
[windows]
# Native Windows sandbox mode (Windows only): unelevated | elevated
sandbox = "unelevated"`
```