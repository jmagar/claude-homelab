# Radicale CalDAV/CardDAV Management

Manage calendars and contacts on your self-hosted Radicale server using simple commands and natural language.

## What It Does

This skill lets you interact with your Radicale CalDAV/CardDAV server to:

- 📅 **Calendar Management**
  - List all your calendars
  - View upcoming events
  - Create new events with dates, times, locations
  - Search for events by title or date range
  - Delete events you no longer need

- 👥 **Contact Management**
  - List all your addressbooks
  - Search contacts by name, email, or phone
  - Add new contacts with full details
  - View contact information
  - Update or delete contacts

## Setup

### 1. Install Prerequisites

This skill requires Python 3.8+ and three Python libraries:

```bash
pip install caldav vobject icalendar
```

**What these do:**
- `caldav` - Implements CalDAV/CardDAV protocols (RFC 4791, RFC 6352)
- `vobject` - Parses and creates vCard/iCalendar data
- `icalendar` - Works with calendar event formats

### 2. Configure Credentials

Add your Radicale server credentials to `~/.claude-homelab/.env`:

```bash
# Radicale CalDAV/CardDAV Server
RADICALE_URL="http://localhost:5232"
RADICALE_USERNAME="your-username"
RADICALE_PASSWORD="your-password"
```

**Security Tips:**
- The `.env` file is automatically gitignored (never committed to version control)
- Set restrictive permissions: `chmod 600 ~/.claude-homelab/.env`
- Never share your `.env` file or commit it to git
- Use HTTPS in production: `RADICALE_URL="https://radicale.example.com"`

### 3. Make Script Executable (Optional)

For convenience, you can make the script executable:

```bash
chmod +x ~/claude-homelab/skills/radicale/scripts/radicale-api.py
```

Now you can run it as:
```bash
./scripts/radicale-api.py --help
```

Or always use Python explicitly:
```bash
python scripts/radicale-api.py --help
```

## Usage Examples

### Calendar Operations

#### List All Calendars

See what calendars you have:

```bash
python scripts/radicale-api.py calendars list
```

**Output:**
```json
{
  "calendars": [
    {
      "name": "Personal",
      "url": "http://localhost:5232/user/calendars/personal/"
    },
    {
      "name": "Work",
      "url": "http://localhost:5232/user/calendars/work/"
    }
  ]
}
```

#### View Events This Week

See what's on your calendar:

```bash
python scripts/radicale-api.py events list \
  --calendar "Personal" \
  --days 7
```

**Output:**
```json
{
  "events": [
    {
      "title": "Team Meeting",
      "start": "2026-02-10T14:00:00",
      "end": "2026-02-10T15:00:00",
      "location": "Conference Room A",
      "description": "Weekly team sync"
    }
  ]
}
```

#### Create a New Event

Add an event to your calendar:

```bash
python scripts/radicale-api.py events create \
  --calendar "Personal" \
  --title "Billy Strings Concert" \
  --start "2026-03-15T20:00:00" \
  --end "2026-03-15T23:00:00" \
  --location "Red Rocks Amphitheatre" \
  --description "Don't miss this amazing show!"
```

**Date/Time Format:**
- Use ISO 8601 format: `YYYY-MM-DDTHH:MM:SS`
- Example: `2026-03-15T20:00:00` = March 15, 2026 at 8:00 PM
- All times are in your local timezone

#### Search for Events

Find events by title:

```bash
python scripts/radicale-api.py events search \
  --calendar "Personal" \
  --query "meeting"
```

### Contact Operations

#### List All Addressbooks

See what addressbooks you have:

```bash
python scripts/radicale-api.py addressbooks list
```

#### Search Contacts

Find a contact by name:

```bash
python scripts/radicale-api.py contacts search \
  --addressbook "Contacts" \
  --query "david"
```

**Output:**
```json
{
  "contacts": [
    {
      "name": "David Ryan",
      "email": "david@example.com",
      "phone": "+1-555-0123"
    }
  ]
}
```

#### Add a New Contact

Create a contact with full details:

```bash
python scripts/radicale-api.py contacts create \
  --addressbook "Contacts" \
  --name "Jane Smith" \
  --email "jane@example.com" \
  --phone "+1-555-0199" \
  --organization "Acme Corp" \
  --title "Software Engineer"
```

**All contact fields are optional except name.**

## Natural Language with Claude

When using Claude Code, you can use natural language instead of commands:

**Examples:**
- "What's on my calendar this week?"
  - Claude will run: `events list --calendar "Personal" --days 7`

- "Add a meeting tomorrow at 2pm for 1 hour"
  - Claude will parse the date/time and create an event

- "Find David's email address"
  - Claude will search contacts for "David"

- "Schedule a dentist appointment on March 20th at 10am"
  - Claude will create an event with proper date/time formatting

- "Who is my contact at Acme Corp?"
  - Claude will search contacts by organization

## Workflow

Here's how typical operations work:

### Creating a Calendar Event

1. **You say:** "Add Billy Strings concert to my calendar on March 15th at 8pm"

2. **Claude processes:**
   - Determines operation: Create event
   - Identifies target: Calendar (asks which one if multiple)
   - Extracts parameters:
     - Title: "Billy Strings concert"
     - Date: March 15th → `2026-03-15`
     - Time: 8pm → `20:00:00`
     - Duration: (asks if not specified)

3. **Claude executes:**
   ```bash
   python scripts/radicale-api.py events create \
     --calendar "Personal" \
     --title "Billy Strings concert" \
     --start "2026-03-15T20:00:00" \
     --end "2026-03-15T23:00:00"
   ```

4. **Claude confirms:** Shows you the created event details

### Searching for Contacts

1. **You say:** "What's Sarah's phone number?"

2. **Claude processes:**
   - Determines operation: Search contact
   - Identifies target: Addressbook
   - Extracts query: "Sarah"

3. **Claude executes:**
   ```bash
   python scripts/radicale-api.py contacts search \
     --addressbook "Contacts" \
     --query "sarah"
   ```

4. **Claude presents:** Shows matching contacts with phone numbers

## Troubleshooting

### "Module 'caldav' not found"

**Problem:** Python can't find the caldav library.

**Solution:**
```bash
pip install caldav vobject icalendar
```

If using a virtual environment, activate it first:
```bash
source venv/bin/activate
pip install caldav vobject icalendar
```

### "Connection refused" or "Failed to connect"

**Problem:** Can't reach Radicale server.

**Solutions:**
1. Verify Radicale is running:
   ```bash
   curl http://localhost:5232
   ```

2. Check the URL in `.env` file is correct

3. If using Docker, ensure container is running:
   ```bash
   docker ps | grep radicale
   ```

### "Authentication failed"

**Problem:** Username or password is incorrect.

**Solutions:**
1. Verify credentials in `.env` file
2. Check username/password have no extra spaces or quotes
3. Try logging in via web browser first to verify credentials

### "Calendar not found"

**Problem:** The calendar name doesn't exist.

**Solutions:**
1. List all calendars to see available names:
   ```bash
   python scripts/radicale-api.py calendars list
   ```

2. Calendar names are case-sensitive: "Personal" ≠ "personal"

3. Create the calendar if it doesn't exist (via Radicale web UI)

### "Invalid datetime format"

**Problem:** Date/time not in correct format.

**Solution:** Use ISO 8601 format: `YYYY-MM-DDTHH:MM:SS`

**Examples:**
- ✅ Correct: `2026-03-15T20:00:00`
- ❌ Wrong: `03/15/2026 8:00 PM`
- ❌ Wrong: `2026-03-15 20:00:00` (missing T separator)

### Debug Mode

For detailed error information, run commands with debug output:

```bash
python scripts/radicale-api.py events list --calendar "Personal" --debug
```

Or set environment variable:
```bash
DEBUG=1 python scripts/radicale-api.py events list --calendar "Personal"
```

## Command Reference

Quick reference of all available commands:

### Calendar Commands

```bash
# List all calendars
python scripts/radicale-api.py calendars list

# List events (next 30 days by default)
python scripts/radicale-api.py events list --calendar "Personal"

# List events for specific time range
python scripts/radicale-api.py events list --calendar "Personal" --days 7

# Search events
python scripts/radicale-api.py events search --calendar "Personal" --query "meeting"

# Create event
python scripts/radicale-api.py events create \
  --calendar "Personal" \
  --title "Event Title" \
  --start "2026-02-10T14:00:00" \
  --end "2026-02-10T15:00:00" \
  --location "Location" \
  --description "Description"

# Delete event
python scripts/radicale-api.py events delete \
  --calendar "Personal" \
  --title "Event Title"
```

### Contact Commands

```bash
# List all addressbooks
python scripts/radicale-api.py addressbooks list

# List all contacts
python scripts/radicale-api.py contacts list --addressbook "Contacts"

# Search contacts
python scripts/radicale-api.py contacts search --addressbook "Contacts" --query "name"

# Create contact
python scripts/radicale-api.py contacts create \
  --addressbook "Contacts" \
  --name "Full Name" \
  --email "email@example.com" \
  --phone "+1-555-0123" \
  --organization "Company" \
  --title "Job Title"

# Delete contact
python scripts/radicale-api.py contacts delete \
  --addressbook "Contacts" \
  --name "Full Name"
```

## Notes

### Date and Time Handling

- **Format:** Always use ISO 8601: `YYYY-MM-DDTHH:MM:SS`
- **Timezone:** All times are in your local timezone
- **All-day events:** Use start of day (00:00:00) for both start and end times
- **Claude parsing:** When using natural language, Claude will convert "tomorrow at 2pm" to proper ISO format

### Event Duration

If you don't specify an end time, Claude will ask for duration or use sensible defaults:
- Meetings: 1 hour
- Appointments: 30 minutes
- Events without clear duration: Will prompt you

### Calendar/Addressbook Selection

- If you have multiple calendars, Claude will ask which one to use
- Default calendar name is typically "Personal"
- You can always specify: `--calendar "Work"` or `--addressbook "Contacts"`

### Data Privacy

- All operations are local to your Radicale server
- No data is sent to external services
- Credentials are stored locally in `.env` file (gitignored)
- Use HTTPS in production for encrypted communication

### Limitations

- Recurring events are not yet fully supported
- Event reminders/alarms not yet implemented
- Contact photos/avatars not yet supported
- Timezone-aware events require explicit timezone specification

## For Claude Code

If you're Claude Code assistant, see **[SKILL.md](SKILL.md)** for:
- Detailed command syntax
- Natural language parsing examples
- Decision trees for operation determination
- Error handling patterns
- Reference documentation links

## Learn More

- **Radicale Documentation:** https://radicale.org/v3.html
- **CalDAV Protocol:** RFC 4791
- **CardDAV Protocol:** RFC 6352
- **Python caldav Library:** https://github.com/python-caldav/caldav
- **ISO 8601 Date Format:** https://en.wikipedia.org/wiki/ISO_8601

## Support

**Issues or Questions?**
- Check the [Troubleshooting](#troubleshooting) section above
- See `references/troubleshooting.md` for more detailed error solutions
- Review `references/quick-reference.md` for command examples
- Consult `references/caldav-library.md` for Python library usage

---

**Version:** 1.0.0
**Last Updated:** 2026-02-08
