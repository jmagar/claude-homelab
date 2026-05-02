SABnzbd -
Wiki -
How to hide SABnzbd behind a Reverse Proxy
#
Wiki menu
Wiki
[User Manual](/wiki/)
[FAQ](/wiki/faq)
[Contact](/wiki/contact)
[
Introduction
](#wiki-menu-start)
* [Quick Setup](/wiki/introduction/quick-setup)
* [Using SABnzbd](/wiki/introduction/usage)
* [NZB Sources](/wiki/introduction/nzb-sources)
* [How To's](/wiki/introduction/howto)
* [Known issues](/wiki/introduction/known-issues)
[
Installation
](#wiki-menu-installation)
* [Windows](/wiki/installation/install-windows)
* [macOS](/wiki/installation/install-macos)
* [Unix](/wiki/installation/install-unix)
* [NAS](/wiki/installation/install-nas)
* [From source](/wiki/installation/install-off-modules)
[
Configuration
](#wiki-menu-configure)
* [Configure](/wiki/configuration/5.0/configure)
* [General](/wiki/configuration/5.0/general)
* [Folders](/wiki/configuration/5.0/folders)
* [Servers](/wiki/configuration/5.0/servers)
* [Categories](/wiki/configuration/5.0/categories)
* [Switches](/wiki/configuration/5.0/switches)
* [Sorting](/wiki/configuration/5.0/sorting)
* [Notifications](/wiki/configuration/5.0/notifications)
* [Scheduling](/wiki/configuration/5.0/scheduling)
* [RSS](/wiki/configuration/5.0/rss)
* [Special Settings](/wiki/configuration/5.0/special)
* [API Reference](/wiki/configuration/5.0/api)
[
Scripts
](#wiki-menu-scripts)
* [Pre-queue scripts](/wiki/configuration/5.0/scripts/pre-queue-scripts)
* [Post-processing scripts](/wiki/configuration/5.0/scripts/post-processing-scripts)
* [Notification scripts](/wiki/configuration/5.0/scripts/notification-scripts)
[
Advanced Topics
](#wiki-menu-advanced)
* [High-Speed Tweaks](/wiki/advanced/highspeed-downloading)
* [HTTPS for the Web UI](/wiki/advanced/https)
* [Command line options](/wiki/advanced/command-line-parameters)
* [Folder setup](/wiki/advanced/directory-setup)
* [Unix permissions](/wiki/advanced/unix-permissions)
* [RAR with password](/wiki/advanced/password-protected-rars)
* [IPv6](/wiki/advanced/ipv6)
* [SSL/TLS security](/wiki/advanced/certificate-errors)
* [SSL Ciphers](/wiki/advanced/ssl-ciphers)
* [Windows Service](/wiki/advanced/sabnzbd-as-a-windows-service)
* [Android](/wiki/advanced/android)
[Extensions for SABnzbd](/wiki/extensions-for-sabnzbd)
[Special Newshosting offer for SABnzbd users: 70% Off + 3 FREE MONTHS!](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=wt)
##
[
Incorrect or missing information?
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+How+to+hide+SABnzbd+behind+a+Reverse+Proxy&amp;body=##+URL:+/wiki/extra/howto-reverse-proxy.html
Improvement:
>)
How to hide SABnzbd behind a Reverse Proxy
Assuming the server is already running correctly and SABnzbd is running on `http://localhost:8080`.
### What is a Reverse Proxy?
A reverse proxy, also known as an "inbound" proxy is a server that receives requests from the Internet and forwards (proxies) them to a small set of servers, usually located on an internal network and not directly accessible from outside.
A reverse proxy can be used to allow authenticated users access to an intranet even when they are located outside. Users on the internal network can access intranet servers directly (their IP address is their authentication), but users outside it must authenticate themselves to the proxy server (usually with a username and password) in order to be allowed in.
### Why use a Reverse Proxy?
Lets say you have SABnzbd, Sonarr, and Radarr installed and working locally.
To get to each of these you would navigate to their web server's `ip:port`.
Depending on how you setup the apps (binding an IP to your network adapter) you may not be able to get to the sites outside your network.
NOTE You can use your cellphone with WiFi turned off if you want an easy way to test access outside your network.
So while most likely the apps are running on the same machine then you just have to change the port, but this is not very user friendly.
Using a reverse proxy you could just go to an IP (or hostname if you use dyndns or something similar) but then use `/sabnzbd`, `/sonarr`, `/whatever` instead of a different port. Not only does this make accessing your multiple apps more user friendly, it allows flexibility of being a gatekeeper to all the sites (for access/security/data logging).
</p>
Below are sample configurations for the two main webservers, Apache and Ngnix:
## Apache 2
Required modules: `proxy.load` and `proxy\_http.load`.
The following goes in Apache's `httpd.conf` file.
For Linux: `/etc/apache2/httpd.conf` and for Windows: `C:\\Program Files\\Apache2.2\\conf\\httpd.conf`.
```
`\<Location /sabnzbd\>
order deny,allow
deny from all
allow from all
ProxyPass http://localhost:8080/sabnzbd
ProxyPassReverse http://localhost:8080/sabnzbd
\</Location\>`
```
NOTE On Apache 2.4 Config files for `a2enmod` and `proxy proxy\_http` are located in:
`/etc/apache2/sites-available/000-default.conf` (for HTTP) and `\*ssl\*.conf` (for HTTPS).
## Nginx
The following files go in the nginx `conf.d` directory `/etc/nginx/conf.d/`.
### ssl.conf
```
`ssl\_certificate /etc/pki/tls/certs/example\_com.crt;
ssl\_certificate\_key /etc/pki/tls/private/example\_com.key;
ssl\_session\_timeout 5m;
ssl\_protocols TLSv1 TLSv1.1 TLSv1.2;
ssl\_ciphers HIGH:!aNULL:!MD5;
ssl\_prefer\_server\_ciphers on;`
```
### proxy.conf
```
`client\_max\_body\_size 10m;
client\_body\_buffer\_size 128k;
#Timeout if the real server is dead
proxy\_next\_upstream error timeout invalid\_header http\_500 http\_502 http\_503;
# Advanced Proxy Config
send\_timeout 5m;
proxy\_read\_timeout 240;
proxy\_send\_timeout 240;
proxy\_connect\_timeout 240;
# Basic Proxy Config
proxy\_set\_header Host $host;
proxy\_set\_header X-Real-IP $remote\_addr;
proxy\_set\_header X-Forwarded-For $proxy\_add\_x\_forwarded\_for;
proxy\_set\_header X-Forwarded-Proto https;
proxy\_redirect http:// $scheme://;
proxy\_http\_version 1.1;
proxy\_set\_header Connection "";
proxy\_cache\_bypass $cookie\_session;
proxy\_no\_cache $cookie\_session;
proxy\_buffers 32 4k;`
```
### sabnzbd.conf
```
`upstream SABnzbd {
server localhost:8080;
keepalive 512;
}
upstream sickbeard {
server localhost:8081;
keepalive 512;
}
server {
listen 80;
listen 443 default ssl;
server\_name example.com;
access\_log /var/log/nginx/sabnzbd-access.log;
error\_log /var/log/nginx/sabnzbd-error.log debug;
if ( $scheme = http )
{
rewrite ^ https://$server\_name$request\_uri? permanent;
}
include /etc/nginx/conf.d/ssl.conf;
location / {
root /usr/share/nginx/html;
index index.html index.htm;
}
location /sabnzbd {
include /etc/nginx/conf.d/proxy.conf;
proxy\_pass http://localhost:8080/sabnzbd;
}
location /sickbeard {
include /etc/nginx/conf.d/proxy.conf;
proxy\_pass http://localhost:8081;
}
location /nginx\_status {
stub\_status on;
access\_log off;
}
}`
```
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)