Utilities Reference | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Utilities Reference
Apprise includes a set of utility helpers used across plugins and supported
integrations. Plugin authors should prefer these helpers over ad hoc parsing
and formatting because they provide consistent behaviour, edge case handling,
and safer logging.
This page focuses on the helpers you are most likely to use when writing or
maintaining plugins. Additional utilities exist, but they are intentionally not
covered here.
## Import Patterns
[Section titled “Import Patterns”](#import-patterns)
Helpers are exposed through `apprise.utils` (recommended for plugin
authors), and are implemented in the `apprise.utils.\*` modules.
```
`
# Parsing and validation
from apprise.utils.parse import (
parse\_bool,
parse\_call\_sign,
parse\_emails,
parse\_list,
parse\_phone\_no,
parse\_url,
parse\_urls,
is\_call\_sign,
is\_email,
is\_hostname,
is\_ipaddr,
is\_phone\_no,
is\_uuid,
validate\_regex,
)
# Safer debug logging
from apprise.utils.sanitize import sanitize\_payload
# Encoding helpers
from apprise.utils.base64 import (
base64\_urlencode,
base64\_urldecode,
encode\_b64\_dict,
decode\_b64\_dict,
)
`
```
### Recommended Calling Pattern
[Section titled “Recommended Calling Pattern”](#recommended-calling-pattern)
A practical way to think about the parsing utilities is:
* `parse\_\*()` functions split and normalize lists of inputs, often forgiving.
Many accept a `store\_unparseable` option so you can log which values were
rejected later.
* `is\_\*()` functions validate a single candidate value. They return `False` on
failure, otherwise they return normalized data that you can safely store.
* `validate\_regex()` is a strict helper used to validate and optionally format
a value using a regex match.
Most plugins use both styles together. For example, an SMS plugin can call
`parse\_phone\_no()` to break up a user-supplied target list, then call
`is\_phone\_no()` on each entry to validate and normalize it.
## URL Parsing
[Section titled “URL Parsing”](#url-parsing)
### `parse\_url()`
[Section titled “parse\_url()”](#parse_url)
Use this in `parse\_url()` or `parse\_native\_url()` implementations to convert a
user-provided URL into a normalized structure. It handles schema detection,
quoting, user and password extraction, host verification, port parsing, and
query-string parsing.
Typical usage:
```
`
from apprise.utils.parse import parse\_url
results = parse\_url(url, verify\_host=False)
if not results:
return None
schema = results["schema"]
host = results.get("host")
qsd = results.get("qsd", {}) # query-string dictionary
`
```
#### Key Arguments
[Section titled “Key Arguments”](#key-arguments)
* `verify\_host`
When `True`, `parse\_url()` validates the host and returns `None` if it is
missing or invalid. This is a good default for network targets.
When `False`, host validation is relaxed, which is useful for plugins that
treat the host as an identifier or do not require a host.
* `default\_schema`
Used when a user omits the `schema://` portion.
* `simple`
When `True`, returns a smaller result structure. Most plugins should use the
default `simple=False`.
* `plus\_to\_space`
Controls whether `+` in the query string becomes a space. Apprise defaults
this to `False` because `+` is common in tokens and passwords.
#### What It Returns
[Section titled “What It Returns”](#what-it-returns)
The returned dictionary varies by input, but typically includes:
* `schema`, and optionally `host` and `port`
* `user` and `password` when provided
* `fullpath`, and sometimes `path` and `query`
* Parsed query-string data, via `qsd`
## Common Parsing Helpers
[Section titled “Common Parsing Helpers”](#common-parsing-helpers)
### `parse\_bool()`
[Section titled “parse\_bool()”](#parse_bool)
Converts common boolean representations into a Python `bool`. This is the
preferred way to parse flags from URL query strings or configuration values.
```
`
from apprise.utils.parse import parse\_bool
include\_image = parse\_bool(qsd.get("image"), default=False)
batch = parse\_bool(qsd.get("batch"), default=True)
`
```
#### What It Recognizes
[Section titled “What It Recognizes”](#what-it-recognizes)
* False-like: `"0"`, `"no"`, `"off"`, `"false"`, `"deny"`, `"disable"`, `"never"`
* True-like: `"1"`, `"yes"`, `"on"`, `"true"`, `"allow"`, `"enable"`
If a string cannot be interpreted, `default` is returned. For non-string values,
`bool(value)` is used.
#### Tri-state Behaviour Example
[Section titled “Tri-state Behaviour Example”](#tri-state-behaviour-example)
Sometimes you want different behaviour for:
* not provided at all (unset)
* explicitly enabled
* explicitly disabled
A common case is a feature that is **auto-enabled only when another setting is
present**, unless the user explicitly disables it.
```
`
raw = qsd.get("discovery") # None when not provided
if raw is None:
# Unset: choose a default based on other configuration
discovery = True if (self.secure and self.host) else False
else:
# Explicitly set: honor user intent
discovery = parse\_bool(raw, default=False)
`
```
### `parse\_list()`
[Section titled “parse\_list()”](#parse_list)
Breaks string and list-like inputs into a single list. It accepts multiple
inputs and merges them. By default it returns a sorted, unique list.
```
`
from apprise.utils.parse import parse\_list
tags = parse\_list(qsd.get("tag"), cast=str)
targets = parse\_list(qsd.get("to"), cast=str, allow\_whitespace=False)
`
```
#### Common Options
[Section titled “Common Options”](#common-options)
* `cast` converts values before parsing when possible (useful when values may
be numeric).
* `allow\_whitespace` controls whether whitespace is treated as a delimiter.
* `sort` controls whether the result is normalized into a unique sorted list
(`True`), or returned in parsed order (`False`).
### `parse\_emails()` and `is\_email()`
[Section titled “parse\_emails() and is\_email()”](#parse_emails-and-is_email)
These helpers are commonly used in email-like integrations and anywhere a user
can pass multiple recipients.
* `parse\_emails()` extracts multiple candidate emails from strings and
recursively walks through tuples, lists, and sets.
* `is\_email()` validates a single email and returns a structured result.
```
`
from apprise.utils.parse import parse\_emails, is\_email
recipients = []
for candidate in parse\_emails(qsd.get("to")):
result = is\_email(candidate)
if not result:
self.logger.warning("Dropped invalid email (%s) specified.", candidate)
continue
recipients.append(result["full\_email"])
`
```
Tip: `is\_email()` returns a dictionary (not just a boolean). When present, you
can use fields like `name`, `domain`, and `full\_email` to build a canonical
representation and keep name mappings for later.
### `parse\_urls()`
[Section titled “parse\_urls()”](#parse_urls)
Extracts URLs from strings or list-like input and can preserve unparseable
entries to aid error reporting.
```
`
from apprise.utils.parse import parse\_urls
endpoints = parse\_urls(qsd.get("endpoint"))
`
```
#### How `store\_unparseable` Helps
[Section titled “How store\_unparseable Helps”](#how-store_unparseable-helps)
If no valid items are detected and `store\_unparseable=True`, the input is split
on common delimiters and returned anyway. This allows you to log which values
were rejected, rather than silently discarding everything.
A practical plugin pattern:
```
`
emails = parse\_emails(qsd.get("to"), store\_unparseable=True)
valid = []
invalid = []
for entry in emails:
if is\_email(entry):
valid.append(entry)
else:
invalid.append(entry)
for entry in invalid:
self.logger.warning("Ignoring invalid email: %s", entry)
`
```
### `parse\_phone\_no()` and `is\_phone\_no()`
[Section titled “parse\_phone\_no() and is\_phone\_no()”](#parse_phone_no-and-is_phone_no)
Used by SMS, voice, and telecom-style plugins.
`parse\_phone\_no()` splits a target list into candidate entries, then
`is\_phone\_no()` validates a single entry and returns `False` or a dictionary.
```
`
from apprise.utils.parse import parse\_phone\_no, is\_phone\_no
valid = []
invalid = []
for candidate in parse\_phone\_no(targets):
result = is\_phone\_no(candidate)
if result:
valid.append(f"+{result['full']}")
else:
invalid.append(candidate)
for candidate in invalid:
self.logger.warning("Dropped invalid phone number (%s) specified.", candidate)
`
```
`is\_phone\_no()` result dictionary commonly includes:
* `full` (digits only)
* `pretty` (human-friendly formatting, when available)
* `country`, `area`, `line` (may be empty)
Important constraints:
* The digit count must be between `min\_len` (default `10`) and `14` inclusive.
* Common separators are accepted on input; you should store the normalized form.
### `parse\_call\_sign()` and `is\_call\_sign()`
[Section titled “parse\_call\_sign() and is\_call\_sign()”](#parse_call_sign-and-is_call_sign)
Used by APRS and ham radio-style integrations.
`parse\_call\_sign()` splits a callsign list, then `is\_call\_sign()` validates a
single callsign and returns `False` or a dictionary.
```
`
from apprise.utils.parse import parse\_call\_sign, is\_call\_sign
targets = []
for candidate in parse\_call\_sign(qsd.get("to")):
result = is\_call\_sign(candidate)
if not result:
self.logger.warning("Dropping invalid call sign (%s).", candidate)
continue
targets.append(result["callsign"].upper())
`
```
`is\_call\_sign()` validates a single callsign and returns `False` or a dictionary:
* `callsign` (uppercased)
* `ssid` (string, may be empty)
A practical pattern mirrors phone and email handling:
* Parse a list with `parse\_call\_sign(...)`
* Validate each entry with `is\_call\_sign(...)`
* Warn on invalid values, do not fail the entire configuration unless the
service requires at least one valid target
## Host and Identifier Validation
[Section titled “Host and Identifier Validation”](#host-and-identifier-validation)
These helpers are frequently used by plugins to validate inputs early and
produce clear error messages.
* `is\_hostname(hostname, ipv4=True, ipv6=True, underscore=True)`
Validates hostnames and optionally IP addresses. It supports underscores when
`underscore=True` to accommodate practical Docker and local naming
conventions.
* `is\_ipaddr(addr, ipv4=True, ipv6=True)`
Validates IPv4 and IPv6. For IPv6, it returns the address enclosed in
brackets (`[addr]`) to align with URL formatting expectations.
* `is\_uuid(value)`
Validates UUID strings.
These helpers return `False` when invalid. When valid, they return a normalized
string (not a boolean).
## Regex Validation
[Section titled “Regex Validation”](#regex-validation)
### `validate\_regex()`
[Section titled “validate\_regex()”](#validate_regex)
Validates a value against a regular expression. On success it returns the
(cleaned) value, otherwise it returns `None`.
```
`
from apprise.utils.parse import validate\_regex
token = validate\_regex(qsd.get("token"), r"^[A-Z0-9]{32}$", flags="i")
if not token:
self.logger.warning("An invalid token was specified")
return None
`
```
#### Plugin `template\_token` Regex Tuples
[Section titled “Plugin template\_token Regex Tuples”](#plugin-template_token-regex-tuples)
If your plugin defines a template token regex (as most plugins do), you can
reuse it directly when validating inputs, which keeps the definition in one
place.
Example pattern:
```
`
self.token = validate\_regex(
token, \*self.template\_tokens["token"]["regex"]
)
`
```
This relies on `template\_tokens["token"]["regex"]` being a tuple in the form
`(regex, flags)`.
#### Notable Features
[Section titled “Notable Features”](#notable-features)
* Regexes are cached internally after compilation, so repeated validations are
inexpensive.
* `flags` may be passed as an integer, or as a string of flag characters, for
example `"imx"`.
* When `fmt` is provided, named capture groups can be reassembled into a
normalized string.
Example with formatting:
```
`
value = validate\_regex(
value="prefix-123",
regex=r"^(?P\<prefix\>[a-z]+)-(?P\<id\>[0-9]+)$",
flags="i",
fmt="{prefix}:{id}",
)
# value is now "prefix:123" (or None if no match)
`
```
## Safe Logging and Secret Handling
[Section titled “Safe Logging and Secret Handling”](#safe-logging-and-secret-handling)
### `sanitize\_payload()`
[Section titled “sanitize\_payload()”](#sanitize_payload)
Use this helper before logging request payloads or response details, especially
when the structure may include **attachments**, **large encoded blobs**, or
deep nesting. It reduces log pollution and avoids leaking sensitive or very
large values, while still preserving enough structure to troubleshoot.
```
`
from apprise.utils.sanitize import sanitize\_payload
self.logger.debug("payload=%s", sanitize\_payload(payload))
`
```
#### When to Use It
[Section titled “When to Use It”](#when-to-use-it)
You do not need to sanitize every debug log. `sanitize\_payload()` is most
useful when:
* a payload might contain attachments (base64, bytes, file metadata)
* a response might contain unexpectedly large objects
* you want safe previews without copying large values into logs
If your debug log could be heavy, guard the call so it only runs when debug
logging is enabled.
```
`
import logging
from apprise.utils.sanitize import sanitize\_payload
if self.logger.isEnabledFor(logging.DEBUG):
self.logger.debug("Payload: %s", sanitize\_payload(payload))
`
```
#### What It Does
[Section titled “What It Does”](#what-it-does)
* Leaves primitives unchanged (e.g., `None`, booleans, numbers).
* Summarizes long strings with a compact marker and head and tail previews.
* Summarizes bytes with a bounded sha256 digest marker.
* Walks nested dictionaries and sequences safely.
* Detects recursion and prevents infinite traversal.
* Applies depth and item limits to prevent excessively large logs.
Practical pattern:
1. Build your request payload normally.
2. If debug is enabled, log `sanitize\_payload(payload)`.
3. Send the original payload to the upstream service.
#### Tuning Behaviour
[Section titled “Tuning Behaviour”](#tuning-behaviour)
Some environments benefit from stricter bounds, for example to prevent large
attachments or Base64-like blobs from entering logs.
```
`
from apprise.utils.sanitize import SanitizeOptions, sanitize\_payload
opts = SanitizeOptions(
max\_str\_len=64,
preview=8,
max\_depth=4,
max\_items=250,
)
self.logger.debug("payload=%s", sanitize\_payload(payload, options=opts))
`
```
When troubleshooting, avoid raising these limits globally. A safer approach is
to temporarily adjust them locally around a specific debug log statement.
## Encoding Helpers
[Section titled “Encoding Helpers”](#encoding-helpers)
### `base64\_urlencode()` and `base64\_urldecode()`
[Section titled “base64\_urlencode() and base64\_urldecode()”](#base64_urlencode-and-base64_urldecode)
URL-safe Base64 helpers for working with bytes.
```
`
from apprise.utils.base64 import base64\_urlencode, base64\_urldecode
encoded = base64\_urlencode(b"abc") # "YWJj"
decoded = base64\_urldecode(encoded) # b"abc"
`
```
These helpers are strict about input types. They return `None` for unsupported
inputs.
### `encode\_b64\_dict()` and `decode\_b64\_dict()`
[Section titled “encode\_b64\_dict() and decode\_b64\_dict()”](#encode_b64_dict-and-decode_b64_dict)
Dictionary helpers used when an API expects Base64-wrapped payload components,
often for binary-safe transport. Values that can be JSON-encoded are converted
to strings and wrapped with a `b64:` prefix.
```
`
from apprise.utils.base64 import encode\_b64\_dict, decode\_b64\_dict
original = {"int": 1, "float": 2.3}
encoded, needs\_decoding = encode\_b64\_dict(original)
# encoded == {"int": "b64:MQ==", "float": "b64:Mi4z"}
# needs\_decoding is True
decoded = decode\_b64\_dict(encoded)
# decoded == original
`
```
If JSON encoding fails for a value, the helper falls back to string conversion
and will indicate that decoding is not required.
Questions or Feedback?
#### Documentation
Notice a typo or an error?
[
Report it
](https://github.com/caronc/apprise-docs/issues/)
or
[
contribute a fix
](https://github.com/caronc/apprise-docs)
.
#### Technical Issues
Having trouble with the code? Open an issue on GitHub:
* [
Apprise Core & CLI
](https://github.com/caronc/apprise/issues/)
* [
Apprise API
](https://github.com/caronc/apprise-api/issues/)
Made with love from Canada