Exports media - error · Issue #2685 · Tautulli/Tautulli · GitHub
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
# Exports media - error #2685
New issue
New issue
Open
Open
[Exports media - error](#top)#2685
Labels
[fixed](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"fixed">)[priority:medium](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"priority:medium">)[topic:exporter](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"topic:exporter">)[type:bug](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"type:bug">)
[](https://github.com/gianfelicevincenzo)
## Description
[](https://github.com/gianfelicevincenzo)
[gianfelicevincenzo](https://github.com/gianfelicevincenzo)
opened [on Apr 14, 2026](https://github.com/Tautulli/Tautulli/issues/2685#issue-4261088019)
### Describe the Bug
```
`2026-04-14 11:21:28 - DEBUG :: CP Server Thread-9 : Tautulli Libraries :: Loaded media info from cache for section\_id 1 (10 items).
2026-04-14 11:22:09 - DEBUG :: CP Server Thread-5 : Tautulli Exporter :: Export called with section\_id 1, metadata\_level 9, media\_info\_level 9,thumb\_level 0, art\_level 0, logo\_level 0, squareArt\_level 0, theme\_level 0, export\_type all, file\_format csv
2026-04-14 11:22:09 - INFO :: Thread-17 (\_real\_export) : Tautulli Exporter :: Starting export for 'Library - Film - All [1]'...
2026-04-14 11:22:09 - INFO :: Thread-17 (\_real\_export) : Tautulli Exporter :: Exporting 10 item(s).
2026-04-14 11:22:11 - ERROR :: Thread-17 (\_real\_export) : Tautulli Exporter :: Failed to export 'Library - Film - All [1]': 'str' object has no attribute 'images'
Traceback (most recent call last):
File "/app/plexpy/exporter.py", line 2082, in \_real\_export
result = pool.map(self.\_do\_export, items)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/usr/local/lib/python3.11/multiprocessing/pool.py", line 367, in map
return self.\_map\_async(func, iterable, mapstar, chunksize).get()
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/usr/local/lib/python3.11/multiprocessing/pool.py", line 774, in get
raise self.\_value
File "/usr/local/lib/python3.11/multiprocessing/pool.py", line 125, in worker
result = (True, func(\*args, \*\*kwds))
^^^^^^^^^^^^^^^^^^^
File "/usr/local/lib/python3.11/multiprocessing/pool.py", line 48, in mapstar
return list(map(\*args))
^^^^^^^^^^^^^^^^
File "/app/plexpy/exporter.py", line 2115, in \_do\_export
result = item.\_export\_obj()
^^^^^^^^^^^^^^^^^^
File "/app/plexpy/exporter.py", line 2515, in \_export\_obj
result = self.export\_obj(self.obj)
^^^^^^^^^^^^^^^^^^^^^^^^^
File "/app/plexpy/exporter.py", line 2387, in export\_obj
return helpers.get\_attrs\_to\_dict(obj, attrs=export\_attrs)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
File "/app/plexpy/helpers.py", line 1318, in get\_attrs\_to\_dict
value = sub(value)
^^^^^^^^^^
File "/app/plexpy/exporter.py", line 399, in \<lambda\>
'squareArt': lambda o: next((i.url for i in o.images if i.type == 'backgroundSquare'), None),
^^^^^^^^
AttributeError: 'str' object has no attribute 'images'
`
```
### Steps to Reproduce
Go to library - export library
### Expected Behavior
Export must be done correctly
### Screenshots
[](https://private-user-images.githubusercontent.com/30395310/577890869-30f47289-af5e-4ed4-99a8-b66ae44dffe4.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Nzc2MzI0MzQsIm5iZiI6MTc3NzYzMjEzNCwicGF0aCI6Ii8zMDM5NTMxMC81Nzc4OTA4NjktMzBmNDcyODktYWY1ZS00ZWQ0LTk5YTgtYjY2YWU0NGRmZmU0LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MDElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTAxVDEwNDIxNFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTU2MWRiZTdjMWFhYWVlNWJmNjc4MGQwOWU3Zjk3ZDljNTE2YWU0NmRhYTkwYjAwNDdjZDNjYTFhNDQxMzU4OWMmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9.TqAP1xh1HDK0MM8wAOJAjEeBbGGWWELPYvbDn9Ui-9Y)
[](https://private-user-images.githubusercontent.com/30395310/577891175-94c84c40-4a89-4a79-ab21-0d4a5f7148b3.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Nzc2MzI0MzQsIm5iZiI6MTc3NzYzMjEzNCwicGF0aCI6Ii8zMDM5NTMxMC81Nzc4OTExNzUtOTRjODRjNDAtNGE4OS00YTc5LWFiMjEtMGQ0YTVmNzE0OGIzLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MDElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTAxVDEwNDIxNFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTM1NDNlMTlkMzIwZTdhYjYxNDRmMjY5NTMxZDlhNmUyYzZlNGM5Nzg2ZTc2YmJjN2U2MWU0MzQxODYxNjg4YzImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9.608kFjpK2I1B1QZFVI7z1RnSPK6WWqY_C6OVZl0H_m8)
### Relevant Settings
*No response*
### Tautulli Version
v2.17
### Git Branch
master
### Git Commit Hash
[5610c16](https://github.com/Tautulli/Tautulli/commit/5610c167a17b0898d93d0588a0df81c03306ac52)
### Platform and Version
Linux
### Python Version
3.11
### Browser and Version
Chrome
### Link to Logs
*
## Metadata
## Metadata
### Assignees
No one assigned
### Labels
[fixed](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"fixed">)[priority:medium](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"priority:medium">)[topic:exporter](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"topic:exporter">)[type:bug](<https://github.com/Tautulli/Tautulli/issues?q=state:open label:"type:bug">)
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