Linux WebUI setting up HTTPS with Let's Encrypt certificates · qbittorrent/qBittorrent Wiki · GitHub
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
# Linux WebUI setting up HTTPS with Let's Encrypt certificates
[Jump to bottom](#wiki-pages-box)
Chocobo1 edited this page May 1, 2024
&middot;
[4 revisions](/qbittorrent/qBittorrent/wiki/Linux-WebUI-setting-up-HTTPS-with-Let&#39;s-Encrypt-certificates/_history)
# Introduction
[](#introduction)
You can easily setup HTTPS for the web interface with a Let's Encrypt certificate. The advantage of this method over using self-signed certificates is that all modern browsers will trust Let's Encrypt certificates by default, so you'll get no warnings when accessing the web page and there will be no need to add security exceptions.
This guide assumes you have a working qbitorrent-nox setup (check [this](https://github.com/qbittorrent/qBittorrent/wiki/Setting-up-qBittorrent-on-Ubuntu-server-as-daemon-with-Web-interface-(15.04-and-newer)) article if you haven't).
This guide also assumes that:
* you know how to and can forward ports on your router.
* you have setup a DNS pointing to the IP you are running the Web UI from (you can use a free one like [Duck DNS](https://www.duckdns.org/)).
# Install `certbot`
[](#install-certbot)
[`certbot`](https://certbot.eff.org/) is the recommended ACME client for requesting and managing Let's Encrypt certificates. It is available on the official Ubuntu repositories, but there is an official PPA always updated with the most recent stable version, so that is the one to install.
```
`sudo apt update && sudo apt upgrade -y # first update all packages in the system
sudo add-apt-repository ppa:certbot/certbot
sudo apt update
sudo apt install certbot
`
```
# Obtaining the certificate
[](#obtaining-the-certificate)
You will need either port 80 or 443 free during this process. If you have additional software running on your machine bound to port 443, you will want to use port 80 and vice-versa. **In this example we will use port 80 for the certificate issuance process**. If you want to use port 443, the only thing that you need to change besides the port number would be the `--preferred-challenges` from `http` to `tls-sni` in the command below. Refer to the cerbot documentation for more information on this.
The method used for obtaining the certificate will be the `standalone` method. Before you actually run the necessary command, you need to:
* temporarily stop any program/server bound to port 80 (check with `sudo netstat -tulpn`, for example);
* forward port 80 on your router;
* allow port 80 on your firewall (most likely `ufw`) if it is not already allowed;
Now, run the following commands to obtain your certificate (replace `yourwebuidomain.duckdns.org` with your actual domain):
```
sudo ufw allow 80
sudo ufw reload
sudo certbot certonly --standalone --preferred-challenges http --must-staple --redirect --hsts --uir --staple-ocsp --rsa-key-size 4096 --domain yourwebuidomain.duckdns.org
```
After the certificate is generated successfully, you can restart any program you had listening on port 80 or maybe re-block port 80 if you weren't using it (`sudo ufw deny 80 && sudo ufw reload`).
Note: the following five options used above are optional, but good for hardened security:
* --rsa-key-size 4096
* --must-staple
* --redirect
* --hsts
* --uir
* --staple-ocsp
Refer to the [documentation](https://certbot.eff.org/docs/using.html#certbot-command-line-options) for more info
# Installing the certificate on the Web UI
[](#installing-the-certificate-on-the-web-ui)
1. Go to your Web UI, `yourwebuidomain.duckdns.org`.
2. On the Tools -\> Options... menu, go to the Web UI tab.
3. In the "Server domains:" field put `yourwebuidomain.duckdns.org`
4. Tick the "Use HTTPS instead of HTTP" checkbox
5.
* If using version `4.2.0` or later:
* In the "Key:" text box paste the *path* of the key file.
* In the "Certificate:" text box paste the *path* of the certificate file.
* **Important Note**: since the directory where these files are located (for example, `/etc/letsencrypt/live/yourwebuidomain.duckdns.org/`) is usually only readable by `root`, you may first need to copy the files somewhere that is readable by the user account that qBittorrent is running under. Do not change the permissions of the original `certbot` directories.
* If using older versions:
* In the "Key:" text box paste the *contents* of the key file (for example, `/etc/letsencrypt/live/yourwebuidomain.duckdns.org/privkey.pem`). You may need root privileges to access this file.
* In the "Certificate:" text box paste the *contents* of the certificate file (for example, `/etc/letsencrypt/live/yourwebuidomain.duckdns.org/fullchain.pem`). You may need root privileges to access this file.
* Click save, close the tab and now you should only be able to access your Web UI via HTTPS.
# Automating certificate renewal
[](#automating-certificate-renewal)
Your certificates expire after 90 days, but you can renew them manually or setup automatic renewal for your certificates.
A possible renewal command for a user that does not normally use port 80 can be:
`sudo certbot renew --pre-hook "ufw allow 80 && ufw reload" --post-hook "ufw deny 80 && ufw reload"`
If you have a program listening on port 80, be sure to use the `--pre-hook` and `--post-hook` flags to restart it (for example, `--pre-hook "stop\_my\_program.sh"` and `--post-hook "restart\_my\_program.sh"`).
Additionally, you can use `certbot` hooks to copy certificate files around and even to shutdown/restart qBittorrent and possibly even modify its config.
Each time the command is run, `certbot` checks if any certificate is more than 60 days old, and only actually renews those.
You can put your renewal command (without `sudo`) in a crontab or a systemd unit set to run daily or twice a day, which is what the Let's Encrypt folks recommend.
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