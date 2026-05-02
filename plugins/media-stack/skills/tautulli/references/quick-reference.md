# Tautulli Quick Reference

Copy-paste ready commands for common Tautulli operations.

## Setup

```bash
# Add to ~/.claude-homelab/.env
TAUTULLI_URL="http://192.168.1.100:8181"
TAUTULLI_API_KEY="<your_api_key>"

# Navigate to skill directory
cd ~/claude-homelab/skills/tautulli
```

## Quick Commands

### Check Server Status

```bash
# Server info and version
./scripts/tautulli-api.sh server-info
```

### Current Activity

```bash
# Who's watching right now
./scripts/tautulli-api.sh activity

# Activity with detailed session info
./scripts/tautulli-api.sh activity --details
```

### Watch History

```bash
# Last 25 plays
./scripts/tautulli-api.sh history

# Last 50 plays
./scripts/tautulli-api.sh history --limit 50

# Specific user's history
./scripts/tautulli-api.sh history --user "john"

# Last week's history
./scripts/tautulli-api.sh history --days 7

# Movies only
./scripts/tautulli-api.sh history --media-type movie

# Search for specific title
./scripts/tautulli-api.sh history --search "Inception"

# Combine filters
./scripts/tautulli-api.sh history --user "john" --media-type episode --days 30 --limit 100
```

### User Statistics

```bash
# All users with stats
./scripts/tautulli-api.sh user-stats

# Specific user
./scripts/tautulli-api.sh user-stats --user "john"

# Top 10 most active users
./scripts/tautulli-api.sh user-stats --sort-by plays --limit 10

# Last 30 days activity
./scripts/tautulli-api.sh user-stats --days 30
```

### Libraries

```bash
# List all library sections
./scripts/tautulli-api.sh libraries

# Specific library stats (replace 1 with your section ID)
./scripts/tautulli-api.sh library-stats --section-id 1
```

### Popular Content

```bash
# Most popular movies
./scripts/tautulli-api.sh popular --media-type movie --limit 10

# Most watched in last 30 days
./scripts/tautulli-api.sh popular --days 30 --limit 20

# Popular in specific library
./scripts/tautulli-api.sh popular --section-id 1 --days 7
```

### Recently Added

```bash
# Last 25 additions
./scripts/tautulli-api.sh recent

# Last 50 additions
./scripts/tautulli-api.sh recent --limit 50

# Recent movies only
./scripts/tautulli-api.sh recent --media-type movie

# Last week's additions from specific library
./scripts/tautulli-api.sh recent --section-id 1 --days 7
```

### Home Statistics

```bash
# Overview dashboard stats
./scripts/tautulli-api.sh home-stats

# Last 30 days overview
./scripts/tautulli-api.sh home-stats --days 30

# Last 7 days overview
./scripts/tautulli-api.sh home-stats --days 7
```

### Stream Analytics

```bash
# Stream types (direct play vs transcode)
./scripts/tautulli-api.sh plays-by-stream --days 30

# Platform distribution
./scripts/tautulli-api.sh plays-by-platform --days 30

# Plays by date
./scripts/tautulli-api.sh plays-by-date --days 30

# Plays by hour of day
./scripts/tautulli-api.sh plays-by-hour --days 7

# Plays by day of week
./scripts/tautulli-api.sh plays-by-day --days 30
```

### Concurrent Streams

```bash
# Concurrent stream history
./scripts/tautulli-api.sh concurrent-streams --days 30

# Peak concurrent streams
./scripts/tautulli-api.sh concurrent-streams --days 7 --peak
```

### Media Metadata

```bash
# By Plex rating key
./scripts/tautulli-api.sh metadata --rating-key 12345

# By Plex GUID
./scripts/tautulli-api.sh metadata --guid "plex://movie/5d776..."
```

## Processing Output with jq

### Extract Specific Fields

```bash
# Get just the data section
./scripts/tautulli-api.sh activity | jq '.response.data'

# Get session count
./scripts/tautulli-api.sh activity | jq '.response.data.stream_count'

# List active users
./scripts/tautulli-api.sh activity | jq '.response.data.sessions[].friendly_name'

# Get history titles and dates
./scripts/tautulli-api.sh history | jq '.response.data.data[] | {title: .full_title, date: .date, user: .friendly_name}'
```

### Filter Results

```bash
# Only transcoding sessions
./scripts/tautulli-api.sh activity | jq '.response.data.sessions[] | select(.transcode_decision == "transcode")'

# Movies watched by user
./scripts/tautulli-api.sh history --user "john" | jq '.response.data.data[] | select(.media_type == "movie") | .full_title'

# Recent additions in last 24 hours
./scripts/tautulli-api.sh recent | jq --arg cutoff "$(date -d '1 day ago' +%s)" '.response.data.recently_added[] | select(.added_at > ($cutoff | tonumber))'
```

### Format Output

```bash
# Pretty print full response
./scripts/tautulli-api.sh activity | jq '.'

# Compact output (one line)
./scripts/tautulli-api.sh activity | jq -c '.'

# CSV format for history
./scripts/tautulli-api.sh history | jq -r '.response.data.data[] | [.date, .friendly_name, .full_title, .percent_complete] | @csv'

# Table format
./scripts/tautulli-api.sh user-stats | jq -r '.response.data[] | "\(.friendly_name)\t\(.plays)\t\(.duration)"'
```

### Statistics and Aggregation

```bash
# Total play count from history
./scripts/tautulli-api.sh history --limit 1000 | jq '.response.data.recordsTotal'

# Count by media type
./scripts/tautulli-api.sh history --limit 100 | jq '.response.data.data | group_by(.media_type) | map({type: .[0].media_type, count: length})'

# Average watch percentage
./scripts/tautulli-api.sh history --limit 100 | jq '[.response.data.data[].percent_complete] | add / length'

# Sum of all watch time (seconds)
./scripts/tautulli-api.sh user-stats | jq '[.response.data[].duration] | add'
```

## Common Workflows

### Check Who's Watching

```bash
# Simple list of current users
./scripts/tautulli-api.sh activity | jq -r '.response.data.sessions[] | "\(.friendly_name) - \(.full_title)"'

# Detailed session info
./scripts/tautulli-api.sh activity | jq '.response.data.sessions[] | {user: .friendly_name, title: .full_title, player: .player, progress: .progress_percent}'
```

### Find Most Active Users This Week

```bash
./scripts/tautulli-api.sh user-stats --days 7 --sort-by plays --limit 10 | jq '.response.data[] | {name: .friendly_name, plays: .plays, hours: (.duration / 3600 | floor)}'
```

### List Unwatched Recent Additions

```bash
# Get recent additions
./scripts/tautulli-api.sh recent --limit 50 | jq -r '.response.data.recently_added[] | .rating_key' > recent_keys.txt

# For each, check if it has play history
while read key; do
    plays=$(./scripts/tautulli-api.sh history --limit 1000 | jq ".response.data.data[] | select(.rating_key == \"$key\") | .rating_key" | wc -l)
    if [ "$plays" -eq 0 ]; then
        title=$(./scripts/tautulli-api.sh metadata --rating-key "$key" | jq -r '.response.data.full_title')
        echo "Unwatched: $title"
    fi
done < recent_keys.txt
```

### Generate Weekly Report

```bash
#!/bin/bash
# Weekly activity report

echo "=== Tautulli Weekly Report ==="
echo

echo "Top 5 Users:"
./scripts/tautulli-api.sh user-stats --days 7 --sort-by plays --limit 5 | \
    jq -r '.response.data[] | "\(.friendly_name): \(.plays) plays, \((.duration / 3600) | floor) hours"'

echo
echo "Most Popular Movies:"
./scripts/tautulli-api.sh popular --media-type movie --days 7 --limit 5 | \
    jq -r '.response.data[0].rows[] | "\(.title) (\(.year)): \(.total_plays) plays"'

echo
echo "Peak Viewing Times:"
./scripts/tautulli-api.sh plays-by-hour --days 7 | \
    jq -r '.response.data.series[0] | .data | to_entries | sort_by(.value) | reverse | .[0:3][] | "Hour \(.key): \(.value) plays"'
```

### Monitor Transcode Load

```bash
#!/bin/bash
# Check if transcoding is happening and by whom

transcodes=$(./scripts/tautulli-api.sh activity | \
    jq '.response.data.sessions[] | select(.transcode_decision == "transcode")')

count=$(echo "$transcodes" | jq -s 'length')

if [ "$count" -gt 0 ]; then
    echo "⚠️  $count active transcodes:"
    echo "$transcodes" | jq -r '"\(.friendly_name) - \(.full_title) (\(.video_decision))"'
else
    echo "✅ No active transcodes"
fi
```

### Find User's Favorite Content

```bash
#!/bin/bash
# Find what a user watches most

USER="john"

echo "Top movies watched by $USER:"
./scripts/tautulli-api.sh history --user "$USER" --media-type movie --limit 500 | \
    jq -r '.response.data.data[] | .full_title' | sort | uniq -c | sort -rn | head -10

echo
echo "Top shows watched by $USER:"
./scripts/tautulli-api.sh history --user "$USER" --media-type episode --limit 500 | \
    jq -r '.response.data.data[] | .grandparent_title' | sort | uniq -c | sort -rn | head -10
```

## Direct API Calls (Advanced)

If you need to call the API directly without the wrapper script:

```bash
# Basic structure
curl -s "${TAUTULLI_URL}/api/v2?apikey=${TAUTULLI_API_KEY}&cmd=COMMAND&param=value"

# Get activity
curl -s "${TAUTULLI_URL}/api/v2?apikey=${TAUTULLI_API_KEY}&cmd=get_activity" | jq '.'

# Get history with parameters
curl -s "${TAUTULLI_URL}/api/v2?apikey=${TAUTULLI_API_KEY}&cmd=get_history&user=john&length=50" | jq '.'

# URL encode spaces and special characters
QUERY=$(echo "Star Wars" | jq -sRr @uri)
curl -s "${TAUTULLI_URL}/api/v2?apikey=${TAUTULLI_API_KEY}&cmd=get_history&search=${QUERY}" | jq '.'
```

## Useful Aliases

Add to your `~/.bashrc` or `~/.zshrc`:

```bash
# Tautulli shortcuts
alias tautulli='cd ~/claude-homelab/skills/tautulli && ./scripts/tautulli-api.sh'
alias tautulli-activity='tautulli activity | jq ".response.data.sessions[] | {user: .friendly_name, title: .full_title, progress: .progress_percent}"'
alias tautulli-history='tautulli history | jq -r ".response.data.data[] | \"\(.date | strftime(\"%Y-%m-%d %H:%M\")) - \(.friendly_name) - \(.full_title)\""'
alias tautulli-users='tautulli user-stats | jq -r ".response.data[] | \"\(.friendly_name): \(.plays) plays\""'
```

Then use:
```bash
tautulli-activity
tautulli-history
tautulli-users
```

## Tips

1. **Combine filters** for precise results: `--user "name" --media-type movie --days 7`
2. **Use jq for clarity** - easier to read than raw JSON
3. **Save frequent queries** as shell functions or scripts
4. **Check recordsTotal** in history to see if you need pagination
5. **Use --limit wisely** - large limits slow down queries
6. **Cache library IDs** - they rarely change
7. **Shorter time ranges** (--days) are faster
8. **Test with small limits** before running large queries
