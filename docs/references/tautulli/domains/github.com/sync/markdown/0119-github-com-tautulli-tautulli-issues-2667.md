2.17.0 SimpleJson · Issue #2667 · Tautulli/Tautulli · GitHub
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
# 2.17.0 SimpleJson #2667
New issue
New issue
Open
Open
[2.17.0 SimpleJson](#top)#2667
Labels
[fixed](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"fixed">)[type:bug](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"type:bug">)
[](https://github.com/GreatHolyCow)
## Description
[](https://github.com/GreatHolyCow)
[GreatHolyCow](https://github.com/GreatHolyCow)
opened [on Mar 28, 2026](https://github.com/Tautulli/Tautulli/issues/2667#issue-4157061926)
### Describe the Bug
Upgraded to 2.17.0 failed to start now complaining about SimpleJSON, I noticed in a recent update it was removed from requirements.txt but Tautulli wouldnt start with out it being installed.
>
> Mar 27 19:32:58 systemd[1]: Started tautulli.service - Tautulli - Stats for Plex Media Server usage.
> Mar 27 19:32:58 python3[1427637]: Traceback (most recent call last):
> Mar 27 19:32:58 python3[1427637]: File "/opt/Tautulli/Tautulli.py", line 39, in
> Mar 27 19:32:58 python3[1427637]: import plexpy
> Mar 27 19:32:58 python3[1427637]: File "/opt/Tautulli/plexpy/
**> init
**> .py", line 37, in
> Mar 27 19:32:58 python3[1427637]: from plexpy import activity_handler
> Mar 27 19:32:58 python3[1427637]: File "/opt/Tautulli/plexpy/activity_handler.py", line 23, in
> Mar 27 19:32:58 python3[1427637]: from plexpy import activity_processor
> Mar 27 19:32:58 python3[1427637]: File "/opt/Tautulli/plexpy/activity_processor.py", line 20, in
> Mar 27 19:32:58 python3[1427637]: from plexpy import database
> Mar 27 19:32:58 python3[1427637]: File "/opt/Tautulli/plexpy/database.py", line 23, in
> Mar 27 19:32:58 python3[1427637]: from plexpy import helpers
> Mar 27 19:32:58 python3[1427637]: File "/opt/Tautulli/plexpy/helpers.py", line 51, in
> Mar 27 19:32:58 python3[1427637]: from plexpy import logger
> Mar 27 19:32:58 python3[1427637]: File "/opt/Tautulli/plexpy/logger.py", line 20, in
> Mar 27 19:32:58 python3[1427637]: import cherrypy
> Mar 27 19:32:58 python3[1427637]: File "/opt/Tautulli/lib/cherrypy/
**> init
**> .py", line 75, in
> Mar 27 19:32:58 python3[1427637]: from ._cptools import default_toolbox as tools, Tool
> Mar 27 19:32:58 python3[1427637]: File "/opt/Tautulli/lib/cherrypy/_cptools.py", line 28, in
> Mar 27 19:32:58 python3[1427637]: from cherrypy.lib import cptools, encoding, static, jsontools
> Mar 27 19:32:58 python3[1427637]: File "/opt/Tautulli/lib/cherrypy/lib/jsontools.py", line 2, in
> Mar 27 19:32:58 python3[1427637]: from cherrypy import _json as json
> Mar 27 19:32:58 python3[1427637]: File "/opt/Tautulli/lib/cherrypy/_json.py", line 17, in
> Mar 27 19:32:58 python3[1427637]: decode = json.JSONDecoder().decode
> Mar 27 19:32:58 python3[1427637]: ^^^^^^^^^^^^^^^^
> Mar 27 19:32:58 python3[1427637]: AttributeError: module 'simplejson' has no attribute 'JSONDecoder'
>
### Steps to Reproduce
Upgrade to 2.17.0 via Web interface
Tautulli fails to start.
Install python3-simplejson
Restart Tautulli
Works.
### Expected Behavior
Upgrade to 2.17.0 via Web interface
Works no problem.
### Screenshots
*No response*
### Relevant Settings
*No response*
### Tautulli Version
2.17.0
### Git Branch
master
### Git Commit Hash
[5610c16](https://github.com/Tautulli/Tautulli/commit/5610c167a17b0898d93d0588a0df81c03306ac52)
### Platform and Version
Ubuntu
### Python Version
3.12.3
### Browser and Version
Chrome 146.0.7680.165
### Link to Logs
[https://gist.github.com/GreatHolyCow/14b422d73b68217fa0c4d93040079500](https://gist.github.com/GreatHolyCow/14b422d73b68217fa0c4d93040079500)
## Metadata
## Metadata
### Assignees
No one assigned
### Labels
[fixed](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"fixed">)[type:bug](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"type:bug">)
### Type
No type
### Projects
No projects
### Milestone
No milestone
### Relationships
None yet
### Development
No branches or pull requests
## Issue actions