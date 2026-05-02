Configuration | Gotify
[Skip to content](#VPContent)
Menu
Return to top
# Configuration [​](#configuration)
gotify/server can be configured per config file and environment variables. When using docker it is recommended to use environment variables.
## Config File [​](#config-file)
gotify/server looks in the following paths for config files
* ./config.yml
* /etc/gotify/config.yml
NOTE
When strings contain reserved yml characters then they need to be escaped. [A list of reserved characters and how to escape them.](https://stackoverflow.com/a/22235064/4244993)
NOTE
The config file `/etc/gotify/config.yml` can contain sensitive data such as the initial admin password. When using it, you should remove read/write rights from users not owning the file:
bash
```
`$ sudo chmod go-rw /etc/gotify/config.yml`
```
yml
```
`server:
keepaliveperiodseconds: 0 # 0 = use Go default (15s); -1 = disable keepalive; set the interval in which keepalive packets will be sent. Only change this value if you know what you are doing.
listenaddr: '' # the address to bind on, leave empty to bind on all addresses. Prefix with "unix:" to create a unix socket. Example: "unix:/tmp/gotify.sock".
port: 80 # the port the HTTP server will listen on
ssl:
enabled: false # if https should be enabled
redirecttohttps: true # redirect to https if site is accessed by http
listenaddr: '' # the address to bind on, leave empty to bind on all addresses. Prefix with "unix:" to create a unix socket. Example: "unix:/tmp/gotify.sock".
port: 443 # the https port
certfile: # the cert file (leave empty when using letsencrypt)
certkey: # the cert key (leave empty when using letsencrypt)
letsencrypt:
enabled: false # if the certificate should be requested from letsencrypt
accepttos: false # if you accept the tos from letsencrypt
cache: data/certs # the directory of the cache from letsencrypt
hosts: # the hosts for which letsencrypt should request certificates
# - mydomain.tld
# - myotherdomain.tld
responseheaders: # response headers are added to every response (default: none)
# X-Custom-Header: "custom value"
trustedproxies: # IPs or IP ranges of trusted proxies. Used to obtain the remote ip via the X-Forwarded-For header. (configure 127.0.0.1 to trust sockets)
# - 127.0.0.1
# - 192.168.178.0/24
# - ::1
cors: # Sets cors headers only when needed and provides support for multiple allowed origins. Overrides Access-Control-\* Headers in response headers.
alloworigins:
# - ".+.example.com"
# - "otherdomain.com"
allowmethods:
# - "GET"
# - "POST"
allowheaders:
# - "Authorization"
# - "content-type"
stream:
pingperiodseconds: 45 # the interval in which websocket pings will be sent. Only change this value if you know what you are doing.
allowedorigins: # allowed origins for websocket connections (same origin is always allowed, default only same origin)
# - ".+.example.com"
# - "otherdomain.com"
database: # see below
dialect: sqlite3
connection: data/gotify.db
defaultuser: # on database creation, gotify creates an admin user (these values will only be used for the first start, if you want to edit the user after the first start use the WebUI)
name: admin # the username of the default user
pass: admin # the password of the default user
passstrength: 10 # the bcrypt password strength (higher = better but also slower)
uploadedimagesdir: data/images # the directory for storing uploaded images
pluginsdir: data/plugins # the directory where plugin resides (leave empty to disable plugins)
registration: false # enable registrations`
```
You can download an example config like this:
bash
```
`$ wget -O config.yml https://raw.githubusercontent.com/gotify/server/master/config.example.yml`
```
**Note: the example config doesn't only contain default values.**
## Database [​](#database)
|Dialect|Connection|
|sqlite3|`path/to/database.db`|
|mysql|`gotify:secret@tcp(localhost:3306)/gotifydb?charset=utf8&parseTime=True&loc=Local`|
|postgres|`host=localhost port=5432 user=gotify dbname=gotifydb password=secret`|
When using postgres without SSL then `sslmode=disable` must be added to the connection string. See [#90](https://github.com/gotify/server/issues/90).
> For
`> mysql
`> and
`> postgres
`> : Make sure the defined database exists and the user has sufficient permissions.
## Environment Variables [​](#environment-variables)
Strings in list or map environment settings (f.ex. `GOTIFY\_SERVER\_RESPONSEHEADERS` and `GOTIFY\_SERVER\_SSL\_LETSENCRYPT\_HOSTS`) need to be escaped. [A list of reserved characters and how to escape them.](https://stackoverflow.com/a/22235064/4244993)
See yml config documentation.
bash
```
`GOTIFY\_SERVER\_PORT=80
GOTIFY\_SERVER\_KEEPALIVEPERIODSECONDS=0
GOTIFY\_SERVER\_LISTENADDR=
GOTIFY\_SERVER\_SSL\_ENABLED=false
GOTIFY\_SERVER\_SSL\_REDIRECTTOHTTPS=true
GOTIFY\_SERVER\_SSL\_LISTENADDR=
GOTIFY\_SERVER\_SSL\_PORT=443
GOTIFY\_SERVER\_SSL\_CERTFILE=
GOTIFY\_SERVER\_SSL\_CERTKEY=
GOTIFY\_SERVER\_SSL\_LETSENCRYPT\_ENABLED=false
GOTIFY\_SERVER\_SSL\_LETSENCRYPT\_ACCEPTTOS=false
GOTIFY\_SERVER\_SSL\_LETSENCRYPT\_CACHE=certs
# GOTIFY\_SERVER\_SSL\_LETSENCRYPT\_HOSTS=[mydomain.tld, myotherdomain.tld]
# GOTIFY\_SERVER\_RESPONSEHEADERS={X-Custom-Header: "custom value", x-other: value}
# GOTIFY\_SERVER\_TRUSTEDPROXIES=[127.0.0.1,192.168.178.2/24]
# GOTIFY\_SERVER\_CORS\_ALLOWORIGINS=[.+\\.example\\.com, otherdomain\\.com]
# GOTIFY\_SERVER\_CORS\_ALLOWMETHODS=[GET, POST]
# GOTIFY\_SERVER\_CORS\_ALLOWHEADERS=[X-Gotify-Key, Authorization]
# GOTIFY\_SERVER\_STREAM\_ALLOWEDORIGINS=[.+.example\\.com, otherdomain\\.com]
GOTIFY\_SERVER\_STREAM\_PINGPERIODSECONDS=45
GOTIFY\_DATABASE\_DIALECT=sqlite3
GOTIFY\_DATABASE\_CONNECTION=data/gotify.db
GOTIFY\_DEFAULTUSER\_NAME=admin
GOTIFY\_DEFAULTUSER\_PASS=admin
GOTIFY\_PASSSTRENGTH=10
GOTIFY\_UPLOADEDIMAGESDIR=data/images
GOTIFY\_PLUGINSDIR=data/plugins
GOTIFY\_REGISTRATION=false`
```