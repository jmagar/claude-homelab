# SweetLink CLI Command Reference

Binary: `sweetlink` (also `sweetlinkd` to start the daemon directly).

Install: `pnpm install -g @steipete/sweetlink`

---

## daemon

Launch the sweetlink daemon process. The daemon must be running for all other commands.

```
sweetlink daemon [args...]
```

Starts the daemon directly. Any additional arguments are forwarded to the underlying `sweetlinkd` process.

Alternative: run `sweetlinkd` directly to start the daemon in the foreground.

To stop the daemon: send SIGINT (Ctrl-C in the foreground terminal) or `kill <pid>`.

To check if the daemon is running: `curl -s https://localhost:4455/health` or try `sweetlink sessions`.

---

## open

Launch or reuse a controlled Chrome window connected to the configured app.

```
sweetlink open [flags]
```

| Flag | Description |
|------|-------------|
| `--path <path>` | Navigate to a specific app route (e.g. `/dashboard`) |
| `--url <url>` | One-off URL override — ignores `appUrl` config |
| `--app-url <url>` | Set dev-mode default URL for this invocation |
| `--foreground` | Keep the browser window visible |
| `--timeout <seconds>` | Readiness timeout before giving up (default: 45) |
| `--oauth-script <path>` | Path to OAuth handler ESM module |
| `--admin-key <key>` | Provide API authentication key |
| `--daemon-url <url>` | Override daemon location |
| `--port <number>` | Temporarily rewrite the local port |

---

## sessions

List active browser sessions with metadata (URL, session ID, timestamps).

```
sweetlink sessions
```

No flags.

---

## smoke

Execute a route sweep test — navigates a set of routes and checks for errors.

```
sweetlink smoke [flags]
```

| Flag | Description |
|------|-------------|
| `--routes <preset>` | Use a named route preset (e.g. `main`, `settings`, `billing-only`, `pulse-only`) |
| `--env prod` | Run against the `prodUrl` configured in `sweetlink.json` |
| `--admin-key <key>` | Provide API authentication key |
| `--daemon-url <url>` | Override daemon location |
| `--port <number>` | Temporarily rewrite the local port |

Routes are configured via `smokeRoutes` in `sweetlink.json`. If no config is found, the default preset is used.

---

## devtools authorize

Force-click the OAuth consent button when a third-party identity provider prompts during an automated session.

```
sweetlink devtools authorize [flags]
```

| Flag | Description |
|------|-------------|
| `--oauth-script <path>` | Path to an ESM module exporting `authorize(context)` for custom consent logic |
| `--admin-key <key>` | Provide API authentication key |
| `--daemon-url <url>` | Override daemon location |

**Security rules apply — see SKILL.md security section before using.**

---

## run-js

Execute JavaScript in the active browser session and return the result.

```
sweetlink run-js "<expression>"
```

Examples:
```bash
sweetlink run-js "document.title"
sweetlink run-js "window.location.href"
sweetlink run-js "JSON.stringify(window.__APP_STATE__)"
```

Global flags (`--admin-key`, `--daemon-url`, `--port`) apply.

---

## screenshot

Capture a screenshot of the current page in the active session.

```
sweetlink screenshot [flags]
```

| Flag | Description |
|------|-------------|
| `-s, --selector <selector>` | CSS selector to capture (default: full page) |
| `-q, --quality <0-1>` | JPEG quality 0–1 (default: 0.92) |
| `-o, --output <path>` | Output path (default: `/tmp/sweetlink-<timestamp>.jpg`) |
| `-t, --timeout <ms>` | Command timeout in milliseconds (default: 30,000) |
| `--devtools-url <url>` | DevTools HTTP endpoint (default: `http://127.0.0.1:9222`) |
| `--method <method>` | Capture method: `auto`, `puppeteer`, `html2canvas`, `html-to-image` |
| `--scroll-into-view` | Scroll target into view before capturing |
| `--scroll-selector <selector>` | Selector to scroll into view |
| `--wait-for-selector <selector>` | Wait for a selector to appear before capturing |
| `--wait-visible` | Require the wait selector to be visible |
| `--wait-timeout <ms>` | Timeout for wait-for-selector (default: 10,000) |
| `--delay <ms>` | Delay after hooks run (default: 0) |
| `--before-script <codeOrPath>` | Inline JS or `@path` to run before capture |
| `--prompt <prompt>` | Send the screenshot to Codex for analysis |

---

## console

Attach to the browser console of the active session to stream console output.

```
sweetlink console
```

Global flags apply.

---

## trust-ca

Install the mkcert Certificate Authority into the system trust store. Run once per machine before first use.

```
sweetlink trust-ca
```

Requires `mkcert` and `nss` to be installed (`brew install mkcert nss`). Installs the CA so that Chrome trusts the daemon's TLS certificate at `https://localhost:4455`.

---

## Global flags

These flags work with most commands:

| Flag | Description |
|------|-------------|
| `--admin-key <key>` | API authentication (overrides `SWEETLINK_ADMIN_API_KEY` / `adminKey` in config) |
| `--daemon-url <url>` | Daemon location (overrides `SWEETLINK_DAEMON_URL` / `daemonUrl` in config) |
| `--port <number>` | Temporarily rewrite the local port for this invocation |

---

## Configuration resolution order

CLI flags > `sweetlink.json` (searched upward from CWD) > environment variables > built-in defaults (`http://localhost:3000` for app, `https://localhost:4455` for daemon).
