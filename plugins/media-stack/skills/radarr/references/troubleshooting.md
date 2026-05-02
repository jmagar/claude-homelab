# Radarr API Troubleshooting

## Authentication Issues

### "401 Unauthorized"
**Cause:** Invalid or missing API key

**Solution:**
1. Get API key from Settings → General → Security → API Key
2. Add to `~/.claude-homelab/.env`: `RADARR_API_KEY="<your_api_key>"`
3. Verify key in request: `curl -v "$RADARR_URL/api/v3/system/status" -H "X-Api-Key: $KEY"`
4. Check for extra spaces or characters in key
5. Ensure header name is `X-Api-Key` (case-sensitive)

### "403 Forbidden"
**Cause:** API endpoint disabled or restricted

**Solution:**
1. Settings → General → Security → Authentication
2. Ensure "Authentication" is not set to "Disabled"
3. Check if API access is restricted by IP address
4. Verify Radarr is not in read-only mode

## Connection Issues

### "ECONNREFUSED" or timeout
**Cause:** Radarr not running or wrong port

**Solution:**
1. Check service: `curl http://localhost:7878/api/v3/system/status`
2. Verify port in Settings → General → Port (default: 7878)
3. Check Docker logs: `docker logs radarr`
4. Verify URL base if configured: `/api/v3` becomes `/<urlbase>/api/v3`

### "SSL certificate problem"
**Cause:** Invalid or self-signed SSL certificate

**Solution:**
1. Use `-k` flag for testing: `curl -k https://...`
2. Install proper SSL certificate or use HTTP for local testing
3. Add certificate to system trust store

## Movie Management Issues

### "404 Not Found" when adding movie
**Cause:** Invalid TMDB ID or movie slug

**Solution:**
1. Search first: `GET /api/v3/movie/lookup?term=...`
2. Use exact `tmdbId` and `titleSlug` from search results
3. Verify movie exists on TMDB

### "400 Bad Request" when adding movie
**Cause:** Missing required fields or invalid path

**Solution:**
1. Required fields: `title`, `qualityProfileId`, `titleSlug`, `tmdbId`, `path`, `monitored`
2. Ensure path doesn't already exist
3. Verify quality profile ID exists: `GET /api/v3/qualityprofile`
4. Check root folder is configured: `GET /api/v3/rootfolder`

### Movie added but not searching
**Cause:** Search disabled in add options

**Solution:**
1. Include in add request:
   ```json
   "addOptions": {
     "searchForMovie": true
   }
   ```
2. Or manually trigger search: `POST /api/v3/command` with `{"name": "MoviesSearch", "movieIds": [1]}`

### Cannot delete movie
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
1. Test manual search: `GET /api/v3/release?movieId=...`
2. Check quality profile cutoff settings
3. Verify indexers support movies (some are TV-only)
4. Check indexer rate limits
5. Wait for release to be available (check release date)

### Queue items stuck in "Downloading"
**Cause:** Download client communication issue

**Solution:**
1. Check download client status: `GET /api/v3/downloadclient`
2. Test download client connection manually
3. Verify credentials and API keys
4. Check download client logs
5. Remove stuck item: `DELETE /api/v3/queue/{id}?removeFromClient=true`

## Import Issues

### Movies not importing
**Cause:** File naming or permission issues

**Solution:**
1. Check history for import failures: `GET /api/v3/history?eventType=downloadFailed`
2. Verify file naming matches expected pattern: Settings → Media Management → Movie Naming
3. Check file permissions (Docker: ensure PUID/PGID match)
4. Review failed imports: `GET /api/v3/queue?includeUnknownMovieItems=true`

### Wrong movie imported
**Cause:** Filename parsing error or TMDB mismatch

**Solution:**
1. Use proper naming: `Movie Title (Year).ext`
2. Include year in filename for disambiguation
3. Manually match via UI if API search fails
4. Check TMDB for alternate titles

## Calendar Issues

### Calendar shows wrong release dates
**Cause:** Regional release date differences

**Solution:**
1. Settings → UI → First Day of Week (for calendar display)
2. Use `physicalRelease` or `digitalRelease` fields instead of `inCinemas`
3. TMDB data may vary by region

### Missing movies from calendar
**Cause:** Movies not monitored or no release date set

**Solution:**
1. Verify movie monitored: `GET /api/v3/movie/{id}` check `monitored: true`
2. Check if release date exists in TMDB
3. Refresh movie metadata: `POST /api/v3/command` with `{"name": "RefreshMovie", "movieId": 1}`

## Collection Issues

### Collections not syncing
**Cause:** TMDB API rate limits or network issues

**Solution:**
1. Refresh collections: `POST /api/v3/command` with `{"name": "RefreshCollections"}`
2. Check TMDB API status
3. Wait and retry (collections sync periodically)

### Movies not added to collection automatically
**Cause:** Collection monitoring disabled

**Solution:**
1. Enable collection monitoring: `PUT /api/v3/collection/{id}` with `{"monitored": true, "searchOnAdd": true}`
2. Manually add missing movies from collection details

## Import List Issues

### Import lists not syncing
**Cause:** List URL unreachable or API credentials invalid

**Solution:**
1. Test list URL manually
2. Verify credentials if required
3. Check list format matches Radarr expectations
4. Enable import list: `GET /api/v3/importlist` check `enabled: true`
5. Trigger manual sync: `POST /api/v3/command` with `{"name": "ImportListSync"}`

### Duplicate movies from import lists
**Cause:** Movie already exists in library

**Solution:**
1. This is expected behavior (Radarr won't add duplicates)
2. Check for alternate titles or different TMDB IDs
3. Use exclusions if needed: Settings → Import Lists → Exclusions

## Performance Issues

### Slow API responses
**Cause:** Large library or resource constraints

**Solution:**
1. Use pagination: `?page=1&pageSize=50`
2. Filter requests by ID
3. Increase memory allocation (Docker: `--memory 1g`)
4. Disable unused indexers
5. Reduce RSS sync interval

### Database locked errors
**Cause:** SQLite concurrency limits

**Solution:**
1. Backup database first
2. Restart Radarr
3. Check disk I/O (slow disks cause locks)
4. Reduce concurrent operations
5. Consider database migration to PostgreSQL (v5+)

## Metadata Issues

### Missing posters or artwork
**Cause:** TMDB or metadata provider issues

**Solution:**
1. Refresh metadata: `POST /api/v3/command` with `{"name": "RefreshMovie"}`
2. Clear metadata cache: Settings → General → Clear Metadata Cache
3. Check TMDB for image availability
4. Wait 24 hours for metadata sync

### Wrong movie information
**Cause:** TMDB data incorrect or stale

**Solution:**
1. Report to TMDB if data is wrong
2. Refresh movie: `POST /api/v3/command` with `{"name": "RefreshMovie", "movieId": 1}`
3. Re-add movie if persistent
4. Check for alternate TMDB entries

## Known Limitations

- **TMDB Required:** Cannot add movies without valid TMDB ID
- **No Bulk Add API:** Must add movies one at a time (use loops)
- **Quality Cutoff:** Once met, won't upgrade unless forced
- **Deleted Movies:** History retained even after movie deletion
- **4K/HDR:** Requires separate quality profiles and instances for different versions

## Version-Specific Issues

### v3 vs v5 API Differences
- v5 uses same `/api/v3` endpoint (confusing but true)
- v5 adds improved collection support
- v5 includes custom format scoring
- Check version: `GET /api/v3/system/status` returns `version` field

### Migration from v2 API
- v2 API deprecated, use v3
- Update all scripts to `/api/v3` endpoints
- Response formats mostly compatible but validate

## Debug Mode

Enable debug logging for detailed error information:

1. Settings → General → Log Level → Debug (or Trace for verbose)
2. Restart Radarr
3. Check logs: `/config/logs/radarr.txt` (Docker) or UI → System → Logs
4. Filter by component: `API` for API-specific logs

## Common Error Messages

| Error | Cause | Solution |
|-------|-------|----------|
| "Movie already exists" | Duplicate movie | Check existing movies first |
| "Quality profile does not exist" | Invalid profile ID | Get valid IDs from `/api/v3/qualityprofile` |
| "Root folder does not exist" | Invalid path | Configure root folders in Settings |
| "Unable to add, path already configured" | Duplicate path | Use different path or delete existing |
| "Indexer not available" | Indexer down/disabled | Check indexer status and connection |
| "Download client not available" | Client down/misconfigured | Verify download client settings |
| "Movie not found" | Invalid movie ID | Get movie ID from `/api/v3/movie` |
| "Movie has not been released yet" | Release date in future | Wait for release or check date |
