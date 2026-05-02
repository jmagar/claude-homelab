Add log message setup wizard not completed · Tautulli/Tautulli@822fc5c · GitHub
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
Publish Snap](/Tautulli/Tautulli/actions/workflows/publish-snap.yml)
#
Add log message setup wizard not completed
#645
[Sign in to view logs](/login?return_to=https://github.com/Tautulli/Tautulli/actions/runs/25021809821/workflow)
* [Sign in to view logs](/login?return_to=https://github.com/Tautulli/Tautulli/actions/runs/25021809821/workflow)
##
Workflow file
#
Add log message setup wizard not completed
##
Add log message setup wizard not completed #645
#### Workflow file for this run
[
.github/workflows/publish-snap.yml
](/Tautulli/Tautulli/blob/822fc5c9b7ecd7878327fdb25d985cc9ff1bca2a/.github/workflows/publish-snap.yml) at
[822fc5c](/Tautulli/Tautulli/commit/822fc5c9b7ecd7878327fdb25d985cc9ff1bca2a)
[
](/Tautulli/Tautulli/edit/nightly/.github/workflows/publish-snap.yml)
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
||name: Publish Snap|
|||
||on:|
||workflow\_dispatch: \~|
||push:|
||branches: [master, beta, nightly]|
||tags: [v\*]|
|||
||jobs:|
||build-snap:|
||name: Build Snap Package (${{ matrix.architecture }})|
||runs-on: ubuntu-latest|
||if: ${{ !contains(github.event.head\_commit.message, '[skip ci]') }}|
||strategy:|
||fail-fast: false|
||matrix:|
||architecture:|
|| - amd64|
|| - arm64|
|| - armhf|
||steps:|
|| - name: Checkout Code|
||uses: actions/checkout@v6|
|||
|| - name: Prepare|
||id: prepare|
||run: ||
|| git fetch --prune --unshallow --tags|
|| if [[ $GITHUB\_REF == refs/tags/\*-beta || $GITHUB\_REF == refs/heads/beta ]]; then|
|| echo "RELEASE=beta" \>\> $GITHUB\_OUTPUT|
|| elif [[ $GITHUB\_REF == refs/tags/\* || $GITHUB\_REF == refs/heads/master ]]; then|
|| echo "RELEASE=stable" \>\> $GITHUB\_OUTPUT|
|| else|
|| echo "RELEASE=edge" \>\> $GITHUB\_OUTPUT|
|| fi|
|||
|| - name: Set Up QEMU|
||uses: docker/setup-qemu-action@v4|
|||
|| - name: Build Snap Package|
||uses: canonical/snapcraft-multiarch-action@v1|
||id: build|
||with:|
||architecture: ${{ matrix.architecture }}|
|||
|| - name: Upload Snap Package|
||uses: actions/upload-artifact@v7|
||with:|
||name: Tautulli-snap-package-${{ matrix.architecture }}|
||path: ${{ steps.build.outputs.snap }}|
|||
|| - name: Review Snap Package|
||uses: diddlesnaps/snapcraft-review-tools-action@master|
||with:|
||snap: ${{ steps.build.outputs.snap }}|
|||
|| - name: Publish Snap Package|
||uses: snapcore/action-publish@v1|
||if: startsWith(github.ref, 'refs/tags/') || github.ref == 'refs/heads/nightly'|
||env:|
||SNAPCRAFT\_STORE\_CREDENTIALS: ${{ secrets.SNAP\_LOGIN }}|
||with:|
||snap: ${{ steps.build.outputs.snap }}|
||release: ${{ steps.prepare.outputs.RELEASE }}|
|||
||discord:|
||name: Discord Notification|
||needs: build-snap|
||if: always() && !contains(github.event.head\_commit.message, '[skip ci]')|
||runs-on: ubuntu-latest|
||steps:|
|| - name: Post Status to Discord|
||uses: sarisia/actions-status-discord@v1|
||with:|
||webhook: ${{ secrets.DISCORD\_WEBHOOK }}|
||status: ${{ needs.build-snap.result == 'success' && 'success' || contains(needs.\*.result, 'failure') && 'failure' || 'cancelled' }}|
||title: ${{ github.workflow }}|
||nofail: true|