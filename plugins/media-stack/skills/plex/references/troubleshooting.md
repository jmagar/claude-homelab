# Plex Media Server API Troubleshooting

## Authentication Issues

### "401 Unauthorized"
**Cause:** Invalid or missing Plex token

**Solution:**
1. Get token from Plex Web App → Settings → Account → Show Advanced → "Get Token"
2. Verify token in request: `curl -v "$PLEX_URL/identity" -H "X-Plex-Token: $TOKEN"`
3. Check for extra spaces or characters in token
4. Ensure header name is `X-Plex-Token` (case-sensitive)

### Cannot get Plex token via API
**Cause:** Invalid credentials or 2FA enabled

**Solution:**
1. Verify email and password are correct
2. If 2FA enabled, use web app to get token (API login won't work)
3. Generate app-specific password if account has 2FA
4. Use `X-Plex-Client-Identifier` header (required for auth)

### Token works in browser but not API
**Cause:** Missing required headers

**Solution:**
1. Include `X-Plex-Token` header
2. Add `Accept: application/json` header for JSON responses
3. Some endpoints require `X-Plex-Client-Identifier`
4. Verify URL encoding is correct

## Connection Issues

### "Connection refused" or timeout
**Cause:** Plex not running or wrong port

**Solution:**
1. Check service: `curl http://localhost:32400/identity`
2. Verify port (default: 32400)
3. Check Docker logs: `docker logs plex`
4. Ensure Plex Media Server is running

### "Server not found" when using https://plex.tv
**Cause:** Trying to access local server via Plex.tv

**Solution:**
1. Use direct server URL: `http://SERVER_IP:32400`
2. Or discover server: `curl "https://plex.tv/pms/resources" -H "X-Plex-Token: $TOKEN"`
3. Extract `connections.uri` from response
4. Use local connection for best performance

### Cannot access Plex remotely
**Cause:** Remote access not configured or firewall

**Solution:**
1. Enable remote access in Plex settings
2. Configure port forwarding (default: 32400)
3. Check firewall rules
4. Use Plex Relay as fallback (slower)

## Library Issues

### Library not showing content
**Cause:** Library not scanned or permission issues

**Solution:**
1. Refresh library: `POST /library/sections/LIBRARY_KEY/refresh`
2. Check file permissions (Plex user must read files)
3. Verify library path is correct
4. Check Plex scanner logs: Settings → Console → Scanner

### "Library not found" (404)
**Cause:** Invalid library key

**Solution:**
1. Get valid library keys: `GET /library/sections`
2. Use `key` field from response (usually 1, 2, 3, etc.)
3. Library keys are numeric, not names

### Recently added not updating
**Cause:** Scanner not running or cache issue

**Solution:**
1. Force refresh: `POST /library/sections/LIBRARY_KEY/refresh?force=1`
2. Empty trash: `PUT /library/sections/LIBRARY_KEY/emptyTrash`
3. Optimize database: `PUT /library/optimize`
4. Check Plex scanner service is running

### Wrong metadata for media
**Cause:** Incorrect match or file naming issue

**Solution:**
1. Fix match via Web UI first (API doesn't support matching)
2. Ensure files follow Plex naming conventions
3. Refresh metadata: `PUT /library/metadata/RATING_KEY/refresh`
4. Check agent settings in library configuration

## Search Issues

### Search returns no results
**Cause:** Query encoding or library not indexed

**Solution:**
1. URL encode search query: `query=inception` → `query=inception`
2. Use `%20` for spaces: `breaking%20bad`
3. Refresh library if newly added
4. Try searching specific library vs. global search

### Search returns wrong items
**Cause:** Fuzzy matching or metadata issues

**Solution:**
1. Use exact titles
2. Include year in search: `?query=inception&year=2010`
3. Filter by type: `?type=1` (movie), `?type=2` (show), `?type=4` (episode)
4. Search within specific library for better results

## Session Issues

### Active sessions not showing
**Cause:** No active playback or cache delay

**Solution:**
1. Verify playback is actually happening
2. Wait a few seconds (sessions update every 5-10s)
3. Check `/status/sessions` endpoint specifically
4. Use XML response if JSON is empty: Remove `Accept: application/json`

### Cannot terminate session
**Cause:** Invalid session ID or permission issue

**Solution:**
1. Get valid session ID from active sessions first
2. Use correct endpoint: `DELETE /status/sessions/terminate?sessionId=...`
3. Only server owner can terminate sessions
4. Session may have already ended naturally

## Transcoding Issues

### Cannot see transcode sessions
**Cause:** No transcoding active or endpoint changed

**Solution:**
1. Verify transcoding is actually happening (check Web UI)
2. Use `/transcode/sessions` endpoint
3. Direct play/stream won't show in transcode sessions
4. Check server capabilities: Some playback is direct

### Transcode session stuck
**Cause:** Transcoder crash or resource exhaustion

**Solution:**
1. Kill transcode: `DELETE /transcode/sessions/SESSION_KEY`
2. Check server resources (CPU, RAM)
3. Restart Plex Media Server if persistent
4. Check transcode logs: Settings → Console → Transcoder

## Playlist Issues

### Cannot create playlist
**Cause:** Missing required parameters or invalid URI

**Solution:**
1. Include all required params: `type`, `title`, `uri`
2. URI format: `server://MACHINE_ID/com.plexapp.plugins.library/library/metadata/RATING_KEY`
3. Get machine ID from `/identity`
4. Use Web UI to create, then inspect via API

### Playlist items not showing
**Cause:** Wrong playlist ID or empty playlist

**Solution:**
1. Get valid playlist IDs: `GET /playlists`
2. Use `ratingKey` from playlist list
3. Check `leafCount` (item count) in playlist metadata

## User Management Issues

### Cannot see shared users
**Cause:** Not server owner or Plex Home not configured

**Solution:**
1. Only server owner can manage users
2. Use plex.tv API for sharing: `https://plex.tv/api/v2/shared_servers`
3. Plex Home users vs. shared users are different
4. Some operations require plex.tv authentication, not local

## Response Format Issues

### Getting XML instead of JSON
**Cause:** Missing Accept header

**Solution:**
1. Add header: `-H "Accept: application/json"`
2. Plex defaults to XML for most endpoints
3. Both formats contain same data
4. Use `jq` for JSON, `xmllint` for XML

### Response is empty but status 200
**Cause:** No data available or filter too restrictive

**Solution:**
1. Check `.MediaContainer.size` in response
2. Try without filters first
3. Verify library/item exists
4. Some endpoints return empty array when no data

### Malformed JSON response
**Cause:** Plex version or endpoint issue

**Solution:**
1. Update Plex Media Server
2. Try XML response instead
3. Check Plex forums for known issues
4. Use Web UI as workaround

## Performance Issues

### Slow API responses
**Cause:** Large library or database issues

**Solution:**
1. Optimize database: `PUT /library/optimize`
2. Use pagination/limits: `?limit=100`
3. Filter requests to specific libraries
4. Clean bundles: `PUT /library/clean/bundles`
5. Vacuum database (requires server restart)

### High CPU during library scan
**Cause:** Normal for large media collections

**Solution:**
1. Schedule scans during off-hours
2. Disable "Scan my library automatically"
3. Use manual API scans: `POST /library/sections/LIBRARY_KEY/refresh`
4. Reduce scanner concurrency in settings

## Known Limitations

- **No Bulk Operations:** Most operations are per-item
- **Limited Matching API:** Cannot match/fix metadata via API (use Web UI)
- **Plex Pass Features:** Some features require Plex Pass subscription
- **Token Security:** Tokens are powerful - treat like passwords
- **Rate Limiting:** Plex.tv API has rate limits (local server doesn't)
- **XML Default:** Most endpoints return XML by default (use Accept header for JSON)

## Version-Specific Issues

### Plex Media Server Versions
- **1.25+:** Modern API with better JSON support
- **1.30+:** Enhanced webhook support
- **1.32+:** Improved transcode management
- Check version: `GET /identity` returns `version` field

### API Changes
- Older servers may not support all endpoints
- Some features removed in newer versions
- Check official Plex forums for deprecation notices

## Debug Mode

Enable debug logging:

1. Settings → Server → General → Log Level → "Debug"
2. Or via API: Update preferences
3. Check logs: `~/Library/Application Support/Plex Media Server/Logs/` (Mac/Linux)
4. Docker: `docker logs plex` or `/config/Library/Application Support/Plex Media Server/Logs/`

## Common Error Messages

| Error | Cause | Solution |
|-------|-------|----------|
| "Unauthorized" | Invalid/missing token | Get fresh token from web app |
| "Not found" | Invalid ID/key | Verify ID exists via list endpoint |
| "Forbidden" | Permission denied | Ensure token has proper privileges |
| "Bad request" | Malformed request | Check parameter formatting |
| "Internal server error" | Plex server issue | Check Plex logs, restart server |
| "Service unavailable" | Server overloaded | Reduce concurrent requests |

## Useful Debugging Commands

### Check Server Health

```bash
curl -s "$PLEX_URL/identity" -H "X-Plex-Token: $PLEX_TOKEN"
# Should return server info, not error
```

### Verify Token Works

```bash
curl -s "https://plex.tv/api/v2/user" -H "X-Plex-Token: $PLEX_TOKEN"
# Should return user info
```

### Test Library Access

```bash
curl -s "$PLEX_URL/library/sections" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq
# Should list all libraries
```

### Check Active Sessions

```bash
curl -s "$PLEX_URL/status/sessions" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq
# Empty array if nothing playing
```
