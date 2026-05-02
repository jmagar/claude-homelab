Nginx | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
"[Nginx](https://www.nginx.com/) (pronounced "engine X") is a web server which can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache. The software was created by Igor Sysoev and first publicly released in 2004.[9] A company of the same name was founded in 2011 to provide support and Nginx plus paid software." - [Wikipedia](https://en.wikipedia.org/wiki/Nginx)
## Nginx from a subdomain (jellyfin.example.org)[​](#nginx-from-a-subdomain-jellyfinexampleorg)
Create the file `/etc/nginx/sites-available/jellyfin` which will forward requests to Jellyfin. After you've finished, you will need to symlink this file to /etc/nginx/sites-enabled and then reload nginx. This example assumes you've already acquired certifications as documented in our [Let's Encrypt](https://jellyfin.org/docs/general/networking/letsencrypt#nginx) guide.
Note that a server listening on http port 80 is required for the Certbot / Let's Encrypt certificate renewal process.
### HTTPS config example[​](#https-config-example)
```
`
server {
# Nginx versions prior to 1.25
#listen 443 ssl http2;
#listen [::]:443 ssl http2;
# Nginx versions 1.25+
listen 443 ssl;
listen [::]:443 ssl;
http2 on;
server\_name jellyfin.example.org;
## The default `client\_max\_body\_size` is 1M, this might not be enough for some posters, etc.
client\_max\_body\_size 20M;
# Comment next line to allow TLSv1.0 and TLSv1.1 if you have very old clients
ssl\_protocols TLSv1.3 TLSv1.2;
ssl\_certificate /etc/letsencrypt/live/example.org/fullchain.pem;
ssl\_certificate\_key /etc/letsencrypt/live/example.org/privkey.pem;
include /etc/letsencrypt/options-ssl-nginx.conf;
ssl\_dhparam /etc/letsencrypt/ssl-dhparams.pem;
ssl\_trusted\_certificate /etc/letsencrypt/live/example.org/chain.pem;
# use a variable to store the upstream proxy
set $jellyfin 127.0.0.1;
# Security / XSS Mitigation Headers
add\_header X-Content-Type-Options "nosniff";
# Permissions policy. May cause issues with some clients
add\_header Permissions-Policy "accelerometer=(), ambient-light-sensor=(), battery=(), bluetooth=(), camera=(), clipboard-read=(), display-capture=(), document-domain=(), encrypted-media=(), gamepad=(), geolocation=(), gyroscope=(), hid=(), idle-detection=(), interest-cohort=(), keyboard-map=(), local-fonts=(), magnetometer=(), microphone=(), payment=(), publickey-credentials-get=(), serial=(), sync-xhr=(), usb=(), xr-spatial-tracking=()" always;
# Content Security Policy
# See: https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP
# Enforces https content and restricts JS/CSS to origin
# External Javascript (such as cast\_sender.js for Chromecast) must be whitelisted.
add\_header Content-Security-Policy "default-src https: data: blob: ; img-src 'self' https://\* ; style-src 'self' 'unsafe-inline'; script-src 'self' 'unsafe-inline' https://www.gstatic.com https://www.youtube.com blob:; worker-src 'self' blob:; connect-src 'self'; object-src 'none'; font-src 'self'";
location / {
# Proxy main Jellyfin traffic
proxy\_pass http://$jellyfin:8096;
proxy\_set\_header Host $host;
proxy\_set\_header X-Real-IP $remote\_addr;
proxy\_set\_header X-Forwarded-For $proxy\_add\_x\_forwarded\_for;
proxy\_set\_header X-Forwarded-Proto $scheme;
proxy\_set\_header X-Forwarded-Protocol $scheme;
proxy\_set\_header X-Forwarded-Host $http\_host;
# Disable buffering when the nginx proxy gets very resource heavy upon streaming
proxy\_buffering off;
}
location /socket {
# Proxy Jellyfin Websockets traffic
proxy\_pass http://$jellyfin:8096;
proxy\_http\_version 1.1;
proxy\_set\_header Upgrade $http\_upgrade;
proxy\_set\_header Connection "upgrade";
proxy\_set\_header Host $host;
proxy\_set\_header X-Real-IP $remote\_addr;
proxy\_set\_header X-Forwarded-For $proxy\_add\_x\_forwarded\_for;
proxy\_set\_header X-Forwarded-Proto $scheme;
proxy\_set\_header X-Forwarded-Protocol $scheme;
proxy\_set\_header X-Forwarded-Host $http\_host;
}
}
server {
listen 80;
listen [::]:80;
server\_name jellyfin.example.org;
return 301 https://$host$request\_uri;
}
`
```
## Extra Nginx Configurations[​](#extra-nginx-configurations)
### Censor sensitive information in logs[​](#censor-sensitive-information-in-logs)
This censors any 'api\_key' or 'ApiKey' URL parameter from the logfile.
```
`
#Must be in HTTP block
log\_format stripsecrets '$remote\_addr $host - $remote\_user [$time\_local] '
'"$secretfilter" $status $body\_bytes\_sent '
'$request\_length $request\_time $upstream\_response\_time '
'"$http\_referer" "$http\_user\_agent"';
map $request $secretfilter {
\~\*^(?\<prefix1\>.\*[\\?&]api\_key=)([^&]\*)(?\<suffix1\>.\*)$ "${prefix1}\*\*\*$suffix1";
\~\*^(?\<prefix1\>.\*[\\?&]ApiKey=)([^&]\*)(?\<suffix1\>.\*)$ "${prefix1}\*\*\*$suffix1";
default $request;
}
#Must be inside server block
#Insert into all servers where you want filtering (e.g HTTP + HTTPS block)
access\_log /var/log/nginx/access.log stripsecrets;
`
```
* [Nginx from a subdomain (jellyfin.example.org)](#nginx-from-a-subdomain-jellyfinexampleorg)
* [HTTPS config example](#https-config-example)
* [Extra Nginx Configurations](#extra-nginx-configurations)
* [Censor sensitive information in logs](#censor-sensitive-information-in-logs)