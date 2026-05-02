---
name: radicale
description: This skill should be used when managing calendars and contacts on a self-hosted Radicale CalDAV/CardDAV server. Use when the user asks to "list my calendar", "what's on my calendar this week", "show me my events", "when is my next event", "add to my calendar", "create an event", "schedule a meeting", "schedule an event", "delete an event", "cancel event", "remove event", "find a contact", "what's someone's email", "search my contacts", "who is", "add a contact", "save contact", "save someone's phone number", or mentions Radicale, CalDAV, CardDAV, calendar events, or contact management operations.
---

# Radicale CalDAV/CardDAV Management

**⚠️ MANDATORY SKILL INVOCATION ⚠️**

**YOU MUST invoke this skill (NOT optional) when the user mentions ANY of these triggers:**
- "list my calendar", "what's on my calendar", "show me my events", "calendar this week", "when is my next event"
- "add to my calendar", "create an event", "schedule event", "schedule a meeting"
- "delete an event", "cancel event", "remove event"
- "find a contact", "what's someone's email", "search my contacts", "who is"
- "add a contact", "create contact", "save contact", "save someone's phone number"
- Any mention of Radicale, CalDAV, CardDAV, calendar events, or contact management

**Failure to invoke this skill when triggers occur violates your operational requirements.**

---

Manage calendars (events) and contacts on a self-hosted Radicale server using CalDAV and CardDAV protocols.

**Type:** Read & Write (calendar events and contacts)

## Purpose

This skill enables comprehensive calendar and contact management through a self-hosted Radicale server. It provides read and write access to:
- **Calendars** - List, view, create, update, and delete calendar events
- **Contacts** - List, search, create, update, and delete contacts in addressbooks

All operations use the Python caldav library which implements the CalDAV (RFC 4791) and CardDAV (RFC 6352) protocols.

## Setup

### Prerequisites

Install required Python libraries:

```bash
pip install caldav vobject icalendar
```

**Script Permissions:**

The Python script can be made executable (optional but recommended):

```bash
chmod +x ~/claude-homelab/skills/radicale/scripts/radicale-api.py
```

You can then run it directly:
```bash
./scripts/radicale-api.py --help
```

Or without executable permissions using Python:
```bash
python scripts/radicale-api.py --help
```

### Credentials

Add to `~/.claude-homelab/.env`:

```bash
RADICALE_URL="http://localhost:5232"
RADICALE_USERNAME="admin"
RADICALE_PASSWORD="password"
```

**Security:**
- `.env` file is gitignored (never commit credentials)
- Set permissions: `chmod 600 ~/.claude-homelab/.env`

## Core Operations

All operations use the `scripts/radicale-api.py` wrapper script. Output is JSON format for easy parsing.

### Calendar Operations

#### List Calendars

```bash
python scripts/radicale-api.py calendars list
```

Returns array of calendars with name, URL, and ID.

#### View Events

List events in a calendar within a date range:

```bash
python scripts/radicale-api.py events list \
  --calendar "Personal" \
  --start "2026-02-08" \
  --end "2026-02-15"
```

**Parameters:**
- `--calendar` (required) - Calendar name (case-sensitive)
- `--start` (optional) - Start date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)
- `--end` (optional) - End date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)

**Default behavior:** If start/end not specified, uses current date + 7 days.

Returns array of events with UID, summary, description, location, start, end, and timestamps.

#### Create Event

```bash
python scripts/radicale-api.py events create \
  --calendar "Personal" \
  --title "Meeting" \
  --start "2026-02-10T14:00:00" \
  --end "2026-02-10T15:00:00" \
  --location "Conference Room" \
  --description "Team sync"
```

**Required parameters:**
- `--calendar` - Calendar name
- `--title` - Event title/summary
- `--start` - Start datetime (YYYY-MM-DDTHH:MM:SS)
- `--end` - End datetime (YYYY-MM-DDTHH:MM:SS)

**Optional parameters:**
- `--location` - Event location
- `--description` - Event description

**Important:** Use ISO 8601 datetime format (YYYY-MM-DDTHH:MM:SS). End must be after start.

#### Delete Event

```bash
python scripts/radicale-api.py events delete \
  --calendar "Personal" \
  --uid "event-uid-here"
```

Get UID from `events list` output.

### Contact Operations

#### List Addressbooks

```bash
python scripts/radicale-api.py contacts addressbooks
```

Returns array of addressbooks with name, URL, and ID.

#### List Contacts

```bash
python scripts/radicale-api.py contacts list \
  --addressbook "Contacts"
```

Returns array of contacts with UID, name, email, and phone.

#### Search Contacts

```bash
python scripts/radicale-api.py contacts search \
  --addressbook "Contacts" \
  --query "David"
```

**Search behavior:** Case-insensitive substring match against name and email fields.

#### Create Contact

```bash
python scripts/radicale-api.py contacts create \
  --addressbook "Contacts" \
  --name "John Doe" \
  --email "john@example.com" \
  --phone "+1-555-1234"
```

**Required parameter:**
- `--name` - Contact full name

**Optional parameters:**
- `--email` - Email address
- `--phone` - Phone number

#### Delete Contact

```bash
python scripts/radicale-api.py contacts delete \
  --addressbook "Contacts" \
  --uid "contact-uid-here"
```

Get UID from `contacts list` or `contacts search` output.

## Natural Language Translation

When users make natural language requests, translate them to script commands:

### Calendar Examples

**User:** "What's my calendar look like this week?"

**Action:**
1. Calculate current week date range
2. Run: `python scripts/radicale-api.py events list --calendar "Personal" --start "YYYY-MM-DD" --end "YYYY-MM-DD"`
3. Present events in human-readable format

**User:** "Add to my calendar Billy Strings in Athens, GA 02/07/2026 7PM EST"

**Action:**
1. Parse: title="Billy Strings", location="Athens, GA", start="2026-02-07T19:00:00", end="2026-02-07T23:00:00" (assume 4hr concert)
2. Run: `python scripts/radicale-api.py events create --calendar "Personal" --title "Billy Strings" --start "2026-02-07T19:00:00" --end "2026-02-07T23:00:00" --location "Athens, GA"`
3. Confirm creation

### Contact Examples

**User:** "What's David Ryan's work email?"

**Action:**
1. Run: `python scripts/radicale-api.py contacts search --addressbook "Contacts" --query "David Ryan"`
2. Extract email field from results
3. Present: "David Ryan's email is david.ryan@example.com"

**User:** "Add John Doe to my contacts, email john@example.com"

**Action:**
1. Run: `python scripts/radicale-api.py contacts create --addressbook "Contacts" --name "John Doe" --email "john@example.com"`
2. Confirm creation

## Decision Tree

When user mentions calendars or contacts:

1. **Determine operation type:**
   - Calendar query ("show", "list", "what's on") → Use `events list`
   - Calendar create ("add", "create event", "schedule") → Use `events create`
   - Calendar delete ("remove", "delete", "cancel") → Use `events delete`
   - Contact query ("find", "search", "what's", "who is") → Use `contacts search`
   - Contact create ("add contact", "save contact") → Use `contacts create`
   - Contact delete ("remove contact", "delete contact") → Use `contacts delete`

2. **Identify target:**
   - Calendar operations → Ask which calendar (default: "Personal")
   - Contact operations → Ask which addressbook (default: "Contacts")

3. **Extract parameters:**
   - For events: Parse title, location, date/time from natural language
   - For contacts: Parse name, email, phone from natural language

4. **Execute command:**
   - Run appropriate script command
   - Parse JSON output

5. **Present results:**
   - Format JSON as human-readable text
   - Include relevant details (event times, contact info)
   - Confirm successful operations

## Date/Time Handling

**Important considerations:**
- All times are local to the Radicale server timezone
- Use ISO 8601 format for consistency: `YYYY-MM-DDTHH:MM:SS`
- When user specifies "7PM EST", convert to 24-hour local time
- For all-day events, use same date for start/end with different times
- Default event duration: 1 hour (if user doesn't specify end time)

**Common translations:**
- "this week" → Calculate Mon-Sun dates from current date
- "next week" → Calculate Mon-Sun dates for following week
- "today" → Current date
- "tomorrow" → Current date + 1 day
- "7PM" → "19:00:00"
- "noon" → "12:00:00"

## Bundled Resources

### scripts/radicale-api.py

Complete Python wrapper for CalDAV/CardDAV operations. Uses caldav library to connect to Radicale server and perform all calendar/contact operations.

**Key features:**
- Loads credentials from `.env` file
- JSON output for all operations
- Error handling with clear messages
- Supports all CalDAV/CardDAV operations

**Direct usage:** Can be called directly with command-line arguments (see examples above).

### references/caldav-library.md

In-depth guide to the Python caldav library including:
- Authentication patterns
- Calendar operations (create, read, update, delete)
- Event operations with iCalendar format
- Contact operations with vCard format
- Error handling patterns
- Best practices

**When to reference:** When implementing custom operations beyond the wrapper script, or when debugging library-specific issues.

### references/quick-reference.md

Quick command examples for all operations with sample inputs and outputs.

**When to reference:** When user needs examples or when uncertain about command syntax.

### references/troubleshooting.md

Common errors and solutions including:
- Installation issues
- Connection problems
- Authentication failures
- Calendar/contact not found errors
- Date/time format issues
- Permission problems

**When to reference:** When operations fail or user reports errors.

## Error Handling

All operations return JSON with status. Check for:

**Connection errors:**
- `ERROR: .env file not found` → Guide user to create `.env` file
- `ERROR: Failed to connect to Radicale` → Check Radicale is running, verify URL
- `ERROR: Authentication failed` → Verify credentials in `.env`

**Resource errors:**
- `ERROR: Calendar 'X' not found` → List available calendars with `calendars list`
- `ERROR: Addressbook 'X' not found` → List addressbooks with `contacts addressbooks`

**Data errors:**
- `ValueError: Invalid isoformat string` → Fix datetime format to ISO 8601
- End time before start time → Adjust end time to be after start

## Notes

**Read-Write Operations:**
- All operations modify data on the Radicale server
- Event creation is immediate (no confirmation prompt)
- Contact creation is immediate (no confirmation prompt)
- Deletions are permanent (no undo)

**Performance:**
- Use date ranges for event queries to avoid loading all events
- Search contacts instead of listing all when looking for specific person
- Calendar/contact listing can be slow with large datasets

**Limitations:**
- No timezone support in current implementation (uses local time)
- No recurring event support yet
- Contact fields limited to name, email, phone (vCard supports more)
- No event reminders/alarms

**Security:**
- All credentials stored in `.env` file (gitignored)
- API script never logs credentials
- Connection uses HTTP basic auth (HTTPS recommended for production)

## Reference Documentation

**Bundled references (load as needed):**
- `references/caldav-library.md` - Python caldav library guide
- `references/quick-reference.md` - Command examples
- `references/troubleshooting.md` - Error solutions

**External documentation:**
- [Radicale Documentation](https://radicale.org/v3.html)
- [caldav Library Docs](https://caldav.readthedocs.io/)
- [RFC 4791 - CalDAV](https://www.rfc-editor.org/rfc/rfc4791) (embedded in vector DB)
- [RFC 6352 - CardDAV](https://www.rfc-editor.org/rfc/rfc6352) (embedded in vector DB)

---

## 🔧 Agent Tool Usage Requirements

**CRITICAL:** When invoking scripts from this skill via the zsh-tool, **ALWAYS use `pty: true`**.

Without PTY mode, command output will not be visible even though commands execute successfully.

**Correct invocation pattern:**
```typescript
<invoke name="mcp__plugin_zsh-tool_zsh-tool__zsh">
<parameter name="command">python ./skills/radicale/scripts/radicale-api.py [args]</parameter>
<parameter name="pty">true</parameter>
</invoke>
```

