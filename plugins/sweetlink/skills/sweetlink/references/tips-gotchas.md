# SweetLink Tips & Gotchas

## macOS system permissions

SweetLink controls Chrome via the Accessibility and Automation APIs. macOS will prompt for permissions on first use.

### Full Disk Access

Chrome (and the sweetlink daemon) may need Full Disk Access to read profile data and cookies from protected directories.

**Grant it:**
1. System Settings → Privacy & Security → Full Disk Access
2. Click `+` and add both `Google Chrome` and your terminal app (e.g. iTerm2, Terminal, Warp)
3. Restart Chrome after granting

Without this, cookie harvesting and some session operations fail silently or return empty results.

### Automation permission

When sweetlink first drives Chrome, macOS shows:
> "Terminal" wants to control "Google Chrome"

Click **OK**. If you accidentally clicked "Don't Allow," revoke and re-grant:
1. System Settings → Privacy & Security → Automation
2. Enable the toggle next to "Google Chrome" under your terminal app

---

## Daemon lifecycle

The daemon is a **foreground process** — it does not run as a system service by default and stops when you close the terminal or reboot.

### Manual start/stop

```bash
sweetlink daemon          # launch daemon (or sweetlinkd in foreground)
# To stop: Ctrl-C in the terminal, or kill <pid>
# To check: sweetlink sessions  (or curl -s https://localhost:4455/health)
```

### launchd auto-start registration (recommended for development machines)

Create a launchd plist so the daemon starts on login:

```bash
mkdir -p ~/Library/LaunchAgents
cat > ~/Library/LaunchAgents/com.steipete.sweetlink.daemon.plist << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>com.steipete.sweetlink.daemon</string>
  <key>ProgramArguments</key>
  <array>
    <string>/usr/local/bin/sweetlink</string>
    <string>daemon</string>
  </array>
  <key>RunAtLoad</key>
  <true/>
  <key>KeepAlive</key>
  <true/>
  <key>StandardOutPath</key>
  <string>/tmp/sweetlink-daemon.log</string>
  <key>StandardErrorPath</key>
  <string>/tmp/sweetlink-daemon-err.log</string>
</dict>
</plist>
EOF
launchctl load ~/Library/LaunchAgents/com.steipete.sweetlink.daemon.plist
```

**Adjust the path** to match your actual `sweetlink` binary location (`which sweetlink`).

**Unload when no longer needed:**
```bash
launchctl unload ~/Library/LaunchAgents/com.steipete.sweetlink.daemon.plist
```

**Check if the launchd job is running:**
```bash
launchctl list | grep sweetlink
```

---

## Daemon TLS certificate

The daemon uses `https://localhost:4455`. If you see TLS errors:

1. Run `sweetlink trust-ca` (installs the mkcert CA — one-time per machine)
2. Restart Chrome (needed for it to pick up the new CA)
3. Restart the daemon

**Prerequisites for trust-ca:**
```bash
brew install mkcert nss    # mkcert = cert generator; nss = Chrome/Firefox NSS store
```

---

## OAuth auto-approval risks

`devtools authorize` clicks consent buttons automatically. Risks to be aware of:

### Unintended scope grants

If the OAuth flow requests broad or admin scopes (`offline_access`, `*.admin`, user data exports), auto-clicking grants them silently. Always inspect the OAuth URL and scope list before enabling auto-approval.

**Hard rule:** Never configure auto-approval for:
- `offline_access` — grants long-lived refresh tokens
- `*.admin` or any admin-prefixed scope
- `*all*` or wildcard scope grants
- Any scope you did not explicitly expect from this origin

### Origin drift

The same OAuth provider may show different consent screens for different origins. Allowlists configured for `https://app.example.dev` do not automatically apply to `https://staging.example.dev`. Review origin bindings when you add environments.

### Session scope — auto-approval does not persist

Auto-approval settings are in-memory only. When the daemon restarts, all auto-approval state is cleared. You must re-configure or re-confirm after each daemon restart.

### Notification requirement

Every auto-approved consent must produce a visible terminal notification. If you are using a custom `oauthScript`, add an explicit log line or system notification when your `authorize()` function returns `true`:

```typescript
export async function authorize(context) {
  const approved = isAllowed(context);
  if (approved) {
    console.log(`[sweetlink] Auto-approved OAuth consent: ${context.origin} scopes=${context.scopes.join(',')}`);
  }
  return approved;
}
```

---

## Port conflicts

If `https://localhost:4455` is already in use:

```bash
SWEETLINK_DAEMON_URL=https://localhost:4456 sweetlink daemon
```

Or set `daemonUrl` in `sweetlink.json`. Pass `--daemon-url` to all client commands when using a non-default port.

---

## Chrome version compatibility

SweetLink targets the Chrome DevTools Protocol. It works with stable Chrome. Chromium and Chrome Beta also work. Chrome Canary may have CDP breaking changes — prefer stable for automation workflows.

---

## Node.js version requirement

Requires Node.js 24.0.0 or higher. Check with:

```bash
node --version    # must be v24.x or higher
```

If you use `nvm` or `fnm`:
```bash
nvm install 24
nvm use 24
```

---

## pnpm and Corepack

The recommended install method uses pnpm via Corepack:

```bash
corepack enable           # enable Corepack (ships with Node 16+)
pnpm install -g @steipete/sweetlink
```

If `corepack` is not found, install it:
```bash
npm install -g corepack
corepack enable
```
