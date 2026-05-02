Compilation Raspberry Pi OS and DietPi · qbittorrent/qBittorrent Wiki · GitHub
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
# Compilation Raspberry Pi OS and DietPi
[Jump to bottom](#wiki-pages-box)
Chocobo1 edited this page May 1, 2024
&middot;
[3 revisions](/qbittorrent/qBittorrent/wiki/Compilation-Raspberry-Pi-OS-and-DietPi/_history)
[Raspberry Pi OS](https://www.raspberrypi.org/software/) is the most popular Linux distribution built for Raspberry Pi hardware.
[DietPi](https://dietpi.com/) is a refined Linux distribution for ARM SoCs such as Raspberry Pi 3 B+ and ASUS Tinker Board.
Both are based on Debian. Debian 9.0 ships with a patched version of an older qBittorrent-nox release (4.1.5). qBittorrent 4.3.x has many improvements to the webUI component which are of particular use for headless operation for example RSS handling.
This guide outlines the steps needed to compile qBittorrent-nox 4.3.x and run it as a service. Both DietPi and Raspberry Pi OS provide pre-compiled qBittorrent using either `dietpi-software` or `apt`. Use this guide if you want to run the most recent qBittorrent (and libtorrent-rasterbar).
This guide was made possible by the authors of the [Debian/Ubuntu compilation guide](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Debian-and-Ubuntu) and [Guide on running qBittorrent as a service](https://github.com/qbittorrent/qBittorrent/wiki/Setting-up-qBittorrent-on-Ubuntu-server-as-daemon-with-Web-interface-(15.04-and-newer)). A few DietPi-specific amendments are included.
# Table of Contents
[](#table-of-contents)
* [Dependencies](#dependencies)
* [Compiling Libtorrent](#compiling-libtorrent)
* [Get the source code](#get-the-source-code)
* [A. `git clone` from repository](#a-git-clone-from-repository)
* [B. Download the latest release](#b-download-the-latest-release)
* [Compile Libtorrent](#compile-libtorrent)
* [Add Libtorrent as a system library](#add-libtorrent-as-a-system-library)
* [Compiling qBittorrent-nox](#compiling-qbittorrent-nox)
* [Get the source code](#get-the-source-code-1)
* [A. `git clone` from repository](#a-git-clone-from-repository-1)
* [B. Download the latest release](#b-download-the-latest-release-1)
* [Compile qBittorrent-nox](#compile-qbittorrent-nox)
* [Running qBittorrent-nox on boot](#running-qbittorrent-nox-on-boot)
* [Add user for qBittorrent-nox service](#add-user-for-qbittorrent-nox-service)
* [Create systemd service file](#create-systemd-service-file)
* [Run and check systemd service status](#run-and-check-systemd-service-status)
* [Updating qBittorrent-nox](#updating-qbittorrent-nox)
* [Updating an already compiled version of qBittorrent-nox](#updating-an-already-compiled-version-of-qBittorrent-nox)
* [Checking the version to verify that the binary got updated](#checking-the-version-to-verify-that-the-binary-got-updated)
# Dependencies
[](#dependencies)
You will first need to install various tools and libraries needed for compilation.
```
`sudo apt install build-essential pkg-config automake libtool libc6-dev libboost-dev libboost-system-dev libboost-chrono-dev libboost-random-dev libssl-dev qtbase5-dev qttools5-dev-tools libqt5svg5-dev zlib1g-dev
`
```
If you choose to retrieve source code using `git clone`, then also `sudo apt install git`.
# Compiling Libtorrent
[](#compiling-libtorrent)
DietPi's and Raspberry Pi OS's repositories include older versions of [Libtorrent](https://libtorrent.org/). You will need to compile Libtorrent 1.2.x to get qBittorrent-nox 4.2.x running. Both methods below outline how to install Libtorrent 1.2.x for use with qBittorrent-nox 4.3.x (and likely later versions).
## Get the source code
[](#get-the-source-code)
Two versions of Libtorrent are currently maintained: 1.2.x and 2.0.x.
Since release 4.2.0, qBittorrent makes use of the 1.2.x version, so get the 1.2.x release.
To get the Libtorrent source code, either:
A. `git clone ...`
B. `wget ...`
### A. `git clone` from repository
[](#a-git-clone-from-repository)
```
`git clone https://github.com/arvidn/libtorrent.git
cd libtorrent
# select the latest release tag
git checkout $(git tag | grep v1\\.2.\\. | sort -t \_ -n -k 3 | tail -n 1)
`
```
### B. Download the [latest release](https://github.com/arvidn/libtorrent/releases)
[](#b-download-the-latest-release)
```
`wget https://github.com/arvidn/libtorrent/archive/libtorrent-1\_2\_14.zip
unzip libtorrent-1\_2\_14.zip
cd libtorrent-libtorrent-1\_2\_14
`
```
## Compile Libtorrent
[](#compile-libtorrent)
```
`./autotool.sh
./configure --with-boost-libdir=/usr/lib/arm-linux-gnueabihf --with-libiconv CXXFLAGS="-std=c++17"
make -j$(nproc)
sudo make install
`
```
#### out of memory (OOM)
[](#out-of-memory-oom)
If OOM errors occur, add a swap file.
```
`sudo dd if=/dev/zero of=/.swapfile bs=1M count=1024
sudo mkswap /.swapfile
sudo swapon /.swapfile
sudo swapon -s # check swap is activated
make
# assuming the prior command succeeded
sudo swapoff /.swapfile
sudo rm /.swapfile
`
```
(Those commands were copied from [here](https://dev.deluge-torrent.org/wiki/Building/libtorrent#TemporarySwapFileforRasperryPiorlowmemorysystems).)
One example manifestation of an OOM error on Raspberry Pi OS looks like:
```
`$ make
...
make[1]: Entering directory '/tmp/libtorrent-libtorrent\_1\_2\_0/src'
CXX libtorrent\_rasterbar\_la-session\_impl.lo
g++: internal compiler error: Killed (program cc1plus)
`
```
## Add Libtorrent as a system library
[](#add-libtorrent-as-a-system-library)
You will need to add Libtorrent as a system library or qBittorrent-nox won't run after you compile it.
Create a file `sudo nano /etc/ld.so.conf.d/libtorrent.conf` with contents `/usr/local/lib`.
Run `sudo ldconfig` afterward.
Check if your `LD\_LIBRARY\_PATH` environment variable is set and the path `/usr/local/lib` is included: run `env` in your terminal and look for `LD\_LIBRARY\_PATH`.
If so, you are good to go. If not, add the path to the variable: `export LD\_LIBRARY\_PATH=/usr/local/lib:${LD\_LIBRARY\_PATH}`
# Compiling qBittorrent-nox
[](#compiling-qbittorrent-nox)
## Get the source code
[](#get-the-source-code-1)
To get the qBittorrent-nox source code, either:
A. `git clone ...`
B. `wget ...`
### A. `git clone` from repository
[](#a-git-clone-from-repository-1)
```
`git clone -b v4\_3\_x https://github.com/qbittorrent/qBittorrent
cd qBittorrent
`
```
You may select the branch version on the [branches page](https://github.com/qbittorrent/qBittorrent/branches).
### B. Download the [latest release](https://github.com/qbittorrent/qBittorrent/releases)
[](#b-download-the-latest-release-1)
```
`wget https://github.com/qbittorrent/qBittorrent/archive/release-4.3.5.zip
unzip release-4.3.5.zip
cd qBittorrent-release-4.3.5
`
```
## Compile qBittorrent-nox
[](#compile-qbittorrent-nox)
```
`./configure --disable-gui --enable-systemd --with-boost-libdir=/usr/lib/arm-linux-gnueabihf CXXFLAGS="-std=c++17"
make -j$(nproc)
sudo make install
`
```
NOTE: Review [Ubuntu/Debian compilation guide](https://github.com/qbittorrent/qBittorrent/wiki/Compiling-qBittorrent-on-Debian-and-Ubuntu#Compiling_qBittorrent_with_the_GUI) if you want to run qBittorrent with a GUI.
The binary should be located at `/usr/local/bin/qbittorrent-nox`. If `qbittorrent-nox` was installed using `apt` then that binary will be at `/usr/bin/qbittorrent-nox`. *Do not confuse them!*
**Web UI access information**
* *[http://localhost:8080](http://localhost:8080)*
* Username: *admin*
* Password: *adminadmin*
qBittorrent-nox is currently installed as a terminal application, which is not optimal for headless use. We now will add qBittorrent-nox as a service.
# Running qBittorrent-nox on boot
[](#running-qbittorrent-nox-on-boot)
## Add user for qBittorrent-nox service
[](#add-user-for-qbittorrent-nox-service)
For Raspberry Pi OS:
```
`sudo useradd -rm qbittorrent -G pi -s /usr/sbin/nologin
`
```
For DietPi:
```
`sudo useradd -rm qbittorrent -G dietpi -s /usr/sbin/nologin
`
```
## Create systemd service file
[](#create-systemd-service-file)
*UPDATE:* this **may** not be necessary if qBittorrent compilation was configured with flag `--enable-systemd`.
Create a systemd service file `sudo nano /etc/systemd/system/qbittorrent.service`.
Contents for Raspberry Pi OS:
```
`Description=qBittorrent Daemon Service
After=network.target
[Service]
User=qbittorrent
Group=pi
ExecStart=/usr/local/bin/qbittorrent-nox
ExecStop=/usr/bin/killall -w qbittorrent-nox
[Install]
WantedBy=multi-user.target
`
```
Contents for DietPi:
```
`Description=qBittorrent Daemon Service
After=network.target
[Service]
User=qbittorrent
Group=dietpi
ExecStart=/usr/local/bin/qbittorrent-nox
ExecStop=/usr/bin/killall -w qbittorrent-nox
[Install]
WantedBy=multi-user.target
`
```
## Run and check systemd service status
[](#run-and-check-systemd-service-status)
```
`sudo systemctl daemon-reload
sudo systemctl start qbittorrent
sudo systemctl status qbittorrent
`
```
The `systemctl status` command should show qBittorrent-nox is `active (running)`.
Enable `qbittorrent` service during boot: `sudo systemctl enable qbittorrent`.
# Updating qBittorrent-nox
[](#updating-qbittorrent-nox)
## Updating an already compiled version of qBittorrent-nox
[](#updating-an-already-compiled-version-of-qbittorrent-nox)
Get the latest version of qBittorrent using instructions outlined above (git/wget).
Navigate to the qBittorrent directory with the latest release.
```
`sudo systemctl stop qbittorrent
./configure --disable-gui --enable-systemd --with-boost-libdir=/usr/lib/arm-linux-gnueabihf CXXFLAGS="-std=c++17"
make -j$(nproc)
sudo make install
`
```
## Checking the version to verify that the binary got updated
[](#checking-the-version-to-verify-that-the-binary-got-updated)
```
`sudo systemctl stop qbittorrent
/usr/local/bin/qbittorrent-nox --version
`
```
If the version has changed then the new version was successfully compiled and installed!
Restart the `qbittorrent` service: `sudo systemctl start qbittorrent`.
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