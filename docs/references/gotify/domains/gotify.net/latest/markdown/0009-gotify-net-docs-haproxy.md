Haproxy reverse proxy | Gotify
[Skip to content](#VPContent)
Menu
Return to top
# Haproxy reverse proxy [​](#haproxy-reverse-proxy)
Here are configuration examples for setting up Haproxy as reverse proxy for gotify/server.
## Proxy requests [​](#proxy-requests)
txt
```
`frontend www
bind 0.0.0.0:80
default\_backend backend\_gotify
timeout client 60s
timeout client-fin 30s
backend backend\_gotify
server backend01 127.0.0.1:GOTIFY\_PORT check
timeout connect 10s
timeout server 60s`
```