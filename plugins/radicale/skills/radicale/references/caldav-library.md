# Python caldav Library Guide

Complete guide to using the Python caldav library for CalDAV/CardDAV operations with Radicale.

## Installation

```bash
pip install caldav vobject icalendar
```

**Required libraries:**
- `caldav` - CalDAV/CardDAV protocol implementation
- `vobject` - vCard/iCalendar object parsing
- `icalendar` - iCalendar format support

## Authentication & Connection

### Basic Authentication

```python
import caldav

# Connect with username/password
client = caldav.DAVClient(
    url='http://localhost:5232',
    username='admin',
    password='password'
)

# Test connection
principal = client.principal()
```

### From Environment Variables

```python
import os
import caldav

url = os.getenv('RADICALE_URL')
username = os.getenv('RADICALE_USERNAME')
password = os.getenv('RADICALE_PASSWORD')

client = caldav.DAVClient(url=url, username=username, password=password)
```

## Calendar Operations

### List Calendars

```python
principal = client.principal()
calendars = principal.calendars()

for calendar in calendars:
    print(f"Calendar: {calendar.name}")
    print(f"  URL: {calendar.url}")
    print(f"  ID: {calendar.id}")
```

### Create Calendar

```python
from caldav.elements import dav, cdav

principal = client.principal()
calendar = principal.make_calendar(name="My Calendar")
```

### Get Events in Date Range

```python
from datetime import datetime, timedelta

# Get events for this week
start = datetime.now()
end = start + timedelta(days=7)

events = calendar.date_search(start=start, end=end, expand=True)

for event in events:
    print(event.data)  # Raw iCalendar data
```

### Parse Event Data

```python
from icalendar import Calendar

for event in events:
    cal = Calendar.from_ical(event.data)
    for component in cal.walk('VEVENT'):
        summary = component.get('summary')
        start = component.get('dtstart').dt
        end = component.get('dtend').dt
        location = component.get('location', '')

        print(f"{summary} - {start} to {end}")
        if location:
            print(f"  Location: {location}")
```

### Create Event

```python
from icalendar import Calendar, Event
from datetime import datetime
import uuid

# Create calendar object
cal = Calendar()
event = Event()

# Set event properties
event.add('summary', 'Team Meeting')
event.add('dtstart', datetime(2026, 2, 10, 14, 0, 0))
event.add('dtend', datetime(2026, 2, 10, 15, 0, 0))
event.add('location', 'Conference Room A')
event.add('description', 'Weekly team sync')

# Required fields
event.add('uid', str(uuid.uuid4()))
event.add('dtstamp', datetime.now())

# Add event to calendar
cal.add_component(event)

# Save to server
calendar.save_event(cal.to_ical().decode('utf-8'))
```

### Update Event

```python
# Find event by UID
events = calendar.events()
for event in events:
    cal = Calendar.from_ical(event.data)
    for component in cal.walk('VEVENT'):
        if str(component.get('uid')) == target_uid:
            # Modify event
            component['summary'] = 'Updated Meeting'

            # Save changes
            event.data = cal.to_ical()
            event.save()
            break
```

### Delete Event

```python
# Find and delete event by UID
events = calendar.events()
for event in events:
    cal = Calendar.from_ical(event.data)
    for component in cal.walk('VEVENT'):
        if str(component.get('uid')) == target_uid:
            event.delete()
            print(f"Deleted event: {component.get('summary')}")
            break
```

## Contact Operations (CardDAV)

### List Addressbooks

```python
principal = client.principal()
addressbooks = principal.addressbooks()

for ab in addressbooks:
    print(f"Addressbook: {ab.name}")
    print(f"  URL: {ab.url}")
```

### List Contacts

```python
import vobject

addressbook = addressbooks[0]
contacts = addressbook.get_contacts()

for contact in contacts:
    vcard = vobject.readOne(contact.data)

    name = str(vcard.fn.value) if hasattr(vcard, 'fn') else ''
    email = str(vcard.email.value) if hasattr(vcard, 'email') else ''

    print(f"{name} <{email}>")
```

### Create Contact

```python
import vobject
import uuid

# Create vCard
vcard = vobject.vCard()

# Full name (required)
vcard.add('fn')
vcard.fn.value = 'John Doe'

# Email
vcard.add('email')
vcard.email.value = 'john.doe@example.com'
vcard.email.type_param = 'INTERNET'

# Phone
vcard.add('tel')
vcard.tel.value = '+1-555-1234'
vcard.tel.type_param = 'CELL'

# UID (required)
vcard.add('uid')
vcard.uid.value = str(uuid.uuid4())

# Save to server
addressbook.save_contact(vcard.serialize())
```

### Search Contacts

```python
# List all contacts and filter
contacts = addressbook.get_contacts()
results = []

for contact in contacts:
    vcard = vobject.readOne(contact.data)
    name = str(vcard.fn.value) if hasattr(vcard, 'fn') else ''
    email = str(vcard.email.value) if hasattr(vcard, 'email') else ''

    if 'david' in name.lower() or 'david' in email.lower():
        results.append({
            'name': name,
            'email': email,
            'uid': str(vcard.uid.value)
        })
```

### Delete Contact

```python
# Find and delete contact by UID
contacts = addressbook.get_contacts()
for contact in contacts:
    vcard = vobject.readOne(contact.data)
    if str(vcard.uid.value) == target_uid:
        contact.delete()
        print(f"Deleted contact: {vcard.fn.value}")
        break
```

## Error Handling

### Connection Errors

```python
try:
    client = caldav.DAVClient(url=url, username=username, password=password)
    principal = client.principal()
except caldav.lib.error.AuthorizationError:
    print("Authentication failed - check username/password")
except caldav.lib.error.NotFoundError:
    print("Server not found - check URL")
except Exception as e:
    print(f"Connection error: {e}")
```

### Calendar Not Found

```python
try:
    calendar = None
    for cal in calendars:
        if cal.name == 'Personal':
            calendar = cal
            break

    if not calendar:
        raise ValueError("Calendar 'Personal' not found")
except ValueError as e:
    print(f"Error: {e}")
```

## Best Practices

1. **Always test connection** - Call `client.principal()` after creating client
2. **Use UUIDs** - Generate unique UIDs for events/contacts using `uuid.uuid4()`
3. **Handle timezones** - Use timezone-aware datetime objects for events
4. **Close connections** - CalDAV uses HTTP keep-alive, connections auto-close
5. **Error handling** - Wrap all operations in try/except blocks
6. **Batch operations** - Fetch multiple events/contacts at once when possible

## References

- [caldav documentation](https://caldav.readthedocs.io/)
- [RFC 4791 - CalDAV](https://www.rfc-editor.org/rfc/rfc4791)
- [RFC 6352 - CardDAV](https://www.rfc-editor.org/rfc/rfc6352)
- [vobject documentation](http://vobject.skyhouseconsulting.com/)
- [icalendar documentation](https://icalendar.readthedocs.io/)
