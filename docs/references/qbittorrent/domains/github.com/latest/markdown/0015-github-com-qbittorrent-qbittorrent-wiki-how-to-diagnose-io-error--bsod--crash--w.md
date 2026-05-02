How to diagnose IO error, BSOD, crash (Windows) · qbittorrent/qBittorrent Wiki · GitHub
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
# How to diagnose IO error, BSOD, crash (Windows)
[Jump to bottom](#wiki-pages-box)
dependabot[bot] edited this page Apr 3, 2026
&middot;
[4 revisions](/qbittorrent/qBittorrent/wiki/How-to-diagnose-IO-error,-BSOD,-crash-(Windows)/_history)
## qBittorrent gave you a lockup or BSOD (Blue Screen of Death). Now what?
[](#qbittorrent-gave-you-a-lockup-or-bsod-blue-screen-of-death-now-what)
First of all, if you get a BSOD, and it's not `irql\_not\_less\_or\_equal`, there is a good chance you will be able to debug the BSOD. It is a very powerful and useful tool to find why your Windows system just crashed.
You must also know that the cause of your lockup/BSOD was not qBittorrent.
There are four major things that can cause a freeze or BSOD.
The numbers mean how hard is it to check on a scale of 5.
* [Drivers](#how-to-diagnose-bsod) (1/5)
* [Your RAM](#how-to-check-ram) (2/5)
* [Your HDD/Storage](#how-to-check-the-hdd-or-storage) (2/5)
* [Your Power Supply](#how-to-check-psu) (4/5)
* [Something else](#something-else) (5/5)
## How to diagnose BSOD
[](#how-to-diagnose-bsod)
! Take a picture of the BSOD message, every detail. Use your phone, or anything you have at your disposal. You have a few seconds until Windows finishes writing out the memory dump. **Wait until it says 100%/ready, otherwise you will have nothing to work with.**
**If you get the `irql\_not\_less\_or\_equal`, it is most likely a hardware issue.**
1. Install the [Windows SDK](https://developer.microsoft.com/en-us/windows/downloads/windows-10-sdk). You only need to select the "Debugging tools" at the installation, which is only a mere \~250MB.
2. Launch the freshly installed "windbg" *as Administrator* tool.
3. Add remote symbols.
File -\> Symbol File Path: `srv\*c:\\symbols\*https://msdl.microsoft.com/download/symbols`
The `c:\\symbols` will be your local symbol cache. I would suggest using something more "writable".
4. File -\> Open Crash Dump.
5. Navigate to `C:\\Windows\\`
6. Open `memory.dmp`
7. Wait. Once you see "Ready", use the `!analyze -v` command.
8. It will tell you the most likely culprit, but the other loaded things are also suspects. For me, the "most likely" thing was a Windows DLL, but my Avast file scanner service was also there. Removed Avast - boom - no BSOD ever since.
## How to check RAM
[](#how-to-check-ram)
### Windows in-built tool
[](#windows-in-built-tool)
* [https://www.cnet.com/how-to/test-your-ram-with-windows-memory-diagnostic-tool/](https://www.cnet.com/how-to/test-your-ram-with-windows-memory-diagnostic-tool/)
### Alternatives
[](#alternatives)
In case Windows's in-built test does not work for you.
* [https://www.memtest86.com](https://www.memtest86.com)
* [https://www.howtogeek.com/260813/how-to-test-your-computers-ram-for-problems/](https://www.howtogeek.com/260813/how-to-test-your-computers-ram-for-problems/)
You have to download Memtest86 and put it on a pendrive, CD or DVD.
Boot it, and it will check your RAM.
I usually stop after 1 PASS, but you can wait until 2 PASS or so. If there are no errors during the test, your ram is OK.
If you can't get Memtest86 to work, a live Ubuntu ISO will work just as well.
Download the latest Ubuntu LTS version (16.04 at the moment), and put it on a pendrive, CD or DVD.
## How to check the HDD or storage
[](#how-to-check-the-hdd-or-storage)
### Windows
[](#windows)
There are many great free tools for this.
* [https://hddguardian.codeplex.com](https://hddguardian.codeplex.com)
* [https://crystalmark.info/en/software/crystaldiskinfo/](https://crystalmark.info/en/software/crystaldiskinfo/)
### Ubuntu
[](#ubuntu)
If you can't boot Windows, you can use an [Ubuntu Live CD](https://www.howtogeek.com/191054/how-to-create-bootable-usb-drives-and-sd-cards-for-every-operating-system/) to diagnose your HDD.
* [https://askubuntu.com/questions/528072/how-can-i-check-the-smart-status-of-a-drive-on-ubuntu-14-04-through-16-10](https://askubuntu.com/questions/528072/how-can-i-check-the-smart-status-of-a-drive-on-ubuntu-14-04-through-16-10)
* [https://askubuntu.com/questions/38566/how-can-i-check-the-health-of-my-hard-drive](https://askubuntu.com/questions/38566/how-can-i-check-the-health-of-my-hard-drive)
You want to check:
* Reallocated\_Sector\_Ct
* Current\_Pending\_Sector
* Power\_On\_Hours
* Reallocated\_Sector\_Ct:
>
> Once this reaches 1, or any higher, the HDD is a ticking bomb. Back up and replace ASAP. Only store throwaway data on it.
>
* Current\_Pending\_Sector: Big trouble. Answer from AskUbuntu:
>
> A sector is marked pending when a read fails. The pending sector will be marked reallocated if a subsequent write fails. If the write succeeds, it is removed from current pending sectors and assumed to be ok. (The exact behavior could differ slightly and I'll go into that later, but this is a close enough approximation for now.)
>
* Power\_On\_Hours:
>
> How many hours your HDD ran. HDDs usually die around 20-30k hours. Some may run up to 60k. It is totally random, and there is no guarantee a hard drive will run to X hours. It's however a good idea to back up more often and worry once you reach a lot of hours.
>
## How to check PSU
[](#how-to-check-psu)
This one is very tricky.
The best and easiest method is to switch the PSU to an other one.
Use the computer, try every application, game and whatnot.
If the computer is now stable, then it was your PSU.
Of course, most people don't have a second PSU lying around.
In this case, it's usually a good test to put load on your PC.
### Windows
[](#windows-1)
Run the two programs at the same time.
[Prime95](https://www.mersenne.org/download/) stresses your CPU, [FurMark](http://www.ozone3d.net/benchmarks/fur/) stresses your GPU.
If your PC is stable after a few minutes, just close them.
If you have a BSOD, or the computer restarts/turns off, you have a bad PSU.
Your PSU might also be able to deliver stable power during stress (not likely), so also test some other situations where you had a freeze/lockup.
## Something else
[](#something-else)
Check if the cables to your HDD/things are connected firmly, and they are not loose. This can also cause trouble.
If nothing helped, your motherboard can also be faulty. An anti-virus can also cause BSOD, but it will show up with "windbg".
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