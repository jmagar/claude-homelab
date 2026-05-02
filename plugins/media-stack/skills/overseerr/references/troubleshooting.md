# Overseerr API Troubleshooting

## Authentication Issues

### "401 Unauthorized"
**Cause:** Invalid or missing API key

**Solution:**
1. Get API key from Settings → General → API Key
2. Verify credentials in `~/.claude-homelab/.env`:
   ```bash
   OVERSEERR_URL="http://localhost:5055"
   OVERSEERR_API_KEY="your-api-key"
   ```
3. Check for extra spaces or characters in key
4. Test manually: `curl -v "$OVERSEERR_URL/api/v1/auth/me" -H "X-Api-Key: $OVERSEERR_API_KEY"`

### "403 Forbidden"
**Cause:** Insufficient permissions for operation

**Solution:**
1. Verify user has admin role (Settings → Users)
2. Some endpoints require admin permissions (user management, settings)
3. Use an admin API key for privileged operations

## Request Issues

### "409 Conflict" when requesting media
**Cause:** Media already requested or available

**Solution:**
1. Check if media exists: `GET /api/v1/movie/{tmdbId}` or `/api/v1/tv/{tmdbId}`
2. Check request status in response body
3. Use `PUT` to update existing request instead of `POST`

### Requests not auto-approving
**Cause:** Auto-approval not configured

**Solution:**
1. Settings → Users → Select user → Enable "Auto-Approve"
2. Or approve manually: `POST /api/v1/request/{id}/approve`

### Request stuck in "Pending"
**Cause:** Sonarr/Radarr not configured or unreachable

**Solution:**
1. Test Sonarr/Radarr connection: Settings → Services
2. Check Sonarr/Radarr API keys are correct
3. Verify network connectivity
4. Check Overseerr logs: `/app/config/logs/overseerr.log`

## Search Issues

### Empty search results
**Cause:** TMDB API issue or invalid query

**Solution:**
1. Verify TMDB API is accessible
2. Check Settings → Services → TMDB
3. Try different search terms (exact titles work best)
4. Use TMDB ID directly if known: `GET /api/v1/movie/{tmdbId}`

### Search returns wrong media type
**Cause:** Ambiguous search term

**Solution:**
1. Filter by type: `GET /api/v1/search/movie?query=...` or `/api/v1/search/tv?query=...`
2. Use TMDB/TVDB ID for exact matches

## Connection Issues

### "ECONNREFUSED" or timeout
**Cause:** Overseerr not running or wrong port

**Solution:**
1. Check service: `curl http://localhost:5055/api/v1/status`
2. Verify port in config (default: 5055)
3. Check Docker logs: `docker logs overseerr`

### Slow API responses
**Cause:** Large library or TMDB rate limiting

**Solution:**
1. Use pagination: `?take=20&skip=0`
2. Reduce page size
3. Cache responses client-side
4. Check TMDB API rate limits

## Webhook Issues

### Webhooks not firing
**Cause:** Webhook URL not configured or unreachable

**Solution:**
1. Settings → Notifications → Webhooks
2. Test webhook URL manually
3. Check Overseerr logs for webhook errors
4. Verify webhook payload format matches your endpoint

## Data Issues

### Missing media information
**Cause:** TMDB data incomplete or not synced

**Solution:**
1. Refresh metadata: Delete and re-add media
2. Wait for TMDB to update (can take 24 hours)
3. Check TMDB directly for data availability

### User count mismatch
**Cause:** Plex users not synced

**Solution:**
1. Settings → Plex → Sync Libraries
2. Wait for sync to complete
3. Check Plex server is reachable

## Known Limitations

- **Rate Limiting:** TMDB API has rate limits (40 requests/10 seconds)
- **Plex Required:** First user must authenticate with Plex
- **4K Requests:** Require separate Sonarr/Radarr instances
- **Webhook Retries:** No automatic retry on failure
- **Bulk Operations:** No native bulk request API (use loops)

## Version-Specific Issues

### v1.33.2+ Breaking Changes
- API endpoint paths changed from `/api/v1` (check server version)
- Some response formats updated (check schema)

### Plex Authentication Changes
- After v1.30.0, cookie-based auth stricter
- Use API key for automation (Settings → General → API Key)

## Debug Mode

Enable debug logging for detailed error information:

1. Stop Overseerr
2. Set environment: `LOG_LEVEL=debug`
3. Restart Overseerr
4. Check logs: `/app/config/logs/overseerr.log`

## Common Error Messages

| Error | Cause | Solution |
|-------|-------|----------|
| "Media already requested" | Duplicate request | Check existing requests first |
| "Invalid media ID" | Wrong TMDB/TVDB ID | Verify ID from search results |
| "No Sonarr server configured" | Missing integration | Add Sonarr in Settings → Services |
| "Quota exceeded" | User request limit | Increase quota in user settings |
