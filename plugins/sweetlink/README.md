# sweetlink

> **macOS only.** Chrome+DevTools browser automation daemon by Peter Steinberger.

Wraps the [`sweetlink`](https://github.com/steipete/sweetlink) CLI for Claude Code — controlled Chrome sessions, OAuth consent automation, smoke tests, JavaScript execution, and screenshot capture.

## Requirements

- macOS (Full Disk Access + Automation permissions required)
- Node.js 24+
- pnpm (via Corepack): `corepack enable`
- TLS: `brew install mkcert nss`

## Install

```bash
pnpm install -g @steipete/sweetlink
sweetlink trust-ca          # one-time: installs mkcert CA
```

## Quick start

```bash
sweetlink daemon            # start daemon (prerequisite for all other commands)
sweetlink open              # launch controlled Chrome window
sweetlink smoke             # run route sweep tests
sweetlink sessions          # list active sessions
```

## Plugin

This plugin is pure CLI — no MCP server. All functionality is via the `sweetlink` binary. See `skills/sweetlink/SKILL.md` for Claude Code integration patterns.
