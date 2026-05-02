# Paperless-ngx Skill

Manage documents in your self-hosted Paperless-ngx document management system with OCR, full-text search, and powerful organization features.

## What It Does

This skill provides complete document management capabilities for Paperless-ngx:

- **Upload Documents** - Add PDFs, images, and other documents with auto-OCR
- **Search Documents** - Full-text search across all document content
- **Organize Documents** - Tag, categorize, and set correspondents
- **Update Metadata** - Change titles, tags, dates, and document types
- **Bulk Operations** - Tag, delete, or modify multiple documents at once
- **Export Documents** - Download original or archived versions
- **Manage Tags** - Create, update, and organize tags
- **Manage Correspondents** - Track people and organizations
- **Delete Documents** - Remove documents with confirmation prompts

All operations work with your self-hosted Paperless-ngx instance via the REST API.

## Setup

### 1. Prerequisites

- Paperless-ngx instance running and accessible
- API token from Paperless-ngx
- `curl` and `jq` installed on your system

### 2. Get Your API Token

1. Open your Paperless-ngx web interface
2. Click your username in the top-right corner
3. Select "My Profile"
4. Scroll to "API Tokens" section
5. Click "Create Token"
6. Copy the generated token (you won't see it again!)

### 3. Add Credentials to .env

Edit `~/.claude-homelab/.env` and add:

```bash
# Paperless-ngx - Document management system
PAPERLESS_URL="https://paperless.example.com"
PAPERLESS_API_TOKEN="<your_api_token>"
```

**Important:**
- Remove any trailing slashes from the URL
- Use the full URL including `https://`
- The token is a long alphanumeric string

### 4. Secure Your Credentials

```bash
chmod 600 ~/.claude-homelab/.env
```

This ensures only you can read the credentials file.

## Usage Examples

### Upload Documents

**Simple upload:**
```bash
cd skills/paperless-ngx
./scripts/paperless-api.sh upload ~/Documents/receipt.pdf
```

**Upload with metadata:**
```bash
./scripts/paperless-api.sh upload scan.jpg \
  --title "Electric Bill - January 2024" \
  --tags "bill,utilities" \
  --correspondent "Power Company"
```

**Upload with document type:**
```bash
./scripts/paperless-api.sh upload contract.pdf \
  --title "Employment Contract" \
  --document-type "Contract" \
  --correspondent "Acme Corp"
```

### Search Documents

**Simple search:**
```bash
./scripts/paperless-api.sh search "invoice"
```

**Search with filters:**
```bash
# Find tax documents from 2024
./scripts/paperless-api.sh search "tax" --tags "2024"

# Find documents from specific correspondent
./scripts/paperless-api.sh search --correspondent "Acme Corp"

# Find recent invoices
./scripts/paperless-api.sh search "invoice" --limit 10
```

**List all documents:**
```bash
# Most recent first
./scripts/paperless-api.sh list --ordering "-created"

# Oldest first
./scripts/paperless-api.sh list --ordering "created"
```

### Update Documents

**Change title:**
```bash
./scripts/paperless-api.sh update 123 --title "New Title"
```

**Add tags:**
```bash
./scripts/paperless-api.sh update 123 --add-tags "urgent,reviewed"
```

**Set correspondent:**
```bash
./scripts/paperless-api.sh update 123 --correspondent "Jane Smith"
```

**Multiple changes:**
```bash
./scripts/paperless-api.sh update 123 \
  --title "Updated Title" \
  --add-tags "archived" \
  --document-type "Invoice"
```

### Manage Tags

**List all tags:**
```bash
./scripts/tag-api.sh list
```

**Create new tag:**
```bash
./scripts/tag-api.sh create "project-alpha"

# With color
./scripts/tag-api.sh create "urgent" --color "#ff0000"
```

**Update tag:**
```bash
./scripts/tag-api.sh update 5 --name "important"
./scripts/tag-api.sh update 5 --color "#00ff00"
```

### Manage Correspondents

**List correspondents:**
```bash
./scripts/correspondent-api.sh list
```

**Add correspondent:**
```bash
./scripts/correspondent-api.sh create "Acme Corporation"
```

**Update correspondent:**
```bash
./scripts/correspondent-api.sh update 3 --name "Acme Corp Inc."
```

### Download Documents

**Download by ID:**
```bash
./scripts/paperless-api.sh download 123
```

**Save to specific location:**
```bash
./scripts/paperless-api.sh download 123 --output ~/Downloads/document.pdf
```

### Bulk Operations

**Add tag to multiple documents:**
```bash
./scripts/bulk-api.sh add-tag 5 --documents "1,2,3,4,5"
```

**Remove tag from documents:**
```bash
./scripts/bulk-api.sh remove-tag 5 --documents "1,2,3"
```

**Set correspondent on multiple documents:**
```bash
./scripts/bulk-api.sh set-correspondent 2 --documents "10,11,12"
```

### Delete Documents

**Delete single document (with confirmation):**
```bash
./scripts/paperless-api.sh delete 123
```

**Bulk delete (with confirmation):**
```bash
./scripts/bulk-api.sh delete --documents "1,2,3"
```

## Workflow

### Common Scenario: Processing Receipts

1. **Scan receipt** to your computer
2. **Upload to Paperless:**
   ```bash
   ./scripts/paperless-api.sh upload receipt.jpg \
     --tags "expense,receipt" \
     --correspondent "Store Name"
   ```
3. Paperless automatically:
   - Performs OCR on the image
   - Extracts text and metadata
   - Makes it searchable
   - Generates thumbnail

### Common Scenario: Finding Old Documents

1. **Search for documents:**
   ```bash
   ./scripts/paperless-api.sh search "insurance policy"
   ```
2. **Get details of specific document:**
   ```bash
   ./scripts/paperless-api.sh get 45
   ```
3. **Download if needed:**
   ```bash
   ./scripts/paperless-api.sh download 45 --output ~/insurance-policy.pdf
   ```

### Common Scenario: Organizing Documents

1. **Create tags for organization:**
   ```bash
   ./scripts/tag-api.sh create "2024-tax"
   ./scripts/tag-api.sh create "personal"
   ./scripts/tag-api.sh create "important"
   ```
2. **Search for documents to organize:**
   ```bash
   ./scripts/paperless-api.sh search "tax" --limit 50
   ```
3. **Bulk tag relevant documents:**
   ```bash
   ./scripts/bulk-api.sh add-tag 8 --documents "12,15,18,22,29"
   ```

## Troubleshooting

### Error: "401 Unauthorized"

**Problem:** API token is invalid or expired.

**Solution:**
1. Log into Paperless-ngx web interface
2. Go to My Profile → API Tokens
3. Delete old token and create new one
4. Update `PAPERLESS_API_TOKEN` in `.env` file

### Error: "Connection refused"

**Problem:** Cannot connect to Paperless-ngx server.

**Solution:**
1. Verify Paperless-ngx is running
2. Check `PAPERLESS_URL` in `.env` is correct
3. Test connectivity: `curl -I https://paperless.example.com`
4. Check firewall/network settings

### Error: "404 Not Found"

**Problem:** Document, tag, or correspondent doesn't exist.

**Solution:**
1. Verify the ID is correct
2. List all items to find correct ID
3. Document may have been deleted

### Error: "No file uploaded"

**Problem:** File path doesn't exist or isn't readable.

**Solution:**
1. Verify file path is correct
2. Check file permissions: `ls -la /path/to/file`
3. Use absolute paths or relative paths from skill directory

### Search Returns No Results

**Problem:** Documents haven't been indexed or search syntax is incorrect.

**Solution:**
1. Wait a few moments after upload for indexing
2. Try simpler search terms
3. Check if document actually exists with `list`
4. Verify tags/correspondents are spelled correctly

### Upload Succeeds but Document Not Visible

**Problem:** Document is still being processed by Paperless-ngx.

**Solution:**
1. Wait 10-30 seconds for processing to complete
2. Check Paperless-ngx web interface for processing status
3. Large documents or high-quality scans take longer
4. Check logs if document never appears

## Notes

### Document Processing

When you upload a document, Paperless-ngx:
1. Accepts the file and returns immediately
2. Queues document for processing
3. Performs OCR if needed (may take 10-30 seconds)
4. Extracts metadata (date, correspondent suggestions)
5. Generates thumbnail
6. Indexes content for search

### Search Capabilities

Paperless-ngx search supports:
- **Full-text search** - Searches OCR'd content
- **Tag filtering** - Multiple tags (AND/OR logic)
- **Date ranges** - Find documents by date
- **Correspondent filtering** - Documents from/to specific person
- **Document type filtering** - Filter by category
- **Combining filters** - Use multiple filters together

### Organization Tips

1. **Use consistent tag naming:**
   - Lowercase with hyphens: `tax-2024`, `project-alpha`
   - Avoid spaces and special characters
   - Be consistent with naming conventions

2. **Set correspondents for all documents:**
   - Makes searching by sender/recipient easier
   - Helps with automatic suggestions for new documents

3. **Use document types for categories:**
   - Invoice, Contract, Receipt, Letter, etc.
   - Create custom types as needed

4. **Archive serial numbers:**
   - If you keep paper documents, use archive serial numbers
   - Helps locate physical copy when needed

5. **Regular tagging:**
   - Tag documents as you upload them
   - Batch-tag similar documents periodically

### Bulk Operations

Bulk operations are efficient for:
- Tagging multiple related documents
- Changing correspondent on batch of documents
- Cleaning up old documents
- Organizing large imports

**Tip:** Always do a search first to verify which documents will be affected, then extract IDs for bulk operation.

### Security

- API tokens have same permissions as your user account
- Never share your API token
- Rotate tokens periodically (delete old, create new)
- `.env` file is gitignored - never commit it
- Set restrictive permissions: `chmod 600 ~/.claude-homelab/.env`

### Performance

- Uploads are asynchronous (returns immediately)
- Large files or high-quality scans take longer to process
- Search is fast after initial indexing
- Bulk operations process in background

## Reference

- **Official Documentation:** https://docs.paperless-ngx.com/
- **API Documentation:** https://docs.paperless-ngx.com/api/
- **GitHub Repository:** https://github.com/paperless-ngx/paperless-ngx
- **Demo Instance:** https://demo.paperless-ngx.com/
- **Community Support:** https://github.com/paperless-ngx/paperless-ngx/discussions
