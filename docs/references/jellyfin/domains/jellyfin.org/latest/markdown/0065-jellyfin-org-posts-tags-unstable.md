2 posts tagged with "unstable" | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
EFCore has landed in unstable, and this will have consequences.
We have finally reached our first milestone in cleaning up the legacy database access code. This means that all SQL builders that targeted SQLite directly have been removed from code. This marks the first step towards a completely new database design, but we now need to take a quick look ahead and see what's next.
Unstable builds will be temporarily turned off this week, skipping the 20250127 unstable to provide a full week of in-master testing, and will be re-enabled for the 20250203 unstable next week, so ensure you have backups ready this week if you run unstable builds.
Otherwise please read on to see what exactly that means and what the future brings.
- JPVenson
**Unstable users: we are planning to merge our pending EFCore conversion of `library.db` in the next couple of weeks. It is imperative that all unstable users understand what is going on, what the plan is, and how to mitigate issues that will inevitably arise from this.** Stable (`10.y.z`) users require no action.
Unstable builds are currently paused for roughly 4 weeks post-release of 10.10.0, and during this time, we plan to merge these extensive database changes. There will be breakage - bugs, fixes, and database migrations - during this time. This is your fair warning to either (a) prepare yourself with [a good backup and recovery strategy](/docs/general/administration/backup-and-restore) and disable automatic upgrades; or (b) move off of unstable onto 10.10.0 stable until the dust settles (but, please don't, as we need your help to test!)
Please read on for a more detailed overview if you are interested.
- Joshua