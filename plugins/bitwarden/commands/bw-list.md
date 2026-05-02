---
description: List Bitwarden vault objects through the Bitwarden MCP server
argument-hint: <items|folders|collections|organizations> [search/filter text]
allowed-tools: Bash(plugins/bitwarden/scripts/session status), mcp__bitwarden__list
---

List Bitwarden vault objects using the Bitwarden MCP server.

Arguments: `$ARGUMENTS`

## Instructions

1. Verify the MCP session is usable:
   ```bash
   plugins/bitwarden/scripts/session status
   ```
   If it fails, tell the user to run `plugins/bitwarden/scripts/session unlock` or launch Claude through the configured shell wrapper.
2. Parse `$ARGUMENTS`:
   - First token is the list type. Default to `items` when omitted.
   - Remaining text is an optional search term.
   - Supported types: `items`, `folders`, `collections`, `organizations`, `org-collections`, `org-members`.
3. Call the Bitwarden MCP `list` tool with the parsed type and search term.
4. Return a compact table with non-secret fields only: name, id, type, folder/collection/org when present, and URL/domain when useful.
5. Do not print passwords, TOTP values, notes, card numbers, or other secret fields from item payloads.
