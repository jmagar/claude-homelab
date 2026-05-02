Compilation Debian, Ubuntu, and derivatives · qbittorrent/qBittorrent Wiki · GitHub
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
# Compilation Debian, Ubuntu, and derivatives
[Jump to bottom](#wiki-pages-box)
Leon Blakey edited this page Jun 6, 2025
&middot;
[3 revisions](/qbittorrent/qBittorrent/wiki/Compilation-Debian,-Ubuntu,-and-derivatives/_history)
# Introduction
[](#introduction)
**NOTE:** for qBittorrent revisions older than `63ff5e3` (2020-09-19), use the [legacy guide](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Debian-and-Ubuntu) instead.
This how-to will guide you through compiling qBittorrent from source on Debian, Ubuntu, and other derivative distros.
Only follow this guide if you know what you are doing and this is what you really want.
If you just want the latest version of qBittorrent, use our [stable](https://launchpad.net/~qbittorrent-team/+archive/ubuntu/qbittorrent-stable) or [unstable](https://launchpad.net/~qbittorrent-team/+archive/ubuntu/qbittorrent-unstable) PPAs.
# Install the dependencies
[](#install-the-dependencies)
## Boost and other miscellaneous build dependencies
[](#boost-and-other-miscellaneous-build-dependencies)
You need to install these packages in order to be able to compile qBittorrent from source:
```
sudo apt install build-essential cmake git ninja-build pkg-config libboost-dev libssl-dev zlib1g-dev libgl1-mesa-dev
```
## Qt libraries
[](#qt-libraries)
qBittorrent uses the Qt framework as the basis for its GUI.
* qBittorrent 5.1.x requires at least Qt 6.5.0.
* At the time of writing, the current `master` branch requires at least Qt 6.6.0.
Many distributions, in particular Debian, Ubuntu (especially LTS releases), and their derivatives don't provide up-to-date Qt packages in their repositories or are very slow in updating them.
In such cases, you must get them from somewhere else, such as the official installer from the [Qt website](https://www.qt.io/download-qt-installer) (unfortunately, this method requires the creation of an account, but you can just use a throwaway email), or a PPA you trust in the case of Ubuntu and other distributions that support that installation method.
For Debian and Ubuntu versions that include sufficiently up-to-date Qt packages, you can just install the following packages from the official repositories:
```
sudo apt install --no-install-recommends qt6-base-dev qt6-base-private-dev qt6-tools-dev qt6-svg-dev
```
## libtorrent
[](#libtorrent)
qBittorrent uses the [libtorrent](https://libtorrent.org/) library by Arvid Norberg (aka `libtorrent-rasterbar`) as the backend.
It is possible to install the `libtorrent` development package directly from the distro's repositories:
```
sudo apt install libtorrent-rasterbar-dev
```
but the version may not be the most recent or exactly the one you want.
Alternatively, you can compile `libtorrent` yourself. qBittorrent 4.2.x and above requires the 1.2.x series(\*).
qBittorrent 4.4.x requires minimum libtorrent 1.2.14 or 2.0.4.
```
git clone --recurse-submodules https://github.com/arvidn/libtorrent.git
cd libtorrent
git checkout RC\_2\_0 # or a 2.0.x tag
cmake -B build -DCMAKE\_BUILD\_TYPE=RelWithDebInfo -DCMAKE\_INSTALL\_PREFIX=/usr/local
cd build
ninja
sudo ninja install
```
The install step will install libtorrent to the chosen prefix (`/usr/local`, in this case), and generate an `install\_manifest.txt` file in the build folder that can later be used to uninstall all installed files with `sudo xargs rm \< install\_manifest.txt`.
For more information on building and installing libtorrent (such as the available build configuration options), read [the documentation](https://www.libtorrent.org/building.html).
(\*)Technically, 4.2.x releases up to, and including, 4.2.5, actually support the 1.1.x `libtorrent` series as well, but it is just life support and not properly tested/developed.
## Runtime-only dependencies
[](#runtime-only-dependencies)
qBittorrent has a runtime-only dependency on Python **3** for its search engine functionality:
```
sudo apt install python3
```
# Build qBittorrent
[](#build-qbittorrent)
Download and extract a `.tar` archive from [the GitHub releases page](https://github.com/qbittorrent/qBittorrent/releases) or clone the repository and checkout the branch/tag of your choice.
Then, configure and build with CMake:
```
cmake -G "Ninja" -B build -DCMAKE\_BUILD\_TYPE=RelWithDebInfo -DCMAKE\_INSTALL\_PREFIX=/usr/local
cmake --build build
```
Check out the [common information](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-with-CMake-common-information) page to learn more about the available build configuration options (for compiling without the GUI, for instance) and CMake itself, if you're new to it.
Once qBittorrent is built, you can run it straight from the build directory. Documentation about running qBittorrent without GUI is available [here](https://github.com/qbittorrent/qBittorrent/wiki/Running-qBittorrent-without-X-server-(WebUI-only)).
## Installing (optional)
[](#installing-optional)
To install qBittorrent to the prefix chosen at configure-time:
```
`sudo cmake --install build
`
```
This will generate an `install\_manifest.txt` file in the build folder that can later be used to uninstall all the installed files with `sudo xargs rm \< install\_manifest.txt`. To override the installation prefix at install-time, pass `--prefix \<install\_prefix\>`.
Patches are welcome to implement Debian package generation with CPack.
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