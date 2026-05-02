# qBittorrent API Troubleshooting

## Authentication Issues

### "Fails" response when logging in
**Cause:** Invalid credentials or authentication disabled

**Solution:**
1. Verify username and password
2. Check qBittorrent Web UI → Tools → Options → Web UI → Authentication
3. Ensure "Bypass authentication for clients on localhost" is disabled if testing remotely
4. Try logging in via browser first to verify credentials

### Cookie not being saved
**Cause:** Incorrect curl syntax or permission issues

**Solution:**
1. Ensure cookie file path is writable: `-c /tmp/qb-cookie.txt`
2. Check file permissions: `ls -la /tmp/qb-cookie.txt`
3. Use absolute path for cookie file
4. Verify curl is saving cookies: `cat /tmp/qb-cookie.txt`

### "Forbidden" (403) after login
**Cause:** CSRF protection or invalid session

**Solution:**
1. Re-login to get fresh cookie
2. Ensure cookie is included in request: `-b /tmp/qb-cookie.txt`
3. Some operations require referer header (rare)
4. Check qBittorrent logs for CSRF errors

### Session expires quickly
**Cause:** Short session timeout

**Solution:**
1. Web UI → Tools → Options → Web UI → Session timeout
2. Increase timeout or disable it
3. Re-authenticate before long-running operations
4. Use `keepalive` endpoint if available in your version

## Connection Issues

### "Connection refused" or timeout
**Cause:** qBittorrent Web UI not running or wrong port

**Solution:**
1. Check service: `curl http://localhost:8080/api/v2/app/version`
2. Verify port in Web UI settings (default: 8080)
3. Check Docker logs: `docker logs qbittorrent`
4. Ensure Web UI is enabled: Tools → Options → Web UI → Enable Web UI

### "No route to host"
**Cause:** Firewall or network issue

**Solution:**
1. Check firewall rules
2. Verify Docker network if using containers
3. Test connectivity: `telnet localhost 8080`
4. Ensure qBittorrent is binding to correct interface (0.0.0.0 for all)

### SSL/HTTPS issues
**Cause:** Self-signed certificate or SSL configuration

**Solution:**
1. Use `-k` flag for testing: `curl -k https://...`
2. Install proper SSL certificate
3. Or disable SSL in Web UI settings for local testing
4. Check certificate file paths in qBittorrent settings

## Torrent Management Issues

### Torrent not being added
**Cause:** Invalid magnet link, file path, or permissions

**Solution:**
1. Verify magnet link is valid
2. Check save path exists and is writable
3. Ensure qBittorrent has permission to write to save path (PUID/PGID in Docker)
4. Check qBittorrent logs for errors
5. Verify disk space available

### "Invalid torrent file" error
**Cause:** Corrupted torrent file or wrong format

**Solution:**
1. Re-download torrent file
2. Verify file is not HTML error page
3. Check file size (should be small, <100KB typically)
4. Test torrent file in qBittorrent UI first

### Cannot delete torrent
**Cause:** Locked files or permission issues

**Solution:**
1. Check if files are in use by another process
2. Verify file permissions
3. Try deleting without files first: `deleteFiles=false`
4. Stop torrent before deleting
5. Check Docker volume mounts

### Torrent stuck in "Checking..."
**Cause:** Large torrent or slow disk I/O

**Solution:**
1. This is normal for large torrents
2. Wait for check to complete
3. Speed up by increasing disk cache: Tools → Options → Advanced → Disk cache
4. Stop/start torrent to reset check

### Wrong save path used
**Cause:** Category path or default path mismatch

**Solution:**
1. Check category save path: `GET /api/v2/torrents/categories`
2. Verify default save path: `GET /api/v2/app/preferences` → `save_path`
3. Specify save path when adding torrent: `-F "savepath=/downloads"`
4. Update category path: `POST /api/v2/torrents/createCategory`

## Transfer Issues

### Speed limits not applying
**Cause:** Multiple limit sources or global override

**Solution:**
1. Check global limits: `GET /api/v2/transfer/downloadLimit`
2. Check per-torrent limits: `GET /api/v2/torrents/properties`
3. Verify alternative speed limits not active
4. Check scheduler settings: Tools → Options → Speed → Schedule

### Download/upload speed is zero
**Cause:** Network issues or torrent problem

**Solution:**
1. Check if torrent has seeds/peers
2. Verify firewall allows BitTorrent traffic
3. Test with well-seeded torrent (Ubuntu ISO)
4. Check connection status in qBittorrent
5. Verify port forwarding if behind NAT

### Cannot set speed limits
**Cause:** Value out of range or wrong units

**Solution:**
1. Limits are in bytes/second (not KB/s or MB/s)
2. Calculate: 1 MB/s = 1048576 bytes/s
3. Use 0 for unlimited
4. Check response for error messages

## Category/Tag Issues

### Category not being created
**Cause:** Invalid path or duplicate name

**Solution:**
1. Ensure category name is unique
2. Verify save path is valid and writable
3. Check for special characters in category name
4. Path must be absolute, not relative

### Tags not showing up
**Cause:** Tags feature not enabled or version issue

**Solution:**
1. Tags supported in qBittorrent 4.2+
2. Check version: `GET /api/v2/app/version`
3. Ensure tags are comma-separated when adding
4. Refresh torrent list

## API Version Issues

### Endpoint returns 404
**Cause:** Endpoint not available in your qBittorrent version

**Solution:**
1. Check API version: `GET /api/v2/app/webapiVersion`
2. Check qBittorrent version: `GET /api/v2/app/version`
3. Update qBittorrent if needed
4. Consult official API docs for version compatibility

### Response format different than expected
**Cause:** API version mismatch

**Solution:**
1. Verify API version matches documentation
2. Some endpoints changed between versions
3. Check official changelog for breaking changes
4. Update scripts to match current API version

## RSS Issues

### RSS feeds not updating
**Cause:** Feed URL down or refresh interval too long

**Solution:**
1. Test feed URL manually
2. Check refresh interval: Tools → Options → RSS → Refresh interval
3. Manually refresh: `POST /api/v2/rss/refreshItem`
4. Check RSS log for errors

### RSS auto-download not working
**Cause:** Rules misconfigured or disabled

**Solution:**
1. Verify RSS rules: `GET /api/v2/rss/rules`
2. Check rule patterns match feed items
3. Ensure auto-downloading is enabled in rule
4. Test rule manually via Web UI

## Performance Issues

### API responses slow
**Cause:** Large torrent list or disk I/O

**Solution:**
1. Use filters to reduce response size: `?filter=active`
2. Limit torrent count in qBittorrent
3. Increase memory allocation (Docker)
4. Use SSD for qBittorrent data directory

### High memory usage
**Cause:** Too many torrents or large disk cache

**Solution:**
1. Reduce number of active torrents
2. Decrease disk cache size: Tools → Options → Advanced
3. Limit connections: Tools → Options → Connection
4. Restart qBittorrent periodically

## Known Limitations

- **No Bulk Operations:** Most operations require individual torrent hashes
- **Cookie-Based Auth:** Must maintain session cookie (no API key)
- **Hash Required:** Need torrent hash for most operations (get from list first)
- **Limited Search:** No built-in torrent search via API (use Prowlarr/Jackett)
- **No Streaming:** API doesn't support file streaming (use Web UI or file access)

## Version-Specific Issues

### qBittorrent 4.1.x
- Limited API features
- No tags support
- Upgrade recommended

### qBittorrent 4.2.x+
- Full API v2 support
- Tags support added
- Improved performance

### qBittorrent 4.3.x+
- Enhanced RSS features
- Better category management
- Additional endpoints

## Debug Mode

Enable debug logging:

1. Tools → Options → Advanced → Log file
2. Enable logging
3. Set log level to "Info" or "Debug"
4. Check logs: `~/.local/share/qBittorrent/logs/` (Linux) or container logs

## Common Error Messages

| Error | Cause | Solution |
|-------|-------|----------|
| "Fails" | Authentication failed | Verify credentials |
| "Forbidden" | No valid session | Re-login to get cookie |
| "Invalid hash" | Torrent hash wrong/missing | Get hash from torrent list |
| "Torrent file is not valid" | Corrupted torrent | Re-download torrent file |
| "Failed to add torrent" | Save path issue | Check path permissions |
| "Category does not exist" | Category not created | Create category first |
| "Invalid request" | Malformed API call | Check endpoint syntax |
| "Not found" | Endpoint doesn't exist | Verify API version compatibility |
