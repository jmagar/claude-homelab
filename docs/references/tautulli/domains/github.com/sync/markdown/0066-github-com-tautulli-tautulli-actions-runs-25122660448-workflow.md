Bump mako from 1.3.11 to 1.3.12 · Tautulli/Tautulli@e6889a3 · GitHub
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
Bump mako from 1.3.11 to 1.3.12
#2178
[Sign in to view logs](/login?return_to=https://github.com/Tautulli/Tautulli/actions/runs/25122660448/workflow)
* [Sign in to view logs](/login?return_to=https://github.com/Tautulli/Tautulli/actions/runs/25122660448/workflow)
##
Workflow file
#
Bump mako from 1.3.11 to 1.3.12
##
Bump mako from 1.3.11 to 1.3.12 #2178
#### Workflow file for this run
[
.github/workflows/pull-requests.yml
](/Tautulli/Tautulli/blob/e6889a38c3bee5c5c92c05a9f68ade4f63d03c35/.github/workflows/pull-requests.yml) at
[e6889a3](/Tautulli/Tautulli/commit/e6889a38c3bee5c5c92c05a9f68ade4f63d03c35)
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