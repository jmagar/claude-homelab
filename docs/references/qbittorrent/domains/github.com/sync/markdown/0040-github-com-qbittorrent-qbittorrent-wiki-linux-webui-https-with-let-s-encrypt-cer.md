Linux WebUI HTTPS with Let's Encrypt certificates and NGINX SSL reverse proxy · qbittorrent/qBittorrent Wiki · GitHub
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
# Linux WebUI HTTPS with Let's Encrypt certificates and NGINX SSL reverse proxy
[Jump to bottom](#wiki-pages-box)
Chocobo1 edited this page May 1, 2024
&middot;
[8 revisions](/qbittorrent/qBittorrent/wiki/Linux-WebUI-HTTPS-with-Let&#39;s-Encrypt-certificates-and-NGINX-SSL-reverse-proxy/_history)
# Introduction
[](#introduction)
This is probably the easiest, most extensible and trouble-free way of setting up qBittorrent's WebUI with HTTPS.
It combines ideas from these other articles of the wiki: [1](https://github.com/qbittorrent/qBittorrent/wiki/Linux-WebUI-setting-up-HTTPS-with-Let's-Encrypt-certificates), [2](https://github.com/qbittorrent/qBittorrent/wiki/NGINX-Reverse-Proxy-for-Web-UI).
The benefit of this setup is that with one single domain and certificate you are able to setup secure HTTPS access to various different services in your server alongside one another.
For example, you may have qBittorrent's WebUI accessible at `yourdomain.com/qbt`, a simple homepage served with Apache at `yourdomain.com`, your Nextcloud instance at `yourdomain.com/nextcloud`, etc.
This guide assumes you have a working qbitorrent-nox setup (check [this](https://github.com/qbittorrent/qBittorrent/wiki/Running-qBittorrent-without-X-server-(WebUI-only,-systemd-service-set-up,-Ubuntu-15.04-or-newer)) article if you haven't).
This guide also assumes that:
* you know how to and can forward ports on your router, to forward ports 80 and 443.
* you have setup a DNS pointing to the IP you are running the Web UI from (you can use a free one like [Duck DNS](https://www.duckdns.org/)).
The overall architecture of the system will be:
```
` \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
Outside world (insecure) | Your machine (secure) |
You \<-------HTTPS (secure)-------|-\> NGINX \<----HTTP-----\> qbittorrent WebUI |
| |
------------------------------------------------
`
```
# Install the prerequisites
[](#install-the-prerequisites)
## Install `certbot`
[](#install-certbot)
[`certbot`](https://certbot.eff.org/) is the recommended ACME client for requesting and managing Let's Encrypt certificates.
It is available on the official Ubuntu repositories; it won't be the most recent version, but you don't really need the latest and greatest for this to work just fine.
However, if you want to use the most recent version, you will unfortunately have to install it via the proprietary Snap store.
Regrettably, the Certbot team no longer maintains their PPA.
You will also need the `nginx` plugin.
```
sudo apt update
sudo apt install certbot
sudo apt install python-certbot-nginx # this is needed for the nginx plugin
```
## Install `nginx`
[](#install-nginx)
You can use the version in the repositories, but if you want the most recent version you can use the PPA.
```
sudo apt update && sudo apt upgrade -y # first update all packages in the system
sudo add-apt-repository ppa:nginx/stable
sudo apt install nginx
```
# Setup
[](#setup)
## Setup the Web UI
[](#setup-the-web-ui)
1. Access your WebUI, and go to Tools -\> Options -\> WebUI
2. Change the following settings if they are not already like so:
* IP address: 127.0.0.1
* Port: some free port on your system that is NOT accessible through the outside world.
In this case we will use port `30000`.
* Use UPnP / NAT-PMP to forward the port from my router: unchecked.
* Use HTTPS instead of HTTP: unchecked.
* Optional: if you want to use "enable host header validation", enable that checkbox, and add `127.0.0.1` to the "server domains" text box.
Don't forget to also configure the `proxy\_set\_header` directive in the nginx config below.
## Set up NGINX
[](#set-up-nginx)
1. Forward ports 80 and 443 in your router.
2. Allow ports 80 and 443 through your system firewall if you have one.
If you have `ufw` as your system firewall, it is as simple as:
```
sudo ufw allow 80 && sudo ufw allow 443 && sudo ufw reload
```
3. Clear the default files
```
sudo rm /etc/nginx/sites-available/\*
sudo rm /etc/nginx/sites-enabled/\*
```
4. Stop `nginx` if it is running: `sudo systemctl stop nginx.service`
5. Create a config file for your reverse proxy
```
sudo touch /etc/nginx/sites-available/yoursite
cd /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/yoursite yoursite
```
6. Open the file with your favourite text editor and paste something like the following reference configuration (adjust according to your needs):
```
# change "yourdomain.com" and similar to your actual domain
server {
listen 80;
listen [::]:80;
server\_name yourdomain.com www.yourdomain.com;
return 301 https://yourdomain.com$request\_uri;
}
server {
listen 443;
server\_name yourdomain.com www.yourdomain.com;
# at this point we haven't created the certificate yet, but that's ok.
# if, when creating the certificate (see below) it goes to another folder, be sure
# to change these lines accordingly
ssl\_certificate /etc/letsencrypt/live/yourdomain.com/fullchain.pem;
ssl\_trusted\_certificate /etc/letsencrypt/live/yourdomain.com/chain.pem;
ssl\_certificate\_key /etc/letsencrypt/live/yourdomain.com/privkey.pem;
ssl on;
ssl\_prefer\_server\_ciphers on;
ssl\_protocols TLSv1.3 TLSv1.2;
ssl\_ciphers 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256';
ssl\_ecdh\_curve prime256v1:secp384r1:secp521r1;
ssl\_session\_cache shared:TLS:50m;
ssl\_session\_timeout 1d; # default is 5 min
ssl\_session\_tickets off;
# OCSP stapling
ssl\_stapling on;
ssl\_stapling\_verify on;
access\_log /var/log/nginx/yourdomain.access.log;
location /qbt/ {
proxy\_pass http://127.0.0.1:30000/;
proxy\_http\_version 1.1;
http2\_push\_preload on; # Enable http2 push
proxy\_set\_header Host 127.0.0.1:30000;
proxy\_set\_header X-Forwarded-Proto $scheme;
proxy\_set\_header X-Forwarded-Host $http\_host;
proxy\_set\_header X-Forwarded-For $remote\_addr;
proxy\_set\_header X-Real-IP $remote\_addr;
# optionally, you can adjust the POST request size limit, to allow adding a lot of torrents at once:
#client\_max\_body\_size 100M;
# since v4.2.2, is possible to configure qBittorrent
# to set the "Secure" flag for the session cookie automatically.
# However, that option does nothing unless using qBittorrent's built-in HTTPS functionality.
# For this use case, where qBittorrent itself is using plain HTTP
# (and regardless of whether or not the external website uses HTTPS),
# the flag must be set here, in the proxy configuration itself:
proxy\_cookie\_path / "/; Secure";
}
# OPTIONAL: serve static HTML files at the root of the domain, like a simple homepage
location / {
root /var/www/html;
try\_files $uri $uri/ =404;
}
# OPTIONAL: you can add more "location { (...) }" stanzas for other services, such as Nextcloud, etc
#location /other\_webapp {
# change the location and port to the location and port the application is actually listening on
#proxy\_pass http://localhost:8080/;
#proxy\_set\_header X-Forwarded-Proto $scheme;
#proxy\_set\_header X-Forwarded-Host $http\_host;
#proxy\_set\_header X-Forwarded-For $proxy\_add\_x\_forwarded\_for;
#proxy\_set\_header X-Real-IP $remote\_addr;
#}
}
```
## Obtain the certificate
[](#obtain-the-certificate)
Run the following commands to obtain your certificate (replace `yourdomain.com` with your actual domain):
```
sudo certbot --nginx certonly --preferred-challenges http --must-staple --redirect --hsts --uir --staple-ocsp --rsa-key-size 4096 --domain yourdomain.com --domain www.yourdomain.com
```
Take note of the location where `certbot` stored the certificate, and adjust the nginx configuration file if needed.
If your `certbot` is setup correctly, it will renew your certificate automatically, so you do not need to worry.
You can manually test the renewal process with `sudo certbot renew --dry-run`, or actually manually renew your certificates with `sudo certbot renew`.
Note: the following five options used above are optional, but good for hardened security:
* `--rsa-key-size 4096`
* `--must-staple`
* `--redirect`
* `--hsts`
* `--uir`
* `--staple-ocsp`
Refer to the [documentation](https://certbot.eff.org/docs/using.html#certbot-command-line-options) for more info.
# Test your setup
[](#test-your-setup)
Start nginx: `sudo systemctl restart nginx.service`
Access your WebUI via `yourdomain.com/qbt`.
You should see the qBittorrent Web UI and the indication that your connection is over HTTPS.
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