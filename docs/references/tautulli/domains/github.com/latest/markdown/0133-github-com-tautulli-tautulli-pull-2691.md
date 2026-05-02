Add per-device tracking, filtering, and friendly name override by forkymcforkface · Pull Request #2691 · Tautulli/Tautulli · GitHub
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
](/forkymcforkface)
Copy link
Copy Markdown
###
**
[forkymcforkface](/forkymcforkface)
**
commented
[Apr 22, 2026](#issue-4311570554)
## Description
Adds first-class `machine\_id` support across Tautulli so distinct Plex player devices can be identified, filtered, and renamed independently of the player name. Today a "player" name like *Apple TV* can represent multiple physical devices, and conversely the same `machine\_id` can show up under different player names over time, making per-device analysis impossible.
Each piece mirrors an existing Tautulli pattern; the work is split across 5 focused commits:
1. **graphs: add `machine\_id` filter to all chart endpoints** — every chart endpoint accepts an optional `machine\_id` parameter alongside the existing `user\_id` filter. New `get\_machine\_names` API endpoint returns the distinct devices seen in `session\_history` (most recent player name per `machine\_id`) to populate a device multi-select beside the existing user picker on the Graphs page.
2. **history: add Device ID column with click-to-filter** — new column at the end of `history.html`, `library.html`, `info.html`, `user.html`, and `history\_table\_modal.html` showing the first 8 chars of the `machine\_id` with the full id in a tooltip. Clicking the cell filters the table to that device via the existing DataTables search. Same shape as the existing `modal-control-ip` click handler.
3. **ui: enable autoWidth on the history table** — flips `autoWidth: true` so columns fit the container as the browser resizes (existing percent-width hints already summed \>100%). Safe with `serverSide: true`.
4. **users: group player stats by `machine\_id`** — `get\_player\_stats` previously grouped by player name, which collapsed distinct devices reporting the same name (e.g. multiple Apple TVs, multiple Chrome browsers) into a single tile with merged stats. Switches to `GROUP BY machine\_id` so each device gets its own tile.
5. **devices: add per-device friendly name override** — new `device\_names` table (`machine\_id` PK, `friendly\_name`, `custom\_thumb`) created in `dbcheck()`. Mirrors the user friendly\_name pattern: `edit\_device\_dialog`/`edit\_device` endpoints guarded by `member\_of("admin")`, `set\_device\_config` + `get\_device\_details` methods using `monitor\_db.upsert`, and a trimmed `edit\_device.html` modal patterned after `edit\_user.html`. The override is applied via `LEFT OUTER JOIN device\_names` in `get\_datatables\_history` and `get\_player\_stats` using the same `CASE WHEN TRIM() = ''` pattern Tautulli uses for `users.friendly\_name`, so the friendly name surfaces everywhere `player` is displayed (history tables, modals, player stats panel, exports) without touching any of those display sites. A pencil icon on each Player Stats tile opens the edit modal via a delegated-click handler matching `toggle-edit-user-modal`.
### Screenshot
Happy to add screenshots — please let me know if needed.
### Issues Fixed or Closed
No open issue — feature was developed against the need to distinguish multiple identical-named devices in real Plex households (e.g. multiple Apple TVs or Chrome browsers per user collapsing into one tile).
## Type of Change
* New feature (non-breaking change which adds functionality)
## Checklist
* My code follows the style guidelines of this project
* I have performed a self-review of my own code
* I have commented my code, particularly in hard-to-understand areas
* I have added or updated the docstring for new or existing methods
</option></form>
</option></form>
[forkymcforkface](/forkymcforkface)
added 5 commits
[April 22, 2026 12:49](#commits-pushed-852f087)
[
](/forkymcforkface)
`
[graphs: add machine\_id filter to all chart endpoints](/Tautulli/Tautulli/pull/2691/commits/852f087bdd7f71c482fa941f9af3fd36ce27b919)
`
&hellip;
`
[852f087](/Tautulli/Tautulli/pull/2691/commits/852f087bdd7f71c482fa941f9af3fd36ce27b919)
`
```
Adds an optional machine\_id parameter to every chart query so the Graphs
page can be sliced by individual Plex player device, mirroring the
existing user\_id filter. A new get\_machine\_names endpoint returns the
distinct devices seen in session\_history (most recent player name per
machine\_id) to populate a device selector.
In the Graphs page UI, a device multi-select sits next to the existing
user picker. Selecting devices re-renders all charts via the same AJAX
path that user changes already use.
```
[
](/forkymcforkface)
`
[history: add Device ID column with click-to-filter](/Tautulli/Tautulli/pull/2691/commits/455fc8abfa4dd0151d4767dc17495913200958fa)
`
&hellip;
`
[455fc8a](/Tautulli/Tautulli/pull/2691/commits/455fc8abfa4dd0151d4767dc17495913200958fa)
`
```
Adds a Device ID column at the end of every history table that exposes
the underlying machine\_id from session\_history. The column shows the
first 8 characters of the id with a tooltip carrying the full id, and
clicking the cell filters the table to that device by setting the
DataTables search to the machine\_id.
Same shape as the existing modal-control-ip click handler. The new
column is added to history.html, library.html, info.html, user.html,
and history\_table\_modal.html (where it is also hidden by default to
keep the compact modal view).
```
[
](/forkymcforkface)
`
[ui: enable autoWidth on the history table](/Tautulli/Tautulli/pull/2691/commits/578f5596c522f235fd04620cddba6dc4c5bfa213)
`
&hellip;
`
[578f559](/Tautulli/Tautulli/pull/2691/commits/578f5596c522f235fd04620cddba6dc4c5bfa213)
`
```
Flips autoWidth from false to true so DataTables fits the column
widths to the container as the browser resizes, instead of relying on
fixed percentage hints that could overflow horizontally. Safe with
serverSide: true since only one page of rows is in the DOM at a time.
```
[
](/forkymcforkface)
`
[users: group player stats by machine\_id](/Tautulli/Tautulli/pull/2691/commits/a1d8d4c5388fe89c04fc862fb098c50417b21963)
`
&hellip;
`
[a1d8d4c](/Tautulli/Tautulli/pull/2691/commits/a1d8d4c5388fe89c04fc862fb098c50417b21963)
`
```
Previously get\_player\_stats grouped by player name, which collapsed
distinct physical devices that happen to report the same player name
(e.g. multiple Apple TVs or multiple Chrome browsers) into a single
tile with combined plays. Switches the GROUP BY to machine\_id so each
device gets its own tile and stats. Adds machine\_id and last\_seen to
the returned row, and renders the first 8 characters of the machine\_id
under the player name in the Player Stats panel for visual
disambiguation.
```
[
](/forkymcforkface)
`
[devices: add per-device friendly name override](/Tautulli/Tautulli/pull/2691/commits/b1485b53c05f3bd2cfa7cf013d3e5d8b2da57296)
`
&hellip;
`
[b1485b5](/Tautulli/Tautulli/pull/2691/commits/b1485b53c05f3bd2cfa7cf013d3e5d8b2da57296)
`
```
Adds a device\_names table (machine\_id PK, friendly\_name, custom\_thumb)
created in dbcheck() alongside the other tables. Mirrors the existing
user friendly\_name pattern: edit\_device\_dialog/edit\_device endpoints
guarded by member\_of("admin"), set\_device\_config + get\_device\_details
methods on DataFactory using monitor\_db.upsert, and a trimmed
edit\_device.html modal patterned after edit\_user.html.
The override is applied via LEFT OUTER JOIN device\_names in
get\_datatables\_history and get\_player\_stats, with the same CASE WHEN
NULL OR TRIM() = '' pattern Tautulli uses for users.friendly\_name.
This means the friendly name surfaces everywhere the player name is
displayed (history tables, modals, player stats panel, exports)
without touching any of those display sites.
In the user page Profile tab, each device tile in Player Stats gets
a pencil icon that opens the edit modal via the same delegated-click
shape as the existing toggle-edit-user-modal handler.
```
</option></form>
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
[Sign up for free](/join?source=comment-repo)
**to join this conversation on GitHub**.
Already have an account?
[Sign in to comment](/login?return_to=https://github.com/Tautulli/Tautulli/pull/2691)
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
Milestone
No milestone
</option></form>
###
Development
Successfully merging this pull request may close these issues.
###
1 participant
[
](/forkymcforkface)