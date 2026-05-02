Bump pyopenssl from 26.0.0 to 26.1.0 · Tautulli/Tautulli@4217ec3 · GitHub
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
Pull Requests](/Tautulli/Tautulli/actions/workflows/pull-requests.yml)
#
Bump pyopenssl from 26.0.0 to 26.1.0
#2177
[Sign in to view logs](/login?return_to=https://github.com/Tautulli/Tautulli/actions/runs/25019310221/workflow)
* [Sign in to view logs](/login?return_to=https://github.com/Tautulli/Tautulli/actions/runs/25019310221/workflow)
##
Workflow file
#
Bump pyopenssl from 26.0.0 to 26.1.0
##
Bump pyopenssl from 26.0.0 to 26.1.0 #2177
#### Workflow file for this run
[
.github/workflows/pull-requests.yml
](/Tautulli/Tautulli/blob/4217ec317d7c7cae71a67242ac836b7a52e09d10/.github/workflows/pull-requests.yml) at
[4217ec3](/Tautulli/Tautulli/commit/4217ec317d7c7cae71a67242ac836b7a52e09d10)
[
](/Tautulli/Tautulli/edit/dependabot/pip/nightly/pyopenssl-26.1.0/.github/workflows/pull-requests.yml)
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
||name: Pull Requests|
|||
||on:|
||pull\_request\_target:|
||types: [opened, synchronize, edited, reopened]|
|||
||jobs:|
||check-branch:|
||name: Check Pull Request|
||runs-on: ubuntu-latest|
||steps:|
|| - name: Checkout Code|
||uses: actions/checkout@v6|
|||
|| - name: Comment on Pull Request|
||uses: mshick/add-pr-comment@v3|
||if: github.base\_ref != 'nightly'|
||with:|
||message: Pull requests must be made to the `nightly` branch. Thanks.|
||repo-token: ${{ github.token }}|
|||
|| - name: Fail Workflow|
||if: github.base\_ref != 'nightly'|
||run: ||
|| echo Base: "$GITHUB\_BASE\_REF"|
|| echo Head: "$GITHUB\_HEAD\_REF"|
|| exit 1|