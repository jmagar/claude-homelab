---
name: bitwarden
description: Use whenever the user mentions Bitwarden — vault items, logins, passwords, secure notes, cards, identities, folders, collections, attachments, Sends, organizations (members, groups, policies, collections, events, subscription, device approvals), password/passphrase generation, vault sync/lock/unlock, BW_SESSION handling, the Bitwarden CLI (`bw`), or the Bitwarden MCP server. Prefer the MCP tools (`mcp__bitwarden__*`) over shelling out to `bw`; only fall back to the CLI for session lifecycle (unlock/lock/status) and operations the MCP server does not expose.
---

# Bitwarden

This skill covers two surfaces:

1. **`mcp__bitwarden__*` tools** — the primary interface for vault, Send, and organization operations. Prefer these.
2. **`bw` CLI** — used by the bundled `scripts/session` wrapper for unlock/lock/status, and as a fallback for anything the MCP server does not expose (e.g. `bw export`, `bw import`, `bw receive`, `bw serve`, `bw config`).

Scope: this skill covers Bitwarden **Password Manager** (`bw` and `@bitwarden/mcp-server`). It does **not** cover Bitwarden **Secrets Manager** (`bws`, machine accounts, projects). If the user asks about `bws` or machine-account secrets, say so and stop.

Never store `BW_SESSION` in `.mcp.json`, `.env`, shell history, or committed files. The runtime token lives in a single XDG runtime path managed by the session wrapper.

## Session lifecycle

The Bitwarden MCP server requires an unlocked CLI session. Manage it with:

```bash
plugins/bitwarden/scripts/session unlock   # prompt for master password, write runtime token
plugins/bitwarden/scripts/session ensure   # prompt only when token is missing or stale
plugins/bitwarden/scripts/session status   # verify the saved token is still valid
plugins/bitwarden/scripts/session lock     # invalidate token and remove runtime file
plugins/bitwarden/scripts/session path     # print the runtime token path
```

Token path: `${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/bitwarden-mcp/session`.

If the MCP server fails to connect or any tool returns an auth error, run `scripts/session status` first; if that fails, run `scripts/session ensure` and retry.

Install managed launch wrappers for `claude`, `codex`, and `gemini` with:

```bash
plugins/bitwarden/scripts/install-shell-wrappers
```

Use `--rc PATH` for custom shell files, such as Oh My Zsh custom alias files.

## MCP entrypoint

Configure Claude Code to launch:

```bash
plugins/bitwarden/bin/bitwarden-mcp
```

The wrapper reads the runtime session file, validates it with `bw unlock --check`, and starts the pinned `@bitwarden/mcp-server` package.

## Choosing a tool

Use this decision order:

1. **An `mcp__bitwarden__*` tool exists for the operation** → use it. The MCP server already passes the unlocked session and returns structured JSON.
2. **The operation is session lifecycle** (unlock/lock/status/path) → use `scripts/session`.
3. **The operation is not exposed by the MCP server** (e.g. `bw export`, `bw import`, `bw receive`, `bw serve`, `bw config server`, `bw completion`, `bw update`, `bw sdk-version`) → call `bw` directly. The MCP wrapper exports `BW_SESSION` only into its own child process; it does not leak into your shell. To run `bw` directly, either install the launch wrappers (`scripts/install-shell-wrappers`) or export the session manually:

   ```bash
   export BW_SESSION="$(<"$(plugins/bitwarden/scripts/session path)")"
   ```

When in doubt, check `mcp__bitwarden__*` tool names first — the catalog below is exhaustive for the operations the server supports.

## MCP tool catalog

Tool names are `mcp__bitwarden__<name>`. Group by area:

**Vault items**
- `list` — items, folders, collections, organizations, org-collections, org-members (filter by `search`, `folderid`, `collectionid`, `url`, `trash`, `organizationid`)
- `get` — `item`, `username`, `password`, `uri`, `totp`, `notes`, `exposed`, `attachment`, `folder`, `collection`, `organization`, `org-collection`, `fingerprint` (use `id: "me"` for your own fingerprint)
- `create_item` — type `1` login, `2` secure note, `3` card, `4` identity (provide the matching sub-object)
- `edit_item`, `edit_item_collections`
- `delete` — `item` | `attachment` | `folder` | `org-collection`; pass `permanent: true` to skip trash
- `restore` — restore an item from trash
- `move` — share an item to an organization (formerly `share`)

**Folders**
- `create_folder`, `edit_folder`

**Attachments**
- `create_attachment` (use `delete` with `object: "attachment"` to remove)

**Sends**
- `create_text_send`, `create_file_send`
- `list_send`, `get_send`, `edit_send`, `delete_send`, `remove_send_password`

**Generation**
- `generate` — password or passphrase; flags include `length`, `uppercase`, `lowercase`, `number`, `special`, `passphrase`, `words`, `separator`, `capitalize`

**Vault state**
- `status` — server, sync, account, vault status
- `sync` — pull latest vault data
- `lock` — lock the vault. The saved runtime token is invalidated server-side, so subsequent MCP calls fail until you re-unlock. Use `scripts/session lock` to also remove the runtime file, or `scripts/session ensure` to re-unlock.

**Organizations — collections**
- `list_org_collections`, `get_org_collection`, `create_org_collection`, `edit_org_collection`, `update_org_collection`, `delete_org_collection`

**Organizations — groups**
- `list_org_groups`, `get_org_group`, `get_org_group_members`, `create_org_group`, `update_org_group`, `update_org_group_members`, `delete_org_group`

**Organizations — members**
- `list_org_members`, `get_org_member`, `get_org_member_groups`, `invite_org_member`, `update_org_member`, `update_org_member_groups`, `confirm`, `reinvite_org_member`, `revoke_org_member`, `restore_org_member`, `remove_org_member`

**Organizations — policies, events, subscription**
- `list_org_policies`, `get_org_policy`, `update_org_policy`
- `get_org_events` (requires `start` and `end` ISO 8601 timestamps)
- `get_org_subscription`, `update_org_subscription`

**Organizations — device approval (SSO trusted devices)**
- `device_approval_list`, `device_approval_approve`, `device_approval_approve_all`, `device_approval_deny`, `device_approval_deny_all`

**Organizations — bulk import**
- `import_org_users_and_groups` — set `overwriteExisting` and (for >2000 entries) `largeImport: true`

## `bw` CLI surface (fallback only)

The CLI exposes the following top-level commands. Use them only when the MCP catalog above does not cover the need:

```
sdk-version  login  logout  lock  unlock  sync  generate  encode
config  update  completion  status  list  get  create  edit  delete
restore  move  confirm  import  export  share (deprecated)  send
receive  device-approval  serve  help
```

Common fallback cases:

- `bw export [--format json|csv|encrypted_json] [--output PATH]` — backup the vault.
- `bw import <format> <input>` — restore from a vault export.
- `bw receive <url> [--password PWD] [--output PATH]` — fetch a Bitwarden Send.
- `bw serve --port N` — local REST API for tooling that cannot speak MCP.
- `bw config server <url>` — point the CLI at a self-hosted Bitwarden instance.
- `bw encode` — base64-encode JSON for `create`/`edit` when scripting against the CLI.

For everything else (`list`, `get`, `create`, `edit`, `delete`, `move`, `confirm`, `generate`, `status`, `sync`, `lock`, `send`, and the `device_approval_*` tools), prefer the MCP tool of the same name.

## Secret-handling rules

- Never echo, log, or paste a password, passphrase, TOTP seed, attachment payload, recovery code, master password, or `BW_SESSION` value into chat unless the user explicitly asks for that exact field. Never accept a master password pasted into chat — always prompt via the CLI (`scripts/session unlock`).
- When listing or summarising items, return names, IDs, URIs, usernames, folders, collections, and timestamps — redact `password`, `totp`, `notes` (when marked sensitive), card numbers, CVVs, and identity SSNs.
- For `generate`, return the generated value once and do not also store it; if the user wants it saved, follow up with `create_item` and discard the local copy.
- Treat anything returned from `get item` as sensitive by default; surface only the field the user asked for.
- **Sends**: a Send URL contains an access key in its `#` fragment — treat the full URL as a secret. Do not paste full Send URLs, Send passwords, or `remove_send_password` results into chat unless asked.
- **Attachments**: file contents and filenames that imply sensitive material (`recovery-codes.txt`, `private-key.pem`, etc.) are themselves a leak — describe rather than display.
- **`get_org_events`**: audit-log responses include IPs, device IDs, and member emails. Summarise counts and event types by default; surface raw rows only on request.
- **`bw export`**: default to `--format encrypted_json`. The `json` and `csv` formats produce a plaintext vault — never pipe them to chat, and warn the user before writing them to disk.

## Companion commands

The plugin ships interactive commands in `commands/` that wrap the most common safe workflows:

- `/bw-list` — list non-secret Bitwarden objects.
- `/bw-get` — retrieve an object or specific field, redacting secrets unless explicitly requested.
- `/bw-generate` — generate a password or passphrase without storing it.
