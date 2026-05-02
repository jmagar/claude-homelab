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
Publish Installers](/Tautulli/Tautulli/actions/workflows/publish-installers.yml)
#
Add log message setup wizard not completed
#703
[Sign in to view logs](/login?return_to=https://github.com/Tautulli/Tautulli/actions/runs/25021809817/workflow)
* [Sign in to view logs](/login?return_to=https://github.com/Tautulli/Tautulli/actions/runs/25021809817/workflow)
##
Workflow file
#
Add log message setup wizard not completed
##
Add log message setup wizard not completed #703
#### Workflow file for this run
[
.github/workflows/publish-installers.yml
](/Tautulli/Tautulli/blob/822fc5c9b7ecd7878327fdb25d985cc9ff1bca2a/.github/workflows/publish-installers.yml) at
[822fc5c](/Tautulli/Tautulli/commit/822fc5c9b7ecd7878327fdb25d985cc9ff1bca2a)
[
](/Tautulli/Tautulli/edit/nightly/.github/workflows/publish-installers.yml)
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
||name: Publish Installers|
|||
||on:|
||workflow\_dispatch: \~|
||push:|
||branches: [master, beta, nightly]|
||tags: [v\*]|
|||
||env:|
||PYTHON\_VERSION: '3.13'|
|||
||jobs:|
||build-installer:|
||name: Build ${{ matrix.os\_upper }} Installer|
||runs-on: ${{ matrix.os }}-${{ matrix.os\_version }}|
||if: ${{ !contains(github.event.head\_commit.message, '[skip ci]') }}|
||strategy:|
||fail-fast: false|
||matrix:|
||include:|
|| - os: 'windows'|
||os\_upper: 'Windows'|
||os\_version: 'latest'|
||arch: 'x64'|
||ext: 'exe'|
|| - os: 'macos'|
||os\_upper: 'MacOS'|
||os\_version: '14'|
||arch: 'universal'|
||ext: 'pkg'|
|||
||steps:|
|| - name: Checkout Code|
||uses: actions/checkout@v6|
|||
|| - name: Set Release Version|
||id: get\_version|
||shell: bash|
||run: ||
|| if [[ $GITHUB\_REF == refs/tags/\* ]]; then|
|| echo "VERSION=${GITHUB\_REF#refs/tags/v}" \>\> $GITHUB\_ENV|
|| VERSION\_NSIS=${GITHUB\_REF#refs/tags/v}.1|
|| echo "VERSION\_NSIS=${VERSION\_NSIS/%-beta.1/.0}" \>\> $GITHUB\_OUTPUT|
|| echo "VERSION=${GITHUB\_REF#refs/tags/v}" \>\> $GITHUB\_OUTPUT|
|| echo "RELEASE\_VERSION=${GITHUB\_REF#refs/tags/}" \>\> $GITHUB\_OUTPUT|
|| else|
|| echo "VERSION=0.0.0" \>\> $GITHUB\_ENV|
|| echo "VERSION\_NSIS=0.0.0.0" \>\> $GITHUB\_OUTPUT|
|| echo "VERSION=0.0.0" \>\> $GITHUB\_OUTPUT|
|| echo "RELEASE\_VERSION=${GITHUB\_SHA::7}" \>\> $GITHUB\_OUTPUT|
|| fi|
|| if [[ $GITHUB\_REF == refs/tags/\*-beta ]]; then|
|| echo "beta" \> branch.txt|
|| elif [[ $GITHUB\_REF == refs/tags/\* ]]; then|
|| echo "master" \> branch.txt|
|| else|
|| echo ${GITHUB\_REF#refs/heads/} \> branch.txt|
|| fi|
|| echo $GITHUB\_SHA \> version.txt|
|||
|| - name: Set Up Python|
||uses: actions/setup-python@v6|
||with:|
||python-version: ${{ env.PYTHON\_VERSION }}|
||cache: pip|
||cache-dependency-path: '\*\*/requirements\*.txt'|
|||
|| - name: Install Dependencies|
||run: ||
|| python -m pip install --upgrade pip|
|| pip install -r package/requirements-package.txt --no-binary cffi|
|||
|| - name: Build Package|
||run: ||
|| pyinstaller -y ./package/Tautulli-${{ matrix.os }}.spec|
|||
|| - name: Install makensis (choco)|
||if: matrix.os == 'windows'|
||run: choco install nsis|
|||
|| - name: Create Windows Installer|
||uses: joncloud/makensis-action@v5.0|
||if: matrix.os == 'windows'|
||with:|
||script-file: ./package/Tautulli.nsi|
||arguments: \>|
|| /DVERSION=${{ steps.get\_version.outputs.VERSION\_NSIS }}|
|| /DINSTALLER\_NAME=..\\Tautulli-${{ matrix.os }}-${{ steps.get\_version.outputs.RELEASE\_VERSION }}-${{ matrix.arch }}.${{ matrix.ext }}|
||additional-plugin-paths: package/nsis-plugins|
|||
|| - name: Create MacOS Installer|
||if: matrix.os == 'macos'|
||run: ||
|| sudo pkgbuild \\|
|| --install-location /Applications \\|
|| --version ${{ steps.get\_version.outputs.VERSION }} \\|
|| --component ./dist/Tautulli.app \\|
|| --scripts ./package/macos-scripts \\|
|| Tautulli-${{ matrix.os }}-${{ steps.get\_version.outputs.RELEASE\_VERSION }}-${{ matrix.arch }}.${{ matrix.ext }}|
|||
|| - name: Upload Installer|
||uses: actions/upload-artifact@v7|
||with:|
||name: Tautulli-${{ matrix.os }}-installer|
||path: Tautulli-${{ matrix.os }}-${{ steps.get\_version.outputs.RELEASE\_VERSION }}-${{ matrix.arch }}.${{ matrix.ext }}|
|||
||virus-total:|
||name: VirusTotal Scan|
||needs: build-installer|
||if: needs.build-installer.result == 'success' && !contains(github.event.head\_commit.message, '[skip ci]')|
||runs-on: ubuntu-latest|
||steps:|
|| - name: Download Installers|
||if: needs.build-installer.result == 'success'|
||uses: actions/download-artifact@v8|
|||
|| - name: Upload to VirusTotal|
||uses: crazy-max/ghaction-virustotal@v5|
||with:|
||vt\_api\_key: ${{ secrets.VT\_API\_KEY }}|
||files: ||
|| Tautulli-windows-installer/Tautulli-windows-\*-x64.exe|
|| Tautulli-macos-installer/Tautulli-macos-\*-universal.pkg|
|||
||release:|
||name: Release Installers|
||needs: build-installer|
||if: always() && startsWith(github.ref, 'refs/tags/') && !contains(github.event.head\_commit.message, '[skip ci]')|
||runs-on: ubuntu-latest|
||steps:|
|| - name: Checkout Code|
||uses: actions/checkout@v6|
|||
|| - name: Set Release Version|
||id: get\_version|
||run: ||
|| echo "RELEASE\_VERSION=${GITHUB\_REF#refs/tags/}" \>\> $GITHUB\_OUTPUT|
|||
|| - name: Download Installers|
||if: needs.build-installer.result == 'success'|
||uses: actions/download-artifact@v8|
|||
|| - name: Get Changelog|
||id: get\_changelog|
||run: ||
|| CHANGELOG="$( sed -n '/^## /{p; :loop n; p; /^## /q; b loop}' CHANGELOG.md \\|
|| | sed '$d' | sed '$d' | sed '$d' )"|
|| EOF=$(dd if=/dev/urandom bs=15 count=1 status=none | base64)|
|| echo "CHANGELOG\<\<$EOF" \>\> $GITHUB\_OUTPUT|
|| echo "$CHANGELOG" \>\> $GITHUB\_OUTPUT|
|| echo "$EOF" \>\> $GITHUB\_OUTPUT|
|||
|| - name: Create Release|
||uses: softprops/action-gh-release@v3|
||id: create\_release|
||with:|
||token: ${{ secrets.GHACTIONS\_TOKEN }}|
||tag\_name: ${{ steps.get\_version.outputs.RELEASE\_VERSION }}|
||name: Tautulli ${{ steps.get\_version.outputs.RELEASE\_VERSION }}|
||body: ||
|| ## Changelog|
|||
|| ##${{ steps.get\_changelog.outputs.CHANGELOG }}|
||prerelease: ${{ endsWith(steps.get\_version.outputs.RELEASE\_VERSION, '-beta') }}|
||files: ||
|| Tautulli-windows-installer/Tautulli-windows-${{ steps.get\_version.outputs.RELEASE\_VERSION }}-x64.exe|
|| Tautulli-macos-installer/Tautulli-macos-${{ steps.get\_version.outputs.RELEASE\_VERSION }}-universal.pkg|
|||
||discord:|
||name: Discord Notification|
||needs: [build-installer, release]|
||if: always() && !contains(github.event.head\_commit.message, '[skip ci]')|
||runs-on: ubuntu-latest|
||steps:|
|| - name: Post Status to Discord|
||uses: sarisia/actions-status-discord@v1|
||with:|
||webhook: ${{ secrets.DISCORD\_WEBHOOK }}|
||status: ${{ needs.build-installer.result == 'success' && 'success' || contains(needs.\*.result, 'failure') && 'failure' || 'cancelled' }}|
||title: ${{ github.workflow }}|
||nofail: true|