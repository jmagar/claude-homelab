# SABnzbd Troubleshooting Guide

Common issues and solutions when working with SABnzbd API.

## Authentication Issues

### Problem: API Key Authentication Failed

**Symptoms:**
- 401 Unauthorized response
- "API Key Incorrect" error message
- Access denied errors

**Solutions:**

1. **Verify API key is correct:**
   ```bash
   # Check your .env file
   grep SABNZBD_API_KEY ~/.claude-homelab/.env
   ```

2. **Get API key from SABnzbd:**
   - Open SABnzbd web interface
   - Navigate to Config → General → Security
   - Copy the API Key value

3. **Test with simple version check:**
   ```bash
   curl -s "http://localhost:8080/api?mode=version" \
     -H "X-API-Key: <your_api_key>"
   # Should return version number like "4.5.0"
   ```

4. **Check API key format:**
   - API keys are typically 32 characters long
   - No spaces or special characters
   - Case-sensitive

### Problem: API Key Not Being Sent

**Symptoms:**
- No authentication header in request
- Always getting unauthorized errors

**Solutions:**

1. **Verify header syntax:**
   ```bash
   # Correct
   -H "X-API-Key: $SABNZBD_API_KEY"

   # Incorrect
   -H "X-Api-Key: $SABNZBD_API_KEY"  # Wrong case
   -H "apikey: $SABNZBD_API_KEY"     # Wrong header name
   ```

2. **Use query parameter instead:**
   ```bash
   curl -s "$SABNZBD_URL/api?mode=queue&apikey=$SABNZBD_API_KEY&output=json"
   ```

## Connection Issues

### Problem: Connection Refused

**Symptoms:**
- `curl: (7) Failed to connect`
- `Connection refused`
- Timeout errors

**Solutions:**

1. **Verify SABnzbd is running:**
   ```bash
   docker ps | grep sabnzbd
   # Or if running as service
   systemctl status sabnzbd
   ```

2. **Check correct URL and port:**
   ```bash
   # Default port is 8080
   export SABNZBD_URL="http://localhost:8080"

   # Test connection
   curl -s "$SABNZBD_URL/api?mode=version" \
     -H "X-API-Key: $SABNZBD_API_KEY"
   ```

3. **Check if port is accessible:**
   ```bash
   # Test port connectivity
   nc -zv localhost 8080

   # Check what's listening on port
   ss -tuln | grep 8080
   ```

4. **Verify Docker port mapping (if using Docker):**
   ```bash
   docker port sabnzbd
   # Should show: 8080/tcp -> 0.0.0.0:8080
   ```

### Problem: Host Not Found

**Symptoms:**
- `Could not resolve host`
- DNS lookup failures

**Solutions:**

1. **Use IP address instead of hostname:**
   ```bash
   export SABNZBD_URL="http://192.168.1.100:8080"
   ```

2. **Check DNS resolution:**
   ```bash
   nslookup sabnzbd.local
   ping sabnzbd.local
   ```

## Queue Issues

### Problem: Queue Items Stuck in "Downloading" State

**Symptoms:**
- Item shows "Downloading" but no progress
- Speed shows 0 B/s
- Time remaining shows infinite or N/A

**Solutions:**

1. **Check Usenet server connection:**
   ```bash
   curl -s "$SABNZBD_URL/api?mode=fullstatus&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" | \
     jq '.servers[] | {name, connected, error}'
   ```

2. **Pause and resume the queue:**
   ```bash
   # Pause
   curl -X POST "$SABNZBD_URL/api?mode=pause" \
     -H "X-API-Key: $SABNZBD_API_KEY"

   # Wait 5 seconds
   sleep 5

   # Resume
   curl -X POST "$SABNZBD_URL/api?mode=resume" \
     -H "X-API-Key: $SABNZBD_API_KEY"
   ```

3. **Delete and re-add the NZB:**
   ```bash
   # Get NZO ID
   curl -s "$SABNZBD_URL/api?mode=queue&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" | \
     jq '.queue.slots[] | {nzo_id, filename}'

   # Delete item
   curl -X POST "$SABNZBD_URL/api?mode=queue&name=delete&value=SABnzbd_nzo_abc123" \
     -H "X-API-Key: $SABNZBD_API_KEY"
   ```

### Problem: Queue Shows Paused but Cannot Resume

**Symptoms:**
- Queue status shows "Paused"
- Resume command doesn't work
- Downloads don't start

**Solutions:**

1. **Force resume:**
   ```bash
   curl -X POST "$SABNZBD_URL/api?mode=resume" \
     -H "X-API-Key: $SABNZBD_API_KEY"
   ```

2. **Check if individual items are paused:**
   ```bash
   # List items with priority -2 (paused)
   curl -s "$SABNZBD_URL/api?mode=queue&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" | \
     jq '.queue.slots[] | select(.priority == "-2") | {nzo_id, filename}'
   ```

3. **Resume individual paused items:**
   ```bash
   curl -X POST "$SABNZBD_URL/api?mode=queue&name=priority&value=SABnzbd_nzo_abc123&value2=0" \
     -H "X-API-Key: $SABNZBD_API_KEY"
   ```

## Category Issues

### Problem: Category Not Found

**Symptoms:**
- Error: "Category does not exist"
- NZB added to default category instead of specified one

**Solutions:**

1. **List available categories:**
   ```bash
   curl -s "$SABNZBD_URL/api?mode=get_cats&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" | jq '.categories[]'
   ```

2. **Use exact category name:**
   ```bash
   # Categories are case-sensitive
   # Correct
   curl -X POST "$SABNZBD_URL/api?mode=addurl&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" \
     -d "name=http://example.com/file.nzb&cat=movies"

   # Incorrect
   -d "name=http://example.com/file.nzb&cat=Movies"  # Wrong case
   ```

3. **Add NZB without category (use default):**
   ```bash
   curl -X POST "$SABNZBD_URL/api?mode=addurl&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" \
     -d "name=http://example.com/file.nzb"
   ```

## Speed Limit Issues

### Problem: Speed Limit Not Working

**Symptoms:**
- Downloads continue at full speed despite limit
- speedlimit command accepted but no effect

**Solutions:**

1. **Verify speed limit was set:**
   ```bash
   curl -s "$SABNZBD_URL/api?mode=queue&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" | \
     jq '.queue | {speedlimit, speedlimit_abs, current_speed: .speed}'
   ```

2. **Set absolute speed limit (KB/s):**
   ```bash
   # Set 5 MB/s limit (5120 KB/s)
   curl -X POST "$SABNZBD_URL/api?mode=speedlimit&value=5120" \
     -H "X-API-Key: $SABNZBD_API_KEY"
   ```

3. **Check if configured max speed is too low:**
   ```bash
   curl -s "$SABNZBD_URL/api?mode=get_config&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" | \
     jq '.config.misc.bandwidth_max'
   ```

### Problem: Downloads Too Slow

**Symptoms:**
- Download speed much slower than connection speed
- Speed varies dramatically

**Solutions:**

1. **Remove speed limit:**
   ```bash
   curl -X POST "$SABNZBD_URL/api?mode=speedlimit&value=0" \
     -H "X-API-Key: $SABNZBD_API_KEY"
   ```

2. **Check server connection count:**
   ```bash
   curl -s "$SABNZBD_URL/api?mode=get_config&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" | \
     jq '.config.servers[] | {host, connections}'
   ```

3. **Verify no ISP throttling:**
   - Check if using SSL connections (port 563)
   - Verify server credentials are correct

## NZB Adding Issues

### Problem: Cannot Add NZB by URL

**Symptoms:**
- "Invalid URL" error
- NZB not added to queue
- Timeout when fetching URL

**Solutions:**

1. **Verify URL is accessible:**
   ```bash
   # Test URL directly
   curl -I "http://indexer.com/get.php?guid=xyz"
   # Should return 200 OK
   ```

2. **URL-encode special characters:**
   ```bash
   # Use proper URL encoding for special characters
   curl -X POST "$SABNZBD_URL/api?mode=addurl&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" \
     --data-urlencode "name=http://indexer.com/file?guid=xyz&key=abc"
   ```

3. **Try file upload instead:**
   ```bash
   # Download NZB first, then upload
   wget -O /tmp/file.nzb "http://indexer.com/get.php?guid=xyz"

   curl -X POST "$SABNZBD_URL/api?mode=addfile&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" \
     -F "nzbfile=@/tmp/file.nzb"
   ```

### Problem: NZB File Upload Fails

**Symptoms:**
- "Invalid NZB file" error
- File appears to upload but not added to queue

**Solutions:**

1. **Verify file is valid NZB:**
   ```bash
   # Check file format
   file /path/to/file.nzb
   # Should show: XML document text

   # Validate XML structure
   xmllint --noout /path/to/file.nzb
   ```

2. **Check file size:**
   ```bash
   ls -lh /path/to/file.nzb
   # Very large NZB files (>10MB) may cause issues
   ```

3. **Use correct multipart form field name:**
   ```bash
   # Correct field name is "nzbfile"
   curl -X POST "$SABNZBD_URL/api?mode=addfile&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" \
     -F "nzbfile=@/path/to/file.nzb"
   ```

## History Issues

### Problem: Cannot Clear History

**Symptoms:**
- Delete history command accepted but items remain
- "all" parameter doesn't work

**Solutions:**

1. **Delete items individually:**
   ```bash
   # Get all history IDs
   curl -s "$SABNZBD_URL/api?mode=history&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" | \
     jq -r '.history.slots[].nzo_id' | \
     while read nzo_id; do
       curl -X POST "$SABNZBD_URL/api?mode=history&name=delete&value=$nzo_id" \
         -H "X-API-Key: $SABNZBD_API_KEY"
     done
   ```

2. **Use web interface to clear:**
   - Navigate to History tab
   - Click "Delete All" or "Purge History"

### Problem: Failed Downloads Not Showing

**Symptoms:**
- History shows empty even though downloads failed
- `failed_only=1` returns no results

**Solutions:**

1. **Check if failed downloads were auto-removed:**
   ```bash
   curl -s "$SABNZBD_URL/api?mode=get_config&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" | \
     jq '.config.misc.auto_disconnect'
   ```

2. **List all history without filter:**
   ```bash
   curl -s "$SABNZBD_URL/api?mode=history&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" | \
     jq '.history.slots[] | {name, status, fail_message}'
   ```

## API Response Issues

### Problem: Empty JSON Response

**Symptoms:**
- `jq` parsing errors
- Response body is empty or not valid JSON

**Solutions:**

1. **Verify output format parameter:**
   ```bash
   # Always include output=json
   curl -s "$SABNZBD_URL/api?mode=queue&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY"
   ```

2. **Check HTTP status code:**
   ```bash
   curl -i "$SABNZBD_URL/api?mode=queue&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY"
   # Look for "HTTP/1.1 200 OK"
   ```

3. **Test with simple command:**
   ```bash
   # Version endpoint should always work
   curl -s "$SABNZBD_URL/api?mode=version" \
     -H "X-API-Key: $SABNZBD_API_KEY"
   ```

### Problem: Unexpected Response Structure

**Symptoms:**
- Expected fields missing from JSON
- Different structure than documented

**Solutions:**

1. **Check SABnzbd version:**
   ```bash
   curl -s "$SABNZBD_URL/api?mode=version" \
     -H "X-API-Key: $SABNZBD_API_KEY"
   # API structure may differ between versions
   ```

2. **Examine full response:**
   ```bash
   curl -s "$SABNZBD_URL/api?mode=queue&output=json" \
     -H "X-API-Key: $SABNZBD_API_KEY" | jq '.'
   ```

## General Debugging

### Enable Verbose Logging

```bash
# Add verbose flag to see request details
curl -v "$SABNZBD_URL/api?mode=queue&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

### Test Connection Step by Step

```bash
# 1. Test basic connectivity
ping -c 3 localhost

# 2. Test port accessibility
nc -zv localhost 8080

# 3. Test HTTP response
curl -I http://localhost:8080

# 4. Test API endpoint (no auth)
curl -s http://localhost:8080/api?mode=version

# 5. Test with authentication
curl -s http://localhost:8080/api?mode=version \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

### Check SABnzbd Logs

```bash
# Docker logs (if using Docker)
docker logs sabnzbd --tail 50

# Find SABnzbd log location
curl -s "$SABNZBD_URL/api?mode=get_config&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" | \
  jq '.config.misc.log_dir'

# View recent log entries
tail -f /path/to/sabnzbd/logs/sabnzbd.log
```

## Common Error Messages

| Error Message | Cause | Solution |
|--------------|-------|----------|
| `API Key Incorrect` | Wrong or missing API key | Verify API key in config |
| `Connection refused` | SABnzbd not running | Start SABnzbd service |
| `Invalid NZB` | Malformed or corrupt NZB file | Re-download NZB file |
| `Category does not exist` | Typo in category name | Check available categories |
| `Server not configured` | No Usenet servers configured | Add server in SABnzbd config |
| `Disk full` | Insufficient disk space | Free up disk space |
| `Permission denied` | File system permissions | Check download directory permissions |
| `Timeout` | Network or server issue | Check network connectivity |

## Getting Help

If issues persist after trying these solutions:

1. **Check SABnzbd version compatibility:**
   ```bash
   curl -s "$SABNZBD_URL/api?mode=version" \
     -H "X-API-Key: $SABNZBD_API_KEY"
   ```

2. **Review official documentation:**
   - [SABnzbd API Docs](https://sabnzbd.org/wiki/configuration/4.5/api)
   - [SABnzbd Wiki](https://sabnzbd.org/wiki/)

3. **Check SABnzbd logs for detailed error messages**

4. **Test with SABnzbd web interface** to rule out API issues
