Compilation MSVC 2017 (x86\_64) (static linkage) · qbittorrent/qBittorrent Wiki · GitHub
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
# Compilation MSVC 2017 (x86\_64) (static linkage)
[Jump to bottom](#wiki-pages-box)
Chocobo1 edited this page May 1, 2024
&middot;
[2 revisions](/qbittorrent/qBittorrent/wiki/Compilation-MSVC-2017-(x86_64)-(static-linkage)/_history)
This page describes how to compile 64-bit qBittorrent using MSVC 2017 under Windows. This is tested under Windows 7 SP1 64-bit but it should work the same under any other Windows version. Here the Community Edition of MSVC 2017 was used but any other edition must behave the same.
|
## Table of Contents
[](#table-of-contents)
* [What you will need:](#user-content-What_you_will_need)
* [Info that applies to all steps](#user-content-Info_that_applies_to_all_steps)
* [Compiling Zlib](#user-content-Compiling_Zlib)
* [Compiling OpenSSL](#user-content-Compiling_OpenSSL)
* [Compiling Boost](#user-content-Compiling_Boost)
* [Compiling Libtorrent](#user-content-Compiling_Libtorrent)
* [Compiling Qt5](#user-content-Compiling_Qt5)
* [Install and Configure Qt Creator](#user-content-Install_and_Configure_Qt_Creator)
* [Compiling qBittorrent](#user-content-Compiling_qBittorrent)|
###
What you will need:
[](#what-you-will-need)
* The MSVC 2017 compiler. The Community Edition(free) will do fine.
* A [python](https://www.python.org/downloads/windows/) interpreter. Make sure it is added to the path.
* A [Perl language](https://www.perl.org/) interpreter. [Strawberry Perl](http://strawberryperl.com/) will do fine.
* Latest release of the [NASM assembler](https://www.nasm.us/).
* Latest release of [Zlib](https://www.zlib.net/).
* Latest release of [OpenSSL](https://www.openssl.org/).
* Latest release of the [Boost libraries](https://www.boost.org/). Currently tested only with boost 1.68.
* Latest release of [libtorrent(rasterbar)](https://www.libtorrent.org/). Currently tested with libtorrent(rasterbar) 1.1.9
* Latest release of the [Qt libraries](https://download.qt.io/official_releases/qt/) source. Currently tested only with Qt Everywhere **5.9.6**.
* Latest release of [qBittorrent](https://www.qbittorrent.org).
* [Qt Creator](https://download.qt.io/official_releases/qtcreator/).
###
Info that applies to all steps
[](#info-that-applies-to-all-steps)
* Let's assume that the working directory for our compilation will be `G:\\QBITTORRENT`
* You need to use the **64-bit** version of the compiler. All commands will be issued in that command shell. Open it via `Start-\>All Programs-\>Visual Studio 2017-\>Visual Studio Tools-\>VC-\>x64 Native Tools Command Prompt for VS 2017`
* The above prompt will open and will use a path under the `C:\\` drive. If you want to use another drive for compilation (like mentioned above) you need to switch to that. Simply issuing `G:` (or any other drive letter) will switch there.
* When you want to change paths in the prompt you do it by issuing `cd new-path`. **NOTE:** If the path starts with a different drive letter you need to switch to that first. The `cd` command doesn't do it automatically.
* We will use 3 installation paths:
* `G:\\QBITTORRENT\\install\_msvc64\\base` will be used for installing all necessary libs except Qt5
* `G:\\QBITTORRENT\\install\_msvc64\\base\\qt5` will be used for installing qt5
* In general these compiler/linker flags will be used:
* **Compiler:** -O1 -Gy -Gw -GL -MT
* **Linker:** /NOLOGO /DYNAMICBASE /NXCOMPAT /LTCG /OPT:REF /OPT:ICF /MANIFEST:EMBED /INCREMENTAL:NO /NODEFAULTLIB:MSVCRT
###
Compiling Zlib
[](#compiling-zlib)
* Extract the Zlib source inside our working dir.
* Navigate to the Zlib source folder. eg `cd G:\\QBITTORRENT\\zlib-1.2.11`
* Edit the **win32/Makefile.msc** file. Find the CFLAGS and LDFLAGS variables and replace them with these:
```
CFLAGS = -nologo -O1 -Gy -Gw -GL -MT $(LOC)
LDFLAGS = /NOLOGO /DYNAMICBASE /NXCOMPAT /LTCG /OPT:REF /OPT:ICF /MANIFEST:EMBED /INCREMENTAL:NO /NODEFAULTLIB:MSVCRT
```
* Issue the following commands:
```
nmake -f win32/Makefile.msc AS=ml64 LOC="-DASMV -DASMINF -I." OBJA="inffasx64.obj gvmat64.obj inffas8664.obj"
```
* Copy zlib.h, zconf.h, zlib.lib to our install dir.
```
xcopy zlib.h G:\\QBITTORRENT\\install\_msvc64\\base\\include\\
xcopy zconf.h G:\\QBITTORRENT\\install\_msvc64\\base\\include\\
xcopy zlib.lib G:\\QBITTORRENT\\install\_msvc64\\base\\lib\\
```
###
Compiling OpenSSL
[](#compiling-openssl)
* Make sure you have installed perl and nasm. Use `nasm -v` to check NASM version, then if not found:
```
"C:\\Program Files\\NASM\\nasmpath.bat"
```
* Extract the OpenSSL source inside our working dir.
* Navigate to the OpenSSL source folder. eg *cd G:\\QBITTORRENT\\openssl-1.0.2k*
* Now we will build a static version of OpenSSL. Issue the following commands:
```
perl Configure VC-WIN64A no-shared zlib no-zlib-dynamic threads --openssldir=C:\\openssl --prefix=G:\\QBITTORRENT\\install\_msvc64\\base -IG:\\QBITTORRENT\\install\_msvc64\\base\\include -LG:\\QBITTORRENT\\install\_msvc64\\base\\lib
ms\\do\_win64a
```
* **NOTE:** Using the `--openssldir` switch is very important. It controls the path that will get hardcoded into openssl when it looks for the file `openssl.cnf`. Otherwise openssl will use the prefix path. If that path is on any other drive other than C: it will cause weird problems for **some** of the end users. If users have assigned to G: (or any other letter you used) a card reader/cdrom/dvdrom that doesn't have a card/cd/dvd plugged in they will get a cryptic message saying `There is no disk in the drive. Please insert a disk into drive G:`. See issue [#4190](https://github.com/qbittorrent/qBittorrent/issues/4190). So for that reason we use a dummy path under drive C: which is always available.
* Edit the *ms\\nt.mak* file and find the line that says:
```
EX\_LIBS=/libpath::\\QBITTORRENT\\install\_msvc\\base\\lib ws2\_32.lib gdi32.lib advapi32.lib crypt32.lib user32.lib zlib1.lib
```
* Replace **zlib1.lib** with **zlib.lib**
* Find the **CFLAG** variable and append:
```
-O1 -Gy -Gw -GL -MT
```
* Delete the values of **APP\_CFLAG** and **LIB\_CFLAG**
* Find line that says:
```
LFLAGS=/nologo /subsystem:console /opt:ref /debug
```
* And replace it with:
```
LFLAGS=/NOLOGO /SUBSYSTEM:CONSOLE /DYNAMICBASE /NXCOMPAT /LTCG /OPT:REF /OPT:ICF /MANIFEST:EMBED /INCREMENTAL:NO /NODEFAULTLIB:MSVCRT
```
* Then issue the following:
```
nmake -f ms\\nt.mak
nmake -f ms\\nt.mak install
```
###
Compiling Boost
[](#compiling-boost)
* Extract the Boost sources in the working dir.
* Navigate to the Boost source folder. eg *cd G:\\QBITTORRENT\\boost\_1\_68\_0*
* Now you will need to bootstrap Boost so it will build b2.exe(previously bjam.exe). Issue the following command:
```
bootstrap.bat
```
* Compile a static version of Boost. Issue the following command. You can replace %NUMBER\_OF\_PROCESSORS% in `-j %NUMBER\_OF\_PROCESSORS%` with a different number of threads you want b2 to use when compiling:
```
b2 -q --toolset=msvc-14.1 address-model=64 variant=release link=static runtime-link=static include="G:\\QBITTORRENT\\install\_msvc64\\base\\include" library-path="G:\\QBITTORRENT\\install\_msvc64\\base\\lib" --prefix="G:\\QBITTORRENT\\install\_msvc64\\base" cxxflags="-O1 -Gy -Gw -GL" linkflags="/NOLOGO /DYNAMICBASE /NXCOMPAT /LTCG /OPT:REF /OPT:ICF /MANIFEST:EMBED /INCREMENTAL:NO" --hash -j %NUMBER\_OF\_PROCESSORS%
```
* Install (it take a while to copy the numerous files):
```
b2 -q --toolset=msvc-14.1 address-model=64 variant=release link=static runtime-link=static include="G:\\QBITTORRENT\\install\_msvc64\\base\\include" library-path="G:\\QBITTORRENT\\install\_msvc64\\base\\lib" --prefix="G:\\QBITTORRENT\\install\_msvc64\\base" cxxflags="-O1 -Gy -Gw -GL" linkflags="/NOLOGO /DYNAMICBASE /NXCOMPAT /LTCG /OPT:REF /OPT:ICF /MANIFEST:EMBED /INCREMENTAL:NO" --hash -j %NUMBER\_OF\_PROCESSORS% install
```
###
Compiling Libtorrent
[](#compiling-libtorrent)
* Extract the Libtorrent sources in the working dir.
* Navigate to the Libtorrent source folder. eg *cd G:\\QBITTORRENT\\libtorrent-rasterbar-1.1.9*
* Copy the b2.exe from the Boost directory to the Libtorrent directory
```
copy ..\\boost\_1\_68\_0\\b2.exe b2.exe
```
* Compile a static version of Libtorrent. Issue the following command. You can replace %NUMBER\_OF\_PROCESSORS% in `-j %NUMBER\_OF\_PROCESSORS%` with a different number of threads you want b2 to use when compiling:
```
b2 -q --without-python --toolset=msvc-14.1 address-model=64 variant=release link=static runtime-link=static debug-symbols=on encryption=on crypto=openssl logging=off resolve-countries=off dht=on character-set=unicode boost-link=static -sBOOST\_ROOT="G:\\QBITTORRENT\\boost\_1\_68\_0" include="G:\\QBITTORRENT\\install\_msvc64\\base\\include" library-path="G:\\QBITTORRENT\\install\_msvc64\\base\\lib" --prefix="G:\\QBITTORRENT\\install\_msvc64\\base" cxxflags="-O1 -Gy -Gw -GL" define=BOOST\_ASIO\_DISABLE\_CONNECTEX linkflags="/NOLOGO /DYNAMICBASE /NXCOMPAT /LTCG /OPT:REF /OPT:ICF /MANIFEST:EMBED /INCREMENTAL:NO" --hash -j %NUMBER\_OF\_PROCESSORS%
```
* Install:
```
b2 -q --without-python --toolset=msvc-14.1 address-model=64 variant=release link=static runtime-link=static debug-symbols=on encryption=on crypto=openssl logging=off resolve-countries=off dht=on character-set=unicode boost-link=static -sBOOST\_ROOT="G:\\QBITTORRENT\\boost\_1\_68\_0" include="G:\\QBITTORRENT\\install\_msvc64\\base\\include" library-path="G:\\QBITTORRENT\\install\_msvc64\\base\\lib" --prefix="G:\\QBITTORRENT\\install\_msvc64\\base" cxxflags="-O1 -Gy -Gw -GL" define=BOOST\_ASIO\_DISABLE\_CONNECTEX linkflags="/NOLOGO /DYNAMICBASE /NXCOMPAT /LTCG /OPT:REF /OPT:ICF /MANIFEST:EMBED /INCREMENTAL:NO" --hash -j %NUMBER\_OF\_PROCESSORS% install
```
###
Compiling Qt5
[](#compiling-qt5)
* Extract the Qt sources in the working dir.
* Navigate to the Qt source folder. eg *cd G:\\QBITTORRENT\\qt-everywhere-opensource-src-5.9.6*
* Now we will build a static version of Qt and make it as small as possible.
* Open **qtbase/mkspecs/common/msvc-desktop.conf** and replace the relevant lines with:
```
QMAKE\_CFLAGS\_RELEASE = -O1 -Gy -Gw -GL -MT
QMAKE\_CFLAGS\_RELEASE\_WITH\_DEBUGINFO += -O1 -Gy -Gw -GL -MT -Zi
QMAKE\_CFLAGS\_DEBUG = -Zi -MTd
QMAKE\_LFLAGS = /NOLOGO /DYNAMICBASE /NXCOMPAT /LTCG
QMAKE\_LFLAGS\_RELEASE = /OPT:REF /OPT:ICF /MANIFEST:EMBED /INCREMENTAL:NO /NODEFAULTLIB:MSVCRT
QMAKE\_LFLAGS\_RELEASE\_WITH\_DEBUGINFO = /DEBUG /OPT:REF /OPT:ICF /INCREMENTAL:NO
```
* Issue the following command:
```
configure -prefix G:\\QBITTORRENT\\install\_msvc64\\qt5 -I G:\\QBITTORRENT\\install\_msvc64\\base\\include -L G:\\QBITTORRENT\\install\_msvc64\\base\\lib -platform win32-msvc -release -opensource -confirm-license -strip -no-shared -static -static-runtime -ltcg -make libs -make tools -nomake examples -no-compile-examples -no-dbus -no-qml-debug -no-icu -system-zlib -openssl-linked -no-gtk -no-opengl -no-opengles3 -no-angle -no-sql-sqlite -no-sql-odbc -no-sqlite -skip qt3d -skip qtactiveqt -skip qtandroidextras -skip qtcanvas3d -skip qtcharts -skip qtconnectivity -skip qtdatavis3d -skip qtdoc -skip qtgamepad -skip qtgraphicaleffects -skip qtimageformats -skip qtlocation -skip qtmacextras -skip qtmultimedia -skip qtnetworkauth -skip qtpurchasing -skip qtquickcontrols -skip qtquickcontrols2 -skip qtremoteobjects -skip qtscript -skip qtscxml -skip qtsensors -skip qtserialbus -skip qtserialport -skip qtspeech -skip qtvirtualkeyboard -skip qtwayland -skip qtwebchannel -skip qtwebengine -skip qtwebsockets -skip qtwebview -skip qtx11extras -skip qtxmlpatterns ZLIB\_LIBS="-lzlib" OPENSSL\_LIBS="-llibeay32 -lssleay32"
```
* Now you have 2 choices for compiling. Using `nmake` or `jom`. nmake uses only one core for compilation. That means that the qt compilation will take hours. On the other hand jom can use multiple cores/threads for faster compilation. Download it from [here](https://download.qt.io/official_releases/jom/). Extract the jom.exe to the qt source dir and just issue(your can replace %NUMBER\_OF\_PROCESSORS% if you want with a different number of threads to use):
```
jom -j %NUMBER\_OF\_PROCESSORS%
```
* Now install:
```
jom -j %NUMBER\_OF\_PROCESSORS% install
```
###
Install and Configure Qt Creator
[](#install-and-configure-qt-creator)
* Just follow the installer instructions for the installation.
* Launch Qt Creator and select Tools-\>Options...
* Select the **Build & Run** item from the left and select the **Qt Versions** tab.
* Click the **Add...** button and select the qmake.exe you just build. It should be in **G:\\QBITTORRENT\\install\_msvc64\\qt5\\bin\\qmake.exe**
* Name it something meaningful like "Qt5 msvc2017 x64"
* Apply the changes
* Click the **Kits** tab
* Click the **Add** button. Choose a name eg Qt5 msvc2017 x64. Also choose a Qt version and a compiler from the drop down menus. Be sure to select the 64-bit(amd64) version of the compiler. Click Apply.
* If you have configured multiple kits, then select the one you want as default and click the button **Make Default** and click OK. Otherwise, just close the dialog now.
###
Compiling qBittorrent
[](#compiling-qbittorrent)
* Extract the qBittorrent sources in the working dir.
* Launch Qt Creator and open the *qbittorrent.pro* file in *G:\\QBITTORRENT\\qbittorrent-4.1.2*
* From the Window that pops up select the Qt version you added above and specify **release** version. Also check the *Use Shadow Building* checkbox. You can also select where qBittorrent will be built if you want.
* If you are compiling qBittorrent `v3\_3\_x` branch, open the *winconf.pri* file and adjust the paths. If `v4\_0\_x` branch is used, open *conf.pri.windows*, save it as *conf.pri* and adjust the paths. Disregard most of the file comments(read next step).
* Edit the first INCLUDEPATH to look like this:
```
INCLUDEPATH += $$quote(G:/qBittorrent/install\_msvc64/base/include)
```
* Edit the second INCLUDEPATH to look like this(adjust for actual boost name):
```
INCLUDEPATH += $$quote(G:/qBittorrent/install\_msvc64/base/include/boost-1\_68)
```
* Comment the other 2 INCLUDEPATH lines by putting # in front of them.
* Edit the first LIBS to look like this:
```
LIBS += $$quote(-LG:/qBittorrent/install\_msvc64/base/lib)
```
* Comment the other 3 LIBS lines by putting # in front of them.
* If you are compiling `v3\_3\_x` branch, open the *winconf-msvc.pri* file and adjust the filename of the lib of Boost. If `v4\_0\_x` branch is used, adjust it in *conf.pri*.
* If you are compiling `v4\_0\_x` branch against libtorrent 1.0.x, uncomment the following line in *conf.pri*
```
DEFINES += BOOST\_ALL\_NO\_LIB
```
and comment line by putting # in front of them.
```
DEFINES += BOOST\_ASIO\_SEPARATE\_COMPILATION
```
change:
```
CONFIG(debug, debug|release) {
LIBS += libtorrentd.lib \\
libboost\_system-vc140-mt-sgd-1\_64.lib
}
else {
LIBS += libtorrent.lib \\
libboost\_system-vc140-mt-s-1\_64.lib
}
```
to
```
CONFIG(debug, debug|release) {
LIBS += libtorrentd.lib \\
libboost\_system-vc141-mt-sgd-x64-1\_68.lib
}
else {
LIBS += libtorrent.lib \\
libboost\_system-vc141-mt-s-x64-1\_68.lib
}
```
* Select Build-\>Build All
* After the compilation ends you should have *qbittorrent.exe* in `\<build folder\>\\src\\release`. "build folder" is where you chose qBittorrent to be build in the popup window.
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