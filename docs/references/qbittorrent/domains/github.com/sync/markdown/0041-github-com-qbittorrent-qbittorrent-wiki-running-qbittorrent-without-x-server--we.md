Running qBittorrent without X server (WebUI only, systemd service set up, Ubuntu 15.04 or newer) · qbittorrent/qBittorrent Wiki · GitHub
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
# Running qBittorrent without X server (WebUI only, systemd service set up, Ubuntu 15.04 or newer)
[Jump to bottom](#wiki-pages-box)
xavier2k6 edited this page Jan 22, 2026
&middot;
[6 revisions](/qbittorrent/qBittorrent/wiki/Running-qBittorrent-without-X-server-(WebUI-only,-systemd-service-set-up,-Ubuntu-15.04-or-newer)/_history)
## Introduction
[](#introduction)
qBittorrent has a feature-rich Web UI allowing users to control qBittorrent remotely.
`qbittorrent-nox` is a version of qBittorrent that only has a WebUI instead of a windowed desktop GUI.
This is ideal for headless servers without the X window system such as Ubuntu Server.
This guide will show you how to setup `qbittorrent-nox` to run as a managed background service (daemon) by setting it up as a `systemd` service.
It can then be customized like any other `systemd` service, to automatically start on boot, for instance.
Side Note: these instructions are written with Ubuntu in mind but should be much the same if not exactly the same for any modern distro that uses `systemd`.
All instructions assume very basic knowledge of how to use the terminal.
### Install `qbittorrent-nox`
[](#install-qbittorrent-nox)
Official qBittorrent packages are available for all mainstream Linux distributions, but distributions may not always contain the latest package versions.
For Ubuntu, it's advisable to install `qbittorrent-nox` from the official PPAs to get the latest version.
Refer to [https://github.com/qbittorrent/qBittorrent/wiki/Installing-qBittorrent](https://github.com/qbittorrent/qBittorrent/wiki/Installing-qBittorrent) for more information.
Alternatively, you can always compile from source. Check out the articles under the [Compilation](https://github.com/qbittorrent/qBittorrent/wiki#compilation) section of the Wiki home page for more information.
### Create a separate user account (optional - you may want to do this for security depending on your setup)
[](#create-a-separate-user-account-optional---you-may-want-to-do-this-for-security-depending-on-your-setup)
Create the user that `qbittorrent-nox` will run under with:
```
sudo adduser qbtuser
```
Give it a password when prompted. You may leave every other value blank.
### Disable qbtuser account SSH login (optional)
[](#disable-qbtuser-account-ssh-login-optional)
You may also want to disable login for the account (from SSH) for security reasons. The account will still be usable locally:
```
sudo usermod -s /usr/sbin/nologin qbtuser
```
This can be reversed if necessary with the command:
```
sudo usermod -s /bin/bash qbtuser
```
## Initialize qBittorrent
[](#initialize-qbittorrent)
Before we set up `qbittorrent-nox` to run as a background service, it's advisable to run it once so that we can get some configuration out of the way such as the legal disclaimer.
First, switch to the user that will run qbittorrent:
```
sudo su qbtuser
```
Then run `qbittorrent-nox`.
It will prompt you to accept the legal disclaimer.
You must agree to it in order to proceed.
Then, you should see the following information printed on your terminal:
```
\*\*\*\*\*\*\*\* Information \*\*\*\*\*\*\*\*
To control qBittorrent, access the Web UI at http://localhost:8080
The Web UI administrator user name is: admin
The Web UI administrator password is still the default one: adminadmin
This is a security risk, please consider changing your password from program preferences.
```
Now is a good time to adjust some qBittorrent settings.
Visit the URL mentioned in `To control qBittorrent, access the Web UI at...` (might be different in your case), and log in with the credentials given.
Then you can go to `Tools -\> Options` to change settings such as the WebUI port.
Quit the running `qbittorrent-nox` process by pressing Ctrl-c on your keyboard:
```
^CCatching signal: SIGINT
Exiting cleanly
```
You can now stop impersonating the qbittorrent user by executing the `exit` command or simply pressing `Ctrl-d`.
## Setup the `systemd` service
[](#setup-the-systemd-service)
If you are not using a very ancient version of qBittorrent, usually a service file will be already installed and it should be located at `/usr/lib/systemd/system/qbittorrent-nox@.service`
In case the file isn't present on your system, you can create one by copying the contents from here: [https://github.com/qbittorrent/qBittorrent/blob/master/dist/unix/systemd/qbittorrent-nox%40.service.in](https://github.com/qbittorrent/qBittorrent/blob/master/dist/unix/systemd/qbittorrent-nox@.service.in). Save it and run `sudo systemctl daemon-reload` to make the service manager aware of it.
* To start the service run: `sudo systemctl start qbittorrent-nox@qbtuser`
* To let the service start up on boot: `sudo systemctl enable qbittorrent-nox@qbtuser`
***The rest of this section is outdated and it remains here as historical record.***
On Ubuntu, system-wide `systemd` service definition files are located under `/etc/systemd/system/` (for other distros it might be a different directory), so we'll create the service definition file for `qbittorrent-nox` there.
Create a new file, `/etc/systemd/system/qbittorrent.service`, and edit it with the appropriate permissions and text editor of your choice, for example:
```
sudoedit /etc/systemd/system/qbittorrent.service
```
Save the file with the following contents or similar.
You may modify them as-needed to better suit your needs:
```
[Unit]
Description=qBittorrent-nox service
Documentation=man:qbittorrent-nox(1)
Wants=network-online.target
After=network-online.target nss-lookup.target
[Service]
# if you have systemd \< 240 (Ubuntu 18.10 and earlier, for example), you probably want to use Type=simple instead
Type=exec
# change user as needed
User=qbtuser
# The -d flag should not be used in this setup
ExecStart=/usr/bin/qbittorrent-nox
# uncomment this for versions of qBittorrent \< 4.2.0 to set the maximum number of open files to unlimited
#LimitNOFILE=infinity
# uncomment this to use "Network interface" and/or "Optional IP address to bind to" options
# without this binding will fail and qBittorrent's traffic will go through the default route
# AmbientCapabilities=CAP\_NET\_RAW
[Install]
WantedBy=multi-user.target
```
Then run `sudo systemctl daemon-reload` to update the service manager.
The qBittorrent service is now ready to be used. To start the service on system boot, refer to the next section.
### Controlling the service
[](#controlling-the-service)
* Start the service: `sudo systemctl start qbittorrent`
* Check service status: `systemctl status qbittorrent`
* Stop the service: `sudo systemctl stop qbittorrent`
* Enable it to start up on boot: `sudo systemctl enable qbittorrent`
* To disable: `sudo systemctl disable qbittorrent`.
It simply disables automatic startup of the qBittorrent service.
Refer to the `systemd` documentation to know of more operations you can do on services.
### Logging
[](#logging)
qBittorrent will still log most interesting stuff to its usual logging directory. In this example, this would be `/home/qbtuser/.local/share/data/qBittorrent/logs/`.
However, some output can probably still be viewed with:
```
sudo journalctl -u qbittorrent.service
```
For more information on how to use and customize `systemd` logging, refer to its documentation.
###
`systemd` service dependencies (optional)
[](#systemd-service-dependencies-optional)
Let's say that you've configured `qbittorrent-nox` to download files to a directory that is in another drive, for example, mounted on `/media/user/volume`.
It's important that you edit the service created above and add dependencies to `systemd` service to prevent qBittorrent from writing files on a directory that it should not, in case your drive fails to mount or is accidentally unmounted.
After you added the mount point to the `/etc/fstab`, it should have a line like this:
```
UUID=aa-bb-cc /media/volume ext4 defaults,nofail 0 0
```
The `nofail` option prevents the system from stopping the boot process in case the drive can't mount on startup.
You should edit `/etc/systemd/system/qbittorrent.service` to add your volume's systemd name (for example: `media-volume.mount`) to the line `After=network-online.target` and add the line `BindsTo=media-volume.mount` to bind the qbittorrent service to the mount point that you want it to write the files.
Your service file should look like this:
```
# ... other stuff ...
[Unit]
# ...
After=network.target nss-lookup.target media-volume.mount
BindsTo=media-volume.mount
# ...
```
The `media-volume.mount` is a `systemd` convention created dynamically at boot, based on the entries found in `/etc/fstab`.
Conventions such as these are used by `systemd` to define conditions around services, such as requiring a drive to be mounted before the service will start.
Refer to [Systemd.mount reference](http://man7.org/linux/man-pages/man5/systemd.mount.5.html) for further reading.
It follows a simple logic: if your drive is mounted on `/media/volume`, the unit name will be `media-volume.mount`, if it's on `/mnt/disk`, the unit will be `mnt-disk.mount`.
For more complex paths you can use `systemd-escape --path`:
```
$ systemd-escape --path /mnt/disk\\ with\\ spaces-10
mnt-disk\\x20with\\x20spaces\\x2d10
```
Using this to define the qbittorrent-nox service file, if the drive can't mount when booting or if the drive is unmounted after qbittorrent has been started, it will not allow it to start or force it to stop, preventing from writing when the drive is not ready or present.
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