---
description: Get a Bitwarden item or field through the Bitwarden MCP server
argument-hint: <item|username|password|uri|totp|notes|folder> <id-or-search>
allowed-tools: Bash(plugins/bitwarden/scripts/session status), mcp__bitwarden__list, mcp__bitwarden__get
---

Get a Bitwarden object or specific field using the Bitwarden MCP server.

Arguments: `$ARGUMENTS`

## Instructions

1. Verify the MCP session is usable:
   ```bash
   plugins/bitwarden/scripts/session status
   ```
   If it fails, tell the user to run `plugins/bitwarden/scripts/session unlock` or launch Claude through the configured shell wrapper.
2. Parse `$ARGUMENTS`:
   - First token is the object type. Default to `item` when omitted.
   - Remaining text is the item id or search term.
   - Supported common object types: `item`, `username`, `password`, `uri`, `totp`, `notes`, `folder`, `collection`, `organization`.
3. If the id/search term does not look like a Bitwarden UUID, first call the Bitwarden MCP `list` tool with `type: "items"` and the search term.
4. Resolve search results safely:
   - 0 matches: report no match.
   - 1 match: use that item's `id`.
   - Multiple matches: show a compact non-secret list of names and ids, then ask the user to rerun with a specific id or a narrower search.
5. Call the Bitwarden MCP `get` tool with the resolved `object` and `id`.
6. For full `item` results, summarize metadata first and redact secret fields unless the user explicitly requested them.
7. For explicit secret field requests (`password`, `totp`, sensitive `notes`), show only the requested value and avoid extra surrounding copies of the secret.
