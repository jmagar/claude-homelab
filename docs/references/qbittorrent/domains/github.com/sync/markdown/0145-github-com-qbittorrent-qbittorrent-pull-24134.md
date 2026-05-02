WebUI: Unify global speed limit window by tehcneko · Pull Request #24134 · qbittorrent/qBittorrent · GitHub
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
[Apr 29, 2026](#issue-4350044020)
&#8226;
edited
Loading
|GUI|Old|New|
|[](https://private-user-images.githubusercontent.com/88844448/585371893-05220a22-c7fe-45fa-85e8-0dda143e31bb.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Nzc2MzI0ODgsIm5iZiI6MTc3NzYzMjE4OCwicGF0aCI6Ii84ODg0NDQ0OC81ODUzNzE4OTMtMDUyMjBhMjItYzdmZS00NWZhLTg1ZTgtMGRkYTE0M2UzMWJiLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MDElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTAxVDEwNDMwOFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWM1NDY2ODE2MzJkZGI1NjA3NWY0NmM1NzE5ZGYwYjc2Y2VmM2NkMmNlODZiMmY1M2MxNjczNTVhN2YxOTU0NmYmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9.LjA54KsPWHgVTBhy8omkGDBFwGBWqyYFfVnN8tAjtLw)|[](https://private-user-images.githubusercontent.com/88844448/585372249-d31e296d-2eea-448f-939a-4f14947d76b2.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Nzc2MzI0ODgsIm5iZiI6MTc3NzYzMjE4OCwicGF0aCI6Ii84ODg0NDQ0OC81ODUzNzIyNDktZDMxZTI5NmQtMmVlYS00NDhmLTkzOWEtNGYxNDk0N2Q3NmIyLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MDElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTAxVDEwNDMwOFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWJjOGU1ODM1YzdlZDI0NTY2YmIwZTZlYWIzOWNlODM3M2U4NmFiMThmMzUzYWZhMWIyYWE0MGQwOWRkODVkMjEmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9.VcIjbuXykyrCPcMNhyXGhHX4XNYrtzKE3u_SYhGj01A)|[](https://private-user-images.githubusercontent.com/88844448/585378687-2a2a4396-4467-441b-9e09-27ee03515d99.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Nzc2MzI0ODgsIm5iZiI6MTc3NzYzMjE4OCwicGF0aCI6Ii84ODg0NDQ0OC81ODUzNzg2ODctMmEyYTQzOTYtNDQ2Ny00NDFiLTllMDktMjdlZTAzNTE1ZDk5LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjA1MDElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwNTAxVDEwNDMwOFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTg0OGQ4Y2U2MjdmZTU2NWRkZjQzNjE1MTZjMzc0N2YwNmI5ODkxNGI1YzgzNWI2NGMxMzM3ZDdjMWU0MjBkNTkmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JnJlc3BvbnNlLWNvbnRlbnQtdHlwZT1pbWFnZSUyRnBuZyJ9.v2BiZjajJ7RJjcoJu9D-5RJgZ9H77DLKWi5KCzz3B-U)|
</option></form>
</option></form>
[](/tehcneko)
[tehcneko](/tehcneko)
[force-pushed](/qbittorrent/qBittorrent/compare/e2a5396c53d886eabdde6cc26e2d174f92bd4dfb..e1dbac8b8c918f0d6f7540f5dfb06656e039ae70)
the
webui-speedlimit
branch
2 times, most recently
from
[`e2a5396`](/qbittorrent/qBittorrent/commit/e2a5396c53d886eabdde6cc26e2d174f92bd4dfb) to
[`e1dbac8`](/qbittorrent/qBittorrent/commit/e1dbac8b8c918f0d6f7540f5dfb06656e039ae70) [
Compare
](/qbittorrent/qBittorrent/compare/e2a5396c53d886eabdde6cc26e2d174f92bd4dfb..e1dbac8b8c918f0d6f7540f5dfb06656e039ae70)
[April 29, 2026 11:29](#event-24987447278)
[](/glassez)
**
[glassez](/glassez)
**
requested changes
[
Apr 29, 2026
](#pullrequestreview-4197323260)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/24134/files)
Comment thread
[src/webui/api/transfercontroller.cpp](/qbittorrent/qBittorrent/pull/24134/files#diff-b5c1d1f93bc04466e1c97b92d37596ccb4b5b163c20368d03fada9794bd455e5)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/api/transfercontroller.cpp](/qbittorrent/qBittorrent/pull/24134/files#diff-b5c1d1f93bc04466e1c97b92d37596ccb4b5b163c20368d03fada9794bd455e5)
Outdated
Show resolved
Hide resolved
[](/tehcneko)
[tehcneko](/tehcneko)
[force-pushed](/qbittorrent/qBittorrent/compare/7abce7cb7e83e926aafa07786a7a0192a1a675a3..e0f90770642437a59879c1464eafb79ca4ff69ce)
the
webui-speedlimit
branch
from
[`7abce7c`](/qbittorrent/qBittorrent/commit/7abce7cb7e83e926aafa07786a7a0192a1a675a3) to
[`e0f9077`](/qbittorrent/qBittorrent/commit/e0f90770642437a59879c1464eafb79ca4ff69ce) [
Compare
](/qbittorrent/qBittorrent/compare/7abce7cb7e83e926aafa07786a7a0192a1a675a3..e0f90770642437a59879c1464eafb79ca4ff69ce)
[April 30, 2026 02:52](#event-25016714589)
[](/glassez)
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
commented
[Apr 30, 2026](#issuecomment-4349440840)
|
[@tehcneko](https://github.com/tehcneko)
I see that you've added a new WebAPI endpoint to get all four limits. But which endpoint did the old WebUI dialog use? (Unfortunately, the WebUI code is unclear to me, and it's easier for me to ask you about it than to poke around in it myself).
|
</option></form>
</option></form>
[](/tehcneko)
Copy link
Copy Markdown
Contributor
Author
###
**
[tehcneko](/tehcneko)
**
commented
[Apr 30, 2026](#issuecomment-4349450607)
&#8226;
edited
Loading
|
[@glassez](https://github.com/glassez) The old one uses separated "downloadLimit/uploadLimit", it's designed to get the currently active (non-alt/alt) speed limit.
|
</option></form>
</option></form>
[](/thalieht)
Copy link
Copy Markdown
Contributor
###
**
[thalieht](/thalieht)
**
commented
[Apr 30, 2026](#issuecomment-4352831315)
|
I get a blank dialog with "Not found" in it. Firefox.
|
</option></form>
</option></form>
[](/glassez)
[glassez](/glassez)
changed the title
~~WebUI: Unified global speed limit window~~
WebUI: Unify global speed limit window
[Apr 30, 2026](#event-25044702017)
[](/glassez)
**
[glassez](/glassez)
**
reviewed
[
Apr 30, 2026
](#pullrequestreview-4207166098)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/24134/files)
Comment thread
[src/webui/webapplication.h](/qbittorrent/qBittorrent/pull/24134/files#diff-13474ccd513f95826cbe8c120f2b739c0461d6d05a67fbaf6be8143a6f9d55c7)
Outdated
Show resolved
Hide resolved
[](/glassez)
[glassez](/glassez)
added
[
WebUI
](</qbittorrent/qBittorrent/issues?q=state:open label:WebUI>)
WebUI-related issues/changes
[
WebAPI
](</qbittorrent/qBittorrent/issues?q=state:open label:WebAPI>)
WebAPI-related issues/changes
[
Feature
](</qbittorrent/qBittorrent/issues?q=state:open label:Feature>)
Implement new feature/subsystem
labels
[Apr 30, 2026](#event-25044815320)
[](/glassez)
[glassez](/glassez)
added this to the
[5.3](/qbittorrent/qBittorrent/milestone/105) milestone
[Apr 30, 2026](#event-25044823200)
[
](/tehcneko) [
](/glassez)
`
[WebUI: Unified global speed limit window](/qbittorrent/qBittorrent/pull/24134/commits/4a045ec4df9130668a99d747802d2a1921e4e859)
`
&hellip;
`
[4a045ec](/qbittorrent/qBittorrent/pull/24134/commits/4a045ec4df9130668a99d747802d2a1921e4e859)
`
```
Co-authored-by: Vladimir Golovnev \<glassez@yandex.ru\>
```
[](/tehcneko)
[tehcneko](/tehcneko)
[force-pushed](/qbittorrent/qBittorrent/compare/5c8f81469b641df240de9006228f3f6d182c875c..4a045ec4df9130668a99d747802d2a1921e4e859)
the
webui-speedlimit
branch
from
[`5c8f814`](/qbittorrent/qBittorrent/commit/5c8f81469b641df240de9006228f3f6d182c875c) to
[`4a045ec`](/qbittorrent/qBittorrent/commit/4a045ec4df9130668a99d747802d2a1921e4e859) [
Compare
](/qbittorrent/qBittorrent/compare/5c8f81469b641df240de9006228f3f6d182c875c..4a045ec4df9130668a99d747802d2a1921e4e859)
[May 1, 2026 01:56](#event-25059298510)
</option></form>
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
[Sign up for free](/join?source=comment-repo)
**to join this conversation on GitHub**.
Already have an account?
[Sign in to comment](/login?return_to=https://github.com/qbittorrent/qBittorrent/pull/24134)
</option></form>
###
Reviewers
[
](/glassez) [
glassez
](/glassez)
[
](/qbittorrent/qBittorrent/pull/24134/files/5c8f81469b641df240de9006228f3f6d182c875c)
glassez requested changes
Requested changes must be addressed to merge this pull request.
</option></form>
###
Assignees
No one assigned
###
Labels
[
Feature
](</qbittorrent/qBittorrent/issues?q=state:open label:Feature>)
Implement new feature/subsystem
[
WebAPI
](</qbittorrent/qBittorrent/issues?q=state:open label:WebAPI>)
WebAPI-related issues/changes
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
[
**5.3**
](/qbittorrent/qBittorrent/milestone/105)
</option></form>
###
Development
Successfully merging this pull request may close these issues.
###
3 participants
[
](/tehcneko) [
](/glassez) [
](/thalieht)