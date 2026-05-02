# Paperless-ngx Quick Reference

Quick command examples for common operations.

## Setup

```bash
# Add to ~/.claude-homelab/.env
PAPERLESS_URL="https://paperless.example.com"
PAPERLESS_API_TOKEN="<your_api_token>"
```

## Document Operations

### Upload Documents

```bash
# Simple upload
./scripts/paperless-api.sh upload document.pdf

# With metadata
./scripts/paperless-api.sh upload receipt.pdf \
  --title "Electric Bill - January" \
  --tags "bill,utilities" \
  --correspondent "Power Company"

# Complete metadata
./scripts/paperless-api.sh upload contract.pdf \
  --title "Employment Contract" \
  --correspondent "Acme Corp" \
  --document-type "Contract" \
  --created "2024-01-15"
```

### Search Documents

```bash
# Full-text search
./scripts/paperless-api.sh search "invoice"

# Search with limit
./scripts/paperless-api.sh search "tax" --limit 20

# Search by tag
./scripts/paperless-api.sh search "meeting" --tags "work"

# Search by correspondent
./scripts/paperless-api.sh search --correspondent "Acme Corp"

# Search by date range
./scripts/paperless-api.sh search "report" \
  --created-after "2024-01-01" \
  --created-before "2024-03-31"

# Combine filters
./scripts/paperless-api.sh search "invoice" \
  --correspondent "Vendor" \
  --tags "paid" \
  --limit 50
```

### List Documents

```bash
# List recent documents
./scripts/paperless-api.sh list

# List with custom limit
./scripts/paperless-api.sh list --limit 100

# Sort by creation date (newest first)
./scripts/paperless-api.sh list --ordering "-created"

# Sort by title
./scripts/paperless-api.sh list --ordering "title"

# Paginate results
./scripts/paperless-api.sh list --page 2 --limit 25
```

### Get Document Details

```bash
# Get full document metadata
./scripts/paperless-api.sh get 123

# Pretty print with jq
./scripts/paperless-api.sh get 123 | jq .
```

### Update Documents

```bash
# Update title
./scripts/paperless-api.sh update 123 --title "New Title"

# Add tags
./scripts/paperless-api.sh update 123 --add-tags "urgent,reviewed"

# Remove tags
./scripts/paperless-api.sh update 123 --remove-tags "draft"

# Set correspondent
./scripts/paperless-api.sh update 123 --correspondent "New Correspondent"

# Set document type
./scripts/paperless-api.sh update 123 --document-type "Invoice"

# Set archive serial number
./scripts/paperless-api.sh update 123 --archive-serial-number "2024-001"

# Multiple updates
./scripts/paperless-api.sh update 123 \
  --title "Updated Title" \
  --add-tags "archived" \
  --correspondent "Acme Corp"
```

### Download Documents

```bash
# Download to current directory
./scripts/paperless-api.sh download 123

# Download to specific location
./scripts/paperless-api.sh download 123 --output ~/Documents/document.pdf

# Download multiple documents (loop)
for id in 123 124 125; do
  ./scripts/paperless-api.sh download $id --output ~/backup/doc_${id}.pdf
done
```

### Delete Documents

```bash
# Delete single document (with confirmation)
./scripts/paperless-api.sh delete 123
```

## Tag Management

### List Tags

```bash
# List all tags
./scripts/tag-api.sh list

# Sort alphabetically
./scripts/tag-api.sh list --ordering "name"

# Pretty print
./scripts/tag-api.sh list | jq -r '.results[] | "\(.id): \(.name) (\(.document_count) docs)"'
```

### Create Tags

```bash
# Simple tag
./scripts/tag-api.sh create "project-alpha"

# Tag with color
./scripts/tag-api.sh create "urgent" --color "#ff0000"
./scripts/tag-api.sh create "personal" --color "#00ff00"
./scripts/tag-api.sh create "work" --color "#0000ff"
```

### Get Tag Details

```bash
# Get tag info
./scripts/tag-api.sh get 5

# Show tag with document count
./scripts/tag-api.sh get 5 | jq '{id, name, document_count}'
```

### Update Tags

```bash
# Rename tag
./scripts/tag-api.sh update 5 --name "important"

# Change color
./scripts/tag-api.sh update 5 --color "#ff9900"

# Rename and change color
./scripts/tag-api.sh update 5 \
  --name "critical" \
  --color "#ff0000"
```

### Delete Tags

```bash
# Delete tag (with confirmation)
./scripts/tag-api.sh delete 5
```

## Correspondent Management

### List Correspondents

```bash
# List all
./scripts/correspondent-api.sh list

# Sort alphabetically
./scripts/correspondent-api.sh list --ordering "name"

# Show correspondent with document count
./scripts/correspondent-api.sh list | jq -r '.results[] | "\(.id): \(.name) (\(.document_count) docs)"'
```

### Create Correspondents

```bash
# Create correspondent
./scripts/correspondent-api.sh create "Acme Corporation"
./scripts/correspondent-api.sh create "John Smith"
```

### Get Correspondent Details

```bash
# Get info
./scripts/correspondent-api.sh get 3
```

### Update Correspondents

```bash
# Rename
./scripts/correspondent-api.sh update 3 --name "Acme Corp Inc."
```

### Delete Correspondents

```bash
# Delete (with confirmation)
./scripts/correspondent-api.sh delete 3
```

## Bulk Operations

### Bulk Add Tags

```bash
# Add tag to multiple documents
./scripts/bulk-api.sh add-tag 5 --documents "1,2,3,4,5"

# Add tag to search results (extract IDs first)
ids=$(./scripts/paperless-api.sh search "invoice" | jq -r '.results[].id' | paste -sd,)
./scripts/bulk-api.sh add-tag 8 --documents "$ids"
```

### Bulk Remove Tags

```bash
# Remove tag from documents
./scripts/bulk-api.sh remove-tag 5 --documents "1,2,3"
```

### Bulk Set Correspondent

```bash
# Set correspondent on multiple documents
./scripts/bulk-api.sh set-correspondent 2 --documents "10,11,12"
```

### Bulk Set Document Type

```bash
# Set document type
./scripts/bulk-api.sh set-document-type 3 --documents "15,16,17"
```

### Bulk Delete

```bash
# Delete multiple documents (with confirmation)
./scripts/bulk-api.sh delete --documents "100,101,102"
```

## Common Workflows

### Process Receipt

```bash
# Upload and tag receipt
./scripts/paperless-api.sh upload receipt.jpg \
  --title "Grocery Receipt" \
  --tags "expense,receipt,personal" \
  --correspondent "Grocery Store"
```

### Find and Tag Tax Documents

```bash
# Search for tax documents
./scripts/paperless-api.sh search "tax" --limit 50 | jq .

# Extract IDs and bulk tag
ids=$(./scripts/paperless-api.sh search "tax" | jq -r '.results[].id' | paste -sd,)
./scripts/bulk-api.sh add-tag 15 --documents "$ids"
```

### Organize by Year

```bash
# Create year tags
./scripts/tag-api.sh create "2024" --color "#4a90e2"
./scripts/tag-api.sh create "2023" --color "#7b68ee"

# Tag documents by year
./scripts/paperless-api.sh search --created-after "2024-01-01" | \
  jq -r '.results[].id' | paste -sd, | \
  xargs -I {} ./scripts/bulk-api.sh add-tag 20 --documents {}
```

### Export Documents for Backup

```bash
# Create backup directory
mkdir -p ~/paperless-backup

# Download all documents (careful with large libraries!)
./scripts/paperless-api.sh list --limit 1000 | \
  jq -r '.results[].id' | \
  while read id; do
    ./scripts/paperless-api.sh download $id \
      --output ~/paperless-backup/doc_${id}.pdf
  done
```

### Find Untagged Documents

```bash
# Search documents without tags
./scripts/paperless-api.sh list | \
  jq -r '.results[] | select(.tags | length == 0) | "\(.id): \(.title)"'
```

### Find Documents Without Correspondent

```bash
# List documents missing correspondent
./scripts/paperless-api.sh list | \
  jq -r '.results[] | select(.correspondent == null) | "\(.id): \(.title)"'
```

### Monthly Expense Report

```bash
# Find all expense receipts from January 2024
./scripts/paperless-api.sh search --tags "expense" \
  --created-after "2024-01-01" \
  --created-before "2024-01-31" | \
  jq -r '.results[] | "\(.created) - \(.title)"'
```

### Bulk Organize Invoices

```bash
# Create invoice tag
tag_id=$(./scripts/tag-api.sh create "invoice" --color "#ff6b6b" | jq -r .id)

# Search for invoices
ids=$(./scripts/paperless-api.sh search "invoice" | jq -r '.results[].id' | paste -sd,)

# Bulk tag them
./scripts/bulk-api.sh add-tag $tag_id --documents "$ids"
```

## Advanced jq Filtering

### Extract Specific Fields

```bash
# Show ID and title only
./scripts/paperless-api.sh list | \
  jq -r '.results[] | "\(.id): \(.title)"'

# Show documents with creation date
./scripts/paperless-api.sh list | \
  jq -r '.results[] | "\(.created) | \(.id) | \(.title)"'

# Show document with tags
./scripts/paperless-api.sh get 123 | \
  jq '{id, title, tags, correspondent}'
```

### Filter Results

```bash
# Find documents with specific tag ID
./scripts/paperless-api.sh list | \
  jq '.results[] | select(.tags | contains([5]))'

# Find documents from last 30 days
./scripts/paperless-api.sh list | \
  jq --arg date "$(date -d '30 days ago' +%Y-%m-%d)" \
  '.results[] | select(.created > $date)'

# Count documents by correspondent
./scripts/paperless-api.sh list --limit 1000 | \
  jq -r '.results[].correspondent' | sort | uniq -c | sort -rn
```

### Generate Reports

```bash
# Tag usage report
./scripts/tag-api.sh list | \
  jq -r '.results[] | "\(.document_count)\t\(.name)"' | \
  sort -rn

# Correspondent document count
./scripts/correspondent-api.sh list | \
  jq -r '.results[] | "\(.document_count)\t\(.name)"' | \
  sort -rn

# Documents added per month
./scripts/paperless-api.sh list --limit 1000 | \
  jq -r '.results[].added' | \
  cut -d'T' -f1 | cut -d'-' -f1,2 | \
  sort | uniq -c
```

## Troubleshooting Commands

### Test Connection

```bash
# Simple API test
curl -H "Authorization: Token ${PAPERLESS_API_TOKEN}" \
  "${PAPERLESS_URL}/api/documents/" | jq .
```

### Check Document Processing Status

```bash
# View task queue (if exposed in your Paperless-ngx version)
curl -H "Authorization: Token ${PAPERLESS_API_TOKEN}" \
  "${PAPERLESS_URL}/api/tasks/" | jq .
```

### Verify Tag Exists

```bash
# Check if tag name exists
./scripts/tag-api.sh list | jq -r '.results[] | select(.name == "urgent")'
```

### Get Document Count

```bash
# Total documents
./scripts/paperless-api.sh list --limit 1 | jq -r .count
```

## Environment Variables

Set these in `~/.claude-homelab/.env`:

```bash
# Required
PAPERLESS_URL="https://paperless.example.com"
PAPERLESS_API_TOKEN="<your_api_token>"
```

## Useful Aliases

Add to your shell config (`.bashrc` or `.zshrc`):

```bash
# Paperless shortcuts
alias pls='cd ~/claude-homelab/skills/paperless-ngx && ./scripts/paperless-api.sh'
alias ptag='cd ~/claude-homelab/skills/paperless-ngx && ./scripts/tag-api.sh'
alias pcorr='cd ~/claude-homelab/skills/paperless-ngx && ./scripts/correspondent-api.sh'
alias pbulk='cd ~/claude-homelab/skills/paperless-ngx && ./scripts/bulk-api.sh'

# Quick search
psearch() { pls search "$@" | jq -r '.results[] | "\(.id): \(.title)"'; }

# Quick download
pget() { pls download "$1" --output ~/Downloads/paperless_doc_${1}.pdf; }
```

Usage:
```bash
pls list
ptag list
psearch "invoice"
pget 123
```
