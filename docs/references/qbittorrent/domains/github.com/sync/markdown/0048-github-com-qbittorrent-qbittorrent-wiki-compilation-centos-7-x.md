Compilation CentOS 7.x · qbittorrent/qBittorrent Wiki · GitHub
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
# Compilation CentOS 7.x
[Jump to bottom](#wiki-pages-box)
Chocobo1 edited this page May 1, 2024
&middot;
[2 revisions](/qbittorrent/qBittorrent/wiki/Compilation-CentOS-7.x/_history)
This how-to will guide you though the compilation of qBittorrent and
`libtorrent-rasterbar`.
This guide is written for CentOS 7.x, but the process should be similar
for other RHEL distributions.
# Required dependencies
[](#required-dependencies)
## General required dependencies
[](#general-required-dependencies)
```
sudo yum groupinstall "Development Tools"
sudo yum install devtoolset-8-gcc devtoolset-8-gcc-c++
sudo yum install qt-devel openssl-devel qt5-qtbase-devel qt5-linguist
```
## Boost
[](#boost)
[Download](https://www.boost.org/users/download/) latest version of
Boost. (Actually 1.72.0)
`wget https://dl.bintray.com/boostorg/release/1.72.0/source/boost\_1\_72\_0.tar.gz`
## Qt libraries
[](#qt-libraries)
qBittorrent 4.0 - 4.1.x requires at least Qt 5.5.1, and qBittorrent 4.2
and later requires at least Qt 5.9.
Check installed version:
```
$ rpm -qa | grep qt5-qtbase
qt5-qtbase-common-5.9.7-2.el7.noarch
qt5-qtbase-gui-5.9.7-2.el7.x86\_64
qt5-qtbase-5.9.7-2.el7.x86\_64
qt5-qtbase-devel-5.9.7-2.el7.x86\_64
```
## Libtorrent
[](#libtorrent)
[Libtorrent](https://libtorrent.org/) is a library written by Arvid Norberg that qBittorrent depends on.
It is necessary to compile and install `libtorrent` before compiling qBittorrent.
### Boost
[](#boost-1)
Change devtoolsset if you didn't do that already: `scl enable devtoolset-8 bash`
Compile:
```
export DIR\_BOOST="/opt/boost"
tar -xvf boost\_1\_72\_0.tar.gz
cd boost\_1\_72\_0
./bootstrap.sh --prefix=${DIR\_BOOST}
./b2 install --prefix=${DIR\_BOOST} --with=all -j$(( $(nproc) - 1 ))
```
### Libtorrent
[](#libtorrent-1)
Change devtoolsset if you didn't do that already: `scl enable devtoolset-8 bash`
Clone from the repository: `git clone --depth 1 -b RC\_1\_2 https://github.com/arvidn/libtorrent.git`
If you need to build deluge,you must run the following command:
```
yum -y install python-devel boost-devel
```
Compile:
```
cd libtorrent
./autotool.sh
# Only compiled for qbittorrent:
./configure --prefix=/usr --disable-debug --enable-encryption --with-boost=${DIR\_BOOST} CXXFLAGS=--std=c++14
# Compiling for both qbittorrent and deluge:
./configure --prefix=/usr --disable-debug --enable-encryption --with-boost=${DIR\_BOOST} CXXFLAGS=--std=c++14 --with-libiconv --with-libgeoip=system --enable-python-binding
make -j$(( $(nproc) - 1 ))
make install
ln -s /usr/lib/pkgconfig/libtorrent-rasterbar.pc /usr/lib64/pkgconfig/libtorrent-rasterbar.pc
```
**Last command was missing and on 64bit systems will fail without it.Here is the error information:**
```
checking for libtorrent... no
configure: error: Package requirements (libtorrent-rasterbar \>= 1.0.6) were not met:
No package 'libtorrent-rasterbar' found
Consider adjusting the PKG\_CONFIG\_PATH environment variable if you
installed software in a non-standard prefix.
Alternatively, you may set the environment variables libtorrent\_CFLAGS
and libtorrent\_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.
```
# Compiling qBittorrent (without the GUI)
[](#compiling-qbittorrent-without-the-gui)
First, obtain the qBittorrent source code.
Either download and extract a `.tar` archive from [the GitHub releases page](https://github.com/qbittorrent/qBittorrent/releases) or clone the git repository: `git clone --depth 1 -b v4\_2\_x https://github.com/qbittorrent/qBittorrent`
Change devtoolsset if you didn't do that already: `scl enable devtoolset-8 bash`
Compile:
```
cd qBittorrent
./configure --prefix=/usr --disable-gui CPPFLAGS=-I/usr/include/qt5 --with-boost=${DIR\_BOOST} CXXFLAGS=--std=c++14
make -j$(( $(nproc) - 1 ))
make install
```
Since you disabled the graphical user interface, qBittorrent can only be controlled via its WebUI.
By default, you can access it at `http://localhost:8080` with the default credentials:
```
Username: admin
Password: adminadmin
```
Documentation about running qBittorrent without GUI is available [here](https://github.com/qbittorrent/qBittorrent/wiki/Running-qBittorrent-without-X-server-(WebUI-only)).
To set up qbittorrent as a daemon see [this guide](https://github.com/qbittorrent/qBittorrent/wiki/Setting-up-qBittorrent-as-a-daemon-on-CentOS-7)
# Troubleshooting
[](#troubleshooting)
If are you facing a problem like this:
```
qbittorrent-nox: error while loading shared libraries: libtorrent-rasterbar.so 10: cannot open shared object file: No such file or directory
```
This often happened when you are using 64-bit CentOS 7.x.
And it's because of the libraries that the qBittorrent need are not in `/usr/lib64/`.
You can simply create a soft link to solve it. Do it like this:
```
ln -s /usr/lib/libtorrent-rasterbar.so.10 /usr/lib64/libtorrent-rasterbar.so.10
```
For missing `libboost\_system.so.1.72.0`:
```
ln -s /opt/boost/lib/libboost\_system.so.1.72.0 /usr/lib64/libboost\_system.so.1.72.0
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