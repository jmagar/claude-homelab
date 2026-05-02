Version 2.17.0 breaks OneSignal notifications · Issue #2669 · Tautulli/Tautulli · GitHub
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
# Version 2.17.0 breaks OneSignal notifications #2669
New issue
New issue
Open
Open
[Version 2.17.0 breaks OneSignal notifications](#top)#2669
Labels
[fixed](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"fixed">)[priority:medium](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"priority:medium">)[topic:notifications](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"topic:notifications">)[type:bug](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"type:bug">)
[](https://github.com/derekn)
## Description
[](https://github.com/derekn)
[derekn](https://github.com/derekn)
opened [on Mar 28, 2026](https://github.com/Tautulli/Tautulli/issues/2669#issue-4161532930)
### Describe the Bug
After upgrading all remote app notifications stop working with the following errors in the log...
```
`2026-03-28 15:02:43 - INFO :: Thread-3 (process\_queue) : Tautulli Notifiers :: Sending Tautulli Remote App notification...
2026-03-28 15:02:43 - ERROR :: Thread-3 (process\_queue) : Tautulli NotificationHandler :: Notification thread exception: Object of type bytes is not JSON serializable
Traceback (most recent call last):
File "/app/plexpy/notification\_handler.py", line 60, in process\_queue
notify(\*\*params)
File "/app/plexpy/notification\_handler.py", line 423, in notify
success = notifiers.send\_notification(notifier\_id=notifier\_config['id'],
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/app/plexpy/notifiers.py", line 715, in send\_notification
return agent.notify(subject=subject,
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/app/plexpy/notifiers.py", line 973, in notify
return self.agent\_notify(subject=subject, body=body, action=action, \*\*kwargs)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/app/plexpy/notifiers.py", line 4085, in agent\_notify
return self.make\_request('https://api.onesignal.com/notifications', headers=headers, json=payload)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/app/plexpy/notifiers.py", line 980, in make\_request
response, err\_msg, req\_msg = request.request\_response2(url, method, \*\*kwargs)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/app/plexpy/request.py", line 160, in request\_response2
response = request\_method(url, \*\*kwargs)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/app/lib/requests/api.py", line 115, in post
return request("post", url, data=data, json=json, \*\*kwargs)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/app/lib/requests/api.py", line 59, in request
return session.request(method=method, url=url, \*\*kwargs)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/app/lib/requests/sessions.py", line 578, in request
prep = self.prepare\_request(req)
^^^^^^^^^^^^^^^^^^^^^^^^^
File "/app/lib/requests/sessions.py", line 487, in prepare\_request
p.prepare(
File "/app/lib/requests/models.py", line 372, in prepare
self.prepare\_body(data, files, json)
File "/app/lib/requests/models.py", line 512, in prepare\_body
body = complexjson.dumps(json, allow\_nan=False)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/usr/local/lib/python3.11/json/\_\_init\_\_.py", line 238, in dumps
\*\*kw).encode(obj)
^^^^^^^^^^^
File "/usr/local/lib/python3.11/json/encoder.py", line 200, in encode
chunks = self.iterencode(o, \_one\_shot=True)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/usr/local/lib/python3.11/json/encoder.py", line 258, in iterencode
return \_iterencode(o, 0)
^^^^^^^^^^^^^^^^^
File "/usr/local/lib/python3.11/json/encoder.py", line 180, in default
raise TypeError(f'Object of type {o.\_\_class\_\_.\_\_name\_\_} '
TypeError: Object of type bytes is not JSON serializable
`
```
I've confirmed this on multiple servers and devices.
### Steps to Reproduce
1. Upgrade to latest version of Tautulli
2. Send a test notification to a remote app agent
### Expected Behavior
Notifications should continue to work after upgrading
### Screenshots
*No response*
### Relevant Settings
Latest version of Tautulli running in Docker
### Tautulli Version
2.17.0
### Git Branch
master
### Git Commit Hash
[5610c16](https://github.com/Tautulli/Tautulli/commit/5610c167a17b0898d93d0588a0df81c03306ac52)
### Platform and Version
[Docker] Linux 4.4.302+ (#64570 SMP Thu Jul 20 00:07:29 CST 2023 - Debian GNU/Linux 13 trixie)
### Python Version
3.11.15 (main, Mar 16 2026, 23:07:56) [GCC 14.2.0]
### Browser and Version
Firefox latest
### Link to Logs
na
## Metadata
## Metadata
### Assignees
No one assigned
### Labels
[fixed](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"fixed">)[priority:medium](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"priority:medium">)[topic:notifications](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"topic:notifications">)[type:bug](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"type:bug">)
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