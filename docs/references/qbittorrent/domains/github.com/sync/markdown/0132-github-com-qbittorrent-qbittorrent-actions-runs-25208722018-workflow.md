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
CI - macOS](/qbittorrent/qBittorrent/actions/workflows/ci_macos.yaml)
#
WebUI: Allow to download completed files
#10262
[Sign in to view logs](/login?return_to=https://github.com/qbittorrent/qBittorrent/actions/runs/25208722018/workflow)
* [Sign in to view logs](/login?return_to=https://github.com/qbittorrent/qBittorrent/actions/runs/25208722018/workflow)
##
Workflow file
#
WebUI: Allow to download completed files
##
WebUI: Allow to download completed files #10262
#### Workflow file for this run
[
.github/workflows/ci\_macos.yaml
](/qbittorrent/qBittorrent/blob/b76a028f7e11b85ddc947f559f2a52693e552d4b/.github/workflows/ci_macos.yaml) at
[b76a028](/qbittorrent/qBittorrent/commit/b76a028f7e11b85ddc947f559f2a52693e552d4b)
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
||name: CI - macOS|
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
||name: Build|
||runs-on: macos-latest|
||permissions:|
||actions: write|
|||
||strategy:|
||fail-fast: false|
||matrix:|
||libtorrent:|
|| - version: "2.1.0-rc1"|
||boost\_major\_version: "1"|
||boost\_minor\_version: "90"|
||boost\_patch\_version: "0"|
|| - version: "2.0.11"|
||boost\_major\_version: "1"|
||boost\_minor\_version: "90"|
||boost\_patch\_version: "0"|
|| - version: "1.2.20"|
||boost\_major\_version: "1"|
||boost\_minor\_version: "86"|
||boost\_patch\_version: "0"|
||qbt\_gui: ["GUI=ON", "GUI=OFF"]|
||qt\_version: ["6.10.1"]|
|||
||env:|
||boost\_path: "${{ github.workspace }}/../boost"|
||libtorrent\_path: "${{ github.workspace }}/../libtorrent"|
|||
||steps:|
|| - name: Checkout repository|
||uses: actions/checkout@v6|
||with:|
||persist-credentials: false|
|||
|| - name: Install dependencies|
||uses: Wandalen/wretry.action@v3|
||env:|
||HOMEBREW\_NO\_INSTALLED\_DEPENDENTS\_CHECK: 1|
||HOMEBREW\_NO\_INSTALL\_CLEANUP: 1|
||with:|
||attempt\_delay: 20000|
||attempt\_limit: 6|
||command: ||
|| brew update \> /dev/null|
|| brew install \\|
|| openssl@3 zlib|
|| # preinstalled on the image: cmake ninja|
|||
|| - name: Setup ccache|
||uses: Chocobo1/setup-ccache-action@v1|
||with:|
||store\_cache: ${{ (github.repository != 'qbittorrent/qBittorrent') || (github.ref == 'refs/heads/master') }}|
||update\_packager\_index: false|
||ccache\_options: ||
|| max\_size=1G|
|||
|| - name: Install boost|
||run: ||
|| boost\_url="https://archives.boost.io/release/${{ matrix.libtorrent.boost\_major\_version }}.${{ matrix.libtorrent.boost\_minor\_version }}.${{ matrix.libtorrent.boost\_patch\_version }}/source/boost\_${{ matrix.libtorrent.boost\_major\_version }}\_${{ matrix.libtorrent.boost\_minor\_version }}\_${{ matrix.libtorrent.boost\_patch\_version }}.tar.gz"|
|| boost\_url2="https://sourceforge.net/projects/boost/files/boost/${{ matrix.libtorrent.boost\_major\_version }}.${{ matrix.libtorrent.boost\_minor\_version }}.${{ matrix.libtorrent.boost\_patch\_version }}/boost\_${{ matrix.libtorrent.boost\_major\_version }}\_${{ matrix.libtorrent.boost\_minor\_version }}\_${{ matrix.libtorrent.boost\_patch\_version }}.tar.gz"|
|| set +e|
|| curl -L -o "${{ runner.temp }}/boost.tar.gz" "$boost\_url"|
|| tar -xf "${{ runner.temp }}/boost.tar.gz" -C "${{ github.workspace }}/.."; \_exitCode="$?"|
|| if [ "$\_exitCode" -ne "0" ]; then|
|| curl -L -o "${{ runner.temp }}/boost.tar.gz" "$boost\_url2"|
|| tar -xf "${{ runner.temp }}/boost.tar.gz" -C "${{ github.workspace }}/.."; \_exitCode="$?"|
|| fi|
|| mv "${{ github.workspace }}/.."/boost\_\* "${{ env.boost\_path }}"|
|| cd "${{ env.boost\_path }}"|
|| ./bootstrap.sh|
|| ./b2 stage --stagedir=./ --with-headers|
|||
|| - name: Install Qt|
||uses: jurplel/install-qt-action@v4|
||with:|
||version: ${{ matrix.qt\_version }}|
||archives: qtbase qtdeclarative qtsvg qttools|
||modules: qtimageformats|
||# Not sure why Qt made a hard dependency on qtdeclarative, try removing it when Qt \> 6.4.0|
||cache: true|
|||
|| - name: Install libtorrent|
||run: ||
|| git clone \\|
|| --branch v${{ matrix.libtorrent.version }} \\|
|| --depth 1 \\|
|| --recurse-submodules \\|
|| https://github.com/arvidn/libtorrent.git \\|
|| ${{ env.libtorrent\_path }}|
|| cd ${{ env.libtorrent\_path }}|
|| cmake \\|
|| -B build \\|
|| -G "Ninja" \\|
|| -DBUILD\_SHARED\_LIBS=OFF \\|
|| -DCMAKE\_BUILD\_TYPE=RelWithDebInfo \\|
|| -DCMAKE\_CXX\_STANDARD=20 \\|
|| -DCMAKE\_EXPORT\_COMPILE\_COMMANDS=ON \\|
|| -DBOOST\_ROOT="${{ env.boost\_path }}/lib/cmake" \\|
|| -Ddeprecated-functions=OFF|
|| cmake --build build|
|| sudo cmake --install build|
|||
|| - name: Build qBittorrent|
||run: ||
|| CXXFLAGS="$CXXFLAGS -DQT\_FORCE\_ASSERTS -Werror -Wno-error=deprecated-declarations" \\|
|| LDFLAGS="$LDFLAGS -gz" \\|
|| cmake \\|
|| -B build \\|
|| -G "Ninja" \\|
|| -DCMAKE\_BUILD\_TYPE=RelWithDebInfo \\|
|| -DCMAKE\_EXPORT\_COMPILE\_COMMANDS=ON \\|
|| -DBOOST\_ROOT="${{ env.boost\_path }}/lib/cmake" \\|
|| -DTESTING=ON \\|
|| -DVERBOSE\_CONFIGURE=ON \\|
|| -D${{ matrix.qbt\_gui }}|
|| cmake --build build --target qbt\_update\_translations|
|| cmake --build build|
|| cmake --build build --target check|
|| if [ "${{ matrix.qbt\_gui }}" = "GUI=ON" ]; then|
|| build/qbittorrent.app/Contents/MacOS/qbittorrent -v|
|| else|
|| build/qbittorrent-nox.app/Contents/MacOS/qbittorrent-nox -v|
|| fi|
|||
|| - name: Prepare build artifacts|
||run: ||
|| appName="qbittorrent"|
|| if [ "${{ matrix.qbt\_gui }}" = "GUI=OFF" ]; then|
|| appName="qbittorrent-nox"|
|| fi|
|| pushd build|
|| # packaging|
|| macdeployqt "$appName.app" -no-strip|
|| # code signing|
|| xattr -cr "$appName.app"|
|| codesign --force --sign - \\|
|| "$appName.app" \\|
|| "$appName.app/Contents/Frameworks"/\* \\|
|| "$appName.app/Contents/MacOS/$appName"|
|| codesign --verify --deep --strict -v "$appName.app"|
|| # create .dmg|
|| PACKAGE\_RETRY=0|
|| while [ "$PACKAGE\_RETRY" -lt "3" ]; do|
|| if hdiutil create -fs HFS+ -srcfolder "$appName.app" -volname "$appName" "$appName.dmg"; then|
|| break|
|| fi|
|| sleep 5|
|| PACKAGE\_RETRY=$((PACKAGE\_RETRY + 1))|
|| echo "Retry $PACKAGE\_RETRY..."|
|| done|
|| popd|
|| # prepare upload folder|
|| mkdir upload|
|| cp "build/$appName.dmg" upload|
|| mkdir upload/cmake|
|| cp build/compile\_commands.json upload/cmake|
|| mkdir upload/cmake/libtorrent|
|| cp ${{ env.libtorrent\_path }}/build/compile\_commands.json upload/cmake/libtorrent|
|||
|| - name: Upload build artifacts|
||uses: actions/upload-artifact@v7|
||with:|
||name: qBittorrent-CI\_macOS\_${{ matrix.qbt\_gui }}\_libtorrent-${{ matrix.libtorrent.version }}\_Qt-${{ matrix.qt\_version }}|
||path: upload|