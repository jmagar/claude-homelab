# Memos Troubleshooting Guide

Common issues and their solutions.

## Authentication Errors

### 401 Unauthorized

**Error Message:**
```json
{"code": 7, "message": "Unauthenticated", "details": []}
```

**Causes:**
1. Invalid API token
2. Expired token
3. Missing Authorization header

**Solutions:**
1. Verify token in `.env` file:
   ```bash
   grep "^MEMOS_API_TOKEN" ~/.claude-homelab/.env
   ```

2. Regenerate token in Memos UI:
   - Log into Memos instance
   - Settings → Access Tokens
   - Create new token
   - Update `.env` file

3. Test authentication:
   ```bash
   cd ~/claude-homelab/skills/memos
   bash scripts/user-api.sh whoami
   ```

### Permission Denied

**Error Message:**
```json
{"code": 7, "message": "Permission Denied", "details": []}
```

**Cause:** Token has insufficient permissions

**Solution:** Ensure token belongs to correct user with proper role (HOST or USER)

## Connection Errors

### Connection Refused

**Error Message:**
```bash
curl: (7) Failed to connect to memos.example.com port 443
```

**Causes:**
1. Memos instance not running
2. Wrong URL in `.env`
3. Network connectivity issue

**Solutions:**
1. Verify URL:
   ```bash
   grep "^MEMOS_URL" ~/.claude-homelab/.env
   ```

2. Test connectivity:
   ```bash
   curl -I https://memos.example.com
   ```

3. Check Memos service status:
   ```bash
   docker ps | grep memos
   # or
   systemctl status memos
   ```

### SSL/TLS Errors

**Error Message:**
```bash
curl: (60) SSL certificate problem: unable to get local issuer certificate
```

**Cause:** Self-signed certificate or certificate verification issue

**Solution (NOT recommended for production):**
```bash
# Add -k flag to skip verification (development only)
# Better: Install proper certificate
```

## API Errors

### Not Found (404)

**Error Message:**
```json
{"code": 5, "message": "Not Found", "details": []}
```

**Causes:**
1. Invalid memo ID
2. Memo deleted
3. Wrong endpoint

**Solutions:**
1. Verify memo exists:
   ```bash
   bash scripts/memo-api.sh list | jq '.memos[] | {name, content}'
   ```

2. Check ID format (should be alphanumeric without "memos/" prefix for operations)

3. Use correct memo ID from list/create response

### Invalid Argument (400)

**Error Message:**
```json
{"code": 3, "message": "Invalid argument", "details": []}
```

**Causes:**
1. Malformed JSON
2. Invalid parameter value
3. Missing required field

**Solutions:**
1. Check request payload format
2. Validate parameter values (e.g., visibility must be PRIVATE/PROTECTED/PUBLIC)
3. Review API reference for required fields

### Method Not Allowed (405)

**Error Message:**
```json
{"code": 12, "message": "Method Not Allowed", "details": []}
```

**Cause:** Wrong HTTP method for endpoint

**Solution:** Verify correct method (GET, POST, PATCH, DELETE) for endpoint

## Script Errors

### Environment File Not Found

**Error Message:**
```json
{"error": "Environment file not found", "path": "/home/user/.claude-homelab/.env"}
```

**Solution:**
1. Create `.env` file:
   ```bash
   touch ~/.claude-homelab/.env
   chmod 600 ~/.claude-homelab/.env
   ```

2. Add credentials:
   ```bash
   cat >> ~/.claude-homelab/.env <<'EOF'
   MEMOS_URL="https://memos.example.com"
   MEMOS_API_TOKEN="<your_api_token>"
   EOF
   ```

### Missing Credentials

**Error Message:**
```json
{"error": "Missing credentials", "required": ["MEMOS_URL", "MEMOS_API_TOKEN"]}
```

**Solution:**
1. Check `.env` contains both variables:
   ```bash
   grep "^MEMOS" ~/.claude-homelab/.env
   ```

2. Ensure no typos in variable names (case-sensitive)

### Command Not Found: jq

**Error Message:**
```bash
bash: jq: command not found
```

**Solution:** Install jq:
```bash
# Ubuntu/Debian
sudo apt install jq

# macOS
brew install jq

# Fedora/RHEL
sudo dnf install jq
```

### Permission Denied on Script

**Error Message:**
```bash
bash: ./scripts/memo-api.sh: Permission denied
```

**Solution:** Make scripts executable:
```bash
chmod +x ~/claude-homelab/skills/memos/scripts/*.sh
```

## Data Issues

### Tags Not Working

**Problem:** Tags not appearing in memo

**Causes:**
1. Tags not in hashtag format
2. Tags passed as separate field (doesn't work in Memos)

**Solution:** Include tags in content:
```bash
# Wrong
bash scripts/memo-api.sh create "Content" --tags "work"

# Right (script automatically adds hashtags)
bash scripts/memo-api.sh create "Content" --tags "work"
# Results in content: "Content #work"

# Or manually in content
bash scripts/memo-api.sh create "Content with #work tag"
```

### List Returns No Memos

**Problem:** `memo-api.sh list` returns empty array

**Possible Causes:**
1. All memos are PRIVATE and list defaults to PUBLIC
2. No memos exist
3. Pagination issue

**Solutions:**
1. Create test memo:
   ```bash
   bash scripts/memo-api.sh create "Test memo" --visibility PUBLIC
   ```

2. Use search instead (searches all your memos):
   ```bash
   bash scripts/search-api.sh "" --limit 100
   ```

3. Check specific memo by ID:
   ```bash
   bash scripts/memo-api.sh get abc123
   ```

### Search Returns No Results

**Problem:** Search doesn't find expected memos

**Causes:**
1. Content doesn't match query
2. Filter syntax error
3. Case-sensitive tag search

**Solutions:**
1. Try broader search:
   ```bash
   # Instead of exact phrase
   bash scripts/search-api.sh "docker"
   # Not
   bash scripts/search-api.sh "docker networking configuration"
   ```

2. Check filter syntax (Google AIP-160):
   ```bash
   # Correct
   bash scripts/search-api.sh "query" --tags "docker,work"

   # Incorrect (manual filter)
   bash scripts/memo-api.sh list --filter 'invalid syntax'
   ```

3. Tags are case-sensitive:
   ```bash
   # Use exact case
   bash scripts/tag-api.sh search docker  # not Docker
   ```

## Performance Issues

### Slow Response Times

**Causes:**
1. Large result sets
2. Network latency
3. Memos instance under load

**Solutions:**
1. Use pagination:
   ```bash
   bash scripts/memo-api.sh list --limit 20
   ```

2. Use specific filters:
   ```bash
   bash scripts/search-api.sh "query" --tags "specific-tag"
   ```

3. Check Memos instance resources

### Timeout Errors

**Error Message:**
```bash
curl: (28) Operation timed out
```

**Solutions:**
1. Increase timeout (currently none set, curl default is 2 minutes)
2. Check network connectivity
3. Verify Memos instance is responding:
   ```bash
   curl -I https://memos.example.com
   ```

## Debug Mode

Enable verbose output for troubleshooting:

```bash
# Add -v flag to curl (modify script temporarily)
# Or run curl directly with -v:
curl -v -H "Authorization: Bearer $MEMOS_API_TOKEN" \
  "https://memos.example.com/api/v1/memos"
```

## Getting Help

1. Check script help:
   ```bash
   bash scripts/memo-api.sh --help
   ```

2. Test with minimal example:
   ```bash
   bash scripts/user-api.sh whoami
   ```

3. Verify API access directly:
   ```bash
   source ~/.claude-homelab/.env
   curl -H "Authorization: Bearer $MEMOS_API_TOKEN" \
     "https://memos.example.com/api/v1/users/1"
   ```

4. Check Memos documentation:
   - Official docs: https://usememos.com/docs
   - API reference: https://usememos.com/docs/api

## Common Pitfalls

1. **Using "memos/" prefix in operations**: Scripts handle both formats, but API expects just the ID
2. **Forgetting hashtags in tags**: Tags must be in content as `#tagname`
3. **Wrong visibility**: Default is PRIVATE, not PUBLIC
4. **Malformed filters**: Use Google AIP-160 syntax exactly
5. **Expired tokens**: Regenerate periodically
6. **File permissions**: `.env` should be 600 (read/write owner only)
