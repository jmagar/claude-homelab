# SABnzbd Quick Reference

Common operations for quick copy-paste usage.

## Setup

```bash
export SABNZBD_URL="http://localhost:8080"
export SABNZBD_API_KEY="your-api-key"
```

## Queue Management

### Get Queue Status

```bash
curl -s "$SABNZBD_URL/api?mode=queue&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" | jq
```

### Get Queue with Pagination

```bash
# Get first 10 items
curl -s "$SABNZBD_URL/api?mode=queue&start=0&limit=10&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" | jq
```

### View Specific Queue Item

```bash
# Show queue summary
curl -s "$SABNZBD_URL/api?mode=queue&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" | \
  jq '.queue.slots[] | {filename, status, percentage, mbleft, priority}'
```

### Pause Queue

```bash
# Pause indefinitely
curl -X POST "$SABNZBD_URL/api?mode=pause" \
  -H "X-API-Key: $SABNZBD_API_KEY"

# Pause for 30 minutes
curl -X POST "$SABNZBD_URL/api?mode=pause&value=30" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

### Resume Queue

```bash
curl -X POST "$SABNZBD_URL/api?mode=resume" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

### Delete Queue Item

```bash
# Delete specific item (keep files)
curl -X POST "$SABNZBD_URL/api?mode=queue&name=delete&value=SABnzbd_nzo_abc123" \
  -H "X-API-Key: $SABNZBD_API_KEY"

# Delete all items
curl -X POST "$SABNZBD_URL/api?mode=queue&name=delete&value=all" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

## Adding NZBs

### Add NZB by URL

```bash
# Basic add
curl -X POST "$SABNZBD_URL/api?mode=addurl&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" \
  -d "name=http://example.com/file.nzb"

# With category and priority
curl -X POST "$SABNZBD_URL/api?mode=addurl&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" \
  -d "name=http://example.com/file.nzb&cat=movies&priority=1"
```

### Add NZB by File Upload

```bash
# Upload local NZB file
curl -X POST "$SABNZBD_URL/api?mode=addfile&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" \
  -F "nzbfile=@/path/to/file.nzb" \
  -F "cat=tv"

# With priority and post-processing
curl -X POST "$SABNZBD_URL/api?mode=addfile&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" \
  -F "nzbfile=@/path/to/file.nzb" \
  -F "cat=movies" \
  -F "priority=1" \
  -F "pp=3"
```

### Priority Levels

- `2` - Force (highest)
- `1` - High
- `0` - Normal (default)
- `-1` - Low
- `-2` - Stop (paused)

### Post-Processing Levels

- `0` - None
- `1` - Repair
- `2` - Repair + Unpack
- `3` - Repair + Unpack + Delete

## Speed Control

### Set Download Speed Limit

```bash
# Set 5 MB/s limit (5120 KB/s)
curl -X POST "$SABNZBD_URL/api?mode=speedlimit&value=5120" \
  -H "X-API-Key: $SABNZBD_API_KEY"

# Unlimited speed
curl -X POST "$SABNZBD_URL/api?mode=speedlimit&value=0" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

### Get Current Speed

```bash
curl -s "$SABNZBD_URL/api?mode=queue&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" | jq '.queue | {speed, speedlimit, speedlimit_abs}'
```

## History

### Get Download History

```bash
# All history
curl -s "$SABNZBD_URL/api?mode=history&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" | jq

# Last 20 items
curl -s "$SABNZBD_URL/api?mode=history&limit=20&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" | jq
```

### Get Failed Downloads Only

```bash
curl -s "$SABNZBD_URL/api?mode=history&failed_only=1&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" | \
  jq '.history.slots[] | {name, status, fail_message}'
```

### Filter History by Category

```bash
curl -s "$SABNZBD_URL/api?mode=history&category=movies&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" | jq
```

### Delete History Item

```bash
# Delete specific item
curl -X POST "$SABNZBD_URL/api?mode=history&name=delete&value=SABnzbd_nzo_xyz789" \
  -H "X-API-Key: $SABNZBD_API_KEY"

# Clear all history
curl -X POST "$SABNZBD_URL/api?mode=history&name=delete&value=all" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

## Categories

### List All Categories

```bash
curl -s "$SABNZBD_URL/api?mode=get_cats&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" | jq '.categories[]'
```

### Change Queue Item Category

```bash
curl -X POST "$SABNZBD_URL/api?mode=set_cat&value=SABnzbd_nzo_abc123&value2=movies" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

## Priority Management

### Change Queue Item Priority

```bash
# Set to high priority (1)
curl -X POST "$SABNZBD_URL/api?mode=queue&name=priority&value=SABnzbd_nzo_abc123&value2=1" \
  -H "X-API-Key: $SABNZBD_API_KEY"

# Set to force priority (2)
curl -X POST "$SABNZBD_URL/api?mode=queue&name=priority&value=SABnzbd_nzo_abc123&value2=2" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

## Status & Information

### Get SABnzbd Version

```bash
curl -s "$SABNZBD_URL/api?mode=version" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

### Get Full Status

```bash
curl -s "$SABNZBD_URL/api?mode=fullstatus&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" | jq
```

### Get Server Statistics

```bash
curl -s "$SABNZBD_URL/api?mode=server_stats&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" | jq '{total, month, week, day}'
```

### Get Configuration

```bash
curl -s "$SABNZBD_URL/api?mode=get_config&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" | jq
```

## Workflows

### Workflow: Add and Monitor NZB Download

1. **Add NZB by URL:**
   ```bash
   curl -X POST "$SABNZBD_URL/api?mode=addurl&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" \
     -d "name=http://indexer.com/get.php?guid=xyz&cat=movies&priority=1" | \
     jq '.nzo_ids[0]'
   ```

2. **Monitor queue status:**
   ```bash
   curl -s "$SABNZBD_URL/api?mode=queue&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" | \
     jq '.queue.slots[] | {filename, status, percentage, timeleft}'
   ```

3. **Check history when complete:**
   ```bash
   curl -s "$SABNZBD_URL/api?mode=history&limit=1&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" | \
     jq '.history.slots[0] | {name, status, storage}'
   ```

### Workflow: Batch Add Multiple NZBs

```bash
# Add multiple NZBs with same category
for url in \
  "http://indexer.com/nzb1.nzb" \
  "http://indexer.com/nzb2.nzb" \
  "http://indexer.com/nzb3.nzb"; do
  curl -X POST "$SABNZBD_URL/api?mode=addurl&output=json" \
    -H "X-API-Key: $SABNZBD_API_KEY" \
    -d "name=$url&cat=tv&priority=0"
  sleep 1
done
```

### Workflow: Clean Up Failed Downloads

```bash
# Get all failed downloads
curl -s "$SABNZBD_URL/api?mode=history&failed_only=1&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" | \
  jq -r '.history.slots[].nzo_id' | \
  while read nzo_id; do
    echo "Deleting failed download: $nzo_id"
    curl -X POST "$SABNZBD_URL/api?mode=history&name=delete&value=$nzo_id" \
      -H "X-API-Key: $SABNZBD_API_KEY"
  done
```

### Workflow: Monitor Download Progress

```bash
# Watch queue status in real-time
watch -n 5 "curl -s '$SABNZBD_URL/api?mode=queue&output=json' \
  -H 'X-API-Key: $SABNZBD_API_KEY' | \
  jq '.queue | {status, speed, timeleft, mbleft}'"
```

### Workflow: Throttle Downloads During Peak Hours

```bash
# Slow down to 2 MB/s during peak hours
curl -X POST "$SABNZBD_URL/api?mode=speedlimit&value=2048" \
  -H "X-API-Key: $SABNZBD_API_KEY"

# Resume full speed later
curl -X POST "$SABNZBD_URL/api?mode=speedlimit&value=0" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

## One-Liners

### Show Active Downloads

```bash
curl -s "$SABNZBD_URL/api?mode=queue&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" | \
  jq -r '.queue.slots[] | "\(.filename) - \(.percentage)% - \(.timeleft) remaining"'
```

### Count Queue Items by Status

```bash
curl -s "$SABNZBD_URL/api?mode=queue&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" | \
  jq '.queue.slots | group_by(.status) | map({status: .[0].status, count: length})'
```

### Show Download Stats Summary

```bash
curl -s "$SABNZBD_URL/api?mode=server_stats&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" | \
  jq '{today: .day, this_week: .week, this_month: .month, all_time: .total}'
```

### List Recently Completed Downloads

```bash
curl -s "$SABNZBD_URL/api?mode=history&limit=5&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" | \
  jq -r '.history.slots[] | "\(.name) - \(.status) - \(.storage)"'
```
