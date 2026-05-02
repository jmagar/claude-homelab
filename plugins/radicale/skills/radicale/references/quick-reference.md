# Radicale Quick Reference

Quick command examples for common operations with the Radicale CalDAV/CardDAV skill.

## Setup

### Install Dependencies

```bash
pip install caldav vobject icalendar
```

### Configure Credentials

Add to `~/.claude-homelab/.env`:

```bash
RADICALE_URL="http://localhost:5232"
RADICALE_USERNAME="admin"
RADICALE_PASSWORD="password"
```

## Calendar Operations

### List All Calendars

```bash
python scripts/radicale-api.py calendars list
```

**Output:**
```json
[
  {
    "name": "Personal",
    "url": "http://localhost:5232/admin/personal/",
    "id": "personal"
  },
  {
    "name": "Work",
    "url": "http://localhost:5232/admin/work/",
    "id": "work"
  }
]
```

### View Events This Week

```bash
python scripts/radicale-api.py events list \
  --calendar "Personal" \
  --start "2026-02-08" \
  --end "2026-02-15"
```

**Output:**
```json
[
  {
    "uid": "abc-123-def",
    "summary": "Team Meeting",
    "description": "Weekly sync",
    "location": "Conference Room",
    "start": "2026-02-10T14:00:00",
    "end": "2026-02-10T15:00:00",
    "created": "2026-02-01T10:00:00",
    "last_modified": "2026-02-01T10:00:00"
  }
]
```

### Create Event

```bash
python scripts/radicale-api.py events create \
  --calendar "Personal" \
  --title "Billy Strings Concert" \
  --start "2026-02-07T19:00:00" \
  --end "2026-02-07T23:00:00" \
  --location "Athens, GA" \
  --description "Billy Strings live at Georgia Theatre"
```

**Output:**
```json
{
  "status": "created",
  "title": "Billy Strings Concert",
  "start": "2026-02-07T19:00:00",
  "end": "2026-02-07T23:00:00"
}
```

### Delete Event

First, list events to get the UID:

```bash
python scripts/radicale-api.py events list --calendar "Personal"
```

Then delete by UID:

```bash
python scripts/radicale-api.py events delete \
  --calendar "Personal" \
  --uid "abc-123-def"
```

**Output:**
```json
{
  "status": "deleted",
  "uid": "abc-123-def"
}
```

## Contact Operations

### List All Addressbooks

```bash
python scripts/radicale-api.py contacts addressbooks
```

**Output:**
```json
[
  {
    "name": "Contacts",
    "url": "http://localhost:5232/admin/contacts/",
    "id": "contacts"
  }
]
```

### List All Contacts

```bash
python scripts/radicale-api.py contacts list --addressbook "Contacts"
```

**Output:**
```json
[
  {
    "uid": "xyz-789-abc",
    "name": "David Ryan",
    "email": "david.ryan@example.com",
    "phone": "+1-555-1234"
  },
  {
    "uid": "def-456-ghi",
    "name": "Sarah Johnson",
    "email": "sarah.j@example.com",
    "phone": "+1-555-5678"
  }
]
```

### Search Contacts

```bash
python scripts/radicale-api.py contacts search \
  --addressbook "Contacts" \
  --query "David"
```

**Output:**
```json
[
  {
    "uid": "xyz-789-abc",
    "name": "David Ryan",
    "email": "david.ryan@example.com",
    "phone": "+1-555-1234"
  }
]
```

### Create Contact

```bash
python scripts/radicale-api.py contacts create \
  --addressbook "Contacts" \
  --name "John Doe" \
  --email "john.doe@example.com" \
  --phone "+1-555-9999"
```

**Output:**
```json
{
  "status": "created",
  "name": "John Doe",
  "email": "john.doe@example.com",
  "phone": "+1-555-9999"
}
```

### Delete Contact

First, search to get the UID:

```bash
python scripts/radicale-api.py contacts search \
  --addressbook "Contacts" \
  --query "John Doe"
```

Then delete by UID:

```bash
python scripts/radicale-api.py contacts delete \
  --addressbook "Contacts" \
  --uid "xyz-789-abc"
```

**Output:**
```json
{
  "status": "deleted",
  "uid": "xyz-789-abc"
}
```

## Common Workflows

### View Calendar This Week

```bash
# Get current date range
START=$(date +%Y-%m-%d)
END=$(date -d '+7 days' +%Y-%m-%d)

# List events
python scripts/radicale-api.py events list \
  --calendar "Personal" \
  --start "$START" \
  --end "$END"
```

### Find Contact Email

```bash
# Search by name
python scripts/radicale-api.py contacts search \
  --addressbook "Contacts" \
  --query "David Ryan" \
  | jq -r '.[0].email'
```

**Output:**
```
david.ryan@example.com
```

### Add Event with Natural Language

User request: "Add to my calendar Billy Strings in Athens, GA 02/07/2026 7PM EST"

Translated to command:

```bash
python scripts/radicale-api.py events create \
  --calendar "Personal" \
  --title "Billy Strings" \
  --start "2026-02-07T19:00:00" \
  --end "2026-02-07T23:00:00" \
  --location "Athens, GA"
```

## Date/Time Format Reference

**Date formats:**
- `YYYY-MM-DD` - e.g., `2026-02-07`
- `YYYY-MM-DDTHH:MM:SS` - e.g., `2026-02-07T19:00:00`

**Important:**
- All times are local to Radicale server timezone
- Use ISO 8601 format for consistency
- Event end time must be after start time

## JSON Output

All commands output JSON by default for easy parsing:

```bash
# Pretty print with jq
python scripts/radicale-api.py calendars list | jq .

# Extract specific field
python scripts/radicale-api.py contacts search \
  --addressbook "Contacts" \
  --query "David" \
  | jq -r '.[0].email'

# Count results
python scripts/radicale-api.py events list \
  --calendar "Personal" \
  | jq 'length'
```

## Error Codes

**Exit codes:**
- `0` - Success
- `1` - General error (connection failed, invalid arguments, etc.)

**Common errors:**
- `ERROR: .env file not found` - Create `.env` with credentials
- `ERROR: Failed to connect to Radicale` - Check URL and credentials
- `ERROR: Calendar 'X' not found` - Calendar name doesn't exist
- `ERROR: Addressbook 'X' not found` - Addressbook name doesn't exist
