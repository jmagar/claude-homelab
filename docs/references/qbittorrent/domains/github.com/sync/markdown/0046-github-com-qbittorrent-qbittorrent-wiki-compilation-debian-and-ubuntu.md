Compilation Debian and Ubuntu · qbittorrent/qBittorrent Wiki · GitHub
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
# Compilation Debian and Ubuntu
[Jump to bottom](#wiki-pages-box)
Chocobo1 edited this page Jun 12, 2024
&middot;
[3 revisions](/qbittorrent/qBittorrent/wiki/Compilation-Debian-and-Ubuntu/_history)
This how-to will guide you through compiling both qBittorrent and optionally its backend, `libtorrent-rasterbar` (referred to only as `libtorrent` for the rest of the document) from source.
Only follow this guide if you know what you are doing and this is what you really want.
If you just want the latest version of qBittorrent, use our [stable](https://launchpad.net/~qbittorrent-team/+archive/ubuntu/) or [unstable](https://launchpad.net/~qbittorrent-team/+archive/ubuntu/qbittorrent-unstable) PPAs.
This guide is written for Debian/Ubuntu, but the process should be the same or similar for other Debian-derivative distributions.
If you run into trouble or errors at any step, check the Troubleshooting section at the bottom of the page first before posting an issue report.
# Dependencies
[](#dependencies)
## Boost and other build dependencies
[](#boost-and-other-build-dependencies)
You need to install these packages in order to be able to compile qBittorrent from source.
```
sudo apt install build-essential pkg-config automake libtool git zlib1g-dev libssl-dev libgeoip-dev
sudo apt install libboost-dev libboost-system-dev libboost-chrono-dev libboost-random-dev
```
If you want, you can install the Boost libraries from source instead of installing them from the distro's repositories. This is quite easy to do, but generally does not make that much of a difference and is out of the scope of this guide.
## Runtime-only dependencies
[](#runtime-only-dependencies)
qBittorrent has a runtime-only dependency on Python 3 for its search engine functionality. Old enough versions also supported Python 2, but this has long since been deprecated.
```
sudo apt install python3
```
## Qt libraries
[](#qt-libraries)
qBittorrent uses the Qt framework as the basis for its GUI.
qBittorrent 4.0 - 4.1.x requires at least Qt 5.5.1, and qBittorrent 4.2 and later requires at least Qt 5.9.
For Debian 10, Ubuntu 18.04 LTS or later, just install Qt from the official repositories:
```
sudo apt install qtbase5-dev qtbase5-private-dev qttools5-dev libqt5svg5-dev
```
Note that Qt libraries in Debian 8/9 repository are too old for compiling newer qBittorrent versions, so you need to install newer Qt libraries some other way.
If you are using Ubuntu 16.04 LTS, you could add [this PPA](https://launchpad.net/~beineri/+archive/ubuntu/opt-qt597-xenial) for Qt 5.9 support:
```
sudo add-apt-repository ppa:beineri/opt-qt597-xenial
sudo apt update
sudo apt install qt59base qt59svg qt59tools
export PATH=/opt/qt59/bin:$PATH
export PKG\_CONFIG\_PATH=/opt/qt59/lib/pkgconfig:$PKG\_CONFIG\_PATH
```
Alternatively, you could of course compile Qt version of your choosing from source. However, only do this if you have a *very* good reason to do so.
## libtorrent
[](#libtorrent)
qBittorrent uses the [libtorrent](https://libtorrent.org/) library by Arvid Norberg as the backend.
It is necessary to compile and install `libtorrent` before compiling qBittorrent.
It is possible to install the `libtorrent` development package directly from the distro's repositories:
```
sudo apt install libtorrent-rasterbar-dev
```
but the version may not be the most recent or exactly the one you want.
Alternatively, you can compile it yourself.
First, clone the `libtorrent` repository:
```
git clone https://github.com/arvidn/libtorrent.git
cd libtorrent
```
To compile, first choose the appropriate `git` and compile commands in the table below, according to the version of `libtorrent` you need, then run them:
|
libtorrent version series
|
qBittorrent version support
|
git command (example with most recent tag in series at the time of writing)
|
Compile commands - after running the git command, choose between using CMake (recommended) *or* autotools
|
|
|
CMake
|
autotools
|
|
1.2.x
|
\>= 4.2.0
|
```
`git checkout libtorrent-1\_2\_5`
```
|
```
`cmake -B cmake-build-dir/release -DCMAKE\_BUILD\_TYPE=Release -DCMAKE\_CXX\_STANDARD=14
cmake --build cmake-build-dir/release`
```
|
```
`./autotool.sh
./configure --disable-debug --enable-encryption CXXFLAGS="-std=c++14"
make clean && make -j$(nproc)`
```
|
|
1.1.x
|
\>= 3.3.8 and \<4.2.0 (\*)
|
```
`git checkout libtorrent-1\_1\_14`
```
|
```
`cmake -B cmake-build-dir/release -DCMAKE\_BUILD\_TYPE=Release
cmake --build cmake-build-dir/release`
```
|
```
`./autotool.sh
./configure --disable-debug --enable-encryption
make clean && make -j$(nproc)`
```
|
|
1.0.x
|
\<= 4.1.5
|
```
`git checkout libtorrent-1\_0\_11`
```
|
(\*) Technically, the 4.2.x releases actually support the 1.1.x `libtorrent` series, but it is just life support and not properly tested/developed.
Finally, you can install `libtorrent`.
* If building with CMake:
`sudo cmake --install cmake-build-dir/release`
This generates an `install\_manifest.txt` file in the build folder that can later be used to uninstall all installed files with `sudo xargs rm \< install\_manifest.txt`. The default installation prefix is `/usr/local`, as expected.
* If building with `autotools`:
If you have `checkinstall`, the following command will generate and install a `.deb` package that can be tracked and managed by your package manager:
```
sudo checkinstall --nodoc --backup=no --deldesc --pkgname libtorrent-rasterbar --pkgversion 1.x.x-source-compile # change the version to your liking
```
Alternatively, the traditional way will do just fine (but there is no tracking of the installed files):
```
sudo make install
```
For more information on building libtorrent, see [libtorrent downloading and building](https://www.libtorrent.org/building.html).
# Compiling qBittorrent (with the GUI)
[](#compiling-qbittorrent-with-the-gui)
First, obtain the qBittorrent source code.
Either download and extract a `.tar` archive from [the GitHub releases page](https://github.com/qbittorrent/qBittorrent/releases) or clone the `git` repository:
```
git clone https://github.com/qbittorrent/qBittorrent
```
If you clone the git repository, you can use the `master` branch, which contains the current development version, or checkout a specific release tag:
```
git checkout release-4.2.5
```
Open the folder in a terminal window and run this to configure the build:
```
./configure CXXFLAGS="-std=c++14"
```
Once that finishes successfully, run:
```
make -j$(nproc)
```
Finally, you can install qBittorrent:
If you have `checkinstall`, the following command will generate and install a `.deb` package that can be tracked and managed by your package manager:
```
sudo checkinstall --nodoc --backup=no --deldesc --pkgname qbittorrent --pkgversion 4.x.x-source-compile # change the version to your liking
```
Alternatively, the traditional way will do just fine:
```
sudo make install
```
That's it! qBittorrent is now installed. You should now be able to run it from the terminal or the installed shortcuts.
# Compiling qBittorrent (without the GUI; aka qBittorrent-nox aka headless)
[](#compiling-qbittorrent-without-the-gui-aka-qbittorrent-nox-aka-headless)
The steps are almost all the same as the GUI version except for the configure step, where you should add the `--disable-gui` flag to it, like so:
```
./configure CXXFLAGS="-std=c++14" --disable-gui
```
It is also recommended that you name the package `qbittorrent-nox` instead of `qbittorrent` if you use the checkinstall` method for installing.
That's it! qBittorrent headless is now installed. You should now be able to run it from the terminal with `qbittorrent-nox`.
Since you've disabled the graphical user interface, qBittorrent can only be controlled via its WebUI. By default, it can be accessed at `http://localhost:8080` with the following credentials, after accepting the legal disclaimer that's presented the first time you run the program:
```
Username: admin
Password: adminadmin
```
Documentation about running qBittorrent without GUI is available [here](https://github.com/qbittorrent/qBittorrent/wiki/Running-qBittorrent-without-X-server-(WebUI-only)).
# Troubleshooting
[](#troubleshooting)
## Compiling (generic)
[](#compiling-generic)
* In the `make` command, the `-j$(nproc)` flag makes the number of build jobs equal to the number of hardware threads available. To see the actual value your system is using, run `echo $(nproc)` in a terminal. You could also manually specify a value like so: `-j5`. Higher values may make the build faster, but an eye must be kept on the memory usage.
## Compiling `libtorrent`
[](#compiling-libtorrent)
* If you get a `configure: error: Boost.System library not found`, check if you installed all the above dependencies.
If so, also pass the `--with-boost-libdir=/usr/lib/i386-linux-gnu` to the `./configure`
## Compiling qBittorrent
[](#compiling-qbittorrent)
* If you're using `libtorrent-rasterbar` from the 0.16.x series, you also need to pass the `--with-libtorrent-rasterbar0.16` option to configure. qBittorrent v3.3.x has dropped the support of libtorrent 0.16.x.
* If you want to compile with Qt4 instead of qt5, you also need to pass the `--with-qt4` option to configure. qBittorrent v4.0.x has dropped support for Qt4
## Running qBittorrent
[](#running-qbittorrent)
If you get an error similar to `qbittorrent: symbol lookup error: qbittorrent: undefined symbol:`
Simply run:
ldconfig
The following method is too complex, but if you want to know what's going on, then you can read the following method (see [https://github.com/qbittorrent/qBittorrent/issues/8047](https://github.com/qbittorrent/qBittorrent/issues/8047)):
Check if your `LD\_LIBRARY\_PATH` environment variable is set and the path `/usr/local/lib` is included.
Simply run `env` in your terminal and look for `LD\_LIBRARY\_PATH`.
If so, you are good to go. If not, add the path to the variable:
```
export LD\_LIBRARY\_PATH=/usr/local/lib:${LD\_LIBRARY\_PATH}
```
## Notes
[](#notes)
* If you experience any problem with this how to, do not hesitate to contact sledgehammer999(at)qbittorrent(dot)org.
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