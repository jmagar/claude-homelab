Unauthenticated Path Traversal in `/newsletter/image/images` endpoint · Advisory · Tautulli/Tautulli · GitHub
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
Unauthenticated Path Traversal in `/newsletter/image/images` endpoint
High
[JonnyWong16](/JonnyWong16)
published
GHSA-xp55-2pf4-fv8m
Mar 28, 2026
## Package
No package listed
## Affected versions
\<=2.16.1
## Patched versions
2.17.0
## Description
### Summary
The `/newsletter/image/images` API endpoint in Tautulli v2.16.1 is vulnerable to path traversal, allowing unauthenticated attackers to read arbitrary files from the application server's filesystem.
### Details
Basically, the same as CVE-2025-58760 but different endpoint.
### PoC
Paths are relative for the docker build
```
wget http://\<tautulli\_ip\>:\<tautulli\_port\>/newsletter/image/images/..%2F..%2F..%2F..%2F..%2F..%2Fconfig%2Fconfig.ini -O config.ini
wget http://\<tautulli\_ip\>:\<tautulli\_port\>/newsletter/image/images/..%2F..%2F..%2F..%2F..%2F..%2Fconfig%2Ftautulli.db -O tautulli.db
```
### Impact
Attackers can exfiltrate files from the application file system, including the tautulli.db SQLite database containing active JWT tokens, as well as the config.ini file which contains the hashed admin password, the JWT token secret, and the Plex Media Server token and connection details.
If the password is cracked, or if a valid JWT token is present in the database, an unauthenticated attacker can escalate their privileges to obtain administrative control over the application.
### Severity
High
### CVE ID
CVE-2026-31831
### Weaknesses
Weakness
CWE-23
####
[Relative Path Traversal](/advisories?query=cwe:23)
The product uses external input to construct a pathname that should be within a restricted directory, but it does not properly neutralize sequences such as .. that can resolve to a location that is outside of that directory.
[Learn more on MITRE.](https://cwe.mitre.org/data/definitions/23.html)
### Credits
* [](/JakePeralta7)[
JakePeralta7](/JakePeralta7)
Reporter