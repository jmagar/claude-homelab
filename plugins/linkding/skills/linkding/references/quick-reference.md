# Linkding Quick Reference

Common operations for quick copy-paste usage.

## Setup

Add credentials to `~/.claude-homelab/.env`:
```bash
LINKDING_URL="http://localhost:9090"
LINKDING_API_KEY="your-api-token"
```

Get your API token from the Settings page in Linkding's web UI.

## Quick Bookmark Creation

### Create Simple Bookmark

```bash
curl -X POST "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "url": "https://example.com"
  }'
```

### Create Bookmark with Metadata

```bash
curl -X POST "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "url": "https://github.com/sissbruecker/linkding",
    "title": "Linkding - Self-hosted bookmark manager",
    "description": "Minimal bookmark manager for speed and simplicity",
    "tag_names": ["selfhosted", "bookmarks", "python"]
  }'
```

### Create Archived Bookmark

```bash
curl -X POST "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "url": "https://example.com",
    "title": "Reference Article",
    "archived": true,
    "tag_names": ["reference", "archive"]
  }'
```

### Create Unread Bookmark (Read Later)

```bash
curl -X POST "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "url": "https://example.com/article",
    "unread": true,
    "tag_names": ["toread"]
  }'
```

## Search & Filter Bookmarks

### List All Bookmarks

```bash
curl -s "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY" | jq '.results[] | {id, title, url}'
```

### Search by Query

```bash
curl -s "$LINKDING_URL/api/bookmarks/?q=python" \
  -H "Authorization: Token $LINKDING_API_KEY" | jq '.results[] | {title, url}'
```

### Search with Multiple Keywords

```bash
curl -s "$LINKDING_URL/api/bookmarks/?q=python+tutorial" \
  -H "Authorization: Token $LINKDING_API_KEY" | jq '.results[] | {title, url}'
```

### Filter Archived Bookmarks

```bash
curl -s "$LINKDING_URL/api/bookmarks/?archived=true" \
  -H "Authorization: Token $LINKDING_API_KEY" | jq '.results[] | {title, url}'
```

### Filter Non-Archived Bookmarks

```bash
curl -s "$LINKDING_URL/api/bookmarks/?archived=false" \
  -H "Authorization: Token $LINKDING_API_KEY" | jq '.results[] | {title, url}'
```

### Combine Search and Filters

```bash
curl -s "$LINKDING_URL/api/bookmarks/?q=github&archived=false&limit=20" \
  -H "Authorization: Token $LINKDING_API_KEY" | jq '.results[] | {title, url, tag_names}'
```

### Paginate Results

```bash
# Get first 50 results
curl -s "$LINKDING_URL/api/bookmarks/?limit=50&offset=0" \
  -H "Authorization: Token $LINKDING_API_KEY" | jq

# Get next 50 results
curl -s "$LINKDING_URL/api/bookmarks/?limit=50&offset=50" \
  -H "Authorization: Token $LINKDING_API_KEY" | jq
```

## Check if URL Exists

### Check Before Adding

```bash
curl -X POST "$LINKDING_URL/api/bookmarks/check/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"url": "https://example.com"}' | jq
```

Returns existing bookmark if found, or `{"bookmark": null}` if new.

## Update Bookmarks

### Update Title and Description

```bash
curl -X PATCH "$LINKDING_URL/api/bookmarks/123/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Updated Title",
    "description": "Updated description with more context"
  }'
```

### Update Tags (Replaces All)

```bash
curl -X PATCH "$LINKDING_URL/api/bookmarks/123/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "tag_names": ["new-tag", "another-tag", "third-tag"]
  }'
```

### Mark as Read

```bash
curl -X PATCH "$LINKDING_URL/api/bookmarks/123/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"unread": false}'
```

### Share Bookmark Publicly

```bash
curl -X PATCH "$LINKDING_URL/api/bookmarks/123/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"shared": true}'
```

## Archive Management

### Archive Single Bookmark

```bash
curl -X POST "$LINKDING_URL/api/bookmarks/archive/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"id": 123}'
```

### Unarchive Single Bookmark

```bash
curl -X POST "$LINKDING_URL/api/bookmarks/unarchive/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"id": 123}'
```

### Get Specific Bookmark

```bash
curl -s "$LINKDING_URL/api/bookmarks/123/" \
  -H "Authorization: Token $LINKDING_API_KEY" | jq
```

### Delete Bookmark

```bash
curl -X DELETE "$LINKDING_URL/api/bookmarks/123/" \
  -H "Authorization: Token $LINKDING_API_KEY"
```

## Tag Management

### List All Tags

```bash
curl -s "$LINKDING_URL/api/tags/" \
  -H "Authorization: Token $LINKDING_API_KEY" | jq '.results[] | {id, name}'
```

### List Tags with Bookmark Counts

```bash
curl -s "$LINKDING_URL/api/tags/" \
  -H "Authorization: Token $LINKDING_API_KEY" | jq '.results[] | {name, date_added}'
```

### Create New Tag

```bash
curl -X POST "$LINKDING_URL/api/tags/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"name": "new-tag"}'
```

### Get Tag by ID

```bash
curl -s "$LINKDING_URL/api/tags/1/" \
  -H "Authorization: Token $LINKDING_API_KEY" | jq
```

## Bulk Operations

### Export All Bookmark URLs

```bash
curl -s "$LINKDING_URL/api/bookmarks/?limit=100" \
  -H "Authorization: Token $LINKDING_API_KEY" | \
  jq -r '.results[].url'
```

### Export Bookmarks as CSV

```bash
echo "title,url,tags,description,archived,date_added" > bookmarks.csv
curl -s "$LINKDING_URL/api/bookmarks/?limit=100" \
  -H "Authorization: Token $LINKDING_API_KEY" | \
  jq -r '.results[] | [.title, .url, (.tag_names | join(";")), .description, .archived, .date_added] | @csv' >> bookmarks.csv
```

### Find Bookmarks Without Tags

```bash
curl -s "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY" | \
  jq '.results[] | select(.tag_names | length == 0) | {id, title, url}'
```

### Find Unread Bookmarks

```bash
curl -s "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY" | \
  jq '.results[] | select(.unread == true) | {id, title, url}'
```

### Archive All Old Unread Items

```bash
# Get unread bookmarks older than 30 days, archive them
curl -s "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY" | \
  jq -r '.results[] | select(.unread == true and (.date_added | fromdateiso8601 < (now - (30*24*60*60)))) | .id' | \
  while read id; do
    echo "Archiving bookmark $id"
    curl -X POST "$LINKDING_URL/api/bookmarks/archive/" \
      -H "Authorization: Token $LINKDING_API_KEY" \
      -H "Content-Type: application/json" \
      -d "{\"id\": $id}"
    sleep 0.5
  done
```

## User Profile

### Get Current User Settings

```bash
curl -s "$LINKDING_URL/api/user/profile/" \
  -H "Authorization: Token $LINKDING_API_KEY" | jq
```

## Workflows

### Workflow: Save Link with Auto-Tags

```bash
URL="https://example.com/python-tutorial"

# 1. Check if already saved
EXISTING=$(curl -s -X POST "$LINKDING_URL/api/bookmarks/check/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d "{\"url\": \"$URL\"}" | jq -r '.bookmark.id // empty')

if [ -n "$EXISTING" ]; then
  echo "Already saved as bookmark ID: $EXISTING"
else
  # 2. Create new bookmark
  curl -X POST "$LINKDING_URL/api/bookmarks/" \
    -H "Authorization: Token $LINKDING_API_KEY" \
    -H "Content-Type: application/json" \
    -d "{
      \"url\": \"$URL\",
      \"title\": \"Python Tutorial\",
      \"tag_names\": [\"python\", \"tutorial\", \"programming\"]
    }"
fi
```

### Workflow: Clean Up Duplicate Bookmarks

```bash
# 1. Get all bookmarks
curl -s "$LINKDING_URL/api/bookmarks/?limit=1000" \
  -H "Authorization: Token $LINKDING_API_KEY" | \
  jq -r '.results[] | [.url, .id] | @tsv' | \
  sort | uniq -d -f 1 | \
  while IFS=$'\t' read url id; do
    echo "Duplicate found: $url (ID: $id)"
    # Optionally delete: curl -X DELETE "$LINKDING_URL/api/bookmarks/$id/" ...
  done
```

### Workflow: Batch Tag Addition

```bash
# Add "reviewed" tag to all bookmarks matching query
curl -s "$LINKDING_URL/api/bookmarks/?q=documentation" \
  -H "Authorization: Token $LINKDING_API_KEY" | \
  jq -r '.results[] | [.id, (.tag_names | join(","))] | @tsv' | \
  while IFS=$'\t' read id current_tags; do
    new_tags="$current_tags,reviewed"
    echo "Updating bookmark $id with tags: $new_tags"
    curl -X PATCH "$LINKDING_URL/api/bookmarks/$id/" \
      -H "Authorization: Token $LINKDING_API_KEY" \
      -H "Content-Type: application/json" \
      -d "{\"tag_names\": [\"${new_tags//,/\",\"}\"]}"
    sleep 0.5
  done
```

### Workflow: Daily Unread Report

```bash
# Generate daily report of unread bookmarks
echo "=== Unread Bookmarks Report ==="
echo "Generated: $(date)"
echo

curl -s "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY" | \
  jq -r '.results[] | select(.unread == true) | "[\(.date_added | split("T")[0])] \(.title)\n  URL: \(.url)\n  Tags: \(.tag_names | join(", "))\n"'
```

### Workflow: Archive Old Read Bookmarks

```bash
# Archive bookmarks older than 90 days that are marked as read
CUTOFF_DATE=$(date -d "90 days ago" -u +"%Y-%m-%dT%H:%M:%SZ")

curl -s "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY" | \
  jq -r ".results[] | select(.unread == false and .archived == false and .date_added < \"$CUTOFF_DATE\") | .id" | \
  while read id; do
    echo "Archiving old bookmark ID: $id"
    curl -X POST "$LINKDING_URL/api/bookmarks/archive/" \
      -H "Authorization: Token $LINKDING_API_KEY" \
      -H "Content-Type: application/json" \
      -d "{\"id\": $id}"
    sleep 0.5
  done
```

## Common Filters & Searches

### Search by Domain

```bash
curl -s "$LINKDING_URL/api/bookmarks/?q=github.com" \
  -H "Authorization: Token $LINKDING_API_KEY" | jq '.results[] | {title, url}'
```

### Recent Bookmarks (Last 10)

```bash
curl -s "$LINKDING_URL/api/bookmarks/?limit=10" \
  -H "Authorization: Token $LINKDING_API_KEY" | \
  jq '.results[] | {date: .date_added, title, url}'
```

### Shared Bookmarks Only

```bash
curl -s "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY" | \
  jq '.results[] | select(.shared == true) | {title, url}'
```

### Find Bookmarks by Tag Pattern

```bash
# Find all bookmarks with tags containing "python"
curl -s "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY" | \
  jq '.results[] | select(.tag_names[] | contains("python")) | {title, url, tags: .tag_names}'
```

## Tips & Tricks

### Count Total Bookmarks

```bash
curl -s "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY" | jq '.count'
```

### Get Most Used Tags

```bash
curl -s "$LINKDING_URL/api/tags/" \
  -H "Authorization: Token $LINKDING_API_KEY" | \
  jq -r '.results[] | .name' | sort | uniq -c | sort -rn | head -20
```

### Bookmark Statistics

```bash
echo "=== Linkding Statistics ==="
TOTAL=$(curl -s "$LINKDING_URL/api/bookmarks/" -H "Authorization: Token $LINKDING_API_KEY" | jq '.count')
ARCHIVED=$(curl -s "$LINKDING_URL/api/bookmarks/?archived=true" -H "Authorization: Token $LINKDING_API_KEY" | jq '.count')
TAGS=$(curl -s "$LINKDING_URL/api/tags/" -H "Authorization: Token $LINKDING_API_KEY" | jq '.count')

echo "Total Bookmarks: $TOTAL"
echo "Archived: $ARCHIVED"
echo "Active: $((TOTAL - ARCHIVED))"
echo "Total Tags: $TAGS"
```

### Validate All Bookmark URLs (Check for 404s)

```bash
curl -s "$LINKDING_URL/api/bookmarks/?limit=100" \
  -H "Authorization: Token $LINKDING_API_KEY" | \
  jq -r '.results[] | [.id, .url] | @tsv' | \
  while IFS=$'\t' read id url; do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    if [ "$STATUS" -ge 400 ]; then
      echo "Broken link (ID: $id, Status: $STATUS): $url"
    fi
    sleep 1
  done
```
