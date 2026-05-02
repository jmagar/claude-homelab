# Memos Skill

Quick capture and manage notes in your self-hosted Memos instance from Claude conversations.

## What It Does

This skill provides full read-write access to your Memos instance, allowing you to:

- ✅ **Quick Capture** - Save important conversation snippets as memos
- ✅ **Search & Retrieve** - Find notes by content, tags, or date
- ✅ **Organization** - Tag, archive, and link related memos
- ✅ **File Attachments** - Upload and attach files to memos
- ✅ **Visibility Control** - Make memos private, protected, or public
- ✅ **Full CRUD** - Create, read, update, and delete memos

## Setup

### 1. Prerequisites

- Memos instance running (e.g., `https://memos.example.com`)
- System tools: `curl`, `jq`

### 2. Generate API Token

1. Log into your Memos instance
2. Navigate to **Settings** → **Access Tokens**
3. Click **"Create"** button
4. Copy the generated token (it won't be shown again!)

### 3. Configure Credentials

Add your credentials to `~/.claude-homelab/.env`:

```bash
# Memos - Self-hosted note-taking service
MEMOS_URL="https://memos.example.com"
MEMOS_API_TOKEN="eyJhbGciOiJIUzI1NiIsImtpZCI6InYxIiwidHlwIjoiSldUIn0..."
```

**Security notes:**
- `.env` file is gitignored (never committed to version control)
- Set restrictive permissions: `chmod 600 ~/.claude-homelab/.env`
- API token has same permissions as your user account

### 4. Create Symlink

Link the skill to Claude's skills directory:

```bash
ln -sf ~/claude-homelab/skills/memos ~/.claude/skills/memos
```

## Usage Examples

### Quick Capture from Conversation

**User:** "Save this Docker networking explanation to my memos"

**Claude will:**
1. Extract key content from the conversation
2. Create a memo with descriptive title/content
3. Add relevant tags (e.g., `docker`, `networking`)
4. Confirm creation with memo ID

**Behind the scenes:**
```bash
bash scripts/memo-api.sh create "Docker networking explanation..." --tags "docker,networking"
```

### Search Your Knowledge Base

**User:** "What did I write about Kubernetes last month?"

**Claude will:**
1. Search memos containing "kubernetes"
2. Filter by date (last 30 days)
3. Present results with previews
4. Retrieve full content on request

**Behind the scenes:**
```bash
bash scripts/search-api.sh "kubernetes" --from "2024-01-01"
```

### Organize and Tag

**User:** "Tag all my Docker memos with 'devops'"

**Claude will:**
1. Search for memos about Docker
2. Add "devops" tag to each
3. Report number updated

**Behind the scenes:**
```bash
bash scripts/search-api.sh "docker" | jq -r '.memos[].name' | while read id; do
  bash scripts/memo-api.sh update "$id" --add-tags "devops"
done
```

## Workflow

### Typical Usage Pattern

```
1. During conversation: "Save this to memos"
   → Creates memo with context and tags

2. Later retrieval: "What did I save about X?"
   → Searches and retrieves relevant memos

3. Organization: "Show me all my work-related memos"
   → Filters by tag or content

4. Maintenance: "Archive old memos from last year"
   → Bulk archive operation
```

## Common Operations

### Create Memos

```bash
# Simple memo
bash scripts/memo-api.sh create "Meeting notes: discussed new features"

# With tags
bash scripts/memo-api.sh create "Docker compose tips" --tags "docker,devops,reference"

# Private memo
bash scripts/memo-api.sh create "Personal reminder" --visibility PRIVATE
```

### Search and List

```bash
# List recent memos
bash scripts/memo-api.sh list --limit 20

# Search by content
bash scripts/search-api.sh "kubernetes"

# Filter by tag
bash scripts/memo-api.sh list --filter 'tag == "work"'

# Date range search
bash scripts/search-api.sh "project alpha" --from "2024-01-01" --to "2024-12-31"
```

### Update and Delete

```bash
# Update content
bash scripts/memo-api.sh update <memo-id> "Updated content here"

# Add tags
bash scripts/memo-api.sh update <memo-id> --add-tags "urgent,important"

# Archive memo
bash scripts/memo-api.sh archive <memo-id>

# Delete memo
bash scripts/memo-api.sh delete <memo-id>
```

### File Attachments

```bash
# Upload file
bash scripts/resource-api.sh upload /path/to/document.pdf

# Attach to memo
bash scripts/resource-api.sh upload screenshot.png --memo-id <id>

# List attachments
bash scripts/resource-api.sh list
```

## Troubleshooting

### Connection Issues

**Error:** `Connection refused`
- **Cause:** Memos instance not running or wrong URL
- **Solution:** Verify `MEMOS_URL` in `.env` and check instance status

### Authentication Errors

**Error:** `401 Unauthorized`
- **Cause:** Invalid or expired API token
- **Solution:** Regenerate token in Memos UI and update `.env`

### Script Errors

**Error:** `command not found: jq`
- **Cause:** Missing required tool
- **Solution:** Install jq: `sudo apt install jq` (Ubuntu/Debian)

**Error:** `No such file: .env`
- **Cause:** `.env` file not found
- **Solution:** Create `.env` file at `~/.claude-homelab/.env` with credentials

### API Errors

**Error:** `404 Not Found`
- **Cause:** Invalid memo ID or endpoint
- **Solution:** Verify memo ID exists with `list` command

**Error:** `400 Bad Request`
- **Cause:** Invalid parameters or malformed JSON
- **Solution:** Check command syntax in `SKILL.md` or `references/quick-reference.md`

## Notes

### Markdown Support

Memos support full Markdown formatting:
- **Headers:** `# H1`, `## H2`, `### H3`
- **Lists:** `- item`, `1. item`, `- [ ] task`
- **Code:** `` `inline` ``, ` ```language ` blocks
- **Links:** `[text](url)`
- **Images:** `![alt](url)`
- **Tables:** Standard Markdown tables

### Tag Conventions

For consistency:
- Use lowercase: `docker` not `Docker`
- Use hyphens for multi-word: `project-alpha` not `project_alpha`
- Use descriptive tags: `kubernetes-networking` not `k8s-net`

### Visibility Options

- **PRIVATE** - Only you can see (default)
- **PROTECTED** - Authenticated users can see
- **PUBLIC** - Anyone can see (appears in RSS feed)

### Data Ownership

All data stored in your self-hosted Memos instance:
- No third-party services
- Complete control over backups
- No telemetry or tracking
- Export anytime via Memos UI

## Reference

- **Official Docs:** https://usememos.com/docs
- **API Reference:** https://usememos.com/docs/api
- **Complete API Docs:** `references/api-endpoints.md`
- **Quick Examples:** `references/quick-reference.md`
- **Troubleshooting Guide:** `references/troubleshooting.md`
- **Example Workflows:** `examples/` directory
