# gogcli CLI Command Reference

All commands use the `gog` binary. Source: https://github.com/steipete/gogcli

---

## Global Flags

```
--account <email>    Select Google account (or set GOG_ACCOUNT env var)
--json               JSON output
--plain              TSV output
--no-input           Fail on prompts (CI-safe)
--force              Skip confirmations
--verbose            Detailed logging
--enable-commands    Allowlist of commands (sandboxing)
--disable-commands   Denylist of commands
```

---

## Authentication (`gog auth`)

```bash
gog auth credentials ~/client_secret.json          # Store OAuth client JSON
gog auth add you@gmail.com                          # Authorize account (opens browser)
gog auth add you@gmail.com --manual                 # Headless: paste auth code
gog auth add you@gmail.com --remote --step 1        # Remote two-step flow
gog auth add you@gmail.com --services gmail,drive   # Limit OAuth scopes
gog auth add you@gmail.com --services drive --readonly
gog auth add you@gmail.com --gmail-scope readonly
gog auth add you@gmail.com --drive-scope file
gog auth add you@gmail.com --extra-scopes https://googleapis.com/auth/...
gog auth service-account set admin@domain.com --key ~/sa.json
gog auth alias set work work@company.com
gog auth alias set personal me@gmail.com
```

---

## Gmail (`gog gmail`)

```bash
# Search
gog gmail search 'newer_than:7d'
gog gmail search 'from:boss@example.com is:unread' --max 50
gog gmail search 'older_than:1y' --max 200 --json

# Read
gog gmail thread get <threadId>
gog gmail thread get <threadId> --download    # Download attachments

# Send
gog gmail send --to a@b.com --subject "Hi" --body "Message"
gog gmail send --to a@b.com --body-file ./message.txt --signature
gog gmail drafts create --subject "Draft" --body "Body"
gog gmail drafts send <draftId>

# Labels
gog gmail labels list
gog gmail labels create "My Label"
gog gmail labels rename "Old Label" "New Label"
gog gmail thread modify <threadId> --add STARRED --remove INBOX

# Batch
gog gmail trash <messageId>
gog gmail batch modify <messageId> --add STARRED

# Settings
gog gmail vacation get
gog gmail vacation enable --subject "OOO" --message "Back Monday"
gog gmail autoforward get
gog gmail delegates list

# Email tracking (requires Cloudflare Worker setup)
gog gmail track setup --worker-url https://tracker.example.workers.dev
gog gmail send --to user@example.com --subject "Hello" --track
gog gmail track opens <tracking_id>
```

---

## Calendar (`gog calendar`)

```bash
gog calendar events primary --today
gog calendar events primary --week
gog calendar events primary --days 3
gog calendar search "standup" --tomorrow
gog calendar create primary \
  --summary "Meeting" \
  --from 2025-06-01T10:00:00Z \
  --to 2025-06-01T11:00:00Z \
  --attendees "alice@example.com,bob@example.com"
gog calendar respond primary <eventId> --status accepted
gog calendar freebusy --calendars "primary" \
  --from 2025-06-01T00:00:00Z --to 2025-06-02T00:00:00Z
gog calendar team <group-email> --today
gog calendar team <group-email> --freebusy
```

---

## Drive (`gog drive`)

```bash
gog drive ls --max 20
gog drive search "invoice" --max 20
gog drive search "invoice" --parent <folderId>
gog drive upload ./file.pdf --parent <folderId>
gog drive upload ./notes.md --convert             # Markdown → Google Doc
gog drive download <fileId> --out ./file.bin
gog drive download <fileId> --format pdf --out ./exported.pdf
gog drive mkdir "New Folder"
gog drive rename <fileId> "New Name"
gog drive move <fileId> --parent <destinationFolderId>
gog drive delete <fileId>
gog drive permissions <fileId>
gog drive share <fileId> --to user --email user@example.com --role reader
```

---

## Docs (`gog docs`)

```bash
gog docs create "My Document"
gog docs create "My Document" --file ./doc.md
gog docs cat <docId>                              # Print document text
gog docs update <docId> --text "Append this text"
gog docs export <docId> --format pdf --out ./doc.pdf
```

---

## Sheets (`gog sheets`)

```bash
gog sheets get <spreadsheetId> 'Sheet1!A1:D10'
gog sheets update <spreadsheetId> 'A1' 'val1|val2'
gog sheets append <spreadsheetId> 'Sheet1!A:C' 'new|row|data'
gog sheets format <spreadsheetId> 'Sheet1!A1:B2' \
  --format-json '{"textFormat":{"bold":true}}'
```

---

## Slides (`gog slides`)

```bash
gog slides create "My Presentation"
gog slides create-from-markdown "My Deck" --content-file ./slides.md
gog slides export <presentationId> --format pdf --out ./deck.pdf
gog slides replace-text <presentationId> "old text" "new text"
```

---

## Forms (`gog forms`)

```bash
# Forms commands — use `gog forms --help` for current subcommands
gog forms --help
```

---

## Contacts (`gog contacts`)

```bash
gog contacts list --max 50
gog contacts search "Ada" --max 50
gog contacts create --given "John" --family "Doe" --email "john@example.com"
gog contacts update people/<resourceName> --given "Jane" --email "jane@example.com"
gog contacts directory list                       # Workspace directory only
```

---

## Tasks (`gog tasks`)

```bash
gog tasks lists
gog tasks list <tasklistId> --max 50
gog tasks add <tasklistId> --title "Task title"
gog tasks add <tasklistId> --title "Weekly sync" --due 2025-02-01 --repeat weekly
gog tasks done <tasklistId> <taskId>
gog tasks delete <tasklistId> <taskId>
```

---

## People (`gog people`)

```bash
gog people --help                                 # Directory lookup and profile search
```

---

## Chat (`gog chat`) — Workspace only

```bash
gog chat spaces list
gog chat spaces find "Engineering"
gog chat messages send spaces/<spaceId> --text "Message"
gog chat dm send user@company.com --text "ping"
```

---

## Groups (`gog groups`) — Workspace only

```bash
gog groups list --domain example.com --json
# Additional subcommands: see gog groups --help
```

---

## Keep (`gog keep`) — Workspace only

```bash
gog keep list --account you@yourdomain.com
gog keep create --title "Todo" --item "Milk" --item "Eggs"
gog keep delete <noteId> --force
```

---

## Classroom (`gog classroom`) — Workspace for Education

```bash
gog classroom courses list
gog classroom coursework list <courseId>
gog classroom submissions list <courseId> <courseworkId>
gog classroom announcements create <courseId> --text "Welcome!"
```

---

## Admin (`gog admin`) — Workspace only, requires DwD

```bash
gog admin users list --domain example.com
gog admin users create user@example.com --given Ada --family Lovelace
gog admin groups list --domain example.com
gog admin groups members add engineering@example.com user@example.com
```

---

## Apps Script (`gog appscript`)

```bash
gog appscript --help                              # Create and execute Apps Script projects
```

---

## Backup (`gog backup`)

```bash
gog backup init --repo ~/Projects/backup-gog
gog backup push --services all --account you@gmail.com
gog backup export --out ~/Documents/gog-export
```

---

## Config (`gog config`)

```bash
gog config path
gog config list
gog config set timezone UTC
```

---

## Time (`gog time`)

```bash
gog time                                          # Current time in configured timezone
```

---

## Service Summary

| Service | Availability | Key operations |
|---------|-------------|----------------|
| gmail | Personal + Workspace | search, send, labels, drafts, vacation, delegates |
| calendar | Personal + Workspace | events, create, freebusy, respond, team |
| drive | Personal + Workspace | ls, search, upload, download, share, permissions |
| docs | Personal + Workspace | create, cat, update, export |
| sheets | Personal + Workspace | get, update, append, format |
| slides | Personal + Workspace | create, create-from-markdown, export, replace-text |
| forms | Personal + Workspace | (see --help) |
| contacts | Personal + Workspace | list, search, create, update, directory |
| tasks | Personal + Workspace | lists, list, add, done, delete |
| people | Personal + Workspace | directory lookup, profile search |
| chat | Workspace only | spaces list/find, messages send, dm send |
| groups | Workspace only | list, members |
| keep | Workspace only | list, create, delete |
| classroom | Workspace for Education | courses, coursework, submissions, announcements |
| admin | Workspace only (DwD) | users list/create, groups list/members |
| appscript | Personal + Workspace | create, execute |
