WebUI: Support push notification · qbittorrent/qBittorrent@0f68a98 · GitHub
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
CI - Ubuntu](/qbittorrent/qBittorrent/actions/workflows/ci_ubuntu.yaml)
#
WebUI: Support push notification
#10260
[Sign in to view logs](/login?return_to=https://github.com/qbittorrent/qBittorrent/actions/runs/25200867836/workflow)
* [Sign in to view logs](/login?return_to=https://github.com/qbittorrent/qBittorrent/actions/runs/25200867836/workflow)
##
Workflow file
#
WebUI: Support push notification
##
WebUI: Support push notification #10260
#### Workflow file for this run
[
.github/workflows/ci\_ubuntu.yaml
](/qbittorrent/qBittorrent/blob/0f68a98758075f1d1ee48a22d71b95ba5134747c/.github/workflows/ci_ubuntu.yaml) at
[0f68a98](/qbittorrent/qBittorrent/commit/0f68a98758075f1d1ee48a22d71b95ba5134747c)
This file contains hidden or bidirectional Unicode text that may be interpreted or compiled differently than what appears below. To review, open the file in an editor that reveals hidden Unicode characters.
[Learn more about bidirectional Unicode characters](https://github.co/hiddenchars)
[ Show hidden characters
](<{{ revealButtonHref }}>)
||name: CI - Ubuntu|
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
||runs-on: ubuntu-latest|
||permissions:|
||actions: write|
||security-events: write|
|||
||strategy:|
||fail-fast: false|
||matrix:|
||libtorrent:|
|| - version: "2.1.0-rc1"|
||boost\_major\_version: "1"|
||boost\_minor\_version: "77"|
||boost\_patch\_version: "0"|
|| - version: "2.0.11"|
||boost\_major\_version: "1"|
||boost\_minor\_version: "77"|
||boost\_patch\_version: "0"|
|| - version: "1.2.20"|
||boost\_major\_version: "1"|
||boost\_minor\_version: "77"|
||boost\_patch\_version: "0"|
||qbt\_gui: ["GUI=ON", "GUI=OFF"]|
||qt\_version: ["6.6.3"]|
|||
||env:|
||boost\_path: "${{ github.workspace }}/../boost"|
||harden\_flags: "-D\_FORTIFY\_SOURCE=3 -D\_GLIBCXX\_ASSERTIONS"|
||libtorrent\_path: "${{ github.workspace }}/../libtorrent"|
|||
||steps:|
|| - name: Checkout repository|
||uses: actions/checkout@v6|
||with:|
||persist-credentials: false|
|||
|| - name: Install dependencies|
||run: ||
|| sudo apt update|
|| sudo apt install \\|
|| build-essential cmake ninja-build \\|
|| libssl-dev zlib1g-dev|
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
||archives: icu qtbase qtdeclarative qtsvg qttools|
||modules: qtimageformats|
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
|| CXXFLAGS="$CXXFLAGS ${{ env.harden\_flags }}" \\|
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
||# to avoid scanning 3rdparty codebases, initialize it just before building qbt|
|| - name: Initialize CodeQL|
||uses: github/codeql-action/init@v4|
||if: startsWith(matrix.libtorrent.version, 2) && (matrix.qbt\_gui == 'GUI=ON')|
||with:|
||config-file: ./.github/workflows/helper/codeql/cpp.yaml|
||languages: cpp|
|||
|| - name: Build qBittorrent|
||run: ||
|| CXXFLAGS="$CXXFLAGS ${{ env.harden\_flags }} -DQT\_FORCE\_ASSERTS -Werror" \\|
|| LDFLAGS="$LDFLAGS -gz" \\|
|| cmake \\|
|| -B build \\|
|| -G "Ninja" \\|
|| -DCMAKE\_BUILD\_TYPE=RelWithDebInfo \\|
|| -DCMAKE\_EXPORT\_COMPILE\_COMMANDS=ON \\|
|| -DBOOST\_ROOT="${{ env.boost\_path }}/lib/cmake" \\|
|| -DCMAKE\_INSTALL\_PREFIX="/usr" \\|
|| -DTESTING=ON \\|
|| -DVERBOSE\_CONFIGURE=ON \\|
|| -D${{ matrix.qbt\_gui }}|
|| cmake --build build --target qbt\_update\_translations|
|| cmake --build build|
|| cmake --build build --target check|
|| if [ "${{ matrix.qbt\_gui }}" = "GUI=ON" ]; then|
|| QT\_QPA\_PLATFORM=offscreen build/qbittorrent -v|
|| else|
|| build/qbittorrent-nox -v|
|| fi|
|| DESTDIR="qbittorrent" cmake --install build|
|||
|| - name: Run CodeQL analysis|
||uses: github/codeql-action/analyze@v4|
||if: startsWith(matrix.libtorrent.version, 2) && (matrix.qbt\_gui == 'GUI=ON')|
||with:|
||category: ${{ github.base\_ref || github.ref\_name }}|
|||
|| - name: Prepare build artifacts|
||run: ||
|| mkdir upload|
|| mkdir upload/cmake|
|| cp build/compile\_commands.json upload/cmake|
|| mkdir upload/cmake/libtorrent|
|| cp ${{ env.libtorrent\_path }}/build/compile\_commands.json upload/cmake/libtorrent|
|||
|| - name: Install AppImage|
||run: ||
|| curl \\|
|| -L \\|
|| -Z \\|
|| -O https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86\_64.AppImage \\|
|| -O https://github.com/linuxdeploy/linuxdeploy-plugin-qt/releases/download/continuous/linuxdeploy-plugin-qt-x86\_64.AppImage \\|
|| -O https://github.com/linuxdeploy/linuxdeploy-plugin-appimage/releases/download/continuous/linuxdeploy-plugin-appimage-x86\_64.AppImage|
|| chmod +x \\|
|| linuxdeploy-x86\_64.AppImage \\|
|| linuxdeploy-plugin-qt-x86\_64.AppImage \\|
|| linuxdeploy-plugin-appimage-x86\_64.AppImage|
|||
|| - name: Prepare files for AppImage|
||if: matrix.qbt\_gui == 'GUI=OFF'|
||run: ||
|| mkdir -p qbittorrent/usr/share/applications|
|| cp .github/workflows/helper/appimage/org.qbittorrent.qBittorrent.desktop qbittorrent/usr/share/applications/org.qbittorrent.qBittorrent.desktop|
|| mkdir -p qbittorrent/usr/share/icons/hicolor/scalable/apps|
|| cp dist/unix/menuicons/scalable/apps/qbittorrent.svg qbittorrent/usr/share/icons/hicolor/scalable/apps/qbittorrent.svg|
|||
|| - name: Package AppImage|
||run: ||
|| rm -f "${{ runner.workspace }}/Qt/${{ matrix.qt\_version }}/gcc\_64/plugins/sqldrivers/libqsqlmimer.so"|
|| ./linuxdeploy-x86\_64.AppImage --appdir qbittorrent --plugin qt|
|| mkdir -p qbittorrent/apprun-hooks|
|| rm -f qbittorrent/apprun-hooks/\*|
|| cp .github/workflows/helper/appimage/export\_vars.sh qbittorrent/apprun-hooks/export\_vars.sh|
|| NO\_APPSTREAM=1 \\|
|| OUTPUT=upload/qbittorrent-CI\_Ubuntu\_x86\_64.AppImage \\|
|| ./linuxdeploy-x86\_64.AppImage --appdir qbittorrent --output appimage|
|||
|| - name: Upload build artifacts|
||uses: actions/upload-artifact@v7|
||with:|
||name: qBittorrent-CI\_Ubuntu-x64\_${{ matrix.qbt\_gui }}\_libtorrent-${{ matrix.libtorrent.version }}\_Qt-${{ matrix.qt\_version }}|
||path: upload|