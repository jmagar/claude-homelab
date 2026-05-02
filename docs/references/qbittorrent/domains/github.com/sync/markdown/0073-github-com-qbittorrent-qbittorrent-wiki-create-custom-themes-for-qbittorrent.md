Create custom themes for qBittorrent · qbittorrent/qBittorrent Wiki · GitHub
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
# Create custom themes for qBittorrent
[Jump to bottom](#wiki-pages-box)
Mahdi Mirzadeh edited this page Apr 21, 2026
&middot;
[18 revisions](/qbittorrent/qBittorrent/wiki/Create-custom-themes-for-qBittorrent/_history)
## Introduction
[](#introduction)
This page contains the necessary information to get started developing custom themes for qBittorrent. They are supported since version 4.2.2.
As of qBittorrent 4.6.0 (Oct 2023), qBittorrent migrated to Qt6 and dropped Qt5. The theming format (.qbtheme with stylesheet.qss + config.json) remains compatible; use the matching Qt Resource Compiler (rcc) for your target version.
## What are .qbtheme files?
[](#what-are-qbtheme-files)
These are theme bundles for qBittorrent.
They should contain all files required to support theming in qBittorrent and are packed using [Qt's Resource Compiler](https://doc.qt.io/qt-6/rcc.html).
qBittorrent accesses files inside `.qbtheme` using [Qt's Resource System](https://doc.qt.io/qt-6/resources.html).
Currently, qBittorrent only searches for a `stylesheet.qss` and `config.json` inside a `.qbtheme` file but you can also add your own custom resources (read more below in ["Using custom resources with bundles"](#using-custom-resources-with-bundles)).
## How to create your own theme bundles?
[](#how-to-create-your-own-theme-bundles)
You can check out [this Python script](https://github.com/jagannatharjun/qbt-theme/blob/master/Builds/make-resource.py) for the easy creation of `.qbtheme` files.
Alternatively, use Qt's `rcc` directly with a simple `resources.qrc` listing your files. For Qt6-based qBittorrent (4.6.0+), build with the Qt6 `rcc`; for older Qt5-based versions (4.2.2–4.5.x), build with the Qt5 `rcc`.
At runtime, qBittorrent loads only `stylesheet.qss` to support theming and `config.json` which currently only manages GUI colors. You can include custom resources with your bundle files to use in `stylesheet.qss`.
## Managing overall feel of GUI
[](#managing-overall-feel-of-gui)
`stylesheet.qss` is a [Qt stylesheet](https://doc.qt.io/qt-6/stylesheet.html), which is basically custom CSS for Qt.
You can read more about Qt stylesheet syntax here: [https://doc.qt.io/qt-6/stylesheet-syntax.html](https://doc.qt.io/qt-6/stylesheet-syntax.html). A reference is also available here: [https://doc.qt.io/qt-6/stylesheet-reference.html](https://doc.qt.io/qt-6/stylesheet-reference.html).
Notes for Qt client theming:
* Use selectors like `QWidget`, `QPushButton:hover`, `QToolBar QLineEdit`, etc.
* QSS generally takes precedence over palette colors; palettes still drive defaults like text/selection.
* Some widgets expose extra paintable properties via `qproperty-\<Name\>` that can be set from QSS.
* Keep resource URLs absolute inside the bundle, e.g. `url(:/uitheme/icons/name.svg)`.
## Changing qBittorrent specific colors
[](#changing-qbittorrent-specific-colors)
For changing qBittorrent-specific GUI colors, use `config.json`. NOTE: A large part of colors is already changeable from the stylesheet but the following are qBittorrent's specific context-sensitive colors.
```
{
"colors": {
"Palette.Window": "\<color\>",
"Palette.WindowText": "\<color\>",
"Palette.Base": "\<color\>",
"Palette.AlternateBase": "\<color\>",
"Palette.Text": "\<color\>",
"Palette.ToolTipBase": "\<color\>",
"Palette.ToolTipText": "\<color\>",
"Palette.BrightText": "\<color\>",
"Palette.Highlight": "\<color\>",
"Palette.HighlightedText": "\<color\>",
"Palette.Button": "\<color\>",
"Palette.ButtonText": "\<color\>",
"Palette.Link": "\<color\>",
"Palette.LinkVisited": "\<color\>",
"Palette.Light": "\<color\>",
"Palette.Midlight": "\<color\>",
"Palette.Mid": "\<color\>",
"Palette.Dark": "\<color\>",
"Palette.Shadow": "\<color\>",
"Palette.WindowTextDisabled": "\<color\>",
"Palette.TextDisabled": "\<color\>",
"Palette.ToolTipTextDisabled": "\<color\>",
"Palette.BrightTextDisabled": "\<color\>",
"Palette.HighlightedTextDisabled": "\<color\>",
"Palette.ButtonTextDisabled": "\<color\>",
"Log.Time": "\<color\>",
"Log.Normal": "\<color\>",
"Log.Info": "\<color\>",
"Log.Warning": "\<color\>",
"Log.Critical": "\<color\>",
"Log.BannedPeer": "\<color\>",
"TransferList.Downloading": "\<color\>",
"TransferList.StalledDownloading": "\<color\>",
"TransferList.DownloadingMetadata": "\<color\>",
"TransferList.ForcedDownloading": "\<color\>",
"TransferList.Allocating": "\<color\>",
"TransferList.Uploading": "\<color\>",
"TransferList.StalledUploading": "\<color\>",
"TransferList.ForcedUploading": "\<color\>",
"TransferList.QueuedDownloading": "\<color\>",
"TransferList.QueuedUploading": "\<color\>",
"TransferList.CheckingDownloading": "\<color\>",
"TransferList.CheckingUploading": "\<color\>",
"TransferList.CheckingResumeData": "\<color\>",
"TransferList.PausedDownloading": "\<color\>",
"TransferList.PausedUploading": "\<color\>",
"TransferList.Moving": "\<color\>",
"TransferList.MissingFiles": "\<color\>",
"TransferList.Error": "\<color\>"
}
}
```
Here
1. Palette refers to [QPalette](https://doc.qt.io/qt-6/qpalette.html), and the following string (after `.`) denotes [Color roles](https://doc.qt.io/qt-6/qpalette.html#ColorRole-enum)
2. Log refers to log messages and the following string (after `.`) denotes the type of messages
3. Transfer List refers to the central view containing all of your torrents entries and the following string (after `.`) denotes the torrent state, based on which row colors are decided.
`\<color\>` supports normal RGB values (`#rrggbb`) or SVG color names. It follows [Qt's named color convention](https://doc.qt.io/qt-6/qcolor.html#setNamedColor).
This was introduced in qBittorrent v4.3.0.
## Using custom resources with bundles
[](#using-custom-resources-with-bundles)
qBittorrent uses [QResource::registerResource](https://doc.qt.io/qt-6/qresource.html#registerResource) to use the bundle file; you can imagine qBittorrent extracts the bundle file in a special path which is `:/uitheme`, so every file should be referenced accordingly. For example, to change the image for a `QRadioButton` indicator and to reference a `light/radio\_button.svg` inside your bundle file, do something like this:
```
QRadioButton::indicator:unchecked,
QRadioButton::indicator:unchecked:focus
{
image: url(:/uitheme/light/radio\_button.svg);
}
```
Reserved files and their structure in bundle files are: `stylesheet.qss` and `config.json`; both should occur at the root of your bundle file.
## Changing icons of GUI
[](#changing-icons-of-gui)
Starting with v4.3.0 you can change the icons of the GUI too; include your icons in the theme bundle under the icons prefix. The icon name should be the same as the original icons. See the icons list here: [https://github.com/qbittorrent/qBittorrent/tree/master/src/icons](https://github.com/qbittorrent/qBittorrent/tree/master/src/icons)
An example can be read here: [https://github.com/jagannatharjun/qbt-theme/issues/29#issuecomment-713305420](https://github.com/jagannatharjun/qbt-theme/issues/29#issuecomment-713305420)
## Notes
[](#notes)
The following way of changing TransferList row colors was removed after version 4.2.5. Please change your bundle files accordingly and instead use `config.json`.
```
TransferListWidget
{
qproperty-downloadingStateForeground: limegreen;
qproperty-forcedDownloadingStateForeground: limegreen;
qproperty-downloadingMetadataStateForeground: limegreen;
qproperty-allocatingStateForeground: #cccccc;
qproperty-stalledDownloadingStateForeground: #cccccc;
qproperty-stalledUploadingStateForeground: #cccccc;
qproperty-uploadingStateForeground: #63b8ff;
qproperty-forcedUploadingStateForeground: #63b8ff;
qproperty-pausedDownloadingStateForeground: #fa8090;
qproperty-pausedUploadingStateForeground: #4f94cd;
qproperty-errorStateForeground: red;
qproperty-missingFilesStateForeground: red;
qproperty-queuedDownloadingStateForeground: #00cdcd;
qproperty-queuedUploadingStateForeground: #00cdcd;
qproperty-checkingDownloadingStateForeground: #00cdcd;
qproperty-checkingUploadingStateForeground: #00cdcd;
qproperty-checkingResumeDataStateForeground: #00cdcd;
qproperty-movingStateForeground: #00cdcd;
qproperty-unknownStateForeground: red;
}
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