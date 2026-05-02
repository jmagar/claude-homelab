# Radicale Troubleshooting Guide

Common issues and solutions when working with the Radicale CalDAV/CardDAV skill.

## Installation Issues

### Missing Python Libraries

**Error:**
```
ERROR: Required libraries not installed
Install with: pip install caldav vobject icalendar
```

**Solution:**
```bash
pip install caldav vobject icalendar
```

**Verify installation:**
```bash
python3 -c "import caldav, vobject, icalendar; print('All libraries installed')"
```

### Import Errors (Pyright/Type Checkers)

**Warnings:**
```
Import "caldav" could not be resolved
Import "vobject" could not be resolved from source
```

**Cause:** Libraries not installed in current Python environment

**Solution:**
1. Install libraries: `pip install caldav vobject icalendar`
2. Verify Python path: `which python3`
3. Check virtual environment if using one: `source venv/bin/activate`

## Connection Issues

### Cannot Connect to Radicale

**Error:**
```
ERROR: Failed to connect to Radicale: Connection refused
```

**Causes & Solutions:**

1. **Radicale not running:**
   ```bash
   # Check if Radicale is running
   docker ps | grep radicale
   # Or check systemctl
   systemctl status radicale
   ```

2. **Wrong URL:**
   ```bash
   # Verify URL in .env
   grep RADICALE_URL ~/.env ~/.claude-homelab/.env

   # Test connection manually
   curl http://localhost:5232
   ```

3. **Port conflict:**
   ```bash
   # Check what's listening on port 5232
   ss -tuln | grep 5232
   lsof -i :5232
   ```

### Authentication Failed

**Error:**
```
ERROR: Authentication failed - check username/password
caldav.lib.error.AuthorizationError
```

**Solutions:**

1. **Verify credentials in .env:**
   ```bash
   cat ~/.claude-homelab/.env | grep RADICALE
   ```

2. **Test credentials manually:**
   ```bash
   curl -u admin:password http://localhost:5232/.web/
   ```

3. **Check Radicale users file:**
   ```bash
   # Location depends on Radicale config
   cat /path/to/radicale/users
   ```

4. **Reset password (if needed):**
   ```bash
   # Using htpasswd for Radicale
   htpasswd -c /path/to/radicale/users admin
   ```

### .env File Not Found

**Error:**
```
ERROR: .env file not found at /home/user/.claude-homelab/.env
```

**Solution:**
```bash
# Create .env file
cat > ~/.claude-homelab/.env <<EOF
RADICALE_URL="http://localhost:5232"
RADICALE_USERNAME="admin"
RADICALE_PASSWORD="<your_password>"
EOF

# Set permissions
chmod 600 ~/.claude-homelab/.env
```

## Calendar Issues

### Calendar Not Found

**Error:**
```
ERROR: Calendar 'Personal' not found
```

**Solutions:**

1. **List available calendars:**
   ```bash
   python scripts/radicale-api.py calendars list
   ```

2. **Calendar name is case-sensitive:**
   ```bash
   # Wrong: --calendar "personal"
   # Correct: --calendar "Personal"
   ```

3. **Create calendar if it doesn't exist:**
   - Use Radicale web interface: `http://localhost:5232/.web/`
   - Or create via Python caldav library (see `caldav-library.md`)

### No Events Returned

**Issue:** Events exist but `events list` returns empty array

**Causes:**

1. **Date range doesn't include events:**
   ```bash
   # Check wider date range
   python scripts/radicale-api.py events list \
     --calendar "Personal" \
     --start "2026-01-01" \
     --end "2026-12-31"
   ```

2. **Events in different calendar:**
   ```bash
   # List all calendars
   python scripts/radicale-api.py calendars list

   # Check each calendar
   python scripts/radicale-api.py events list --calendar "Work"
   ```

### Event Creation Fails

**Error:**
```
Failed to create event
```

**Common causes:**

1. **Invalid datetime format:**
   ```bash
   # Wrong: --start "02/07/2026 7PM"
   # Correct: --start "2026-02-07T19:00:00"
   ```

2. **End time before start time:**
   ```bash
   # End must be after start
   --start "2026-02-07T19:00:00" \
   --end "2026-02-07T21:00:00"
   ```

3. **Missing required fields:**
   ```bash
   # Required: --calendar, --title, --start, --end
   python scripts/radicale-api.py events create \
     --calendar "Personal" \
     --title "Event" \
     --start "2026-02-07T19:00:00" \
     --end "2026-02-07T21:00:00"
   ```

## Contact Issues

### Addressbook Not Found

**Error:**
```
ERROR: Addressbook 'Contacts' not found
```

**Solutions:**

1. **List available addressbooks:**
   ```bash
   python scripts/radicale-api.py contacts addressbooks
   ```

2. **Create addressbook:**
   - Use Radicale web interface: `http://localhost:5232/.web/`
   - CardDAV addressbooks must be created through the web interface

### Contact Search Returns Nothing

**Issue:** Known contacts not found in search

**Solutions:**

1. **Search is case-insensitive substring match:**
   ```bash
   # All these should work for "David Ryan":
   --query "david"
   --query "David"
   --query "ryan"
   --query "david ryan"
   ```

2. **List all contacts to verify:**
   ```bash
   python scripts/radicale-api.py contacts list \
     --addressbook "Contacts"
   ```

3. **Check email field too:**
   ```bash
   # Search matches both name and email
   --query "example.com"
   ```

## Permission Issues

### Permission Denied on Script

**Error:**
```
bash: ./scripts/radicale-api.py: Permission denied
```

**Solution:**
```bash
chmod +x /home/jmagar/claude-homelab/skills/radicale/scripts/radicale-api.py
```

### .env File Permissions

**Security warning:** .env file should not be world-readable

**Solution:**
```bash
chmod 600 ~/.claude-homelab/.env
```

## Data Format Issues

### Invalid Date Format

**Error:**
```
ValueError: Invalid isoformat string
```

**Solution:** Use ISO 8601 format

**Correct formats:**
- Date only: `2026-02-07`
- Date with time: `2026-02-07T19:00:00`
- With timezone: `2026-02-07T19:00:00-05:00`

**Wrong formats:**
- `02/07/2026`
- `Feb 7, 2026`
- `2026-2-7` (missing leading zeros)

### Special Characters in Names

**Issue:** Contact names or event titles with special characters

**Solution:** Shell escaping

```bash
# Use quotes
--title "Meeting: Q1 Review"
--name "O'Brien, John"

# Or escape special characters
--title Meeting:\ Q1\ Review
```

## Performance Issues

### Slow Calendar/Contact Listing

**Cause:** Large number of events or contacts

**Solutions:**

1. **Use date ranges for events:**
   ```bash
   # Don't fetch all events
   # Instead, use specific date range
   --start "2026-02-01" --end "2026-02-28"
   ```

2. **Search instead of listing:**
   ```bash
   # Instead of listing all contacts
   python scripts/radicale-api.py contacts search \
     --addressbook "Contacts" \
     --query "david"
   ```

3. **Check network latency:**
   ```bash
   # Test connection speed
   time curl http://localhost:5232
   ```

## Debugging

### Enable Debug Output

Add debug logging to script:

```python
import logging
logging.basicConfig(level=logging.DEBUG)
```

### Test Connection Manually

```bash
# Test HTTP connection
curl -v -u admin:password http://localhost:5232/

# Test CalDAV PROPFIND
curl -X PROPFIND \
  -u admin:password \
  -H "Depth: 0" \
  http://localhost:5232/admin/
```

### Check Radicale Logs

```bash
# Docker logs
docker logs radicale

# Systemd logs
journalctl -u radicale -f

# File logs (depends on config)
tail -f /var/log/radicale/radicale.log
```

## Getting Help

If issues persist:

1. **Check Radicale documentation:** https://radicale.org/v3.html
2. **Check caldav library docs:** https://caldav.readthedocs.io/
3. **Query embedded RFC documentation:**
   ```bash
   cd /home/jmagar/claude-homelab/skills/firecrawl
   firecrawl query "CalDAV authentication error 401"
   ```

4. **Review protocol RFCs:**
   - RFC 4791 (CalDAV): https://www.rfc-editor.org/rfc/rfc4791
   - RFC 6352 (CardDAV): https://www.rfc-editor.org/rfc/rfc6352
