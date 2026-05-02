Websocket Configuration
Get Started
* [Installation](../../docs/setup/installation)
* [Podman](../../docs/setup/podman)
* [LXC Container Setup](../../docs/guides/lxc-container)
* [Migrate to 1.0](../../docs/setup/migrate-v1)
* [Next Builds](../../docs/setup/next-images)
Security
* [Verify Artifacts](../../docs/security/verify-artifacts)
* [Socket Proxy Setup](../../docs/setup/socket-proxy)
Configuration
* [Environment Variables](../../docs/configuration/environment)
* [Appearance](../../docs/configuration/appearance)
* [Notifications](../../docs/configuration/notifications)
* [OIDC Single Sign-On](../../docs/configuration/sso)
* [Analytics](../../docs/configuration/analytics)
Networking
* [HTTP Proxy](../../docs/configuration/proxy)
* [Websocket Configuration](../../docs/configuration/websockets-reverse-proxies)
* [TLS and HTTP/2](../../docs/configuration/tls)
Features
* [Projects](../../docs/features/projects)
* [Containers](../../docs/features/containers)
* [Images](../../docs/features/images)
* [Image Builds](../../docs/features/image-builds)
* [Volumes](../../docs/features/volumes)
* [Networks](../../docs/features/networks)
* [Vulnerability Scans](../../docs/features/vulnerability-scans)
* [Remote Environments](../../docs/features/environments)
* [Auto Updates](../../docs/guides/updates)
* [Custom Metadata](../../docs/guides/custom-metadata)
* [Using Templates](../../docs/templates)
* [Template Registries](../../docs/templates/registries)
* [Docker Swarm](../../docs/features/swarm)
Guides
* [Buildables](../../docs/guides/buildables)
* [GPU Monitoring Setup](../../docs/guides/gpu-setup)
CLI
* [Installation](../../docs/cli/install)
* [Configuration](../../docs/cli/config)
Development
* [Contributing to Arcane](../../docs/dev/contribute)
* [Translating Arcane](../../docs/dev/translate)
Community
* [Discord ](https://discord.gg/WyXYpdyV3Z)
Arcane uses WebSockets to keep the app updated in real time. If you place Arcane behind a reverse proxy or custom domain, make sure the proxy allows WebSocket connections.
## Nginx Configuration
Here is a sample Nginx configuration with WebSocket support enabled. If you are not familiar with every line, you can usually copy it as-is and just change the domain name and paths:
`server &#123;
listen 80;
server\_name arcane.yourdomain.com;
# Redirection from HTTP site to HTTPS
return 301 https://$host$request\_uri;
&#125;
server &#123;
listen 443 ssl http2;
ssl\_certificate /etc/letsencrypt/live/arcane.yourdomain.com/fullchain.pem;
ssl\_certificate\_key /etc/letsencrypt/live/arcane.yourdomain.com/privkey.pem;
server\_name arcane.yourdomain.com;
add\_header X-Frame-Options "\*";
location / &#123;
add\_header X-Robots-Tag "noindex, nofollow";
proxy\_pass http://127.0.0.1:3552;
proxy\_set\_header X-Real-IP $remote\_addr;
proxy\_set\_header Host $host;
proxy\_set\_header X-Forwarded-For $proxy\_add\_x\_forwarded\_for;
proxy\_set\_header X-Forwarded-Proto $scheme;
# WebSocket support
proxy\_http\_version 1.1;
proxy\_set\_header Upgrade $http\_upgrade;
proxy\_set\_header Connection "upgrade";
proxy\_cache\_bypass $http\_upgrade;
&#125;
access\_log /var/log/nginx/arcane-access.log;
error\_log /var/log/nginx/arcane-error.log debug;
&#125;
`
The important WebSocket lines are:
* `proxy\_http\_version 1.1;`
* `proxy\_set\_header Upgrade $http\_upgrade;`
* `proxy\_set\_header Connection "upgrade";`
* `proxy\_cache\_bypass $http\_upgrade;` ## Apache Configuration
If you use Apache 2.4.47 or later, you need `mod\_proxy\_http` and a `ProxyPassMatch` rule with `upgrade=websocket`:
`Define HOST arcane.example.com
Define PORT 3552
\<VirtualHost \*:443\>
ServerName $&#123;HOST&#125;
ProxyPassMatch ^/(.\*)/ws/(.\*)$ ws://127.0.0.1:$&#123;PORT&#125;/$1/ws/$2 upgrade=websocket
ProxyPass / http://127.0.0.1:$&#123;PORT&#125;/
ProxyPassReverse / http://127.0.0.1:$&#123;PORT&#125;/
ErrorLog $&#123;APACHE\_LOG\_DIR&#125;/arcane.error.log
CustomLog $&#123;APACHE\_LOG\_DIR&#125;/arcane.access.log combined
Include /etc/letsencrypt/options-ssl-apache.conf
SSLCertificateFile /etc/letsencrypt/live/$&#123;HOST&#125;/fullchain.pem
SSLCertificateKeyFile /etc/letsencrypt/live/$&#123;HOST&#125;/privkey.pem
\</VirtualHost\>
`
## Additional Resources
Full documentation for common reverse proxies is available from [websocket.org](https://websocket.org/):
* [Nginx](https://websocket.org/guides/infrastructure/nginx/)
* [Amazon ALB](https://websocket.org/guides/infrastructure/aws/alb/)
* [Cloudflare](https://websocket.org/guides/infrastructure/cloudflare/)
* [Kubernetes](https://websocket.org/guides/infrastructure/kubernetes/)