Compilation MSVC 2013 (x86\_64) (dynamic linkage) · qbittorrent/qBittorrent Wiki · GitHub
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
# Compilation MSVC 2013 (x86\_64) (dynamic linkage)
[Jump to bottom](#wiki-pages-box)
Chocobo1 edited this page May 1, 2024
&middot;
[3 revisions](/qbittorrent/qBittorrent/wiki/Compilation-MSVC-2013-(x86_64)-(dynamic-linkage)/_history)
This page describes the process of building qBittorrent on Windows targeting x86\_64 (aka x64 aka AMD64 aka 64-bit) architecture. Building for x86\_64 arch is only supported by Visual Studio Professional or better, Express edition won't do.
>
> Note: Even though this article tries to be as full as possible, it is not recommended for users without basic knowledge in programming and windows shell scripting.
>
> Final note: Resulting binary will not support Windows XP 64-bit Edition and Windows Server 2003 64-bit Edition unless you follow special notes describing how to make it compatible with those systems.
>
# Table of Contents
[](#table-of-contents)
1. [Software Requirements](#software-requirements)
2. [Source Requirements](#source-requirements)
3. [Preparing Directory Structure](#preparing-directory-structure)
4. [Build Zlib](#build-zlib)
5. [Build OpenSSL](#build-openssl)
6. [Build Boost](#build-boost)
7. [Build libtorrent](#build-libtorrent)
8. [Build Qt](#build-qt)
9. [Build qBittorrent](#build-qbittorrent)
10. [Using resulting binaries on different computers](#using-resulting-binaries-on-different-computers)
# Software Requirements
[](#software-requirements)
1. At least Windows 7 SP1 64-bit
2. At least Visual Studio 2013 Professional Edition.
3. Perl. [ActiveState Perl x86](http://www.activestate.com/activeperl/downloads) is known to work.
4. Latest version of [NASM assembler](http://www.nasm.us/).
# Source Requirements
[](#source-requirements)
1. Latest version of [Zlib](http://zlib.net/).
* [1.2.8](http://zlib.net/zlib-1.2.8.tar.gz) is used in this article.
* Latest version of [OpenSSL](https://www.openssl.org/source/). Be sure to download the one ***without*** fips in the name.
* [1.0.1i](https://www.openssl.org/source/openssl-1.0.1i.tar.gz) is used in this article.
* Latest version of [Qt](https://qt-project.org/downloads). Look for `The source code is also available as a single zip` on download page. This is what you need, not the prebuilt binaries.
>
> Note: Qt5 is currently not supported by qBittorrent.
>
* [4.8.6](http://download.qt-project.org/archive/qt/4.8/4.8.6/qt-everywhere-opensource-src-4.8.6.zip) is used in this article.
* Latest version of [Boost](http://www.boost.org/users/download/).
* [1.56](http://sourceforge.net/projects/boost/files/boost/1.56.0/boost_1_56_0.7z/download) is used in this article.
* Latest version of [libtorrent-rasterbar](http://sourceforge.net/projects/libtorrent/files/libtorrent/).
* [0.16.17](http://sourceforge.net/projects/libtorrent/files/libtorrent/libtorrent-rasterbar-0.16.17.tar.gz/download) is used in this article.
* Latest version of [qBittorrent](http://sourceforge.net/projects/qbittorrent/files/qbittorrent) or you can [Download Master Branch from GitHub](https://github.com/qbittorrent/qBittorrent/archive/master.zip).
* [3.1.9.2](http://sourceforge.net/projects/qbittorrent/files/qbittorrent/qbittorrent-3.1.9.2/qbittorrent-3.1.9.2.tar.gz/download) is used in this article.
* Maxmind [GeoIP Database](http://dev.maxmind.com/geoip/legacy/geolite/).
# Preparing Directory Structure
[](#preparing-directory-structure)
1. First of all you will need a working directory structure for source code and compiled binaries. Create something like that:
```
` C:\\work
\\sources
\\install
`
```
2. In this article I'm using a drive as a working directory, so I have something like that:
```
` T:
\\sources
\\install
`
```
>
> This directory structure will be used as an example.
>
# Build Zlib
[](#build-zlib)
1. Unpack Zlib into `\\sources\\zlib\\`.
2. Open `VS2013 x64 Native Tools Command Prompt` usually found in `Start-\>All Programs-\>Visual Studio 2013-\>Visual Studio Tools`
3. Navigate to Zlib source folder.
4. Edit `.\\win32\\Makefile.msc` and do the following changes:
* Find the line starting with `AS` and on that line:
* Replace `ml` **with** `ml64`
* Find the line starting with `ASFLAGS` and on that line:
* Replace `-coff -Zi $(LOC)` **with** `$(LOC)`
* Find the line starting with `CFLAGS` and on that line:
* Replace `-nologo -MD -W3 -O2 -Oy- -Zi -Fd"zlib" $(LOC)` **with** `-nologo -MD -O2 -w -favor:blend -GL -GR- -Y- -MP -EHs-c- $(LOC)`
* Find the line starting with `LDFLAGS` and on that line:
* Replace `-nologo -debug -incremental:no -opt:ref` **with** `-nologo -incremental:no -opt:ref -opt:icf=5 -ltcg`
* Find the line starting with `ARFLAGS` and on that line:
* Replace `-nologo` **with** `-nologo -ltcg`
* Build Zlib:
```
` nmake -f .\\win32\\Makefile.msc AS=ml64 LOC="-DASMV -DASMINF -DNDEBUG -I." OBJA="inffasx64.obj gvmat64.obj inffas8664.obj"
nmake -f .\\win32\\Makefile.msc test
`
```
>
> Last command will run a short test to make sure that Zlib is working.
>
* Install Zlib into `\\install\\zlib` folder:
>
> Technical note: because Makefile does not provide an install target, we need to do it ourselves.
>
```
` IF EXIST T:\\install\\zlib RD /S /Q T:\\install\\zlib
MD T:\\install\\zlib
FOR %X IN (bin lib include) DO (
MD T:\\install\\zlib\\%X
)
XCOPY /Y /Q /I .\\\*.dll T:\\install\\zlib\\bin\\
XCOPY /Y /Q /I .\\\*.lib T:\\install\\zlib\\lib\\
XCOPY /Y /Q /I .\\zconf.h T:\\install\\zlib\\include\\
XCOPY /Y /Q /I .\\zlib.h T:\\install\\zlib\\include\\
`
```
# Build OpenSSL
[](#build-openssl)
1. Unpack OpenSSL into `\\sources\\openssl\\`.
2. Install Perl if you haven't. In this article Perl is installed in `T:\\Perl`.
>
> It is recommended to install both perl and NASM to directory structure without spaces.
>
3. Open `VS2013 x64 Native Tools Command Prompt`.
4. Navigate to OpenSSL source folder.
5. If you still haven't installed NASM, now is the best time. In this article NASM is installed in `T:\\NASM`.
6. Adjust `PATH` variable:
```
` SET "PATH=T:\\NASM;%PATH%"
`
```
7. Configure OpenSSL:
```
` perl Configure VC-WIN64A threads shared zlib -IT:\\install\\zlib\\include -LT:\\install\\zlib\\lib --prefix=T:\\install\\openssl
.\\ms\\do\_win64a.bat
`
```
8. Edit `.\\ms\\ntdll.mak` and do the following changes:
* Find the line starting with `CFLAG=` and on that line:
* Replace `/Ox` **with** `/O2 /favor:blend /GL /Y-`
* Find the line starting with `LFLAGS=`
* Replace `/debug` **with** `/OPT:ICF=5 /LTCG`
* Find the line starting with `MLFLAGS=`
* Replace `/debug` **with** `/OPT:ICF=5 /LTCG`
* Find the line starting with `ASM=`
* Remove `-g` from that line
* Find the line containing `zlib1.lib $(EX\_LIBS)`
* Replace `zlib1.lib` **with** `zlib.lib` in line
* Build OpenSSL:
```
` nmake -f .\\ms\\ntdll.mak
`
```
* ***Optional***. Test OpenSSL:
```
` nmake -f .\\ms\\ntdll.mak test
`
```
Somewhere near the end of test you should see:
```
` Available compression methods:
1: zlib compression
`
```
And in the very end you should see `passed all tests`.
* Install OpenSSL:
```
` nmake -f .\\ms\\ntdll.mak install
`
```
# Build Boost
[](#build-boost)
1. Unpack Boost into `\\sources\\boost\\`.
2. Open `VS2013 x64 Native Tools Command Prompt`.
3. Navigate to Boost source folder.
4. Build and install bjam (aka Boost-Build):
```
` CD .\\tools\\build
.\\bootstrap.bat vc12
.\\b2.exe --toolset=msvc architecture=x86 address-model=64 --prefix=T:\\install\\bjam link=shared runtime-link=shared variant=release debug-symbols=off warnings=off warnings-as-errors=off inlining=full optimization=speed "cflags=/O2 /GL /Gy /favor:blend" "linkflags=/NOLOGO /OPT:REF /OPT:ICF=5 /LTCG" install
CD ..\\..\\
`
```
5. Build and install Boost:
```
` SET "PATH=T:\\install\\bjam\\bin;%PATH%"
bjam -j2 -q --with-system --toolset=msvc --layout=system --prefix=T:\\install\\boost link=shared runtime-link=shared variant=release debug-symbols=off threading=multi address-model=64 host-os=windows target-os=windows embed-manifest=on architecture=x86 warnings=off warnings-as-errors=off inlining=full optimization=speed "cflags=/O2 /GL /favor:blend" "linkflags=/NOLOGO /OPT:REF /OPT:ICF=5 /LTCG" install
XCOPY /Y /Q /I .\\\*.jam T:\\install\\boost\\
COPY /Y Jamroot T:\\install\\boost\\
`
```
# Build libtorrent
[](#build-libtorrent)
1. Unpack libtorrent into `\\sources\\libtorrent\\`.
2. Open `VS2013 x64 Native Tools Command Prompt`.
3. Navigate to libtorrent source folder.
4. Edit `include/libtorrent/escape\_string.hpp` to fix symbol export with dynamic linking:
* Replace `TORRENT\_EXTRA\_EXPORT std::string base32decode(std::string const& s);` **with**
`TORRENT\_EXPORT std::string base32decode(std::string const& s);`
* Build and install libtorrent:
```
` SET "PATH=T:\\install\\bjam\\bin;%PATH%"
bjam -j2 -q --toolset=msvc --prefix=T:\\install\\libtorrent boost=system boost-link=shared link=shared runtime-link=shared variant=release debug-symbols=off resolve-countries=on full-stats=on export-extra=off ipv6=on dht-support=on character-set=unicode geoip=static encryption=openssl windows-version=vista threading=multi address-model=64 host-os=windows target-os=windows embed-manifest=on architecture=x86 warnings=off warnings-as-errors=off inlining=full optimization=speed "cflags=/O2 /GL /favor:blend" "linkflags=/NOLOGO /OPT:REF /OPT:ICF=5 /LTCG" "include=T:\\install\\OpenSSL\\include" "include=T:\\install\\Boost\\include" "library-path=T:\\install\\OpenSSL\\lib" "library-path=T:\\install\\Boost\\lib" "define=BOOST\_ALL\_NO\_LIB" install
`
```
* If you want to build For XP 64-bit or WinServer 2003 64-bit you must build with `windows-version=xp` instead of `windows-version=vista`
# Build Qt
[](#build-qt)
1. Unpack Qt into `\\sources\\Qt\\`.
2. Open `VS2013 x64 Native Tools Command Prompt`.
3. Navigate to Qt source folder.
4. Build Qt:
```
` .\\configure.exe -release -shared -opensource -confirm-license -platform win32-msvc2013 -arch windows -ltcg -no-fast -exceptions -no-accessibility -stl -no-xmlpatterns -no-sql-mysql -no-sql-psql -no-sql-oci -no-sql-odbc -no-sql-tds -no-sql-db2 -qt-sql-sqlite -no-sql-sqlite2 -no-sql-ibase -no-qt3support -no-opengl -no-openvg -graphicssystem raster -qt-zlib -qt-libpng -qt-libmng -qt-libtiff -qt-libjpeg -no-dsp -no-vcproj -no-incredibuild-xge -plugin-manifests -process -mp -rtti -no-3dnow -mmx -sse -sse2 -openssl -no-dbus -no-phonon -no-phonon-backend -no-multimedia -no-audio-backend -no-webkit -no-script -no-scripttools -no-declarative -no-declarative-debug -no-style-s60 -no-style-windowsmobile -no-style-windowsce -no-style-cde -no-style-motif -qt-style-cleanlooks -qt-style-plastique -qt-style-windows -qt-style-windowsxp -qt-style-windowsvista -no-native-gestures -no-directwrite -qmake -nomake examples -nomake demos -nomake docs -I T:\\install\\OpenSSL\\include -L T:\\install\\OpenSSL\\lib -prefix T:\\install\\Qt
nmake sub-src
nmake sub-translations-make\_default-ordered
`
```
5. Install Qt:
```
` nmake install
`
```
# Build qBittorrent
[](#build-qbittorrent)
1. Unpack qbittorrent into `\\sources\\qbt\\`.
2. Open `VS2013 x64 Native Tools Command Prompt`.
3. Navigate to qbittorrent source folder.
4. Prepare qBt sources:
* Unpack Maxmind GeoIP.dat file into `.\\src\\geoip\\`
* Edit `.\\src\\src.pro`:
* Find and remove line `DEFINES += BOOST\_FILESYSTEM\_VERSION=2`
* Edit `winconf-msvc.pri`:
* Find
```
` CONFIG(debug, debug|release) {
LIBS += libtorrentd.lib \\
libboost\_system-vc90-mt-sgd-1\_51.lib
} else {
LIBS += libtorrent.lib \\
libboost\_system-vc90-mt-s-1\_51.lib
}
`
```
and replace with
```
` CONFIG(debug, debug|release) {
LIBS += torrent.lib \\
boost\_system.lib
} else {
LIBS += torrent.lib \\
boost\_system.lib
}
`
```
* Edit `winconf.pri` and adjust paths accordingly (remember that `T:\\install\\` is used as an example):
* Find `INCLUDEPATH += $$quote(C:/qBittorrent/boost\_1\_51\_0)`
and replace with
`INCLUDEPATH += $$quote(T:/install/Boost/include)`
* Find `INCLUDEPATH += $$quote(C:/qBittorrent/RC\_0\_16/include)`
and replace with
`INCLUDEPATH += $$quote(T:/install/libtorrent/include)`
* Find `INCLUDEPATH += $$quote(C:/qBittorrent/Zlib/include)`
and replace with
`INCLUDEPATH += $$quote(T:/install/Zlib/include)`
and insert `INCLUDEPATH += $$quote(T:/install/OpenSSL/include)` on next line
* Find `LIBS += $$quote(-LC:/qBittorrent/boost\_1\_51\_0/stage/lib)`
and replace with
`LIBS += $$quote(-LT:/install/Boost/lib)`
* Find `LIBS += $$quote(-LC:/qBittorrent/RC\_0\_16/bin/\<path-according-to-the-build-options-chosen\>)`
and replace with
`LIBS += $$quote(-LT:/install/libtorrent/lib)`
* Find `LIBS += $$quote(-LC:/qBittorrent/Zlib/lib)`
and replace with
`LIBS += $$quote(-LT:/install/Zlib/lib)`
and insert `LIBS += $$quote(-LT:/install/OpenSSL/lib)` on next line
* Find and remove the following lines:
`DEFINES += BOOST\_ASIO\_SEPARATE\_COMPILATION`
`DEFINES += BOOST\_SYSTEM\_STATIC\_LINK=1`
* Find `DEFINES += BOOST\_ALL\_NO\_LIB`
and insert `DEFINES += BOOST\_ASIO\_ENABLE\_CANCELIO` on next line
* Find `DEFINES += BOOST\_EXCEPTION\_DISABLE`
and insert
```
` DEFINES += BOOST\_ASIO\_DYN\_LINK
DEFINES += BOOST\_ALL\_DYN\_LINK
`
```
on previous line
* Find `DEFINES += TORRENT\_USE\_OPENSSL`
and insert `DEFINES += TORRENT\_LINKING\_SHARED` on next line
* Find `DEFINES += \_WIN32\_WINNT=0x0500`
and replace with `DEFINES += \_WIN32\_WINNT=0x0600`
* If you want to build For XP 64-bit or WinServer 2003 64-bit replace `DEFINES += \_WIN32\_WINNT=0x0500` with `DEFINES += \_WIN32\_WINNT=0x0501`
* Build qBt:
```
` SET "PATH=T:\\install\\Qt\\bin;%PATH%"
`
```
* Update translations
```
` CD .\\src
lupdate -no-obsolete ./src.pro
CD ..\\
`
```
* Build
```
` MD build
CD build
qmake -config release -r ../qbittorrent.pro "CONFIG += warn\_off msvc\_mp rtti ltcg mmx sse sse2" "CONFIG -= 3dnow"
nmake
`
```
* Install qBt:
```
` XCOPY /Y /Q /I .\\src\\release\\qbittorrent.exe T:\\install\\qBittorrent\\
FOR %X IN (QtCore4.dll QtGui4.dll QtNetwork4.dll QtXml4.dll) DO (
COPY /Y T:\\install\\Qt\\bin\\%X T:\\install\\qBittorrent\\
)
XCOPY /Y /Q /I T:\\install\\Qt\\plugins\\imageformats\\qico4.dll T:\\install\\qBittorrent\\plugins\\imageformats\\
FOR /F "usebackq" %X IN (`DIR /B "T:\\sources\\qbt\\src\\qt-translations\\"`) DO (
IF EXIST "T:\\install\\Qt\\translations\\%X" (
COPY /Y "T:\\install\\Qt\\translations\\%X" "T:\\sources\\qbt\\src\\qt-translations\\"
)
)
XCOPY /Y /Q /I T:\\sources\\qbt\\src\\qt-translations\\qt\_\* T:\\install\\qBittorrent\\translations\\
XCOPY /Y /Q /I T:\\install\\OpenSSL\\bin\\\*.dll T:\\install\\qBittorrent\\
XCOPY /Y /Q /I T:\\install\\libtorrent\\lib\\torrent.dll T:\\install\\qBittorrent\\
XCOPY /Y /Q /I T:\\install\\Boost\\lib\\\*.dll T:\\install\\qBittorrent\\
echo [Paths] \> T:\\install\\qBittorrent\\qt.conf
echo Translations = ./translations \>\> T:\\install\\qBittorrent\\qt.conf
echo Plugins = ./plugins \>\> T:\\install\\qBittorrent\\qt.conf
`
```
# Using resulting binaries on different computers
[](#using-resulting-binaries-on-different-computers)
If you want to use the resulting binaries on other Windows computers (or redistribute them) you will need [Visual C++ Redistributable Packages for Visual Studio 2013 (x64)](http://www.microsoft.com/en-us/download/details.aspx?id=40784). Users must have it installed in order to use any x86\_64 software compiled with Visual Studio 2013. If you are using qBt on computer, which was used for building it, you don't need VC++ 2013 x64 Redistributable Package, because you already have it installed (it came with Visual Studio 2013).
Alternatively you can copy redistributable dlls into program folder like this:
>
> XCOPY /Y /Q /I "%ProgramFiles(x86)%\Microsoft Visual Studio 12.0\VC\redist\x64\Microsoft.VC120.CRT\*.dll" T:\install\qBittorrent\
>
[Go back to home](https://github.com/qbittorrent/qBittorrent/wiki)
## General
[](#general)
* [Installing qBittorrent](https://github.com/qbittorrent/qBittorrent/wiki/Installing-qBittorrent)
* [Frequently Asked Questions (FAQ)](https://github.com/qbittorrent/qBittorrent/wiki/Frequently-Asked-Questions)
* [qBittorrent options (current and deprecated)](https://github.com/qbittorrent/qBittorrent/wiki/Explanation-of-Options-in-qBittorrent)
* [How to use qBittorrent as a tracker](https://github.com/qbittorrent/qBittorrent/wiki/How-to-use-qBittorrent-as-a-tracker)
* [How to use portable mode](https://github.com/qbittorrent/qBittorrent/wiki/How-to-use-portable-mode)
* [Anonymous mode](https://github.com/qbittorrent/qBittorrent/wiki/Anonymous-Mode)
* [How to bind your vpn to prevent ip leaks](https://github.com/qbittorrent/qBittorrent/wiki/How-to-bind-your-vpn-to-prevent-ip-leaks.md)
### Troubleshooting
[](#troubleshooting)
* [qBittorrent support forum](http://forum.qbittorrent.org/)
* [I forgot my GUI lock password](https://github.com/qbittorrent/qBittorrent/wiki/I-forgot-my-UI-lock-password)
* [I forgot my WebUI password](https://github.com/qbittorrent/qBittorrent/wiki/Web-UI-password-locked-on-qBittorrent-NO-X-(qbittorrent-nox))
* [Speed issues](https://github.com/qbittorrent/qBittorrent/wiki/Things-we-need-to-know-to-help-you-with-'speed'-issues)
### External programs
[](#external-programs)
* [How-to](https://github.com/qbittorrent/qBittorrent/wiki/External-programs-How-to)
* [`savecategory`](https://github.com/qbittorrent/qBittorrent/wiki/External-programs-savecategory)
### Search plugins
[](#search-plugins)
* [List of unofficial search plugins](https://github.com/qbittorrent/search-plugins/wiki/Unofficial-search-plugins)
### Themes
[](#themes)
* [Developing custom UI themes](https://github.com/qbittorrent/qBittorrent/wiki/Create-custom-themes-for-qBittorrent)
* [How to use custom UI themes](https://github.com/qbittorrent/qBittorrent/wiki/How-to-use-custom-UI-themes)
* [List of unofficial themes](https://github.com/qbittorrent/qBittorrent/wiki/List-of-known-qBittorrent-themes)
### Translation
[](#translation)
* [How to translate qBittorrent](https://github.com/qbittorrent/qBittorrent/wiki/How-to-translate-qBittorrent)
## WebUI
[](#webui)
### WebUI API
[](#webui-api)
|State|Version|
|[Current](https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-5.0))|qBittorrent \>= 5.0|
|[Previous](https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1))|qBittorrent v4.1.0 - v4.6.x|
|[Previous](https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-v3.2.0-v4.0.4))|qBittorrent v3.2.0 - v4.0.x|
|[Obsolete](https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-v3.1.x))|qBittorrent \< v3.2.0|
### Authentication
[](#authentication)
* [Username/password](https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-5.0)#login)
* [API key](https://github.com/qbittorrent/qBittorrent/wiki/API-Key-Authentication-(≥v5.2.0))
### WebAPI clients
[](#webapi-clients)
* [List of unofficial WebAPI clients](https://github.com/qbittorrent/qBittorrent/wiki/List-of-unofficial-WebAPI-clients)
### Alternate WebUI
[](#alternate-webui)
* [Alternate WebUI usage](https://github.com/qbittorrent/qBittorrent/wiki/Alternate-WebUI-usage)
* [Developing alternate WebUIs](https://github.com/qbittorrent/qBittorrent/wiki/Developing-alternate-WebUIs-(WIP))
* [List of unofficial alternate WebUIs](https://github.com/qbittorrent/qBittorrent/wiki/List-of-known-alternate-WebUIs)
### Reverse proxy setup for WebUI access
[](#reverse-proxy-setup-for-webui-access)
* [NGINX](https://github.com/qbittorrent/qBittorrent/wiki/NGINX-Reverse-Proxy-for-Web-UI)
* [Microsoft IIS ARR](https://github.com/qbittorrent/qBittorrent/wiki/IIS-ARR-Reverse-Proxy)
* [Traefik](https://github.com/qbittorrent/qBittorrent/wiki/Traefik-Reverse-Proxy-for-Web-UI)
### WebUI HTTPS configuration
[](#webui-https-configuration)
* [Let's Encrypt Certificates + Caddy2 Reverse Proxy](https://github.com/qbittorrent/qBittorrent/wiki/Linux-WebUI-HTTPS-with-Let's-Encrypt-&amp;-Caddy2-reverse-proxy)
* [Let's Encrypt certificates + NGINX reverse proxy - Linux](https://github.com/qbittorrent/qBittorrent/wiki/Linux-WebUI-HTTPS-with-Let's-Encrypt-certificates-and-NGINX-SSL-reverse-proxy)
* [Let's Encrypt certificates - Linux](https://github.com/qbittorrent/qBittorrent/wiki/Linux-WebUI-setting-up-HTTPS-with-Let's-Encrypt-certificates)
* [Self-signed SSL certificates - Linux](https://github.com/qbittorrent/qBittorrent/wiki/Linux-WebUI-setting-up-HTTPS-with-self-signed-SSL-certificates)
## Linux
[](#linux)
* [Running qBittorrent without X server (WebUI only)](https://github.com/qbittorrent/qBittorrent/wiki/Running-qBittorrent-without-X-server-(WebUI-only))
* [Running qBittorrent without X server (WebUI only, systemd service set up, Ubuntu 15.04 or newer)](https://github.com/qbittorrent/qBittorrent/wiki/Running-qBittorrent-without-X-server-(WebUI-only,-systemd-service-set-up,-Ubuntu-15.04-or-newer))
* [OpenVPN and qBittorrent without X server](https://github.com/qbittorrent/qBittorrent/wiki/OpenVPN-and-qBittorrent-without-X-server)
## Development
[](#development)
* [Coding style](https://github.com/qbittorrent/qBittorrent/blob/master/CODING_GUIDELINES.md)
* [Contributing](https://github.com/qbittorrent/qBittorrent/blob/master/CONTRIBUTING.md)
* [How to write a search plugin](https://github.com/qbittorrent/search-plugins/wiki/How-to-write-a-search-plugin)
* [Using VSCode for qBittorrent development](https://github.com/qbittorrent/qBittorrent/wiki/Using-VSCode-for-qBittorrent-development)
* [Setup GDB with Qt pretty printers](https://github.com/qbittorrent/qBittorrent/wiki/Setup-GDB-with-Qt-pretty-printers)
* [How to debug WebUI code](https://github.com/qbittorrent/qBittorrent/wiki/How-to-debug-the-WebUI-code)
### Compilation
[](#compilation)
[Common information for CMake](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-with-CMake-common-information)
#### \*BSD, Linux
[](#bsd-linux)
* [Alpine Linux](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Alpine-Linux)
* [CentOS 8.x](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-CentOS-8.x)
* [Debian / Ubuntu and derivatives (CMake)](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Debian,-Ubuntu,-and-derivatives)
* [Debian / Ubuntu and derivatives (autotools/qmake)](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Debian-and-Ubuntu)
* [Docker](https://github.com/qbittorrent/docker-qbittorrent-nox#readme)
* [FreeBSD (no GUI)](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-FreeBSD-(no-GUI))
* [Fully static binaries on Linux (glibc or musl)](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Fully-static-binaries-on-Linux-(glibc-or-musl))
* [Raspberry Pi OS / DietPi](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Raspberry-Pi-OS-and-DietPi)
* [Raspbian for LeMaker Banana Pro](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Raspbian-for-LeMaker-Banana-Pro)
#### macOS
[](#macos)
* [cmake (x86\_64, arm64, cross-compilation, static linkage)](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-macOS-(x86_64,-arm64,-cross-compilation))
* [autotools/qmake](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-macOS)
#### Windows
[](#windows)
* [MSVC 2019 (CMake, static linkage)](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Windows-(MSVC-2019,-64-bit,-static-linkage))
* [MSVC 2019 (qmake, static linkage)](https://github.com/qbittorrent/qBittorrent/wiki/Compiling-with-MSVC-2019-(static-linkage))
* [MSYS2](https://github.com/Chocobo1/qbittorrent_msys2#readme)
[Obsolete compilation guides](https://github.com/qbittorrent/qBittorrent/wiki/Obsolete-compilation-guides)
### Clone this wiki locally