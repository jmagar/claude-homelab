Compilation Alpine Linux · qbittorrent/qBittorrent Wiki · GitHub
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
# Compilation Alpine Linux
[Jump to bottom](#wiki-pages-box)
Userdocs edited this page Nov 23, 2024
&middot;
[4 revisions](/qbittorrent/qBittorrent/wiki/Compilation-Alpine-Linux/_history)
# Alpine Linux build instructions
[](#alpine-linux-build-instructions)
This guide will help you install qBittorrent on Alpine Linux
Note
* This guide should work in any [Alpine arch](http://dl-cdn.alpinelinux.org/alpine/latest-stable/main) as long as the required [packages dependencies](https://pkgs.alpinelinux.org) are available to install for that arch. This guide was tested on `x86\_64`
* This guide will install qBittorrent and dependencies using shared libraries. At the point of writing this guide the latest version of Alpine is `3.20`
* Check out the [common information](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-with-CMake-common-information) page to learn more about the available build configuration options for qBittorrent (for example, to compile qBittorrent without the GUI) and also CMake itself, if you're new to it.
Important
The majority of these commands are copy and paste but some can be modified. For example, in the libtorrent section there is a choice between libtorrent `v1` or `v2`. Check the notes and commented commands for more information.
## Build dependencies
[](#build-dependencies)
These are the build dependencies we need to install using `apk`
```
apk add build-base cmake curl git linux-headers ninja-build ninja-is-really-ninja python3 re2c tar xz
```
## Application dependencies
[](#application-dependencies)
These are application dependencies we need to install using `apk`
Warning
If you are using a desktop and want the GUI for qBittorrent, you will need to append the dependency `qt6-qtsvg-dev` to the command below
```
apk add icu-dev openssl-dev qt6-qtbase-dev qt6-qttools-dev zlib-dev
```
## Boost build files
[](#boost-build-files)
Tip
This command should provide the latest non beta release info from Github
* `curl -sL https://api.github.com/repos/boostorg/boost/releases | jq -r 'map(.name | select(test("boost-[\\\\d\\\\.]+$"))) | first'`
You can view all the tags for the boost Github repository here:
* [https://github.com/boostorg/boost/tags](https://github.com/boostorg/boost/tags)
Download and extract the boost files.
Note
All we need to bootstrap boost is to download and extract the files. There is nothing to build at this step.
Bootstrap boost dev files
```
mkdir -p \~/boost-dev
curl -L https://github.com/boostorg/boost/releases/latest/download/boost-1.86.0-b2-nodocs.tar.xz -o \~/boost.tar.xz
tar xf \~/boost.tar.xz --strip-components=1 -C \~/boost-dev
```
## Libtorrent
[](#libtorrent)
Download and build libtorrent by checking out the `RC\_1\_2` branch. You can also change the `git checkout` command filter `"v1\*"` to `"v2\*"` to use the latest version of a specific tag
Tip
Any tag can be used to checkout the version you want - [https://github.com/arvidn/libtorrent/tags](https://github.com/arvidn/libtorrent/tags)
```
git clone --shallow-submodules --recurse-submodules https://github.com/arvidn/libtorrent.git \~/libtorrent && cd \~/libtorrent
# git checkout "$(git tag -l --sort=-v:refname | awk '/v2/' | head -1)" # always checkout the latest release of libtorrent v2
git checkout "$(git tag -l --sort=-v:refname | awk '/v1/' | head -1)" # always checkout the latest release of libtorrent v1
cmake -Wno-dev -G Ninja -B build \\
-D CMAKE\_BUILD\_TYPE="Release" \\
-D CMAKE\_CXX\_STANDARD=20 \\
-D BOOST\_INCLUDEDIR="$HOME/boost-dev/" \\
-D CMAKE\_INSTALL\_LIBDIR="lib" \\
-D CMAKE\_INSTALL\_PREFIX="/usr/local"
cmake --build build
cmake --install build
```
## qBittorrent
[](#qbittorrent)
Build and install qBittorrent
Tip
Any tag can be used to checkout the version you want - [https://github.com/qbittorrent/qBittorrent/tags](https://github.com/qbittorrent/qBittorrent/tags)
Warning
You are most likely not using a GUI (desktop) with Alpine, so remember we pass `-D GUI=OFF`.
Removing `-D GUI=OFF` will build the desktop version `qbittorrent` instead of the cli `qbittorrent-nox`
qBittorrent v5 made Qt6 the default and removed support for Qt5 builds.
To manually set the Qt used for v4 or earlier you can used this `cmake` option `-D QT6=ON` or `-D QT6=OFF`
This command will build qBittorrent `v5` with Libtorrent `v1.2` using `Qt6`, the defaults at the time of this guide.
```
git clone --shallow-submodules --recurse-submodules https://github.com/qbittorrent/qBittorrent.git \~/qbittorrent && cd \~/qbittorrent
git checkout "$(git tag -l --sort=-v:refname | awk '!/[0-9][a-zA-Z]/' | head -1)" # always checkout the latest release of qbittorrent
cmake -Wno-dev -G Ninja -B build \\
-D CMAKE\_BUILD\_TYPE="release" \\
-D CMAKE\_CXX\_STANDARD=20 \\
-D BOOST\_INCLUDEDIR="$HOME/boost-dev/" \\
-D CMAKE\_INSTALL\_PREFIX="/usr/local" \\
-D GUI=OFF
cmake --build build
cmake --install build
```
## Run the binary
[](#run-the-binary)
You can now run `qbittorrent` or `qbittorrent-nox` as it will be in the path.
Desktop version: `-D GUI=ON`
```
qbittorrent
```
cli version: `-D GUI=OFF`
```
qbittorrent-nox
```
## Post installation
[](#post-installation)
Tidy up: Delete the downloaded build files and folders
```
cd && rm -rf qbittorrent libtorrent boost-dev \~/boost.tar.xz
```
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