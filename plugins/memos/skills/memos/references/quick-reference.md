# Memos Quick Reference

Common operations and copy-paste examples.

## Quick Start

```bash
# Navigate to skill directory
cd ~/claude-homelab/skills/memos

# All scripts source credentials from ~/.claude-homelab/.env
# No additional configuration needed
```

## Memo Operations

### Create

```bash
# Simple memo
bash scripts/memo-api.sh create "My first memo"

# With tags (added as hashtags in content)
bash scripts/memo-api.sh create "Docker networking tips" --tags "docker,networking,devops"

# Public memo
bash scripts/memo-api.sh create "Public announcement" --tags "announcement" --visibility PUBLIC

# Protected memo (visible to authenticated users)
bash scripts/memo-api.sh create "Team update" --visibility PROTECTED
```

###List

```bash
# List recent memos
bash scripts/memo-api.sh list

# List with limit
bash scripts/memo-api.sh list --limit 20

# Filter by tag
bash scripts/memo-api.sh list --filter 'tag == "work"'

# Filter by visibility
bash scripts/memo-api.sh list --filter 'visibility == "PUBLIC"'
```

### Get

```bash
# Get specific memo (ID from list/create response)
bash scripts/memo-api.sh get abc123

# Also works with full name format
bash scripts/memo-api.sh get memos/abc123
```

### Update

```bash
# Update content
bash scripts/memo-api.sh update abc123 "Updated content here"

# Change visibility
bash scripts/memo-api.sh update abc123 --visibility PUBLIC
```

### Delete

```bash
# Delete memo (permanent)
bash scripts/memo-api.sh delete abc123
```

### Archive

```bash
# Archive memo (soft delete)
bash scripts/memo-api.sh archive abc123
```

## Search Operations

### Basic Search

```bash
# Search by content keyword
bash scripts/search-api.sh "kubernetes"

# Search with limit
bash scripts/search-api.sh "docker" --limit 10
```

### Advanced Search

```bash
# Search with tags
bash scripts/search-api.sh "deployment" --tags "kubernetes,production"

# Search by date range
bash scripts/search-api.sh "meeting" --from "2024-01-01" --to "2024-12-31"

# Search private memos only
bash scripts/search-api.sh "personal" --visibility PRIVATE

# Combined search
bash scripts/search-api.sh "project alpha" \
  --tags "work,priority" \
  --from "2024-01-01" \
  --limit 20
```

## Tag Operations

### List Tags

```bash
# List all tags with counts
bash scripts/tag-api.sh list

# Output includes: tag name and usage count
```

### Search by Tag

```bash
# Find memos with specific tag
bash scripts/tag-api.sh search work

# Also works with # prefix
bash scripts/tag-api.sh search "#docker"
```

### Tag Statistics

```bash
# Get tag usage statistics
bash scripts/tag-api.sh stats

# Shows: total memos, total tags, tagged vs untagged, top 10 tags
```

### Rename Tag

```bash
# Rename tag across all memos
bash scripts/tag-api.sh rename old-tag new-tag

# Also works with # prefix
bash scripts/tag-api.sh rename "#old-project" "#new-project"
```

## Resource (Attachment) Operations

### Upload

```bash
# Upload file
bash scripts/resource-api.sh upload /path/to/document.pdf

# Upload and attach to memo
bash scripts/resource-api.sh upload screenshot.png --memo-id abc123
```

### List

```bash
# List all resources
bash scripts/resource-api.sh list

# List resources for specific memo
bash scripts/resource-api.sh list --memo-id abc123
```

### Delete

```bash
# Delete resource (use full name from list)
bash scripts/resource-api.sh delete resources/abc123
```

### Download

```bash
# Download resource
bash scripts/resource-api.sh download resources/abc123

# Download to specific path
bash scripts/resource-api.sh download resources/abc123 --output /tmp/file.pdf
```

## User Operations

### Current User

```bash
# Get current user info
bash scripts/user-api.sh whoami
```

### Access Tokens

```bash
# List your access tokens
bash scripts/user-api.sh tokens

# Create new access token
bash scripts/user-api.sh create-token "Automation Token"

# Delete access token
bash scripts/user-api.sh delete-token users/1/accessTokens/abc123
```

### Profile

```bash
# Get profile
bash scripts/user-api.sh profile

# Update nickname
bash scripts/user-api.sh update-profile --nickname "John Doe"

# Update email
bash scripts/user-api.sh update-profile --email "john@example.com"
```

## JSON Processing

All scripts output JSON. Use `jq` for processing:

```bash
# Pretty print
bash scripts/memo-api.sh list | jq .

# Extract specific fields
bash scripts/memo-api.sh get abc123 | jq '{content, tags, createTime}'

# Filter results
bash scripts/memo-api.sh list | jq '.memos[] | select(.tags | contains(["docker"]))'

# Count results
bash scripts/search-api.sh "kubernetes" | jq '.memos | length'

# Extract memo IDs
bash scripts/memo-api.sh list | jq -r '.memos[].name'
```

## Common Workflows

### Quick Capture

```bash
# Capture thought with context
bash scripts/memo-api.sh create "$(cat <<'EOF'
Learned about Kubernetes port forwarding today:

kubectl port-forward service/my-service 8080:80

This creates a local proxy to the service.
EOF
)" --tags "kubernetes,til,reference"
```

### Search and Update

```bash
# Find memo by content
MEMO_ID=$(bash scripts/search-api.sh "old project name" | jq -r '.memos[0].name' | cut -d'/' -f2)

# Update it
bash scripts/memo-api.sh update "$MEMO_ID" "New project name updated"
```

### Bulk Tag Update

```bash
# Find all Docker memos and add "devops" tag
bash scripts/tag-api.sh search docker | jq -r '.memos[].name' | while read -r memo_id; do
  # Get current content
  content=$(bash scripts/memo-api.sh get "${memo_id#memos/}" | jq -r '.content')

  # Add tag if not present
  if ! echo "$content" | grep -q "#devops"; then
    bash scripts/memo-api.sh update "${memo_id#memos/}" "${content} #devops"
  fi
done
```

### Export Tagged Memos

```bash
# Export all work memos to markdown file
bash scripts/tag-api.sh search work | jq -r '.memos[] | "## \(.createTime)\n\n\(.content)\n\n---\n"' > work-memos.md
```

## Tips

1. **Tags**: Always use hashtag format in content (`#tagname`)
2. **IDs**: Memo IDs from responses include "memos/" prefix, but scripts accept both formats
3. **Visibility**: Default is PRIVATE - explicitly set PUBLIC for sharing
4. **Search**: Content search is case-insensitive
5. **Pagination**: Use `--limit` to control result size
6. **Markdown**: Full Markdown support (code blocks, lists, links, etc.)
7. **JSON**: All output is JSON - use `jq` for processing

## Help

Every script supports `--help`:

```bash
bash scripts/memo-api.sh --help
bash scripts/search-api.sh --help
bash scripts/tag-api.sh --help
bash scripts/resource-api.sh --help
bash scripts/user-api.sh --help
```
