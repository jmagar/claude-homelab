Reverse Proxy | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
warning
Base URLs cannot be configured in Seerr. With this limitation, only subdomain configurations are supported.
A Nginx subfolder workaround configuration is provided below, but it is not officially supported.
## Nginx[​](#nginx)
* Subdomain
* Subfolder
* SWAG
* Nginx Proxy Manager
Add the following configuration to a new file `/etc/nginx/sites-available/seerr.example.com.conf`:
```
`server {
listen 80;
server\_name seerr.example.com;
return 301 https://$server\_name$request\_uri;
}
server {
listen 443 ssl http2;
server\_name seerr.example.com;
ssl\_certificate /etc/letsencrypt/live/seerr.example.com/fullchain.pem;
ssl\_certificate\_key /etc/letsencrypt/live/seerr.example.com/privkey.pem;
proxy\_set\_header Referer $http\_referer;
proxy\_set\_header Host $host;
proxy\_set\_header X-Real-IP $remote\_addr;
proxy\_set\_header X-Real-Port $remote\_port;
proxy\_set\_header X-Forwarded-Host $host:$remote\_port;
proxy\_set\_header X-Forwarded-Server $host;
proxy\_set\_header X-Forwarded-Port $remote\_port;
proxy\_set\_header X-Forwarded-For $proxy\_add\_x\_forwarded\_for;
proxy\_set\_header X-Forwarded-Proto $scheme;
proxy\_set\_header X-Forwarded-Ssl on;
location / {
proxy\_pass http://127.0.0.1:5055;
}
}
`
```
Then, create a symlink to `/etc/nginx/sites-enabled`:
```
`sudo ln -s /etc/nginx/sites-available/seerr.example.com.conf /etc/nginx/sites-enabled/seerr.example.com.conf
`
```
## Caddy (v2)[​](#caddy-v2)
Create a Caddyfile with the following content:
```
`seerr.example.com {
reverse\_proxy http://127.0.0.1:5055
}
`
```
Deploy the Caddyfile by running:
```
`
sudo caddy run --config /path/to/Caddyfile
`
```
Verify by visiting [https://seerr.example.com](https://seerr.example.com) in your browser.
note
Caddy will automatically obtain and renew SSL certificates for your domain.
## Traefik (v2)[​](#traefik-v2)
Add the following labels to the Seerr service in your `compose.yaml` file:
```
`labels:
- 'traefik.enable=true'
## HTTP Routers
- 'traefik.http.routers.seerr-rtr.entrypoints=https'
- 'traefik.http.routers.seerr-rtr.rule=Host(`seerr.domain.com`)'
- 'traefik.http.routers.seerr-rtr.tls=true'
## HTTP Services
- 'traefik.http.routers.seerr-rtr.service=seerr-svc'
- 'traefik.http.services.seerr-svc.loadbalancer.server.port=5055'
`
```
For more information, please refer to the [Traefik documentation](https://doc.traefik.io/traefik/user-guides/docker-compose/basic-example/).
## Apache2 HTTP Server[​](#apache2-http-server)
* Subdomain
* Subfolder
Add the following Location block to your existing Server configuration.
```
`# Seerr
ProxyPreserveHost On
ProxyPass / http://localhost:5055 retry=0 connectiontimeout=5 timeout=30 keepalive=on
ProxyPassReverse http://localhost:5055 /
RequestHeader set Connection ""
`
```
## HAProxy (v3)[​](#haproxy-v3)
warning
This is a third-party documentation maintained by the community. We can't provide support for this setup and are unable to test it.
Add the following frontend and backend configurations for your seerr instance:
```
`frontend seerr-frontend
bind 0.0.0.0:80
bind 0.0.0.0:443 ssl crt /etc/ssl/private/seerr.example.com.pem
mode http
log global
option httplog
option http-keep-alive
http-request set-header X-Real-IP %[src]
option forwardfor
acl seerr hdr(host) -i seerr.example.com
redirect scheme https code 301 if !{ ssl\_fc }
use\_backend seerr-backend if seerr
backend seerr-backend
mode http
log global
option httplog
http-response set-header Strict-Transport-Security max-age=15552000
option httpchk GET /api/v1/settings/public
timeout connect 30000
timeout server 30000
retries 3
server seerr 127.0.0.1:5055 check inter 1000
`
```
* [Nginx](#nginx)
* [Details](#details)
* [SSL](#ssl)
* [Caddy (v2)](#caddy-v2)
* [Traefik (v2)](#traefik-v2)
* [Apache2 HTTP Server](#apache2-http-server)
* [HAProxy (v3)](#haproxy-v3)