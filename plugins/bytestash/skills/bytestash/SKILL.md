---
name: bytestash
description: Manage code snippets in ByteStash snippet storage service. This skill should be used when the user asks to "save a snippet", "search snippets", "find code", "share snippet", "organize snippets", "list my snippets", "create snippet", "delete snippet", or mentions ByteStash, code storage, snippet management, or code archival.
---

# ByteStash Skill

**⚠️ MANDATORY SKILL INVOCATION ⚠️**

**YOU MUST invoke this skill (NOT optional) when the user mentions ANY of these triggers:**
- "save snippet", "store code", "archive snippet"
- "search snippets", "find snippet", "lookup code"
- "share snippet", "create share link", "public snippet"
- "list snippets", "show my snippets", "snippet library"
- "delete snippet", "remove snippet", "update snippet"
- "organize snippets", "categorize snippets", "tag snippets"
- Any mention of ByteStash or code snippet management

**Failure to invoke this skill when triggers occur violates your operational requirements.**

## Purpose

ByteStash is a self-hosted code snippet management service with multi-file support, sharing capabilities, and organization features. This skill provides **read-write** access to manage snippets with full CRUD operations.

**Capabilities:**
- **Read-only**: List, search, and retrieve snippets
- **Create/Update**: Save new snippets with multiple code fragments
- **Delete**: Remove snippets with user confirmation
- **Share Management**: Create, view, and delete share links (public/protected/expiring)
- **Organization**: Categorize and organize snippets with tags

**Authentication:** API key via `x-api-key` header (recommended for CLI/automation)

## Setup

**Required credentials in `~/.claude-homelab/.env`:**

```bash
BYTESTASH_URL="https://bytestash.example.com"
BYTESTASH_API_KEY="<your_api_key>"
```

**How to get your API key:**
1. Log in to ByteStash web interface
2. Navigate to Settings → API Keys
3. Create new API key with a descriptive name
4. Copy the generated key to `.env` file

**Security:**
- Set permissions: `chmod 600 ~/.claude-homelab/.env`
- API keys are scoped to your user account
- NEVER commit `.env` to version control

## Commands

All commands use the bash script wrapper in `scripts/bytestash-api.sh`.

### List Snippets
```bash
cd skills/bytestash
./scripts/bytestash-api.sh list
```

### Search Snippets
```bash
# Search by title (case-insensitive partial match)
./scripts/bytestash-api.sh search "docker"

# Search by category
./scripts/bytestash-api.sh search --category "bash"
```

### Get Snippet Details
```bash
./scripts/bytestash-api.sh get <snippet-id>
```

### Create Snippet
```bash
# Single fragment (inline code)
./scripts/bytestash-api.sh create \
  --title "Docker Compose Example" \
  --description "Production-ready compose file" \
  --categories "docker,devops" \
  --code "version: '3.8'..." \
  --language "yaml" \
  --filename "docker-compose.yml"

# Multiple fragments (from files)
./scripts/bytestash-api.sh push \
  --title "FastAPI Setup" \
  --description "Complete FastAPI project structure" \
  --categories "python,api" \
  --files "app.py,requirements.txt,Dockerfile"
```

### Update Snippet
```bash
./scripts/bytestash-api.sh update <snippet-id> \
  --title "New Title" \
  --description "Updated description" \
  --categories "new,tags"
```

### Delete Snippet
```bash
# Prompts for confirmation
./scripts/bytestash-api.sh delete <snippet-id>
```

### Share Management
```bash
# Create public share link
./scripts/bytestash-api.sh share <snippet-id>

# Create protected share (requires auth)
./scripts/bytestash-api.sh share <snippet-id> --protected

# Create expiring share (24 hours)
./scripts/bytestash-api.sh share <snippet-id> --expires 86400

# List all shares for a snippet
./scripts/bytestash-api.sh shares <snippet-id>

# Delete share link
./scripts/bytestash-api.sh unshare <share-id>

# View shared snippet
./scripts/bytestash-api.sh view-share <share-id>
```

## Workflow

When the user asks about ByteStash:

1. **"Save this code as a snippet"**
   - Determine if single or multiple files
   - If single: Use `create` command with inline code
   - If multiple: Use `push` command with file paths
   - Always include title, description, and categories

2. **"Find my Docker snippets"**
   - Use `search --category docker` or `search "docker"`
   - Present results with ID, title, description, and categories
   - If user wants details: Use `get <id>` to show full snippet

3. **"Share this snippet publicly"**
   - Use `share <snippet-id>` to create public link
   - Return share URL: `{BYTESTASH_URL}/s/{share-id}`
   - Optionally use `--protected` or `--expires` flags

4. **"What snippets do I have?"**
   - Use `list` command
   - Group by categories for better organization
   - Show total count and recent updates

5. **"Delete this snippet"**
   - Confirm with user before deletion
   - Use `delete <snippet-id>`
   - Verify deletion with success message

6. **"Organize my snippets by category"**
   - List all snippets with `list`
   - Identify missing/inconsistent categories
   - Suggest category updates with `update` command

### Multi-Fragment Snippets

ByteStash supports snippets with multiple code fragments (files). Each fragment has:
- **file_name**: Display name (e.g., `app.py`, `Dockerfile`)
- **code**: The actual code content
- **language**: Syntax highlighting language (e.g., `python`, `dockerfile`)
- **position**: Display order (0-indexed)

**When to use multi-fragment:**
- Related configuration files (docker-compose.yml + .env)
- Full project structures (API + tests + docs)
- Before/after code examples
- Multi-language implementations

## Notes

**Data Model:**
```json
{
  "id": 123,
  "title": "Snippet Title",
  "description": "Detailed description",
  "categories": ["tag1", "tag2"],
  "fragments": [
    {
      "id": 456,
      "file_name": "example.py",
      "code": "print('hello')",
      "language": "python",
      "position": 0
    }
  ],
  "updated_at": "2024-01-01T00:00:00Z",
  "share_count": 2
}
```

**Authentication:**
- Uses `x-api-key` header with API key from `.env`
- API keys are managed in ByteStash web UI (Settings → API Keys)
- Preferable to JWT tokens for automation

**Share Links:**
- Public shares: Anyone with link can view
- Protected shares: Requires authentication to view
- Expiring shares: Auto-delete after specified seconds
- Share IDs are random strings (e.g., `abc123def456`)

**Destructive Operations:**
- Delete snippet: Permanently removes snippet and all fragments
- Delete share: Invalidates share link (snippet remains)
- Both require user confirmation before execution

**Output Format:**
- All commands return JSON by default
- Use `jq` for filtering/formatting (e.g., `./bytestash-api.sh list | jq '.[] | select(.categories[] == "docker")'`)
- Errors return HTTP status codes with JSON error messages

**Limitations:**
- API key required for all operations (no anonymous access via API)
- Categories are tags (no hierarchical structure)
- No bulk operations (must process snippets individually)
- Share links cannot be updated (must delete and recreate)
- Some deployments may require JWT auth for share endpoints (`/api/share*`)

## Reference

- **API Endpoints**: See `references/api-endpoints.md` for complete API reference
- **Quick Reference**: See `references/quick-reference.md` for command examples
- **Troubleshooting**: See `references/troubleshooting.md` for common failures
- **Official Docs**: API documentation at `{BYTESTASH_URL}/api-docs/`
- **Web Interface**: Full-featured UI at `{BYTESTASH_URL}`

---

## 🔧 Agent Tool Usage Requirements

**CRITICAL:** When invoking scripts from this skill via the zsh-tool, **ALWAYS use `pty: true`**.

Without PTY mode, command output will not be visible even though commands execute successfully.

**Correct invocation pattern:**
```typescript
<invoke name="mcp__plugin_zsh-tool_zsh-tool__zsh">
<parameter name="command">./skills/bytestash/scripts/bytestash-api.sh [args]</parameter>
<parameter name="pty">true</parameter>
</invoke>
```
