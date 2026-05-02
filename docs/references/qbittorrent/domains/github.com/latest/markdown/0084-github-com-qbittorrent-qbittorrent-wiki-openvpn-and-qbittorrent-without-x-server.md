OpenVPN and qBittorrent without X server · qbittorrent/qBittorrent Wiki · GitHub
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
# OpenVPN and qBittorrent without X server
[Jump to bottom](#wiki-pages-box)
Chocobo1 edited this page May 1, 2024
&middot;
[2 revisions](/qbittorrent/qBittorrent/wiki/OpenVPN-and-qBittorrent-without-X-server/_history)
## Subject:
[](#subject)
If you want to use the qBittorrent together with a VPN connection for any reason (to maintain your privacy, to avoid your ISP's restrictions or to enable incoming connections without paying for a static IP, or all those reasons simultaneously), you can set up your Linux system like following.
## Requirements:
[](#requirements)
The control over the OpenVPN server deployed on the VPS with a static worldwide-routable IP address ("white IP address"), the rest will be about setting up the OpenVPN+qBittorrent, but OpenVPN is not the only VPN solution and just one of the possible solutions.
## Pre-requirements:
[](#pre-requirements)
Before the howto itself, let's assume you have installed the qBittorrent on your device from the [official PPA](http://ppa.launchpad.net/qbittorrent-team/qbittorrent-stable/ubuntu) or from the packages downloaded from the [official site](https://www.qbittorrent.org/download.php) and set up your VPN connection and checked its connectivity on the device intended to host the qBittorrent client.
You also may want to add the following line to your OpenVPN client configuration file to avoid it becoming the default gateway:
```
`pull-filter ignore redirect-gateway
`
```
This line will allow all traffic not intended to go through the VPN to go through the primary ISP gateway.
## The task should be considered in two parts:
[](#the-task-should-be-considered-in-two-parts)
1. Setting up the qBittorrent client to work through a VPN connection
2. Enabling incoming connections from outer space to the qBittorrent through the VPN.
Let's assume you have the VPN connection interface named `tun0`, VPN server external IP is 212.213.214.215, VPN gateway IP is `10.8.0.1/24` and VPN Client IP address is `10.8.0.2/24` - feel free to do replace any of those values in the guide below if it does not match your setup.
## Part 1:
[](#part-1)
Setting up the qBittorrent client to work through a VPN connection.
### 0. Make sure qBittorrent has the CAP\_NET\_RAW capability.
[](#0-make-sure-qbittorrent-has-the-cap_net_raw-capability)
If you are using qbittorrent-nox - verify its systemd unit has the following line in the `[Service]` section:
```
`AmbientCapabilities=CAP\_NET\_RAW
`
```
If you are using the qBittorrent with the GUI or don't use systemd - use a proper way to gain the client `CAP\_NET\_RAW` capability, or just run it as `root` user (not recommended).
### 1. Set up qBittorrent to bind to your VPN connection.
[](#1-set-up-qbittorrent-to-bind-to-your-vpn-connection)
Add the following lines to your qBittorrent.conf into the `[Preferences]` section:
```
`Connection\\Interface=tun0
Connection\\InterfaceAddress=10.8.0.2
`
```
This also can be performed on the Web GUI Settings page or X11 GUI window - just look "Advanced" settings page for "Network interface" and "Optional IP address to bind to" and set up those options there.
### 2. Create an auxiliary routing table.
[](#2-create-an-auxiliary-routing-table)
Edit the `/etc/iproute2/rt\_tables` and add the following line to this file:
```
`200 isp2
`
```
isp2 is a routing table name, it can be arbitrary. 200 is the priority of this routing table, it should be less than the default routing table priority (253 default).
### 3. Set up auxiliary routing rules:
[](#3-set-up-auxiliary-routing-rules)
Execute the following command:
```
`ip rule add from 10.8.0.2 table isp2 prio 1
`
```
Here the `from 10.8.0.2 table isp2 prio 1` means all traffic with a source IP address 10.8.0.2 will be processed using routing table isp2 with priority 1
### 4. Filling up auxiliary routing table:
[](#4-filling-up-auxiliary-routing-table)
Execute the following command:
```
`ip route add default via 10.8.0.1 dev tun0 table isp2
`
```
It will add a default route through the VPN gateway using device tun0 to the table isp2.
After performing steps 0..4 try to use your qBittorrent instance to download anything and make sure it using only the VPN interface for peers connection - it should now use only tun0 interface and stop if this interface will become unavailable (like if the OpenVPN daemon gets down or OpenVPN connection gets disconnected).
## Part 2:
[](#part-2)
Set up the VPN server and VPN client to accept incoming connections from outer space.
### 0. Set up a static port for peers connections:
[](#0-set-up-a-static-port-for-peers-connections)
Add the following line to your qBittorrent.conf to the `[Preferences]` section:
```
`Connection\\PortRangeMin=62000
`
```
This also can be performed on the Web GUI Settings page or X11 GUI window - just look "Connection" settings page for "Port used for incoming connections" and set up this option there.
It's better to use the port in the dynamic port range (49152 to 65535) as some ISPs may throttle traffic for lower ports.
### 1. Set up the OpenVPN server to forward incoming connections to the VPN client:
[](#1-set-up-the-openvpn-server-to-forward-incoming-connections-to-the-vpn-client)
Enable forwarding from incoming interface `eth0` to VPN interface `tun0` using the following command:
```
`iptables -t filter -A FORWARD -i eth0 -o tun0 -j ACCEPT
`
```
Then forward desired TCP and UDP port to yours VPN client IP address using following commands:
```
`iptables -t nat -A PREROUTING -d 212.213.214.215/32 -p tcp -m tcp --dport 62000 -j DNAT --to-destination 10.8.0.2:62000
iptables -t nat -A PREROUTING -d 212.213.214.215/32 -p udp -m udp --dport 62000 -j DNAT --to-destination 10.8.0.2:62000
iptables -t nat -A POSTROUTING -d 10.8.0.2/32 -p tcp -m tcp --sport 62000 -j SNAT --to-source 212.213.214.215:62000
iptables -t nat -A POSTROUTING -d 10.8.0.2/32 -p udp -m udp --sport 62000 -j SNAT --to-source 212.213.214.215:62000
`
```
Please don't forget to add iptables commands on the OpenVPN server or save iptables rules using the following command:
```
`iptables-save \> /etc/iptables/rules.v4
`
```
Restart the qBittorrent client and check does it detects incoming connections possibility or not (please wait for some time - it can detect connection changes with a delay).
If qBittorrent does not receive incoming connections - proceed to the following steps:
### 2. Temporarily disable rp\_filter:
[](#2-temporarily-disable-rp_filter)
This may be necessary to allow packages that don't have the proper return route to be processed on your system.
Execute the following command:
```
`for i in /proc/sys/net/ipv4/conf/\*/rp\_filter ; do echo 0 \> $i ; done
`
```
This will disable rp\_filter on all interfaces just for this session, after reboot your device will restore its default settings for rp\_filter.
After disabling rp\_filter please re-check qBittorrent - it should detect incoming connections possibility and should be able to seed using the `tun0` interface.
After doing the checks above you can disable rp\_filter permanently if necessary.
### 3. Disable rp\_filter permanently:
[](#3-disable-rp_filter-permanently)
Execute the following commands:
```
`sed -i 's/net.ipv4.conf.default.rp\_filter=2/net.ipv4.conf.default.rp\_filter=0/g' /etc/sysctl.d/10-network-security.conf
sed -i 's/net.ipv4.conf.all.rp\_filter=2/net.ipv4.conf.all.rp\_filter=0/g' /etc/sysctl.d/10-network-security.conf
`
```
This should prevent rp\_filter from enabling after the client's device reboots.
That's all.
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