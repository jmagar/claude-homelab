#!/usr/bin/env python3
"""
Radicale CalDAV/CardDAV API Wrapper

Manages calendars and contacts on a self-hosted Radicale server using the
Python caldav library.

Usage:
    # Calendar operations
    python radicale-api.py calendars list
    python radicale-api.py events list --calendar "Personal" --start "2026-02-01" --end "2026-02-28"
    python radicale-api.py events create --calendar "Personal" --title "Meeting" --start "2026-02-10T14:00:00" --end "2026-02-10T15:00:00"
    python radicale-api.py events delete --calendar "Personal" --uid "event-uid-here"

    # Contact operations
    python radicale-api.py contacts list --addressbook "Contacts"
    python radicale-api.py contacts search --addressbook "Contacts" --query "David"
    python radicale-api.py contacts create --addressbook "Contacts" --name "John Doe" --email "john@example.com"
    python radicale-api.py contacts delete --addressbook "Contacts" --uid "contact-uid-here"

Credentials:
    Reads from ~/.claude-homelab/.env:
        RADICALE_URL="http://localhost:5232"
        RADICALE_USERNAME="admin"
        RADICALE_PASSWORD="password"
"""

import argparse
import json
import sys
from datetime import datetime, timedelta
from pathlib import Path
from typing import Any, Dict, List, Optional

try:
    import caldav
    import vobject
    from icalendar import Calendar, Event
except ImportError:
    print("ERROR: Required libraries not installed", file=sys.stderr)
    print("Install with: pip install caldav vobject icalendar", file=sys.stderr)
    sys.exit(1)


def load_env() -> Dict[str, str]:
    """Load environment variables from .env file."""
    env_path = Path.home() / ".claude" / ".env"

    if not env_path.exists():
        print(f"ERROR: .env file not found at {env_path}", file=sys.stderr)
        sys.exit(1)

    env_vars = {}
    with open(env_path) as f:
        for line in f:
            line = line.strip()
            if line and not line.startswith("#") and "=" in line:
                key, value = line.split("=", 1)
                # Remove quotes if present
                value = value.strip().strip('"').strip("'")
                env_vars[key.strip()] = value

    return env_vars


def get_radicale_client() -> caldav.DAVClient:
    """Create and return a CalDAV client connected to Radicale."""
    env = load_env()

    url = env.get("RADICALE_URL")
    username = env.get("RADICALE_USERNAME")
    password = env.get("RADICALE_PASSWORD")

    if not all([url, username, password]):
        print(
            "ERROR: RADICALE_URL, RADICALE_USERNAME, and RADICALE_PASSWORD must be set in .env",
            file=sys.stderr,
        )
        sys.exit(1)

    try:
        client = caldav.DAVClient(url=url, username=username, password=password)
        # Test connection
        client.principal()
        return client
    except Exception as e:
        print(f"ERROR: Failed to connect to Radicale: {e}", file=sys.stderr)
        sys.exit(1)


# ============================================================================
# Calendar Operations
# ============================================================================


def list_calendars(client: caldav.DAVClient) -> List[Dict[str, Any]]:
    """List all calendars."""
    principal = client.principal()
    calendars = principal.calendars()

    result = []
    for cal in calendars:
        result.append({"name": cal.name, "url": str(cal.url), "id": cal.id})

    return result


def list_events(
    client: caldav.DAVClient,
    calendar_name: str,
    start: Optional[str] = None,
    end: Optional[str] = None,
) -> List[Dict[str, Any]]:
    """
    List events in a calendar within a date range.

    Args:
        client: CalDAV client
        calendar_name: Name of the calendar
        start: Start date (ISO format: YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)
        end: End date (ISO format: YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)
    """
    principal = client.principal()
    calendars = principal.calendars()

    # Find calendar by name
    calendar = None
    for cal in calendars:
        if cal.name == calendar_name:
            calendar = cal
            break

    if not calendar:
        print(f"ERROR: Calendar '{calendar_name}' not found", file=sys.stderr)
        sys.exit(1)

    # Parse date range
    if start:
        start_dt = datetime.fromisoformat(start.replace("Z", "+00:00"))
    else:
        start_dt = datetime.now()

    if end:
        end_dt = datetime.fromisoformat(end.replace("Z", "+00:00"))
    else:
        end_dt = start_dt + timedelta(days=7)  # Default to 1 week

    # Fetch events
    events = calendar.date_search(start=start_dt, end=end_dt, expand=True)

    result = []
    for event in events:
        cal_data = Calendar.from_ical(event.data)
        for component in cal_data.walk("VEVENT"):
            result.append(
                {
                    "uid": str(component.get("uid")),
                    "summary": str(component.get("summary", "")),
                    "description": str(component.get("description", "")),
                    "location": str(component.get("location", "")),
                    "start": component.get("dtstart").dt.isoformat()
                    if component.get("dtstart")
                    else None,
                    "end": component.get("dtend").dt.isoformat()
                    if component.get("dtend")
                    else None,
                    "created": component.get("created").dt.isoformat()
                    if component.get("created")
                    else None,
                    "last_modified": component.get("last-modified").dt.isoformat()
                    if component.get("last-modified")
                    else None,
                }
            )

    return result


def create_event(
    client: caldav.DAVClient,
    calendar_name: str,
    title: str,
    start: str,
    end: str,
    location: str = "",
    description: str = "",
) -> Dict[str, Any]:
    """
    Create a new event in a calendar.

    Args:
        client: CalDAV client
        calendar_name: Name of the calendar
        title: Event title/summary
        start: Start datetime (ISO format: YYYY-MM-DDTHH:MM:SS)
        end: End datetime (ISO format: YYYY-MM-DDTHH:MM:SS)
        location: Event location (optional)
        description: Event description (optional)
    """
    principal = client.principal()
    calendars = principal.calendars()

    # Find calendar by name
    calendar = None
    for cal in calendars:
        if cal.name == calendar_name:
            calendar = cal
            break

    if not calendar:
        print(f"ERROR: Calendar '{calendar_name}' not found", file=sys.stderr)
        sys.exit(1)

    # Parse datetimes
    start_dt = datetime.fromisoformat(start)
    end_dt = datetime.fromisoformat(end)

    # Create event
    cal = Calendar()
    event = Event()
    event.add("summary", title)
    event.add("dtstart", start_dt)
    event.add("dtend", end_dt)

    if location:
        event.add("location", location)
    if description:
        event.add("description", description)

    # Generate UID
    import uuid

    event.add("uid", str(uuid.uuid4()))
    event.add("dtstamp", datetime.now())

    cal.add_component(event)

    # Save to server
    calendar.save_event(cal.to_ical().decode("utf-8"))

    return {
        "status": "created",
        "title": title,
        "start": start_dt.isoformat(),
        "end": end_dt.isoformat(),
    }


def delete_event(
    client: caldav.DAVClient, calendar_name: str, uid: str
) -> Dict[str, str]:
    """Delete an event by UID."""
    principal = client.principal()
    calendars = principal.calendars()

    # Find calendar by name
    calendar = None
    for cal in calendars:
        if cal.name == calendar_name:
            calendar = cal
            break

    if not calendar:
        print(f"ERROR: Calendar '{calendar_name}' not found", file=sys.stderr)
        sys.exit(1)

    # Find and delete event
    events = calendar.events()
    for event in events:
        cal_data = Calendar.from_ical(event.data)
        for component in cal_data.walk("VEVENT"):
            if str(component.get("uid")) == uid:
                event.delete()
                return {"status": "deleted", "uid": uid}

    return {"status": "not_found", "uid": uid}


# ============================================================================
# Contact Operations
# ============================================================================


def list_addressbooks(client: caldav.DAVClient) -> List[Dict[str, Any]]:
    """List all addressbooks."""
    try:
        principal = client.principal()
        # CardDAV addressbooks
        addressbooks = principal.addressbooks()

        result = []
        for ab in addressbooks:
            result.append({"name": ab.name, "url": str(ab.url), "id": ab.id})

        return result
    except Exception as e:
        print(f"ERROR: Failed to list addressbooks: {e}", file=sys.stderr)
        return []


def list_contacts(
    client: caldav.DAVClient, addressbook_name: str
) -> List[Dict[str, Any]]:
    """List all contacts in an addressbook."""
    principal = client.principal()
    addressbooks = principal.addressbooks()

    # Find addressbook by name
    addressbook = None
    for ab in addressbooks:
        if ab.name == addressbook_name:
            addressbook = ab
            break

    if not addressbook:
        print(f"ERROR: Addressbook '{addressbook_name}' not found", file=sys.stderr)
        sys.exit(1)

    # Fetch contacts
    contacts = addressbook.get_contacts()

    result = []
    for contact in contacts:
        vcard = vobject.readOne(contact.data)

        # Extract contact info
        name = str(vcard.fn.value) if hasattr(vcard, "fn") else ""
        email = ""
        if hasattr(vcard, "email"):
            email = (
                str(vcard.email.value)
                if hasattr(vcard.email, "value")
                else str(vcard.email)
            )

        phone = ""
        if hasattr(vcard, "tel"):
            phone = (
                str(vcard.tel.value) if hasattr(vcard.tel, "value") else str(vcard.tel)
            )

        result.append(
            {
                "uid": str(vcard.uid.value) if hasattr(vcard, "uid") else "",
                "name": name,
                "email": email,
                "phone": phone,
            }
        )

    return result


def search_contacts(
    client: caldav.DAVClient, addressbook_name: str, query: str
) -> List[Dict[str, Any]]:
    """Search contacts by name or email."""
    contacts = list_contacts(client, addressbook_name)

    # Simple case-insensitive search
    query_lower = query.lower()
    results = [
        c
        for c in contacts
        if query_lower in c["name"].lower() or query_lower in c["email"].lower()
    ]

    return results


def create_contact(
    client: caldav.DAVClient,
    addressbook_name: str,
    name: str,
    email: str = "",
    phone: str = "",
) -> Dict[str, Any]:
    """Create a new contact in an addressbook."""
    principal = client.principal()
    addressbooks = principal.addressbooks()

    # Find addressbook by name
    addressbook = None
    for ab in addressbooks:
        if ab.name == addressbook_name:
            addressbook = ab
            break

    if not addressbook:
        print(f"ERROR: Addressbook '{addressbook_name}' not found", file=sys.stderr)
        sys.exit(1)

    # Create vCard
    vcard = vobject.vCard()
    vcard.add("fn")
    vcard.fn.value = name

    if email:
        vcard.add("email")
        vcard.email.value = email
        vcard.email.type_param = "INTERNET"

    if phone:
        vcard.add("tel")
        vcard.tel.value = phone
        vcard.tel.type_param = "CELL"

    # Generate UID
    import uuid

    vcard.add("uid")
    vcard.uid.value = str(uuid.uuid4())

    # Save to server
    addressbook.save_contact(vcard.serialize())

    return {"status": "created", "name": name, "email": email, "phone": phone}


def delete_contact(
    client: caldav.DAVClient, addressbook_name: str, uid: str
) -> Dict[str, str]:
    """Delete a contact by UID."""
    principal = client.principal()
    addressbooks = principal.addressbooks()

    # Find addressbook by name
    addressbook = None
    for ab in addressbooks:
        if ab.name == addressbook_name:
            addressbook = ab
            break

    if not addressbook:
        print(f"ERROR: Addressbook '{addressbook_name}' not found", file=sys.stderr)
        sys.exit(1)

    # Find and delete contact
    contacts = addressbook.get_contacts()
    for contact in contacts:
        vcard = vobject.readOne(contact.data)
        if str(vcard.uid.value) == uid:
            contact.delete()
            return {"status": "deleted", "uid": uid}

    return {"status": "not_found", "uid": uid}


# ============================================================================
# CLI Interface
# ============================================================================


def main():
    parser = argparse.ArgumentParser(description="Radicale CalDAV/CardDAV API Wrapper")
    parser.add_argument("--json", action="store_true", help="Output as JSON")

    subparsers = parser.add_subparsers(dest="command", help="Command to execute")

    # Calendar commands
    cal_parser = subparsers.add_parser("calendars", help="Calendar operations")
    cal_subparsers = cal_parser.add_subparsers(dest="action")
    cal_subparsers.add_parser("list", help="List all calendars")

    # Event commands
    event_parser = subparsers.add_parser("events", help="Event operations")
    event_subparsers = event_parser.add_subparsers(dest="action")

    event_list = event_subparsers.add_parser("list", help="List events")
    event_list.add_argument("--calendar", required=True, help="Calendar name")
    event_list.add_argument(
        "--start", help="Start date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)"
    )
    event_list.add_argument(
        "--end", help="End date (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SS)"
    )

    event_create = event_subparsers.add_parser("create", help="Create event")
    event_create.add_argument("--calendar", required=True, help="Calendar name")
    event_create.add_argument("--title", required=True, help="Event title")
    event_create.add_argument(
        "--start", required=True, help="Start datetime (YYYY-MM-DDTHH:MM:SS)"
    )
    event_create.add_argument(
        "--end", required=True, help="End datetime (YYYY-MM-DDTHH:MM:SS)"
    )
    event_create.add_argument("--location", default="", help="Event location")
    event_create.add_argument("--description", default="", help="Event description")

    event_delete = event_subparsers.add_parser("delete", help="Delete event")
    event_delete.add_argument("--calendar", required=True, help="Calendar name")
    event_delete.add_argument("--uid", required=True, help="Event UID")

    # Contact commands
    contact_parser = subparsers.add_parser("contacts", help="Contact operations")
    contact_subparsers = contact_parser.add_subparsers(dest="action")

    contact_subparsers.add_parser("addressbooks", help="List all addressbooks")

    contact_list = contact_subparsers.add_parser("list", help="List contacts")
    contact_list.add_argument("--addressbook", required=True, help="Addressbook name")

    contact_search = contact_subparsers.add_parser("search", help="Search contacts")
    contact_search.add_argument("--addressbook", required=True, help="Addressbook name")
    contact_search.add_argument("--query", required=True, help="Search query")

    contact_create = contact_subparsers.add_parser("create", help="Create contact")
    contact_create.add_argument("--addressbook", required=True, help="Addressbook name")
    contact_create.add_argument("--name", required=True, help="Contact name")
    contact_create.add_argument("--email", default="", help="Email address")
    contact_create.add_argument("--phone", default="", help="Phone number")

    contact_delete = contact_subparsers.add_parser("delete", help="Delete contact")
    contact_delete.add_argument("--addressbook", required=True, help="Addressbook name")
    contact_delete.add_argument("--uid", required=True, help="Contact UID")

    args = parser.parse_args()

    if not args.command:
        parser.print_help()
        sys.exit(1)

    # Get client
    client = get_radicale_client()

    # Execute command
    result = None

    if args.command == "calendars":
        if args.action == "list":
            result = list_calendars(client)

    elif args.command == "events":
        if args.action == "list":
            result = list_events(client, args.calendar, args.start, args.end)
        elif args.action == "create":
            result = create_event(
                client,
                args.calendar,
                args.title,
                args.start,
                args.end,
                args.location,
                args.description,
            )
        elif args.action == "delete":
            result = delete_event(client, args.calendar, args.uid)

    elif args.command == "contacts":
        if args.action == "addressbooks":
            result = list_addressbooks(client)
        elif args.action == "list":
            result = list_contacts(client, args.addressbook)
        elif args.action == "search":
            result = search_contacts(client, args.addressbook, args.query)
        elif args.action == "create":
            result = create_contact(
                client, args.addressbook, args.name, args.email, args.phone
            )
        elif args.action == "delete":
            result = delete_contact(client, args.addressbook, args.uid)

    # Output result
    if result is not None:
        if args.json:
            print(json.dumps(result, indent=2))
        else:
            print(json.dumps(result, indent=2))
    else:
        print("ERROR: Unknown command or action", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
