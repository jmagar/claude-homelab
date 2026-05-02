Last Watched Identifier by herby2212 · Pull Request #1492 · Tautulli/Tautulli · GitHub
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
[Aug 21, 2021](#issue-976138350)
&#8226;
edited
Loading
## Description
Addition of an option to have the season and episode number listed for episodes in the Last Watched card on the home page.
This feature can be turned on/off in the settings. (enabled by default)
This feature is based on the issue [#1490](https://github.com/Tautulli/Tautulli/issues/1490).
### Screenshot
[](https://user-images.githubusercontent.com/12448284/130323417-480e664c-56bc-4926-a920-6d4dfb1ca423.png)
[](https://user-images.githubusercontent.com/12448284/130323421-bb380a27-4ddd-45df-a253-9f2642fcef6a.png)
## Type of Change
* New feature (non-breaking change which adds functionality)
## Checklist
* My code follows the style guidelines of this project
* I have performed a self-review of my own code
* I have commented my code, particularly in hard-to-understand areas
* I have added or updated the docstring for new or existing methods
</option></form>
</option></form>
[herby2212](/herby2212)
added 2 commits
[August 20, 2021 14:12](#commits-pushed-a2a385d)
[
](/herby2212)
`
[added episode identifier with season in last watch](/Tautulli/Tautulli/pull/1492/commits/a2a385d13c30567ad864aff9d6c333bd0fc172ed)
`
`
[a2a385d](/Tautulli/Tautulli/pull/1492/commits/a2a385d13c30567ad864aff9d6c333bd0fc172ed)
`
[
](/herby2212)
`
[cleanup and setting implementation](/Tautulli/Tautulli/pull/1492/commits/d6ba3c808435181a47b2503aaca5cd10697ce609)
`
`
[d6ba3c8](/Tautulli/Tautulli/pull/1492/commits/d6ba3c808435181a47b2503aaca5cd10697ce609)
`
[](/JonnyWong16)
Copy link
Copy Markdown
Contributor
###
**
[JonnyWong16](/JonnyWong16)
**
commented
[Aug 25, 2021](#issuecomment-905692253)
|
I'm not sure I like the look of the `S00E00` on the card there. And I don't think a new setting is necessary.
Also, this should be done in the UI (mako template) and not modifying the server side (python).
|
</option></form>
</option></form>
[](/herby2212)
Copy link
Copy Markdown
Contributor
Author
###
**
[herby2212](/herby2212)
**
commented
[Aug 25, 2021](#issuecomment-905806040)
&#8226;
edited
Loading
|>
> I'm not sure I like the look of the
`> S00E00
`> on the card there. And I don't think a new setting is necessary.
>
> Also, this should be done in the UI (mako template) and not modifying the server side (python).
>
I implemented the setting so people can choose if they just want the longer clean name of the episode (like it is currently) or more informations by enabling this setting. It could be disabled by default if this is a pain point for you so only users actively seeking this function can activate it.
With this in mind I think it fits quite well at this point in the `settings` and it is better to give the user the option.
Thanks for the notice regarding the mako template. I looked at the documentation and will push a [commit ](https://github.com/Tautulli/Tautulli/pull/1492/commits/b0338bbd37a28f32f1d3e31b7fc6ab3f2d238fe1) which transfers all logic to the templace. It would be great if you could have a look over it.
|
</option></form>
</option></form>
[
](/herby2212)
`
[switch logic to mako template](/Tautulli/Tautulli/pull/1492/commits/b0338bbd37a28f32f1d3e31b7fc6ab3f2d238fe1)
`
`
[b0338bb](/Tautulli/Tautulli/pull/1492/commits/b0338bbd37a28f32f1d3e31b7fc6ab3f2d238fe1)
`
[](/JonnyWong16)
Copy link
Copy Markdown
Contributor
###
**
[JonnyWong16](/JonnyWong16)
**
commented
[Aug 25, 2021](#issuecomment-905821285)
|
Maybe because it's not consistent between movies and TV shows. There is a blank in that spot when it's a movie. What if it is filled in with the movie year? But then it's still not uniform across all rows.
There's also considerations for TV shows with custom season titles ([f92ba45](https://github.com/Tautulli/Tautulli/commit/f92ba453c8f1115f9cf401fb2a636cd9ff71e44b)) or date-based TV shows ([#1487](https://github.com/Tautulli/Tautulli/issues/1487)) that don't use the `S00E00` format (although nothing else in the UI accounts for date-based shows yet).
|
</option></form>
</option></form>
[](/JonnyWong16)
**
[JonnyWong16](/JonnyWong16)
**
requested changes
[
Aug 25, 2021
](#pullrequestreview-738761931)
[
View reviewed changes
](/Tautulli/Tautulli/pull/1492/files/b0338bbd37a28f32f1d3e31b7fc6ab3f2d238fe1)
Comment thread
[plexpy/config.py](/Tautulli/Tautulli/pull/1492/files/b0338bbd37a28f32f1d3e31b7fc6ab3f2d238fe1#diff-b0ba85500b537ea2d714486828f893ca583108d33d8cca14cbb724ba5f466f00)
Outdated
Show resolved
Hide resolved
Comment thread
[plexpy/datafactory.py](/Tautulli/Tautulli/pull/1492/files/b0338bbd37a28f32f1d3e31b7fc6ab3f2d238fe1#diff-9399589cf1a9b354965d1e9157063a4c00811a81895e5e4877872d56be413b2d)
Outdated
Show resolved
Hide resolved
Comment thread
[data/interfaces/default/home\_stats.html](/Tautulli/Tautulli/pull/1492/files/b0338bbd37a28f32f1d3e31b7fc6ab3f2d238fe1#diff-6d9567d3789efd1293c59a2814edb0b02b453434693a0cd9b6a24be423ac050b)
Show resolved
Hide resolved
[
](/herby2212)
`
[cleanup](/Tautulli/Tautulli/pull/1492/commits/cac7e178ae242f0a76fd9a72d652239f77c896e1)
`
`
[cac7e17](/Tautulli/Tautulli/pull/1492/commits/cac7e178ae242f0a76fd9a72d652239f77c896e1)
`
[](/herby2212)
Copy link
Copy Markdown
Contributor
Author
###
**
[herby2212](/herby2212)
**
commented
[Aug 25, 2021](#issuecomment-905858224)
&#8226;
edited
Loading
|>
> Maybe because it's not consistent between movies and TV shows. There is a blank in that spot when it's a movie. What if it is filled in with the movie year? But then it's still not uniform across all rows.
>
> There's also considerations for TV shows with custom season titles (
[> f92ba45
](https://github.com/Tautulli/Tautulli/commit/f92ba453c8f1115f9cf401fb2a636cd9ff71e44b)> ) or date-based TV shows (
[> #1487
](https://github.com/Tautulli/Tautulli/issues/1487)> ) that don't use the
`> S00E00
`> format (although nothing else in the UI accounts for date-based shows yet).
>
If a user activates this option to get more details about the series item I wouldn't add informations (like the year at a movie) just to fill the space. It may look inconsistent, but cleaner in my opinion.
I just tested the case with custom season titles and it will just show the index (which should give the user still a rough estimate about which season the media item is in) and I believe it should stay that way for now. A custom season title would be to long for this value field.
If date-based TV shows are coming `this` along other points would probably need to be re-visited. Currently I think a date-based identifier would still fit with a syntax something like `S2021·11.8.21`, but I would leave this topic for now regarding this PR.
Though I would be open to support you at this topic if you want.
I cleaned up the spots pointed out and will re-request a review.
|
</option></form>
</option></form>
[](/herby2212)
[herby2212](/herby2212)
requested a review
from [JonnyWong16](/JonnyWong16)
[August 25, 2021 20:40](#event-5209220219)
[](/JonnyWong16)
[JonnyWong16](/JonnyWong16)
added
the
[
status:in-review
](</Tautulli/Tautulli/issues?q=state:open label:status:in-review>)
label
[Aug 27, 2021](#event-5220392942)
[](/herby2212)
Copy link
Copy Markdown
Contributor
Author
###
**
[herby2212](/herby2212)
**
commented
[Sep 6, 2021](#issuecomment-913736254)
|
[@JonnyWong16](https://github.com/JonnyWong16) I looked at the issue with the missing episode number mentioned in [#1487](https://github.com/Tautulli/Tautulli/issues/1487).
The `index` field in the xml of date based tv show elements is missing. I was thinking about the `originallyAvailableAt` field as alternative episode identifier. As this should always match the episode name/identifier.
From a UI perspective it could be checked if there is no index present and the library uses the new Plex TV Agent (as the older ones doesn't support this feature IIRC). The formatting could be done in a similar fashion to Plex.
I hope this helps as I don't know what the current status on this topic is from your site.
A picture for reference:
[](https://user-images.githubusercontent.com/12448284/132240401-0d843323-59b0-42ce-8f00-dbe182f3e02c.png)
|
</option></form>
</option></form>
[](/JonnyWong16)
Copy link
Copy Markdown
Contributor
###
**
[JonnyWong16](/JonnyWong16)
**
commented
[Sep 6, 2021](#issuecomment-913738701)
|
Yeah, I already know that. It's just *a lot* of places in the UI that need to change.
|
</option></form>
</option></form>
[](/herby2212)
Copy link
Copy Markdown
Contributor
Author
###
**
[herby2212](/herby2212)
**
commented
[Sep 6, 2021](#issuecomment-913742487)
|>
> Yeah, I already know that. It's just
*> a lot
*> of places in the UI that need to change.
>
If you agree on the `originallyAvailableAt` I would open up a PR and start working on this.
|
</option></form>
</option></form>
[](/JonnyWong16)
Copy link
Copy Markdown
Contributor
###
**
[JonnyWong16](/JonnyWong16)
**
commented
[Sep 6, 2021](#issuecomment-913751201)
|
Yes, `originallyAvailableAt` is correct when episodes don't have an `index`. Please use ISO date format `YYYY-MM-DD` because Tautulli doesn't have date localization.
|
</option></form>
👍
1
herby2212 reacted with thumbs up emoji
</option></form>
[](/herby2212)
[herby2212](/herby2212)
marked this pull request as draft
[September 7, 2021 17:07](#event-5267060990)
[](/herby2212)
Copy link
Copy Markdown
Contributor
Author
###
**
[herby2212](/herby2212)
**
commented
[Sep 7, 2021](#issuecomment-914477054)
|
Marked as draft until Pull Request [#1503](https://github.com/Tautulli/Tautulli/pull/1503) is done and merged.
|
</option></form>
</option></form>
[](/JonnyWong16)
[JonnyWong16](/JonnyWong16)
added
[
status:in-progress
](</Tautulli/Tautulli/issues?q=state:open label:status:in-progress>)
and removed
[
status:in-review
](</Tautulli/Tautulli/issues?q=state:open label:status:in-review>)
labels
[Oct 1, 2021](#event-5397006733)
</option></form>
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
[Sign up for free](/join?source=comment-repo)
**to join this conversation on GitHub**.
Already have an account?
[Sign in to comment](/login?return_to=https://github.com/Tautulli/Tautulli/pull/1492)
</option></form>
###
Reviewers
[
](/JonnyWong16) [
JonnyWong16
](/JonnyWong16)
Awaiting requested review from JonnyWong16
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