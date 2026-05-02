# Tagging Workflow Examples

Effective tag organization and management strategies.

## Tag Naming Conventions

### Recommended Format

- **Lowercase**: `docker` not `Docker`
- **Hyphens for multi-word**: `project-alpha` not `project_alpha` or `projectAlpha`
- **Descriptive**: `kubernetes-networking` not `k8s-net`
- **Consistent**: Pick a system and stick to it

### Tag Categories

**By Type:**
- `#reference` - Documentation and references
- `#til` - Today I Learned
- `#troubleshooting` - Problem-solving notes
- `#meeting` - Meeting notes
- `#idea` - Ideas and brainstorming

**By Technology:**
- `#docker` - Docker-related
- `#kubernetes` - Kubernetes content
- `#postgresql` - Database notes
- `#python` - Python code/tips

**By Project:**
- `#project-alpha` - Project-specific notes
- `#homelab` - Homelab infrastructure
- `#automation` - Automation scripts

**By Priority:**
- `#important` - High priority
- `#urgent` - Time-sensitive
- `#someday` - Future reference

## Tag Management

### View All Tags

**List tags with counts:**
```bash
cd ~/claude-homelab/skills/memos
bash scripts/tag-api.sh list
```

**Output:**
```json
{
  "tags": [
    {"tag": "docker", "count": 45},
    {"tag": "kubernetes", "count": 32},
    {"tag": "reference", "count": 28},
    {"tag": "troubleshooting", "count": 19}
  ]
}
```

### Get Tag Statistics

```bash
bash scripts/tag-api.sh stats
```

**Output:**
```json
{
  "total_memos": 150,
  "total_tags": 45,
  "tagged_memos": 142,
  "untagged_memos": 8,
  "tags": [
    {"tag": "docker", "count": 45},
    ...top 10 tags
  ]
}
```

### Find Untagged Memos

```bash
bash scripts/memo-api.sh list --limit 1000 | jq '.memos[] | select(.tags | length == 0) | {name, content}'
```

## Bulk Tag Operations

### Rename Tag Across All Memos

**Rename "old-project" to "new-project":**
```bash
bash scripts/tag-api.sh rename old-project new-project
```

**Output:**
```json
{
  "success": true,
  "updated": 15,
  "old_tag": "old-project",
  "new_tag": "new-project"
}
```

### Add Tag to Multiple Memos

**Add "reviewed" tag to all Docker memos:**
```bash
# Find Docker memos
bash scripts/tag-api.sh search docker | jq -r '.memos[].name' | while read -r memo_id; do
  # Get current content
  memo_id="${memo_id#memos/}"
  content=$(bash scripts/memo-api.sh get "$memo_id" | jq -r '.content')

  # Add tag if not present
  if ! echo "$content" | grep -q "#reviewed"; then
    bash scripts/memo-api.sh update "$memo_id" "${content} #reviewed"
    echo "Added #reviewed to $memo_id"
  fi
done
```

### Remove Tag from Memos

**Remove "draft" tag from all memos:**
```bash
bash scripts/tag-api.sh search draft | jq -r '.memos[].name' | while read -r memo_id; do
  memo_id="${memo_id#memos/}"
  content=$(bash scripts/memo-api.sh get "$memo_id" | jq -r '.content')

  # Remove #draft tag
  updated_content=$(echo "$content" | sed 's/#draft//g' | sed 's/  */ /g')

  bash scripts/memo-api.sh update "$memo_id" "$updated_content"
  echo "Removed #draft from $memo_id"
done
```

## Tag Organization Strategies

### Strategy 1: Hierarchical Tags

Use hyphens for hierarchy:

```
#tech-docker
#tech-kubernetes
#tech-postgresql

#work-project-alpha
#work-project-beta
#work-meetings

#personal-finances
#personal-health
```

**Benefits:**
- Clear categorization
- Easy to filter by prefix
- Consistent structure

### Strategy 2: Multi-Tag System

Combine multiple orthogonal tags:

```
Content + Type + Priority:
#docker #reference #important
#kubernetes #troubleshooting #urgent
#project-alpha #meeting #someday
```

**Benefits:**
- Flexible searching
- Multiple dimensions
- Easier to add/remove

### Strategy 3: Time-Based Tags

Include temporal context:

```
#2024-q1
#2024-q2
#week-06
#january
```

**Benefits:**
- Easy to review periods
- Archive old content
- Track evolution

## Practical Workflows

### New Memo Workflow

**1. Create with initial tags:**
```bash
bash scripts/memo-api.sh create "Content here" --tags "docker,reference"
```

**2. Review and add more tags later:**
```bash
MEMO_ID="abc123"
bash scripts/memo-api.sh get $MEMO_ID | jq '.content, .tags'

# Add "troubleshooting" tag
content=$(bash scripts/memo-api.sh get $MEMO_ID | jq -r '.content')
bash scripts/memo-api.sh update $MEMO_ID "${content} #troubleshooting"
```

### Tag Cleanup Workflow

**1. Find rarely used tags:**
```bash
bash scripts/tag-api.sh list | jq '.tags[] | select(.count < 3)'
```

**2. Review and consolidate:**
```bash
# Rename specific tags
bash scripts/tag-api.sh rename rarely-used better-name

# Or remove from memos
bash scripts/tag-api.sh search rarely-used | jq -r '.memos[].name' | while read -r memo_id; do
  # Review and update manually
  echo "Review memo: $memo_id"
done
```

### Weekly Tag Review

**1. See what tags were used this week:**
```bash
bash scripts/search-api.sh "" --from "$(date -d '7 days ago' +%Y-%m-%d)" | \
  jq -r '.memos[].tags[]' | sort | uniq -c | sort -rn
```

**2. Identify tag drift:**
```bash
# Tags used once this week (possible typos or one-offs)
bash scripts/search-api.sh "" --from "$(date -d '7 days ago' +%Y-%m-%d)" | \
  jq -r '.memos[].tags[]' | sort | uniq -c | grep "^\s*1 "
```

## Tag Search Examples

### Find Intersection (AND)

**Memos tagged with both "docker" AND "kubernetes":**
```bash
bash scripts/tag-api.sh search docker | jq '.memos[] | select(.tags | contains(["kubernetes"]))'
```

### Find Union (OR)

**Memos tagged with "docker" OR "kubernetes":**
```bash
(bash scripts/tag-api.sh search docker && bash scripts/tag-api.sh search kubernetes) | \
  jq -s 'map(.memos[]) | unique_by(.name)'
```

### Exclude Tags (NOT)

**Docker memos NOT tagged with "deprecated":**
```bash
bash scripts/tag-api.sh search docker | jq '.memos[] | select(.tags | contains(["deprecated"]) | not)'
```

## Tag Best Practices

1. **Start broad, narrow later**: Begin with general tags, refine as collection grows
2. **Review periodically**: Monthly tag cleanup prevents proliferation
3. **Document conventions**: Keep tag naming guide in a memo
4. **Use autocomplete**: Keep tag list for reference
5. **Limit tags per memo**: 3-5 tags is usually sufficient
6. **Rename vs create**: Consolidate similar tags rather than creating new ones
7. **Archive unused tags**: Remove tags from all memos if no longer relevant

## Tag Maintenance Script

Create a tag maintenance helper:

```bash
#!/bin/bash
# ~/claude-homelab/skills/memos/scripts/tag-maintenance.sh

MEMOS_DIR="$HOME/claude-homelab/skills/memos"
cd "$MEMOS_DIR"

echo "=== Tag Statistics ==="
bash scripts/tag-api.sh stats | jq '{total_memos, total_tags, tagged_memos}'

echo -e "\n=== Top 10 Tags ==="
bash scripts/tag-api.sh list | jq -r '.tags[:10][] | "\(.count)\t\(.tag)"'

echo -e "\n=== Rare Tags (used 1-2 times) ==="
bash scripts/tag-api.sh list | jq -r '.tags[] | select(.count <= 2) | "\(.count)\t\(.tag)"'

echo -e "\n=== Untagged Memos ==="
bash scripts/memo-api.sh list --limit 1000 | jq -r '.memos[] | select(.tags | length == 0) | .name' | wc -l
```

Make it executable and run monthly:
```bash
chmod +x ~/claude-homelab/skills/memos/scripts/tag-maintenance.sh
bash ~/claude-homelab/skills/memos/scripts/tag-maintenance.sh
```

## Example: Complete Tagging System

**Categories:**
- Content type: `#reference`, `#til`, `#troubleshooting`, `#meeting`
- Technology: `#docker`, `#kubernetes`, `#postgresql`, `#python`
- Project: `#project-alpha`, `#homelab`, `#automation`
- Status: `#draft`, `#reviewed`, `#archived`
- Priority: `#important`, `#urgent`, `#someday`

**Usage:**
```bash
# New Docker troubleshooting note
bash scripts/memo-api.sh create "Docker networking issue fixed" \
  --tags "docker,troubleshooting,reviewed,important"

# Meeting notes for project
bash scripts/memo-api.sh create "Sprint planning meeting notes" \
  --tags "meeting,project-alpha,reviewed"

# Quick reference saved
bash scripts/memo-api.sh create "Kubernetes port-forward command" \
  --tags "kubernetes,reference,commands"
```
