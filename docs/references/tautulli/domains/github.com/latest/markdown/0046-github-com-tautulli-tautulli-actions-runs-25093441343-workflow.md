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
Issues](/Tautulli/Tautulli/actions/workflows/issues.yml)
#
Include customized usernames within backups
#2526
[Sign in to view logs](/login?return_to=https://github.com/Tautulli/Tautulli/actions/runs/25093441343/workflow)
* [Sign in to view logs](/login?return_to=https://github.com/Tautulli/Tautulli/actions/runs/25093441343/workflow)
##
Workflow file
#
Include customized usernames within backups
##
Include customized usernames within backups #2526
#### Workflow file for this run
[
.github/workflows/issues.yml
](/Tautulli/Tautulli/blob/5610c167a17b0898d93d0588a0df81c03306ac52/.github/workflows/issues.yml) at
[5610c16](/Tautulli/Tautulli/commit/5610c167a17b0898d93d0588a0df81c03306ac52)
[
](/Tautulli/Tautulli/edit/master/.github/workflows/issues.yml)
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
||name: Issues|
|||
||on:|
||issues:|
||types: [labeled, unlabeled]|
|||
||jobs:|
||label:|
||name: Label Issues|
||runs-on: ubuntu-latest|
||steps:|
|| - name: Label Issues|
||uses: dessant/label-actions@v5|
||with:|
||github-token: ${{ github.token }}|