Compilation macOS (x86\_64, arm64, cross compilation) · qbittorrent/qBittorrent Wiki · GitHub
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
# Compilation macOS (x86\_64, arm64, cross compilation)
[Jump to bottom](#wiki-pages-box)
xavier2k6 edited this page Jan 22, 2026
&middot;
[3 revisions](/qbittorrent/qBittorrent/wiki/Compilation-macOS-(x86_64,-arm64,-cross-compilation)/_history)
This guide covers qBittorrent compilation process for any supported Mac systems as of writing, i.e. following this guide you will be able to build as x86\_64 (aka for Intel chip based Mac) so as arm64 (aka for Apple Silicon based Mac) binaries. Cross-compilation process is covered as well. Most of the steps are the same for all cases, required adjustments for a specific case are highlighted. Cross-compilation is possible (and was tested) in both directions, i.e. producing arm64 binaries on x86\_64 host and vice versa. Universal (aka "fat") binaries are not supported due to a lot of technically difficult reasons of compiling required dependencies.
Rosetta (or any other software allowing to run non-native binaries) is not required to produce binaries for other architecture, neither for running compiled qBittorrent.
This guide was written based on sources from master branch at the time of writing, but it is applicable for 4.3.x series too.
No deep knowledge in C/C++ compilation/development process is required, just following this guide allows to achieve desired result. Also it can be a good starting point if you plan to start qBittorrent development (or just want to understand the basics of cross-compiling). Even more, this guide can be interesting for any person who wants to build/run Qt-based software on Apple Silicon based Mac.
## Conventions used in this document
[](#conventions-used-in-this-document)
All provided commands should NOT be run as root (i.e. superuser) and assume next directory structure:
```
$HOME/qbt - working directory
|\_ src - all sources are placed here
|\_ root - compiled dependencies goes here
```
Any provided command assumes that you are in `src` directory unless otherwise is specified.
CMake app is placed in standard `/Applications` folder.
## Build environment setup
[](#build-environment-setup)
Only few things are required:
* [Xcode](https://apps.apple.com/us/app/xcode/id497799835?mt=12) - default IDE from Apple
* [CMake](https://cmake.org/download/) - build tool for C/C++ projects
If you plan to build binaries for arm64 (i.e. Apple Silicon) you must have Xcode 12, anything lower doesn't support it. Xcode 11 is enough to build x86\_64 binaries, lower versions will not work due to a lack of C++17 support required by qBittorrent. Minimum supported macOS version for running compiled binaries is macOS 10.14 Mojave, again due to C++17 requirement.
If you plan to run the build on Apple Silicon based Mac, you have to use CMake 3.19.2 and above, only since this version it is shipped as universal binary. Latest available is recommended, qBittorrent requires pretty recent CMake version, and it can be updated to even newer version.
Download links for required tools are provided above, Xcode - to Apple App Store, CMake - to official site. Only one more note about Xcode installation - you must run it after installation, it installs some additional tools required for build process.
There is may be some bug in Apple' tools, author encountered it on two laptops running macOS 10.15.7 Catalina, but everything was fine on Apple M1 MacBook Pro 2020 running macOS 11.3.1 BigSur. So the issue seems to affect only older systems. There is [link to StackOverflow](https://stackoverflow.com/questions/63342521/clang-on-macos-having-problems-with-its-includes) where solution was found. It is very likely that you will need to add the line mentioned in the last answer when you are running macOS Catalina (as an author of this guide) at least in case of cross-compilation.
Please avoid usage of Homebrew or any tools/dependencies installed from it. It is known that it can interfere with provided by default or installed by user similar software. Successful build in case of presence of Homebrew is not guaranteed. If you encounter any build issues due to presence of Homebrew you are of your own.
## Required sources
[](#required-sources)
* [qBittorrent itself](https://github.com/qbittorrent/qBittorrent) - use git to clone repository or just download snapshot as archive or release tarball
* [Qt](https://code.qt.io/cgit/qt/qt5.git/) - use latest available from 5.15.x series, it is recommended to clone repository instead of downloading release tarball sources, covered below in this guide
* [libtorrent](https://github.com/arvidn/libtorrent/releases) - it is recommended to download release tarball, latest version from 1.2.x series is recommended, but 2.0.x is also suitable (experimental)
* [boost](https://www.boost.org/) - libtorrent dependency, version 1.69 or above is required
* [OpenSSL](https://www.openssl.org/source/) - download latest available from 1.1.x series
### Downloading Qt sources
[](#downloading-qt-sources)
This section only describes Qt sources downloading from official git repo because this is pretty unusual comparing to any other git repo clone process. You can find more details on it in [official Qt documentation](https://wiki.qt.io/Building_Qt_5_from_Git#Getting_the_source_code). Downloading of any other required sources doesn't worth even any mentioning - just download them from web browser or using your favorite command line tools.
It is recommended to clone qt5 repo instead of downloading tarball due to very limited set of Qt modules required by qBittorrent.
Downloading process consists of few steps: cloning the root repo and then cloning subrepos. To clone the "root" or "supermodule" repo just run:
```
git clone https://code.qt.io/qt/qt5.git
cd qt5
git checkout v5.15.2 # tag in Qt repository, 5.15.2 was the latest at the time of writing
```
Now it's time to download modules. The required modules set is slightly different depending on the qBittorrent version use are building. Suggested set assumes master version, if you want to build 4.3.x just add `qtmacextras` to list:
```
# you are still in qt5 directory
perl init-repository --module-subset=qtbase,qtsvg,qttools,qttranslations
```
Now all Qt sources are ready.
Please do not try to use Qt 6.x, qBittorrent doesn't support it yet.
## Building dependencies
[](#building-dependencies)
All required libraries will be compiled as static libraries, there are few reasons for that, but the main reason was some Qt-specific issues. Moreover, usage of static libraries significantly simplifies the process in case of cross-compilation (again, due to Qt specific).
The order in which libraries are compiled is important sometimes, because libraries may depend on each other. Suggested order is recommended.
Almost all build options listed in next sections describing build process are not strictly required, most of them was set only according to the author's preference or just because they are widely used. Important options and/or their values are described. Experienced users will easily notice what can be changed depending on their preference or needs even they are completely unfamiliar with mentioned libraries.
Process describing sources archives extraction is not listed here, it is assumed that all archives are already extracted. Through this manual it is assumed that extracted sources are placed into `src` folder.
### boost
[](#boost)
Actually boost is not required to be built. All parts required by libtorrent are header-only now. So, just extracting it is enough.
### OpenSSL
[](#openssl)
OpenSSL supports out-of-tree builds, so let's use it to not bloat source folder with any binaries and allow to reuse it if more that one build is planned (for both architectures).
```
mkdir build-openssl && cd build-openssl
# OpenSSL 1.1.1k was the latest at the time of writing, replace version with yours
../openssl-1.1.1k/Configure no-comp no-deprecated no-dynamic-engine no-tests no-shared no-zlib --openssldir=/etc/ssl --prefix=$HOME/qbt/root -mmacosx-version-min=10.14 darwin64-arm64-cc
```
Configure line listed above will configure OpenSSL for arm64 binaries compilation, to build x86\_64 binaries just replace 'arm64' with 'x86\_64'. Such configure line is required in case of cross-compilation, but can be also used for host-only (just machine you are running on).
For host-only build this line can be slightly simplified by replacing 'Configure' with 'config' and omitting the last part containing architecture.
```
# you are still in build-openssl
../openssl-1.1.1k/config no-comp no-deprecated no-dynamic-engine no-tests no-shared no-zlib --openssldir=/etc/ssl --prefix=$HOME/qbt/root -mmacosx-version-min=10.14
```
There is important note about `-mmacosx-version-min` option. This option is crucial, without passing it some default value will be used, and this default value usually much greater (equal to used SDK) and it is will lead to at least warning at application linkage stage when application set the same option to lower value (actually required by application). Value set here (`10.14`) is reasonable minimum inherited from qBittorrent C++17 requirement.
After configuration OpenSSL should be compiled and installed using next commands:
```
make -j$(sysctl -n hw.ncpu)
make install\_sw
```
Please note '\_sw' suffix in the last one, this is just to install minimal set of possible files.
### libtorrent
[](#libtorrent)
CMake is required to build libtorrent. As soon as CMake for macOS is usual app bundle, but we need in only one command line tool placed into it, so just extend `PATH` variable to let the system to find required tool:
```
export PATH=/Applications/CMake/CMake.app/Contents/bin:$PATH
```
CMake build system also supports out-of-tree builds, again let's use this feature to keep source tree clean and untouched. Moreover, CMake does not require existing build directory, it is created automatically.
The following "configure command" will prepare libtorrent for arm64 binaries compilation. Just replace 'arm64' with 'x86\_64' if you want corresponding binaries. The whole option `CMAKE\_OSX\_ARCHITECTURES` can be omitted if builds for other architectures rather than host are not planned.
```
# boost 1.76 and libtorrent 1.2.13 (or 2.0.3) were the latest at the time of writing
cmake -S libtorrent-rasterbar-1.2.13 -B build-libtorrent \\
-D CMAKE\_VERBOSE\_MAKEFILE=ON \\
-D CMAKE\_PREFIX\_PATH="$HOME/qbt/src/boost\_1\_76\_0;$HOME/qbt/root" \\
-D CMAKE\_CXX\_STANDARD=17 -D CMAKE\_CXX\_EXTENSIONS=OFF \\
-D CMAKE\_OSX\_DEPLOYMENT\_TARGET=10.14 \\
-D CMAKE\_OSX\_ARCHITECTURES=arm64 \\
-D CMAKE\_BUILD\_TYPE=Release \\
-D BUILD\_SHARED\_LIBS=OFF -D deprecated-functions=OFF \\
-D CMAKE\_INSTALL\_PREFIX=$HOME/qbt/root
```
`CMAKE\_CXX\_STANDARD` and `CMAKE\_OSX\_DEPLOYMENT\_TARGET` options are important, their values are set based on qBittorrent requirements. The last one sets `-mmacosx-version-min` value, what was described above.
```
cmake --build build-libtorrent -j$(sysctl -n hw.ncpu)
cmake --install build-libtorrent
```
Exactly the same commands can be used to build libtorrent 2.0.x (at least at the time of writing).
### Qt
[](#qt)
Nothing special is required to build Qt for x86\_64 host, but some adjustments are needed if you compile on arm64 host and only for arm64 host. Even more adjustments are required in case of cross-compilation. Following steps cover all cases, you can just skip corresponding parts depending on your case, but completing all steps will not have any negative effects.
First trick is required when building on Apple Silicon based Mac (regardless for which target architecture), without it Qt build system produces x86\_64 binaries instead of arm64 even for tools required at build time, what leads to build errors (because binaries can be launched). File `qt5/qtbase/mkspecs/common/macx.conf` must be edited. Variable `QMAKE\_APPLE\_DEVICE\_ARCHS` in it must have the value corresponding to *host architecture* (i.e. arm64 in case of Apple Silicon), so it must be adjusted if necessary.
Also let's change `QMAKE\_MACOSX\_DEPLOYMENT\_TARGET` to newer `10.14` allowing Qt to benefit from new C++17 features. Without this adjustment option forcing C++17 usage can't be used and configure command will fail.
Next trick is required for cross-compilation, for host-only builds it is not required. Qt has so-called mkspecs for a lot of compiler/architecture build variants. These mkspecs contain a set of configuration files used by build system to produce binaries for required architecture. Unfortunately, there are no any mkspecs applicable to clang compiler targeting arm64 (or x86\_64 in case of cross-compilation on arm64 host), especially taking into account macOS specifics. so they must be created. Fortunately, there is mkspec used for host macOS build, and it can be copied and adapted easily for required target architecture.
All mentioned mkspecs are located in `qt5/qtbase/mkspecs` directory. `macx-clang` is what is used on Mac host. It will be used as base for creating required specs targeting another Mac architecture. New one (the copy of `macx-clang`) must be placed alongside existing (i.e. in the same directory).
In this manual x86\_64 to arm64 cross-compilation steps are shown, but the same is required for building in reverse direction, just change the target architecture.
```
cp -r qt5/qtbase/mkspecs/macx-clang qt5/qtbase/mkspecs/macx-clang-arm64
```
The name `macx-clang-arm64` used in line listed above is nothing more that the just a name. Nothing parses or somehow interprets it. All parts of it are just a hint that which can be interpreted as "this particular folder contains files describing targeting arm64 using clang compiler on macOS platform". This name is just a author's suggestion. It can be whatever you want.
Just a copying a folder is not enough, some files must be edited to achieve what is expected (describe what binaries must be produced). For that, open `qmake.conf` file in your copy (i.e. `macx-clang-arm64`) and place the line containing variable `QMAKE\_APPLE\_DEVICE\_ARCHS` with your desired *target architecture* as value (i.e. arm64 in this particular example) before the last line in this file. Next snippet shows how last lines of that file (`qmake.conf`) should look, comparing it with what you have you will notice where new line was added:
```
include(../common/macx.conf)
include(../common/gcc-base-mac.conf)
include(../common/clang.conf)
include(../common/clang-mac.conf)
QMAKE\_APPLE\_DEVICE\_ARCHS = arm64
load(qt\_config)
```
It is important to add this line exactly after all `include()` directives and before `load(qt\_config)`.
After mentioned manipulation Qt is ready to be configured and compiled for desired architecture. In case of compilation only for host, just omit the last option `-xplatform` (which value is the name of newly created mkspec) in suggested configure command, this option is required only in case of cross-compilation:
```
mkdir build-qt && cd build-qt
../qt5/configure -prefix $HOME/qbt/root -opensource -confirm-license -release -static -appstore-compliant -c++std c++17 -no-pch -I "$HOME/qbt/root/include" -L "$HOME/qbt/root/lib" -make libs -no-compile-examples -no-dbus -no-icu -qt-pcre -system-zlib -ssl -openssl-linked -no-cups -qt-libpng -qt-libjpeg -no-feature-testlib -no-feature-concurrent -platform macx-clang -xplatform macx-clang-arm64
```
Then just build and install it by issuing the following commands:
```
make -j$(sysctl -n hw.ncpu)
make install
```
Build process takes 10-20 minutes depending on hardware. All headers and binaries will be placed into yours `$HOME/qbt/root`.
## Building qBittorrent
[](#building-qbittorrent)
So, you went so far and the end is near: only the last step is left - to build qBittorrent itself. CMake is also used to build qBittorrent (as it was for libtorrent):
```
# it is assumed that qBittorrent repo was cloned
# replace 'qBittorrent' with your folder name containing qBittorrent sources
cmake -S qBittorrent -B build-qbittorrent \\
-D CMAKE\_VERBOSE\_MAKEFILE=ON \\
-D CMAKE\_PREFIX\_PATH="$HOME/qbt/src/boost\_1\_76\_0;$HOME/qbt/root" \\
-D CMAKE\_CXX\_STANDARD=17 -D CMAKE\_CXX\_EXTENSIONS=OFF \\
-D CMAKE\_CXX\_VISIBILITY\_PRESET=hidden -D CMAKE\_VISIBILITY\_INLINES\_HIDDEN=ON \\
-D CMAKE\_OSX\_DEPLOYMENT\_TARGET=10.14 \\
-D CMAKE\_OSX\_ARCHITECTURES=arm64 \\
-D CMAKE\_BUILD\_TYPE=Release
cmake --build build-qbittorrent -j$(sysctl -n hw.ncpu)
```
`CMAKE\_CXX\_STANDARD` and `CMAKE\_OSX\_DEPLOYMENT\_TARGET` must be set according to qBittorrent requirements.
`CMAKE\_OSX\_ARCHITECTURES` is set to 'arm64' is this particular example, set it to required architecture or even omit in case of building just for host.
So, now you should ready to use qBittorrent application bundle at `build-qbittorrent/qbittorrent.app`. You can just launch it in place or drop into your /Applications folder (if app architecture matches your host) or create .dmg image file for transferring it to another machine or just for future usage:
```
cd build-qbittorrent
hdiutil create -srcfolder qbittorrent.app -nospotlight -layout NONE -fs HFS+ -format ULFO -ov qbittorrent.dmg
```
Happy building!
## About this document
[](#about-this-document)
As afterwards, it is worth to mention how this document is appeared. Someday on qBittorrent GitHub page author found an issue requesting Apple M1 support. That days an author already had suitable hardware (MacBook Pro 13 M1 2020) got from his office due to work responsibilities and decided to try to build qBittorrent on it... And that worked! Later he found the way to do cross-compilation to make it possible to get arm64 binaries using x86\_64 host. This guide is result of that research and almost completely repeats the authors steps made this possible, but in much cleaner way. Also there is the [script](https://gist.github.com/Kolcha/3ccd533123b773ba110b8fd778b1c2bf) allowing to build qBittorrent master branch for desired architecture in "fully automatic mode". Script was also written by the same author as this guide.
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