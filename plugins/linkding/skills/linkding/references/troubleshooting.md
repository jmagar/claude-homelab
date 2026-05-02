# Linkding Troubleshooting Guide

Common issues and solutions when working with the Linkding API.

## Authentication Issues

### Problem: 401 Unauthorized

**Symptoms:**
```json
{
  "detail": "Authentication credentials were not provided."
}
```

**Solutions:**

1. **Check token format:**
   ```bash
   # Correct format
   curl -H "Authorization: Token <your_api_token>" "$LINKDING_URL/api/bookmarks/"

   # Wrong - missing "Token" keyword
   curl -H "Authorization: <your_api_token>" "$LINKDING_URL/api/bookmarks/"

   # Wrong - using "Bearer" instead of "Token"
   curl -H "Authorization: Bearer <your_api_token>" "$LINKDING_URL/api/bookmarks/"
   ```

2. **Verify token is valid:**
   ```bash
   # Test with user profile endpoint
   curl -s "$LINKDING_URL/api/user/profile/" \
     -H "Authorization: Token $LINKDING_API_KEY" | jq
   ```

3. **Generate new token:**
   - Log into Linkding web UI
   - Go to Settings → Integrations
   - Generate new API token
   - Update your `.env` or config file

4. **Check environment variables:**
   ```bash
   # Load from .env
   source ~/.claude-homelab/.env

   echo "URL: $LINKDING_URL"
   echo "API Key set: $([ -n "$LINKDING_API_KEY" ] && echo "Yes" || echo "No")"
   ```

### Problem: Token Expired or Revoked

**Symptoms:**
- Previously working token now returns 401
- Token was deleted from Linkding settings

**Solution:**
Generate a new token from Linkding Settings → Integrations and update configuration.

---

## URL Validation Errors

### Problem: 400 Bad Request - Invalid URL

**Symptoms:**
```json
{
  "url": ["Enter a valid URL."]
}
```

**Solutions:**

1. **Ensure proper URL format:**
   ```bash
   # Correct
   curl -X POST "$LINKDING_URL/api/bookmarks/" \
     -H "Authorization: Token $LINKDING_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{"url": "https://example.com"}'

   # Wrong - missing protocol
   curl -X POST "$LINKDING_URL/api/bookmarks/" \
     -H "Authorization: Token $LINKDING_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{"url": "example.com"}'  # Add https:// or http://
   ```

2. **Check for special characters:**
   ```bash
   # URLs with special characters must be properly formatted
   URL="https://example.com/page?param=value&other=123"

   # Use jq to properly escape
   jq -n --arg url "$URL" '{url: $url}'
   ```

3. **Validate URL before submitting:**
   ```bash
   # Quick validation
   if [[ "$URL" =~ ^https?:// ]]; then
     echo "Valid URL format"
   else
     echo "Invalid - add http:// or https://"
   fi
   ```

### Problem: URL Too Long

**Symptoms:**
```json
{
  "url": ["Ensure this field has no more than 2048 characters."]
}
```

**Solution:**
Use a URL shortener or trim query parameters before saving. Linkding has a 2048 character limit for URLs.

---

## Duplicate Bookmark Handling

### Problem: Creating Duplicate Bookmarks

**Symptoms:**
- Same URL bookmarked multiple times
- No error returned when creating duplicate

**Solutions:**

1. **Always check before creating:**
   ```bash
   # Check if URL exists first
   EXISTING=$(curl -s -X POST "$LINKDING_URL/api/bookmarks/check/" \
     -H "Authorization: Token $LINKDING_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{"url": "https://example.com"}' | jq -r '.bookmark.id // empty')

   if [ -n "$EXISTING" ]; then
     echo "Already exists: ID $EXISTING"
     # Update existing bookmark instead
     curl -X PATCH "$LINKDING_URL/api/bookmarks/$EXISTING/" \
       -H "Authorization: Token $LINKDING_API_KEY" \
       -H "Content-Type: application/json" \
       -d '{"description": "Updated description"}'
   else
     # Create new bookmark
     curl -X POST "$LINKDING_URL/api/bookmarks/" \
       -H "Authorization: Token $LINKDING_API_KEY" \
       -H "Content-Type: application/json" \
       -d '{"url": "https://example.com"}'
   fi
   ```

2. **Find and remove duplicates:**
   ```bash
   # Find duplicate URLs
   curl -s "$LINKDING_URL/api/bookmarks/?limit=1000" \
     -H "Authorization: Token $LINKDING_API_KEY" | \
     jq -r '.results | group_by(.url) | .[] | select(length > 1) | {url: .[0].url, ids: [.[].id]}'
   ```

3. **Merge duplicate bookmarks:**
   ```bash
   # Keep oldest, delete newer duplicates
   curl -s "$LINKDING_URL/api/bookmarks/?limit=1000" \
     -H "Authorization: Token $LINKDING_API_KEY" | \
     jq -r '.results | group_by(.url) | .[] | select(length > 1) | .[1:] | .[].id' | \
     while read id; do
       echo "Deleting duplicate ID: $id"
       curl -X DELETE "$LINKDING_URL/api/bookmarks/$id/" \
         -H "Authorization: Token $LINKDING_API_KEY"
     done
   ```

---

## Tag Management Issues

### Problem: Tag Not Found Error

**Symptoms:**
```json
{
  "tag_names": ["Tag 'nonexistent' does not exist."]
}
```

**Note:** This is actually NOT an error in Linkding. Tags are automatically created when used in bookmarks.

**If you see this error:**
- Check API version - older versions may behave differently
- Verify tag name format (lowercase, no spaces for safety)

**Solution - Auto-create pattern:**
```bash
# Tags are created automatically when adding bookmarks
curl -X POST "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "url": "https://example.com",
    "tag_names": ["new-tag", "another-new-tag"]
  }'
```

### Problem: Tag Name Validation

**Best practices for tag names:**
```bash
# Good tag names (recommended)
"tag_names": ["python", "tutorial", "web-dev"]

# Problematic (but may work)
"tag_names": ["Python Tutorial", "web dev"]  # Spaces may cause issues

# Clean tag names before using
TAG_NAME=$(echo "Python Tutorial" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
# Result: "python-tutorial"
```

### Problem: Replacing All Tags Unintentionally

**Symptoms:**
- PATCH request replaces all existing tags instead of adding

**Understanding:**
```bash
# This REPLACES all tags (not append)
curl -X PATCH "$LINKDING_URL/api/bookmarks/123/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"tag_names": ["new-tag"]}'
# Old tags are lost!
```

**Solution - Append tags:**
```bash
# 1. Get current tags
CURRENT=$(curl -s "$LINKDING_URL/api/bookmarks/123/" \
  -H "Authorization: Token $LINKDING_API_KEY" | jq -r '.tag_names | join(",")')

# 2. Append new tag
NEW_TAGS="$CURRENT,additional-tag"

# 3. Update with combined tags
curl -X PATCH "$LINKDING_URL/api/bookmarks/123/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d "{\"tag_names\": [\"${NEW_TAGS//,/\",\"}\"]}"
```

---

## Pagination Issues

### Problem: Missing Results Beyond Page 1

**Symptoms:**
- Only seeing first 100 results
- `next` field in response is not null but not being followed

**Solution:**

1. **Manual pagination:**
   ```bash
   # Get all bookmarks with pagination
   OFFSET=0
   LIMIT=100
   ALL_RESULTS="[]"

   while true; do
     PAGE=$(curl -s "$LINKDING_URL/api/bookmarks/?limit=$LIMIT&offset=$OFFSET" \
       -H "Authorization: Token $LINKDING_API_KEY")

     RESULTS=$(echo "$PAGE" | jq '.results')
     COUNT=$(echo "$RESULTS" | jq 'length')

     if [ "$COUNT" -eq 0 ]; then
       break
     fi

     ALL_RESULTS=$(echo "$ALL_RESULTS" | jq --argjson new "$RESULTS" '. + $new')
     OFFSET=$((OFFSET + LIMIT))
   done

   echo "$ALL_RESULTS" | jq
   ```

2. **Follow next URLs:**
   ```bash
   # Follow next URL from response
   URL="$LINKDING_URL/api/bookmarks/"

   while [ -n "$URL" ] && [ "$URL" != "null" ]; do
     RESPONSE=$(curl -s "$URL" -H "Authorization: Token $LINKDING_API_KEY")
     echo "$RESPONSE" | jq '.results[]'
     URL=$(echo "$RESPONSE" | jq -r '.next // empty')
   done
   ```

### Problem: Inconsistent Results Across Pages

**Symptoms:**
- Results change between pagination requests
- Missing or duplicate entries

**Cause:**
New bookmarks added during pagination.

**Solution:**
Use a larger `limit` value to reduce number of requests:
```bash
# Get 100 results per page (max)
curl -s "$LINKDING_URL/api/bookmarks/?limit=100" \
  -H "Authorization: Token $LINKDING_API_KEY"
```

---

## Import/Export Problems

### Problem: Bulk Import Failures

**Symptoms:**
- Script fails midway through import
- Some bookmarks not created

**Solution:**

1. **Add error handling:**
   ```bash
   while IFS=',' read -r url title tags; do
     RESPONSE=$(curl -s -w "\n%{http_code}" -X POST "$LINKDING_URL/api/bookmarks/" \
       -H "Authorization: Token $LINKDING_API_KEY" \
       -H "Content-Type: application/json" \
       -d "{\"url\": \"$url\", \"title\": \"$title\", \"tag_names\": [\"$tags\"]}")

     HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
     BODY=$(echo "$RESPONSE" | head -n-1)

     if [ "$HTTP_CODE" -ge 400 ]; then
       echo "Failed to import $url: $BODY" >> import_errors.log
     else
       echo "Imported: $url"
     fi

     sleep 0.5  # Rate limiting
   done < bookmarks.csv
   ```

2. **Check for duplicates first:**
   ```bash
   # Skip if already exists
   EXISTS=$(curl -s -X POST "$LINKDING_URL/api/bookmarks/check/" \
     -H "Authorization: Token $LINKDING_API_KEY" \
     -H "Content-Type: application/json" \
     -d "{\"url\": \"$url\"}" | jq -r '.bookmark.id // empty')

   if [ -z "$EXISTS" ]; then
     # Create bookmark
   else
     echo "Skipping duplicate: $url"
   fi
   ```

### Problem: Export Incomplete Data

**Symptoms:**
- Missing fields in export
- Truncated descriptions

**Solution:**

```bash
# Export with all fields
curl -s "$LINKDING_URL/api/bookmarks/?limit=100" \
  -H "Authorization: Token $LINKDING_API_KEY" | \
  jq -r '.results[] | {
    id,
    url,
    title,
    description,
    notes,
    website_title,
    website_description,
    tag_names,
    date_added,
    date_modified,
    archived,
    unread,
    shared
  }'
```

---

## Rate Limiting & Performance

### Problem: Slow API Responses

**Symptoms:**
- Requests take several seconds
- Timeouts on large datasets

**Solutions:**

1. **Use pagination with smaller limits:**
   ```bash
   # Instead of getting 1000 at once
   curl "$LINKDING_URL/api/bookmarks/?limit=50" ...
   ```

2. **Add connection timeouts:**
   ```bash
   curl --connect-timeout 10 --max-time 30 \
     "$LINKDING_URL/api/bookmarks/" \
     -H "Authorization: Token $LINKDING_API_KEY"
   ```

3. **Check Linkding server resources:**
   ```bash
   # If self-hosted, check Docker logs
   docker logs linkding
   ```

### Problem: Too Many Requests Error

**Symptoms:**
```json
{
  "detail": "Request was throttled. Expected available in X seconds."
}
```

**Solution:**
Add delays between requests:
```bash
# Add 500ms delay between requests
while read id; do
  curl -X DELETE "$LINKDING_URL/api/bookmarks/$id/" \
    -H "Authorization: Token $LINKDING_API_KEY"
  sleep 0.5
done
```

---

## JSON Formatting Issues

### Problem: Invalid JSON in Request Body

**Symptoms:**
```json
{
  "detail": "JSON parse error"
}
```

**Solutions:**

1. **Use jq to build JSON safely:**
   ```bash
   # Safe - handles special characters and escaping
   jq -n \
     --arg url "$URL" \
     --arg title "$TITLE" \
     --arg desc "$DESCRIPTION" \
     '{url: $url, title: $title, description: $desc}'
   ```

2. **Escape quotes in shell:**
   ```bash
   # Wrong - unescaped quotes break JSON
   curl -d '{"title": "It's great"}'  # Breaks!

   # Right - use jq or printf
   printf '{"title": "%s"}' "It's great"
   ```

3. **Validate JSON before sending:**
   ```bash
   JSON_DATA='{"url": "https://example.com"}'

   if echo "$JSON_DATA" | jq empty 2>/dev/null; then
     echo "Valid JSON"
     curl -d "$JSON_DATA" ...
   else
     echo "Invalid JSON"
   fi
   ```

---

## Network & Connectivity Issues

### Problem: Connection Refused

**Symptoms:**
```
curl: (7) Failed to connect to localhost port 9090: Connection refused
```

**Solutions:**

1. **Check if Linkding is running:**
   ```bash
   # Docker
   docker ps | grep linkding

   # System service
   systemctl status linkding
   ```

2. **Verify URL and port:**
   ```bash
   # Check exposed port
   docker port linkding

   # Test connectivity
   curl -I "$LINKDING_URL"
   ```

3. **Check network access:**
   ```bash
   # If using Tailscale or VPN
   ping linkding.example.com

   # Check firewall rules
   sudo iptables -L | grep 9090
   ```

### Problem: SSL Certificate Errors

**Symptoms:**
```
curl: (60) SSL certificate problem: unable to get local issuer certificate
```

**Solutions:**

1. **For development (not recommended for production):**
   ```bash
   curl -k "$LINKDING_URL/api/bookmarks/" ...
   # -k flag skips certificate verification
   ```

2. **Proper fix - update certificates:**
   ```bash
   # Ubuntu/Debian
   sudo apt-get install ca-certificates
   sudo update-ca-certificates
   ```

3. **Use HTTP for local development:**
   ```bash
   export LINKDING_URL="http://localhost:9090"
   ```

---

## Debugging Tips

### Enable Verbose Curl Output

```bash
# See full request/response
curl -v "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY"
```

### Test Endpoint Availability

```bash
# Quick health check
curl -s -o /dev/null -w "%{http_code}\n" "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY"

# 200 = OK
# 401 = Auth problem
# 404 = Wrong URL
# 500 = Server error
```

### Inspect Response Headers

```bash
curl -I "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY"
```

### Save Full Response for Analysis

```bash
curl -s "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -o response.json -w "HTTP Status: %{http_code}\n"

# Inspect
jq . response.json
```

### Common HTTP Status Codes

| Code | Meaning | Common Cause |
|------|---------|--------------|
| 200 | OK | Success |
| 201 | Created | Bookmark created successfully |
| 204 | No Content | Delete/archive successful |
| 400 | Bad Request | Invalid JSON or missing required fields |
| 401 | Unauthorized | Invalid or missing API token |
| 404 | Not Found | Bookmark ID doesn't exist or wrong endpoint |
| 500 | Server Error | Linkding internal error (check logs) |

---

## Getting Help

If problems persist:

1. **Check Linkding logs:**
   ```bash
   docker logs linkding --tail 100
   ```

2. **Verify API version:**
   ```bash
   curl -s "$LINKDING_URL/api/user/profile/" \
     -H "Authorization: Token $LINKDING_API_KEY" | jq
   ```

3. **Test with minimal request:**
   ```bash
   curl -X POST "$LINKDING_URL/api/bookmarks/" \
     -H "Authorization: Token $LINKDING_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{"url": "https://example.com"}'
   ```

4. **Consult official documentation:**
   - [Linkding GitHub](https://github.com/sissbruecker/linkding)
   - [API Documentation](https://github.com/sissbruecker/linkding/blob/master/docs/API.md)
