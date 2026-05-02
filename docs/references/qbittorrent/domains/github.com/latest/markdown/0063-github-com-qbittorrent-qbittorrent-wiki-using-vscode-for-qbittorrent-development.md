Using VSCode for qBittorrent development · qbittorrent/qBittorrent Wiki · GitHub
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
# Using VSCode for qBittorrent development
[Jump to bottom](#wiki-pages-box)
Chocobo1 edited this page May 1, 2024
&middot;
[9 revisions](/qbittorrent/qBittorrent/wiki/Using-VSCode-for-qBittorrent-development/_history)
# Introduction
[](#introduction)
VSCode is a popular open source text editor with IDE-like functionality.
This guide will help you setup a basic configuration for a good qBittorrent development experience, from editing to compiling and debugging.
Currently this guide is mostly targeted at Linux users, but Windows/macOS users should be able to follow along with possibly some tweaks to the suggested settings here and there, as most steps are the same or analogous.
# Prerequisites
[](#prerequisites)
## Tools
[](#tools)
Install the following tools:
* `CMake` and `ninja` (also known as `ninja-build`), for compiling/building and project build integration in the editor via the `CMake Tools` extension.
* The `clangd` language server, to provide "language intelligence" features (code completion, compile errors, go to definition, ...). It is highly recommended to use a recent version, like 11 or later.
* `clang-tidy`, for static analysis and linting duties. It will can be executed as part of the build by `CMake` and automatically for each file as needed by `clangd`.
## VScode extensions
[](#vscode-extensions)
Install the following extensions in VSCode:
* `CMake Tools`, to provide good `CMake` project integration (but sadly, no syntax highlighting, yet).
* ID: `ms-vscode.cmake-tools`
* URL: [https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools)
* `clangd`, to provide C/C++ "language intelligence" features via the `clangd` program.
* ID: `llvm-vs-code-extensions.vscode-clangd`
* URL: [https://marketplace.visualstudio.com/items?itemName=llvm-vs-code-extensions.vscode-clangd](https://marketplace.visualstudio.com/items?itemName=llvm-vs-code-extensions.vscode-clangd)
* `C/C++` (from Microsoft), to provide debugging support. Later on, most of its features will be disabled to prevent conflicts with `clangd`.
* ID: `ms-vscode.cpptools`
* URL: [https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
# Setup
[](#setup)
Clone the qBittorrent repository (to `/home/user/Documents/qBittorrent`, for example), and open that folder in VSCode. This will be referred to as "workspace"/"workspace root folder"/"project root" throughout the guide.
For this setup to work as intended, you will need to add some settings mentioned in the following sections to the project-level `.vscode/settings.json` file, in the workspace root.
If you find that you end up using many of these settings as-is for many projects, feel free to factor them out into the user-level settings file.
Note that this configuration is merely a suggestion with sane defaults, for the sake of this guide.
You may customize some them to your liking, after looking up what they do.
However, note that some of these settings are non-negotiable for this setup to work correctly.
For example, for `clangd` to work correctly in VSCode, the IntelliSense engine of the `C/C++` extension must not be enabled.
## Setup the `CMake Tools` extension
[](#setup-the-cmake-tools-extension)
You can call `CMake` manually from the terminal for both configuring and/or building the project.
However, it is still worth installing and configuring this extension because it synergizes very well with `clangd`.
For example, it can be configured to automatically copy the generated `compile\_commands.json` compilation database to the workspace root, where `clangd` needs it to be to generate its index in order to work correctly.
Otherwise, you would have to create a custom task to accomplish this.
In addition, the GUI can be a convenient way of running common tasks and customizing the options for the configure step command line.
In the status bar, the currently active build type and "kit" (the selected compiler) are displayed. You can change the currently active ones by clicking on them and selecting from the pop-up that appears.
These are the recommended settings:
```
{
"cmake.configureOnOpen": false,
"cmake.configureArgs": [
"--graphviz=${workspaceFolder}/build/${buildType}/target\_graph.dot",
],
"cmake.buildDirectory": "${workspaceFolder}/build/${buildType}",
// This is very useful to get clangd to "just work" after the first CMake build
"cmake.copyCompileCommands": "${workspaceFolder}/compile\_commands.json",
// These are the options you would normally pass as -DVar=Value at configure-time
"cmake.configureSettings": {
"CMAKE\_EXPORT\_COMPILE\_COMMANDS": true,
// More options, including qBittorrent build configuration options go here...
},
"cmake.installPrefix": "/usr/local",
"cmake.preferredGenerators": [
"Ninja",
"Unix Makefiles",
],
}
```
Note that `CMake` can also output `clang-tidy` diagnostics as part of the build, at the cost of slowing it down.
This can be accomplished by specifying a valid `clang-tidy` command-line via the `CMAKE\_CXX\_CLANG\_TIDY` configure-time option, for example: `-DCMAKE\_CXX\_CLANG\_TIDY="clang-tidy --checks=boost-\*,bugprone-\*,clang-analyzer-\*"`.
If you already have a generated `.clang-tidy` file at the root of the project, the checks will be automatically picked up from there, so if you need no additional options besides those checks, you just need `-DCMAKE\_CXX\_CLANG\_TIDY="clang-tidy"`.
## Setup the `clangd` and `C/C++` extensions
[](#setup-the-clangd-and-cc-extensions)
The `clangd` extension will be configured to run in the background and enable `clang-tidy` diagnostics.
It piggy-backs off of the `compile\_commands.json` compilation database generated by the `CMake` build (and copied to the root of the workspace by the `CMake` Extension) to provide `clang-tidy` diagnostics and other "language intelligence" features.
`clangd` generates an index/cache of the diagnostics for every file inside a `.cache` folder at the root of the workspace.
You might want to add this to your global `.gitignore`.
Generating this index for the first time might take a while; the indexing progress and status is shown in VSCode's status bar.
These are the recommended settings:
```
{
// Disable most of the C/C++ extension's features, except debugging support
"C\_Cpp.autocomplete": "Disabled",
"C\_Cpp.errorSquiggles": "Disabled",
"C\_Cpp.experimentalFeatures": "Disabled",
"C\_Cpp.formatting": "Disabled",
"C\_Cpp.intelliSenseEngine": "Disabled",
// clangd configuration
"clangd.semanticHighlighting": true,
"clangd.arguments": [
// maximum number of parallel jobs; increase or decrease to your liking
"-j=4",
"--all-scopes-completion",
"--background-index",
"--completion-style=detailed",
"--header-insertion=iwyu",
"--suggest-missing-includes",
"--clang-tidy",
// select which clang-tidy checks should be enabled
"--clang-tidy-checks=boost-\*,bugprone-\*,cert-\*,cppcoreguidelines-\*,clang-analyzer-\*,misc-\*,modernize-\*,performance-\*,portability-\*,readability-\*,-readability-braces-around-statements",
],
}
```
`clangd` runs `clang-tidy` in the background as needed for each file as they are opened, and displays the detected problems in the "Problems" view, as well as squiggles in the text buffer.
More detailed descriptions and fix-it suggestions are displayed as mouse-over hovers in the text buffer for each problem.
If you already have a generated `.clang-tidy` file at the root of the project, the checks for which diagnostics should be emitted will be automatically picked up from there, so in this case you can remove the `--clang-tidy-checks` option.
* Note: to generate a `.clang-tidy` file: `clang-tidy -checks=\<checks\_string\> --dump-config`. Refer to the `clang-tidy` documentation to learn more.
## Setup launch configurations for debugging
[](#setup-launch-configurations-for-debugging)
Integrated debugging support is provided mainly by the `C/C++` extension and also by the `CMake Tools` extension.
There is no additional extension configuration required for debugging, but the following general debugging settings are often desirable:
```
{
"debug.allowBreakpointsEverywhere": true,
"debug.inlineValues": true,
"debug.showBreakpointsInOverviewRuler": true,
}
```
Thanks to the `CMake Tools` extension, it is possible to launch the debugger with default settings for executable `CMake` targets, even without any configured launch configuration.
However, it is still recommended to create launch configurations in order to have a better overall experience.
For example, with an actual launch configuration, it is possible to use custom pretty-printing functionality, which enables better display of values Qt types in the variables view (see [https://github.com/qbittorrent/qBittorrent/wiki/Setup-GDB-with-Qt-pretty-printers](https://github.com/qbittorrent/qBittorrent/wiki/Setup-GDB-with-Qt-pretty-printers)).
Here is an example `.vscode/launch.json` file for launching/attaching to the qBitorrent executable from either the build folder or the system installation directories with GDB and Qt pretty printer functionality:
```
{
"version": "0.2.0",
"configurations": [
{
"name": "(gdb) Launch from CMake build directory",
"type": "cppdbg",
"request": "launch",
"MIMode": "gdb",
"program": "${command:cmake.launchTargetPath}",
"cwd": "${workspaceFolder}",
"args": [],
"stopAtEntry": false,
"externalConsole": false,
// the setup commands are the same for the remaining configurations
"setupCommands": [
{
"description": "Change gdb's working directory to the root workspace folder",
"text": "-environment-cd ${workspaceFolder}",
},
{
"description": "Execute the commands from the .gdbinit file in the root workspace folder",
"text": "-interpreter-exec console \\"source .gdbinit\\"",
},
{
"description": "Enable custom pretty printers to work on the variables view",
"text": "-enable-pretty-printing",
},
{
"description": "Enable standard pretty-printing in the gdb console",
"text": "-gdb-set print pretty on",
},
{
"description": "GDB: no limit on print output for arrays",
"text": "-gdb-set print elements unlimited",
},
{
"description": "GDB: pretty print arrays",
"text": "-gdb-set print array on",
},
{
"description": "GDB: show array indexes",
"text": "-gdb-set print array-indexes on",
}
]
},
{
"name": "(gdb) Attach from CMake build directory",
"type": "cppdbg",
"request": "attach",
"MIMode": "gdb",
"program": "${command:cmake.launchTargetPath}",
"processId": "${command:pickProcess}",
"setupCommands": [
{
"text": "-environment-cd ${workspaceFolder}",
},
{
"text": "-interpreter-exec console \\"source .gdbinit\\"",
},
{
"text": "-enable-pretty-printing",
},
{
"text": "-gdb-set print pretty on",
},
{
"text": "-gdb-set print elements unlimited",
},
{
"text": "-gdb-set print array on",
},
{
"text": "-gdb-set print array-indexes on",
}
]
},
{
"name": "(gdb) Launch from system install location",
"type": "cppdbg",
"request": "launch",
"MIMode": "gdb",
"program": "/usr/local/bin/qbittorrent", // adjust path as needed
"cwd": "${workspaceFolder}",
"args": [],
"stopAtEntry": false,
"externalConsole": false,
"setupCommands": [
{
"text": "-environment-cd ${workspaceFolder}",
},
{
"text": "-interpreter-exec console \\"source .gdbinit\\"",
},
{
"text": "-enable-pretty-printing",
},
{
"text": "-gdb-set print pretty on",
},
{
"text": "-gdb-set print elements unlimited",
},
{
"text": "-gdb-set print array on",
},
{
"text": "-gdb-set print array-indexes on",
}
]
},
{
"name": "(gdb) Attach from system install location",
"type": "cppdbg",
"request": "attach",
"MIMode": "gdb",
"program": "/usr/local/bin/qbittorrent", // adjust path as needed
"processId": "${command:pickProcess}",
"setupCommands": [
{
"text": "-environment-cd ${workspaceFolder}",
},
{
"text": "-interpreter-exec console \\"source .gdbinit\\"",
},
{
"text": "-enable-pretty-printing",
},
{
"text": "-gdb-set print pretty on",
},
{
"text": "-gdb-set print elements unlimited",
},
{
"text": "-gdb-set print array on",
},
{
"text": "-gdb-set print array-indexes on",
}
]
},
]
}
```
## Setup additional tools
[](#setup-additional-tools)
VScode allows defining arbitrary tasks in `.vscode/tasks.json`.
You can make use of this to drive additional tooling straight from the editor, such as [Clazy](https://github.com/KDE/clazy), for example.
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