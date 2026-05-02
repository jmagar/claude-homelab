Do password hashing properly by Chocobo1 · Pull Request #9942 · qbittorrent/qBittorrent · GitHub
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
](/Chocobo1)
Copy link
Copy Markdown
Member
###
**
[Chocobo1](/Chocobo1)
**
commented
[Nov 29, 2018](#issue-385822339)
&#8226;
edited
Loading
Some notes:
* openssl \>= 1.0 is now a required dependency.
* This PR makes stored password hash very much harder to crack compared to previously used method.
This basically means even if bad actor acquired your password hash, he won't be able to easily compute your real password (assuming the real password is good enough for brute force attack).
* UI changes: [GUI](https://user-images.githubusercontent.com/9395168/49236436-135c6100-f437-11e8-913e-f5c8f9ab384c.png), [WebUI](https://user-images.githubusercontent.com/9395168/49236438-135c6100-f437-11e8-967f-95b72df29e59.png)
* PBKDF2 is chosen because qbt already uses openssl which saves us from adding another library, and also it is the only method openssl implemented AFAIK.
* PBKDF2 parameters are chosen to be in line with 1password settings: [https://support.1password.com/pbkdf2/](https://support.1password.com/pbkdf2/)
* I've not provide mitigation code yet, that is, user need to change the password from the default one after upgrading, is this really required?
</option></form>
</option></form>
[](/Chocobo1)
[Chocobo1](/Chocobo1)
added
[
Security
](</qbittorrent/qBittorrent/issues?q=state:open label:Security>)
Related to software vulnerability in qbt (don't overuse this)
[
WebUI
](</qbittorrent/qBittorrent/issues?q=state:open label:WebUI>)
WebUI-related issues/changes
[
GUI
](</qbittorrent/qBittorrent/issues?q=state:open label:GUI>)
GUI-related issues/changes
labels
[Nov 29, 2018](#event-1995762021)
[](/Chocobo1)
[Chocobo1](/Chocobo1)
[force-pushed](/qbittorrent/qBittorrent/compare/a394c93a2f7e36b94afbd6b0d7796446ddb91cfe..7afdf9d3c5fc8547fad63985d67dcfb29adb798e)
the
pbkdf2
branch
4 times, most recently
from
[`a394c93`](/qbittorrent/qBittorrent/commit/a394c93a2f7e36b94afbd6b0d7796446ddb91cfe) to
[`7afdf9d`](/qbittorrent/qBittorrent/commit/7afdf9d3c5fc8547fad63985d67dcfb29adb798e) [
Compare
](/qbittorrent/qBittorrent/compare/a394c93a2f7e36b94afbd6b0d7796446ddb91cfe..7afdf9d3c5fc8547fad63985d67dcfb29adb798e)
[November 29, 2018 17:44](#event-1995947125)
[](/glassez)
**
[glassez](/glassez)
**
reviewed
[
Nov 30, 2018
](#pullrequestreview-180131079)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9942/files)
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
left a comment
[](#pullrequestreview-180131079)
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
[@Chocobo1](https://github.com/Chocobo1), why don't you use QCryptographicHash just with more complex algorithm (SHA512)?
</option></form>
</option></form>
Comment thread
[src/base/preferences.cpp](/qbittorrent/qBittorrent/pull/9942/files#diff-203c1367472abc98b9df9b5b24cc8abb75b5014c5d5e5bf117e894816d9efd9c)
Outdated
Show resolved
Hide resolved
[](/Chocobo1)
[Chocobo1](/Chocobo1)
[force-pushed](/qbittorrent/qBittorrent/compare/7afdf9d3c5fc8547fad63985d67dcfb29adb798e..753b208036e5e88b8a58098603890db6e429cbbc)
the
pbkdf2
branch
from
[`7afdf9d`](/qbittorrent/qBittorrent/commit/7afdf9d3c5fc8547fad63985d67dcfb29adb798e) to
[`753b208`](/qbittorrent/qBittorrent/commit/753b208036e5e88b8a58098603890db6e429cbbc) [
Compare
](/qbittorrent/qBittorrent/compare/7afdf9d3c5fc8547fad63985d67dcfb29adb798e..753b208036e5e88b8a58098603890db6e429cbbc)
[November 30, 2018 13:10](#event-1997893240)
[](/Chocobo1)
Copy link
Copy Markdown
Member
Author
###
**
[Chocobo1](/Chocobo1)
**
commented
[Nov 30, 2018](#issuecomment-443202257)
|>
[> @Chocobo1
](https://github.com/Chocobo1)> , why don't you use QCryptographicHash just with more complex algorithm (SHA512)?
>
It is too weak for this purpose, you may look up "Key stretching".
|
</option></form>
</option></form>
[](/Chocobo1)
[Chocobo1](/Chocobo1)
[force-pushed](/qbittorrent/qBittorrent/compare/753b208036e5e88b8a58098603890db6e429cbbc..d5ddd9a7075732dc36e86f932aa8973ffdb83ae8)
the
pbkdf2
branch
from
[`753b208`](/qbittorrent/qBittorrent/commit/753b208036e5e88b8a58098603890db6e429cbbc) to
[`d5ddd9a`](/qbittorrent/qBittorrent/commit/d5ddd9a7075732dc36e86f932aa8973ffdb83ae8) [
Compare
](/qbittorrent/qBittorrent/compare/753b208036e5e88b8a58098603890db6e429cbbc..d5ddd9a7075732dc36e86f932aa8973ffdb83ae8)
[November 30, 2018 13:30](#event-1997933159)
[](/glassez)
**
[glassez](/glassez)
**
reviewed
[
Dec 1, 2018
](#pullrequestreview-180517967)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9942/files)
Comment thread
[src/base/preferences.cpp](/qbittorrent/qBittorrent/pull/9942/files#diff-203c1367472abc98b9df9b5b24cc8abb75b5014c5d5e5bf117e894816d9efd9c)
Outdated
Show resolved
Hide resolved
[](/glassez)
**
[glassez](/glassez)
**
reviewed
[
Dec 2, 2018
](#pullrequestreview-180522030)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9942/files)
Comment thread
[src/base/utils/password.cpp](/qbittorrent/qBittorrent/pull/9942/files#diff-becf9fd6d80daa17933c02a7730c8a9c2a0ec3f06a0ee4285e25f56b1a53a05a)
Outdated
Show resolved
Hide resolved
Comment thread
[src/base/utils/password.cpp](/qbittorrent/qBittorrent/pull/9942/files#diff-becf9fd6d80daa17933c02a7730c8a9c2a0ec3f06a0ee4285e25f56b1a53a05a)
Outdated
Show resolved
Hide resolved
Comment thread
[src/base/utils/string.h](/qbittorrent/qBittorrent/pull/9942/files#diff-892e5a7c9863cd4b0818972ba5e4aa07ec864647e3fbf80e2d15a70ea6536b80)
Outdated
Show resolved
Hide resolved
Comment thread
[src/base/utils/password.h](/qbittorrent/qBittorrent/pull/9942/files#diff-d5c581305d997ccfd4b66ed5ecf21df8e90fb7dd735e855e464a9704b8fa272a)
Outdated
Show resolved
Hide resolved
[](/Chocobo1)
[Chocobo1](/Chocobo1)
[force-pushed](/qbittorrent/qBittorrent/compare/bbec58e318a915d0dafe4314f05b6b6e6c924e9a..e5429e6355971895489346dbb13496bb21466e09)
the
pbkdf2
branch
2 times, most recently
from
[`bbec58e`](/qbittorrent/qBittorrent/commit/bbec58e318a915d0dafe4314f05b6b6e6c924e9a) to
[`e5429e6`](/qbittorrent/qBittorrent/commit/e5429e6355971895489346dbb13496bb21466e09) [
Compare
](/qbittorrent/qBittorrent/compare/bbec58e318a915d0dafe4314f05b6b6e6c924e9a..e5429e6355971895489346dbb13496bb21466e09)
[December 3, 2018 04:19](#event-2000424249)
[](/Chocobo1)
Copy link
Copy Markdown
Member
Author
###
**
[Chocobo1](/Chocobo1)
**
commented
[Dec 3, 2018](#issuecomment-443584643)
|
PR updated: resolved all comments.
|
</option></form>
</option></form>
[](/glassez)
**
[glassez](/glassez)
**
previously approved these changes
[
Dec 3, 2018
](#pullrequestreview-180631589)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9942/files)
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
left a comment
[](#pullrequestreview-180631589)
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
LGTM. Untested though.
</option></form>
</option></form>
[](/sledgehammer999)
Copy link
Copy Markdown
Member
###
**
[sledgehammer999](/sledgehammer999)
**
commented
[Dec 3, 2018](#issuecomment-443914814)
|
IMO, PR scope looks good. But I wonder if we should do more for the nox users. I assume they have set it up to run as a daemon and may not realize the daemon doesn't run due to this change.
Or maybe target this for 4.2.0?
Any thoughts?
|
</option></form>
</option></form>
[](/Chocobo1)
Copy link
Copy Markdown
Member
Author
###
**
[Chocobo1](/Chocobo1)
**
commented
[Dec 4, 2018](#issuecomment-443955478)
|>
> I assume they have set it up to run as a daemon and may not realize the daemon doesn't run due to this change.
>
The mitigation action will look like this:
```
// pseudo codevoidAuthController::loginAction()
{
constbool passwordEqual = Utils::Password::PBKDF2::verify(secret, passwordFromWeb);
if (!passwordEqual) {
constbool oldPasswordEqual = // load previous webui password and verify it using previous methodif (oldPasswordEqual)
// update webui password using new methodelse// authentication failed
}
}
```
While it is convenient for WebAPI users, we probably need to keep this mitigation code forever...
Or we can put out a warning in the News section? Stating that we are hardening this part and users needs to update their password from the default one.
>
> Or maybe target this for 4.2.0?
>
Should be better than breaking WebAPI users in a qbt minor release, this PR is still eligible for merging into master right?
|
</option></form>
</option></form>
[](/sledgehammer999)
Copy link
Copy Markdown
Member
###
**
[sledgehammer999](/sledgehammer999)
**
commented
[Dec 4, 2018](#issuecomment-444094791)
|
I would have no problem if this goes into master. I just hope it won't make backporting other commits harder.
|
</option></form>
</option></form>
[](/Chocobo1)
[Chocobo1](/Chocobo1)
dismissed
[glassez](/glassez)’s [stale review](#pullrequestreview-180631589)
via
`
[792e53a](/qbittorrent/qBittorrent/commit/792e53a06059cdbcabf56ac51d89ffff01ae1306)
`
[December 5, 2018 03:14](#event-2006046339)
[](/Chocobo1)
[Chocobo1](/Chocobo1)
[force-pushed](/qbittorrent/qBittorrent/compare/e5429e6355971895489346dbb13496bb21466e09..792e53a06059cdbcabf56ac51d89ffff01ae1306)
the
pbkdf2
branch
from
[`e5429e6`](/qbittorrent/qBittorrent/commit/e5429e6355971895489346dbb13496bb21466e09) to
[`792e53a`](/qbittorrent/qBittorrent/commit/792e53a06059cdbcabf56ac51d89ffff01ae1306) [
Compare
](/qbittorrent/qBittorrent/compare/e5429e6355971895489346dbb13496bb21466e09..792e53a06059cdbcabf56ac51d89ffff01ae1306)
[December 5, 2018 03:14](#event-2006046341)
[](/Chocobo1)
Copy link
Copy Markdown
Member
Author
###
**
[Chocobo1](/Chocobo1)
**
commented
[Dec 5, 2018](#issuecomment-444343690)
|
PR updated: resolved conflicts in `configure` file.
|
</option></form>
</option></form>
[](/Chocobo1)
[Chocobo1](/Chocobo1)
[force-pushed](/qbittorrent/qBittorrent/compare/792e53a06059cdbcabf56ac51d89ffff01ae1306..ef446a39409b1acd71c9987df2178482b26e3b1b)
the
pbkdf2
branch
from
[`792e53a`](/qbittorrent/qBittorrent/commit/792e53a06059cdbcabf56ac51d89ffff01ae1306) to
[`ef446a3`](/qbittorrent/qBittorrent/commit/ef446a39409b1acd71c9987df2178482b26e3b1b) [
Compare
](/qbittorrent/qBittorrent/compare/792e53a06059cdbcabf56ac51d89ffff01ae1306..ef446a39409b1acd71c9987df2178482b26e3b1b)
[December 5, 2018 05:10](#event-2006160525)
[Chocobo1](/Chocobo1)
added 4 commits
[December 5, 2018 13:28](#commits-pushed-8a6cac8)
[
](/Chocobo1)
`
[Make OpenSSL a direct dependency](/qbittorrent/qBittorrent/pull/9942/commits/8a6cac8338111341f1655591ca73e2f2329c6600)
`
`
[8a6cac8](/qbittorrent/qBittorrent/pull/9942/commits/8a6cac8338111341f1655591ca73e2f2329c6600)
`
[
](/Chocobo1)
`
[Apply PBKDF2 when storing passwords](/qbittorrent/qBittorrent/pull/9942/commits/05d6a294165c03dab2ed8ec94cb501cd61c4ec34)
`
`
[05d6a29](/qbittorrent/qBittorrent/pull/9942/commits/05d6a294165c03dab2ed8ec94cb501cd61c4ec34)
`
[
](/Chocobo1)
`
[Apply PBKDF2 to GUI lock](/qbittorrent/qBittorrent/pull/9942/commits/2c8890bd0693f23b7a96df7595cfe40152b4e372)
`
`
[2c8890b](/qbittorrent/qBittorrent/pull/9942/commits/2c8890bd0693f23b7a96df7595cfe40152b4e372)
`
[
](/Chocobo1)
`
[Revise startup message in nox version](/qbittorrent/qBittorrent/pull/9942/commits/593052dd937e7373d4b7775f8abf032af91415fc)
`
&hellip;
`
[593052d](/qbittorrent/qBittorrent/pull/9942/commits/593052dd937e7373d4b7775f8abf032af91415fc)
`
```
Only print the WebUI username when password is still the default.
```
[](/Chocobo1)
[Chocobo1](/Chocobo1)
[force-pushed](/qbittorrent/qBittorrent/compare/ef446a39409b1acd71c9987df2178482b26e3b1b..593052dd937e7373d4b7775f8abf032af91415fc)
the
pbkdf2
branch
from
[`ef446a3`](/qbittorrent/qBittorrent/commit/ef446a39409b1acd71c9987df2178482b26e3b1b) to
[`593052d`](/qbittorrent/qBittorrent/commit/593052dd937e7373d4b7775f8abf032af91415fc) [
Compare
](/qbittorrent/qBittorrent/compare/ef446a39409b1acd71c9987df2178482b26e3b1b..593052dd937e7373d4b7775f8abf032af91415fc)
[December 5, 2018 05:29](#event-2006180070)
[](/glassez)
**
[glassez](/glassez)
**
approved these changes
[
Dec 5, 2018
](#pullrequestreview-181632410)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9942/files/593052dd937e7373d4b7775f8abf032af91415fc)
[](/LordNyriox)
Copy link
Copy Markdown
Contributor
###
**
[LordNyriox](/LordNyriox)
**
commented
[Dec 5, 2018](#issuecomment-444544484)
|
[@Chocobo1](https://github.com/Chocobo1):
>
> openssl &gt;= 1.0 is now a required dependency.
>
Can you please add the OpenSSL version to the `About` –\> `Libraries` GUI?
It has bugged me forever that I can never tell what OpenSSL version qBittorrent was built on (without asking someone).
|
</option></form>
👍
3
glassez, Kolcha, and Supralateral reacted with thumbs up emoji
</option></form>
[](/sledgehammer999)
Copy link
Copy Markdown
Member
###
**
[sledgehammer999](/sledgehammer999)
**
commented
[Dec 5, 2018](#issuecomment-444578533)
|
[@Chocobo1](https://github.com/Chocobo1) I don't know the level of paranoid we should be about this but just in case:
1. Variable number of iterations: Have the base iteration number (100.000) and add a random number between 1 and 20.000. Of course save this info along with the salt too
2. Use scrypt/argon2 instead of PBKDF2
Just suggestions. They are not required for merging this.
|
</option></form>
</option></form>
[](/Chocobo1)
Copy link
Copy Markdown
Member
Author
###
**
[Chocobo1](/Chocobo1)
**
commented
[Dec 5, 2018](#issuecomment-444591845)
&#8226;
edited
Loading
|>
> Can you please add the OpenSSL version to the About –&gt; Libraries GUI?
>
OK, but will do it in another PR.
>
> Variable number of iterations: Have the base iteration number (100.000) and add a random number between 1 and 20.000. Of course save this info along with the salt too
>
I don't think this is the correct way (or any better), since we already use a lengthy salt that is infeasible for the hacker to pre-compute, and besides (in the extreme case) the hacker can just use 100.000 as a start and iterate all the way up to 120.000.
>
> Use scrypt/argon2 instead of PBKDF2
>
We can but we need to find & include another library, using openssl is the cheapest in this matter :P
|
</option></form>
</option></form>
[](/Chocobo1)
[Chocobo1](/Chocobo1)
merged commit [`6bb4eb8`](/qbittorrent/qBittorrent/commit/6bb4eb825b8ec5abc63493c0dc6f69949050116f)
into
qbittorrent:master
[Dec 6, 2018](https://github.com/qbittorrent/qBittorrent/pull/9942#event-2009193524)
[](/Chocobo1)
[Chocobo1](/Chocobo1)
deleted the
pbkdf2
branch
[December 6, 2018 08:22](#event-2009193894)
[](/Chocobo1)
Copy link
Copy Markdown
Member
Author
###
**
[Chocobo1](/Chocobo1)
**
commented
[Dec 6, 2018](#issuecomment-444787687)
|
Thanks for the review!
|
</option></form>
</option></form>
[](/WolfganP)
Copy link
Copy Markdown
###
**
[WolfganP](/WolfganP)
**
commented
[Dec 7, 2018](#issuecomment-445344287)
|
While compiling from master, I'm seeing a linking error now:
```
`linking qbittorrent-nox
/usr/bin/ld: password.o: undefined reference to symbol 'PKCS5\_PBKDF2\_HMAC@@OPENSSL\_1\_1\_0'
//usr/lib/arm-linux-gnueabihf/libcrypto.so.1.1: error adding symbols: DSO missing from command line
collect2: error: ld returned 1 exit status
Makefile:576: recipe for target 'qbittorrent-nox' failed
make[1]: \*\*\* [qbittorrent-nox] Error 1
make[1]: Leaving directory '/mnt/usb\_12/wTools/qBittorrent/src'
Makefile:42: recipe for target 'sub-src-make\_first' failed
make: \*\*\* [sub-src-make\_first] Error 2
`
```
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
[Dec 7, 2018](#issuecomment-445348116)
|
A `./configure` solved it for me.
|
</option></form>
👍
1
WolfganP reacted with thumbs up emoji
</option></form>
[](/WolfganP)
Copy link
Copy Markdown
###
**
[WolfganP](/WolfganP)
**
commented
[Dec 7, 2018](#issuecomment-445354529)
|>
> A
`> ./configure
`> solved it for me.
>
[@thalieht](https://github.com/thalieht) Thx, it worked for me as well.
|
</option></form>
</option></form>
[](/Piccirello)
Copy link
Copy Markdown
Member
###
**
[Piccirello](/Piccirello)
**
commented
[Dec 25, 2018](#issuecomment-449806624)
|
Could you update the WebAPI documentation for get/set preferences with this change? It still talks about md5 hashes.
|
</option></form>
</option></form>
[](/Chocobo1)
Copy link
Copy Markdown
Member
Author
###
**
[Chocobo1](/Chocobo1)
**
commented
[Dec 25, 2018](#issuecomment-449811866)
|>
> Could you update the WebAPI documentation for get/set preferences with this change? It still talks about md5 hashes.
>
Done, I presume it will start taking effect in API v.2.3.0.
|
</option></form>
</option></form>
[](/sledgehammer999)
Copy link
Copy Markdown
Member
###
**
[sledgehammer999](/sledgehammer999)
**
commented
[Dec 25, 2018](#issuecomment-449840062)
|>
> API v.2.3.0.
>
Whatever the API will be in v4.2.0. This wasn't backported to the v4.1.x series.
|
</option></form>
</option></form>
[](/Piccirello)
[Piccirello](/Piccirello)
mentioned this pull request
[
Jan 31, 2019
](#ref-pullrequest-395323330)
[
Match WebUI About page to GUI
#10096
](/qbittorrent/qBittorrent/pull/10096)
Merged
2 tasks
</option></form>
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
[Sign up for free](/join?source=comment-repo)
**to join this conversation on GitHub**.
Already have an account?
[Sign in to comment](/login?return_to=https://github.com/qbittorrent/qBittorrent/pull/9942)
</option></form>
###
Reviewers
[
](/glassez) [
glassez
](/glassez)
[
](/qbittorrent/qBittorrent/pull/9942/files/593052dd937e7373d4b7775f8abf032af91415fc)
glassez approved these changes
</option></form>
###
Assignees
No one assigned
###
Labels
[
GUI
](</qbittorrent/qBittorrent/issues?q=state:open label:GUI>)
GUI-related issues/changes
[
Security
](</qbittorrent/qBittorrent/issues?q=state:open label:Security>)
Related to software vulnerability in qbt (don't overuse this)
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
7 participants
[
](/Chocobo1) [
](/sledgehammer999) [
](/LordNyriox) [
](/WolfganP) [
](/thalieht) [
](/Piccirello) [
](/glassez)