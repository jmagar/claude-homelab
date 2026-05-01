# gogcli — Google Workspace CLI Plugin

Claude Code plugin wrapping [gogcli](https://github.com/steipete/gogcli) by Peter Steinberger — a script-friendly CLI for Google Workspace services.

> **Not GOG.com.** This plugin wraps the Google Workspace CLI tool `gogcli`. For the GOG.com game client, see [Magnitus-/gogcli](https://github.com/Magnitus-/gogcli) — a completely separate project.

---

## What it covers

Gmail, Calendar, Drive, Docs, Sheets, Slides, Chat, Contacts, Tasks, People, Admin, Groups, Keep, Classroom, Forms, Apps Script.

Pure CLI — no MCP server, no daemon, no cloud relay. The `gog` binary runs locally and communicates directly with Google APIs.

---

## Prerequisites

1. **Install gogcli**

   ```bash
   # macOS
   brew install gogcli

   # Arch Linux
   yay -S gogcli

   # Or download a release binary from:
   # https://github.com/steipete/gogcli/releases
   ```

   Verify: `gog --help`

2. **Create a Google Cloud OAuth client**

   - Go to [console.cloud.google.com](https://console.cloud.google.com)
   - Create a project (or use an existing one)
   - Enable the APIs you need (Gmail API, Calendar API, Drive API, etc.)
   - Create credentials → Desktop app OAuth client
   - Download the JSON file

3. **Store credentials and authorize**

   ```bash
   gog auth credentials ~/Downloads/client_secret_....json
   gog auth add you@gmail.com
   ```

---

## Quick Start

```bash
# Search Gmail
gog gmail search 'newer_than:7d is:unread' --json

# Today's calendar
gog calendar events primary --today

# Search Drive
gog drive search "invoice" --max 10 --json

# Read a spreadsheet range
gog sheets get <spreadsheetId> 'Sheet1!A1:D10'
```

---

## Multi-Account Setup

```bash
gog auth alias set work work@company.com
gog auth alias set personal me@gmail.com

gog --account work gmail search 'is:unread'
# or
export GOG_ACCOUNT=personal
gog calendar events primary --today
```

---

## CI / Headless Usage

The OS keyring is not available in non-interactive environments. Use the encrypted file keyring:

```bash
export GOG_KEYRING_BACKEND=file
export GOG_KEYRING_PASSWORD=your-passphrase   # Store in CI secrets

gog --no-input gmail search 'is:unread' --json
```

See `skills/gogcli/references/tips-gotchas.md` for full details.

---

## Security: Domain-Wide Delegation

Service accounts with domain-wide delegation (DwD) are required for `gog admin` commands. **Treat DwD credentials as equivalent to domain admin credentials.** A compromised service account key can read/write every user's Gmail, Drive, and Classroom data across your entire organization.

See `skills/gogcli/references/configuration.md` for the full threat model and recommended posture.

---

## Plugin Structure

```
plugins/gogcli/
├── .claude-plugin/plugin.json       # Plugin manifest
├── .mcp.json                        # Empty MCP config (no MCP server)
├── README.md                        # This file
├── CHANGELOG.md
└── skills/gogcli/
    ├── SKILL.md                     # Skill definition
    └── references/
        ├── cli-commands.md          # All 16 services with examples
        ├── configuration.md         # Auth, config file, DwD threat model
        └── tips-gotchas.md          # CI/headless, rate limits, JSON patterns
```

---

## Source

- Repository: https://github.com/steipete/gogcli
- Author: Peter Steinberger
- License: MIT
- Version: v0.14.0 (Go 1.26.2+)
