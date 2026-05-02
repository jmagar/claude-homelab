Setup GDB with Qt pretty printers · qbittorrent/qBittorrent Wiki · GitHub
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
# Setup GDB with Qt pretty printers
[Jump to bottom](#wiki-pages-box)
Chocobo1 edited this page May 1, 2024
&middot;
[7 revisions](/qbittorrent/qBittorrent/wiki/Setup-GDB-with-Qt-pretty-printers/_history)
# Introduction
[](#introduction)
When debugging qBittorrent with GDB, values of variables with Qt types such as `QByteArray` and `QString` are not easily printable.
Fortunately, GDB has a pretty printer functionality that enables it to easily print such values in human readable form.
This guide assumes you are relatively inexperienced with GDB, and either don't know what a `.gdbinit` file is or don't use one. If you are an experienced user with an existing `.gdbinit` setup, you should be able follow along and customize your existing setup as needed.
# Setup
[](#setup)
1. Clone the qBittorrent repository if you haven't done so already. In this example, it is assumed it was cloned to `/home/user/Documents/qBittorrent`
2. Create a folder called `.gdb` inside the cloned repository folder (`/home/user/Documents/qBittorrent`). Inside `.gdb` create another folder called `qt5prettyprinters`.
3. Download the `qt.py` and `helper.py` files from [here](https://invent.kde.org/kdevelop/kdevelop/-/tree/master/plugins/gdb/printers) ([backup link](https://github.com/KDE/kdevelop/tree/master/plugins/gdb/printers)) and place them inside the `.gdb/qt5prettyprinters` folder.
4. Create a file called `.gdbinit` inside the cloned repository folder with the following contents:
```
python
import sys, os
print(f".gdbinit Python: current working directory is {os.getcwd()}")
print(f".gdbinit Python: adding custom pretty-printers directory to the GDB path: {os.getcwd() + '/.gdb/qt5prettyprinters'}")
sys.path.insert(0, "./.gdb/qt5prettyprinters")
from qt import register\_qt\_printers
register\_qt\_printers (None)
end
```
# Usage
[](#usage)
After starting a debugging session with qBittorrent (`gdb qbittorrent`, for example), execute `source .gdbinit` in the GDB console. You should see some output informing you that the pretty printers have been loaded.
```
(gdb) source .gdbinit
.gdbinit Python: current working directory is /home/user/Documents/qBittorrent
.gdbinit Python: adding custom pretty-printers directory to the GDB path: /home/user/Documents/qBittorrent/.gdb/qt5prettyprinters
```
Now, you can use GDB as you usually would. Whenever you print a variable with a Qt type, the output is immediately human-readable without additional effort.
For example, suppose you are at a breakpoint and print the value of a variable named `data`, which is a `QByteArray`, containing an HTTP request.
* output without pretty printers:
```
`(gdb) print data
$1 = (const QByteArray &) @0x555555e2ecd0: {d = 0x555555e46610}
`
```
* output with pretty printers:
```
`(gdb) print data
$1 = "POST /api/v2/auth/login HTTP/1.1\\r\\nHost: localhost:8080\\r\\nUser-Agent: python-requests/2.22.0\\r\\nAccept-Encoding: gzip, deflate\\r\\nAccept: \*/\*\\r\\nConnection: keep-alive\\r\\nContent-Length: 34\\r\\nContent-Type: appli"... = {[0] = 80 'P', [1] = 79 'O',
[2] = 83 'S', [3] = 84 'T', [4] = 32 ' ', [5] = 47 '/', [6] = 97 'a', [7] = 112 'p', [8] = 105 'i', [9] = 47 '/', [10] = 118 'v', [11] = 50 '2', [12] = 47 '/', [13] = 97 'a', [14] = 117 'u', [15] = 116 't', [16] = 104 'h', [17] = 47 '/', [18] = 108 'l',
[19] = 111 'o', [20] = 103 'g', [21] = 105 'i', [22] = 110 'n', [23] = 32 ' ', [24] = 72 'H', [25] = 84 'T', [26] = 84 'T', [27] = 80 'P', [28] = 47 '/', [29] = 49 '1', [30] = 46 '.', [31] = 49 '1', [32] = 13 '\\r', [33] = 10 '\\n', [34] = 72 'H',
[35] = 111 'o', [36] = 115 's', [37] = 116 't', [38] = 58 ':', [39] = 32 ' ', [40] = 108 'l', [41] = 111 'o', [42] = 99 'c', [43] = 97 'a', [44] = 108 'l', [45] = 104 'h', [46] = 111 'o', [47] = 115 's', [48] = 116 't', [49] = 58 ':', [50] = 56 '8',
[51] = 48 '0', [52] = 56 '8', [53] = 48 '0', [54] = 13 '\\r', [55] = 10 '\\n', [56] = 85 'U', [57] = 115 's', [58] = 101 'e', [59] = 114 'r', [60] = 45 '-', [61] = 65 'A', [62] = 103 'g', [63] = 101 'e', [64] = 110 'n', [65] = 116 't', [66] = 58 ':',
[67] = 32 ' ', [68] = 112 'p', [69] = 121 'y', [70] = 116 't', [71] = 104 'h', [72] = 111 'o', [73] = 110 'n', [74] = 45 '-', [75] = 114 'r', [76] = 101 'e', [77] = 113 'q', [78] = 117 'u', [79] = 101 'e', [80] = 115 's', [81] = 116 't', [82] = 115 's',
[83] = 47 '/', [84] = 50 '2', [85] = 46 '.', [86] = 50 '2', [87] = 50 '2', [88] = 46 '.', [89] = 48 '0', [90] = 13 '\\r', [91] = 10 '\\n', [92] = 65 'A', [93] = 99 'c', [94] = 99 'c', [95] = 101 'e', [96] = 112 'p', [97] = 116 't', [98] = 45 '-', [99] = 69 'E',
[100] = 110 'n', [101] = 99 'c', [102] = 111 'o', [103] = 100 'd', [104] = 105 'i', [105] = 110 'n', [106] = 103 'g', [107] = 58 ':', [108] = 32 ' ', [109] = 103 'g', [110] = 122 'z', [111] = 105 'i', [112] = 112 'p', [113] = 44 ',', [114] = 32 ' ',
[115] = 100 'd', [116] = 101 'e', [117] = 102 'f', [118] = 108 'l', [119] = 97 'a', [120] = 116 't', [121] = 101 'e', [122] = 13 '\\r', [123] = 10 '\\n', [124] = 65 'A', [125] = 99 'c', [126] = 99 'c', [127] = 101 'e', [128] = 112 'p', [129] = 116 't',
[130] = 58 ':', [131] = 32 ' ', [132] = 42 '\*', [133] = 47 '/', [134] = 42 '\*', [135] = 13 '\\r', [136] = 10 '\\n', [137] = 67 'C', [138] = 111 'o', [139] = 110 'n', [140] = 110 'n', [141] = 101 'e', [142] = 99 'c', [143] = 116 't', [144] = 105 'i',
[145] = 111 'o', [146] = 110 'n', [147] = 58 ':', [148] = 32 ' ', [149] = 107 'k', [150] = 101 'e', [151] = 101 'e', [152] = 112 'p', [153] = 45 '-', [154] = 97 'a', [155] = 108 'l', [156] = 105 'i', [157] = 118 'v', [158] = 101 'e', [159] = 13 '\\r',
[160] = 10 '\\n', [161] = 67 'C', [162] = 111 'o', [163] = 110 'n', [164] = 116 't', [165] = 101 'e', [166] = 110 'n', [167] = 116 't', [168] = 45 '-', [169] = 76 'L', [170] = 101 'e', [171] = 110 'n', [172] = 103 'g', [173] = 116 't', [174] = 104 'h',
[175] = 58 ':', [176] = 32 ' ', [177] = 51 '3', [178] = 52 '4', [179] = 13 '\\r', [180] = 10 '\\n', [181] = 67 'C', [182] = 111 'o', [183] = 110 'n', [184] = 116 't', [185] = 101 'e', [186] = 110 'n', [187] = 116 't', [188] = 45 '-', [189] = 84 'T',
[190] = 121 'y', [191] = 112 'p', [192] = 101 'e', [193] = 58 ':', [194] = 32 ' ', [195] = 97 'a', [196] = 112 'p', [197] = 112 'p', [198] = 108 'l', [199] = 105 'i'...}
`
```
The pretty printer output is further customizable via the usual GDB options for output customization. For example, you can suppress output of individual array elements, or reduce the number of array elements printed.
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