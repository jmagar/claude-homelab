---
name: openai
description: Lab's local wrapper around the OpenAI API — chat completions, embeddings, models, image generation, and audio endpoints. Use when the user asks to call the lab's OpenAI integration or invokes `lab openai` / `mcp__lab__openai`. NOT for: general OpenAI SDK usage in the user's own codebase.
---

# OpenAI

Chat completions, embeddings, models, image generation, and audio endpoints. Exposes **4 actions** (category: `ai`) via the `lab` homelab control plane.

## How to call it

**Prefer the MCP tool. Fall back to the CLI only when MCP is unavailable.**

### MCP (preferred)

One tool: `mcp__lab__openai` (or scoped `mcp__openai__openai` if this plugin's `.mcp.json` is active). Dispatch shape: `{ "action": "<name>", "params": {...} }`.

Discover actions live (always check before calling unfamiliar actions):
```json
{ "action": "help" }
{ "action": "schema", "params": { "action": "<name>" } }
```

Full action catalog with parameter types and `Destructive` flags:
[`references/mcp.md`](references/mcp.md).

### CLI fallback

```bash
lab openai --help                      # subcommand list
lab openai <action> --help             # parameter help for one action
lab --json openai <action> ...         # JSON output (parseable)
```

CLI mirrors MCP actions; dots become dashes (`model.list` → `model-list`). Full CLI surface: [`references/cli.md`](references/cli.md).

## Highlights

- `model.list` — List available models
- `chat.complete` — Create a chat completion
- `embed.create` — Create embeddings for one or more input strings
- `server.health` — Check whether the OpenAI API (or compatible server) is reachable

## Configuration

Credentials and base URLs live in `~/.lab/.env`. Onboard / re-extract with
`lab extract scan` and `lab extract apply`. Verify connectivity:

```bash
lab doctor service openai
```

## Destructive actions

OpenAI has **no destructive actions** in this catalog — every action is read-only or non-mutating. No special confirmation required.

## When NOT to use this skill

- The user is asking about a different lab service — load that service's skill instead.
- The user is asking about `lab` itself (CLI internals, install, gateway, doctor across all services) — that's operator-tier, not `openai`-specific.
