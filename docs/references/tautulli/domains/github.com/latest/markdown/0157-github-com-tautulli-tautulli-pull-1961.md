Filter history by local and remote plays by herby2212 · Pull Request #1961 · Tautulli/Tautulli · GitHub
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
## Conversation
[
](/herby2212)
Copy link
Copy Markdown
Contributor
###
**
[herby2212](/herby2212)
**
commented
[Jan 7, 2023](#issue-1523835133)
&#8226;
edited
Loading
## Description
This PR aims to implement feature request [#1813](https://github.com/Tautulli/Tautulli/issues/1813) by adding a filter for the history table to filter on elements played in the local network (lan), played remote (wan) or mobile (cellular).
The settings/filter bar has partly been reworked to account for the space needed by the new buttons. With this re-arrangement additional filters, selections or buttons can be integrated in the yet free space.
Components:
* History
* Library History
* User History
Open points:
* CSS optimization
* Response Behaviour Check
* Font Awesome Update?
### Screenshot
**History**
[](https://user-images.githubusercontent.com/12448284/211154457-3c5e5714-ff7d-4640-8114-168f43ab0af7.png)
**Library History**
[](https://user-images.githubusercontent.com/12448284/211154513-8b13f89b-5d22-41b9-8adf-d8da954b1f90.png)
**User History**
[](https://user-images.githubusercontent.com/12448284/211154523-033da0ac-70fc-467d-b5e2-2dedb4847d18.png)
## Type of Change
Please delete options that are not relevant.
* New feature (non-breaking change which adds functionality)
## Checklist
* My code follows the style guidelines of this project
* I have performed a self-review of my own code
* I have commented my code, particularly in hard-to-understand areas
* I have added or updated the docstring for new or existing methods
</option></form>
</option></form>
👍
1
luzpaz reacted with thumbs up emoji
[herby2212](/herby2212)
added 4 commits
[January 7, 2023 12:43](#commits-pushed-7c7b536)
[
](/herby2212)
`
[implementation for history page](/Tautulli/Tautulli/pull/1961/commits/7c7b536ec80c059f0383bc70a761c542dd2a3608)
`
`
[7c7b536](/Tautulli/Tautulli/pull/1961/commits/7c7b536ec80c059f0383bc70a761c542dd2a3608)
`
[
](/herby2212)
`
[implementation for library history](/Tautulli/Tautulli/pull/1961/commits/47f87a98df51a3094a59cd3d6772cde360f6aa87)
`
`
[47f87a9](/Tautulli/Tautulli/pull/1961/commits/47f87a98df51a3094a59cd3d6772cde360f6aa87)
`
[
](/herby2212)
`
[align settings](/Tautulli/Tautulli/pull/1961/commits/3511028df45e7045624f4ba23132966fa5bca3d1)
`
`
[3511028](/Tautulli/Tautulli/pull/1961/commits/3511028df45e7045624f4ba23132966fa5bca3d1)
`
[
](/herby2212)
`
[fix load issue for library history + user history](/Tautulli/Tautulli/pull/1961/commits/08dc6a1391ab199cc5486f87ed521f330b77c015)
`
`
[08dc6a1](/Tautulli/Tautulli/pull/1961/commits/08dc6a1391ab199cc5486f87ed521f330b77c015)
`
[](/herby2212)
[herby2212](/herby2212)
marked this pull request as draft
[January 7, 2023 13:57](#event-8174742564)
[](/JonnyWong16)
[JonnyWong16](/JonnyWong16)
added
the
[
status:in-progress
](</Tautulli/Tautulli/issues?q=state:open label:status:in-progress>)
label
[Jan 28, 2023](#event-8380611466)
[](/JonnyWong16)
**
[JonnyWong16](/JonnyWong16)
**
requested changes
[
Feb 18, 2024
](#pullrequestreview-1887048818)
[
View reviewed changes
](/Tautulli/Tautulli/pull/1961/files/08dc6a1391ab199cc5486f87ed521f330b77c015)
Copy link
Copy Markdown
Contributor
###
**
[JonnyWong16](/JonnyWong16)
**
left a comment
[](#pullrequestreview-1887048818)
### Choose a reason for hiding this comment
The reason will be displayed to describe this comment to others. [Learn more](https://docs.github.com/articles/managing-disruptive-comments/#hiding-a-comment).
</option></form>
Choose a reason
Spam
Abuse
Off Topic
Outdated
Duplicate
Resolved
Low Quality
Hide comment
I'm not a fan of the "box" design for the filters. But I also don't have a better suggestion at the moment.
</option></form>
</option></form>
Comment thread
[plexpy/webserve.py](/Tautulli/Tautulli/pull/1961/files/08dc6a1391ab199cc5486f87ed521f330b77c015#diff-d7286a77b06c352790c6fbbc946f27dde79084f7127af76a4ff7676685cf496c)
||| after (str): History after and including the date, "YYYY-MM-DD"|
||| section\_id (int): 2|
||| media\_type (str): "movie", "episode", "track", "live"|
||| network\_type (str): "lan", "wan", "cellular"|
Copy link
Copy Markdown
Contributor
###
**
[JonnyWong16](/JonnyWong16)
**
[Feb 17, 2024](#discussion_r1493484601)
### Choose a reason for hiding this comment
The reason will be displayed to describe this comment to others. [Learn more](https://docs.github.com/articles/managing-disruptive-comments/#hiding-a-comment).
</option></form>
Choose a reason
Spam
Abuse
Off Topic
Outdated
Duplicate
Resolved
Low Quality
Hide comment
Rename `network\_type` to `location` so it is consistent with the rest of the API (i.e. `get\_activity` and `get\_history`).
</option></form>
</option></form>
Comment thread
[data/interfaces/default/user.html](/Tautulli/Tautulli/pull/1961/files/08dc6a1391ab199cc5486f87ed521f330b77c015#diff-437c60bb1fc62ae2483c76079e1db6ac1aaa19ac200b8a7b3e61fe498302a702)
||| history\_network\_type.closest('label').addClass('active');|
||| });|
|||
|
||| const transcode\_decision = getLocalStorage('user\_' + user\_id + 'history\_transcode\_decision', 'all');|
Copy link
Copy Markdown
Contributor
###
**
[JonnyWong16](/JonnyWong16)
**
[Feb 17, 2024](#discussion_r1493484850)
### Choose a reason for hiding this comment
The reason will be displayed to describe this comment to others. [Learn more](https://docs.github.com/articles/managing-disruptive-comments/#hiding-a-comment).
</option></form>
Choose a reason
Spam
Abuse
Off Topic
Outdated
Duplicate
Resolved
Low Quality
Hide comment
Suggested change
|| const transcode\_decision = getLocalStorage('user\_' + user\_id + 'history\_transcode\_decision', 'all');|
|| const transcode\_decision = getLocalStorage('user\_' + user\_id + '-history\_transcode\_decision', 'all');|
Also fix `setLocalStoage` on line 598.
</option></form>
</option></form>
Comment thread
[data/interfaces/default/user.html](/Tautulli/Tautulli/pull/1961/files/08dc6a1391ab199cc5486f87ed521f330b77c015#diff-437c60bb1fc62ae2483c76079e1db6ac1aaa19ac200b8a7b3e61fe498302a702)
||| let selected\_filter = $('input[name=network\_type-filter]:checked', '#network\_type-selection');|
||| $(selected\_filter).closest('label').addClass('active');|
||| network\_type = $(selected\_filter).map(function () { return $(this).val(); }).get().join(',');|
||| setLocalStorage('user\_' + user\_id + 'history\_network\_type', network\_type);|
Copy link
Copy Markdown
Contributor
###
**
[JonnyWong16](/JonnyWong16)
**
[Feb 18, 2024](#discussion_r1493485098)
### Choose a reason for hiding this comment
The reason will be displayed to describe this comment to others. [Learn more](https://docs.github.com/articles/managing-disruptive-comments/#hiding-a-comment).
</option></form>
Choose a reason
Spam
Abuse
Off Topic
Outdated
Duplicate
Resolved
Low Quality
Hide comment
Suggested change
|| setLocalStorage('user\_' + user\_id + 'history\_network\_type', network\_type);|
|| setLocalStorage('user\_' + user\_id + '-history\_network\_type', network\_type);|
</option></form>
</option></form>
Comment thread
[data/interfaces/default/library.html](/Tautulli/Tautulli/pull/1961/files/08dc6a1391ab199cc5486f87ed521f330b77c015#diff-7abc6e98e18288c4139b858326f169f6af1d63d1f11b3d837f2f986b51b75cb0)
||| });|
|||
|
||| loadHistoryTable(transcode\_decision);|
||| const network\_type = getLocalStorage('library\_' + section\_id + 'history\_network\_type', '');|
Copy link
Copy Markdown
Contributor
###
**
[JonnyWong16](/JonnyWong16)
**
[Feb 18, 2024](#discussion_r1493485240)
### Choose a reason for hiding this comment
The reason will be displayed to describe this comment to others. [Learn more](https://docs.github.com/articles/managing-disruptive-comments/#hiding-a-comment).
</option></form>
Choose a reason
Spam
Abuse
Off Topic
Outdated
Duplicate
Resolved
Low Quality
Hide comment
Suggested change
|| const network\_type = getLocalStorage('library\_' + section\_id + 'history\_network\_type', '');|
|| const network\_type = getLocalStorage('library\_' + section\_id + '-history\_network\_type', '');|
</option></form>
</option></form>
Comment thread
[data/interfaces/default/library.html](/Tautulli/Tautulli/pull/1961/files/08dc6a1391ab199cc5486f87ed521f330b77c015#diff-7abc6e98e18288c4139b858326f169f6af1d63d1f11b3d837f2f986b51b75cb0)
||| $('#nav-tabs-history').on('shown.bs.tab', function() {|
||| if (typeof(history\_table) === 'undefined') {|
|||var transcode\_decision = getLocalStorage('library\_' + section\_id + 'history\_transcode\_decision', 'all');|
|||const transcode\_decision = getLocalStorage('library\_' + section\_id + 'history\_transcode\_decision', 'all');|
Copy link
Copy Markdown
Contributor
###
**
[JonnyWong16](/JonnyWong16)
**
[Feb 18, 2024](#discussion_r1493485313)
### Choose a reason for hiding this comment
The reason will be displayed to describe this comment to others. [Learn more](https://docs.github.com/articles/managing-disruptive-comments/#hiding-a-comment).
</option></form>
Choose a reason
Spam
Abuse
Off Topic
Outdated
Duplicate
Resolved
Low Quality
Hide comment
Suggested change
|| const transcode\_decision = getLocalStorage('library\_' + section\_id + 'history\_transcode\_decision', 'all');|
|| const transcode\_decision = getLocalStorage('library\_' + section\_id + '-history\_transcode\_decision', 'all');|
Also fix `setLocalStoage` on line 608.
</option></form>
</option></form>
</option></form>
6 hidden conversations
Load more…
Comment thread
[data/interfaces/default/library.html](/Tautulli/Tautulli/pull/1961/files/08dc6a1391ab199cc5486f87ed521f330b77c015#diff-7abc6e98e18288c4139b858326f169f6af1d63d1f11b3d837f2f986b51b75cb0)
||| \<input type="checkbox" name="network\_type-filter" id="history-network\_type-lan" value="lan" autocomplete="off"\>\<i class="fa fa-server"\>\</i\> Local Play|
||| \</label\>|
||| \<label class="btn btn-dark btn-filter"\>|
||| \<input type="checkbox" name="network\_type-filter" id="history-network\_type-wan" value="wan" autocomplete="off"\>\<i class="fa fa-globe"\>\</i\> Remote Play|
Copy link
Copy Markdown
Contributor
###
**
[JonnyWong16](/JonnyWong16)
**
[Feb 18, 2024](#discussion_r1493490186)
### Choose a reason for hiding this comment
The reason will be displayed to describe this comment to others. [Learn more](https://docs.github.com/articles/managing-disruptive-comments/#hiding-a-comment).
</option></form>
Choose a reason
Spam
Abuse
Off Topic
Outdated
Duplicate
Resolved
Low Quality
Hide comment
Suggested change
||\<inputtype="checkbox" name="network\_type-filter" id="history-network\_type-wan" value="wan" autocomplete="off"\>\<iclass="fa fa-globe"\>\</i\> Remote Play|
||\<inputtype="checkbox" name="network\_type-filter" id="history-network\_type-wan" value="wan" autocomplete="off"\>\<iclass="fa fa-globe"\>\</i\> Remote|
</option></form>
</option></form>
Comment thread
[data/interfaces/default/library.html](/Tautulli/Tautulli/pull/1961/files/08dc6a1391ab199cc5486f87ed521f330b77c015#diff-7abc6e98e18288c4139b858326f169f6af1d63d1f11b3d837f2f986b51b75cb0)
||| \<input type="checkbox" name="network\_type-filter" id="history-network\_type-wan" value="wan" autocomplete="off"\>\<i class="fa fa-globe"\>\</i\> Remote Play|
||| \</label\>|
||| \<label class="btn btn-dark btn-filter"\>|
||| \<input type="checkbox" name="network\_type-filter" id="history-network\_type-cellular" value="cellular" autocomplete="off"\>\<i class="fa fa-broadcast-tower"\>\</i\> Mobile Play|
Copy link
Copy Markdown
Contributor
###
**
[JonnyWong16](/JonnyWong16)
**
[Feb 18, 2024](#discussion_r1493490216)
### Choose a reason for hiding this comment
The reason will be displayed to describe this comment to others. [Learn more](https://docs.github.com/articles/managing-disruptive-comments/#hiding-a-comment).
</option></form>
Choose a reason
Spam
Abuse
Off Topic
Outdated
Duplicate
Resolved
Low Quality
Hide comment
Suggested change
||\<inputtype="checkbox" name="network\_type-filter" id="history-network\_type-cellular" value="cellular" autocomplete="off"\>\<iclass="fa fa-broadcast-tower"\>\</i\> Mobile Play|
||\<inputtype="checkbox" name="network\_type-filter" id="history-network\_type-cellular" value="cellular" autocomplete="off"\>\<iclass="fa fa-broadcast-tower"\>\</i\> Mobile|
</option></form>
</option></form>
Comment thread
[data/interfaces/default/user.html](/Tautulli/Tautulli/pull/1961/files/08dc6a1391ab199cc5486f87ed521f330b77c015#diff-437c60bb1fc62ae2483c76079e1db6ac1aaa19ac200b8a7b3e61fe498302a702)
||| \</div\>|
||| \<div class="btn-group-justified history-option-button-group" data-toggle="buttons" id="network\_type-selection" style="padding-right: 0.5rem;"\>|
||| \<label class="btn btn-dark btn-filter"\>|
||| \<input type="checkbox" name="network\_type-filter" id="history-network\_type-lan" value="lan" autocomplete="off"\>\<i class="fa fa-server"\>\</i\> Local Play|
Copy link
Copy Markdown
Contributor
###
**
[JonnyWong16](/JonnyWong16)
**
[Feb 18, 2024](#discussion_r1493490340)
### Choose a reason for hiding this comment
The reason will be displayed to describe this comment to others. [Learn more](https://docs.github.com/articles/managing-disruptive-comments/#hiding-a-comment).
</option></form>
Choose a reason
Spam
Abuse
Off Topic
Outdated
Duplicate
Resolved
Low Quality
Hide comment
Suggested change
||\<inputtype="checkbox" name="network\_type-filter" id="history-network\_type-lan" value="lan" autocomplete="off"\>\<iclass="fa fa-server"\>\</i\> Local Play|
||\<inputtype="checkbox" name="network\_type-filter" id="history-network\_type-lan" value="lan" autocomplete="off"\>\<iclass="fa fa-laptop-house"\>\</i\> Local|
</option></form>
</option></form>
Comment thread
[data/interfaces/default/user.html](/Tautulli/Tautulli/pull/1961/files/08dc6a1391ab199cc5486f87ed521f330b77c015#diff-437c60bb1fc62ae2483c76079e1db6ac1aaa19ac200b8a7b3e61fe498302a702)
||| \<input type="checkbox" name="network\_type-filter" id="history-network\_type-lan" value="lan" autocomplete="off"\>\<i class="fa fa-server"\>\</i\> Local Play|
||| \</label\>|
||| \<label class="btn btn-dark btn-filter"\>|
||| \<input type="checkbox" name="network\_type-filter" id="history-network\_type-wan" value="wan" autocomplete="off"\>\<i class="fa fa-globe"\>\</i\> Remote Play|
Copy link
Copy Markdown
Contributor
###
**
[JonnyWong16](/JonnyWong16)
**
[Feb 18, 2024](#discussion_r1493490402)
### Choose a reason for hiding this comment
The reason will be displayed to describe this comment to others. [Learn more](https://docs.github.com/articles/managing-disruptive-comments/#hiding-a-comment).
</option></form>
Choose a reason
Spam
Abuse
Off Topic
Outdated
Duplicate
Resolved
Low Quality
Hide comment
Suggested change
||\<inputtype="checkbox" name="network\_type-filter" id="history-network\_type-wan" value="wan" autocomplete="off"\>\<iclass="fa fa-globe"\>\</i\> Remote Play|
||\<inputtype="checkbox" name="network\_type-filter" id="history-network\_type-wan" value="wan" autocomplete="off"\>\<iclass="fa fa-globe"\>\</i\> Remote|
</option></form>
</option></form>
Comment thread
[data/interfaces/default/user.html](/Tautulli/Tautulli/pull/1961/files/08dc6a1391ab199cc5486f87ed521f330b77c015#diff-437c60bb1fc62ae2483c76079e1db6ac1aaa19ac200b8a7b3e61fe498302a702)
||| \<input type="checkbox" name="network\_type-filter" id="history-network\_type-wan" value="wan" autocomplete="off"\>\<i class="fa fa-globe"\>\</i\> Remote Play|
||| \</label\>|
||| \<label class="btn btn-dark btn-filter"\>|
||| \<input type="checkbox" name="network\_type-filter" id="history-network\_type-cellular" value="cellular" autocomplete="off"\>\<i class="fa fa-broadcast-tower"\>\</i\> Mobile Play|
Copy link
Copy Markdown
Contributor
###
**
[JonnyWong16](/JonnyWong16)
**
[Feb 18, 2024](#discussion_r1493490444)
### Choose a reason for hiding this comment
The reason will be displayed to describe this comment to others. [Learn more](https://docs.github.com/articles/managing-disruptive-comments/#hiding-a-comment).
</option></form>
Choose a reason
Spam
Abuse
Off Topic
Outdated
Duplicate
Resolved
Low Quality
Hide comment
Suggested change
||\<inputtype="checkbox" name="network\_type-filter" id="history-network\_type-cellular" value="cellular" autocomplete="off"\>\<iclass="fa fa-broadcast-tower"\>\</i\> Mobile Play|
||\<inputtype="checkbox" name="network\_type-filter" id="history-network\_type-cellular" value="cellular" autocomplete="off"\>\<iclass="fa fa-broadcast-tower"\>\</i\> Mobile|
</option></form>
</option></form>
</option></form>
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
[Sign up for free](/join?source=comment-repo)
**to join this conversation on GitHub**.
Already have an account?
[Sign in to comment](/login?return_to=https://github.com/Tautulli/Tautulli/pull/1961)
</option></form>
###
Reviewers
[
](/JonnyWong16) [
JonnyWong16
](/JonnyWong16)
[
](/Tautulli/Tautulli/pull/1961/files/08dc6a1391ab199cc5486f87ed521f330b77c015)
JonnyWong16 requested changes
[
Copilot code review
](/apps/copilot-pull-request-reviewer) [
Copilot
](/apps/copilot-pull-request-reviewer)
Awaiting requested review from Copilot
Copilot will automatically review once the pull request is marked ready for review
</option></form>
###
Assignees
No one assigned
###
Labels
[
status:in-progress
](</Tautulli/Tautulli/issues?q=state:open label:status:in-progress>)
</option></form>
###
Milestone
No milestone
</option></form>
###
Development
Successfully merging this pull request may close these issues.
###
2 participants
[
](/herby2212) [
](/JonnyWong16)