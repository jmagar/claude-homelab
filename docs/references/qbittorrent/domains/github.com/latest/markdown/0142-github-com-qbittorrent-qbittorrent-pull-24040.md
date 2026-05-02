Fix macOS: file opening with special chars and renaming with illegal chars by zubeyralmaho · Pull Request #24040 · qbittorrent/qBittorrent · GitHub
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
](/zubeyralmaho)
Copy link
Copy Markdown
Contributor
###
**
[zubeyralmaho](/zubeyralmaho)
**
commented
[Apr 5, 2026](#issue-4207742889)
&#8226;
edited
Loading
## Summary
* **Fix file opening on macOS** ([macOS: Can't open a file directly by double clicking in the content tab (due to download folder name containing a space i.e. 'Misc Files') #22395](https://github.com/qbittorrent/qBittorrent/issues/22395)): Use native `NSWorkspace openURL:` API instead of `QDesktopServices::openUrl(QUrl::fromLocalFile(...))`, which fails when paths contain spaces or brackets on Qt 6.7+ / macOS Sequoia. This is consistent with `openParentFolder()` which already uses native macOS APIs.
* **Fix renaming files with illegal characters** ([cannot rename file with illegal character, either when adding torrent or after adding torrent #23834](https://github.com/qbittorrent/qBittorrent/issues/23834)): Relax old path validation in `renameFile()`/`renameFolder()` from `isValid()` to `isEmpty()`. The old path comes from torrent metadata and may contain characters illegal on the host OS (e.g. `:` on macOS). The rename operation is exactly meant to fix these — blocking it defeats the purpose. The file-existence check later in the function is sufficient.
Closes [#22395](https://github.com/qbittorrent/qBittorrent/issues/22395)
Closes [#23834](https://github.com/qbittorrent/qBittorrent/issues/23834)
## Test plan
* On macOS, add a torrent and set the download folder to a path containing spaces (e.g. "Misc Files"). Double-click a file in the content tab — it should open with the default application.
* On macOS, add a torrent containing a file with brackets `[]` in the name. Double-click to open — should work.
* Add a torrent with a colon `:` in the filename (common in some torrents). Right-click → Rename should work instead of showing "The old path is invalid" error.
* Verify file opening still works on Windows and Linux (no regression).
</option></form>
</option></form>
[
](/zubeyralmaho) [
](/claude)
`
[Fix macOS: file opening with special chars and renaming files with il…](/qbittorrent/qBittorrent/pull/24040/commits/bf7aed8492eddf0cb57c0a2f9b8b4dde4686e579)
`
&hellip;
`
[bf7aed8](/qbittorrent/qBittorrent/pull/24040/commits/bf7aed8492eddf0cb57c0a2f9b8b4dde4686e579)
`
```
…legal chars
Use native NSWorkspace API to open files on macOS instead of
QDesktopServices::openUrl, which fails with spaces and brackets in paths
on Qt 6.7+ / macOS Sequoia. (Closes [qbittorrent#22395](https://github.com/qbittorrent/qBittorrent/issues/22395))
Relax old path validation in renameFile/renameFolder to only check for
emptiness instead of OS-level validity, allowing users to rename torrent
files containing characters illegal on the host OS (e.g. colon on macOS).
(Closes [qbittorrent#23834](https://github.com/qbittorrent/qBittorrent/issues/23834))
Co-Authored-By: Claude Opus 4.6 \<noreply@anthropic.com\>
```
This was referenced Apr 5, 2026
[
macOS: Can't open a file directly by double clicking in the content tab (due to download folder name containing a space i.e. 'Misc Files')
#22395
](/qbittorrent/qBittorrent/issues/22395)
Open
[
cannot rename file with illegal character, either when adding torrent or after adding torrent
#23834
](/qbittorrent/qBittorrent/issues/23834)
Open
[](/glassez)
Copy link
Copy Markdown
Member
###
**
[glassez](/glassez)
**
commented
[Apr 5, 2026](#issuecomment-4189024132)
|>
>
* **> Fix file opening on macOS
**>
* > Fix renaming files with illegal characters
>
>
Please one PR per Issue (unless the same change fixes both).
>
> Generated with
[> Claude Code
](https://claude.com/claude-code)
>
Are you able to address the reviewers' comments (if there are any) to finalize this PR?
|
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
[Sign in to comment](/login?return_to=https://github.com/qbittorrent/qBittorrent/pull/24040)
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
[
cannot rename file with illegal character, either when adding torrent or after adding torrent
](https://github.com/qbittorrent/qBittorrent/issues/23834)
[
macOS: Can't open a file directly by double clicking in the content tab (due to download folder name containing a space i.e. 'Misc Files')
](https://github.com/qbittorrent/qBittorrent/issues/22395)
###
2 participants
[
](/zubeyralmaho) [
](/glassez)