# gogcli Configuration Reference

---

## Config File Location

| Platform | Path |
|----------|------|
| macOS | `~/Library/Application Support/gogcli/config.json` |
| Linux | `~/.config/gogcli/config.json` |
| Windows | `%AppData%\gogcli\config.json` |

The config file uses JSON5 syntax (comments allowed, trailing commas OK).

---

## Config Example

```json
{
  keyring_backend: "file",        // "keychain" (default) or "file"
  default_timezone: "UTC",
  account_aliases: {
    work: "work@company.com",
    personal: "me@gmail.com",
  },
  account_clients: {
    "work@company.com": "work",   // Maps account to named OAuth client
  },
}
```

---

## Config Commands

```bash
gog config path               # Show config file path
gog config list               # List all config keys and values
gog config set timezone UTC   # Set a config key
```

---

## Keyring Backends

gogcli stores OAuth tokens in the OS keyring by default:

| Backend | Platform | Notes |
|---------|----------|-------|
| `keychain` | macOS Keychain, Linux Secret Service (libsecret), Windows Credential Manager | Default; requires interactive session |
| `file` | All platforms | Encrypted local file; requires `GOG_KEYRING_PASSWORD` env var |

### Switching to encrypted file keyring

```bash
export GOG_KEYRING_BACKEND=file
export GOG_KEYRING_PASSWORD=your-passphrase
gog auth add you@gmail.com
```

The `file` backend is required for CI and headless environments where the OS keyring is unavailable. See [tips-gotchas.md](tips-gotchas.md) for CI setup.

---

## OAuth Scope Management

Authorize with the minimum set of scopes needed. Scope choices are made at `gog auth add` time and stored with the token.

```bash
# Only Gmail and Calendar
gog auth add you@gmail.com --services gmail,calendar

# Drive with read-only access
gog auth add you@gmail.com --services drive --readonly

# Gmail read-only (cannot send)
gog auth add you@gmail.com --services gmail --gmail-scope readonly

# Drive scoped to app-created files only
gog auth add you@gmail.com --services drive --drive-scope file

# Append an extra OAuth scope beyond the defaults
gog auth add you@gmail.com --extra-scopes https://www.googleapis.com/auth/calendar.readonly
```

### Recommended minimum scopes per use case

| Use case | Recommended `--services` |
|----------|--------------------------|
| Read email only | `gmail --gmail-scope readonly` |
| Send email | `gmail` |
| Read/write calendar | `calendar` |
| Read Drive files | `drive --readonly` |
| Upload to Drive | `drive` |
| Read Sheets | `sheets --readonly` (or `drive --readonly`) |
| Write Sheets | `sheets` |
| Workspace admin | `admin` (service account with DwD) |

---

## Domain-Wide Delegation Threat Model

> **Treat service account credentials with domain-wide delegation as equivalent to domain admin credentials.**

> **A compromised DwD credential can read/write any user's Gmail, Drive, and Classroom data across your entire organization.**

### What is DwD?

Domain-wide delegation (DwD) allows a Google Workspace service account to impersonate any user in your domain. `gog admin` commands require it. Some automation workflows also use it to act on behalf of users without individual OAuth consent.

### Why this matters

- A service account key file with DwD is a master key to every user account in your domain.
- If the key is leaked (committed to git, exposed in logs, exfiltrated), an attacker can read every email, calendar event, and Drive file in your organization with no per-user authentication.
- There is no MFA protection on service account keys.

### Recommended posture

1. **Prefer per-user OAuth for normal operations.** `gog auth add user@domain.com` triggers standard OAuth, which is scoped to one user and protected by their MFA. Use this for daily automation workflows whenever possible.

2. **Use DwD only when cross-user access is genuinely required** (e.g., admin reporting across all mailboxes, bulk provisioning). Do not use DwD simply because it is more convenient.

3. **Minimize DwD OAuth scopes.** In Google Admin Console → Security → API Controls → Domain-wide delegation, configure the service account with only the specific OAuth scopes required:

   | gogcli admin task | Required scope |
   |-------------------|---------------|
   | `gog admin users list/create` | `https://www.googleapis.com/auth/admin.directory.user` |
   | `gog admin groups list/members` | `https://www.googleapis.com/auth/admin.directory.group` |
   | Cross-user Gmail read | `https://www.googleapis.com/auth/gmail.readonly` |
   | Cross-user Drive read | `https://www.googleapis.com/auth/drive.readonly` |
   | Cross-user Classroom | `https://www.googleapis.com/auth/classroom.courses` |

4. **Rotate service account keys regularly.** Download new keys from Google Cloud Console, update the stored credential (`gog auth service-account set`), and delete the old key.

5. **Never commit service account JSON files to version control.** Store them in a secrets manager (e.g., Google Secret Manager, HashiCorp Vault) and inject at runtime.

6. **Log and alert on DwD token issuance.** Enable Cloud Audit Logging for Admin SDK and Drive API calls to detect unexpected cross-user access.

---

## Environment Variables

| Variable | Purpose |
|----------|---------|
| `GOG_ACCOUNT` | Default account email or alias |
| `GOG_JSON` | Set to any value to always output JSON |
| `GOG_PLAIN` | Set to any value to always output TSV |
| `GOG_KEYRING_BACKEND` | `file` to use encrypted file keyring |
| `GOG_KEYRING_PASSWORD` | Password for encrypted file keyring |
| `GOG_GMAIL_NO_SEND` | Set to `true` to block all `gmail send` operations |
| `GOG_HELP` | Set to `full` to show expanded help |

---

## Command Sandboxing

Restrict which gogcli commands are available (useful for shared environments or scripts that should not have destructive access):

```bash
# Allow only search and read operations
gog --enable-commands "gmail.search,gmail.thread.get,drive.ls,drive.search"

# Block destructive Gmail operations
gog --disable-commands "gmail.trash,gmail.batch"
```

---

## Multiple OAuth Clients

If you have separate OAuth client IDs for work and personal accounts:

```bash
# Store each client JSON under a named client key
gog --client work auth credentials ~/Downloads/work-client.json
gog --client personal auth credentials ~/Downloads/personal-client.json

# Map accounts to clients in config
# account_clients: { "work@company.com": "work", "me@gmail.com": "personal" }
```
