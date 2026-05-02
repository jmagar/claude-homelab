# Tautulli Troubleshooting

Common issues and solutions when using the Tautulli skill.

## Authentication Errors

### Error: "Invalid API key"

**Symptoms:**
```json
{
  "response": {
    "result": "error",
    "message": "Invalid apikey",
    "data": null
  }
}
```

**Causes:**
- API key is incorrect
- API key has spaces or special characters
- API not enabled in Tautulli

**Solutions:**

1. **Verify API is enabled:**
   ```
   - Open Tautulli web UI
   - Go to Settings → Web Interface
   - Scroll to "API" section
   - Ensure "API enabled" is checked
   - Save settings
   ```

2. **Get correct API key:**
   ```
   - In same API section, copy the API Key
   - It should be a long alphanumeric string (32+ characters)
   ```

3. **Update .env file:**
   ```bash
   # Edit ~/.claude-homelab/.env
   TAUTULLI_API_KEY="correct-key-here"

   # NO quotes around value if contains special chars
   # NO spaces before or after the =
   ```

4. **Test the key:**
   ```bash
   # Direct API test
   curl "${TAUTULLI_URL}/api/v2?apikey=${TAUTULLI_API_KEY}&cmd=get_server_info"

   # Should return success JSON
   ```

### Error: "ERROR: TAUTULLI_API_KEY must be set in .env"

**Cause:** Environment variable not loaded or .env file missing.

**Solutions:**

1. **Check .env file exists:**
   ```bash
   ls -la ~/.claude-homelab/.env
   ```

2. **Check variable is set:**
   ```bash
   cat ~/.claude-homelab/.env | grep TAUTULLI
   ```

3. **Verify format:**
   ```bash
   # Correct format in .env
   TAUTULLI_URL="http://192.168.1.100:8181"
   TAUTULLI_API_KEY="<your_api_key>"

   # NO spaces around =
   # Values can be with or without quotes
   ```

4. **Source the file manually:**
   ```bash
   source ~/.claude-homelab/.env
   echo $TAUTULLI_API_KEY  # Should print your key
   ```

## Connection Errors

### Error: "Connection refused" or timeout

**Symptoms:**
```
curl: (7) Failed to connect to 192.168.1.100 port 8181: Connection refused
```

**Causes:**
- Tautulli not running
- Wrong URL or port
- Firewall blocking connection
- Network issues

**Solutions:**

1. **Check Tautulli is running:**
   ```bash
   # If using Docker
   docker ps | grep tautulli

   # Check if port is listening
   nc -zv 192.168.1.100 8181
   ```

2. **Verify URL and port:**
   ```bash
   # Test web UI access
   curl -I http://192.168.1.100:8181

   # Should return 200 OK or 302 redirect
   ```

3. **Check firewall:**
   ```bash
   # On Tautulli host
   sudo ufw status
   sudo firewall-cmd --list-ports

   # Ensure 8181/tcp is allowed
   ```

4. **Test from same network:**
   ```bash
   # Ensure you can reach Tautulli from your machine
   ping 192.168.1.100
   curl http://192.168.1.100:8181
   ```

5. **Check Tautulli logs:**
   ```bash
   # Docker
   docker logs tautulli

   # Manual install
   tail -f /path/to/tautulli/logs/tautulli.log
   ```

### Error: "SSL certificate verify failed"

**Cause:** Using HTTPS with self-signed certificate.

**Solutions:**

1. **Use HTTP instead:**
   ```bash
   # In .env
   TAUTULLI_URL="http://192.168.1.100:8181"  # Not https://
   ```

2. **Or disable SSL verification (not recommended):**
   ```bash
   # Edit tautulli-api.sh
   # Add -k flag to curl command
   curl -k -sS -X GET "..."
   ```

## Data Issues

### Error: Empty or missing data

**Symptoms:**
```json
{
  "response": {
    "result": "success",
    "data": []
  }
}
```

**Causes:**
- No historical data collected yet
- Filters too restrictive
- Library not scanned
- No recent activity

**Solutions:**

1. **Wait for data collection:**
   ```
   - Tautulli collects data every few minutes
   - Check Settings → Monitoring → Refresh intervals
   - Wait at least 10-15 minutes after install
   ```

2. **Verify Plex connection:**
   ```bash
   # Check server info
   ./scripts/tautulli-api.sh server-info

   # Should show pms_name and pms_version
   ```

3. **Check Tautulli settings:**
   ```
   - Settings → Plex Media Server → Connection
   - Ensure Plex server is connected
   - Test connection
   ```

4. **Remove filters and retry:**
   ```bash
   # Instead of:
   ./scripts/tautulli-api.sh history --user "john" --days 1

   # Try:
   ./scripts/tautulli-api.sh history --limit 100
   ```

5. **Check history retention:**
   ```
   - Settings → General Settings → History Retention
   - Ensure it's not deleting data too aggressively
   ```

### Error: "No section_id provided"

**Cause:** Command requires library section ID but none specified.

**Solutions:**

1. **List available sections first:**
   ```bash
   ./scripts/tautulli-api.sh libraries
   ```

2. **Use the correct section_id:**
   ```bash
   # Get section IDs from output above (usually 1, 2, 3...)
   ./scripts/tautulli-api.sh library-stats --section-id 1
   ```

3. **Section IDs match Plex:**
   ```
   - Section IDs are the same as Plex library keys
   - Usually: 1=Movies, 2=TV, 3=Music
   - But verify with libraries command
   ```

## Script Errors

### Error: "command not found: jq"

**Cause:** jq JSON processor not installed.

**Solutions:**

```bash
# Ubuntu/Debian
sudo apt-get install jq

# macOS
brew install jq

# Test
jq --version
```

### Error: "line 2: $'\\r': command not found"

**Cause:** Windows line endings (CRLF) in script.

**Solutions:**

```bash
# Convert line endings
dos2unix ~/claude-homelab/skills/tautulli/scripts/tautulli-api.sh

# Or use sed
sed -i 's/\r$//' ~/claude-homelab/skills/tautulli/scripts/tautulli-api.sh

# Ensure executable
chmod +x ~/claude-homelab/skills/tautulli/scripts/tautulli-api.sh
```

### Error: Permission denied

**Cause:** Script not executable.

**Solutions:**

```bash
# Make executable
chmod +x ~/claude-homelab/skills/tautulli/scripts/tautulli-api.sh

# Verify
ls -l ~/claude-homelab/skills/tautulli/scripts/tautulli-api.sh
# Should show: -rwxr-xr-x
```

## Performance Issues

### Slow queries or timeouts

**Causes:**
- Large database with years of data
- Complex filters
- Long time ranges
- No database indexes

**Solutions:**

1. **Use shorter time ranges:**
   ```bash
   # Instead of all-time:
   ./scripts/tautulli-api.sh history --limit 1000

   # Use recent data:
   ./scripts/tautulli-api.sh history --days 30 --limit 100
   ```

2. **Limit result size:**
   ```bash
   # Use reasonable limits
   ./scripts/tautulli-api.sh history --limit 50  # Not 10000
   ```

3. **Use specific filters:**
   ```bash
   # Narrow the search
   ./scripts/tautulli-api.sh history --user "john" --section-id 1 --days 7
   ```

4. **Check database size:**
   ```bash
   # If database is huge (>1GB), consider:
   # - Reducing history retention
   # - Running database maintenance
   # Settings → Maintenance → Database
   ```

5. **Optimize database:**
   ```
   - Settings → Maintenance
   - Run "Vacuum database"
   - Run "Check database integrity"
   ```

### API rate limiting

**Symptoms:** Requests start failing after many rapid calls.

**Solutions:**

1. **Add delays between requests:**
   ```bash
   #!/bin/bash
   for user in alice bob charlie; do
       ./scripts/tautulli-api.sh user-stats --user "$user"
       sleep 1  # Wait 1 second between calls
   done
   ```

2. **Batch operations:**
   ```bash
   # Instead of multiple calls, use filters
   ./scripts/tautulli-api.sh history --limit 500
   ```

3. **Cache results:**
   ```bash
   # Save frequently-used data
   ./scripts/tautulli-api.sh libraries > /tmp/tautulli_libs.json

   # Reuse cached data
   cat /tmp/tautulli_libs.json | jq '.response.data'
   ```

## Integration Issues

### Data doesn't match Plex

**Causes:**
- Tautulli hasn't synced yet
- Plex server connection lost
- History not being recorded

**Solutions:**

1. **Check Plex connection:**
   ```bash
   ./scripts/tautulli-api.sh server-info
   # Verify pms_name and pms_version are correct
   ```

2. **Force sync:**
   ```
   - Settings → Plex Media Server
   - Click "Refresh Libraries"
   ```

3. **Check monitoring:**
   ```
   - Settings → Monitoring
   - Ensure "Monitor Plex Media Server" is enabled
   - Check refresh intervals
   ```

4. **Review activity log:**
   ```
   - Tautulli UI → Activity
   - Check if current sessions appear
   ```

### Library section IDs wrong

**Symptoms:** Commands work with section_id 1 but not 2 or 3.

**Solutions:**

1. **List all sections:**
   ```bash
   ./scripts/tautulli-api.sh libraries | jq '.response.data[] | {id: .section_id, name: .section_name, type: .section_type}'
   ```

2. **Use correct IDs:**
   ```
   - IDs are assigned by Plex, not Tautulli
   - Can be non-sequential (1, 3, 5...)
   - Can change if library deleted/recreated
   ```

3. **Verify in Plex:**
   ```
   - Open Plex Web UI
   - Look at library URLs
   - Example: /library/sections/2 → section_id is 2
   ```

## Common Pitfalls

### 1. Wrong timestamp format

**Problem:** Using human-readable dates instead of Unix timestamps.

**Wrong:**
```bash
# This won't work
./scripts/tautulli-api.sh history --start-date "2024-01-01"
```

**Correct:**
```bash
# Use --days parameter
./scripts/tautulli-api.sh history --days 30

# Or convert to Unix timestamp
START=$(date -d "2024-01-01" +%s)
curl "${TAUTULLI_URL}/api/v2?apikey=${TAUTULLI_API_KEY}&cmd=get_history&start_date=${START}"
```

### 2. Not checking result field

**Problem:** Processing data without checking if request succeeded.

**Wrong:**
```bash
# Might fail silently
./scripts/tautulli-api.sh activity | jq '.response.data.sessions'
```

**Correct:**
```bash
# Check result first
RESULT=$(./scripts/tautulli-api.sh activity)
if echo "$RESULT" | jq -e '.response.result == "success"' > /dev/null; then
    echo "$RESULT" | jq '.response.data.sessions'
else
    echo "Error: $(echo "$RESULT" | jq -r '.response.message')"
fi
```

### 3. Pagination misunderstanding

**Problem:** Only seeing first 25 results and thinking that's all.

**Solution:**
```bash
# Check total records
TOTAL=$(./scripts/tautulli-api.sh history | jq '.response.data.recordsTotal')
echo "Total records: $TOTAL"

# Use appropriate limit
./scripts/tautulli-api.sh history --limit 100

# Or paginate
for offset in 0 100 200 300; do
    # Use direct API call with start parameter
    curl "${TAUTULLI_URL}/api/v2?apikey=${TAUTULLI_API_KEY}&cmd=get_history&start=${offset}&length=100"
done
```

### 4. Special characters in searches

**Problem:** Search fails with spaces or special characters.

**Wrong:**
```bash
# Spaces break the query
./scripts/tautulli-api.sh history --search "Star Wars"
```

**Correct:**
```bash
# Use quotes
./scripts/tautulli-api.sh history --search "Star Wars"

# For direct API calls, URL encode
QUERY=$(echo "Star Wars" | jq -sRr @uri)
curl "${TAUTULLI_URL}/api/v2?apikey=${TAUTULLI_API_KEY}&cmd=get_history&search=${QUERY}"
```

## Getting Help

### Check Tautulli logs

```bash
# Docker
docker logs tautulli --tail 100

# Manual install
tail -100 /path/to/tautulli/logs/tautulli.log

# Look for errors or warnings
grep -i error /path/to/tautulli/logs/tautulli.log
```

### Enable debug mode

```bash
# Add debug parameter to API calls
curl "${TAUTULLI_URL}/api/v2?apikey=${TAUTULLI_API_KEY}&cmd=get_activity&debug=1"

# Or in Tautulli settings
# Settings → Notification Agents → Script → Debug Logging
```

### Test with curl

```bash
# Bypass wrapper script and test directly
curl -v "${TAUTULLI_URL}/api/v2?apikey=${TAUTULLI_API_KEY}&cmd=get_server_info"

# -v flag shows full HTTP transaction
```

### Verify environment

```bash
# Check all variables
env | grep TAUTULLI

# Expected output:
TAUTULLI_URL=http://192.168.1.100:8181
TAUTULLI_API_KEY=<your_api_key>
```

## Resources

- [Tautulli GitHub Issues](https://github.com/Tautulli/Tautulli/issues)
- [Tautulli Discord](https://tautulli.com/discord)
- [Tautulli Reddit](https://www.reddit.com/r/Tautulli/)
- [API Documentation](https://github.com/Tautulli/Tautulli/wiki/Tautulli-API-Reference)
- [Plex Forums](https://forums.plex.tv/)

## Still Having Issues?

If none of these solutions work:

1. **Verify Tautulli version:**
   ```bash
   ./scripts/tautulli-api.sh server-info | jq '.response.data.tautulli_version'
   ```

2. **Check Plex connection:**
   ```bash
   ./scripts/tautulli-api.sh server-info | jq '.response.data | {pms_name, pms_version, pms_ip}'
   ```

3. **Test with minimal command:**
   ```bash
   curl "${TAUTULLI_URL}/api/v2?apikey=${TAUTULLI_API_KEY}&cmd=get_server_info" | jq '.'
   ```

4. **Review this checklist:**
   - [ ] Tautulli is running
   - [ ] API is enabled in settings
   - [ ] API key is correct
   - [ ] URL and port are correct
   - [ ] Can access Tautulli web UI
   - [ ] Plex server is connected
   - [ ] Some historical data exists
   - [ ] .env file has correct variables
   - [ ] Script is executable

5. **Collect debug info:**
   ```bash
   echo "Tautulli URL: $TAUTULLI_URL"
   echo "API Key length: ${#TAUTULLI_API_KEY}"
   echo "Server info:"
   ./scripts/tautulli-api.sh server-info
   ```

6. **Check Tautulli community resources** for similar issues.
