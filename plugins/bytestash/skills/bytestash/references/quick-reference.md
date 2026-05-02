# ByteStash Quick Reference

Quick command examples for common ByteStash operations.

## Setup

```bash
# Add credentials to .env
cat >> ~/.claude-homelab/.env <<EOF
BYTESTASH_URL="https://bytestash.example.com"
BYTESTASH_API_KEY="<your_api_key>"
EOF

chmod 600 ~/.claude-homelab/.env
```

## Common Tasks

### List All Snippets

```bash
cd skills/bytestash
./scripts/bytestash-api.sh list | jq .
```

### Search for Snippets

```bash
# Search by title
./scripts/bytestash-api.sh search "docker"

# Search by category
./scripts/bytestash-api.sh search --category "python"

# Search and format output
./scripts/bytestash-api.sh search "api" | jq '.[] | {id, title, categories}'
```

### View Snippet Details

```bash
# Get full snippet
./scripts/bytestash-api.sh get 123 | jq .

# Get just the code
./scripts/bytestash-api.sh get 123 | jq -r '.fragments[0].code'

# Get all fragment filenames
./scripts/bytestash-api.sh get 123 | jq -r '.fragments[].file_name'
```

### Create Simple Snippet

```bash
# Single-line code
./scripts/bytestash-api.sh create \
  --title "Quick Docker Build" \
  --description "Build and tag Docker image" \
  --categories "docker,devops" \
  --code "docker build -t myapp:latest ." \
  --language "bash" \
  --filename "build.sh"

# Multi-line code
./scripts/bytestash-api.sh create \
  --title "Python Function" \
  --categories "python,utils" \
  --code "$(cat <<'EOF'
def hello(name):
    return f"Hello, {name}!"
EOF
)" \
  --language "python" \
  --filename "hello.py"
```

### Create Multi-File Snippet

```bash
# Create files first
cat > app.py <<'EOF'
from fastapi import FastAPI
app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}
EOF

cat > requirements.txt <<'EOF'
fastapi==0.104.1
uvicorn==0.24.0
EOF

# Push as snippet
./scripts/bytestash-api.sh push \
  --title "FastAPI Starter" \
  --description "Minimal FastAPI application" \
  --categories "python,api,fastapi" \
  --files "app.py,requirements.txt"

# Clean up
rm app.py requirements.txt
```

### Update Snippet

```bash
# Update title
./scripts/bytestash-api.sh update 123 --title "New Title"

# Update categories
./scripts/bytestash-api.sh update 123 --categories "docker,kubernetes,devops"

# Update multiple fields
./scripts/bytestash-api.sh update 123 \
  --title "Updated Title" \
  --description "Updated description" \
  --categories "new,tags"
```

### Delete Snippet

```bash
# Delete with confirmation prompt
./scripts/bytestash-api.sh delete 123
# Are you sure you want to delete snippet 123? (y/N)
```

### Share Snippets

```bash
# Create public share
./scripts/bytestash-api.sh share 123
# Returns: {"id":"abc123","snippetId":123,...}

# Create protected share (requires login)
./scripts/bytestash-api.sh share 123 --protected

# Create expiring share (24 hours = 86400 seconds)
./scripts/bytestash-api.sh share 123 --expires 86400

# List all shares for a snippet
./scripts/bytestash-api.sh shares 123

# View shared snippet
./scripts/bytestash-api.sh view-share abc123

# Delete share
./scripts/bytestash-api.sh unshare abc123
```

## Advanced Workflows

### Bulk Category Update

```bash
# Find all Python snippets without "script" tag
./scripts/bytestash-api.sh list | \
  jq -r '.[] | select(.categories[]? == "python") |
         select([.categories[]? == "script"] | any | not) |
         .id' | \
  while read -r id; do
    ./scripts/bytestash-api.sh update "$id" --categories "python,script"
    echo "Updated snippet $id"
  done
```

### Export All Snippets

```bash
# Export to JSON file
./scripts/bytestash-api.sh list > bytestash-backup.json

# Export with pretty formatting
./scripts/bytestash-api.sh list | jq . > bytestash-backup.json

# Export specific category
./scripts/bytestash-api.sh search --category "docker" > docker-snippets.json
```

### Find Snippets by Code Content

```bash
# Search snippet code (requires downloading all)
./scripts/bytestash-api.sh list | \
  jq -r '.[].id' | \
  while read -r id; do
    if ./scripts/bytestash-api.sh get "$id" | \
       jq -e '.fragments[].code | contains("FastAPI")' > /dev/null 2>&1; then
      echo "Snippet $id contains FastAPI"
      ./scripts/bytestash-api.sh get "$id" | jq '{id, title, categories}'
    fi
  done
```

### Organize by File Extension

```bash
# List snippets by language
./scripts/bytestash-api.sh list | \
  jq -r 'group_by(.fragments[0].language) |
         .[] | "\(.[0].fragments[0].language): \(length) snippets"'

# Find all Python files
./scripts/bytestash-api.sh list | \
  jq -r '.[] | select(.fragments[].language == "python") |
         {id, title, files: [.fragments[].file_name]}'
```

### Create Snippet from Git Repo Files

```bash
# Save important config files
cd /path/to/project

./scripts/bytestash-api.sh push \
  --title "Project Configuration" \
  --description "Configuration files for MyProject" \
  --categories "config,devops" \
  --files "docker-compose.yml,.env.example,nginx.conf"
```

### Share Link with Custom Message

```bash
# Create share and format message
share_response=$(./scripts/bytestash-api.sh share 123)
share_id=$(echo "$share_response" | jq -r '.id')
snippet=$(./scripts/bytestash-api.sh get 123)
title=$(echo "$snippet" | jq -r '.title')

echo "Check out my snippet: $title"
echo "Link: https://bytestash.example.com/s/$share_id"
```

## jq Filters for Common Operations

### Filter by Category

```bash
# Single category
./scripts/bytestash-api.sh list | \
  jq '.[] | select(.categories[]? == "docker")'

# Multiple categories (OR)
./scripts/bytestash-api.sh list | \
  jq '.[] | select(.categories[]? as $cat | ["docker", "kubernetes"] | index($cat))'

# Multiple categories (AND)
./scripts/bytestash-api.sh list | \
  jq '.[] | select(
    (.categories[]? == "docker") and
    (.categories[]? == "nginx")
  )'
```

### Sort Snippets

```bash
# Sort by title
./scripts/bytestash-api.sh list | jq 'sort_by(.title)'

# Sort by update time (newest first)
./scripts/bytestash-api.sh list | jq 'sort_by(.updated_at) | reverse'

# Sort by category count
./scripts/bytestash-api.sh list | jq 'sort_by(.categories | length) | reverse'
```

### Summary Statistics

```bash
# Count snippets by category
./scripts/bytestash-api.sh list | \
  jq -r '.[] | .categories[]?' | \
  sort | uniq -c | sort -rn

# Total snippet count
./scripts/bytestash-api.sh list | jq 'length'

# Average fragments per snippet
./scripts/bytestash-api.sh list | \
  jq '[.[] | .fragments | length] | add / length'

# Language distribution
./scripts/bytestash-api.sh list | \
  jq -r '.[] | .fragments[].language' | \
  sort | uniq -c | sort -rn
```

## Troubleshooting

### Check API Connectivity

```bash
# Test connection
curl -H "x-api-key: $BYTESTASH_API_KEY" \
  "$BYTESTASH_URL/api/v1/snippets" | jq .

# Verify credentials
if ./scripts/bytestash-api.sh list > /dev/null 2>&1; then
  echo "✓ API connection successful"
else
  echo "✗ API connection failed"
fi
```

### Debug API Requests

```bash
# Add verbose output to script
curl -v -H "x-api-key: $BYTESTASH_API_KEY" \
  "$BYTESTASH_URL/api/v1/snippets"

# Check environment variables
echo "URL: $BYTESTASH_URL"
echo "API Key: ${BYTESTASH_API_KEY:0:10}..." # Show first 10 chars
```

### Handle Errors

```bash
# Capture error response
response=$(./scripts/bytestash-api.sh create \
  --title "Test" \
  --code "test" 2>&1)

if echo "$response" | jq -e '.error' > /dev/null 2>&1; then
  echo "Error: $(echo "$response" | jq -r '.error')"
else
  echo "Success: $(echo "$response" | jq -r '.id')"
fi
```
