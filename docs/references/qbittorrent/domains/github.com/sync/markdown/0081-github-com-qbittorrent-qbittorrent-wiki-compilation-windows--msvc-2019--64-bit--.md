Compilation Windows (MSVC 2019, 64 bit, static linkage) · qbittorrent/qBittorrent Wiki · GitHub
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
# Compilation Windows (MSVC 2019, 64 bit, static linkage)
[Jump to bottom](#wiki-pages-box)
Chocobo1 edited this page May 1, 2024
&middot;
[2 revisions](/qbittorrent/qBittorrent/wiki/Compilation-Windows-(MSVC-2019,-64-bit,-static-linkage)/_history)
# Introduction
[](#introduction)
**NOTE:** for qBittorrent revisions older than `63ff5e3` (2020-09-19), use the [legacy guide](https://github.com/qbittorrent/qBittorrent/wiki/Compiling-with-MSVC-2019-(static-linkage)) instead.
This page describes how to compile qBittorrent 64-bit/x64/x86-64/amd64(\*) (static linkage) using MSVC 2019 under Windows 10(\*\*).
(\*): as of writing, compiling 32-bit/x86 versions is also possible but not recommended.
(\*\*): as of writing, it is still possible to compile on/for older versions of Windows, but support for that should be dropped soon.
# Install the toolchain and dependencies
[](#install-the-toolchain-and-dependencies)
## Toolchain
[](#toolchain)
NOTE: For those who don't have a Windows system or would like a clean isolated environment for compiling qBittorrent, Microsoft provides [free VMs for developers compatible with many mainstream virtualization platforms](https://developer.microsoft.com/en-us/windows/downloads/virtual-machines/). These VMs have all or most of these tools already installed and set up for you.
You will need:
* The MSVC 2019 compiler. You can get it by installing [Visual Studio 2019 Community Edition](https://docs.microsoft.com/en-us/visualstudio/releases/2019/release-notes).
* The following MSVC 2019 individual components (open Visual Studio and go to `Tools` -\> `Get Tools and Features`). Some or all of these may already be installed (where applicable, feel free to choose between the Spectre-mitigated alternatives or the normal versions):
* `MSBuild`
* `C++ core features`
* `Text template transformation`
* `C++ 2019 Redistributable Update`
* `C++ ATL for latest v142 build tools with Spectre Mitigations (x86 & x64)`
* `C++ MFC for latest v142 build tools with Spectre Mitigations (x86 & x64)`
* `MSVC v142 - VS 2019 C++ x64/x86 build tools` (whatever the latest version is)
* `MSVC v142 - VS 2019 C++ x64/x86 build Spectre-mitigated libs` (whatever the latest version is)
* `Windows 10 SDK` (whatever the latest version is)
* [CMake](https://cmake.org/download/) (the portable zip version is recommended) and [Ninja](https://github.com/ninja-build/ninja/releases) (download them and [add the directories where the executables are located to the system's `PATH`](https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/))
* [git for Windows](https://git-scm.com/download/win) or `git` via WSL/WSL 2, if you have WSL/WSL 2 enabled.
You will need to use either `cmd` or `pwsh` (Powershell Core) with the appropriate MSVC environment variables set up to run most commands in this guide successfully:
* For `cmd`, always run it from the `x64 Native Tools Command Prompt for VS 2019` shortcut that Visual Studio installs.
* For `pwsh`, run the following command in `cmd`:
```
`pwsh -NoExit -Command "&{Import-Module ""C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\Common7\\Tools\\Microsoft.VisualStudio.DevShell.dll""; Enter-VsDevShell -VsInstallPath ""C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community"" -DevCmdArguments ""-host\_arch=amd64 -arch=amd64 -vcvars\_spectre\_libs=spectre""}"
`
```
(to run the same command from an already-running `pwsh` instance, turn every dual double-quote into a quadruple double-quote).
Using the `Developer Powershell for VS 2019` shortcut is not recommended, since it uses the legacy `powershell` and defaults to using the 32-bit/x86 tools.
The new [Windows Terminal](https://github.com/microsoft/terminal) is recommended for comfortably using and managing multiple shells on Windows.
## Dependencies (static linkage)
[](#dependencies-static-linkage)
None of qBittorrent's dependencies have officially released statically linked builds. Thus, the best way to get good general-purpose builds of recent versions of the dependencies easily is to install them via the `vcpkg` package manager. `vcpkg` can also be used to install `libtorrent`.
The nice thing about `vcpkg` is that it also allows you to easily patch any of the packages that it installs, should you need/want to do so. Furthermore, you can even compile some dependencies with `vcpkg`, others manually, and mix-and-match when building qBittorrent.
### Install and build `vcpkg`
[](#install-and-build-vcpkg)
```
`git clone https://github.com/microsoft/vcpkg
cd .\\vcpkg
.\\bootstrap-vcpkg.bat -disableMetrics
.\\vcpkg integrate install
`
```
### Install the base dependencies
[](#install-the-base-dependencies)
```
`.\\vcpkg install boost-circular-buffer:x64-windows-static boost-stacktrace:x64-windows-static openssl:x64-windows-static qt5-base:x64-windows-static qt5-svg:x64-windows-static qt5-tools:x64-windows-static qt5-winextras:x64-windows-static
`
```
Note that by default, `vcpkg` keeps all the buildtrees after each package installation. This is useful for patching and rebuilding, but they can take up a lot of space, so if you don't need them, you can additionally pass the `--clean-after-build` flag to the above command so that the buildtrees are deleted automatically after the installation. Or just delete them manually after the build is done.
### Install libtorrent, option 1 - just install it via `vcpkg`
[](#install-libtorrent-option-1---just-install-it-via-vcpkg)
```
`.\\vcpkg install libtorrent:x64-windows-static
`
```
NOTE: Currently, `vcpkg` doesn't have versioning support, so this command will install whatever `libtorrent` version was present in the commit that `vcpkg` was at when you cloned the repository. At the time of writing, you could use `--head` to get the latest `RC\_1\_2` commit instead, but if you want a specific commit/branch, you should go for **option 2** instead.
### Install libtorrent, option 2 - manually from source, using `vcpkg` dependencies
[](#install-libtorrent-option-2---manually-from-source-using-vcpkg-dependencies)
The easiest way to install `libtorrent`'s dependencies via `vcpkg` is to actually install it and remove it right after; `vcpkg` will install all dependencies automatically in the process. To save time, interrupt the installation process once it reaches the `libtorrent` package itself:
```
`.\\vcpkg install libtorrent:x64-windows-static
.\\vcpkg remove libtorrent:x64-windows-static
`
```
Then, clone the repository, checkout your preferred commit/tag, apply any patches you want to apply, and build and install it yourself (change the toolchain file path as needed):
```
git clone https://github.com/arvidn/libtorrent.git
git checkout RC\_1\_2
cmake -G "Ninja" -B cmake-build-dir -DCMAKE\_BUILD\_TYPE=Release -DCMAKE\_TOOLCHAIN\_FILE="C:\\path\\to\\vcpkg\\scripts\\buildsystems\\vcpkg.cmake" -DVCPKG\_TARGET\_TRIPLET="x64-windows-static" -DBUILD\_SHARED\_LIBS=OFF -Dstatic\_runtime=ON -Ddeprecated-functions=ON
cmake --build cmake-build-dir
cmake --install cmake-build-dir --prefix C:\\some\\folder\\not\\requiring\\admin\\privileges\\libtorrent-install-dir
```
More information about building `libtorrent` can be found at [https://libtorrent.org/building.html#building-with-cmake](https://libtorrent.org/building.html#building-with-cmake). Passing `-Ddeveloper-options=ON` to the configure command line will enable advanced build customization options.
Note: if you are developing/testing qBittorrent, you are encouraged to use `-Ddeprecated-functions=OFF` instead, to catch any potential use of deprecated libtorrent functionality (it will result in a compile error). Then, if you do, submit a bug report, or better yet, a PR fixing the problem :)
# Build qBittorrent
[](#build-qbittorrent)
Download and extract a `.tar` archive from [the GitHub releases page](https://github.com/qbittorrent/qBittorrent/releases) or clone the repository and checkout the branch/tag of your choice.
Then, configure and build with CMake, using the `vcpkg` toolchain file (change the path to the file as needed):
* Assuming `libtorrent` was installed via `vcpkg` (**option 1**):
```
cmake -G "Ninja" -B build -DCMAKE\_BUILD\_TYPE=Release -DCMAKE\_TOOLCHAIN\_FILE="C:\\path\\to\\vcpkg\\scripts\\buildsystems\\vcpkg.cmake" -DVCPKG\_TARGET\_TRIPLET="x64-windows-static" -DMSVC\_RUNTIME\_DYNAMIC=OFF
cmake --build build
```
* Assuming `libtorrent` was built manually, but still with `vcpkg`-installed dependencies (**option 2**):
Same as above, but also pass `-DLibtorrentRasterbar\_DIR=C:\\path\\to\\libtorrent-install-dir\\lib\\cmake\\LibtorrentRasterbar` to the configure command line.
Check out the [common information](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-with-CMake-common-information) page to learn more about the available build configuration options (for compiling without WebUI functionality, for instance).
Once qBittorrent is built, you can run it straight from the build directory.
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