---
name: apprise
description: Lab's Apprise integration — universal notification dispatcher — 100+ services behind one URL scheme. Use when the user wants to manage their Apprise instance, or invokes `lab apprise` / `mcp__lab__apprise`. Calls the MCP tool first, falls back to the CLI if MCP is unavailable.
---

# Apprise

Universal notification dispatcher — 100+ services behind one url scheme. Exposes **8 actions** (category: `notifications`) via the `lab` homelab control plane.

## How to call it

**Prefer the MCP tool. Fall back to the CLI only when MCP is unavailable.**

### MCP (preferred)

One tool: `mcp__lab__apprise` (or scoped `mcp__apprise__apprise` if this plugin's `.mcp.json` is active). Dispatch shape: `{ "action": "<name>", "params": {...} }`.

Discover actions live (always check before calling unfamiliar actions):
```json
{ "action": "help" }
{ "action": "schema", "params": { "action": "<name>" } }
```

Full action catalog with parameter types and `Destructive` flags:
[`references/mcp.md`](references/mcp.md).

### CLI fallback

```bash
lab apprise --help                      # subcommand list
lab apprise <action> --help             # parameter help for one action
lab --json apprise <action> ...         # JSON output (parseable)
```

CLI mirrors MCP actions; dots become dashes (`server.health` → `server-health`). Full CLI surface: [`references/cli.md`](references/cli.md).

## Highlights

- `server.health` — Check whether the Apprise API is healthy
- `notify.send` — Send a stateless notification to the supplied URLs
- `notify.key.send` — Send a notification using a stored config key
- `config.add` — Persist a YAML/text Apprise config blob under a named key
- `config.get` — Retrieve the stored config blob for a named key
- `config.delete` — Delete the stored config for a named key
- `config.urls` — List the notification URLs stored under a named key
- `server.details` — Retrieve server details listing all loaded Apprise plugins

## Configuration

Credentials and base URLs live in `~/.lab/.env`. Onboard / re-extract with
`lab extract scan` and `lab extract apply`. Verify connectivity:

```bash
lab doctor service apprise
```

## Destructive actions

Apprise exposes 1 destructive action(s): `config.delete`. These mutate state — confirm with the user before invoking. The full `Destructive` column is in `references/mcp.md`.

## When NOT to use this skill

- The user is asking about a different lab service — load that service's skill instead.
- The user is asking about `lab` itself (CLI internals, install, gateway, doctor across all services) — that's operator-tier, not `apprise`-specific.
