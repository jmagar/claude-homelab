Accept "share limits" when adding torrent using WebAPI by glassez · Pull Request #14519 · qbittorrent/qBittorrent · GitHub
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
[Mar 9, 2021](#issue-826272333)
* No description provided. *
</option></form>
</option></form>
[
](/glassez)
`
[Accept "share limits" when adding torrent using WebAPI](/qbittorrent/qBittorrent/pull/14519/commits/e2c785b2d5e1863d678473055664c204e0c6ac8e)
`
`
[e2c785b](/qbittorrent/qBittorrent/pull/14519/commits/e2c785b2d5e1863d678473055664c204e0c6ac8e)
`
[](/glassez)
[glassez](/glassez)
added
the
[
WebAPI
](</qbittorrent/qBittorrent/issues?q=state:open label:WebAPI>)
WebAPI-related issues/changes
label
[Mar 9, 2021](#event-4429892552)
[](/glassez)
[glassez](/glassez)
added this to the
[4.3.4](/qbittorrent/qBittorrent/milestone/65) milestone
[Mar 9, 2021](#event-4429892560)
[](/glassez)
[glassez](/glassez)
requested review from
a team and
[Chocobo1](/Chocobo1)
[March 9, 2021 17:01](#event-4429892564)
[](/glassez)
[glassez](/glassez)
mentioned this pull request
[
Mar 9, 2021
](#ref-issue-813991472)
[
qbittorrent not respecting "seedingTimeLimit" being sent by Sonarr via API
#14443
](/qbittorrent/qBittorrent/issues/14443)
Closed
[](/delize)
[delize](/delize)
mentioned this pull request
[
Mar 9, 2021
](#ref-issue-823686782)
[
Bug/Feature: POST commands being sent too quickly/Add delay to successive POST commands to qBittorrent
Sonarr/Sonarr#4360
](/Sonarr/Sonarr/issues/4360)
Closed
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
reviewed
[
Mar 10, 2021
](#pullrequestreview-608343871)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/14519/files/e2c785b2d5e1863d678473055664c204e0c6ac8e)
Comment thread
[src/base/utils/string.h](/qbittorrent/qBittorrent/pull/14519/files/e2c785b2d5e1863d678473055664c204e0c6ac8e#diff-892e5a7c9863cd4b0818972ba5e4aa07ec864647e3fbf80e2d15a70ea6536b80)
Show resolved
Hide resolved
Comment thread
[src/webui/api/torrentscontroller.cpp](/qbittorrent/qBittorrent/pull/14519/files/e2c785b2d5e1863d678473055664c204e0c6ac8e#diff-2c6fdae7a7c5a881f0a502368050ed2f7c7c9173e479a2b0921cf0ca8740a8ef)
Show resolved
Hide resolved
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
approved these changes
[
Mar 10, 2021
](#pullrequestreview-608385645)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/14519/files/e2c785b2d5e1863d678473055664c204e0c6ac8e)
[](/glassez)
[glassez](/glassez)
merged commit [`73e927f`](/qbittorrent/qBittorrent/commit/73e927ff19fbefb7cea1bc8a53fb3277ec4fc431)
into
qbittorrent:master
[Mar 10, 2021](https://github.com/qbittorrent/qBittorrent/pull/14519#event-4437675701)
[](/glassez)
[glassez](/glassez)
deleted the
add-torrent
branch
[March 10, 2021 16:32](#event-4437676202)
</option></form>
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
[Sign up for free](/join?source=comment-repo)
**to join this conversation on GitHub**.
Already have an account?
[Sign in to comment](/login?return_to=https://github.com/qbittorrent/qBittorrent/pull/14519)
</option></form>
###
Reviewers
[
](/Chocobo1) [
Chocobo1
](/Chocobo1)
[
](/qbittorrent/qBittorrent/pull/14519/files/e2c785b2d5e1863d678473055664c204e0c6ac8e)
Chocobo1 approved these changes
</option></form>
###
Assignees
No one assigned
###
Labels
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
[
**4.3.4**
](/qbittorrent/qBittorrent/milestone/65)
</option></form>
###
Development
Successfully merging this pull request may close these issues.
###
2 participants
[
](/glassez) [
](/Chocobo1)