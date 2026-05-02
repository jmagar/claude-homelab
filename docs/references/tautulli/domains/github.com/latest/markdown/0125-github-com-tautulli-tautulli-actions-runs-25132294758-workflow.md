Bump mako==1.3.12 · Tautulli/Tautulli@c358e5c · GitHub
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
Bump mako from 1.3.11 to 1.3.12
#1026
[Sign in to view logs](/login?return_to=https://github.com/Tautulli/Tautulli/actions/runs/25132294758/workflow)
* [Sign in to view logs](/login?return_to=https://github.com/Tautulli/Tautulli/actions/runs/25132294758/workflow)
##
Workflow file
#
Bump mako from 1.3.11 to 1.3.12
##
Bump mako from 1.3.11 to 1.3.12 #1026
#### Workflow file for this run
[
.github/workflows/codeql.yml
](/Tautulli/Tautulli/blob/c358e5c37c905f651e8f7328b1648fcbe1393fd1/.github/workflows/codeql.yml) at
[c358e5c](/Tautulli/Tautulli/commit/c358e5c37c905f651e8f7328b1648fcbe1393fd1)
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