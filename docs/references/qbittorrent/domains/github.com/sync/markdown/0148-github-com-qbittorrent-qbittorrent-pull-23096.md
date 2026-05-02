WebUI: Support push notification by tehcneko · Pull Request #23096 · qbittorrent/qBittorrent · GitHub
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
## Conversation
[
](/tehcneko)
Copy link
Copy Markdown
Contributor
###
**
[tehcneko](/tehcneko)
**
commented
[Aug 12, 2025](#issue-3314135246)
&#8226;
edited
Loading
Implemented WebPush subscribe/unsubscribe/test with API from [#23095](https://github.com/qbittorrent/qBittorrent/pull/23095). Secure contexts(https/localhost) and Service Worker are required.
Options:
[](https://private-user-images.githubusercontent.com/88844448/477056289-bd5073cd-ad1f-4b57-85fb-836e5c683823.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Nzc2MzI0ODgsIm5iZiI6MTc3NzYzMjE4OCwicGF0aCI6Ii84ODg0NDQ0OC80NzcwNTYyODktYmQ1MDczY2QtYWQxZi00YjU3LTg1ZmItODM2ZTVjNjgzODIzLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MDElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTAxVDEwNDMwOFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWY0ZDI1NzU4YmIwOGFlMzRlZjY1YWU5NTc3ODY5NzNiMzllOTZkOGQ0NzFjMTdlZGNjZDE0NWNmOGVhMWU1YTEmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9.Z9gSZleikPehcLOyXyvxkYTlhP9jGfAzIwXaJXhnWgk)
Notification:
[](https://private-user-images.githubusercontent.com/88844448/477060082-5542d1b5-1c47-4ccd-8560-74a3d0b3c48f.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Nzc2MzI0ODgsIm5iZiI6MTc3NzYzMjE4OCwicGF0aCI6Ii84ODg0NDQ0OC80NzcwNjAwODItNTU0MmQxYjUtMWM0Ny00Y2NkLTg1NjAtNzRhM2QwYjNjNDhmLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MDElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTAxVDEwNDMwOFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWYxOWZlMzM4ZmU0ZWU5MTNmZjNhOGZlN2IyZWVhZTAzZGM2MTA4MmYyZThiYjY2MzYwOTFkYjIwMmQ2YjIyZWMmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9.9y2vHPAA5sId7PxuO2gRVHhhQM3MxexOVHiTGrMUcGg)
</option></form>
</option></form>
[](/tehcneko)
[tehcneko](/tehcneko)
mentioned this pull request
[
Aug 12, 2025
](#ref-pullrequest-3314070188)
[
WebAPI: Support push notification with WebPush
#23095
](/qbittorrent/qBittorrent/pull/23095)
Open
[](/apps/github-advanced-security)
**
[github-advanced-security](/apps/github-advanced-security)
AI
**
found potential problems
[
Aug 12, 2025
](#pullrequestreview-3110491803)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/23096/files)
Comment thread
[src/webui/www/private/sw-webui.js](/qbittorrent/qBittorrent/pull/23096/files#diff-f8af21a0f69eacf87c09cb9871ed043be474a4b9392f39b141e6e58b595c1ef8)
Fixed
Show fixed
Hide fixed
Comment thread
[src/webui/www/private/sw-webui.js](/qbittorrent/qBittorrent/pull/23096/files#diff-f8af21a0f69eacf87c09cb9871ed043be474a4b9392f39b141e6e58b595c1ef8)
Fixed
Show fixed
Hide fixed
[](/tehcneko)
[tehcneko](/tehcneko)
[force-pushed](/qbittorrent/qBittorrent/compare/3c8f271ed81c15ac36f6f2cf38c389dcaa00a660..af7a6d470d05fe1de4c68a4892c772045fec0727)
the
webui-webpush
branch
3 times, most recently
from
[`3c8f271`](/qbittorrent/qBittorrent/commit/3c8f271ed81c15ac36f6f2cf38c389dcaa00a660) to
[`af7a6d4`](/qbittorrent/qBittorrent/commit/af7a6d470d05fe1de4c68a4892c772045fec0727) [
Compare
](/qbittorrent/qBittorrent/compare/3c8f271ed81c15ac36f6f2cf38c389dcaa00a660..af7a6d470d05fe1de4c68a4892c772045fec0727)
[August 12, 2025 13:12](#event-19112399048)
[](/tehcneko)
[tehcneko](/tehcneko)
[force-pushed](/qbittorrent/qBittorrent/compare/af7a6d470d05fe1de4c68a4892c772045fec0727..a89fdc36147efc37cc0315f56a1c997af3934ba1)
the
webui-webpush
branch
from
[`af7a6d4`](/qbittorrent/qBittorrent/commit/af7a6d470d05fe1de4c68a4892c772045fec0727) to
[`a89fdc3`](/qbittorrent/qBittorrent/commit/a89fdc36147efc37cc0315f56a1c997af3934ba1) [
Compare
](/qbittorrent/qBittorrent/compare/af7a6d470d05fe1de4c68a4892c772045fec0727..a89fdc36147efc37cc0315f56a1c997af3934ba1)
[August 24, 2025 05:44](#event-19308602119)
[](/Piccirello)
[Piccirello](/Piccirello)
mentioned this pull request
[
Aug 22, 2025
](#ref-issue-376194225)
[
WebUi list of improvements that need to be made to the UI
#9796
](/qbittorrent/qBittorrent/issues/9796)
Open
61 tasks
[](/xavier2k6)
[xavier2k6](/xavier2k6)
added
the
[
WebUI
](</qbittorrent/qBittorrent/issues?q=state:open label:WebUI>)
WebUI-related issues/changes
label
[Sep 13, 2025](#event-19675311529)
[](/apps/github-actions)
Copy link
Copy Markdown
###
**
[github-actions](/apps/github-actions)
Bot
**
commented
[Nov 13, 2025](#issuecomment-3524490280)
|
This PR is stale because it has been 60 days with no activity. This PR will be automatically closed within 7 days if there is no further activity.
|
</option></form>
👎
1
ireun reacted with thumbs down emoji
</option></form>
[](/apps/github-actions)
[github-actions](/apps/github-actions)
Bot
added
the
[
Stale
](</qbittorrent/qBittorrent/issues?q=state:open label:Stale>)
label
[Nov 13, 2025](#event-20902068718)
[](/tehcneko)
[tehcneko](/tehcneko)
[force-pushed](/qbittorrent/qBittorrent/compare/a89fdc36147efc37cc0315f56a1c997af3934ba1..50621f76b6b68ded2d5931d4c4f96437e923ba8b)
the
webui-webpush
branch
from
[`a89fdc3`](/qbittorrent/qBittorrent/commit/a89fdc36147efc37cc0315f56a1c997af3934ba1) to
[`50621f7`](/qbittorrent/qBittorrent/commit/50621f76b6b68ded2d5931d4c4f96437e923ba8b) [
Compare
](/qbittorrent/qBittorrent/compare/a89fdc36147efc37cc0315f56a1c997af3934ba1..50621f76b6b68ded2d5931d4c4f96437e923ba8b)
[November 13, 2025 05:08](#event-20906626898)
[](/apps/github-actions)
[github-actions](/apps/github-actions)
Bot
removed
the
[
Stale
](</qbittorrent/qBittorrent/issues?q=state:open label:Stale>)
label
[Nov 14, 2025](#event-20930128366)
[](/tehcneko)
[tehcneko](/tehcneko)
[force-pushed](/qbittorrent/qBittorrent/compare/50621f76b6b68ded2d5931d4c4f96437e923ba8b..fd0caa8000333fe1a514b1e78f90111dd1564d2f)
the
webui-webpush
branch
from
[`50621f7`](/qbittorrent/qBittorrent/commit/50621f76b6b68ded2d5931d4c4f96437e923ba8b) to
[`fd0caa8`](/qbittorrent/qBittorrent/commit/fd0caa8000333fe1a514b1e78f90111dd1564d2f) [
Compare
](/qbittorrent/qBittorrent/compare/50621f76b6b68ded2d5931d4c4f96437e923ba8b..fd0caa8000333fe1a514b1e78f90111dd1564d2f)
[January 3, 2026 05:33](#event-21834547011)
[](/tehcneko)
[tehcneko](/tehcneko)
[force-pushed](/qbittorrent/qBittorrent/compare/c4881cf6a08d3b9d4d344357cae6324d4e37acba..dcfb6593e08cd7fd1c5ed65cc94b190afde8eb8e)
the
webui-webpush
branch
2 times, most recently
from
[`c4881cf`](/qbittorrent/qBittorrent/commit/c4881cf6a08d3b9d4d344357cae6324d4e37acba) to
[`dcfb659`](/qbittorrent/qBittorrent/commit/dcfb6593e08cd7fd1c5ed65cc94b190afde8eb8e) [
Compare
](/qbittorrent/qBittorrent/compare/c4881cf6a08d3b9d4d344357cae6324d4e37acba..dcfb6593e08cd7fd1c5ed65cc94b190afde8eb8e)
[March 1, 2026 08:59](#event-23167594351)
[](/apps/github-actions)
Copy link
Copy Markdown
###
**
[github-actions](/apps/github-actions)
Bot
**
commented
[May 1, 2026](#issuecomment-4357152192)
|
This PR is stale because it has been 60 days with no activity. This PR will be automatically closed within 7 days if there is no further activity.
|
</option></form>
</option></form>
[](/apps/github-actions)
[github-actions](/apps/github-actions)
Bot
added
the
[
Stale
](</qbittorrent/qBittorrent/issues?q=state:open label:Stale>)
label
[May 1, 2026](#event-25058147738)
[tehcneko](/tehcneko)
added 2 commits
[May 1, 2026 11:28](#commits-pushed-946deb9)
[
](/tehcneko)
`
[WebAPI: Support push notification with WebPush](/qbittorrent/qBittorrent/pull/23096/commits/946deb98040b444ef0f2ea74a72f171144ba294d)
`
`
[946deb9](/qbittorrent/qBittorrent/pull/23096/commits/946deb98040b444ef0f2ea74a72f171144ba294d)
`
[
](/tehcneko)
`
[WebUI: Support push notification](/qbittorrent/qBittorrent/pull/23096/commits/0f68a98758075f1d1ee48a22d71b95ba5134747c)
`
`
[0f68a98](/qbittorrent/qBittorrent/pull/23096/commits/0f68a98758075f1d1ee48a22d71b95ba5134747c)
`
[](/tehcneko)
[tehcneko](/tehcneko)
[force-pushed](/qbittorrent/qBittorrent/compare/dcfb6593e08cd7fd1c5ed65cc94b190afde8eb8e..0f68a98758075f1d1ee48a22d71b95ba5134747c)
the
webui-webpush
branch
from
[`dcfb659`](/qbittorrent/qBittorrent/commit/dcfb6593e08cd7fd1c5ed65cc94b190afde8eb8e) to
[`0f68a98`](/qbittorrent/qBittorrent/commit/0f68a98758075f1d1ee48a22d71b95ba5134747c) [
Compare
](/qbittorrent/qBittorrent/compare/dcfb6593e08cd7fd1c5ed65cc94b190afde8eb8e..0f68a98758075f1d1ee48a22d71b95ba5134747c)
[May 1, 2026 03:29](#event-25060741565)
</option></form>
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
[Sign up for free](/join?source=comment-repo)
**to join this conversation on GitHub**.
Already have an account?
[Sign in to comment](/login?return_to=https://github.com/qbittorrent/qBittorrent/pull/23096)
</option></form>
###
Reviewers
No reviews
</option></form>
###
Assignees
No one assigned
###
Labels
[
Stale
](</qbittorrent/qBittorrent/issues?q=state:open label:Stale>)
[
WebUI
](</qbittorrent/qBittorrent/issues?q=state:open label:WebUI>)
WebUI-related issues/changes
</option></form>
###
Projects
None yet
</option></form>
###
Milestone
No milestone
</option></form>
###
Development
Successfully merging this pull request may close these issues.
###
3 participants
[
](/tehcneko) [
](/apps/github-advanced-security) [
](/xavier2k6)