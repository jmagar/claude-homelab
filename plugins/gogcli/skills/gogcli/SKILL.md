---
name: gogcli
description: This skill should be used when the user asks to "automate gmail", "export calendar events", "google drive cli", "google workspace admin", "search gmail from terminal", "upload to google drive", "read google sheets cli", "manage google workspace users", "gogcli", or wants to script Google Workspace services from the command line. Do NOT trigger for "GOG", "GOG.com", "Good Old Games", "game downloads", or anything related to the GOG video game platform.
---

# gogcli — Google Workspace CLI

**gogcli** (by Peter Steinberger, https://github.com/steipete/gogcli) is a Google Workspace CLI tool — NOT GOG.com or the Good Old Games platform. It provides a script-friendly `gog` command for Gmail, Calendar, Drive, Docs, Sheets, Slides, Chat, Contacts, Tasks, People, Admin, Groups, Keep, Classroom, Forms, and Apps Script. Pure CLI — no MCP server, no daemon required.

---

## Installation

```bash
# macOS
brew install gogcli

# Arch Linux
yay -S gogcli

# From release binaries
# Download from https://github.com/steipete/gogcli/releases
```

The binary is named `gog` (not `gogcli`).

---

## Authentication

### Step 1 — OAuth credentials

Create a Desktop app OAuth client in Google Cloud Console and download the JSON:

```bash
gog auth credentials ~/Downloads/client_secret_....json
```

### Step 2 — Authorize an account

```bash
gog auth add you@gmail.com
```

### Headless / CI authorization

```bash
# Manual code entry (no browser required)
gog auth add you@gmail.com --manual

# Remote two-step flow
gog auth add you@gmail.com --remote --step 1
```

See [tips-gotchas.md](references/tips-gotchas.md) for CI/headless details including the `--token` flag and encrypted keyring workaround.

### Service accounts (Workspace only)

```bash
gog auth service-account set admin@yourdomain.com --key ~/Downloads/sa.json
```

**Security:** Service accounts with domain-wide delegation (DwD) carry extreme risk. See [configuration.md](references/configuration.md#domain-wide-delegation-threat-model).

### Multi-account aliases

```bash
gog auth alias set work work@company.com
gog auth alias set personal me@gmail.com
```

---

## Global Flags

| Flag | Purpose |
|------|---------|
| `--account <email>` | Select which Google account |
| `--json` | Machine-readable JSON output |
| `--plain` | Stable TSV output for piping |
| `--no-input` | Fail rather than prompt (CI-safe) |
| `--force` | Skip destructive confirmations |
| `--verbose` | Detailed logging |

`GOG_ACCOUNT`, `GOG_JSON`, `GOG_PLAIN` are the equivalent env vars.

---

## 8 Key Actions

### 1. Gmail search

```bash
gog gmail search 'newer_than:7d is:unread' --max 20 --json
gog gmail thread get <threadId>
```

### 2. Gmail send

```bash
gog gmail send --to user@example.com --subject "Hello" --body "Message"
gog gmail send --to user@example.com --body-file ./message.txt --signature
```

### 3. Calendar events

```bash
gog calendar events primary --today
gog calendar events primary --week
gog calendar create primary --summary "Standup" \
  --from 2025-06-01T10:00:00Z --to 2025-06-01T10:30:00Z
```

### 4. Drive upload

```bash
gog drive upload ./report.pdf --parent <folderId>
gog drive upload ./notes.md --convert   # Markdown → Google Doc
```

### 5. Drive search

```bash
gog drive search "invoice filetype:pdf" --max 20 --json
gog drive download <fileId> --format pdf --out ./local.pdf
```

### 6. Sheets read

```bash
gog sheets get <spreadsheetId> 'Sheet1!A1:D10'
gog sheets update <spreadsheetId> 'A1' 'value1|value2'
gog sheets append <spreadsheetId> 'Sheet1!A:C' 'new|row|data'
```

### 7. Admin users (Workspace only)

```bash
gog admin users list --domain example.com --json
gog admin users create user@example.com --given Ada --family Lovelace
gog admin groups members add eng@example.com user@example.com
```

### 8. Multi-account switch

```bash
# Per-command
gog --account work@company.com gmail search 'is:unread'

# Environment variable
export GOG_ACCOUNT=personal@gmail.com
gog calendar events primary --today
```

---

## Scope Management

```bash
# Authorize with specific services only
gog auth add you@gmail.com --services gmail,calendar

# Read-only drive access
gog auth add you@gmail.com --services drive --readonly

# Add extra OAuth scopes
gog auth add you@gmail.com --extra-scopes https://www.googleapis.com/auth/...
```

---

## Reference

- All 15+ service CLI commands: [cli-commands.md](references/cli-commands.md)
- Auth, config file, DwD threat model, scope guidance: [configuration.md](references/configuration.md)
- CI/headless auth, keyring issues, rate limits: [tips-gotchas.md](references/tips-gotchas.md)
