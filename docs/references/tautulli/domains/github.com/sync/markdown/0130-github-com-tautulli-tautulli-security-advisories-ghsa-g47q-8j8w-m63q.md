SQL Injection in get\_home\_stats API endpoint via unsanitised filter parameters · Advisory · Tautulli/Tautulli · GitHub
[Skip to content](#start-of-content)
{{ message }}
[
Tautulli
](/Tautulli)
/
**
[Tautulli](/Tautulli/Tautulli)
**
Public
*
* [ Notifications
](/login?return_to=/Tautulli/Tautulli) You must be signed in to change notification settings
* [ Fork
623
](/login?return_to=/Tautulli/Tautulli)
*
[
Star
6.5k
](/login?return_to=/Tautulli/Tautulli)
#
SQL Injection in get\_home\_stats API endpoint via unsanitised filter parameters
Moderate
[JonnyWong16](/JonnyWong16)
published
GHSA-g47q-8j8w-m63q
Mar 28, 2026
## Package
No package listed
## Affected versions
\>2.14.2
## Patched versions
2.16.2
## Description
## Summary
The `/api/v2?cmd=get\_home\_stats` endpoint passes the `section\_id`, `user\_id`, `before`, and `after` query parameters directly into SQL via Python `%`-string formatting without parameterisation. An attacker who holds the Tautulli admin API key can inject arbitrary SQL and exfiltrate any value from the Tautulli SQLite database via boolean-blind inference.
## Affected Versions
|Parameter(s)|Introduced|Affected|
|`section\_id`, `user\_id`|v2.1.x or earlier (commit `c0a5a8d`, April 2016)|All versions through v2.16.1|
|`before`, `after`|v2.14.2 (commit `fcd8ef11`, March 2024)|v2.14.2 through v2.16.1|
## Details
**Vulnerable code, `plexpy/datafactory.py`:**
```
# Lines 383-385, unquoted integer context; no escaping needed
where\_id += 'AND session\_history.section\_id = %s ' % section\_id
where\_id += 'AND session\_history.user\_id = %s ' % user\_id
# Lines 368 / 373, single-quoted string context
where\_timeframe += "... \<= '%s' " % before
where\_timeframe += "... \>= '%s' " % after
```
Because `section\_id` and `user\_id` are substituted without surrounding quotes, no delimiter escaping is required to break out of a string literal.
## Data reachable via injection:
* `users.server\_token`, Plex Media Server API token for each Plex user
* `users.user\_token`, Plex.tv OAuth token
* `session\_history.\*`, complete watch history for all users
* `user\_login.ip\_address`, `user\_login.user\_agent`, login audit log (IPs and user agents)
The injection sits inside a SELECT statement's WHERE clause. Write operations (INSERT/UPDATE/DELETE) are not directly reachable from this vector, as SQLite's Python sqlite3 module rejects multi-statement execution.
## Proof of Concept
```
` # Injection proof: deliberately malformed token causes a SQL parse-time error.
# sqlite3\_prepare\_v2() validates syntax before scanning any rows, so this
# works even on instances with no watch history recorded.
# Control (valid SQL) - expect result="success"
curl -s "http://TAUTULLI:8181/api/v2?cmd=get\_home\_stats&apikey=APIKEY&section\_id=0"
# Injected (syntax error) - expect result="error"
curl -s "http://TAUTULLI:8181/api/v2?cmd=get\_home\_stats&apikey=APIKEY&section\_id=0+SQLI\_PROOF"
# Boolean TRUE (on instances with watch history, returns data)
curl -s "http://TAUTULLI:8181/api/v2?cmd=get\_home\_stats&apikey=APIKEY&section\_id=999999+OR+1=1"
# Boolean FALSE (triggers SQLite division-by-zero, returns result="error")
curl -s "http://TAUTULLI:8181/api/v2?cmd=get\_home\_stats&apikey=APIKEY&section\_id=999999+OR+1=2"
`
```
## Impact
Using boolean-blind injection an attacker can extract any value from the database character-by-character (\~100 requests per character).
Note on severity: Exploitation requires a valid admin API key. A holder of that key already has full administrative access to Tautulli's UI, including the built-in Notification Agent script runner, which provides direct OS-level command execution. This vulnerability does not represent a privilege escalation beyond what admin access already allows. The primary residual risk is that it enables exfiltration of Plex authentication tokens for other users in a way that may be harder to detect than direct UI access.
## Remediation
Replace %-string formatting with SQLite parameterised queries in `plexpy/datafactory.py`:
```
` # Before (vulnerable)
where\_id += 'AND session\_history.section\_id = %s ' % section\_id
# After (safe)
where\_id += 'AND session\_history.section\_id = ? '
where\_id\_params.append(section\_id)
# Pass the collected params to every monitor\_db.select() call
result = monitor\_db.select(query, where\_timeframe\_params + where\_id\_params)
The same pattern applies to user\_id, before, and after.
`
```
### Severity
Moderate
4.9
#
CVSS overall score
This score calculates overall vulnerability severity from 0 to 10 and is based on the Common Vulnerability Scoring System (CVSS).
/ 10
#### CVSS v3 base metrics
Attack vector
Network
Attack complexity
Low
Privileges required
High
User interaction
None
Scope
Unchanged
Confidentiality
High
Integrity
None
Availability
None
Learn more about base metrics
#
CVSS v3 base metrics
Attack vector:
More severe the more the remote (logically and physically) an attacker can be in order to exploit the vulnerability.
Attack complexity:
More severe for the least complex attacks.
Privileges required:
More severe if no privileges are required.
User interaction:
More severe when no user interaction is required.
Scope:
More severe when a scope change occurs, e.g. one vulnerable component impacts resources in components beyond its security scope.
Confidentiality:
More severe when loss of data confidentiality is highest, measuring the level of data access available to an unauthorized user.
Integrity:
More severe when loss of data integrity is the highest, measuring the consequence of data modification possible by an unauthorized user.
Availability:
More severe when the loss of impacted component availability is highest.
CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:H/I:N/A:N
### CVE ID
CVE-2026-31799
### Weaknesses
Weakness
CWE-20
####
[Improper Input Validation](/advisories?query=cwe:20)
The product receives input or data, but it does not validate or incorrectly validates that the input has the properties that are required to process the data safely and correctly.
[Learn more on MITRE.](https://cwe.mitre.org/data/definitions/20.html)
Weakness
CWE-89
####
[Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')](/advisories?query=cwe:89)
The product constructs all or part of an SQL command using externally-influenced input from an upstream component, but it does not neutralize or incorrectly neutralizes special elements that could modify the intended SQL command when it is sent to a downstream component. Without sufficient removal or quoting of SQL syntax in user-controllable inputs, the generated SQL query can cause those inputs to be interpreted as SQL instead of ordinary user data.
[Learn more on MITRE.](https://cwe.mitre.org/data/definitions/89.html)
### Credits
* [](/mandreko)[
mandreko](/mandreko)
Reporter