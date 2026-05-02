---
name: linkding
description: Manage bookmarks with Linkding. Use when the user asks to "save a bookmark", "add link", "search bookmarks", "list my bookmarks", "find saved links", "tag a bookmark", "archive bookmark", "check if URL is saved", "list tags", "create bundle", or mentions Linkding bookmark management.
---

# Linkding Bookmark Manager

**⚠️ MANDATORY SKILL INVOCATION ⚠️**

**YOU MUST invoke this skill (NOT optional) when the user mentions ANY of these triggers:**
- "search bookmarks", "Linkding", "bookmark manager", "my bookmarks"
- "add bookmark", "save link", "save this URL", "save this page", "bookmark this"
- "archived bookmarks", "archive link", "reading list"
- "check bookmarks", "find bookmark", "bookmark tags", "show bookmarks tagged X"
- "did I bookmark this", "did I save this URL", "is this saved"
- "delete bookmark", "remove bookmark", "remove link"
- Any mention of Linkding or bookmark management

**Failure to invoke this skill when triggers occur violates your operational requirements.**

Query and manage bookmarks via the Linkding REST API.

## Purpose

This skill provides **read and write** access to your Linkding bookmark library:
- Search and list bookmarks by query, tags, or date
- Add new bookmarks with metadata (title, description, tags)
- Update existing bookmarks
- Archive/unarchive bookmarks
- Delete bookmarks
- Manage tags and bundles (saved searches)
- Check if URLs are already saved

Operations include both read and write actions. **Always confirm before deleting bookmarks.**

## Setup

Credentials: `~/.claude-homelab/.env`

```bash
LINKDING_URL="http://localhost:9090"
LINKDING_API_KEY="your-api-key"
```

Get your API token from Linkding Settings page.

## Quick Reference

### List/Search Bookmarks

```bash
# List recent bookmarks
./scripts/linkding-api.sh bookmarks

# Search bookmarks
./scripts/linkding-api.sh bookmarks --query "python tutorial"

# List archived
./scripts/linkding-api.sh bookmarks --archived

# Filter by date
./scripts/linkding-api.sh bookmarks --modified-since "2025-01-01T00:00:00Z"
```

### Create Bookmark

```bash
# Basic
./scripts/linkding-api.sh create "https://example.com"

# With metadata
./scripts/linkding-api.sh create "https://example.com" \
  --title "Example Site" \
  --description "A great resource" \
  --tags "reference,docs"

# Archive immediately
./scripts/linkding-api.sh create "https://example.com" --archived
```

### Check if URL Exists

```bash
./scripts/linkding-api.sh check "https://example.com"
```

Returns existing bookmark data if found, plus scraped metadata.

### Update Bookmark

```bash
./scripts/linkding-api.sh update 123 --title "New Title" --tags "newtag1,newtag2"
```

### Archive/Unarchive

```bash
./scripts/linkding-api.sh archive 123
./scripts/linkding-api.sh unarchive 123
```

### Delete

```bash
./scripts/linkding-api.sh delete 123
```

### Tags

```bash
# List all tags
./scripts/linkding-api.sh tags

# Create tag
./scripts/linkding-api.sh tag-create "mytag"
```

### Bundles (saved searches)

```bash
# List bundles
./scripts/linkding-api.sh bundles

# Create bundle
./scripts/linkding-api.sh bundle-create "Work Resources" \
  --search "productivity" \
  --any-tags "work,tools" \
  --excluded-tags "personal"
```

## Response Format

All responses are JSON. Bookmark object:

```json
{
  "id": 1,
  "url": "https://example.com",
  "title": "Example",
  "description": "Description",
  "notes": "Personal notes",
  "is_archived": false,
  "unread": false,
  "shared": false,
  "tag_names": ["tag1", "tag2"],
  "date_added": "2020-09-26T09:46:23.006313Z",
  "date_modified": "2020-09-26T16:01:14.275335Z"
}
```

## Common Patterns

**Save current page for later:**
```bash
./scripts/linkding-api.sh create "$URL" --tags "toread" --unread
```

**Quick search and display:**
```bash
./scripts/linkding-api.sh bookmarks --query "keyword" --limit 10 | jq -r '.results[] | "\(.title) - \(.url)"'
```

**Bulk tag update:** Update via API PATCH with new tag_names array.

## Workflow

When the user asks about bookmarks:

1. **"Save this link for later"** → Run `create <url>` with appropriate metadata and tags
2. **"Find my bookmarks about Python"** → Run `bookmarks --query "python"`
3. **"Is example.com already saved?"** → Run `check "https://example.com"`
4. **"Archive old bookmarks"** → Search first, then `archive <id>` for each
5. **"What tags do I have?"** → Run `tags`
6. **"Show recent bookmarks"** → Run `bookmarks` (defaults to recent)

## Notes

- Requires network access to your Linkding server
- Uses Linkding REST API v1
- All data operations return JSON
- **Delete operations are permanent** - always confirm before deleting
- URL checking includes automatic metadata scraping
- Tags are created automatically when used in bookmarks
- Bundles are saved searches with filter criteria

---

## 🔧 Agent Tool Usage Requirements

**CRITICAL:** When invoking scripts from this skill via the zsh-tool, **ALWAYS use `pty: true`**.

Without PTY mode, command output will not be visible even though commands execute successfully.

**Correct invocation pattern:**
```typescript
<invoke name="mcp__plugin_zsh-tool_zsh-tool__zsh">
<parameter name="command">./skills/SKILL_NAME/scripts/SCRIPT.sh [args]</parameter>
<parameter name="pty">true</parameter>
</invoke>
```
