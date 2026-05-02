WebUI/RSS: Add option for rules to set the "Seed Limit" for the auto download torrents (already available in GUI) · Issue #19944 · qbittorrent/qBittorrent · GitHub
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
# WebUI/RSS: Add option for rules to set the "Seed Limit" for the auto download torrents (already available in GUI) #19944
New issue
New issue
Open
[#23951](https://github.com/qbittorrent/qBittorrent/pull/23951)
Open
[WebUI/RSS: Add option for rules to set the "Seed Limit" for the auto download torrents (already available in GUI) ](#top)#19944
[#23951](https://github.com/qbittorrent/qBittorrent/pull/23951)
Labels
[Feature request](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Feature request">)[RSSRSS-related issues/changes](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"RSS">)[WebUIWebUI-related issues/changes](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"WebUI">)
[](https://github.com/tainewoo)
## Description
[](https://github.com/tainewoo)
[tainewoo](https://github.com/tainewoo)
opened [on Nov 15, 2023](https://github.com/qbittorrent/qBittorrent/issues/19944#issue-1994143144)
### Suggestion
[Feature request] Add option for RSS rules to set the "Seed Limit" for the auto download torrents
Don't know if this feature need to be implemented by the qbittorrent core API or web UI.
If the WEB UI can achieve this, that would be great.
Currently we can only set the global "Seed Limit" under the qbittorrent option page "Bittorrent", section "Seed Limit".
As that's the global limit, if we only want to keep the global value unchanged, and only set the value for the new torrents that auto added by the RSS rule(s), we will need the option to be implemented in the RSS auto download rule, to set the "Seed Limit" and Behavior after the seed limit reached.
### Use case
For me, I have thousands of torrents seeding on my qbittorrent, and I will not remove them, I will keep seeding them for years, 7x24.
Besides of these torrents, I also adds some new torrents everyday, auto downloaded by the RSS rule.
I hope I can set the Seed Limit for these auto downloaded torrents by RSS rule. But there is no options available.
### Extra info/examples/attachments
[](https://private-user-images.githubusercontent.com/13391232/283025976-008fd3e2-59c3-4a9d-82dd-820585e011a0.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Nzc2MzI0ODgsIm5iZiI6MTc3NzYzMjE4OCwicGF0aCI6Ii8xMzM5MTIzMi8yODMwMjU5NzYtMDA4ZmQzZTItNTljMy00YTlkLTgyZGQtODIwNTg1ZTAxMWEwLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MDElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTAxVDEwNDMwOFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTc5YmYzYzY2NDdjZDBjOTU2MDU4YzQ4YzMwN2JjZWFjODRhYThhOWZiNzcwYjBkMTMxMjBmMTNiOTkzYjFhNmQmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9._81acMc8n6EF6xMIpxnOh97ffweEj-PpqQn4msoY7Dc)
## Metadata
## Metadata
### Assignees
No one assigned
### Labels
[Feature request](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"Feature request">)[RSSRSS-related issues/changes](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"RSS">)[WebUIWebUI-related issues/changes](<https://github.com/qbittorrent/qBittorrent/issues?q=state:open label:"WebUI">)
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