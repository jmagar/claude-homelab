Bump WebAPI version by glassez · Pull Request #14275 · qbittorrent/qBittorrent · GitHub
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
](/glassez)
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
commented
[Jan 23, 2021](#issue-792531722)
[#13995](https://github.com/qbittorrent/qBittorrent/pull/13995) was supposed to be included in the release along with other API changes, so both PRs had a version change to 2.7.0. However, it ended up in another release, and I forgot to upgrade the version again.
Unfortunately, it is unlikely to fix a problem like [#14266](https://github.com/qbittorrent/qBittorrent/issues/14266), but at least it will fix it for users of intermediate/test builds.
@qbittorrent/bug-handlers, what do you think?
</option></form>
</option></form>
[
](/glassez)
`
[Bump WebAPI version](/qbittorrent/qBittorrent/pull/14275/commits/5b495e2f51ebb74dd6b7440fba0c4a0842287f8c)
`
`
[5b495e2](/qbittorrent/qBittorrent/pull/14275/commits/5b495e2f51ebb74dd6b7440fba0c4a0842287f8c)
`
[](/glassez)
[glassez](/glassez)
added
[
Hotfix
](</qbittorrent/qBittorrent/issues?q=state:open label:Hotfix>)
Fix some bug(s) introduced by recently merged commit(s)
[
WebAPI
](</qbittorrent/qBittorrent/issues?q=state:open label:WebAPI>)
WebAPI-related issues/changes
labels
[Jan 23, 2021](#event-4241365774)
[](/glassez)
[glassez](/glassez)
added this to the
[4.3.4](/qbittorrent/qBittorrent/milestone/65) milestone
[Jan 23, 2021](#event-4241365781)
[](/glassez)
[glassez](/glassez)
requested a review
from [Chocobo1](/Chocobo1)
[January 23, 2021 11:06](#event-4241365784)
[](/glassez)
[glassez](/glassez)
removed this from the
[4.3.4](/qbittorrent/qBittorrent/milestone/65) milestone
[Jan 23, 2021](#event-4241365965)
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
approved these changes
[
Jan 23, 2021
](#pullrequestreview-574843116)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/14275/files/5b495e2f51ebb74dd6b7440fba0c4a0842287f8c)
[](/masterwishx)
Copy link
Copy Markdown
###
**
[masterwishx](/masterwishx)
**
commented
[Jan 24, 2021](#issuecomment-766245383)
|
OK :-) , so we need to wait next version 4.3.4 ?
for rename folder in WEBUI [#13995](https://github.com/qbittorrent/qBittorrent/pull/13995) ?
|
</option></form>
</option></form>
[](/glassez)
Copy link
Copy Markdown
Member
Author
###
**
[glassez](/glassez)
**
commented
[Jan 24, 2021](#issuecomment-766290833)
|>
> OK :-) , so we need to wait next version 4.3.4 ?
> for rename folder in WEBUI
[> #13995
](https://github.com/qbittorrent/qBittorrent/pull/13995)> ?
>
"rename folder in WEBUI" is in v4.3.3.
The problem is that I forgot to increase the web API version number. This affects third-party web clients.
|
</option></form>
</option></form>
[](/masterwishx)
Copy link
Copy Markdown
###
**
[masterwishx](/masterwishx)
**
commented
[Jan 24, 2021](#issuecomment-766309211)
|>
> >
> > OK :-) , so we need to wait next version 4.3.4 ?
> > for rename folder in WEBUI
[> > #13995
](https://github.com/qbittorrent/qBittorrent/pull/13995)> > ?
> >
>
> "rename folder in WEBUI" is in v4.3.3.
> The problem is that I forgot to increase the web API version number. This affects third-party web clients.
>
so its cant be used even its avalible in code of 4.3.3 and we need to wait next release 4.3.4 with fixed web API , thats what i meaned, right?
|
</option></form>
</option></form>
[](/glassez)
Copy link
Copy Markdown
Member
Author
###
**
[glassez](/glassez)
**
commented
[Jan 24, 2021](#issuecomment-766310862)
|>
> so its cant be used even its avalible in code of 4.3.3 and we need to wait next release 4.3.4 with fixed web API , thats what i meaned, right?
>
No.
You can use it. But you can't tell if it's available based on the API version alone. The following situation is obtained:
1. qBittorrent v4.3.2 provides API v2.7 that has no such feature
2. qBittorrent v4.3.3 has this feature but API version is still 2.7 (still my apologies)|
</option></form>
</option></form>
[](/glassez)
[glassez](/glassez)
merged commit [`50c0092`](/qbittorrent/qBittorrent/commit/50c009265e7657ba60192fdc2667dd66dc58a8c5)
into
qbittorrent:master
[Jan 24, 2021](https://github.com/qbittorrent/qBittorrent/pull/14275#event-4242312794)
[](/glassez)
[glassez](/glassez)
deleted the
webapi-version
branch
[January 24, 2021 09:23](#event-4242312828)
[](/masterwishx)
Copy link
Copy Markdown
###
**
[masterwishx](/masterwishx)
**
commented
[Jan 24, 2021](#issuecomment-766348225)
|
i didnt finded this option - rename folder (right mouse click) in binhex/arch-qbittorrentvpn based on 4.3.3 after updated from 4.3.2 docker yestuday.
Now i tried and SURPRISE -\> this option avalible on the same Docker version that i tried yestuday... how it can be possible ?!?
Any way Thanks a lot for your hard and Amazing for work.
im glad that switched from uTorrent to qBittorrent Docker...
|
</option></form>
</option></form>
[](/glassez)
Copy link
Copy Markdown
Member
Author
###
**
[glassez](/glassez)
**
commented
[Jan 24, 2021](#issuecomment-766359238)
|>
> how it can be possible ?!?
>
Probably due to cached js scripts.
|
</option></form>
</option></form>
[](/masterwishx)
Copy link
Copy Markdown
###
**
[masterwishx](/masterwishx)
**
commented
[Jan 24, 2021](#issuecomment-766359994)
|
Ah OK,Thanks again
|
</option></form>
</option></form>
[IceCodeNew](/IceCodeNew)
pushed a commit
to IceCodeNew/qBittorrent-Enhanced-Edition
that referenced
this pull request
[
Jan 26, 2021
](#ref-commit-6ab73bb)
[
](/glassez)
`
[Merge pull request](/IceCodeNew/qBittorrent-Enhanced-Edition/commit/6ab73bbbdfc51844a90f8e9ca9bcdc5f859614a5) [qbittorrent#14275](https://github.com/qbittorrent/qBittorrent/pull/14275) [from glassez/webapi-version](/IceCodeNew/qBittorrent-Enhanced-Edition/commit/6ab73bbbdfc51844a90f8e9ca9bcdc5f859614a5)
`
&hellip;
`
[6ab73bb](/IceCodeNew/qBittorrent-Enhanced-Edition/commit/6ab73bbbdfc51844a90f8e9ca9bcdc5f859614a5)
`
```
Bump WebAPI version
```
</option></form>
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
[Sign up for free](/join?source=comment-repo)
**to join this conversation on GitHub**.
Already have an account?
[Sign in to comment](/login?return_to=https://github.com/qbittorrent/qBittorrent/pull/14275)
</option></form>
###
Reviewers
[
](/Chocobo1) [
Chocobo1
](/Chocobo1)
[
](/qbittorrent/qBittorrent/pull/14275/files/5b495e2f51ebb74dd6b7440fba0c4a0842287f8c)
Chocobo1 approved these changes
</option></form>
###
Assignees
No one assigned
###
Labels
[
Hotfix
](</qbittorrent/qBittorrent/issues?q=state:open label:Hotfix>)
Fix some bug(s) introduced by recently merged commit(s)
[
WebAPI
](</qbittorrent/qBittorrent/issues?q=state:open label:WebAPI>)
WebAPI-related issues/changes
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
](/glassez) [
](/masterwishx) [
](/Chocobo1)