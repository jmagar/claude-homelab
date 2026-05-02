Free disk space in WebUI status bar by Piccirello · Pull Request #8217 · qbittorrent/qBittorrent · GitHub
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
](/Piccirello)
Copy link
Copy Markdown
Member
###
**
[Piccirello](/Piccirello)
**
commented
[Jan 5, 2018](#issue-286187081)
&#8226;
edited
Loading
>
> Puts free space on disk (Default save path) in WebUI's status
>
This is a continuation of [#6829](https://github.com/qbittorrent/qBittorrent/pull/6829) and addresses the need to poll for free disk space on a separate thread. Comments/suggestions on the QThread implementation are welcome.
[](https://user-images.githubusercontent.com/8296030/45922858-2ab22780-bea5-11e8-947b-94273eb7161f.png)
Closes [#9680](https://github.com/qbittorrent/qBittorrent/issues/9680)
</option></form>
</option></form>
👍
4
kannes, FranciscoPombal, annomatik, and bigfoot90 reacted with thumbs up emoji
[](/thalieht)
**
[thalieht](/thalieht)
**
reviewed
[
Jan 5, 2018
](#pullrequestreview-86879546)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/8217/files)
Comment thread
[src/webui/freespacethread.h](/qbittorrent/qBittorrent/pull/8217/files#diff-82368622794bcefd5a775527c0ee188af80c3550b2afc4b22f226d137571ebd2)
Outdated
Copy link
Copy Markdown
Contributor
###
**
[thalieht](/thalieht)
**
[Jan 5, 2018](#discussion_r159857940)
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
"m\_" prefixes.
</option></form>
</option></form>
Copy link
Copy Markdown
Member
Author
###
**
[Piccirello](/Piccirello)
**
[Jan 5, 2018](#discussion_r159949262)
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
Will add these.
</option></form>
</option></form>
[](/sledgehammer999)
[sledgehammer999](/sledgehammer999)
added
the
[
WebUI
](</qbittorrent/qBittorrent/issues?q=state:open label:WebUI>)
WebUI-related issues/changes
label
[Jan 5, 2018](#event-1411347435)
[](/Piccirello)
Copy link
Copy Markdown
Member
Author
###
**
[Piccirello](/Piccirello)
**
commented
[Jan 5, 2018](#issuecomment-355631085)
|
I'm not a huge fan of passing `freeDiskSpace` as a parameter, but I haven't been able to think of another way for the static `btjson` methods to access the value.
|
</option></form>
</option></form>
[](/glassez)
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
commented
[Jan 6, 2018](#issuecomment-355739868)
|>
> I'm not a huge fan of passing freeDiskSpace as a parameter, but I haven't been able to think of another way for the static btjson methods to access the value.
>
When I finish the WebAPI redesign, btjson (as soon as prefjson) will cease to exist completely (there is no point to separate this logic).
|
</option></form>
</option></form>
[](/Piccirello)
Copy link
Copy Markdown
Member
Author
###
**
[Piccirello](/Piccirello)
**
commented
[Jan 6, 2018](#issuecomment-355773871)
&#8226;
edited
Loading
|>
> btjson (as soon as prefjson) will cease to exist completely
>
That's right, I forgot about this change. Excellent!
Edit: I still see `btjson.cpp` in your PR, so maybe I was confusing it with `abstractwebapplication.cpp`.
|
</option></form>
</option></form>
[](/Piccirello)
[Piccirello](/Piccirello)
[force-pushed](/qbittorrent/qBittorrent/compare/7c8db65af1d75076f7b0c86ee3a52a5b79b70960..14a96219a6577e82edd6eeb420a0da3e386afd71)
the
webui-statusbar-freespace
branch
3 times, most recently
from
[`7c8db65`](/qbittorrent/qBittorrent/commit/7c8db65af1d75076f7b0c86ee3a52a5b79b70960) to
[`14a9621`](/qbittorrent/qBittorrent/commit/14a96219a6577e82edd6eeb420a0da3e386afd71) [
Compare
](/qbittorrent/qBittorrent/compare/7c8db65af1d75076f7b0c86ee3a52a5b79b70960..14a96219a6577e82edd6eeb420a0da3e386afd71)
[March 7, 2018 08:03](#event-1508278400)
[](/Piccirello)
Copy link
Copy Markdown
Member
Author
###
**
[Piccirello](/Piccirello)
**
commented
[Mar 7, 2018](#issuecomment-371058009)
|
[@Chocobo1](https://github.com/Chocobo1)[@glassez](https://github.com/glassez) This has been rebased onto the latest web api changes.
|
</option></form>
</option></form>
[](/Piccirello)
Copy link
Copy Markdown
Member
Author
###
**
[Piccirello](/Piccirello)
**
commented
[Mar 22, 2018](#issuecomment-375388800)
|
Please review when you get a chance :)
(will be addressing WebUI Search API comments this evening)
|
</option></form>
</option></form>
[](/glassez)
**
[glassez](/glassez)
**
requested changes
[
Mar 22, 2018
](#pullrequestreview-106227082)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/8217/files)
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
left a comment
[](#pullrequestreview-106227082)
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
You quite misunderstood QThread. There is no thread in your code.
See our RSS::Parser for example of thread handling with Qt.
</option></form>
</option></form>
Comment thread
[src/app/application.cpp](/qbittorrent/qBittorrent/pull/8217/files#diff-e39b5a28c9371ddf0916785d3018f222fa96f2613177f75efac2d1f228a38fc0)
Outdated
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
[Mar 22, 2018](#discussion_r176509831)
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
FreeSpaceThread instance is used only by SyncController. Why did you make it global?
</option></form>
</option></form>
Copy link
Copy Markdown
Member
Author
###
**
[Piccirello](/Piccirello)
**
[Mar 26, 2018](#discussion_r176964952)
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
It's only initialized during application startup.
</option></form>
</option></form>
😕
1
glassez reacted with confused emoji
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
[Mar 26, 2018](#discussion_r176974552)
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
It's NOT "only initialized during application startup". It's implemented as Singleton, i.e. class with Globally accessed Single instance. I see no point to access it from any place except SyncController.
</option></form>
</option></form>
Comment thread
[src/webui/api/synccontroller.cpp](/qbittorrent/qBittorrent/pull/8217/files#diff-26f23205950f80a2659a1bc18ee3d7f4fc290408ae8784d0eb003bdfe36fd0bd)
Outdated
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
[Mar 22, 2018](#discussion_r176512319)
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
Finding the API controllers under "webui" folder is rather temporary (legacy). Really, now they are designed completely independent from the Web, so do not violate it.
</option></form>
</option></form>
[](/glassez)
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
commented
[Mar 23, 2018](#issuecomment-375545316)
|>
> You quite misunderstood QThread. There is no thread in your code.
> See our RSS::Parser for example of thread handling with Qt.
>
The main algorithm is:
1. Define worker class, e.g. FreeDiskSpaceChecker (subclass of QObject)
2. Create QThread object
3. Create worker object
4. Move worker object to your new thread (i.e. `moveToThread(yourThreadObject)`)
5. Connect worker signals/slots
6. Start your thread
The simply way is to define `FreeDiskSpaceChecker::update()` slot and `FreeDiskSpaceChecker::updated(qint64 freeSpaceSize)` signal. Then you can create some timer in SyncController and connect it to `FreeDiskSpaceChecker::update()` slot, and define some slot `freeDiskSpaceSizeUpdated(qint64 freeSpaceSize)` slot (where you just update corresponding SyncController variable) and connect it to `FreeDiskSpaceChecker::updated(qint64 freeSpaceSize)` signal.
|
</option></form>
</option></form>
[](/Piccirello)
[Piccirello](/Piccirello)
[force-pushed](/qbittorrent/qBittorrent/compare/14a96219a6577e82edd6eeb420a0da3e386afd71..c3c35f96bb948d7ebd2e363fda286994f12e68a4)
the
webui-statusbar-freespace
branch
from
[`14a9621`](/qbittorrent/qBittorrent/commit/14a96219a6577e82edd6eeb420a0da3e386afd71) to
[`c3c35f9`](/qbittorrent/qBittorrent/commit/c3c35f96bb948d7ebd2e363fda286994f12e68a4) [
Compare
](/qbittorrent/qBittorrent/compare/14a96219a6577e82edd6eeb420a0da3e386afd71..c3c35f96bb948d7ebd2e363fda286994f12e68a4)
[September 23, 2018 00:21](#event-1861801179)
[](/Piccirello)
Copy link
Copy Markdown
Member
Author
###
**
[Piccirello](/Piccirello)
**
commented
[Sep 23, 2018](#issuecomment-423782625)
|
Feature reimplemented using the algorithm suggested by [@glassez](https://github.com/glassez).
There's one remaining item I'd like to fix, which is that the first disk space calculation doesn't take place until 30 seconds after the first call to `/sync/maindata`. I'm not quite sure how to kick this off immediately in the other thread; suggestions are welcome.
|
</option></form>
</option></form>
[](/Piccirello)
[Piccirello](/Piccirello)
mentioned this pull request
[
Sep 24, 2018
](#ref-pullrequest-230395205)
[
[WebUI] Free space on disk in status bar
#6829
](/qbittorrent/qBittorrent/pull/6829)
Closed
[](/glassez)
**
[glassez](/glassez)
**
requested changes
[
Sep 25, 2018
](#pullrequestreview-158373664)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/8217/files)
Comment thread
[src/webui/api/synccontroller.cpp](/qbittorrent/qBittorrent/pull/8217/files#diff-26f23205950f80a2659a1bc18ee3d7f4fc290408ae8784d0eb003bdfe36fd0bd)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/api/synccontroller.cpp](/qbittorrent/qBittorrent/pull/8217/files#diff-26f23205950f80a2659a1bc18ee3d7f4fc290408ae8784d0eb003bdfe36fd0bd)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/api/synccontroller.h](/qbittorrent/qBittorrent/pull/8217/files#diff-11fe11fdec3911e15a0113e99dd4f3894422f1e8640c7dc5d0f57675710459aa)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/api/synccontroller.h](/qbittorrent/qBittorrent/pull/8217/files#diff-11fe11fdec3911e15a0113e99dd4f3894422f1e8640c7dc5d0f57675710459aa)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/freediskspacechecker.h](/qbittorrent/qBittorrent/pull/8217/files#diff-4529c0258ed2db765018f3adfc19e7631116abeaaa92ef401ec68a7d9ba7f110)
Outdated
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
[Sep 25, 2018](#discussion_r220056256)
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
Fix indentation!
Use `= default;` instead of empty body.
Usually we keep `QObject \*parent = nullptr` param for QObject subclasses.
</option></form>
</option></form>
Copy link
Copy Markdown
Member
Author
###
**
[Piccirello](/Piccirello)
**
[Sep 27, 2018](#discussion_r220785617)
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
>
> Usually we keep QObject *parent = nullptr param for QObject subclasses.
>
Is there any point to this if the class isn't allowed to have a parent, due to being moved to a separate thread?
</option></form>
</option></form>
Comment thread
[src/webui/freediskspacechecker.h](/qbittorrent/qBittorrent/pull/8217/files#diff-4529c0258ed2db765018f3adfc19e7631116abeaaa92ef401ec68a7d9ba7f110)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/webui.pri](/qbittorrent/qBittorrent/pull/8217/files#diff-27ee5705c37b7075c204e26b80ac89c325d4e5788ad5aab49c3b9d29c2297c00)
Outdated
Show resolved
Hide resolved
[](/glassez)
**
[glassez](/glassez)
**
requested changes
[
Sep 25, 2018
](#pullrequestreview-158490168)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/8217/files)
Comment thread
[src/webui/api/synccontroller.cpp](/qbittorrent/qBittorrent/pull/8217/files#diff-26f23205950f80a2659a1bc18ee3d7f4fc290408ae8784d0eb003bdfe36fd0bd)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/api/synccontroller.cpp](/qbittorrent/qBittorrent/pull/8217/files#diff-26f23205950f80a2659a1bc18ee3d7f4fc290408ae8784d0eb003bdfe36fd0bd)
Outdated
Show resolved
Hide resolved
[](/glassez)
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
commented
[Sep 25, 2018](#issuecomment-424305277)
|>
> There's one remaining item I'd like to fix, which is that the first disk space calculation doesn't take place until 30 seconds after the first call to /sync/maindata.
>
Just call update() after you move it in separate thread (either via QMetaObject::invokeMethod() or QTimer::singleShot() with 0 timeout).
|
</option></form>
👍
1
Piccirello reacted with thumbs up emoji
</option></form>
[](/Piccirello)
Copy link
Copy Markdown
Member
Author
###
**
[Piccirello](/Piccirello)
**
commented
[Sep 27, 2018](#issuecomment-424951303)
|
I previously tried `QTimer::singleShot()` and it ran in the same thread, but I'm guessing I must've messed something up. It's working as expected now.
|
</option></form>
</option></form>
[](/Piccirello)
**
[Piccirello](/Piccirello)
**
commented
[
Sep 27, 2018
](#pullrequestreview-159277116)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/8217/files)
Comment thread
[src/webui/api/synccontroller.cpp](/qbittorrent/qBittorrent/pull/8217/files#diff-26f23205950f80a2659a1bc18ee3d7f4fc290408ae8784d0eb003bdfe36fd0bd)
Outdated
Show resolved
Hide resolved
[](/thalieht)
[thalieht](/thalieht)
mentioned this pull request
[
Oct 12, 2018
](#ref-issue-369117698)
[
[Enhancement] Show remaining free disk space
#9680
](/qbittorrent/qBittorrent/issues/9680)
Closed
[
](/Piccirello)
`
[Catch invalid values](/qbittorrent/qBittorrent/pull/8217/commits/ae374f69033371b30c6ec6fdc997f01d6a6e7d0e)
`
`
[ae374f6](/qbittorrent/qBittorrent/pull/8217/commits/ae374f69033371b30c6ec6fdc997f01d6a6e7d0e)
`
[](/Piccirello)
[Piccirello](/Piccirello)
[force-pushed](/qbittorrent/qBittorrent/compare/d8d70b91e2bf1d943f55684de98e068f5232ddc7..6851a259124c1f8b0af2e519b95f8d6d60867371)
the
webui-statusbar-freespace
branch
2 times, most recently
from
[`d8d70b9`](/qbittorrent/qBittorrent/commit/d8d70b91e2bf1d943f55684de98e068f5232ddc7) to
[`6851a25`](/qbittorrent/qBittorrent/commit/6851a259124c1f8b0af2e519b95f8d6d60867371) [
Compare
](/qbittorrent/qBittorrent/compare/d8d70b91e2bf1d943f55684de98e068f5232ddc7..6851a259124c1f8b0af2e519b95f8d6d60867371)
[October 15, 2018 08:39](#event-1903418420)
[](/Piccirello)
Copy link
Copy Markdown
Member
Author
###
**
[Piccirello](/Piccirello)
**
commented
[Oct 15, 2018](#issuecomment-429757607)
|
Minor refactor on `SyncController::maindataAction()` to remove the `if (!m\_freeDiskSpaceThread)``else` condition, so I think the code is a bit cleaner now. Rebased and ready for approval.
|
</option></form>
</option></form>
[](/glassez)
**
[glassez](/glassez)
**
requested changes
[
Oct 16, 2018
](#pullrequestreview-159397752)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/8217/files)
Comment thread
[src/webui/api/freediskspacechecker.h](/qbittorrent/qBittorrent/pull/8217/files#diff-bc104dfe276bb2cf482af0889f3aaa74e83b7adbcfb61243868aff80969d3a6c)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/api/freediskspacechecker.h](/qbittorrent/qBittorrent/pull/8217/files#diff-bc104dfe276bb2cf482af0889f3aaa74e83b7adbcfb61243868aff80969d3a6c)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/api/synccontroller.cpp](/qbittorrent/qBittorrent/pull/8217/files#diff-26f23205950f80a2659a1bc18ee3d7f4fc290408ae8784d0eb003bdfe36fd0bd)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/extra\_translations.h](/qbittorrent/qBittorrent/pull/8217/files#diff-2e1bd6be760d9575d02342478bc94df9f261604afee8d00614bf682ef57965ae)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/api/synccontroller.h](/qbittorrent/qBittorrent/pull/8217/files#diff-11fe11fdec3911e15a0113e99dd4f3894422f1e8640c7dc5d0f57675710459aa)
Outdated
Show resolved
Hide resolved
[](/Piccirello)
[Piccirello](/Piccirello)
[force-pushed](/qbittorrent/qBittorrent/compare/072edbf8913b6af69add87ac0189997c19951f3a..cee7d5991e7e462f5e34c04360fe3d911e261dd8)
the
webui-statusbar-freespace
branch
2 times, most recently
from
[`072edbf`](/qbittorrent/qBittorrent/commit/072edbf8913b6af69add87ac0189997c19951f3a) to
[`cee7d59`](/qbittorrent/qBittorrent/commit/cee7d5991e7e462f5e34c04360fe3d911e261dd8) [
Compare
](/qbittorrent/qBittorrent/compare/072edbf8913b6af69add87ac0189997c19951f3a..cee7d5991e7e462f5e34c04360fe3d911e261dd8)
[October 19, 2018 06:57](#event-1914016903)
[](/Piccirello)
Copy link
Copy Markdown
Member
Author
###
**
[Piccirello](/Piccirello)
**
commented
[Oct 19, 2018](#issuecomment-431264911)
|
All comments addressed and squashed. I moved the init logic to the `SyncController` constructor and the `FreeDiskSpaceChecker::check` call to a separate `SyncController::getFreeDiskSpace()` function.
|
</option></form>
</option></form>
[](/glassez)
**
[glassez](/glassez)
**
requested changes
[
Oct 19, 2018
](#pullrequestreview-166462947)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/8217/files)
Comment thread
[src/webui/api/freediskspacechecker.h](/qbittorrent/qBittorrent/pull/8217/files#diff-bc104dfe276bb2cf482af0889f3aaa74e83b7adbcfb61243868aff80969d3a6c)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/api/synccontroller.cpp](/qbittorrent/qBittorrent/pull/8217/files#diff-26f23205950f80a2659a1bc18ee3d7f4fc290408ae8784d0eb003bdfe36fd0bd)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/api/synccontroller.cpp](/qbittorrent/qBittorrent/pull/8217/files#diff-26f23205950f80a2659a1bc18ee3d7f4fc290408ae8784d0eb003bdfe36fd0bd)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/api/synccontroller.h](/qbittorrent/qBittorrent/pull/8217/files#diff-11fe11fdec3911e15a0113e99dd4f3894422f1e8640c7dc5d0f57675710459aa)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/api/synccontroller.h](/qbittorrent/qBittorrent/pull/8217/files#diff-11fe11fdec3911e15a0113e99dd4f3894422f1e8640c7dc5d0f57675710459aa)
Outdated
Show resolved
Hide resolved
</option></form>
23 hidden items
Load more…
[](/glassez)
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
commented
[Oct 19, 2018](#issuecomment-431321290)
|
[@Chocobo1](https://github.com/Chocobo1), please take a look at this PR, it's almost finished.
|
</option></form>
</option></form>
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
reviewed
[
Oct 20, 2018
](#pullrequestreview-166750268)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/8217/files)
Comment thread
[src/webui/api/synccontroller.cpp](/qbittorrent/qBittorrent/pull/8217/files#diff-26f23205950f80a2659a1bc18ee3d7f4fc290408ae8784d0eb003bdfe36fd0bd)
Outdated
Show resolved
Hide resolved
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
reviewed
[
Oct 20, 2018
](#pullrequestreview-166750338)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/8217/files)
Comment thread
[src/webui/api/freediskspacechecker.cpp](/qbittorrent/qBittorrent/pull/8217/files#diff-0ae286de3bc08611a51104242c078b5a757c7fdd3a466d530995758adb127a4f)
Outdated
Copy link
Copy Markdown
Member
###
**
[Chocobo1](/Chocobo1)
**
[Oct 20, 2018](#discussion_r226827892)
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
[@glassez](https://github.com/glassez)
Should this file placed under src/base (or src/base/utils) or it is fine in src/webui/api?
</option></form>
</option></form>
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
[Oct 20, 2018](#discussion_r226830138)
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
Let's keep it here since it isn't used outside of WebAPI. Or maybe move to `src/webui/api/private` to distinguish from api controllers. I don't think it will be needed somewhere else.
</option></form>
</option></form>
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
reviewed
[
Oct 21, 2018
](#pullrequestreview-166775348)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/8217/files)
Comment thread
[src/webui/api/synccontroller.h](/qbittorrent/qBittorrent/pull/8217/files#diff-11fe11fdec3911e15a0113e99dd4f3894422f1e8640c7dc5d0f57675710459aa)
Outdated
Show resolved
Hide resolved
[](/Piccirello)
Copy link
Copy Markdown
Member
Author
###
**
[Piccirello](/Piccirello)
**
commented
[Oct 21, 2018](#issuecomment-431704777)
|
I agree with all comments, all addressed and squashed (with exception of the default constructor issue).
|
</option></form>
</option></form>
[](/Piccirello)
[Piccirello](/Piccirello)
[force-pushed](/qbittorrent/qBittorrent/compare/cee7d5991e7e462f5e34c04360fe3d911e261dd8..b080d53b8d64b22b92111c5a5e0145e789cab43c)
the
webui-statusbar-freespace
branch
from
[`cee7d59`](/qbittorrent/qBittorrent/commit/cee7d5991e7e462f5e34c04360fe3d911e261dd8) to
[`b080d53`](/qbittorrent/qBittorrent/commit/b080d53b8d64b22b92111c5a5e0145e789cab43c) [
Compare
](/qbittorrent/qBittorrent/compare/cee7d5991e7e462f5e34c04360fe3d911e261dd8..b080d53b8d64b22b92111c5a5e0145e789cab43c)
[October 21, 2018 21:17](#event-1916839201)
[](/glassez)
**
[glassez](/glassez)
**
requested changes
[
Oct 22, 2018
](#pullrequestreview-166891275)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/8217/files)
Comment thread
[src/webui/api/synccontroller.cpp](/qbittorrent/qBittorrent/pull/8217/files#diff-26f23205950f80a2659a1bc18ee3d7f4fc290408ae8784d0eb003bdfe36fd0bd)
Outdated
Show resolved
Hide resolved
[
](/Piccirello)
`
[Add free disk space to WebUI status bar](/qbittorrent/qBittorrent/pull/8217/commits/2aea235e343f3c1b3d00273872d5944b25ed6f1e)
`
&hellip;
`
[2aea235](/qbittorrent/qBittorrent/pull/8217/commits/2aea235e343f3c1b3d00273872d5944b25ed6f1e)
`
```
Closes [qbittorrent#6829](https://github.com/qbittorrent/qBittorrent/pull/6829).
```
[](/Piccirello)
[Piccirello](/Piccirello)
[force-pushed](/qbittorrent/qBittorrent/compare/b080d53b8d64b22b92111c5a5e0145e789cab43c..2aea235e343f3c1b3d00273872d5944b25ed6f1e)
the
webui-statusbar-freespace
branch
from
[`b080d53`](/qbittorrent/qBittorrent/commit/b080d53b8d64b22b92111c5a5e0145e789cab43c) to
[`2aea235`](/qbittorrent/qBittorrent/commit/2aea235e343f3c1b3d00273872d5944b25ed6f1e) [
Compare
](/qbittorrent/qBittorrent/compare/b080d53b8d64b22b92111c5a5e0145e789cab43c..2aea235e343f3c1b3d00273872d5944b25ed6f1e)
[October 23, 2018 02:06](#event-1919058892)
[](/glassez)
**
[glassez](/glassez)
**
previously approved these changes
[
Oct 23, 2018
](#pullrequestreview-167195589)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/8217/files/2aea235e343f3c1b3d00273872d5944b25ed6f1e)
[
](/Piccirello)
`
[Use QElapsedTimer](/qbittorrent/qBittorrent/pull/8217/commits/f2957c721d3d946df1302b6d83bcfc0ded753827)
`
`
[f2957c7](/qbittorrent/qBittorrent/pull/8217/commits/f2957c721d3d946df1302b6d83bcfc0ded753827)
`
[](/Piccirello)
[Piccirello](/Piccirello)
dismissed
[glassez](/glassez)’s [stale review](#pullrequestreview-167195589)
via
`
[f2957c7](/qbittorrent/qBittorrent/commit/f2957c721d3d946df1302b6d83bcfc0ded753827)
`
[October 23, 2018 03:17](#event-1919158391)
[](/Piccirello)
**
[Piccirello](/Piccirello)
**
commented
[
Oct 23, 2018
](#pullrequestreview-167197146)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/8217/files/f2957c721d3d946df1302b6d83bcfc0ded753827)
Comment thread
[src/webui/api/synccontroller.h](/qbittorrent/qBittorrent/pull/8217/files/2aea235e343f3c1b3d00273872d5944b25ed6f1e..f2957c721d3d946df1302b6d83bcfc0ded753827#diff-11fe11fdec3911e15a0113e99dd4f3894422f1e8640c7dc5d0f57675710459aa)
Show resolved
Hide resolved
[](/glassez)
**
[glassez](/glassez)
**
approved these changes
[
Oct 23, 2018
](#pullrequestreview-167205657)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/8217/files/f2957c721d3d946df1302b6d83bcfc0ded753827)
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
approved these changes
[
Oct 23, 2018
](#pullrequestreview-167482123)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/8217/files/f2957c721d3d946df1302b6d83bcfc0ded753827)
[](/glassez)
[glassez](/glassez)
merged commit [`4fee16f`](/qbittorrent/qBittorrent/commit/4fee16fafb00fa49f6b558a6d09273a198a39cd4)
into
qbittorrent:master
[Oct 28, 2018](https://github.com/qbittorrent/qBittorrent/pull/8217#event-1930645222)
[](/glassez)
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
commented
[Oct 28, 2018](#issuecomment-433681642)
|
Thank you!
|
</option></form>
</option></form>
[](/FranciscoPombal)
[FranciscoPombal](/FranciscoPombal)
mentioned this pull request
[
Oct 28, 2018
](#ref-issue-106268867)
[
[Feature request] Show available disk space at Web Interface.
#3785
](/qbittorrent/qBittorrent/issues/3785)
Closed
[](/Piccirello)
[Piccirello](/Piccirello)
deleted the
webui-statusbar-freespace
branch
[October 29, 2018 00:16](#event-1931054272)
[](/Piccirello)
[Piccirello](/Piccirello)
mentioned this pull request
[
Nov 25, 2018
](#ref-issue-211868273)
[
[Wishlist] WebAPI to get disk space information of the default download path
#6458
](/qbittorrent/qBittorrent/issues/6458)
Closed
[](/thalieht)
[thalieht](/thalieht)
mentioned this pull request
[
Dec 26, 2018
](#ref-issue-394013492)
[
4.2.0: Minimal versions and breaking stuff
#10047
](/qbittorrent/qBittorrent/issues/10047)
Closed
7 tasks
</option></form>
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
[Sign up for free](/join?source=comment-repo)
**to join this conversation on GitHub**.
Already have an account?
[Sign in to comment](/login?return_to=https://github.com/qbittorrent/qBittorrent/pull/8217)
</option></form>
###
Reviewers
[
](/thalieht) [
thalieht
](/thalieht)
[
](/qbittorrent/qBittorrent/pull/8217/files/8f0f6a8daedf034ac739e961f2face9e6644f97c)
thalieht left review comments
[
](/glassez) [
glassez
](/glassez)
[
](/qbittorrent/qBittorrent/pull/8217/files/f2957c721d3d946df1302b6d83bcfc0ded753827)
glassez approved these changes
[
](/Chocobo1) [
Chocobo1
](/Chocobo1)
[
](/qbittorrent/qBittorrent/pull/8217/files/f2957c721d3d946df1302b6d83bcfc0ded753827)
Chocobo1 approved these changes
</option></form>
###
Assignees
No one assigned
###
Labels
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
5 participants
[
](/Piccirello) [
](/glassez) [
](/thalieht) [
](/Chocobo1) [
](/sledgehammer999)