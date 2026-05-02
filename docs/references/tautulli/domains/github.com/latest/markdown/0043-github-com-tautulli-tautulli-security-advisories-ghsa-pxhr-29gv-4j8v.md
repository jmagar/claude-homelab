Authenticated Remote Code Execution via write primitive and `Script` notification agent · Advisory · Tautulli/Tautulli · GitHub
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
Authenticated Remote Code Execution via write primitive and `Script` notification agent
Critical
[JonnyWong16](/JonnyWong16)
published
GHSA-pxhr-29gv-4j8v
Sep 9, 2025
## Package
No package listed
## Affected versions
\<=2.15.3
## Patched versions
2.16.0
## Description
### Summary
In Tautulli v2.15.3, an attacker with administrative access can use the `pms\_image\_proxy` endpoint to write arbitrary python scripts into the application filesystem. This leads to remote code execution when combined with the `Script` notification agent.
### Details
If an attacker with administrative access changes the URL of the PMS to a server they control, they can then abuse the `pms\_image\_proxy` to obtain a file write into the application filesystem.
This can be done by making a `pms\_image\_proxy` request with a URL in the `img` parameter and the desired file name in the `img\_format` parameter. Tautulli then uses a hash of the desired metadata together with the `img\_format` in order to construct a file path.
```
img\_hash = notification\_handler.set\_hash\_image\_info(
img=img, rating\_key=rating\_key, width=width, height=height,
opacity=opacity, background=background, blur=blur, fallback=fallback,
add\_to\_db=return\_hash)
if return\_hash:
return {'img\_hash': img\_hash}
fp = '{}.{}'.format(img\_hash, img\_format) # we want to be able to preview the thumbs
c\_dir = os.path.join(plexpy.CONFIG.CACHE\_DIR, 'images')
ffp = os.path.join(c\_dir, fp)
```
Since the attacker controls `img\_format` which occupies the end of the file path, and `img\_format` is not sanitised, the attacker can then use path traversal characters to specify filename of their choosing.
If the specified file does not exist, Tautaulli will then attempt to fetch the image from the configured PMS. Since the attacker controls the PMS, they can return arbitrary content in response to this request, which will then be written into the specified file.
```
if not os.path.exists(c\_dir):
os.mkdir(c\_dir)
clip = helpers.bool\_true(clip)
try:
if not plexpy.CONFIG.CACHE\_IMAGES or refresh or 'indexes' in img:
raise NotFound
return serve\_file(path=ffp, content\_type='image/png')
except NotFound:
# the image does not exist, download it from pms
try:
pms\_connect = pmsconnect.PmsConnect()
pms\_connect.request\_handler.\_silent = True
result = pms\_connect.get\_image(img=img,
width=width,
height=height,
opacity=opacity,
background=background,
blur=blur,
img\_format=img\_format,
clip=clip,
refresh=refresh)
if result and result[0]:
cherrypy.response.headers['Content-type'] = result[1]
if plexpy.CONFIG.CACHE\_IMAGES and 'indexes' not in img:
with open(ffp, 'wb') as f:
f.write(result[0])
return result[0]
else:
raise Exception('PMS image request failed')
```
Using this primitive, an attacker can write an arbitrary python script into a location on the application file system. The attacker can then make use of the built-in `Script` notification agent to run the local script, obtaining remote code execution on the application server.
### Severity
Critical
9.1
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
Changed
Confidentiality
High
Integrity
High
Availability
High
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
CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:C/C:H/I:H/A:H
### CVE ID
CVE-2025-58762
### Weaknesses
No CWEs
### Credits
* [](/d-xuan)[
d-xuan](/d-xuan)
Reporter