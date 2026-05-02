Add 'Do not download + Delete' button for each file in UI by DeflateAwning · Pull Request #24106 · qbittorrent/qBittorrent · GitHub
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
](/DeflateAwning)
Copy link
Copy Markdown
###
**
[DeflateAwning](/DeflateAwning)
**
commented
[Apr 22, 2026](#issue-4306108904)
Related to [#24102](https://github.com/qbittorrent/qBittorrent/issues/24102)
I don't think this implementation is quite there yet. It seems there are issues with managing the internal state with libtorrent (informing libtorrent which pieces are available) in `src/base/bittorrent/torrentimpl.cpp`. I invite anyone more familiar with this project to help suggest a fix.
</option></form>
</option></form>
[DeflateAwning](/DeflateAwning)
added 4 commits
[April 21, 2026 17:07](#commits-pushed-ae53bd0)
[
](/DeflateAwning)
`
[feat: Add 'Do not download + Delete' button in UI](/qbittorrent/qBittorrent/pull/24106/commits/ae53bd00f497a0d84306d7ed1439a2849d677d3a)
`
`
[ae53bd0](/qbittorrent/qBittorrent/pull/24106/commits/ae53bd00f497a0d84306d7ed1439a2849d677d3a)
`
[
](/DeflateAwning)
`
[feat: Implement Deletion when using new priority](/qbittorrent/qBittorrent/pull/24106/commits/dcb0de7da43bf1282292ea79fefa26321de549cf)
`
`
[dcb0de7](/qbittorrent/qBittorrent/pull/24106/commits/dcb0de7da43bf1282292ea79fefa26321de549cf)
`
[
](/DeflateAwning)
`
[fix: Avoid showing Delete option in Add Torrent window](/qbittorrent/qBittorrent/pull/24106/commits/f46d9f4f2ec8f9fc5e73e2e0d45421ffc220983c)
`
`
[f46d9f4](/qbittorrent/qBittorrent/pull/24106/commits/f46d9f4f2ec8f9fc5e73e2e0d45421ffc220983c)
`
[
](/DeflateAwning)
`
[fix: Track internal state/progress better](/qbittorrent/qBittorrent/pull/24106/commits/27bfc64b7802467f711c9a5dec7dbd5adf7654cf)
`
`
[27bfc64](/qbittorrent/qBittorrent/pull/24106/commits/27bfc64b7802467f711c9a5dec7dbd5adf7654cf)
`
</option></form>
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
[Sign up for free](/join?source=comment-repo)
**to join this conversation on GitHub**.
Already have an account?
[Sign in to comment](/login?return_to=https://github.com/qbittorrent/qBittorrent/pull/24106)
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
None yet
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
1 participant
[
](/DeflateAwning)