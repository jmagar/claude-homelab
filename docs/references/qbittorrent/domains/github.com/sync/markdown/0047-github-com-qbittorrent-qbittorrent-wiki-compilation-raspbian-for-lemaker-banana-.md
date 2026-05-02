Compilation Raspbian for LeMaker Banana Pro · qbittorrent/qBittorrent Wiki · GitHub
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
# Compilation Raspbian for LeMaker Banana Pro
[Jump to bottom](#wiki-pages-box)
Chocobo1 edited this page May 1, 2024
&middot;
[3 revisions](/qbittorrent/qBittorrent/wiki/Compilation-Raspbian-for-LeMaker-Banana-Pro/_history)
This how-to will guide you through the **compilation** of **qBittorrent** and **libtorrent-rasterbar** on **LeMaker Banana Pro** with **Raspbian** as Operative System.
This guide is written for Raspbian *(which is based upon Debian)* and BananaPRO, but the process should be similar for BananaPi and other Debian distributions.
Please continue following this guide only if you have a minimum knowledge of what are you going to do, and only if this is what you really want.
If you are looking only for the latest version of qBittorrent, just head to the download page and use our PPAs.
# Required dependencies
[](#required-dependencies)
* General required dependencies
`sudo apt-get install libboost-dev libboost-system-dev`
* Qt4 libraries
`sudo apt-get install libqt4-dev`
*[ at the time of this writing, Qt5 libraries were not available for Raspbian on B-Pro. You can safely compile QBitTorrent against Qt4 Libraries. ]*
* Python *(Run time only dependency, needed by the search engine)*
`sudo apt-get install python`
# Optional dependencies
[](#optional-dependencies)
* Geoip Database *(For peer country resolution, strongly advised)*
` sudo apt-get install geoip-database`
# Libtorrent
[](#libtorrent)
[Libtorrent](https://www.libtorrent.org) is a library written by Arvid Norberg that qBittorrent depends on. It is necessary to compile and install libtorrent before compiling qBittorrent.
Default Raspbian distro packages a very old *(and very unstable)* version of libtorrent, hence you will need to compile it yourself.
### Notes:
[](#notes)
The procedure for compiling and installing Libtorrent on B-Pro is derived from the [Deluge Wiki](https://dev.deluge-torrent.org/wiki/Building/libtorrent): some minor adjustments have been made to the procedure in order to work correctly on B-Pro.
## Install dependencies for libtorrent build automatically, using build-dep:
[](#install-dependencies-for-libtorrent-build-automatically-using-build-dep)
```
`sudo apt-get build-dep libtorrent-rasterbar
sudo apt-get install checkinstall
`
```
Your system could be configured with some option that might interfere with checkinstall.
If previous installation fails then proceed manually:
```
`sudo apt-get install build-essential checkinstall libboost-system-dev libboost-python-dev libssl-dev libgeoip-dev
`
```
## Download ​libtorrent and extract:
[](#download-libtorrent-and-extract)
` wget https://github.com/arvidn/libtorrent/releases/download/libtorrent\_1\_1\_11/libtorrent-rasterbar-1.1.11.tar.gz`
`tar xf libtorrent-rasterbar-1.0.10.tar.gz`
`cd libtorrent-rasterbar-1.0.10`
## Configure:
[](#configure)
`./configure --enable-python-binding --with-libgeoip --with-libiconv --with-qt4`
## WARNING: Users with Debian 8 "Jessie" or "Stretch"
[](#warning-users-with-debian-8-jessie-or-stretch)
If you have updated your Raspbian to the latest version "Jessie" then you will most certainly face an error with *libboost library* while using the .*/configure*
To overcome this error and configure correctly you must issue the following commands:
```
`sudo apt-get install libboost-chrono-dev libboost-random-dev
./configure --enable-python-binding --with-libgeoip --with-libiconv --with-boost-libdir=/usr/lib/arm-linux-gnueabihf
`
```
## Build:
[](#build)
`make -j$(nproc)`
*[The make option -j$(nproc) will utilize all available cpu cores.]*
## Install library and python bindings:
[](#install-library-and-python-bindings)
`sudo checkinstall`
*[ The `checkinstall `command replaces the `make install`. It created a DEB Package for easier removal/re-install through dpkg. ]*
`sudo ldconfig`
*[Running `ldconfig` avoids an ImportError for libtorrent-rasterbar.so, a result of Python being unable to find the main library.]*
# Compiling qBittorrent (with the GUI)
[](#compiling-qbittorrent-with-the-gui)
Now that each prerequisite has been completed you mut obtain the qBittorrent source code.
Either download and extract a .tar archive from [Sourceforge](https://sourceforge.net/projects/qbittorrent/files/qbittorrent/) or use the following commands to speed-up the process.
` git clone https://github.com/qbittorrent/qBittorrent`
## Configure qBittorrent
[](#configure-qbittorrent)
## WARNING: Users with Debian 8 "Jessie"
[](#warning-users-with-debian-8-jessie)
If you have updated your Raspbian to the latest version "Jessie" then you will most certainly face an error with *libboost library* while using the .*/configure*
To overcome this error and configure correctly you must issue the following commands:
```
`sudo apt-get install libboost-dev-all
./configure --enable-python-binding --with-libgeoip --with-libiconv --with-boost-libdir=/usr/lib/arm-linux-gnueabihf --with-qt4
`
```
`cd qBittorrent/`
`./configure --prefix=/usr --with-qt4`
`make`
## Install qBittorrent:
[](#install-qbittorrent)
`sudo checkinstall`
*[alternatively you can use the standard command `make install`, as discussed before]*
**That's it! qBittorrent should now be installed.** You can now run qBittorrent using the following command:
`qbittorrent`
# Compiling qBittorrent-NOX *(aka Without the GUI, also called headless)*
[](#compiling-qbittorrent-nox-aka-without-the-gui-also-called-headless)
Now that each prerequisite has been completed you mut obtain the qBittorrent source code.
Either download and extract a .tar archive from [Sourceforge](https://sourceforge.net/projects/qbittorrent/files/qbittorrent/) or use the following commands to speed-up the process.
` git clone https://github.com/qbittorrent/qBittorrent`
## Configure qBittorrent
[](#configure-qbittorrent-1)
`cd qBittorrent/`
`./configure --prefix=/usr --disable-gui --with-qt4`
## WARNING: Users with Debian 8 "Jessie"
[](#warning-users-with-debian-8-jessie-1)
If you have updated your Raspbian to the latest version "Jessie" then you will most certainly face an error with *libboost library* while using the .*/configure*
To overcome this error and configure correctly you must issue the following commands:
```
`sudo apt-get install libboost-all-dev
./configure --prefix=/usr --disable-gui --enable-python-binding --with-libgeoip --with-libiconv --with-boost-libdir=/usr/lib/arm-linux-gnueabihf --with-qt4
`
```
`make`
## Install qBittorrent:
[](#install-qbittorrent-1)
`sudo checkinstall`
*[alternatively you can use the standard command `make install`, as discussed before]*
**That's it! qBittorrent should now be installed.** You could simply launch Qbittorrent-nox using the following command:
'qbittorrent-nox'
But since you have chosen the "headless" version you can access qBittorrent only through its WEB Interface.
### Standard Access to WEB Interface
[](#standard-access-to-web-interface)
As a default, you can access it from the following address:
*[http://localhost:8080](http://localhost:8080)*
Using the following credentials:
*Username: admin*
*Password: adminadmin*
### Customize WEB Interface Listening Port
[](#customize-web-interface-listening-port)
If you have another service listening on port 8080, or you simply want to use a different port, you can instruct qBittorrent to listen on a different by using the following launch command:
`qbittorrent-nox --webui-port=xxxx`
Where the 'xxxx' stands for the port number you desire to use. For example, if you want to use the Port 8181 than the command will be:
`qbittorrent-nox --webui-port=8181`
**Note:** There is no need to repeat this instruction in future. Once started for the first time, qBittorrent will remember the designated listening port. So from next sessions onwards you can simply execute it with the command:
`qbittorrent-nox`
# Running qBittorrent-nox as a daemon at system startup
[](#running-qbittorrent-nox-as-a-daemon-at-system-startup)
Since you are using the "headless" version of qBittorrent, you might also want to autostart it at system boot as a *daemon*.
By doing so you will not need to keep open a terminal window in order to execute qBittorrent.
## Using CronJob at Reboot
[](#using-cronjob-at-reboot)
***Please Note:*** **the following solution is based upon personal research** and days of testing. I am aware that it might not be the nicest solution available, but if your are **running qBittorrent-nox on B-Pro with Raspbian** chances are that you too noticed how \*\*impredictible \*\*and \*\*unstable \*\*is its behaviour when using **`update-rc.d` method.**
*The following commands are based upon the assumption that you are running qBittorrent under a dedicated user.*
If you are running it under the 'bananapi' root user you need to execute the following with 'root privileges'.
Execute the following command:
`crontab -e`
Scroll to the bottom of the file and insert the following line:
`@reboot qbittorrent-nox`
Use " CTRL + O " to save the file, than " CTRL + X " to exit.
That's it! **Now qBittorrent-nox should be correctly configured for autostart!**
If you want to try it just reboot you B-Pro with the command:
`sudo reboot`
## Final Notes
[](#final-notes)
This work has been realized putting together personal knowledge and information provided by other authors.
**Credits are as follows:**
**Thanks to** [**SledgeHammer**](https://github.com/qbittorrent/qBittorrent/wiki/Compiling-qBittorrent-on-Debian-and-Ubuntu) for providing a solid template for compiling and running qBittorrent under Debian.
**Thanks to** [**Cas**](https://dev.deluge-torrent.org/wiki/Building/libtorrent) from Deluge Wiki for explaining how to compile libtorrent\_rastebar under Debian with the use of checkinstall.
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