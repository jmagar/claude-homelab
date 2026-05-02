# Sonarr API Troubleshooting

## Authentication Issues

### "401 Unauthorized"
**Cause:** Invalid or missing API key

**Solution:**
1. Get API key from Settings → General → Security → API Key
2. Add to `~/.claude-homelab/.env`: `SONARR_API_KEY="<your_api_key>"`
3. Verify key in request: `curl -v "$SONARR_URL/api/v3/system/status" -H "X-Api-Key: $KEY"`
4. Check for extra spaces or characters in key
5. Ensure header name is `X-Api-Key` (case-sensitive)

### "403 Forbidden"
**Cause:** API endpoint disabled or restricted

**Solution:**
1. Settings → General → Security → Authentication
2. Ensure "Authentication" is not set to "Disabled"
3. Check if API access is restricted by IP address
4. Verify Sonarr is not in read-only mode

## Connection Issues

### "ECONNREFUSED" or timeout
**Cause:** Sonarr not running or wrong port

**Solution:**
1. Check service: `curl http://localhost:8989/api/v3/system/status`
2. Verify port in Settings → General → Port (default: 8989)
3. Check Docker logs: `docker logs sonarr`
4. Verify URL base if configured: `/api/v3` becomes `/<urlbase>/api/v3`

### "SSL certificate problem"
**Cause:** Invalid or self-signed SSL certificate

**Solution:**
1. Use `-k` flag for testing: `curl -k https://...`
2. Install proper SSL certificate or use HTTP for local testing
3. Add certificate to system trust store

## Series Management Issues

### "404 Not Found" when adding series
**Cause:** Invalid TVDB ID or series slug

**Solution:**
1. Search first: `GET /api/v3/series/lookup?term=...`
2. Use exact `tvdbId` and `titleSlug` from search results
3. Verify series exists on TheTVDB

### "400 Bad Request" when adding series
**Cause:** Missing required fields or invalid path

**Solution:**
1. Required fields: `title`, `qualityProfileId`, `titleSlug`, `tvdbId`, `path`, `monitored`, `seasonFolder`
2. Ensure path doesn't already exist
3. Verify quality profile ID exists: `GET /api/v3/qualityprofile`
4. Check root folder is configured: `GET /api/v3/rootfolder`

### Series added but not searching
**Cause:** Search disabled in add options

**Solution:**
1. Include in add request:
   ```json
   "addOptions": {
     "searchForMissingEpisodes": true
   }
   ```
2. Or manually trigger search: `POST /api/v3/command` with `{"name": "SeriesSearch", "seriesId": 1}`

### Cannot delete series
**Cause:** Permission issues or locked files

**Solution:**
1. Check file system permissions
2. Use `deleteFiles=true` parameter if needed
3. Stop any active downloads first
4. Check Docker volume mounts if using containers

## Download Issues

### Downloads not starting
**Cause:** No indexers configured or connection issues

**Solution:**
1. Verify indexers: Settings → Indexers (or `GET /api/v3/indexer`)
2. Test indexer connections
3. Check Prowlarr sync if using it
4. Verify download client is configured: `GET /api/v3/downloadclient`

### "No results found" when searching
**Cause:** Indexers not returning results or quality requirements too strict

**Solution:**
1. Test manual search: `GET /api/v3/release?episodeId=...`
2. Check quality profile cutoff settings
3. Verify indexers support the series (some indexers specialize)
4. Check indexer rate limits
5. Use RSS sync for popular releases

### Queue items stuck in "Downloading"
**Cause:** Download client communication issue

**Solution:**
1. Check download client status: `GET /api/v3/downloadclient`
2. Test download client connection manually
3. Verify credentials and API keys
4. Check download client logs
5. Remove stuck item: `DELETE /api/v3/queue/{id}?removeFromClient=true`

## Episode Issues

### Episodes not importing
**Cause:** File naming or permission issues

**Solution:**
1. Check history for import failures: `GET /api/v3/history?eventType=downloadFailed`
2. Verify file naming matches expected pattern: Settings → Media Management → Episode Naming
3. Check file permissions (Docker: ensure PUID/PGID match)
4. Review failed imports: `GET /api/v3/queue?includeUnknownSeriesItems=true`

### Wrong episode imported
**Cause:** Scene numbering mismatch

**Solution:**
1. Enable scene numbering if needed: Series → Edit → Use Scene Numbering
2. Check TheTVDB for correct episode order
3. Manually match via UI if API search fails
4. Rename file to match expected pattern

## Calendar Issues

### Calendar shows duplicate episodes
**Cause:** Multiple releases of same episode

**Solution:**
1. This is normal - calendar shows air dates, not downloads
2. Filter by monitored status
3. Check episode file status: `hasFile` field

### Missing episodes from calendar
**Cause:** Series not monitored or episodes not monitored

**Solution:**
1. Verify series monitored: `GET /api/v3/series/{id}` check `monitored: true`
2. Check episode monitoring: `GET /api/v3/episode?seriesId={id}`
3. Refresh series metadata: `POST /api/v3/command` with `{"name": "RefreshSeries", "seriesId": 1}`

## Performance Issues

### Slow API responses
**Cause:** Large library or resource constraints

**Solution:**
1. Use pagination: `?page=1&pageSize=50`
2. Filter requests by series: `?seriesId=1`
3. Increase memory allocation (Docker: `--memory 1g`)
4. Disable unused indexers
5. Reduce RSS sync interval

### Database locked errors
**Cause:** SQLite concurrency limits

**Solution:**
1. Backup database first
2. Restart Sonarr
3. Check disk I/O (slow disks cause locks)
4. Reduce concurrent operations
5. Consider database migration to PostgreSQL (v4+)

## Metadata Issues

### Missing posters or artwork
**Cause:** TheTVDB or metadata provider issues

**Solution:**
1. Refresh metadata: `POST /api/v3/command` with `{"name": "RefreshSeries"}`
2. Clear metadata cache: Settings → General → Clear Metadata Cache
3. Check TheTVDB for image availability
4. Wait 24 hours for metadata sync

### Wrong series information
**Cause:** TheTVDB data incorrect or stale

**Solution:**
1. Report to TheTVDB if data is wrong
2. Refresh series: `POST /api/v3/command` with `{"name": "RefreshSeries", "seriesId": 1}`
3. Re-add series if persistent
4. Check for alias/alternate naming

## Known Limitations

- **TheTVDB Required:** Cannot add series without valid TVDB ID
- **No Bulk Add API:** Must add series one at a time (use loops)
- **Scene Numbering:** May differ from TVDB numbering (use scene numbering toggle)
- **Quality Cutoff:** Once met, won't upgrade unless forced
- **Deleted Episodes:** History retained even after episode deletion

## Version-Specific Issues

### v3 vs v4 API Differences
- v4 uses same `/api/v3` endpoint (confusing but true)
- v4 adds PostgreSQL support (recommended for large libraries)
- v4 includes improved search algorithm
- Check version: `GET /api/v3/system/status` returns `version` field

### Migration from v2 API
- v2 API deprecated, use v3
- Update all scripts to `/api/v3` endpoints
- Response formats mostly compatible but validate

## Debug Mode

Enable debug logging for detailed error information:

1. Settings → General → Log Level → Debug (or Trace for verbose)
2. Restart Sonarr
3. Check logs: `/config/logs/sonarr.txt` (Docker) or UI → System → Logs
4. Filter by component: `API` for API-specific logs

## Common Error Messages

| Error | Cause | Solution |
|-------|-------|----------|
| "Series already exists" | Duplicate series | Check existing series first |
| "Quality profile does not exist" | Invalid profile ID | Get valid IDs from `/api/v3/qualityprofile` |
| "Root folder does not exist" | Invalid path | Configure root folders in Settings |
| "Unable to add, path already configured" | Duplicate path | Use different path or delete existing |
| "Indexer not available" | Indexer down/disabled | Check indexer status and connection |
| "Download client not available" | Client down/misconfigured | Verify download client settings |
| "Episode not found" | Invalid episode ID | Get episode ID from `/api/v3/episode` |
