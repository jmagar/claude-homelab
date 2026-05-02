# Paperless-ngx Troubleshooting Guide

Common issues and solutions when using the Paperless-ngx skill.

## Authentication Errors

### Error: 401 Unauthorized

**Symptoms:**
```json
{
  "detail": "Authentication credentials were not provided."
}
```

**Causes:**
1. API token is missing or invalid
2. Token has been revoked
3. Token has expired
4. Wrong token format in `.env`

**Solutions:**

**1. Verify token exists in .env:**
```bash
grep PAPERLESS_API_TOKEN ~/.claude-homelab/.env
```

**2. Test token manually:**
```bash
curl -H "Authorization: Token ${PAPERLESS_API_TOKEN}" \
  "${PAPERLESS_URL}/api/documents/" | jq .
```

**3. Regenerate token:**
1. Log into Paperless-ngx web UI
2. Go to Settings → My Profile
3. Under "API Tokens", delete old token
4. Click "Create Token"
5. Copy new token
6. Update `PAPERLESS_API_TOKEN` in `.env`

**4. Check token format:**
```bash
# Correct format (no quotes in .env needed)
PAPERLESS_API_TOKEN=abc123def456

# Also correct (with quotes)
PAPERLESS_API_TOKEN="abc123def456"

# Wrong - no spaces around =
PAPERLESS_API_TOKEN = abc123
```

### Error: Invalid token

**Symptoms:**
```json
{
  "detail": "Invalid token."
}
```

**Solutions:**
1. Token contains extra spaces or newlines
2. Copy token again (single line, no spaces)
3. Verify no quotes inside the token value

## Connection Errors

### Error: Connection refused

**Symptoms:**
```bash
curl: (7) Failed to connect to paperless.example.com port 443: Connection refused
```

**Causes:**
1. Paperless-ngx is not running
2. Wrong URL in `.env`
3. Firewall blocking connection
4. DNS resolution issue

**Solutions:**

**1. Verify Paperless-ngx is running:**
```bash
# Check if service is up
curl -I https://paperless.example.com

# Check container status (if using Docker)
docker ps | grep paperless
```

**2. Check URL in .env:**
```bash
# View current URL
grep PAPERLESS_URL ~/.claude-homelab/.env

# Correct format (no trailing slash)
PAPERLESS_URL="https://paperless.example.com"

# Wrong formats
PAPERLESS_URL="https://paperless.example.com/"  # trailing slash
PAPERLESS_URL="paperless.example.com"           # missing https://
```

**3. Test connectivity:**
```bash
# Ping server
ping paperless.example.com

# Test HTTPS
curl -v https://paperless.example.com
```

**4. Check firewall:**
```bash
# Check local firewall
sudo ufw status

# Test from different network
curl -I https://paperless.example.com
```

### Error: SSL certificate problem

**Symptoms:**
```bash
curl: (60) SSL certificate problem: unable to get local issuer certificate
```

**Causes:**
1. Self-signed certificate
2. Expired certificate
3. Certificate not trusted

**Solutions:**

**1. For self-signed certificates (dev only):**
```bash
# Add -k flag to curl (INSECURE - dev only!)
# Edit script to add: curl -k ...
```

**2. Install certificate:**
```bash
# Ubuntu/Debian
sudo cp cert.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
```

**3. Use HTTP (if available and on local network):**
```bash
PAPERLESS_URL="http://paperless.local:8000"
```

## Upload Errors

### Error: No file uploaded

**Symptoms:**
```json
{
  "error": "No file uploaded"
}
```

**Causes:**
1. File path is wrong
2. File doesn't exist
3. No read permissions
4. File path has spaces (not quoted)

**Solutions:**

**1. Verify file exists:**
```bash
ls -la /path/to/document.pdf
```

**2. Check permissions:**
```bash
# File should be readable
chmod 644 document.pdf
```

**3. Use absolute paths:**
```bash
# Good
./scripts/paperless-api.sh upload /home/user/documents/file.pdf

# Also good (relative to current directory)
./scripts/paperless-api.sh upload ./file.pdf

# Bad (relative path may not work)
./scripts/paperless-api.sh upload ../file.pdf
```

**4. Quote paths with spaces:**
```bash
./scripts/paperless-api.sh upload "/path/with spaces/document.pdf"
```

### Error: File too large

**Symptoms:**
```json
{
  "error": "File size exceeds maximum allowed"
}
```

**Solutions:**
1. Check Paperless-ngx max upload size settings
2. Compress PDF before uploading
3. Split large documents into smaller files
4. Increase max upload size in Paperless-ngx config

**Compress PDF:**
```bash
# Using ghostscript
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
   -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH \
   -sOutputFile=compressed.pdf input.pdf
```

### Error: Unsupported file type

**Symptoms:**
```json
{
  "error": "File type not supported"
}
```

**Supported file types:**
- PDF (`.pdf`)
- Images: JPG, PNG, TIFF, WebP
- Office: DOCX, ODT (if configured)
- Text: TXT, MD (if configured)

**Solutions:**
1. Convert to supported format (preferably PDF)
2. Enable additional file type support in Paperless-ngx

**Convert to PDF:**
```bash
# Image to PDF
convert image.jpg output.pdf

# Multiple images to single PDF
convert *.jpg output.pdf

# Office to PDF (requires LibreOffice)
libreoffice --headless --convert-to pdf document.docx
```

## Search Errors

### Error: No results found (but documents exist)

**Causes:**
1. Documents not yet indexed
2. Search syntax incorrect
3. Case-sensitive search
4. Wrong field filter

**Solutions:**

**1. Wait for indexing:**
```bash
# Check if document is still processing
# Documents appear in list immediately but aren't searchable until OCR completes
./scripts/paperless-api.sh list --limit 10
```

**2. Try different search syntax:**
```bash
# Simple search (works best)
./scripts/paperless-api.sh search "invoice"

# Quoted exact phrase
./scripts/paperless-api.sh search "electric bill"

# Multiple terms
./scripts/paperless-api.sh search "invoice 2024"
```

**3. Search by ID instead:**
```bash
# If you know the document exists, get it directly
./scripts/paperless-api.sh get 123
```

**4. List documents with filters:**
```bash
# Instead of full-text search, use filters
./scripts/paperless-api.sh list --ordering "-created" --limit 50
```

### Error: Query syntax error

**Symptoms:**
```json
{
  "error": "Invalid query syntax"
}
```

**Common mistakes:**
- Using unsupported operators
- Unbalanced quotes
- Special characters not escaped

**Solutions:**
```bash
# Good queries
./scripts/paperless-api.sh search "simple term"
./scripts/paperless-api.sh search "invoice"
./scripts/paperless-api.sh search "meeting notes"

# Avoid complex boolean syntax unless needed
# Paperless search is generally smart enough without AND/OR
```

## Update/Delete Errors

### Error: 404 Not Found

**Symptoms:**
```json
{
  "detail": "Not found."
}
```

**Causes:**
1. Document/tag/correspondent doesn't exist
2. Wrong ID
3. Document was already deleted

**Solutions:**

**1. Verify ID exists:**
```bash
# Check if document exists
./scripts/paperless-api.sh get 123

# List all documents to find correct ID
./scripts/paperless-api.sh list | jq -r '.results[] | "\(.id): \(.title)"'
```

**2. Search for document:**
```bash
# Find by title
./scripts/paperless-api.sh search "title text" | jq .
```

### Error: Cannot delete (in use)

**Symptoms:**
```json
{
  "error": "Cannot delete: tag is in use"
}
```

**Cause:**
- Trying to delete tag/correspondent that's assigned to documents

**This is normal behavior** - Paperless-ngx removes the association when you delete:
- Deleting a tag removes it from all documents
- Deleting a correspondent removes it from all documents
- The documents themselves are not deleted

**If delete fails:**
1. Confirm you want to remove from all documents
2. Type `yes` when prompted
3. Check permissions (may need to be owner)

### Error: Permission denied

**Symptoms:**
```json
{
  "detail": "You do not have permission to perform this action."
}
```

**Causes:**
1. API token doesn't have sufficient permissions
2. Trying to modify another user's document
3. Ownership/permissions feature enabled

**Solutions:**
1. Check API token permissions in web UI
2. Use admin account token
3. Check document owner and permissions

## Bulk Operation Errors

### Error: Invalid document list

**Symptoms:**
```json
{
  "error": "Invalid document list format"
}
```

**Cause:**
- Document IDs not formatted correctly

**Solution:**
```bash
# Correct format (comma-separated, no spaces)
./scripts/bulk-api.sh add-tag 5 --documents "1,2,3"

# Wrong formats
./scripts/bulk-api.sh add-tag 5 --documents "1, 2, 3"  # spaces
./scripts/bulk-api.sh add-tag 5 --documents "1 2 3"    # no commas
```

### Error: Some operations failed

**Symptoms:**
```json
{
  "partial_success": true,
  "failed": [123, 456]
}
```

**Cause:**
- Some document IDs don't exist
- Permission issues on some documents

**Solution:**
1. Check which IDs failed
2. Verify those documents exist
3. Retry with only valid IDs

## OCR and Processing Errors

### Document uploaded but no content

**Causes:**
1. OCR still processing (wait 30-60 seconds)
2. OCR failed (check logs)
3. Document is already text-based but wasn't recognized

**Solutions:**

**1. Wait for processing:**
```bash
# Check document content after waiting
sleep 30
./scripts/paperless-api.sh get 123 | jq -r .content
```

**2. Check task status (if API exposes it):**
```bash
# Some installations expose task queue
curl -H "Authorization: Token ${PAPERLESS_API_TOKEN}" \
  "${PAPERLESS_URL}/api/tasks/" | jq .
```

**3. Manually trigger reprocessing:**
```bash
# Use bulk reprocess operation
./scripts/bulk-api.sh reprocess --documents "123"
```

### Poor OCR quality

**Causes:**
1. Low resolution scan
2. Skewed/rotated document
3. Poor lighting/contrast
4. Handwriting (OCR doesn't handle well)

**Solutions:**
1. Re-scan at higher DPI (300+ recommended)
2. Ensure document is straight
3. Pre-process image before upload:

```bash
# Improve contrast
convert input.jpg -normalize -contrast output.jpg

# Deskew
convert input.jpg -deskew 40% output.jpg

# Combined
convert input.jpg -normalize -contrast -deskew 40% output.jpg
```

## Script Errors

### Error: jq not found

**Solution:**
```bash
# Ubuntu/Debian
sudo apt-get install jq

# macOS
brew install jq

# Verify installation
jq --version
```

### Error: curl not found

**Solution:**
```bash
# Ubuntu/Debian
sudo apt-get install curl

# macOS (usually pre-installed)
brew install curl

# Verify
curl --version
```

### Error: Environment file not found

**Symptoms:**
```json
{
  "error": "Environment file not found",
  "path": "/home/user/.claude-homelab/.env"
}
```

**Solutions:**

**1. Create .env file:**
```bash
# Create file
touch ~/.claude-homelab/.env

# Add credentials
cat >> ~/.claude-homelab/.env <<EOF
PAPERLESS_URL="https://paperless.example.com"
PAPERLESS_API_TOKEN="<your_api_token>"
EOF

# Set permissions
chmod 600 ~/.claude-homelab/.env
```

**2. Verify path:**
```bash
# Check file exists
ls -la ~/.claude-homelab/.env

# View contents (be careful - contains secrets!)
cat ~/.claude-homelab/.env
```

## Performance Issues

### Slow search results

**Causes:**
1. Large document library (thousands of documents)
2. Complex search query
3. Database needs optimization

**Solutions:**
1. Use pagination with smaller page sizes
2. Add more specific filters
3. Use field-specific searches instead of full-text

```bash
# Instead of full-text search
./scripts/paperless-api.sh search "invoice" --limit 10

# Use correspondent filter
./scripts/paperless-api.sh search --correspondent "Acme"
```

### Slow uploads

**Causes:**
1. Large files
2. Network latency
3. Server load

**Solutions:**
1. Compress files before upload
2. Upload during off-peak hours
3. Use batch upload with delays

```bash
# Upload multiple files with delay
for file in *.pdf; do
  ./scripts/paperless-api.sh upload "$file"
  sleep 5  # Wait 5 seconds between uploads
done
```

## Getting Help

### Enable debug output

```bash
# Add -v to curl calls to see full HTTP exchange
# Edit scripts temporarily and add -v to curl command

# Check Paperless-ngx logs
docker logs paperless  # if using Docker
```

### Test API directly

```bash
# Bypass script and test API directly
curl -v -H "Authorization: Token ${PAPERLESS_API_TOKEN}" \
  "${PAPERLESS_URL}/api/documents/" | jq .
```

### Check Paperless-ngx version

```bash
curl -I -H "Authorization: Token ${PAPERLESS_API_TOKEN}" \
  "${PAPERLESS_URL}/api/documents/" | grep X-Version
```

### Community Support

- **GitHub Issues:** https://github.com/paperless-ngx/paperless-ngx/issues
- **Discussions:** https://github.com/paperless-ngx/paperless-ngx/discussions
- **Documentation:** https://docs.paperless-ngx.com/

### Useful Log Commands

```bash
# Docker logs (if using Docker)
docker logs paperless --tail 100

# Follow logs in real-time
docker logs paperless -f

# Filter logs for errors
docker logs paperless 2>&1 | grep -i error
```
