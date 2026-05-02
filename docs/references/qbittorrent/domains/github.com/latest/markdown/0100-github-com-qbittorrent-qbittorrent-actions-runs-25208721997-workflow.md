WebUI: Add option to download completed file · qbittorrent/qBittorrent@b76a028 · GitHub
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
[
CI - Python](/qbittorrent/qBittorrent/actions/workflows/ci_python.yaml)
#
WebUI: Allow to download completed files
#4746
[Sign in to view logs](/login?return_to=https://github.com/qbittorrent/qBittorrent/actions/runs/25208721997/workflow)
* [Sign in to view logs](/login?return_to=https://github.com/qbittorrent/qBittorrent/actions/runs/25208721997/workflow)
##
Workflow file
#
WebUI: Allow to download completed files
##
WebUI: Allow to download completed files #4746
#### Workflow file for this run
[
.github/workflows/ci\_python.yaml
](/qbittorrent/qBittorrent/blob/b76a028f7e11b85ddc947f559f2a52693e552d4b/.github/workflows/ci_python.yaml) at
[b76a028](/qbittorrent/qBittorrent/commit/b76a028f7e11b85ddc947f559f2a52693e552d4b)
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
||name: CI - Python|
|||
||on: [pull\_request, push]|
|||
||permissions: {}|
|||
||concurrency:|
||group: ${{ github.workflow }}-${{ github.head\_ref || github.run\_id }}|
||cancel-in-progress: ${{ github.head\_ref != '' }}|
|||
||jobs:|
||ci:|
||name: Check|
||runs-on: ubuntu-latest|
|||
||steps:|
|| - name: Checkout repository|
||uses: actions/checkout@v6|
||with:|
||persist-credentials: false|
|||
|| - name: Setup python (auxiliary scripts)|
||uses: actions/setup-python@v6|
||with:|
||python-version: '3'# use default version|
|||
|| - name: Install tools (auxiliary scripts)|
||run: pip install bandit isort pycodestyle pyflakes|
|||
|| - name: Gather files (auxiliary scripts)|
||run: ||
|| export "PY\_FILES=$(find . -type f -name '\*.py' ! -path '\*searchengine\*' -printf '%p ')"|
|| echo $PY\_FILES|
|| echo "PY\_FILES=$PY\_FILES" \>\> "$GITHUB\_ENV"|
|||
|| - name: Lint code (auxiliary scripts)|
||run: ||
|| pyflakes $PY\_FILES|
|| bandit --skip B101,B314,B405 $PY\_FILES|
|||
|| - name: Format code (auxiliary scripts)|
||run: ||
|| pycodestyle \\|
|| --max-line-length=1000 \\|
|| --statistics \\|
|| $PY\_FILES|
|| isort \\|
|| --check \\|
|| --diff \\|
|| $PY\_FILES|
|||
|| - name: Build code (auxiliary scripts)|
||run: ||
|| python -m compileall $PY\_FILES|
|||
|| - name: Setup python (search engine)|
||uses: actions/setup-python@v6|
||with:|
||python-version: '3.9'|
|||
|| - name: Install tools (search engine)|
||working-directory: src/searchengine/nova3|
||run: ||
|| pip install uv|
|| uv sync|
|||
|| - name: Check typings (search engine)|
||working-directory: src/searchengine/nova3|
||run: uv run just check|
|||
|| - name: Lint code (search engine)|
||working-directory: src/searchengine/nova3|
||run: uv run just lint|
|||
|| - name: Format code (search engine)|
||working-directory: src/searchengine/nova3|
||run: ||
|| uv run just format|
|| git diff --exit-code|
|||
|| - name: Build code (search engine)|
||working-directory: src/searchengine/nova3|
||run: uv run just build|