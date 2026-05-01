# gogcli Tips and Gotchas

---

## Non-Interactive / CI / Headless Authentication

The default OS keyring backend (macOS Keychain, Linux Secret Service) requires an interactive desktop session. In CI pipelines, Docker containers, SSH sessions, and background cron jobs the keyring is typically unavailable, causing `gog` to hang or fail with a keyring error.

### Solution 1: Encrypted file keyring

Switch to the file-based keyring, which stores tokens in an encrypted local file:

```bash
export GOG_KEYRING_BACKEND=file
export GOG_KEYRING_PASSWORD=your-secure-passphrase

# Authorize once in an interactive session with these vars set
gog auth add you@gmail.com

# All subsequent non-interactive calls just need the env vars
GOG_KEYRING_BACKEND=file GOG_KEYRING_PASSWORD=... gog gmail search 'is:unread' --json
```

Store `GOG_KEYRING_PASSWORD` in your CI secrets (GitHub Actions secret, Vault, etc.). Never hardcode it.

### Solution 2: Direct access token (`--token`)

For short-lived automation, pass an OAuth access token directly:

```bash
gog --token "$GOOGLE_ACCESS_TOKEN" gmail search 'is:unread'
```

Access tokens expire in 1 hour. Use this pattern when your CI already obtains a token via Workload Identity or another mechanism.

### Solution 3: Remote/manual auth flow

To authorize without a browser on the CI machine:

```bash
# Step 1 on CI: generates auth URL
gog auth add you@gmail.com --remote --step 1

# Step 2: visit URL on another machine, paste back the auth code
gog auth add you@gmail.com --manual
```

### Headless Linux — libsecret not installed

If you want the OS keyring on a headless Linux server, install `gnome-keyring` or `kwallet` and ensure a D-Bus session is running. This is complex — prefer the file keyring for servers.

---

## Binary Name: `gog`, Not `gogcli`

After installation the binary is `gog`, not `gogcli`. The repository name is `gogcli` (to disambiguate from Magnitus-/gogcli which is the GOG.com game client), but the installed command is `gog`.

```bash
# Correct
gog gmail search 'is:unread'

# Wrong
gogcli gmail search 'is:unread'
```

---

## First-Run OAuth Scope Decisions Are Permanent

OAuth scopes are baked into the stored token at `gog auth add` time. If you later need a scope you did not authorize initially (e.g., you added `--services gmail` but now need `calendar`), you must re-authorize:

```bash
# Remove existing token
gog auth remove you@gmail.com

# Re-authorize with expanded scopes
gog auth add you@gmail.com --services gmail,calendar,drive
```

---

## Rate Limiting and Quotas

Google APIs have per-user and per-project daily quotas. Heavy batch operations can exhaust them.

- Gmail search: 250 requests/second per user is generous, but bulk thread operations can hit daily limits.
- Drive upload: Large files count against Drive storage, not API quota.
- Admin API: 10 QPS per domain. Use `--json` and batch via `xargs` carefully.

Mitigation:

```bash
# Throttle with xargs -P 1 and sleep
gog --json gmail search 'older_than:1y' --max 200 | \
  jq -r '.threads[].id' | \
  xargs -n 50 -P 1 bash -c 'gog gmail trash "$@"; sleep 1' --
```

---

## JSON Output and `jq` Patterns

Always use `--json` for agentic/scripted use:

```bash
# Extract thread IDs from search results
gog gmail search 'from:boss@example.com' --json | jq -r '.threads[].id'

# List Drive file IDs and names
gog drive search "invoice" --json | jq -r '.files[] | "\(.id)\t\(.name)"'

# Get today's calendar events as a list
gog calendar events primary --today --json | jq '.events[]'
```

---

## `--no-input` in Automation

Always use `--no-input` in scripts to prevent interactive prompts from stalling a pipeline:

```bash
gog --no-input gmail send --to user@example.com --subject "Report" --body-file ./report.txt
```

Without `--no-input`, some operations may pause asking for confirmation.

---

## Workspace-Only Services

The following services only work with Google Workspace (formerly G Suite) accounts, not personal Gmail:

- `gog admin` — requires Workspace + DwD service account
- `gog groups` — requires Workspace
- `gog keep` — requires Workspace
- `gog chat` — requires Workspace
- `gog classroom` — requires Workspace for Education

If you call these with a personal `@gmail.com` account, they will return permission errors.

---

## Service Account Key Security

- Service account JSON key files have no expiry by default. Rotate them at least annually.
- Never commit key files to git. Add `*-service-account*.json`, `*-sa.json`, `*-key.json` to your `.gitignore`.
- If a key is suspected leaked: immediately disable it in Google Cloud Console → IAM → Service Accounts → Keys, then generate a new one.

---

## Config File JSON5 Syntax

The config file uses JSON5, not strict JSON. This means:
- Comments are allowed (`// like this`)
- Trailing commas are allowed
- Unquoted keys are allowed

Do not open the config file with a strict JSON parser — it will fail.

---

## Checking What Scopes a Token Has

```bash
gog auth status you@gmail.com --json
```

This shows the stored scopes. Verify before writing automation that assumes a particular scope is available.
