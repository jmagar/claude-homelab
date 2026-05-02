Compilation MSVC 2008 (static linkage) · qbittorrent/qBittorrent Wiki · GitHub
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
# Compilation MSVC 2008 (static linkage)
[Jump to bottom](#wiki-pages-box)
xavier2k6 edited this page Jan 27, 2025
&middot;
[3 revisions](/qbittorrent/qBittorrent/wiki/Compilation-MSVC-2008-(static-linkage)/_history)
This page describes how to compile qBittorrent using MSVC 2008 under Windows. This is tested under Windows XP sp2 but it should work the same under any other Windows version. Also it should build fine with MSVC 2010 with minor adjustments. Here the Express Edition of MSVC 2008 was used but the full edition must behave the same.
|
## Table of Contents
[](#table-of-contents)
* [What you will need:](#user-content-What_you_will_need)
* [Compiling Zlib](#user-content-Compiling_Zlib)
* [Compiling OpenSSL](#user-content-Compiling_OpenSSL)
* [Compiling Boost](#user-content-Compiling_Boost)
* [Compiling Libtorrent](#user-content-Compiling_Libtorrent)
* [Compiling Qt](#user-content-Compiling_Qt)
* [Install and Configure Qt Creator](#user-content-Install_and_Configure_Qt_Creator)
* [Compiling qBittorrent](#user-content-Compiling_qBittorrent)|
###
What you will need:
[](#what-you-will-need)
* The MSVC 2008 compiler. The Express Edition(free) will do fine.
* A [Perl language](http://www.perl.org/) interpreter. [Strawberry Perl](http://strawberryperl.com/) will do fine. Download version 5.16.1.1 [here](http://strawberry-perl.googlecode.com/files/strawberry-perl-5.16.1.1-32bit.msi).
* Latest release of the [NASM assembler](http://www.nasm.us/). Download version 2.10.07 [here](http://www.nasm.us/pub/nasm/releasebuilds/2.10.07/win32/nasm-2.10.07-win32.zip).
* Latest release of [Zlib](http://www.zlib.net/). Download version 1.2.8 [here](http://zlib.net/zlib-1.2.8.tar.xz).
* Latest release of [OpenSSL](http://www.openssl.org/). Download version 1.0.1e [here](https://www.openssl.org/source/openssl-1.0.1e.tar.gz).
* Latest release of the [Boost libraries](http://www.boost.org/). Download version 1.54.0 [here](http://sourceforge.net/projects/boost/files/boost/1.54.0/boost_1_54_0.7z/download).
* Latest release of [libtorrent(rasterbar)](http://www.rasterbar.com/products/libtorrent/). Download version 0.16.10 [here](https://libtorrent.googlecode.com/files/libtorrent-rasterbar-0.16.10.tar.gz).
* Latest release of the [Qt libraries](http://qt-project.org/) source. Download version 4.8.5 [here](http://download.qt-project.org/official_releases/qt/4.8/4.8.5/qt-everywhere-opensource-src-4.8.5.tar.gz).
* Latest release of [qBittorrent](http://www.qbittorrent.org). Download version 3.0.9 [here](http://sourceforge.net/projects/qbittorrent/files/qbittorrent/qbittorrent-3.0.9/qbittorrent-3.0.9.tar.xz/download).
* Qt Creator version [2.5.2](ftp://ftp.qt-project.org/qtcreator/qt-creator-win-opensource-2.5.2.exe). Version 2.6.2 freezes when trying to open the qbittorrent project.
Let's assume that the working directory for our compilation will be **C:\\qBittorrent**
###
Compiling Zlib
[](#compiling-zlib)
* Extract the Zlib source inside our working dir.
* Open the MSVC2008 command shell. Start-\>Programs-\>Microsoft Visual C++ 2008 Express Edition-\>Visual Studio Tools-\>Visual Studio 2008 Command Prompt
* Navigate to the Zlib source folder. eg *cd C:\\qBittorrent\\zlib-1.2.7*
* Edit the win32/Makefile.msc file. Find the CFLAGS and LDFLAGS variables and replace it with these:
```
CFLAGS = -nologo -W3 -O2 -Oy- -Zi -Fd"zlib" nologo -Zm200 -Zc:wchar\_t- -O1 -Og -GL -MT $(LOC)
LDFLAGS = -nologo -debug -incremental:no -opt:ref -opt:icf -dynamicbase -nxcompat -ltcg /nodefaultlib:msvcrt
```
* Issue the following commands:
```
nmake -f win32/Makefile.msc LOC="-DASMV -DASMINF" OBJA="inffas32.obj match686.obj"
```
* Copy zlib.h, zconf.h, zlib.lib, zlib.pdb to our install dir.
```
xcopy zlib.h C:\\qBittorrent\\install\\include\\
xcopy zconf.h C:\\qBittorrent\\install\\include\\
xcopy zlib.lib C:\\qBittorrent\\install\\lib\\
xcopy zlib.pdb C:\\qBittorrent\\install\\lib\\
```
###
Compiling OpenSSL
[](#compiling-openssl)
* Make sure you have installed perl and nasm.
* Extract the OpenSSL source inside our working dir.
* Open the MSVC2008 command shell. Start-\>Programs-\>Microsoft Visual C++ 2008 Express Edition-\>Visual Studio Tools-\>Visual Studio 2008 Command Prompt
* Navigate to the OpenSSL source folder. eg *cd C:\\qBittorrent\\openssl-1.0.1e*
* Now we will build a static version of OpenSSL. Issue the following commands:
```
perl Configure VC-WIN32 no-shared zlib no-zlib-dynamic threads --prefix=C:\\qBittorrent\\install -IC:\\qBittorrent\\install\\include -LC:\\qBittorrent\\install\\lib
ms\\do\_nasm
```
* Edit the *C:\\qBittorrent\\openssl-1.0.1e\\ms\\nt.mak* file and find the line that says:
```
EX\_LIBS=/libpath:C:\\qBittorrent\\install\\lib ws2\_32.lib gdi32.lib advapi32.lib crypt32.lib user32.lib zlib1.lib
```
* Replace **zlib1.lib** with **zlib.lib**
* Find the **CFLAG** variable and append:
```
-nologo -Zm200 -Zc:wchar\_t- -O1 -Og -GL -MT -Zi
```
* Find line that says:
```
LFLAGS=/nologo /subsystem:console /opt:ref /debug
```
* And append:
```
/incremental:no /opt:ref /opt:icf /dynamicbase /nxcompat /ltcg /nodefaultlib:msvcrt
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
* Open the MSVC2008 command shell. Start-\>Programs-\>Microsoft Visual C++ 2008 Express Edition-\>Visual Studio Tools-\>Visual Studio 2008 Command Prompt
* Navigate to the Boost source folder. If you are still in the MSVC shell just issue (assuming you have only one folder beginning with the letter 'b' in your qBt folder) the command
```
cd ..
cd b\<TAB\>\<ENTER\>
```
* Now you will need to bootstrap Boost so it will build b2.exe(previously bjam.exe). Issue the following command:
```
bootstrap.bat
```
* Compile a static version of Boost. Issue the following command where N is the number of CPU cores you have or how many threads you want b2 to use when compiling (msvc version is needed for the correct choice of msvc-9.0 if installed msvc-10.0) (replace N with the number of processor cores):
```
b2 -q --with-system --toolset=msvc-9.0 variant=release link=static runtime-link=static -j N
```
* (Optional) This is what you can put in a batch file -- e.g. 'mkb.bat' -- to perform the above. Assuming you don't care about how many threads boost will use. You must stay within this command prompt to benefit from the SET command here, when you navigate to the next step.
```
call bootstrap
b2 -q --with-system --toolset=msvc-9.0 variant=release link=static runtime-link=static -j 1
for /f "tokens=\* delims=/" %%A in ('cd') do set BOOST\_ROOT=%%A
echo on
cd ..
rem Now navigate to the next folder, issuing the command 'cd L\<TAB\>\<ENTER\>
```
###
Compiling Libtorrent
[](#compiling-libtorrent)
* Extract the Libtorrent sources in the working dir.
* Open the MSVC2008 command shell. Start-\>Programs-\>Microsoft Visual C++ 2008 Express Edition-\>Visual Studio Tools-\>Visual Studio 2008 Command Prompt
* Navigate to the Libtorrent source folder. eg *cd C:\\qBittorrent\\libtorrent-rasterbar-0.16.9*
* Copy the b2.exe from the Boost directory to the Libtorrent directory
```
copy ..\\boost\_1\_53\_0\\b2.exe b2.exe
```
* Compile a static version of Libtorrent. Issue the following command where N is the number of CPU cores you have or how many threads you want b2 to use when compiling, adjust the value of BOOST\_ROOT to the Boost source directory(absolute path) and adjust the value of the "include=" and "library-path=" keywords:
```
b2 -q --without-python --toolset=msvc-9.0 variant=release link=static runtime-link=static encryption=openssl logging=none geoip=static dht-support=on boost=source character-set=unicode boost-link=static -sBOOST\_ROOT="C:\\qBittorrent\\boost\_1\_53\_0" include="C:\\QBITTORRENT\\install\\include" library-path="C:\\QBITTORRENT\\install\\lib" -j N
```
* If you want to continue with the lazy batch file approach here's the batch file you need to use (still assuming you haven't left the VS2008 Command prompt) -- copy and paste it to e.g. 'mkl.bat' and place it in your lib\* folder and then run it:
```
copy %BOOST\_ROOT%\\b2.exe
b2 -q --without-python --toolset=msvc-9.0 variant=release link=static runtime-link=static encryption=openssl logging=none geoip=static dht-support=on boost=source character-set=unicode boost-link=static -sBOOST\_ROOT="C:\\qBittorrent\\boost\_1\_53\_0" include="C:\\QBITTORRENT\\install\\include" library-path="C:\\QBITTORRENT\\install\\lib" -j 1
echo on
cd ..
rem Now navigate to the next folder, issuing the command 'cd QT\<TAB\>\<ENTER\>
```
###
Compiling Qt
[](#compiling-qt)
* Extract the Qt sources in the working dir.
* Open the MSVC2008 command shell. Start-\>Programs-\>Microsoft Visual C++ 2008 Express Edition-\>Visual Studio Tools-\>Visual Studio 2008 Command Prompt
* Navigate to the Qtsource folder. eg *cd C:\\qBittorrent\\qt-everywhere-opensource-src-4.8.4*
* Now we will build a static version of Qt with making as small as possible.
* Open **mkspecs\\win32-msvc2008\\qmake.conf** and replace the **QMAKE\_CFLAGS\_RELEASE** line with:
```
QMAKE\_CFLAGS\_RELEASE = -O1 -Og -GL -MT
```
**QMAKE\_LFLAGS** line with:
```
QMAKE\_LFLAGS = /NOLOGO /DYNAMICBASE /NXCOMPAT /LTCG
```
**QMAKE\_LFLAGS\_RELEASE** line with:
```
QMAKE\_LFLAGS\_RELEASE = /INCREMENTAL:NO /NODEFAULTLIB:MSVCRT
```
* Open **src\\3rdparty\\zlib\_dependency.pri** and replace **zdll.lib** with **zlib.lib**
* Do the same for **src\\tools\\bootstrap\\bootstrap.pri**
* Issue the following commands:
```
configure.exe -debug-and-release -opensource -static -ltcg -fast -system-zlib -no-qt3support -no-opengl -no-openvg -no-dsp -no-vcproj -no-dbus -no-phonon -no-phonon-backend -no-multimedia -no-audio-backend -no-webkit -no-script -no-scripttools -no-declarative -no-declarative-debug -mp -arch windows -qt-style-windowsxp -nomake examples -nomake demos -platform win32-msvc2008 -openssl-linked -largefile -I "C:\\QBITTORRENT\\install\\include" -L "C:\\QBITTORRENT\\install\\lib"
bin\\qmake.exe projects.pro QT\_BUILD\_PARTS="libs translations"
nmake
```
* At some point the build will fail. Go to **lib/** and open in a text editor **QtNetwork.prl** and **QtNetworkd.prl**. Append to the end of **QMAKE\_PRL\_LIBS** these: **gdi32.lib crypt32.lib**
* Run nmake again.
* You can close the command prompt now.
###
Install and Configure Qt Creator
[](#install-and-configure-qt-creator)
* Just follow the installer instructions for the installation.
* Launch Qt Creator and select Tools-\>Options...
* Select the **Build & Run** item from the left and select the **Qt Versions** tab.
* Click the **Add...** button and select the qmake.exe you just build. It should be in **C:\\qBittorrent\\qt-everywhere-opensource-src-4.8.4\\bin\\qmake.exe**
* Name it something meaningful like "Qt 4.8.4 - MSVC2008"
* Apply the changes and close the window
###
Compiling qBittorrent
[](#compiling-qbittorrent)
* Go to [Maxmind](http://www.maxmind.com) and download the GeoLite Country database in binary format. Here is the [link](http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz).
* Extract the *GeoIP.dat* file inside *C:\\qBittorrent\\qbittorrent-3.0.9\\src\\geoip*.
* Launch Qt Creator and open the *qbittorrent.pro* file in *C:\\qBittorrent\\qbittorrent-3.0.9*
* From the Window that pops up select the Qt version you added above and specify **release** version. Also check the *Use Shadow Building* checkbox. You can also select where qBittorrent will be built if you want.
* Open the *winconf.pri* file and adjust the paths. Read the comments. **NOTE:** Replace any '\\' with '/' in the paths to avoid some Qt warnings.
* Open the *winconf-msvc.pri* file and adjust the filename of the lib of Boost.
* Select Build-\>Build All
* After the compilation ends you should have *qbittorrent.exe* in *\<build\>\</build\>\\src\\release*. "build folder" is where you chose qBittorrent to be build in the popup window.
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