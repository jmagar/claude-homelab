---
name: sweetlink
description: macOS-only Chrome+DevTools browser automation daemon by Peter Steinberger. This skill should be used when the user mentions sweetlink, controlled Chrome sessions, browser automation against a local dev server, OAuth consent automation, smoke-testing routes, JavaScript execution in a browser tab, or capturing page screenshots via the sweetlink CLI. All commands require the daemon to be running first.
---

# SweetLink

**macOS only.** SweetLink is a Chrome+DevTools automation daemon. It controls a Chrome window connected to your local dev server, automates OAuth consent flows, runs smoke tests, and executes JavaScript in live browser sessions. It requires Full Disk Access and Automation permissions on first run — grant them when macOS prompts.

## Daemon lifecycle

The daemon is a prerequisite for every other command. Nothing works without it.

```bash
sweetlink daemon            # launch the daemon
sweetlinkd                  # alternative: run daemon directly in foreground
```

To stop: send SIGINT (Ctrl-C) to the foreground process or `kill <pid>`. To verify it is running, try `sweetlink sessions` or `curl -s https://localhost:4455/health`.

The daemon binds to `https://localhost:4455` by default (TLS via mkcert). Run `sweetlink trust-ca` once per machine before first use:

```bash
sweetlink trust-ca
```

**Daemon does not survive reboots.** See [`references/tips-gotchas.md`](references/tips-gotchas.md) for launchd auto-start registration.

## 8 core actions

### `daemon-start` — start the daemon
```bash
sweetlink daemon        # launches daemon, forwards extra args to sweetlinkd
sweetlinkd              # alternative: start daemon directly in foreground
```

### `open` — launch or reuse a controlled Chrome window
```bash
sweetlink open                           # use configured appUrl
sweetlink open --path /dashboard         # navigate to a specific route
sweetlink open --url https://example.com # one-off URL override
sweetlink open --foreground              # keep window visible
sweetlink open --timeout 60              # readiness timeout in seconds
```

### `smoke` — run route sweep tests
```bash
sweetlink smoke                          # use default routes from sweetlink.json
sweetlink smoke --routes main            # use named preset
sweetlink smoke --env prod               # run against prodUrl
```

### `devtools-authorize` — automate OAuth consent (see security rules below)
```bash
sweetlink devtools authorize
sweetlink devtools authorize --oauth-script ./oauth-handler.ts
```

### `run-js` — execute JavaScript in the active session
```bash
sweetlink run-js "document.title"
sweetlink run-js "window.location.href"
```

### `screenshot` — capture a page screenshot
```bash
sweetlink screenshot                           # full page to /tmp/sweetlink-<ts>.jpg
sweetlink screenshot -s "#main-content"        # capture specific CSS selector
sweetlink screenshot -o /tmp/out.jpg -q 0.8   # custom output and quality
```

### `sessions-list` — view active sessions
```bash
sweetlink sessions
```

### `trust-ca` — install the mkcert certificate authority (one-time setup)
```bash
sweetlink trust-ca
```

## devtools authorize — security rules

`devtools authorize` auto-clicks OAuth consent buttons. Follow these rules every time:

1. **Per-origin allowlist only.** Only automate consent for origins that have been explicitly pre-approved in `sweetlink.json` before the session starts. Do not approve origins ad-hoc.
2. **Hard deny: admin/broad scopes.** Never auto-approve `offline_access`, `*.admin`, `*all*`, or any scope granting broad or administrative access. These require explicit manual user approval.
3. **Visible notification required.** Every auto-approved consent must produce a visible terminal notification so the user knows what was approved.
4. **Session scope only.** Auto-approval settings reset when the daemon restarts. They do not persist across daemon restarts.

## Configuration

Settings resolve in this order (highest wins): CLI flags → `sweetlink.json` → environment variables → defaults.

Place `sweetlink.json` in the project root. Full schema: [`references/configuration.md`](references/configuration.md).

Key environment variables: `SWEETLINK_APP_URL`, `SWEETLINK_DAEMON_URL`, `SWEETLINK_ADMIN_API_KEY` (**security-critical** — if unset, the daemon accepts all requests unauthenticated; must be set before starting the daemon on shared machines or in CI). Full list and auth posture in [`references/configuration.md`](references/configuration.md).

## Full command reference

[`references/cli-commands.md`](references/cli-commands.md) — all commands, subcommands, and flags.

## Tips and gotchas

[`references/tips-gotchas.md`](references/tips-gotchas.md) — Full Disk Access prompts, daemon lifecycle, launchd auto-start registration, OAuth risks.

## When NOT to use this skill

- The user is on Linux or Windows and expects system-level Chrome DevTools automation — the macOS permission model (Full Disk Access, Automation) does not apply there.
- The user wants a headless Playwright or Puppeteer workflow without a persistent daemon.
- The user's question is about Playwright MCP or another browser-automation tool unrelated to sweetlink.
