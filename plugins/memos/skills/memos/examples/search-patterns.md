# Search Pattern Examples

Effective patterns for finding information in your memos.

## Basic Content Search

### Search by Keyword

**Find all memos mentioning "kubernetes":**
```bash
cd ~/claude-homelab/skills/memos
bash scripts/search-api.sh "kubernetes"
```

**Find memos about Docker:**
```bash
bash scripts/search-api.sh "docker"
```

**Find troubleshooting notes:**
```bash
bash scripts/search-api.sh "error" --limit 20
```

## Tag-Based Search

### Single Tag

**Find all work-related memos:**
```bash
bash scripts/tag-api.sh search work
```

**Find Docker tips:**
```bash
bash scripts/tag-api.sh search docker
```

### Multiple Tags (Combined Search)

**Find memos tagged with both "docker" and "troubleshooting":**
```bash
bash scripts/search-api.sh "" --tags "docker,troubleshooting"
```

**Find project-specific technical notes:**
```bash
bash scripts/search-api.sh "" --tags "project-alpha,technical"
```

## Date-Range Search

### Recent Memos

**Last 7 days:**
```bash
bash scripts/search-api.sh "" --from "$(date -d '7 days ago' +%Y-%m-%d)"
```

**Last 30 days:**
```bash
bash scripts/search-api.sh "" --from "$(date -d '30 days ago' +%Y-%m-%d)"
```

**This month:**
```bash
bash scripts/search-api.sh "" --from "$(date +%Y-%m-01)"
```

### Specific Date Range

**Q1 2024:**
```bash
bash scripts/search-api.sh "" --from "2024-01-01" --to "2024-03-31"
```

**Last year:**
```bash
bash scripts/search-api.sh "" --from "2023-01-01" --to "2023-12-31"
```

## Combined Search Patterns

### Content + Tags

**Find Docker networking notes:**
```bash
bash scripts/search-api.sh "networking" --tags "docker"
```

**Find Kubernetes troubleshooting from Q4:**
```bash
bash scripts/search-api.sh "troubleshooting" \
  --tags "kubernetes" \
  --from "2024-10-01" \
  --to "2024-12-31"
```

### Content + Date

**Recent meeting notes:**
```bash
bash scripts/search-api.sh "meeting" \
  --from "$(date -d '14 days ago' +%Y-%m-%d)"
```

**Project updates last month:**
```bash
bash scripts/search-api.sh "project update" \
  --from "$(date -d '1 month ago' +%Y-%m-01)" \
  --to "$(date -d '1 month ago' +%Y-%m-31)"
```

### Content + Tags + Date

**Recent Docker troubleshooting:**
```bash
bash scripts/search-api.sh "error" \
  --tags "docker,troubleshooting" \
  --from "$(date -d '7 days ago' +%Y-%m-%d)" \
  --limit 10
```

## Visibility-Based Search

### Private Memos Only

```bash
bash scripts/search-api.sh "" --visibility PRIVATE
```

### Public Memos Only

```bash
bash scripts/search-api.sh "" --visibility PUBLIC
```

## Tag Statistics and Discovery

### List All Tags

**See all tags with usage counts:**
```bash
bash scripts/tag-api.sh list
```

**Get tag statistics:**
```bash
bash scripts/tag-api.sh stats
```

## Advanced jq Processing

### Extract Specific Fields

**Get only content and tags:**
```bash
bash scripts/search-api.sh "docker" | jq '.memos[] | {content, tags}'
```

**Get memo IDs and creation dates:**
```bash
bash scripts/search-api.sh "kubernetes" | jq '.memos[] | {id: .name, created: .createTime}'
```

### Filter Results

**Find memos with more than 2 tags:**
```bash
bash scripts/memo-api.sh list | jq '.memos[] | select(.tags | length > 2)'
```

**Find memos containing code blocks:**
```bash
bash scripts/search-api.sh "" | jq '.memos[] | select(.property.hasCode == true)'
```

### Count Results

**How many Docker memos:**
```bash
bash scripts/tag-api.sh search docker | jq '.memos | length'
```

**Total memos:**
```bash
bash scripts/memo-api.sh list --limit 1000 | jq '.memos | length'
```

### Extract and Format

**Create readable list:**
```bash
bash scripts/search-api.sh "kubernetes" | jq -r '.memos[] | "[\(.createTime | split("T")[0])] \(.snippet)"'
```

**Export to CSV:**
```bash
bash scripts/memo-api.sh list | jq -r '.memos[] | [.name, .createTime, .tags | join(","), .content] | @csv' > memos.csv
```

## Workflow Examples

### Daily Review

**See what you captured today:**
```bash
bash scripts/search-api.sh "" --from "$(date +%Y-%m-%d)"
```

### Weekly Summary

**All memos from last week:**
```bash
bash scripts/search-api.sh "" \
  --from "$(date -d '7 days ago' +%Y-%m-%d)" \
  --to "$(date +%Y-%m-%d)" \
  | jq -r '.memos[] | "# \(.createTime | split("T")[0])\n\n\(.content)\n\n---\n"' \
  > weekly-notes.md
```

### Project Research

**Gather all notes for specific project:**
```bash
bash scripts/tag-api.sh search project-alpha | \
  jq -r '.memos[] | "## \(.createTime | split("T")[0])\n\n\(.content)\n\n"' \
  > project-alpha-notes.md
```

### Find TODOs

**Search for task lists:**
```bash
bash scripts/search-api.sh "[ ]" --limit 50
```

**Find incomplete tasks:**
```bash
bash scripts/memo-api.sh list | jq '.memos[] | select(.property.hasIncompleteTasks == true)'
```

## Search Tips

1. **Broad first, narrow second**: Start with general search, then add filters
2. **Use limits**: Add `--limit N` to avoid overwhelming results
3. **Combine filters**: Content + tags + date for precise results
4. **Check tag stats**: See what tags you actually use
5. **Case-insensitive**: Content search ignores case
6. **Tag exact match**: Tags are case-sensitive
7. **Save searches**: Create shell aliases for common queries

## Common Search Aliases

Add to your `~/.bashrc` or `~/.zshrc`:

```bash
# Memos search aliases
alias memos-search='cd ~/claude-homelab/skills/memos && bash scripts/search-api.sh'
alias memos-recent='cd ~/claude-homelab/skills/memos && bash scripts/search-api.sh "" --from "$(date -d "7 days ago" +%Y-%m-%d)"'
alias memos-work='cd ~/claude-homelab/skills/memos && bash scripts/tag-api.sh search work'
alias memos-tags='cd ~/claude-homelab/skills/memos && bash scripts/tag-api.sh list'
```

Usage after sourcing:
```bash
memos-search "kubernetes"
memos-recent
memos-work
memos-tags
```
