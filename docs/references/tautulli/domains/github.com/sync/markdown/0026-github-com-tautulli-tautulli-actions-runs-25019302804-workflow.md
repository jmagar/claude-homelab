Bump cryptography from 46.0.7 to 47.0.0 · Tautulli/Tautulli@0a22b38 · GitHub
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
CodeQL](/Tautulli/Tautulli/actions/workflows/codeql.yml)
#
Bump cryptography from 46.0.7 to 47.0.0
#1022
[Sign in to view logs](/login?return_to=https://github.com/Tautulli/Tautulli/actions/runs/25019302804/workflow)
* [Sign in to view logs](/login?return_to=https://github.com/Tautulli/Tautulli/actions/runs/25019302804/workflow)
##
Workflow file
#
Bump cryptography from 46.0.7 to 47.0.0
##
Bump cryptography from 46.0.7 to 47.0.0 #1022
#### Workflow file for this run
[
.github/workflows/codeql.yml
](/Tautulli/Tautulli/blob/0a22b380bbf1b326b5a7f7b2a9967c4d2bcf8cae/.github/workflows/codeql.yml) at
[0a22b38](/Tautulli/Tautulli/commit/0a22b380bbf1b326b5a7f7b2a9967c4d2bcf8cae)
[
](/Tautulli/Tautulli/edit/dependabot/pip/nightly/cryptography-47.0.0/.github/workflows/codeql.yml)
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
||name: CodeQL|
|||
||on:|
||push:|
||branches: [nightly]|
||pull\_request:|
||branches: [nightly]|
||schedule:|
|| - cron: '05 10 \* \* 1'|
|||
||jobs:|
||codeql-analysis:|
||name: CodeQL Analysis|
||runs-on: ubuntu-latest|
||permissions:|
||actions: read|
||contents: read|
||security-events: write|
|||
||strategy:|
||fail-fast: false|
||matrix:|
||language: ['javascript', 'python']|
|||
||steps:|
|| - name: Checkout Code|
||uses: actions/checkout@v6|
|||
|| - name: Initialize CodeQL|
||uses: github/codeql-action/init@v4|
||with:|
||config-file: ./.github/codeql-config.yml|
||languages: ${{ matrix.language }}|
|||
|| - name: Perform CodeQL Analysis|
||uses: github/codeql-action/analyze@v4|
||with:|
||category: "/language:${{matrix.language}}"|