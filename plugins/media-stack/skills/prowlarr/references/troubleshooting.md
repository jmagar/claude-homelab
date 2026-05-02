# Prowlarr API Troubleshooting

## Authentication Issues

### "401 Unauthorized"
**Cause:** Invalid or missing API key

**Solution:**
1. Get API key from Settings → General → Security → API Key
2. Verify key in request: `curl -v "$PROWLARR_URL/api/v1/system/status" -H "X-Api-Key: $KEY"`
3. Check for extra spaces or characters in key
4. Ensure header name is `X-Api-Key` (case-sensitive)

### "403 Forbidden"
**Cause:** API endpoint disabled or restricted

**Solution:**
1. Settings → General → Security → Authentication
2. Ensure "Authentication" is not set to "Disabled"
3. Check if API access is restricted by IP address

## Connection Issues

### "ECONNREFUSED" or timeout
**Cause:** Prowlarr not running or wrong port

**Solution:**
1. Check service: `curl http://localhost:9696/api/v1/system/status`
2. Verify port in Settings → General → Port (default: 9696)
3. Check Docker logs: `docker logs prowlarr`
4. Verify URL base if configured: `/api/v1` becomes `/<urlbase>/api/v1`

### "SSL certificate problem"
**Cause:** Invalid or self-signed SSL certificate

**Solution:**
1. Use `-k` flag for testing: `curl -k https://...`
2. Install proper SSL certificate or use HTTP for local testing
3. Add certificate to system trust store

## Indexer Issues

### "404 Not Found" when adding indexer
**Cause:** Invalid indexer implementation name

**Solution:**
1. Get valid implementations: `GET /api/v1/indexer/schema`
2. Use exact `implementation` and `implementationName` from schema
3. Check spelling and capitalization

### "400 Bad Request" when adding indexer
**Cause:** Missing required fields or invalid configuration

**Solution:**
1. Get schema for indexer: `GET /api/v1/indexer/schema`
2. Check required fields in schema
3. Verify `configContract` matches implementation
4. Ensure all required settings are provided

### Indexer added but not working
**Cause:** Configuration error or indexer down

**Solution:**
1. Test indexer: `POST /api/v1/indexer/test` with `{"id": indexer_id}`
2. Check indexer URL is accessible
3. Verify credentials if required (API keys, username/password)
4. Check indexer rate limits
5. Review Prowlarr logs: Settings → System → Logs

### Indexer test fails
**Cause:** Network connectivity or invalid credentials

**Solution:**
1. Test indexer URL manually (browser or curl)
2. Verify VPN/proxy settings if indexer requires them
3. Check DNS resolution
4. Verify credentials are correct
5. Ensure indexer supports Prowlarr's API calls

### Indexers not syncing to apps
**Cause:** Application not configured or sync disabled

**Solution:**
1. Verify apps configured: `GET /api/v1/applications`
2. Check app sync level: `fullSync` required for auto-sync
3. Manually trigger sync: `POST /api/v1/command` with `{"name": "ApplicationSync"}`
4. Test app connection: `POST /api/v1/applications/test`
5. Verify app API keys are correct

## Search Issues

### "No results" for searches
**Cause:** Indexers not configured or query issues

**Solution:**
1. Verify indexers are enabled: `GET /api/v1/indexer`
2. Test indexers individually with `?indexerIds=1`
3. Check indexer stats for failures: `GET /api/v1/indexerstats`
4. Try broader search terms
5. Verify indexers support the search type (movie/tv/music)

### Slow search responses
**Cause:** Multiple indexers timing out

**Solution:**
1. Disable slow/broken indexers
2. Reduce number of indexers queried
3. Check network connectivity
4. Review indexer stats: `GET /api/v1/indexerstats`
5. Increase timeout in Settings → Indexers → Indexer Timeout

### Search results missing seeders/peers
**Cause:** Indexer doesn't provide seeder data

**Solution:**
1. This is normal for some indexers
2. Use indexers that provide full metadata
3. Sort by other fields (size, publish date)

## Application Sync Issues

### Sonarr/Radarr not receiving indexers
**Cause:** Sync not configured or credentials wrong

**Solution:**
1. Verify application added: `GET /api/v1/applications`
2. Test application: `POST /api/v1/applications/test`
3. Check API keys match between Prowlarr and app
4. Ensure correct sync level: `fullSync` or `addOnly`
5. Manually sync: `POST /api/v1/command` with `{"name": "ApplicationSync"}`

### Indexers duplicated in Sonarr/Radarr
**Cause:** Manual indexers + Prowlarr sync

**Solution:**
1. Remove manual indexers from Sonarr/Radarr
2. Let Prowlarr manage all indexers via sync
3. Or disable Prowlarr sync and manage manually

### App sync removes indexers
**Cause:** Indexer disabled or deleted in Prowlarr

**Solution:**
1. Prowlarr sync removes disabled indexers from apps
2. Re-enable indexers in Prowlarr to restore in apps
3. Use `addOnly` sync level to prevent removals

## Download Client Issues

### Download client test fails
**Cause:** Connection or credential issues

**Solution:**
1. Verify download client is running
2. Check host/port are correct
3. Test credentials manually
4. Ensure download client API is enabled
5. Check network connectivity (Docker networks, etc.)

### Downloads not starting from Prowlarr
**Cause:** Prowlarr is search-only, not download manager

**Solution:**
1. Prowlarr provides search results to apps
2. Sonarr/Radarr handle actual downloads
3. Check download clients in Sonarr/Radarr, not Prowlarr
4. Prowlarr download clients are for manual downloads only

## Category Issues

### Wrong categories syncing to apps
**Cause:** Category mapping misconfigured

**Solution:**
1. Check application settings in Prowlarr
2. Verify `syncCategories` in application config
3. Standard categories:
   - Movies: 2000-2999
   - TV: 5000-5999
   - Music: 3000-3999
   - Books: 7000-7999
4. Update application: `PUT /api/v1/applications/{id}`

## Performance Issues

### High CPU usage
**Cause:** Too many indexers or frequent searches

**Solution:**
1. Disable unused indexers
2. Reduce RSS sync frequency
3. Increase search cache duration
4. Check for indexer failures causing retries

### Database locked errors
**Cause:** SQLite concurrency limits

**Solution:**
1. Backup database first
2. Restart Prowlarr
3. Reduce concurrent operations
4. Check disk I/O performance

## History Issues

### Missing history entries
**Cause:** History cleanup or database issue

**Solution:**
1. Check history retention settings
2. History only keeps recent entries
3. Review database logs for errors
4. Increase history retention if needed

## Notification Issues

### Notifications not working
**Cause:** Notification service misconfigured

**Solution:**
1. Test notification: `POST /api/v1/notification/test`
2. Verify notification service credentials
3. Check notification triggers are enabled
4. Review notification service logs

## Known Limitations

- **Search Only:** Prowlarr doesn't download content, only provides search results
- **Indexer-Specific:** Some indexers have unique requirements (VPN, credentials)
- **Rate Limits:** Many indexers have rate limits (respect them)
- **No Bulk Search:** Search one query at a time via API
- **Category Limits:** Not all indexers support all categories

## Version-Specific Issues

### v1 API (Current)
- API stable since v1.0
- Breaking changes announced in release notes
- Check version: `GET /api/v1/system/status` returns `version` field

### Indexer Definition Updates
- Indexers updated regularly via definitions
- Settings → System → Updates → Update Definitions
- Restart may be required after definition updates

## Debug Mode

Enable debug logging for detailed error information:

1. Settings → General → Log Level → Debug (or Trace for verbose)
2. Restart Prowlarr
3. Check logs: `/config/logs/prowlarr.txt` (Docker) or UI → System → Logs
4. Filter by component: `API` for API-specific logs

## Common Error Messages

| Error | Cause | Solution |
|-------|-------|----------|
| "Indexer already exists" | Duplicate indexer | Check existing indexers first |
| "Unable to connect to indexer" | Network/firewall issue | Verify connectivity and credentials |
| "Invalid API key for application" | Wrong app API key | Update API key in Prowlarr app config |
| "Application sync failed" | App unreachable | Test app connection and network |
| "Indexer returned no results" | Search query issue | Try different terms or check indexer |
| "Rate limit exceeded" | Too many requests | Wait and retry, reduce frequency |
| "Indexer is unavailable" | Indexer down | Disable indexer temporarily |
| "Invalid search type" | Indexer doesn't support type | Use compatible indexers only |
