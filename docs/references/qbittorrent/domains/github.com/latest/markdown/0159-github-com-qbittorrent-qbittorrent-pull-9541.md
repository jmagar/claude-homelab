Set priority for multiple files in one WebAPI request by Piccirello · Pull Request #9541 · qbittorrent/qBittorrent · GitHub
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
[Sep 19, 2018](#issue-361599453)
&#8226;
edited
Loading
This API was never changed during the API revamp some months back
Closes [#6259](https://github.com/qbittorrent/qBittorrent/issues/6259)
</option></form>
</option></form>
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
reviewed
[
Sep 19, 2018
](#pullrequestreview-156728276)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/webui/api/torrentscontroller.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-2c6fdae7a7c5a881f0a502368050ed2f7c7c9173e479a2b0921cf0ca8740a8ef)
Outdated
Show resolved
Hide resolved
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
reviewed
[
Sep 19, 2018
](#pullrequestreview-156728828)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/webui/api/torrentscontroller.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-2c6fdae7a7c5a881f0a502368050ed2f7c7c9173e479a2b0921cf0ca8740a8ef)
Outdated
Show resolved
Hide resolved
[](/glassez)
[glassez](/glassez)
added
the
[
WebAPI
](</qbittorrent/qBittorrent/issues?q=state:open label:WebAPI>)
WebAPI-related issues/changes
label
[Sep 19, 2018](#event-1854509577)
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
reviewed
[
Sep 19, 2018
](#pullrequestreview-156729099)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/webui/api/torrentscontroller.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-2c6fdae7a7c5a881f0a502368050ed2f7c7c9173e479a2b0921cf0ca8740a8ef)
Outdated
Copy link
Copy Markdown
Member
###
**
[Chocobo1](/Chocobo1)
**
[Sep 19, 2018](#discussion_r218730411)
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
really, QString isn't much longer to type than auto.
</option></form>
</option></form>
👍
1
glassez reacted with thumbs up emoji
Copy link
Copy Markdown
Member
Author
###
**
[Piccirello](/Piccirello)
**
[Sep 22, 2018](#discussion_r219679376)
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
Any benefit to using an explicit type vs `auto`?
</option></form>
</option></form>
Copy link
Copy Markdown
Member
###
**
[Chocobo1](/Chocobo1)
**
[Sep 23, 2018](#discussion_r219687433)
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
I believe CODING\_GUIDELINES has enough explaination: [https://github.com/qbittorrent/qBittorrent/blob/master/CODING\_GUIDELINES.md#9-misc](https://github.com/qbittorrent/qBittorrent/blob/master/CODING_GUIDELINES.md#9-misc)
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
[Sep 23, 2018](#discussion_r219710600)
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
Recommendations for modern C++ are to use `auto` quite liberally. We get no benefit from an explicit type here.
</option></form>
</option></form>
Copy link
Copy Markdown
Member
###
**
[Chocobo1](/Chocobo1)
**
[Sep 24, 2018](#discussion_r219726559)
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
> Recommendations for modern C++ are to use auto quite liberally.
>
Source?
IMO you're using `auto` a bit too liberal. `auto` is more like a shortcut, not be used like `var` in javascript.
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
[Sep 24, 2018](#discussion_r219727038)
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
From *Item 5: Prefer auto to explicit type declarations* in *Effective Modern C++* by Scott Meyers:
>
> Using [
*> auto
*> ] saves typing, sure, but it also prevents correctness and performance issues that can bedevil manual type declaration ... There are thus several reasons to prefer
*> auto
*> over explicit type declarations ... The fact of the matter is that writing types explicitly often does little more than introduce opportunities for subtle errors, either in correctness or efficiency or both.
>
</option></form>
</option></form>
Copy link
Copy Markdown
Member
###
**
[Chocobo1](/Chocobo1)
**
[Sep 24, 2018](#discussion_r219727537)
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
Ah, thank you, however I don't see he mentions anything about readability, a google search gives a handful of debates about readability of using `auto`.
</option></form>
</option></form>
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
[Sep 24, 2018](#discussion_r219750660)
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
When we discussed our rules about using `auto` keyword, we wanted to find a balance between faster code writing and readability. So don't abuse it, please.
</option></form>
</option></form>
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
reviewed
[
Sep 19, 2018
](#pullrequestreview-156729572)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/webui/api/torrentscontroller.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-2c6fdae7a7c5a881f0a502368050ed2f7c7c9173e479a2b0921cf0ca8740a8ef)
Outdated
Show resolved
Hide resolved
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
reviewed
[
Sep 19, 2018
](#pullrequestreview-156730709)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/webui/www/private/scripts/prop-files.js](/qbittorrent/qBittorrent/pull/9541/files#diff-5bfcf10b3636eeef88ce2132b5adcf08b040607a9b53d17835beb9ced34a1a24)
Outdated
Show resolved
Hide resolved
[](/glassez)
**
[glassez](/glassez)
**
reviewed
[
Sep 19, 2018
](#pullrequestreview-156732062)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/webui/api/torrentscontroller.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-2c6fdae7a7c5a881f0a502368050ed2f7c7c9173e479a2b0921cf0ca8740a8ef)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/api/torrentscontroller.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-2c6fdae7a7c5a881f0a502368050ed2f7c7c9173e479a2b0921cf0ca8740a8ef)
Outdated
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
[Sep 19, 2018](#discussion_r218733463)
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
I would change param name, but it breaks API compatibility...
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
[Sep 22, 2018](#discussion_r219679943)
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
I want your thoughts: we add an optional `ids` param that takes priority over the `id` param. Or we can change the name and bump the web api version.
</option></form>
</option></form>
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
[Sep 23, 2018](#discussion_r219688943)
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
We shouldn't produce incompatible changes so frequently if possible.
So maybe we should have some way to keep track of these "non-urgent" changes, and then make all the changes at once when we have the required changes?
</option></form>
</option></form>
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
[Sep 23, 2018](#discussion_r219706776)
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
Maybe keep the list of postponed changes near the API version declaration, e.g. "When your changes require increasing of minor version you should also apply the following:" and then list of changes.
What do you say? [@Chocobo1](https://github.com/Chocobo1)?
</option></form>
</option></form>
Copy link
Copy Markdown
Member
###
**
[Chocobo1](/Chocobo1)
**
[Sep 24, 2018](#discussion_r219728980)
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
> What do you say?
[> @Chocobo1
](https://github.com/Chocobo1)> ?
>
I don't think I get your idea.
However I think the commit bumping API version should also include the api code changes, so it is possible to look up by reading git log.
</option></form>
</option></form>
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
[Sep 24, 2018](#discussion_r219909838)
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
> I don't think I get your idea.
>
[@Chocobo1](https://github.com/Chocobo1), take this case for example.
Meaning of param 'id' was changed. Now it provide list of file IDs. It should cause changing of param name but it breaks API compatibility. It's really bad idea to make incompatible changes too frequently.
We can proceed to use old name for some time and just mark it for future changing.
When we make changes that cannot be made in a compatible way, we can add all pending changes with them.
</option></form>
</option></form>
Copy link
Copy Markdown
Member
###
**
[Chocobo1](/Chocobo1)
**
[Sep 25, 2018](#discussion_r220051358)
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
> We can proceed to use old name for some time and just mark it for future changing.
>
I don't object the idea, however I must say from my experience, revisiting an older code after some time takes much more time for the developer and outcome is usually not good enough quality.
If [@Piccirello](https://github.com/Piccirello) is interested, we could try it out in this case (experiment).
</option></form>
</option></form>
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
[Sep 25, 2018](#discussion_r220054344)
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
> however I must say from my experience, revisiting an older code after some time takes much more time for the developer and outcome is usually not good enough quality.
>
So I suggest to keep list with postponed changes. We can have some instructions, where, what and how it should be changed. Or we can even have commented changes inplace.
Well, I'm not insisting. I just thought we shouldn't break API too often.
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
[Sep 27, 2018](#discussion_r220776339)
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
I would be interested, maybe maintaining a separate branch with breaking api changes that can be merged pre-minor version bump.
</option></form>
</option></form>
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
[Sep 27, 2018](#discussion_r220789022)
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
> maybe maintaining a separate branch with breaking api changes that can be merged pre-minor version bump.
>
And have opened PR for it.
Let's try something!
</option></form>
</option></form>
[](/Piccirello)
[Piccirello](/Piccirello)
[force-pushed](/qbittorrent/qBittorrent/compare/00f64e66353875e7946f027d0bde6cd7cc89d62f..f23dad07fc0c51db64c9444e078f3b93ed744069)
the
webui-file-priority
branch
from
[`00f64e6`](/qbittorrent/qBittorrent/commit/00f64e66353875e7946f027d0bde6cd7cc89d62f) to
[`f23dad0`](/qbittorrent/qBittorrent/commit/f23dad07fc0c51db64c9444e078f3b93ed744069) [
Compare
](/qbittorrent/qBittorrent/compare/00f64e66353875e7946f027d0bde6cd7cc89d62f..f23dad07fc0c51db64c9444e078f3b93ed744069)
[September 22, 2018 20:13](#event-1861738052)
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
reviewed
[
Sep 23, 2018
](#pullrequestreview-157928869)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/webui/api/torrentscontroller.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-2c6fdae7a7c5a881f0a502368050ed2f7c7c9173e479a2b0921cf0ca8740a8ef)
Outdated
Show resolved
Hide resolved
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
reviewed
[
Sep 23, 2018
](#pullrequestreview-157928878)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/webui/api/torrentscontroller.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-2c6fdae7a7c5a881f0a502368050ed2f7c7c9173e479a2b0921cf0ca8740a8ef)
Outdated
Copy link
Copy Markdown
Member
###
**
[Chocobo1](/Chocobo1)
**
[Sep 23, 2018](#discussion_r219688550)
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
`const int id : fileIdsInts`
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
[Sep 23, 2018](#discussion_r219710608)
&#8226;
edited
Loading
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
From the coding guidelines:
`Declarations for which one can gather enough information about the object interface (type) from its name or the usage pattern .. or the right part of the expression nicely fit here.`
Seems we can gather enough info about the type from the variable name `fileIdsInts`.
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
[Sep 24, 2018](#discussion_r219752693)
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
The variable name does not matter. This paragraph means something completely different:
```
auto \*varName = static\_cast\<RSS::Feed \*\>(rssItemPtr);
```
Or:
```
auto \*session = BitTorrent::Session::instance();
```
</option></form>
</option></form>
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
reviewed
[
Sep 23, 2018
](#pullrequestreview-157929076)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/webui/api/torrentscontroller.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-2c6fdae7a7c5a881f0a502368050ed2f7c7c9173e479a2b0921cf0ca8740a8ef)
Outdated
Show resolved
Hide resolved
[](/Piccirello)
[Piccirello](/Piccirello)
[force-pushed](/qbittorrent/qBittorrent/compare/8292784f8ccd349309384231f902c998d34ad169..995d92bcd1468f9b991880ed19a1f21b2aedee85)
the
webui-file-priority
branch
4 times, most recently
from
[`8292784`](/qbittorrent/qBittorrent/commit/8292784f8ccd349309384231f902c998d34ad169) to
[`995d92b`](/qbittorrent/qBittorrent/commit/995d92bcd1468f9b991880ed19a1f21b2aedee85) [
Compare
](/qbittorrent/qBittorrent/compare/8292784f8ccd349309384231f902c998d34ad169..995d92bcd1468f9b991880ed19a1f21b2aedee85)
[September 24, 2018 04:56](#event-1862326019)
[](/glassez)
**
[glassez](/glassez)
**
requested changes
[
Sep 27, 2018
](#pullrequestreview-159277064)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
left a comment
[](#pullrequestreview-159277064)
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
[@Piccirello](https://github.com/Piccirello), you forgot to fix [this](https://github.com/qbittorrent/qBittorrent/pull/9541#discussion_r219755702).
</option></form>
</option></form>
Comment thread
[src/webui/api/torrentscontroller.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-2c6fdae7a7c5a881f0a502368050ed2f7c7c9173e479a2b0921cf0ca8740a8ef)
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
[Sep 27, 2018](#issuecomment-424954495)
|
[@glassez](https://github.com/glassez) whoops, good catch. Pushing a new commit.
|
</option></form>
</option></form>
[](/glassez)
**
[glassez](/glassez)
**
requested changes
[
Sep 27, 2018
](#pullrequestreview-159291135)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/base/bittorrent/torrenthandle.h](/qbittorrent/qBittorrent/pull/9541/files#diff-0eb2df761fdcc3c90454075f39e04c5d10d4b7be1c1d4019a5803bff72e6d4a1)
Outdated
Show resolved
Hide resolved
Comment thread
[src/base/bittorrent/torrenthandle.h](/qbittorrent/qBittorrent/pull/9541/files#diff-0eb2df761fdcc3c90454075f39e04c5d10d4b7be1c1d4019a5803bff72e6d4a1)
Outdated
Show resolved
Hide resolved
[](/Piccirello)
[Piccirello](/Piccirello)
[force-pushed](/qbittorrent/qBittorrent/compare/d08519bba91cc451f753cf546ca9dab97c8183a7..dba8b59f82cb7d2948648d5d10e7761486066737)
the
webui-file-priority
branch
4 times, most recently
from
[`d08519b`](/qbittorrent/qBittorrent/commit/d08519bba91cc451f753cf546ca9dab97c8183a7) to
[`dba8b59`](/qbittorrent/qBittorrent/commit/dba8b59f82cb7d2948648d5d10e7761486066737) [
Compare
](/qbittorrent/qBittorrent/compare/d08519bba91cc451f753cf546ca9dab97c8183a7..dba8b59f82cb7d2948648d5d10e7761486066737)
[October 22, 2018 04:12](#event-1916971859)
[](/glassez)
**
[glassez](/glassez)
**
requested changes
[
Oct 22, 2018
](#pullrequestreview-166932571)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/base/bittorrent/torrenthandle.h](/qbittorrent/qBittorrent/pull/9541/files#diff-0eb2df761fdcc3c90454075f39e04c5d10d4b7be1c1d4019a5803bff72e6d4a1)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/api/torrentscontroller.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-2c6fdae7a7c5a881f0a502368050ed2f7c7c9173e479a2b0921cf0ca8740a8ef)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/api/torrentscontroller.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-2c6fdae7a7c5a881f0a502368050ed2f7c7c9173e479a2b0921cf0ca8740a8ef)
Outdated
Show resolved
Hide resolved
[](/Piccirello)
[Piccirello](/Piccirello)
[force-pushed](/qbittorrent/qBittorrent/compare/e6d3a1141aea6b6f52971c1036b3efe1d94a45af..942dcbd14c6c972935090bde64aca3a64cfc97a8)
the
webui-file-priority
branch
2 times, most recently
from
[`e6d3a11`](/qbittorrent/qBittorrent/commit/e6d3a1141aea6b6f52971c1036b3efe1d94a45af) to
[`942dcbd`](/qbittorrent/qBittorrent/commit/942dcbd14c6c972935090bde64aca3a64cfc97a8) [
Compare
](/qbittorrent/qBittorrent/compare/e6d3a1141aea6b6f52971c1036b3efe1d94a45af..942dcbd14c6c972935090bde64aca3a64cfc97a8)
[October 24, 2018 04:30](#event-1922323731)
[](/glassez)
**
[glassez](/glassez)
**
previously requested changes
[
Oct 25, 2018
](#pullrequestreview-168014697)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/gui/addnewtorrentdialog.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-98fbbf463b7dd400c02d9f4b065ac964158f66ea0ccdc57146509b5815b65671)
Outdated
Show resolved
Hide resolved
[](/glassez)
**
[glassez](/glassez)
**
reviewed
[
Oct 25, 2018
](#pullrequestreview-168228309)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/gui/addnewtorrentdialog.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-98fbbf463b7dd400c02d9f4b065ac964158f66ea0ccdc57146509b5815b65671)
Outdated
Show resolved
Hide resolved
[](/glassez)
**
[glassez](/glassez)
**
reviewed
[
Oct 25, 2018
](#pullrequestreview-168228411)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/gui/properties/propertieswidget.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-7ce9aac893ace533c4f2510270f0dce8a97be887644e79bc7a31ac9c1c522dc9)
Outdated
Show resolved
Hide resolved
[](/glassez)
**
[glassez](/glassez)
**
reviewed
[
Oct 25, 2018
](#pullrequestreview-168229728)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/gui/properties/proplistdelegate.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-9fd7f9b0d4df6ded0652b7a28f4edb24c08cc6d515920afd25391a58dfa54b84)
Outdated
Show resolved
Hide resolved
[](/glassez)
**
[glassez](/glassez)
**
reviewed
[
Oct 25, 2018
](#pullrequestreview-168229833)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/gui/properties/proplistdelegate.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-9fd7f9b0d4df6ded0652b7a28f4edb24c08cc6d515920afd25391a58dfa54b84)
Outdated
Show resolved
Hide resolved
</option></form>
73 hidden items
Load more…
[](/Piccirello)
[Piccirello](/Piccirello)
requested a review
from [Chocobo1](/Chocobo1)
[November 21, 2018 22:56](#event-1981262346)
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
reviewed
[
Nov 24, 2018
](#pullrequestreview-178040176)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/webui/api/torrentscontroller.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-2c6fdae7a7c5a881f0a502368050ed2f7c7c9173e479a2b0921cf0ca8740a8ef)
Outdated
Show resolved
Hide resolved
[](/Piccirello)
[Piccirello](/Piccirello)
[force-pushed](/qbittorrent/qBittorrent/compare/1c8046866d73e6e0e7a7853b88b23549ae23bf45..33942f2899398adf4812629d03930d7718c955b1)
the
webui-file-priority
branch
from
[`1c80468`](/qbittorrent/qBittorrent/commit/1c8046866d73e6e0e7a7853b88b23549ae23bf45) to
[`33942f2`](/qbittorrent/qBittorrent/commit/33942f2899398adf4812629d03930d7718c955b1) [
Compare
](/qbittorrent/qBittorrent/compare/1c8046866d73e6e0e7a7853b88b23549ae23bf45..33942f2899398adf4812629d03930d7718c955b1)
[November 25, 2018 04:24](#event-1985239085)
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
previously approved these changes
[
Nov 25, 2018
](#pullrequestreview-178069265)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
[](/glassez)
**
[glassez](/glassez)
**
reviewed
[
Nov 25, 2018
](#pullrequestreview-178090454)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/gui/torrentcontentmodelitem.h](/qbittorrent/qBittorrent/pull/9541/files#diff-ed62a426684fab0ab24f2815bda3ff7a97169d5ce89a1e17b6ad0c5164358dcf)
Outdated
Show resolved
Hide resolved
[](/Piccirello)
[Piccirello](/Piccirello)
dismissed
[Chocobo1](/Chocobo1)’s [stale review](#pullrequestreview-178069265)
via
`
[9ff6e9c](/qbittorrent/qBittorrent/commit/9ff6e9c3e089b9a176b452170f23d9feb5187abb)
`
[December 1, 2018 07:01](#event-1999389141)
[](/Piccirello)
[Piccirello](/Piccirello)
[force-pushed](/qbittorrent/qBittorrent/compare/33942f2899398adf4812629d03930d7718c955b1..9ff6e9c3e089b9a176b452170f23d9feb5187abb)
the
webui-file-priority
branch
from
[`33942f2`](/qbittorrent/qBittorrent/commit/33942f2899398adf4812629d03930d7718c955b1) to
[`9ff6e9c`](/qbittorrent/qBittorrent/commit/9ff6e9c3e089b9a176b452170f23d9feb5187abb) [
Compare
](/qbittorrent/qBittorrent/compare/33942f2899398adf4812629d03930d7718c955b1..9ff6e9c3e089b9a176b452170f23d9feb5187abb)
[December 1, 2018 07:01](#event-1999389142)
[](/glassez)
**
[glassez](/glassez)
**
requested changes
[
Dec 1, 2018
](#pullrequestreview-180515918)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/base/bittorrent/filepriority.h](/qbittorrent/qBittorrent/pull/9541/files#diff-0a52a6e4805c1f53fbeeb479ad66e2cea5132c3c887456eae051f12c31906a81)
Outdated
Show resolved
Hide resolved
Comment thread
[src/webui/api/torrentscontroller.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-2c6fdae7a7c5a881f0a502368050ed2f7c7c9173e479a2b0921cf0ca8740a8ef)
Outdated
Show resolved
Hide resolved
[](/Piccirello)
[Piccirello](/Piccirello)
[force-pushed](/qbittorrent/qBittorrent/compare/9ff6e9c3e089b9a176b452170f23d9feb5187abb..9a1e415306538e6e0b3fbcc6830136b3b2c2dada)
the
webui-file-priority
branch
from
[`9ff6e9c`](/qbittorrent/qBittorrent/commit/9ff6e9c3e089b9a176b452170f23d9feb5187abb) to
[`9a1e415`](/qbittorrent/qBittorrent/commit/9a1e415306538e6e0b3fbcc6830136b3b2c2dada) [
Compare
](/qbittorrent/qBittorrent/compare/9ff6e9c3e089b9a176b452170f23d9feb5187abb..9a1e415306538e6e0b3fbcc6830136b3b2c2dada)
[December 3, 2018 00:10](#event-2000222610)
[](/glassez)
**
[glassez](/glassez)
**
previously approved these changes
[
Dec 3, 2018
](#pullrequestreview-180601965)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
reviewed
[
Dec 3, 2018
](#pullrequestreview-180622385)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/webui/api/torrentscontroller.cpp](/qbittorrent/qBittorrent/pull/9541/files#diff-2c6fdae7a7c5a881f0a502368050ed2f7c7c9173e479a2b0921cf0ca8740a8ef)
Outdated
Show resolved
Hide resolved
[](/Chocobo1)
[Chocobo1](/Chocobo1)
mentioned this pull request
[
Dec 3, 2018
](#ref-pullrequest-386672802)
[
Use Javascript strict mode
#9959
](/qbittorrent/qBittorrent/pull/9959)
Merged
[](/Piccirello)
[Piccirello](/Piccirello)
dismissed
[glassez](/glassez)’s [stale review](#pullrequestreview-180601965)
via
`
[5e4e2b4](/qbittorrent/qBittorrent/commit/5e4e2b4006c480cefc425758f13ce926e85871ce)
`
[December 7, 2018 06:21](#event-2011672413)
[](/Piccirello)
[Piccirello](/Piccirello)
[force-pushed](/qbittorrent/qBittorrent/compare/5e4e2b4006c480cefc425758f13ce926e85871ce..76bb8306eb96ee7b752c1136f2aa97d6d4aeb8a5)
the
webui-file-priority
branch
2 times, most recently
from
[`5e4e2b4`](/qbittorrent/qBittorrent/commit/5e4e2b4006c480cefc425758f13ce926e85871ce) to
[`76bb830`](/qbittorrent/qBittorrent/commit/76bb8306eb96ee7b752c1136f2aa97d6d4aeb8a5) [
Compare
](/qbittorrent/qBittorrent/compare/5e4e2b4006c480cefc425758f13ce926e85871ce..76bb8306eb96ee7b752c1136f2aa97d6d4aeb8a5)
[December 8, 2018 00:02](#event-2013684652)
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
previously approved these changes
[
Dec 8, 2018
](#pullrequestreview-182931458)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
[](/glassez)
**
[glassez](/glassez)
**
reviewed
[
Dec 8, 2018
](#pullrequestreview-182931685)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Comment thread
[src/base/bittorrent/filepriority.h](/qbittorrent/qBittorrent/pull/9541/files#diff-0a52a6e4805c1f53fbeeb479ad66e2cea5132c3c887456eae051f12c31906a81)
Outdated
Show resolved
Hide resolved
[](/glassez)
**
[glassez](/glassez)
**
reviewed
[
Dec 8, 2018
](#pullrequestreview-182931820)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files)
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
left a comment
[](#pullrequestreview-182931820)
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
[@Chocobo1](https://github.com/Chocobo1), feel free to merge it.
</option></form>
</option></form>
[](/AceLewis)
[AceLewis](/AceLewis)
mentioned this pull request
[
Dec 8, 2018
](#ref-issue-376194225)
[
WebUi list of improvements that need to be made to the UI
#9796
](/qbittorrent/qBittorrent/issues/9796)
Open
61 tasks
[Piccirello](/Piccirello)
added 5 commits
[December 10, 2018 23:21](#commits-pushed-f27dc97)
[
](/Piccirello)
`
[Replace prio namespace with FilePriority enum class](/qbittorrent/qBittorrent/pull/9541/commits/f27dc977e92c11350b5db26800937d0244b01a06)
`
`
[f27dc97](/qbittorrent/qBittorrent/pull/9541/commits/f27dc977e92c11350b5db26800937d0244b01a06)
`
[
](/Piccirello)
`
[Set priority for multiple files in one WebAPI request](/qbittorrent/qBittorrent/pull/9541/commits/c5b8f62780b178a5912fd0d60b7459cec3a9067d)
`
&hellip;
`
[c5b8f62](/qbittorrent/qBittorrent/pull/9541/commits/c5b8f62780b178a5912fd0d60b7459cec3a9067d)
`
```
Closes [qbittorrent#6259](https://github.com/qbittorrent/qBittorrent/issues/6259).
```
[
](/Piccirello)
`
[Fix incorrect priority value sent from WebUI](/qbittorrent/qBittorrent/pull/9541/commits/a44ed9cfd3a45840dbd78ad809c9368c5203be6a)
`
&hellip;
`
[a44ed9c](/qbittorrent/qBittorrent/pull/9541/commits/a44ed9cfd3a45840dbd78ad809c9368c5203be6a)
`
```
Closes [qbittorrent#9070](https://github.com/qbittorrent/qBittorrent/issues/9070).
```
[
](/Piccirello)
`
[Fix display bugs in WebUI Files tab. Remove \<IE9 support](/qbittorrent/qBittorrent/pull/9541/commits/66015164d7c89a640be8e35deb9a4587cf32cdd4)
`
&hellip;
`
[6601516](/qbittorrent/qBittorrent/pull/9541/commits/66015164d7c89a640be8e35deb9a4587cf32cdd4)
`
```
Priority select boxes would frequently go blank due to an unexpected priority value. On first load, the torrent-scoped file checkbox's state was inconsistent with the state of the torrent's files.
```
[
](/Piccirello)
`
[Update Copyright email address](/qbittorrent/qBittorrent/pull/9541/commits/57e625494b26e0223fc236dc4d954dcbf2fe1985)
`
`
[57e6254](/qbittorrent/qBittorrent/pull/9541/commits/57e625494b26e0223fc236dc4d954dcbf2fe1985)
`
[](/Piccirello)
[Piccirello](/Piccirello)
dismissed
[Chocobo1](/Chocobo1)’s [stale review](#pullrequestreview-182931458)
via
`
[57e6254](/qbittorrent/qBittorrent/commit/57e625494b26e0223fc236dc4d954dcbf2fe1985)
`
[December 11, 2018 04:21](#event-2017672617)
[](/Piccirello)
[Piccirello](/Piccirello)
[force-pushed](/qbittorrent/qBittorrent/compare/76bb8306eb96ee7b752c1136f2aa97d6d4aeb8a5..57e625494b26e0223fc236dc4d954dcbf2fe1985)
the
webui-file-priority
branch
from
[`76bb830`](/qbittorrent/qBittorrent/commit/76bb8306eb96ee7b752c1136f2aa97d6d4aeb8a5) to
[`57e6254`](/qbittorrent/qBittorrent/commit/57e625494b26e0223fc236dc4d954dcbf2fe1985) [
Compare
](/qbittorrent/qBittorrent/compare/76bb8306eb96ee7b752c1136f2aa97d6d4aeb8a5..57e625494b26e0223fc236dc4d954dcbf2fe1985)
[December 11, 2018 04:21](#event-2017672619)
[](/Chocobo1)
**
[Chocobo1](/Chocobo1)
**
approved these changes
[
Dec 11, 2018
](#pullrequestreview-183515953)
[
View reviewed changes
](/qbittorrent/qBittorrent/pull/9541/files/57e625494b26e0223fc236dc4d954dcbf2fe1985)
[](/Chocobo1)
[Chocobo1](/Chocobo1)
merged commit [`cf9d903`](/qbittorrent/qBittorrent/commit/cf9d903ba901468d0a627f836504dd5f58fd752d)
into
qbittorrent:master
[Dec 11, 2018](https://github.com/qbittorrent/qBittorrent/pull/9541#event-2017742899)
[](/Chocobo1)
Copy link
Copy Markdown
Member
###
**
[Chocobo1](/Chocobo1)
**
commented
[Dec 11, 2018](#issuecomment-446078052)
|
Thank you!
|
</option></form>
</option></form>
[](/Piccirello)
[Piccirello](/Piccirello)
deleted the
webui-file-priority
branch
[July 15, 2019 00:44](#event-2481588705)
</option></form>
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
[Sign up for free](/join?source=comment-repo)
**to join this conversation on GitHub**.
Already have an account?
[Sign in to comment](/login?return_to=https://github.com/qbittorrent/qBittorrent/pull/9541)
</option></form>
###
Reviewers
[
](/glassez) [
glassez
](/glassez)
[
](/qbittorrent/qBittorrent/pull/9541/files/76bb8306eb96ee7b752c1136f2aa97d6d4aeb8a5)
glassez left review comments
[
](/Chocobo1) [
Chocobo1
](/Chocobo1)
[
](/qbittorrent/qBittorrent/pull/9541/files/57e625494b26e0223fc236dc4d954dcbf2fe1985)
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
No milestone
</option></form>
###
Development
Successfully merging this pull request may close these issues.
###
4 participants
[
](/Piccirello) [
](/xnoreq) [
](/Chocobo1) [
](/glassez)