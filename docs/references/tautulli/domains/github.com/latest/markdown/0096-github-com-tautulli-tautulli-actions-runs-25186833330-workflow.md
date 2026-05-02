v2.17.0 · Tautulli/Tautulli@5610c16 · GitHub
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
[
Stale Issues / PRs](/Tautulli/Tautulli/actions/workflows/issues-stale.yml)
#
Stale Issues / PRs
#1804
[Sign in to view logs](/login?return_to=https://github.com/Tautulli/Tautulli/actions/runs/25186833330/workflow)
* [Sign in to view logs](/login?return_to=https://github.com/Tautulli/Tautulli/actions/runs/25186833330/workflow)
##
Workflow file
#
Stale Issues / PRs
##
Stale Issues / PRs #1804
#### Workflow file for this run
[
.github/workflows/issues-stale.yml
](/Tautulli/Tautulli/blob/5610c167a17b0898d93d0588a0df81c03306ac52/.github/workflows/issues-stale.yml) at
[5610c16](/Tautulli/Tautulli/commit/5610c167a17b0898d93d0588a0df81c03306ac52)
[
](/Tautulli/Tautulli/edit/master/.github/workflows/issues-stale.yml)
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
||name: Stale Issues / PRs|
|||
||on:|
||schedule:|
|| - cron: '00 19 \* \* \*'|
|||
||jobs:|
||stale:|
||name: Check Issues / PRs|
||runs-on: ubuntu-latest|
||steps:|
|| - name: Stale|
||uses: actions/stale@v10|
||with:|
||stale-issue-message: \>|
|| This issue is stale because it has been open for 30 days with no activity.|
|| Remove the stale label or comment, otherwise this will be closed in 5 days.|
||close-issue-message: \>|
|| This issue was closed because it has been stalled for 5 days with no activity.|
||stale-issue-label: 'stale'|
||exempt-issue-labels: 'added,fixed,type:enhancement,status:awaiting-triage,status:in-progress'|
||stale-pr-message: \>|
|| This PR is stale because it has been open for 30 days with no activity.|
|| Remove the stale label or comment, otherwise this will be closed in 5 days.|
||close-pr-message: \>|
|| This PR was closed because it has been stalled for 5 days with no activity.|
||stale-pr-label: 'stale'|
||exempt-pr-labels: 'status:in-progress,status:in-review,dependencies'|
||days-before-stale: 30|
||days-before-close: 5|
|||
|| - name: Invalid Template|
||uses: actions/stale@v10|
||with:|
||stale-issue-message: \>|
|| Invalid issues template.|
||close-issue-message: \>|
|| This issue was closed because the the template was not completed after 5 days.|
||stale-issue-label: 'invalid:template-incomplete'|
||stale-pr-message: \>|
|| Invalid PR template.|
||close-pr-message: \>|
|| This PR was closed because the the template was not completed after 5 days.|
||stale-pr-label: 'invalid:template-incomplete'|
||exempt-pr-labels: 'status:in-progress,status:in-review,dependencies'|
||only-labels: 'invalid:template-incomplete'|
||days-before-stale: 0|
||days-before-close: 5|