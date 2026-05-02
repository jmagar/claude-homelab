Crash when checking torrent with piece size of 256.0 MiB · Issue #21011 · qbittorrent/qBittorrent · GitHub
[Skip to content](#start-of-content)
{{ message }}
[
qbittorrent
](/qbittorrent)
/
**
[qBittorrent](/qbittorrent/qBittorrent)
**
Public
*
* [ Notifications
](/login?return_to=/qbittorrent/qBittorrent) You must be signed in to change notification settings
* [ Fork
4.6k
](/login?return_to=/qbittorrent/qBittorrent)
*
[
Star
36.8k
](/login?return_to=/qbittorrent/qBittorrent)
# Crash when checking torrent with piece size of 256.0 MiB #21011
New issue
New issue
Open
Open
[Crash when checking torrent with piece size of 256.0 MiB](#top)#21011
Labels
[Confirmed bugAn issue confirmed by project team to be considered as a bug](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Confirmed bug">)[Crash](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Crash">)[Libtorrent](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Libtorrent">)[Waiting upstreamWaiting for changes in dependent libraries](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Waiting upstream">)
[](https://github.com/YouMiNope)
## Description
[](https://github.com/YouMiNope)
[YouMiNope](https://github.com/YouMiNope)
opened [on Jun 30, 2024](https://github.com/qbittorrent/qBittorrent/issues/21011#issue-2382088452)
### qBittorrent & operating system versions
qBittorrent: 4.6.5 x64
Operating system: Windows 10 22H2
### What is the problem?
I have a torrent that contains 3813 files with a total size of 279.43GiB, when checking it consumes all my 16Gb RAM and then crash. I assume there is some algorithm flaw in the checking codes that need to be fixed.
### Steps to reproduce
1. check a LARGE size torrent (in my case, 279.43GiB)
2. you wait the memory fill up
3. witness your computer crash
### Additional context
My RAM useage:
[](https://private-user-images.githubusercontent.com/47452742/344444174-c21e764b-2638-4bad-821f-d2f22dd519a9.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Nzc2MzI0ODgsIm5iZiI6MTc3NzYzMjE4OCwicGF0aCI6Ii80NzQ1Mjc0Mi8zNDQ0NDQxNzQtYzIxZTc2NGItMjYzOC00YmFkLTgyMWYtZDJmMjJkZDUxOWE5LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MDElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTAxVDEwNDMwOFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTE2YzBhNWZiOWU4NTQ2ODE0NDRjYjIzNDYxMDZkMmU1Yzc4NzJjNDg5MjQ5MDM0MDg5NmY0NTJlMzkwYWIyN2YmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9.bmgY8F6DieXpHBO-euJ9VTvYiLs5iR0yY1XxnNAF7Yg)
qbittorrent:
[](https://private-user-images.githubusercontent.com/47452742/344444198-565d8123-dfaf-41f4-be30-f256346c9656.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Nzc2MzI0ODgsIm5iZiI6MTc3NzYzMjE4OCwicGF0aCI6Ii80NzQ1Mjc0Mi8zNDQ0NDQxOTgtNTY1ZDgxMjMtZGZhZi00MWY0LWJlMzAtZjI1NjM0NmM5NjU2LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MDElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTAxVDEwNDMwOFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWUxMjNhNWM5ZDFmYjhkZTg1OTZkOGZmMmJkYjcxZTJiYmY2OWNhMmRlZmFiMDRkNzI1MTEyYjY0ODM1OTc3YmUmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9.fO_awALeIAYn7Zto0DMP83cNuGgtpk1KM6YL49s0Ntk)
### Log(s) & preferences file(s)
*No response*
## Metadata
## Metadata
### Assignees
No one assigned
### Labels
[Confirmed bugAn issue confirmed by project team to be considered as a bug](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Confirmed bug">)[Crash](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Crash">)[Libtorrent](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Libtorrent">)[Waiting upstreamWaiting for changes in dependent libraries](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Waiting upstream">)
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