nginx reverse proxy | Gotify
[Skip to content](#VPContent)
Menu
Return to top
# nginx reverse proxy [​](#nginx-reverse-proxy)
You may want to use your nginx server as a reverse proxy to run gotify.
## At the root of the domain [​](#at-the-root-of-the-domain)
Here is a sample config file if you run your gotify instance on port 1245
nginx
```
`upstream gotify {
# Set the port to the one you are using in gotify
server 127.0.0.1:1245;
}
server {
listen 80;
# Here goes your domain / subdomain
server\_name push.example.com;
location / {
# We set up the reverse proxy
proxy\_pass http://gotify;
proxy\_http\_version 1.1;
# Ensuring it can use websockets
proxy\_set\_header Upgrade $http\_upgrade;
proxy\_set\_header Connection "upgrade";
proxy\_set\_header X-Real-IP $remote\_addr;
proxy\_set\_header X-Forwarded-For $proxy\_add\_x\_forwarded\_for;
proxy\_set\_header X-Forwarded-Proto http;
proxy\_redirect http:// $scheme://;
# The proxy must preserve the host because gotify verifies the host with the origin
# for WebSocket connections
proxy\_set\_header Host $http\_host;
# These sets the timeout so that the websocket can stay alive
proxy\_connect\_timeout 1m;
proxy\_send\_timeout 1m;
proxy\_read\_timeout 1m;
}
}`
```
If you want to use HTTPS through Nginx, keep the gotify setting GOTIFY\_SERVER\_SSL\_ENABLED=false and rely on nginx to encrypt your traffic like you would with any other website.
## At a subpath [​](#at-a-subpath)
Here is the equivalent of the sample config above but running on a subpath
nginx
```
`upstream gotify {
# Set the port to the one you are using in gotify
server 192.168.178.34:8080;
}
server {
listen 80;
server\_name localhost;
location /gotify/ {
proxy\_pass http://gotify;
rewrite ^/gotify(/.\*) $1 break;
proxy\_http\_version 1.1;
# Ensuring it can use websockets
proxy\_set\_header Upgrade $http\_upgrade;
proxy\_set\_header Connection "upgrade";
proxy\_set\_header X-Real-IP $remote\_addr;
proxy\_set\_header X-Forwarded-For $proxy\_add\_x\_forwarded\_for;
proxy\_set\_header X-Forwarded-Proto http;
proxy\_redirect http:// $scheme://;
# The proxy must preserve the host because gotify verifies the host with the origin
# for WebSocket connections
proxy\_set\_header Host $http\_host;
proxy\_connect\_timeout 1m;
proxy\_send\_timeout 1m;
proxy\_read\_timeout 1m;
}
}`
```