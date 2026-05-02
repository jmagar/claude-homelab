HAProxy | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
>
**> Note:
**> For HTTP/3 support, ensure UDP port 443 is forwarded/opened on your firewall, as HTTP/3 uses UDP.
>
"[Haproxy](https://www.haproxy.com/) is a free, open source software that provides a high availability load balancer and proxy server for TCP and HTTP-based applications that spreads requests across multiple servers.[1] It is written in C[2] and has a reputation for being fast and efficient (in terms of processor and memory usage)." - [Wikipedia](https://en.wikipedia.org/wiki/HAProxy)
```
`
frontend jellyfin\_proxy
bind \*:80
# Note that haproxy requires you to concatenate the certificate and key into a single file
# Uncomment the appropriate lines after you have acquired a SSL Certificate
#
# HAProxy \<1.7
# bind \*:443 ssl crt /etc/ssl/DOMAIN\_NAME.pem
#
# HAProxy \>1.8
# bind \*:443 ssl crt /etc/ssl/DOMAIN\_NAME.pem alpn h2,http/1.1
# redirect scheme https if !{ ssl\_fc }
#
# Uncomment these lines to allow LetsEncrypt authentication
# acl letsencrypt\_auth path\_beg /.well-known/acme-challenge/
# use\_backend letsencrypt if letsencrypt\_auth
acl jellyfin\_server hdr(host) -i DOMAIN\_NAME
use\_backend jellyfin if jellyfin\_server
backend jellyfin
option httpchk
option forwardfor
http-check send meth GET uri /health
http-check expect string Healthy
server jellyfin SERVER\_IP\_ADDRESS:8096
# Uncomment these lines to allow LetsEncrypt authentication
#
#backend letsencrypt
# server letsencrypt 127.0.0.1:8888
`
```