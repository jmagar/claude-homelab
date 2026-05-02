Radicale v3 Documentation
Contents
## Translations of this page [&para;](#translations-of-this-page)
* [Telugu](https://github.com/Kozea/Radicale/blob/master/docs/DOCUMENTATION.te.md)
## Getting started [&para;](#getting-started)
#### About Radicale [&para;](#about-radicale)
Radicale is a small but powerful CalDAV (calendars, to-do lists) and
CardDAV (contacts) server, that:
* Shares calendars and contact lists through CalDAV, CardDAV and
HTTP.
* Supports events, todos, journal entries and business cards.
* Works out-of-the-box, no complicated setup or configuration
required.
* Offers flexible authentication options.
* Can limit access by authorization.
* Can secure connections with TLS.
* Works with many [CalDAV and CardDAV
clients](#supported-clients).
* Stores all data on the file system in a simple folder
structure.
* Can be extended with plugins.
* Is GPLv3-licensed free software.
#### Installation [&para;](#installation)
Check
* [Tutorials](#tutorials)
* [Documentation](#documentation-1)
* [Wiki on
GitHub](https://github.com/Kozea/Radicale/wiki)
* [Discussions
on GitHub](https://github.com/Kozea/Radicale/discussions)
* [Open
and already Closed Issues on GitHub](https://github.com/Kozea/Radicale/issues?q=is:issue)
#### What's New? [&para;](#whats-new)
Read the [Changelog
on GitHub](https://github.com/Kozea/Radicale/blob/master/CHANGELOG.md).
## Tutorials [&para;](#tutorials)
### Simple 5-minute setup [&para;](#simple-5-minute-setup)
You want to try Radicale but only have 5 minutes free in your
calendar? Let's go right now and play a bit with Radicale!
The server, configured with settings from this section, only binds to
localhost (i.e. it is not reachable over the network), and you can log
in with any username and password. When everything works, you may get a
local [client](#supported-clients) and start creating
calendars and address books. If Radicale fits your needs, it may be time
for some [basic configuration](#basic-configuration) to
support remote clients and desired authentication type.
Follow one of the chapters below depending on your operating
system.
#### Linux / \*BSD [&para;](#linux--bsd)
Hint: instead of downloading from PyPI, look for packages provided by
your [distribution](#linux-distribution-packages). They
contain also startup scripts integrated into your distributions, that
allow Radicale to run daemonized.
First, make sure that **python** 3.9 or later and
**pip** are installed. On most distributions it should be
enough to install the package `python3-pip`.
##### as normal user [&para;](#as-normal-user)
Recommended only for testing - open a console and type:
```
`# Run the following command to only install for the current user
python3 -m pip install --user --upgrade https://github.com/Kozea/Radicale/archive/master.tar.gz`
```
If *install* is not working and instead
`error: externally-managed-environment` is displayed, create
and activate a virtual environment in advance.
```
`python3 -m venv \~/venv
source \~/venv/bin/activate`
```
and try to install with
```
`python3 -m pip install --upgrade https://github.com/Kozea/Radicale/archive/master.tar.gz`
```
Start the service manually, data is stored only for the current
user
```
`# Start, data is stored for the current user only
python3 -m radicale --storage-filesystem-folder=\~/.var/lib/radicale/collections --auth-type none`
```
##### as system user (or as root) [&para;](#as-system-user-or-as-root)
Alternatively, you can install and run as system user or as root (not
recommended):
```
`# Run the following command as root (not recommended) or non-root system user
# (the later may require --user in case dependencies are not available system-wide and/or virtual environment)
python3 -m pip install --upgrade https://github.com/Kozea/Radicale/archive/master.tar.gz`
```
Start the service manually, with data stored in a system folder under
`/var/lib/radicale/collections`:
```
`# Start, data is stored in a system folder (requires write permissions to /var/lib/radicale/collections)
python3 -m radicale --storage-filesystem-folder=/var/lib/radicale/collections --auth-type none`
```
#### Windows [&para;](#windows)
The first step is to install Python. Go to [python.org](https://python.org) and download the latest version
of Python 3. Then run the installer. On the first window of the
installer, check the "Add Python to PATH" box and click on "Install
now". Wait a couple of minutes, it's done!
Launch a command prompt and type:
```
`python -m pip install --upgrade https://github.com/Kozea/Radicale/archive/master.tar.gz
python -m radicale --storage-filesystem-folder=\~/radicale/collections --auth-type none`
```
##### Common [&para;](#common)
Success!!! Open [http://localhost:5232](http://localhost:5232) in your browser!
You can log in with any username and password as no authentication is
required by example option `--auth-type none`. This is
**INSECURE**, see [Configuration/Authentication](#auth) for more details.
Just note that default configuration for security reason binds the
server to `localhost` (IPv4: `127.0.0.1`, IPv6:
`::1`). See [Addresses](#addresses) and [Configuration/Server](#server) for more details.
### Basic Configuration [&para;](#basic-configuration)
Installation instructions can be found in the [simple 5-minute setup](#simple-5-minute-setup) tutorial.
Radicale tries to load configuration files from
`/etc/radicale/config` and
`\~/.config/radicale/config`. Custom paths can be specified
with the `--config /path/to/config` command line argument or
the `RADICALE\_CONFIG` environment variable. Multiple
configuration files can be separated by `:` (resp.
`;` on Windows). Paths that start with `?` are
optional.
You should create a new configuration file at the desired location.
(If the use of a configuration file is inconvenient, all options can be
passed via command line arguments.)
All configuration options are described in detail in the [Configuration](#configuration) section.
#### Authentication [&para;](#authentication)
In its default configuration since version 3.5.0, Radicale rejects
all authentication attempts by using config option
`type = denyall` (introduced with 3.2.2) as default until
explicitly configured.
Versions before 3.5.0 did not check usernames or passwords at all,
unless explicitly configured. If such a server is reachable over a
network, you should change this as soon as possible.
First a `users` file with all usernames and passwords must
be created. It can be stored in the same directory as the configuration
file.
##### The secure way [&para;](#the-secure-way)
The `users` file can be created and managed with [htpasswd](https://httpd.apache.org/docs/current/programs/htpasswd.html):
Note: some OSes or distributions contain outdated versions of
`htpasswd` (\< 2.4.59) without support for SHA-256 or
SHA-512 (e.g. Ubuntu LTS 22). In these cases, use
`htpasswd`'s command line option `-B` for the
`bcrypt` hash method (recommended), or stay with the insecure
(not recommended) MD5 (default) or SHA-1 (command line option
`-s`).
Note: support of SHA-256 and SHA-512 was introduced with 3.1.9
```
`# Create a new htpasswd file with the user "user1" using SHA-512 as hash method
$ htpasswd -5 -c /path/to/users user1
New password:
Re-type new password:
# Add another user
$ htpasswd -5 /path/to/users user2
New password:
Re-type new password:`
```
Authentication can be enabled with the following configuration:
```
`[auth]
type = htpasswd
htpasswd\_filename = /path/to/users
htpasswd\_encryption = autodetect`
```
##### The simple but insecure way [&para;](#the-simple-but-insecure-way)
Create the `users` file by hand with lines containing the
username and password separated by `:`. Example:
```
`user1:password1
user2:password2`
```
Authentication can be enabled with the following configuration:
```
`[auth]
type = htpasswd
htpasswd\_filename = /path/to/users
# encryption method used in the htpasswd file
htpasswd\_encryption = plain`
```
#### Addresses [&para;](#addresses)
The default configuration binds the server to localhost. It cannot be
reached from other computers. This can be changed with the following
configuration options (IPv4 and IPv6):
```
`[server]
hosts = 0.0.0.0:5232, [::]:5232`
```
#### Storage [&para;](#storage)
Data is stored in the folder
`/var/lib/radicale/collections`. The path can be changed with
the following configuration:
```
`[storage]
filesystem\_folder = /path/to/storage`
```
>
**> Security:
**> The storage folder shall not be readable> by unauthorized users. Otherwise, they can read the calendar data andlock the storage. You can find OS dependent instructions in the
[> Running as a service
](#running-as-a-service)> section.
>
#### Limits [&para;](#limits)
Radicale enforces limits on the maximum number of parallel
connections, the maximum file size (important for contacts with big
photos) and the rate of incorrect authentication attempts. Connections
are terminated after a timeout. The default values should be fine for
most scenarios.
```
`[server]
max\_connections = 20
# 100 Megabyte
max\_content\_length = 100000000
# 10 Megabyte (\>= 3.5.10)
max\_resource\_size = 10000000
# 30 seconds
timeout = 30
[auth]
# Average delay after failed login attempts in seconds
# Also used for invalid/not-existing/not-enabled share-by-token (\>= 3.7.0)
delay = 1`
```
### Running as a service [&para;](#running-as-a-service)
The method to run Radicale as a service depends on your host
operating system. Follow one of the chapters below depending on your
operating system and requirements.
#### Linux with systemd system-wide [&para;](#linux-with-systemd-system-wide)
Recommendation: check support by [Linux Distribution Packages](#linux-distribution-packages)
instead of manual setup / initial configuration.
Create the **radicale** user and group for the Radicale
service by running (as `root`):
```
`useradd --system --user-group --home-dir / --shell /sbin/nologin radicale`
```
The storage folder must be made writable by the
**radicale** user by running (as `root`):
```
`mkdir -p /var/lib/radicale/collections && chown -R radicale:radicale /var/lib/radicale/collections`
```
If a dedicated cache folder is configured (see option [filesystem\_cache\_folder](#filesystem_cache_folder)), it also
must be made writable by **radicale**. To achieve that, run
(as `root`):
```
`mkdir -p /var/cache/radicale && chown -R radicale:radicale /var/cache/radicale`
```
>
**> Security:
**> The storage shall not be readable byothers. To make sure this is the case, run (as
`> root
`> ):
>
```
`> chmod
>
> -R
> o= /var/lib/radicale/collections
`
```
>
Create the file
`/etc/systemd/system/radicale.service`:
```
`[Unit]
Description=A simple CalDAV (calendar) and CardDAV (contact) server
After=network.target
Requires=network.target
[Service]
ExecStart=/usr/bin/env python3 -m radicale
Restart=on-failure
User=radicale
# Deny other users access to the calendar data
UMask=0027
# Optional security settings
PrivateTmp=true
ProtectSystem=strict
ProtectHome=true
PrivateDevices=true
ProtectKernelTunables=true
ProtectKernelModules=true
ProtectControlGroups=true
NoNewPrivileges=true
ReadWritePaths=/var/lib/radicale/
# Replace with following in case dedicated cache folder should be used
#ReadWritePaths=/var/lib/radicale/ /var/cache/radicale/
[Install]
WantedBy=multi-user.target`
```
In this system-wide implementation, Radicale will load the
configuration from the file `/etc/radicale/config`.
To enable and manage the service run:
```
`# Enable the service
$ systemctl enable radicale
# Start the service
$ systemctl start radicale
# Check the status of the service
$ systemctl status radicale
# View all log messages
$ journalctl --unit radicale.service`
```
#### Linux with systemd as a user [&para;](#linux-with-systemd-as-a-user)
Create the file
`\~/.config/systemd/user/radicale.service`:
```
`[Unit]
Description=A simple CalDAV (calendar) and CardDAV (contact) server
[Service]
ExecStart=/usr/bin/env python3 -m radicale
Restart=on-failure
[Install]
WantedBy=default.target`
```
In this user-specific configuration, Radicale will load the
configuration from the file `\~/.config/radicale/config`. You
should set the configuration option `filesystem\_folder` in
the `storage` section to something like
`\~/.var/lib/radicale/collections`.
To enable and manage the service run:
```
`# Enable the service
$ systemctl --user enable radicale
# Start the service
$ systemctl --user start radicale
# Check the status of the service
$ systemctl --user status radicale
# View all log messages
$ journalctl --user --unit radicale.service`
```
#### Windows with "NSSM - the Non-Sucking Service Manager" [&para;](#windows-with-nssm---the-non-sucking-service-manager)
First install [NSSM](https://nssm.cc/) and start
`nssm install` in a command prompt. Apply the following
configuration:
* Service name: `Radicale`
* Application
* Path: `C:\\Path\\To\\Python\\python.exe`
* Arguments: `--config C:\\Path\\To\\Config`
* I/O redirection
* Error: `C:\\Path\\To\\Radicale.log`
>
**> Security:
**> Be aware that the service runs in the> local system account, you might want to change this. Managing user> accounts is beyond the scope of this manual. Also, make sure that thestorage folder and log file is not readable by unauthorized users.
>
The log file might grow very big over time, you can configure file
rotation in **NSSM** to prevent this.
The service is configured to start automatically when the computer
starts. To start the service manually open **Services** in
**Computer Management** and start the
**Radicale** service.
### Reverse Proxy [&para;](#reverse-proxy)
When a reverse proxy is used, and Radicale should be made available
at a path below the root (such as `/radicale/`), then this
path must be provided via the `X-Script-Name` header (without
a trailing `/`). The proxy must remove the location from the
URL path that is forwarded to Radicale. If Radicale should be made
available at the root of the web server (in the nginx case using
`location /`), then the setting of the
`X-Script-Name` header should be removed from the example
below.
Example **nginx** configuration extension:
See also for latest examples: [https://github.com/Kozea/Radicale/tree/master/contrib/nginx/](https://github.com/Kozea/Radicale/tree/master/contrib/nginx/)
```
`location /radicale/ { # The trailing / is important!
proxy\_pass http://localhost:5232;
proxy\_set\_header X-Script-Name /radicale;
proxy\_set\_header X-Forwarded-For $proxy\_add\_x\_forwarded\_for;
proxy\_set\_header X-Forwarded-Host $host;
proxy\_set\_header X-Forwarded-Port $server\_port;
proxy\_set\_header X-Forwarded-Proto $scheme;
proxy\_set\_header Host $http\_host;
proxy\_pass\_header Authorization;
}`
```
Example **Caddy** configuration extension:
See also for latest examples: [https://github.com/Kozea/Radicale/tree/master/contrib/caddy/](https://github.com/Kozea/Radicale/tree/master/contrib/caddy/)
```
`handle\_path /radicale/\* {
uri strip\_prefix /radicale
reverse\_proxy localhost:5232 {
# replace "HOST" with configured hostname of URL (FQDN) in client
header\_up Host HOST
# replace "PORT" with configured port of URL in client
header\_up X-Forwarded-Port PORT
}
}`
```
Example **Apache** configuration extension:
See also for latest examples: [https://github.com/Kozea/Radicale/tree/master/contrib/apache/](https://github.com/Kozea/Radicale/tree/master/contrib/apache/)
```
`RewriteEngine On
RewriteRule ^/radicale$ /radicale/ [R,L]
\<Location "/radicale/"\>
ProxyPass http://localhost:5232/ retry=0
ProxyPassReverse http://localhost:5232/
RequestHeader set X-Script-Name /radicale
RequestHeader set X-Forwarded-Port "%{SERVER\_PORT}s"
RequestHeader set X-Forwarded-Proto expr=%{REQUEST\_SCHEME}
\<IfVersion \>= 2.4.40\>
Proxy100Continue Off
\</IfVersion\>
\</Location\>`
```
Example **Apache .htaccess** configuration:
```
`DirectoryIndex disabled
RewriteEngine On
RewriteRule ^(.\*)$ http://localhost:5232/$1 [P,L]
# Set to directory of .htaccess file:
RequestHeader set X-Script-Name /radicale
RequestHeader set X-Forwarded-Port "%{SERVER\_PORT}s"
RequestHeader unset X-Forwarded-Proto
\<If "%{HTTPS} =\~ /on/"\>
RequestHeader set X-Forwarded-Proto "https"
\</If\>`
```
Example **lighttpd** configuration:
```
`server.modules += ( "mod\_proxy" , "mod\_setenv" )
$HTTP["url"] =\~ "^/radicale/" {
proxy.server = ( "" =\> (( "host" =\> "127.0.0.1", "port" =\> "5232" )) )
setenv.add-request-header = ( "X-Script-Name" =\> "/radicale" )
}`
```
Be reminded that Radicale's default configuration enforces limits on
the maximum number of parallel connections, the maximum file size and
the rate of incorrect authentication attempts. Connections are
terminated after a timeout.
#### Manage user accounts with the reverse proxy [&para;](#manage-user-accounts-with-the-reverse-proxy)
Set the configuration option `type` in the
`auth` section to `http\_x\_remote\_user`. Radicale
uses the username provided in the `X-Remote-User` HTTP header
and disables its internal HTTP authentication.
Example **nginx** configuration:
```
`location /radicale/ {
proxy\_pass http://localhost:5232/;
proxy\_set\_header X-Script-Name /radicale;
proxy\_set\_header X-Forwarded-For $proxy\_add\_x\_forwarded\_for;
proxy\_set\_header X-Remote-User $remote\_user;
proxy\_set\_header Host $http\_host;
auth\_basic "Radicale - Password Required";
auth\_basic\_user\_file /etc/nginx/htpasswd;
}`
```
Example **Caddy** configuration:
```
`handle\_path /radicale/\* {
uri strip\_prefix /radicale
basicauth {
USER HASH
}
reverse\_proxy localhost:5232 {
header\_up X-Script-Name /radicale
header\_up X-remote-user {http.auth.user.id}
}
}`
```
Example **Apache** configuration:
```
`RewriteEngine On
RewriteRule ^/radicale$ /radicale/ [R,L]
\<Location "/radicale/"\>
AuthType Basic
AuthName "Radicale - Password Required"
AuthUserFile "/etc/radicale/htpasswd"
Require valid-user
ProxyPass http://localhost:5232/ retry=0
ProxyPassReverse http://localhost:5232/
\<IfVersion \>= 2.4.40\>
Proxy100Continue Off
\</IfVersion\>
RequestHeader set X-Script-Name /radicale
RequestHeader set X-Remote-User expr=%{REMOTE\_USER}
\</Location\>`
```
Example **Apache .htaccess** configuration:
```
`DirectoryIndex disabled
RewriteEngine On
RewriteRule ^(.\*)$ http://localhost:5232/$1 [P,L]
AuthType Basic
AuthName "Radicale - Password Required"
AuthUserFile "/etc/radicale/htpasswd"
Require valid-user
# Set to directory of .htaccess file:
RequestHeader set X-Script-Name /radicale
RequestHeader set X-Remote-User expr=%{REMOTE\_USER}`
```
>
**> Security:
**> Untrusted clients should not be able to> access the Radicale server directly. Otherwise, they can authenticate as> any user by simply setting related HTTP header. This can be prevented bylistening to the loopback interface only or local firewall rules.
>
#### Secure connection between Radicale and the reverse proxy [&para;](#secure-connection-between-radicale-and-the-reverse-proxy)
SSL certificates can be used to encrypt and authenticate the
connection between Radicale and the reverse proxy. First you need to
generate a certificate for Radicale and a certificate for the reverse
proxy. The following commands generate self-signed certificates. You
will be asked to enter additional information about the certificate,
these values do not really matter, and you can keep the defaults.
```
`openssl req -x509 -newkey rsa:4096 -keyout server\_key.pem -out server\_cert.pem \\
-nodes -days 9999
openssl req -x509 -newkey rsa:4096 -keyout client\_key.pem -out client\_cert.pem \\
-nodes -days 9999`
```
Use the following configuration for Radicale:
```
`[server]
ssl = True
certificate = /path/to/server\_cert.pem
key = /path/to/server\_key.pem
certificate\_authority = /path/to/client\_cert.pem`
```
If you are using the Let's Encrypt Certbot, the configuration should
look similar to this:
```
`[server]
ssl = True
certificate = /etc/letsencrypt/live/{Your Domain}/fullchain.pem
key = /etc/letsencrypt/live/{Your Domain}/privkey.pem`
```
Example **nginx** configuration:
```
`location /radicale/ {
proxy\_pass https://localhost:5232/;
...
# Place the files somewhere nginx is allowed to access (e.g. /etc/nginx/...).
proxy\_ssl\_certificate /path/to/client\_cert.pem;
proxy\_ssl\_certificate\_key /path/to/client\_key.pem;
}`
```
### WSGI Server [&para;](#wsgi-server)
Radicale is compatible with the WSGI specification.
A configuration file can be set with the `RADICALE\_CONFIG`
environment variable, otherwise no configuration file is loaded and the
default configuration is used.
Example **uWSGI** configuration:
```
`[uwsgi]
http-socket = 127.0.0.1:5232
processes = 8
plugin = python3
module = radicale
env = RADICALE\_CONFIG=/etc/radicale/config`
```
Example **Gunicorn** configuration:
```
`gunicorn --bind '127.0.0.1:5232' --env 'RADICALE\_CONFIG=/etc/radicale/config' \\
--workers 8 radicale`
```
#### Manage user accounts with the WSGI server [&para;](#manage-user-accounts-with-the-wsgi-server)
Set the configuration option `type` in the
`auth` section to `remote\_user`. This way Radicale
uses the username provided by the WSGI server and disables its internal
authentication over HTTP.
### Versioning collections with Git [&para;](#versioning-collections-with-git)
This tutorial describes how to keep track of all changes to calendars
and address books with **git** (or any other version
control system).
The repository must be initialized in the collection base directory
of the user running `radicale` daemon.
```
`## assuming "radicale" user is starting "radicale" service
# change to user "radicale"
su -l -s /bin/bash radicale
# change to collection base directory defined in [storage] -\> filesystem\_folder
# assumed here /var/lib/radicale/collections
cd /var/lib/radicale/collections
# initialize git repository
git init
# set user and e-mail, here minimum example
git config user.name "$USER"
git config user.email "$USER@$HOSTNAME"
# define ignore of cache/lock/tmp files
cat \<\<'END' \>.gitignore
.Radicale.cache
.Radicale.lock
.Radicale.tmp-\*
END`
```
The configuration option `hook` in the
`storage` section must be set to the following command:
```
`git add -A && (git diff --cached --quiet || git commit -m "Changes by \\"%(user)s\\"")`
```
The command gets executed after every change to the storage and
commits the changes into the **git** repository.
Log of `git` can be investigated using
```
`su -l -s /bin/bash radicale
cd /var/lib/radicale/collections
git log`
```
In case of problems, make sure you run radicale with
`--debug` switch and inspect the log output. For more
information, please visit [section on
logging](#logging-overview).
Reason for problems can be
* SELinux status -\> check related audit log
* problematic file/directory permissions
* command is not fond or cannot be executed or argument problem
## Documentation [&para;](#documentation-1)
### Options [&para;](#options)
#### General Options [&para;](#general-options)
##### --version [&para;](#--version)
Print version
##### --verify-storage [&para;](#--verify-storage)
Verification of local collections storage
##### --verify-item [&para;](#--verify-item-)
*(\>= 3.6.0)*
Verification of a particular item file
##### --verify-sharing [&para;](#--verify-sharing)
*(\>= 3.7.0)*
Verification of local sharing database
##### -C|--config [&para;](#-c--config-)
Load one or more specified config file(s)
##### -D|--debug [&para;](#-d--debug)
Turns log level to debug
#### Configuration Options [&para;](#configuration-options)
Each supported option from config file can be provided/overridden by
command line replacing `\_` with `-` and prepending
the section followed by a `-`, e.g.
```
`[logging]
backtrace\_on\_debug = False`
```
can be enabled using `--logging-backtrace-on-debug=true`
on command line.
### Configuration [&para;](#configuration)
Radicale can be configured with a configuration file or with command
line arguments.
Configuration files have INI-style syntax comprising key-value pairs
grouped into sections with section headers enclosed in brackets.
An example configuration file looks like:
```
`[server]
# Bind all addresses
hosts = 0.0.0.0:5232, [::]:5232
[auth]
type = htpasswd
htpasswd\_filename = \~/.config/radicale/users
htpasswd\_encryption = autodetect
[storage]
filesystem\_folder = \~/.var/lib/radicale/collections`
```
Radicale tries to load configuration files from
`/etc/radicale/config` and
`\~/.config/radicale/config`. Custom paths can be specified
with the `--config /path/to/config` command line argument or
the `RADICALE\_CONFIG` environment variable. Multiple
configuration files can be separated by `:` (resp.
`;` on Windows). Paths that start with `?` are
optional.
The same example configuration via command line arguments looks
like:
```
`python3 -m radicale --server-hosts 0.0.0.0:5232,[::]:5232 \\
--auth-type htpasswd --auth-htpasswd-filename \~/.config/radicale/users \\
--auth-htpasswd-encryption autodetect`
```
Add the argument `--config ""` to stop Radicale from
loading the default configuration files. Run
`python3 -m radicale --help` for more information.
You can also use command-line options in startup scripts as shown in
the following examples:
```
`## simple variable containing multiple options
RADICALE\_OPTIONS="--logging-level=debug --config=/etc/radicale/config --logging-request-header-on-debug --logging-rights-rule-doesnt-match-on-debug"
/usr/bin/radicale $RADICALE\_OPTIONS
## variable as array method #1
RADICALE\_OPTIONS=("--logging-level=debug" "--config=/etc/radicale/config" "--logging-request-header-on-debug" "--logging-rights-rule-doesnt-match-on-debug")
/usr/bin/radicale ${RADICALE\_OPTIONS[@]}
## variable as array method #2
RADICALE\_OPTIONS=()
RADICALE\_OPTIONS+=("--logging-level=debug")
RADICALE\_OPTIONS+=("--config=/etc/radicale/config")
/usr/bin/radicale ${RADICALE\_OPTIONS[@]}`
```
The following describes all configuration sections and options.
#### [server] [&para;](#server)
The configuration options in this section are only relevant in
standalone mode; they are ignored, when Radicale runs on WSGI.
##### hosts [&para;](#hosts)
A comma separated list of addresses that the server will bind to.
Default: `localhost:5232`
##### max\_connections [&para;](#max_connections)
The maximum number of parallel connections. Set to `0` to
disable the limit.
Default: `8`
##### delay\_on\_error [&para;](#delay_on_error)
*(\>= 3.7.0)*
Base delay in case of error 5xx response (seconds)
Default: `1`
##### max\_content\_length [&para;](#max_content_length)
The maximum size of the request body. (bytes)
Default: `100000000` (100 Mbyte)
In case of using a reverse proxy in front of check also there related
option.
##### max\_resource\_size [&para;](#max_resource_size)
*(\>= 3.5.10)*
The maximum size of a resource. (bytes)
Default: `10000000` (10 Mbyte)
Limited to 80% of max\_content\_length to cover plain base64 encoded
payload.
Announced to clients requesting "max-resource-size" via PROPFIND.
##### timeout [&para;](#timeout)
Socket timeout. (seconds)
Default: `30`
##### ssl [&para;](#ssl)
Enable transport layer encryption.
Default: `False`
##### certificate [&para;](#certificate)
Path of the SSL certificate.
Default: `/etc/ssl/radicale.cert.pem`
##### key [&para;](#key)
Path to the private key for SSL. Only effective if `ssl`
is enabled.
Default: `/etc/ssl/radicale.key.pem`
##### certificate\_authority [&para;](#certificate_authority)
Path to the CA certificate for validating client certificates. This
can be used to secure TCP traffic between Radicale and a reverse proxy.
If you want to authenticate users with client-side certificates, you
also have to write an authentication plugin that extracts the username
from the certificate.
Default: (unset)
##### protocol [&para;](#protocol)
*(\>= 3.3.1)*
Accepted SSL protocol (maybe not all supported by underlying OpenSSL
version) Example for secure configuration: ALL -SSLv3 -TLSv1 -TLSv1.1
Format: Apache SSLProtocol list (from "mod\_ssl")
Default: (system default)
##### ciphersuite [&para;](#ciphersuite)
*(\>= 3.3.1)*
Accepted SSL ciphersuite (maybe not all supported by underlying
OpenSSL version) Example for secure configuration: DHE:ECDHE:-NULL:-SHA
Format: OpenSSL cipher list (see also "man openssl-ciphers")
Default: (system-default)
##### script\_name [&para;](#script_name)
*(\>= 3.5.0)*
Strip script name from URI if called by reverse proxy
Default: (taken from HTTP\_X\_SCRIPT\_NAME or SCRIPT\_NAME)
#### [encoding] [&para;](#encoding)
##### request [&para;](#request)
Encoding for responding requests.
Default: `utf-8`
##### stock [&para;](#stock)
Encoding for storing local collections
Default: `utf-8`
#### [auth] [&para;](#auth)
##### type [&para;](#type)
The method to verify usernames and passwords.
Available types are:
* `none`
Just allows all usernames and passwords.
* `denyall` *(\>= 3.2.2)*
Just denies all usernames and passwords.
* `htpasswd`
Use an [Apache
htpasswd file](https://httpd.apache.org/docs/current/programs/htpasswd.html) to store usernames and passwords.
* `remote\_user`
Takes the username from the `REMOTE\_USER` environment
variable and disables Radicale's internal HTTP authentication. This can
be used to provide the username from a WSGI server which authenticated
the client upfront. Requires validation, otherwise clients can supply
the header themselves, which then is unconditionally trusted.
* `http\_remote\_user` *(\>= 3.5.9)* Takes the
username from the Remote-User HTTP header `HTTP\_REMOTE\_USER`
and disables Radicale's internal HTTP authentication. This can be used
to provide the username from a reverse proxy which authenticated the
client upfront. Requires validation, otherwise clients can supply the
header themselves, which then is unconditionally trusted.
* `http\_x\_remote\_user`
Takes the username from the X-Remote-User HTTP header
`HTTP\_X\_REMOTE\_USER` and disables Radicale's internal HTTP
authentication. This can be used to provide the username from a reverse
proxy which authenticated the client upfront. Requires validation,
otherwise clients can supply the header themselves, which then is
unconditionally trusted.
* `ldap` *(\>= 3.3.0)*
Use a LDAP or AD server to authenticate users by relaying credentials
from clients and handle results.
* `dovecot` *(\>= 3.3.1)*
Use a Dovecot server to authenticate users by relaying credentials from
clients and handle results.
* `imap` *(\>= 3.4.1)*
Use an IMAP server to authenticate users by relaying credentials from
clients and handle results.
* `oauth2` *(\>= 3.5.0)*
Use an OAuth2 server to authenticate users by relaying credentials from
clients and handle results. OAuth2 authentication (SSO) directly on
client is not supported. Use herefore `http\_x\_remote\_user` in
combination with SSO support in reverse proxy (e.g.
Apache+mod\_auth\_openidc).
* `pam` *(\>= 3.5.0)*
Use local PAM to authenticate users by relaying credentials from client
and handle result..
Default: `none` *(\< 3.5.0)* /
`denyall` *(\>= 3.5.0)*
##### cache\_logins [&para;](#cache_logins)
*(\>= 3.4.0)*
Cache successful/failed logins until expiration time. Enable this to
avoid overload of authentication backends.
Default: `False`
##### cache\_successful\_logins\_expiry [&para;](#cache_successful_logins_expiry)
*(\>= 3.4.0)*
Expiration time of caching successful logins in seconds
Default: `15`
##### cache\_failed\_logins\_expiry [&para;](#cache_failed_logins_expiry)
*(\>= 3.4.0)*
Expiration time of caching failed logins in seconds
Default: `90`
##### htpasswd\_filename [&para;](#htpasswd_filename)
Path to the htpasswd file.
Default: `/etc/radicale/users`
##### htpasswd\_encryption [&para;](#htpasswd_encryption)
The encryption method that is used in the htpasswd file. Use [htpasswd](https://httpd.apache.org/docs/current/programs/htpasswd.html)
or similar to generate this file.
Available methods:
* `plain`
Passwords are stored in plaintext. This is not recommended. as it is
obviously **insecure!** The htpasswd file for this can be
created by hand and looks like:
```
`user1:password1
user2:password2`
```
* `bcrypt`
This uses a modified version of the Blowfish stream cipher, which is
considered very secure. The installation of Python's
**bcrypt** module is required for this to work.
* `md5`
Use an iterated MD5 digest of the password with salt (nowadays
insecure).
* `sha256` *(\>= 3.1.9)*
Use an iterated SHA-256 digest of the password with salt.
* `sha512` *(\>= 3.1.9)*
Use an iterated SHA-512 digest of the password with salt.
* `argon2` *(\>= 3.5.3)*
Use an iterated ARGON2 digest of the password with salt. The
installation of Python's **argon2-cffi** module is required
for this to work.
* `autodetect` *(\>= 3.1.9)*
Automatically detect the encryption method used per user entry.
Default: `md5` *(\< 3.3.0)* /
`autodetect` *(\>= 3.3.0)*
##### htpasswd\_cache [&para;](#htpasswd_cache)
*(\>= 3.4.0)*
Enable caching of htpasswd file based on size and mtime\_ns
Default: `False`
##### delay [&para;](#delay)
Average delay (in seconds) after failed or missing login attempts or
denied access.
Default: `1`
##### realm [&para;](#realm)
Message displayed in the client when a password is needed.
Default: `Radicale - Password Required`
##### ldap\_uri [&para;](#ldap_uri)
*(\>= 3.3.0)*
URI to the LDAP server. Mandatory for auth type
`ldap`.
Default: `ldap://localhost`
##### ldap\_base [&para;](#ldap_base)
*(\>= 3.3.0)*
Base DN of the LDAP server. Mandatory for auth type
`ldap`.
Default: (unset)
##### ldap\_reader\_dn [&para;](#ldap_reader_dn)
*(\>= 3.3.0)*
DN of a LDAP user with read access users and - if defined - groups.
Mandatory for auth type `ldap`.
Default: (unset)
##### ldap\_secret [&para;](#ldap_secret)
*(\>= 3.3.0)*
Password of `ldap\_reader\_dn`. Mandatory for auth type
`ldap` unless `ldap\_secret\_file` is given.
Default: (unset)
##### ldap\_secret\_file [&para;](#ldap_secret_file)
*(\>= 3.3.0)*
Path to the file containing the password of
`ldap\_reader\_dn`. Mandatory for auth type `ldap`
unless `ldap\_secret` is given.
Default: (unset)
##### ldap\_filter [&para;](#ldap_filter)
*(\>= 3.3.0)*
Filter to search for the LDAP entry of the user to authenticate. It
must contain '{0}' as placeholder for the login name.
Default: `(cn={0})`
##### ldap\_user\_attribute [&para;](#ldap_user_attribute)
*(\>= 3.4.0)*
LDAP attribute whose value shall be used as the username after
successful authentication.
If set, you can use flexible logins in `ldap\_filter` and
still have consolidated usernames, e.g. to allow users to login using
mail addresses as an alternative to cn, simply set
```
`ldap\_filter = (&(objectclass=inetOrgPerson)(|(cn={0})(mail={0})))
ldap\_user\_attribute = cn`
```
Even for simple filter setups, it is recommended to set it in order
to get usernames exactly as they are stored in LDAP and to avoid
inconsistencies in the upper-/lower-case spelling of the login
names.
Default: (unset, in which case the login name is directly used as the
username)
##### ldap\_security [&para;](#ldap_security)
*(\>= 3.5.2)*
Use encryption on the LDAP connection.
One of
* `none`
* `tls`
* `starttls`
Default: `none`
##### ldap\_ssl\_verify\_mode [&para;](#ldap_ssl_verify_mode)
*(\>= 3.3.0)*
Certificate verification mode for tls and starttls.
One of
* `NONE`
* `OPTIONAL`
* `REQUIRED`.
Default: `REQUIRED`
##### ldap\_ssl\_ca\_file [&para;](#ldap_ssl_ca_file)
*(\>= 3.3.0)*
Path to the CA file in PEM format which is used to certify the server
certificate
Default: (unset)
##### ldap\_groups\_attribute [&para;](#ldap_groups_attribute)
*(\>= 3.4.0)*
LDAP attribute in the authenticated user's LDAP entry to read the
group memberships from.
E.g. `memberOf` to get groups on Active Directory and
alikes, `groupMembership` on Novell eDirectory, ...
If set, get the user's LDAP groups from the attribute given.
For DN-valued attributes, the value of the RDN is used to determine
the group names. The implementation also supports non-DN-valued
attributes: their values are taken directly.
The user's group names can be used later to define rights. They also
give you access to the group calendars, if those exist.
* Group calendars are placed directly under
*collection\_root\_folder*`/GROUPS/` with the
base64-encoded group name as the calendar folder name.
* Group calendar folders are not created automatically. This must be
done manually. In the [LDAP-authentication
section of Radicale's wiki](https://github.com/Kozea/Radicale/wiki/LDAP-authentication) you can find a script to create a group
calendar.
Default: (unset)
##### ldap\_group\_members\_attribute [&para;](#ldap_group_members_attribute)
*(\>= 3.5.6)*
Attribute in the group entries to read the group's members from.
E.g. `member` for groups with objectclass
`groupOfNames`.
Using `ldap\_group\_members\_attribute`,
`ldap\_group\_base` and `ldap\_group\_filter` is an
alternative approach to getting the user's groups. Instead of reading
them from `ldap\_groups\_attribute` in the user's entry, an
additional query is performed to search for those groups beneath
`ldap\_group\_base`, that have the user's DN in their
`ldap\_group\_members\_attribute` and additionally fulfil
`ldap\_group\_filter`.
As with DN-valued `ldap\_groups\_attribute`, the value of
the RDN is used to determine the group names.
Default: (unset)
##### ldap\_group\_base [&para;](#ldap_group_base)
*(\>= 3.5.6)*
Base DN to search for groups. Only necessary if
`ldap\_group\_members\_attribute` is set, and if the base DN for
groups differs from `ldap\_base`.
Default: (unset, in which case `ldap\_base` is used as
fallback)
##### ldap\_group\_filter [&para;](#ldap_group_filter)
*(\>= 3.5.6)*
Search filter to search for groups having the user DN found as
member. Only necessary `ldap\_group\_members\_attribute` is set,
and you want the groups returned to be restricted instead of all groups
the user's DN is in.
Default: (unset)
##### ldap\_ignore\_attribute\_create\_modify\_timestamp [&para;](#ldap_ignore_attribute_create_modify_timestamp)
*(\>= 3.5.1)*
Quirks for Authentik LDAP server, which violates the LDAP RFCs: add
modifyTimestamp and createTimestamp to the exclusion list of internal
ldap3 client so that these schema attributes are not checked.
Default: `False`
##### dovecot\_connection\_type [&para;](#dovecot_connection_type)
*(\>= 3.4.1)*
Connection type for dovecot authentication.
One of:
* `AF\_UNIX`
* `AF\_INET`
* `AF\_INET6`
Note: credentials are transmitted in cleartext
Default: `AF\_UNIX`
##### dovecot\_socket [&para;](#dovecot_socket)
*(\>= 3.3.1)*
Path to the Dovecot client authentication socket (eg.
/run/dovecot/auth-client on Fedora). Radicale must have read & write
access to the socket.
Default: `/var/run/dovecot/auth-client`
##### dovecot\_host [&para;](#dovecot_host)
*(\>= 3.4.1)*
Host of dovecot socket exposed via network
Default: `localhost`
##### dovecot\_port [&para;](#dovecot_port)
*(\>= 3.4.1)*
Port of dovecot socket exposed via network
Default: `12345`
##### remote\_ip\_source [&para;](#remote_ip_source)
*(\>= 3.5.6)*
For authentication mechanisms that are made aware of the remote IP
(such as dovecot via the `rip=` auth protocol parameter),
determine the source to use. Currently, valid values are
`REMOTE\_ADDR` (default) : Use the REMOTE\_ADDR environment
variable that captures the remote address of the socket connection.
`X-Remote-Addr` : Use the `X-Remote-Addr` HTTP
header value.
In the case of `X-Remote-Addr`, Radicale must be running
be running behind a proxy that you control and that sets/overwrites the
`X-Remote-Addr` header (doesn't pass it) so that the value
passed to dovecot is reliable. For example, for nginx, add
```
` proxy\_set\_header X-Remote-Addr $remote\_addr;`
```
to the configuration sample.
Default: `REMOTE\_ADDR`
##### imap\_host [&para;](#imap_host)
*(\>= 3.4.1)*
IMAP server hostname.
One of:
* address
* address:port
*
* imap.server.tld
Default: `localhost`
##### imap\_security [&para;](#imap_security)
*(\>= 3.4.1)*
Secure the IMAP connection:
One of:
* `tls`
* `starttls`
* `none`
Default: `tls`
##### oauth2\_token\_endpoint [&para;](#oauth2_token_endpoint)
*(\>= 3.5.0)*
Endpoint URL for the OAuth2 token
Default: (unset)
##### oauth2\_client\_id [&para;](#oauth2_client_id)
*(\>= 3.7.0)*
Client ID used to request the Auth2 token
Default: `radicale`
##### oauth2\_client\_secret [&para;](#oauth2_client_secret)
*(\>= 3.7.0)*
Client secret used to request the Auth2 token
Default: (unset)
##### pam\_service [&para;](#pam_service)
*(\>= 3.5.0)*
PAM service name
Default: `radicale`
##### pam\_group\_membership [&para;](#pam_group_membership)
*(\>= 3.5.0)*
PAM group user should be member of
Default: (unset)
##### lc\_username [&para;](#lc_username)
&Scy;onvert username to lowercase. Recommended to be `True`
for case-insensitive auth providers like ldap, kerberos, ...
Default: `False`
Notes:
* `lc\_username` and `uc\_username` are mutually
exclusive
* for auth type `ldap` the use of
`ldap\_user\_attribute` is preferred over
`lc\_username`
##### uc\_username [&para;](#uc_username)
*(\>= 3.3.2)*
&Scy;onvert username to uppercase. Recommended to be `True`
for case-insensitive auth providers like ldap, kerberos, ...
Default: `False`
Notes:
* `uc\_username` and `lc\_username` are mutually
exclusive
* for auth type `ldap` the use of
`ldap\_user\_attribute` is preferred over
`uc\_username`
##### strip\_domain [&para;](#strip_domain)
*(\>= 3.2.3)*
Strip domain from username
Default: `False`
##### urldecode\_username [&para;](#urldecode_username)
*(\>= 3.5.3)*
URL-decode the username. If the username is an email address, some
clients send the username URL-encoded (notably iOS devices) breaking the
authentication process ([user@example.com](mailto:user@example.com) becomes
user%40example.com). This setting forces decoding the username.
Default: `False`
#### [rights] [&para;](#rights)
##### type [&para;](#type-1)
Authorization backend that is used to check the access rights to
collections.
The default and recommended backend is `owner\_only`. If
access to calendars and address books outside the user's collection
directory (that's `/username/`) is granted, clients will not
detect these collections automatically and will not show them to the
users. Choosing any other authorization backend is only useful if you
access calendars and address books directly via URL.
Available backends are:
* `authenticated`
Authenticated users can read and write everything.
* `owner\_only`
Authenticated users can read and write their own collections under the
path */USERNAME/*.
* `owner\_write`
Authenticated users can read everything and write their own collections
under the path */USERNAME/*.
* `from\_file`
Load the rules from a file.
Default: `owner\_only`
##### file [&para;](#file)
Name of the file containing the authorization rules for the
`from\_file` backend. See the [Rights](#authorization-and-rights) section for details.
Default: `/etc/radicale/rights`
##### permit\_delete\_collection [&para;](#permit_delete_collection)
*(\>= 3.1.9)*
Global permission to delete complete collections.
* If `False` it can be explicitly granted per collection by
*rights* permissions: `D`
* If `True` it can be explicitly forbidden per collection
by *rights* permissions: `d`
Default: `True`
##### permit\_overwrite\_collection [&para;](#permit_overwrite_collection)
*(\>= 3.3.0)*
Global permission to overwrite complete collections.
* If `False` it can be explicitly granted per collection by
*rights* permissions: `O`
* If `True` it can be explicitly forbidden per collection
by *rights* permissions: `o`
Default: `True`
#### [storage] [&para;](#storage-1)
##### type [&para;](#type-2)
Backend used to store data.
Available backends are:
* `multifilesystem`
Stores the data in the filesystem.
* `multifilesystem\_nolock`
The `multifilesystem` backend without file-based locking.
Must only be used with a single process.
Default: `multifilesystem`
##### filesystem\_folder [&para;](#filesystem_folder)
Folder for storing local collections; will be auto-created if not
present.
Default: `/var/lib/radicale/collections`
##### filesystem\_cache\_folder [&para;](#filesystem_cache_folder)
*(\>= 3.3.2)*
Folder for storing cache of local collections; will be auto-created
if not present
Default: (filesystem\_folder)
Note: only used if use\_cache\_subfolder\_\* options are active
Note: can be used on multi-instance setup to cache files on local
node (see below)
##### use\_cache\_subfolder\_for\_item [&para;](#use_cache_subfolder_for_item)
*(\>= 3.3.2)*
Use subfolder `collection-cache` for cache file structure
of 'item' instead of inside collection folders, created if not
present
Default: `False`
Note: can be used on multi-instance setup to cache 'item' on local
node
##### use\_cache\_subfolder\_for\_history [&para;](#use_cache_subfolder_for_history)
*(\>= 3.3.2)*
Use subfolder `collection-cache` for cache file structure
of 'history' instead of inside collection folders, created if not
present
Default: `False`
Note: only use on single-instance setup: it will break consistency
with clients in multi-instance setup
##### use\_cache\_subfolder\_for\_synctoken [&para;](#use_cache_subfolder_for_synctoken)
*(\>= 3.3.2)*
Use subfolder `collection-cache` for cache file structure
of 'sync-token' instead of inside collection folders, created if not
present
Default: `False`
Note: only use on single-instance setup: it will break consistency
with clients in multi-instance setup
##### use\_mtime\_and\_size\_for\_item\_cache [&para;](#use_mtime_and_size_for_item_cache)
*(\>= 3.3.2)*
Use last modification time (in nanoseconds) and size (in bytes) for
'item' cache instead of SHA256 (improves speed)
Default: `False`
Notes:
* check used filesystem mtime precision before enabling
* conversion is done on access
* bulk conversion can be done offline using the storage verification
option `radicale --verify-storage`
##### folder\_umask [&para;](#folder_umask)
*(\>= 3.3.2)*
umask to use for folder creation (not applicable for OS Windows)
Default: (system-default, usually `0022`)
Useful values:
* `0077` (user:rw group:- other:-)
* `0027` (user:rw group:r other:-)
* `0007` (user:rw group:rw other:-)
* `0022` (user:rw group:r other:r)
##### max\_sync\_token\_age [&para;](#max_sync_token_age)
Delete sync-tokens that are older than the specified time (in
seconds).
Default: `2592000`
##### skip\_broken\_item [&para;](#skip_broken_item)
*(\>= 3.2.2)*
Skip broken item instead of triggering an exception
Default: `True`
##### strict\_preconditions [&para;](#strict_preconditions)
*(\>= 3.5.8)*
Strict preconditions check on PUT in case item already exists [RFC6352#9.2](https://www.rfc-editor.org/rfc/rfc6352#section-9.2)
Default: `False`
##### validate\_user\_value [&para;](#validate_user_value)
*(\>= 3.7.2)*
Validate user value content
Available types are:
* `none`
* `minimal` (control and some special chars)
* `unicode-letter` (unicode letters)
* `no-unicode` (no unicode)
* `strict` (reduced ASCII set)
Default: `minimum`
##### validate\_path\_type [&para;](#validate_path_type)
*(\>= 3.7.2)*
Validate path value content
* `none`
* `minimal` (control and some special chars)
* `unicode-letter` (unicode letters)
* `no-unicode` (no unicode)
* `strict` (reduced ASCII set)
Default: `minimum`
##### hook [&para;](#hook)
Command that is run after changes to storage. See the [Versioning collections with
Git](#versioning-collections-with-git) tutorial for an example.
Default: (unset)
Supported placeholders:
* `%(user)s`: logged-in user
* `%(cwd)s`: current working directory *(\>=
3.5.1)*
* `%(path)s`: full path of item *(\>= 3.5.1)*
* `%(to\_path)s`: full path of destination item (only set on
MOVE request) *(\>= 3.5.5)*
* `%(request)s`: request method *(\>= 3.5.5)*
The command will be executed with base directory defined in
`filesystem\_folder` (see above)
##### predefined\_collections [&para;](#predefined_collections)
Create predefined user collections.
Example:
```
`{
"def-addressbook": {
"D:displayname": "Personal Address Book",
"tag": "VADDRESSBOOK"
},
"def-calendar": {
"C:supported-calendar-component-set": "VEVENT,VJOURNAL,VTODO",
"D:displayname": "Personal Calendar",
"tag": "VCALENDAR"
}
}`
```
Default: (unset)
#### [web] [&para;](#web)
##### type [&para;](#type-3)
The backend that provides the web interface of Radicale.
Available backends are:
* `none`
Simply shows the message "Radicale works!".
* `internal`
Allows creation and management of address books and calendars.
Default: `internal`
#### [logging] [&para;](#logging)
##### level [&para;](#level)
Set the logging level.
Available levels are:
* `trace` *(\>= 3.7.1)*
* `debug`
* `info`
* `notice` *(\>= 3.7.1)*
* `warning`
* `error`
* `critical`
* `alert` *(\>= 3.7.1)*
Default: `warning` *(\< 3.2.0)* /
`info` *(\>= 3.2.0)*
##### limit\_content [&para;](#limit_content)
*(\>= 3.7.0)*
Limit content of wrapped text (chars)
Default: `3000`
##### trace\_on\_debug [&para;](#trace_on_debug)
*(\> 3.5.4)* && *(\< 3.7.1)*
Do not filter debug messages starting with 'TRACE'
Default: `False`
##### trace\_filter [&para;](#trace_filter)
*(\> 3.5.4)* && *(\< 3.7.1)*
Filter debug messages starting with 'TRACE/'
Prerequisite: `trace\_on\_debug = True`
*(\>= 3.7.1)*
Filter trace messages starting with ''
Prerequisite: `level = trace`
Default: (empty)
##### mask\_passwords [&para;](#mask_passwords)
Do not include passwords in logs.
Default: `True`
##### bad\_put\_request\_content [&para;](#bad_put_request_content)
*(\>= 3.2.1)*
Log bad PUT request content (for further diagnostics)
Default: `False`
##### backtrace\_on\_debug [&para;](#backtrace_on_debug)
*(\>= 3.2.2)*
Log backtrace on `level = debug`
Default: `False`
##### request\_header\_on\_debug [&para;](#request_header_on_debug)
*(\>= 3.2.2)*
Log request header on `level = debug`
Default: `False`
##### request\_content\_on\_debug [&para;](#request_content_on_debug)
*(\>= 3.2.2)*
Log request content (body) on `level = debug`
Default: `False`
##### response\_header\_on\_debug [&para;](#response_header_on_debug)
*(\>= 3.5.10)*
Log response header on `level = debug`
Default: `False`
##### response\_content\_on\_debug [&para;](#response_content_on_debug)
*(\>= 3.2.2)*
Log response content (body) on `level = debug`
Default: `False`
##### rights\_rule\_doesnt\_match\_on\_debug [&para;](#rights_rule_doesnt_match_on_debug)
*(\>= 3.2.3)*
Log rights rule which doesn't match on `level = debug`
Default: `False`
##### storage\_cache\_actions\_on\_debug [&para;](#storage_cache_actions_on_debug)
*(\>= 3.3.2)*
Log storage cache actions on `level = debug`
Default: `False`
##### profiling\_per\_request [&para;](#profiling_per_request)
*(\>= 3.5.10)*
Log profiling data on level=info
Default: `none`
One of
* `none` (disabled)
* `per\_request` (above minimum duration)
* `per\_request\_method` (regular interval)
##### profiling\_per\_request\_min\_duration [&para;](#profiling_per_request_min_duration)
*(\>= 3.5.10)*
Log profiling data per request minimum duration (seconds) before
logging, otherwise skip
Default: `3`
##### profiling\_per\_request\_header [&para;](#profiling_per_request_header)
*(\>= 3.5.10)*
Log profiling request header (if passing minimum duration)
Default: `False`
##### profiling\_per\_request\_xml [&para;](#profiling_per_request_xml)
*(\>= 3.5.10)*
Log profiling request XML (if passing minimum duration)
Default: `False`
##### profiling\_per\_request\_method\_interval [&para;](#profiling_per_request_method_interval)
*(\>= 3.5.10)*
Log profiling data per method interval (seconds) Triggered by
request, not active on idle systems
Default: `600`
##### profiling\_top\_x\_functions [&para;](#profiling_top_x_functions)
*(\>= 3.5.10)*
Log profiling top X functions (limit)
Default: `10`
#### [headers] [&para;](#headers)
This section can be used to specify additional HTTP headers that will
be sent to clients.
An example to relax the same-origin policy:
```
`Access-Control-Allow-Origin = \*`
```
An example to set CSP to disallow execution of unknown
javascript:
```
`Content-Security-Policy = default-src 'self'; object-src 'none'`
```
#### [hook] [&para;](#hook-1)
##### type [&para;](#type-4)
Hook binding for event changes and deletion notifications.
Available types are:
* `none`
Disabled. Nothing will be notified.
* `rabbitmq` *(\>= 3.2.0)*
Push the message to the rabbitmq server.
* `email` *(\>= 3.5.5)*
Send an email notification to event attendees.
Default: `none`
##### dryrun [&para;](#dryrun)
*(\> 3.5.4)*
Dry-Run / simulate (i.e. do not really trigger) the hook action.
Default: `False`
##### rabbitmq\_endpoint [&para;](#rabbitmq_endpoint)
*(\>= 3.2.0)*
End-point address for rabbitmq server. E.g.:
`amqp://user:password@localhost:5672/`
Default: (unset)
##### rabbitmq\_topic [&para;](#rabbitmq_topic)
*(\>= 3.2.0)*
RabbitMQ topic to publish message in.
Default: (unset)
##### rabbitmq\_queue\_type [&para;](#rabbitmq_queue_type)
*(\>= 3.2.0)*
RabbitMQ queue type for the topic.
Default: `classic`
##### smtp\_server [&para;](#smtp_server)
*(\>= 3.5.5)*
Address of SMTP server to connect to.
Default: (unset)
##### smtp\_port [&para;](#smtp_port)
*(\>= 3.5.5)*
Port on SMTP server to connect to.
Default:
##### smtp\_security [&para;](#smtp_security)
*(\>= 3.5.5)*
Use encryption on the SMTP connection.
One of:
* `none`
* `tls`
* `starttls`
Default: `none`
##### smtp\_ssl\_verify\_mode [&para;](#smtp_ssl_verify_mode)
*(\>= 3.5.5)*
The certificate verification mode for tls and starttls.
One of:
* `NONE`
* `OPTIONAL`
* `REQUIRED`
Default: `REQUIRED`
##### smtp\_username [&para;](#smtp_username)
*(\>= 3.5.5)*
Username to authenticate with SMTP server. Leave empty to disable
authentication (e.g. using local mail server).
Default: (unset)
##### smtp\_password [&para;](#smtp_password)
*(\>= 3.5.5)*
Password to authenticate with SMTP server. Leave empty to disable
authentication (e.g. using local mail server).
Default: (unset)
##### from\_email [&para;](#from_email)
*(\>= 3.5.5)*
Email address to use as sender in email notifications.
Default: (unset)
##### mass\_email [&para;](#mass_email)
*(\>= 3.5.5)*
When enabled, send one email to all attendee email addresses. When
disabled, send one email per attendee email address.
Default: `False`
##### new\_or\_added\_to\_event\_template [&para;](#new_or_added_to_event_template)
*(\>= 3.5.5)*
Template to use for added/updated event email body sent to an
attendee when the event is created or they are added to a pre-existing
event.
The following placeholders will be replaced:
* `$organizer\_name`: Name of the organizer, or "Unknown
Organizer" if not set in event
* `$from\_email`: Email address the email is sent from
* `$attendee\_name`: Name of the attendee (email recipient),
or "everyone" if mass email enabled.
* `$event\_name`: Name/summary of the event, or "No Title"
if not set in event
* `$event\_start\_time`: Start time of the event in ISO 8601
format
* `$event\_end\_time`: End time of the event in ISO 8601
format, or "No End Time" if the event has no end time
* `$event\_location`: Location of the event, or "No Location
Specified" if not set in event
Providing any words prefixed with $ not included in the list above
will result in an error.
Default:
```
`Hello $attendee\_name,
You have been added as an attendee to the following calendar event.
$event\_title
$event\_start\_time - $event\_end\_time
$event\_location
This is an automated message. Please do not reply.`
```
##### deleted\_or\_removed\_from\_event\_template [&para;](#deleted_or_removed_from_event_template)
*(\>= 3.5.5)*
Template to use for deleted/removed event email body sent to an
attendee when the event is deleted or they are removed from the
event.
The following placeholders will be replaced:
* `$organizer\_name`: Name of the organizer, or "Unknown
Organizer" if not set in event
* `$from\_email`: Email address the email is sent from
* `$attendee\_name`: Name of the attendee (email recipient),
or "everyone" if mass email enabled.
* `$event\_name`: Name/summary of the event, or "No Title"
if not set in event
* `$event\_start\_time`: Start time of the event in ISO 8601
format
* `$event\_end\_time`: End time of the event in ISO 8601
format, or "No End Time" if the event has no end time
* `$event\_location`: Location of the event, or "No Location
Specified" if not set in event
Providing any words prefixed with $ not included in the list above
will result in an error.
Default:
```
`Hello $attendee\_name,
The following event has been deleted.
$event\_title
$event\_start\_time - $event\_end\_time
$event\_location
This is an automated message. Please do not reply.`
```
##### updated\_event\_template [&para;](#updated_event_template)
*(\>= 3.5.5)*
Template to use for updated event email body sent to an attendee when
non-attendee-related details of the event are updated.
Existing attendees will NOT be notified of a modified event if the
only changes are adding/removing other attendees.
The following placeholders will be replaced:
* `$organizer\_name`: Name of the organizer, or "Unknown
Organizer" if not set in event
* `$from\_email`: Email address the email is sent from
* `$attendee\_name`: Name of the attendee (email recipient),
or "everyone" if mass email enabled.
* `$event\_name`: Name/summary of the event, or "No Title"
if not set in event
* `$event\_start\_time`: Start time of the event in ISO 8601
format
* `$event\_end\_time`: End time of the event in ISO 8601
format, or "No End Time" if the event has no end time
* `$event\_location`: Location of the event, or "No Location
Specified" if not set in event
Providing any words prefixed with $ not included in the list above
will result in an error.
Default:
```
`Hello $attendee\_name,
The following event has been updated.
$event\_title
$event\_start\_time - $event\_end\_time
$event\_location
This is an automated message. Please do not reply.`
```
#### [reporting] [&para;](#reporting)
##### max\_freebusy\_occurrence [&para;](#max_freebusy_occurrence)
*(\>= 3.2.3)*
When returning a free-busy report, a list of busy time occurrences
are generated based on a given time frame. Large time frames could
generate a lot of occurrences based on the time frame supplied. This
setting limits the lookup to prevent potential denial of service attacks
on large time frames. If the limit is reached, an HTTP error is thrown
instead of returning the results.
Default: 10000
#### [sharing] [&para;](#sharing)
*(\>= 3.7.0)*
See also [Collection
Sharing](https://github.com/Kozea/Radicale/blob/master/SHARING.md).
##### type [&para;](#type-5)
*(\>= 3.7.0)*
Sharing database type
One of:
* `none`
* `csv`
* `files`
Default: `none` (implicit disabling the feature)
##### database\_path [&para;](#database_path)
*(\>= 3.7.0)*
Sharing database path
Default:
* type `csv`:
`(filesystem\_folder)/collection-db/sharing.csv`
* type `files`:
`(filesystem\_folder)/collection-db/files`
##### collection\_by\_token [&para;](#collection_by_token)
*(\>= 3.7.0)*
Share collection by token
Default: `false`
##### collection\_by\_map [&para;](#collection_by_map)
*(\>= 3.7.0)*
Share collection by map
Default: `false`
##### permit\_create\_token [&para;](#permit_create_token)
*(\>= 3.7.0)*
Permit create of token-based sharing
Default: `false`
* If `False` it can be explicitly granted by
*rights* permissions: `T`
* If `True` it can be explicitly forbidden by
*rights* permissions: `t`
##### permit\_create\_map [&para;](#permit_create_map)
*(\>= 3.7.0)*
Permit create of map-based sharing
Default: `false`
* If `False` it can be explicitly granted by
*rights* permissions: `M`
* If `True` it can be explicitly forbidden by
*rights* permissions: `m`
##### permit\_properties\_overlay [&para;](#permit_properties_overlay)
*(\>= 3.7.0)*
Permit (limited) properties overlay by user of shared collection
Default: `false`
* If `False` it can be explicitly granted by *share*
permissions: `P`
* If `True` it can be explicitly forbidden by
*share* permissions: `p`
##### enforce\_properties\_overlay [&para;](#enforce_properties_overlay)
*(\>= 3.7.0)*
Enforce properties overlay even on write access
Default: `true`
* If `False` it can be explicitly enforced by
*share* permissions: `E`
* If `True` it can be explicitly forbidden by
*share* permissions: `e`
##### default\_permissions\_create\_token [&para;](#default_permissions_create_token)
Default permissions for create token-based sharing
Default: `r`
Supported: `rwEePp`
##### default\_permissions\_create\_map [&para;](#default_permissions_create_map)
Default permissions for map-based sharing
Default: `r`
Supported: `rwEePp`
## Supported Clients [&para;](#supported-clients)
Radicale has been tested with:
* [Android](https://android.com/) with [DAVx⁵](https://www.davx5.com/) (formerly DAVdroid),
* [OneCalendar](https://www.onecalendar.nl/)
* [GNOME Calendar](https://wiki.gnome.org/Apps/Calendar),
[Contacts](https://wiki.gnome.org/Apps/Contacts) and [Evolution](https://wiki.gnome.org/Apps/Evolution)
* [KDE PIM Applications](https://kontact.kde.org/), [KDE Merkuro](https://apps.kde.org/de/merkuro/)
* [Mozilla
Thunderbird](https://www.mozilla.org/thunderbird/) ([Thunderbird/Radicale](https://github.com/Kozea/Radicale/wiki/Client-Thunderbird))
with [CardBook](https://addons.mozilla.org/thunderbird/addon/cardbook/)
and [Lightning](https://www.mozilla.org/projects/calendar/)
* [InfCloud](https://www.inf-it.com/open-source/clients/infcloud/)
([InfCloud/Radicale](https://github.com/Kozea/Radicale/wiki/Client-InfCloud)),
[CalDavZAP](https://www.inf-it.com/open-source/clients/caldavzap/),
[CardDavMATE](https://www.inf-it.com/open-source/clients/carddavmate/)
and [Open
Calendar](https://github.com/algoo/open-calendar/)
* [pimsync](https://pimsync.whynothugo.nl/) ([pimsync/Radicale](https://github.com/Kozea/Radicale/wiki/Client-pimsync))
Many clients do not support the creation of new calendars and address
books. You can use Radicale's web interface (e.g. [http://localhost:5232](http://localhost:5232)) to create and
manage address books and calendars.
In some clients, it is sufficient to simply enter the URL of the
Radicale server (e.g. `http://localhost:5232`) and your
username. In others, you have to enter the URL of the collection
directly (e.g. `http://localhost:5232/user/calendar`).
Some clients (notably macOS's Calendar.app) may silently refuse to
include account credentials over unsecured HTTP, leading to unexpected
authentication failures. In these cases, you want to make sure the
Radicale server is [accessible over HTTPS](#ssl).
#### DAVx⁵ [&para;](#davx⁵)
Enter the URL of the Radicale server (e.g.
`http://localhost:5232`) and your username. DAVx⁵ will show
all existing calendars and address books and you can create new
ones.
#### OneCalendar [&para;](#onecalendar)
When adding account, select CalDAV account type, then enter username,
password and the Radicale server (e.g.
`https://yourdomain:5232`). OneCalendar will show all
existing calendars and (FIXME: address books), you need to select which
ones you want to see. OneCalendar supports many other server types
too.
#### GNOME Calendar, Contacts [&para;](#gnome-calendar-contacts)
GNOME 46 added CalDAV and CardDAV support to *GNOME Online
Accounts*.
Open GNOME Settings, navigate to *Online Accounts* \>
*Connect an Account* \> *Calendar, Contacts and Files*.
Enter the URL (e.g. `https://example.com/radicale`) and your
credentials then click *Sign In*. In the pop-up dialog, turn off
*Files*. After adding Radicale in *GNOME Online Accounts*,
it should be available in GNOME Contacts and GNOME Calendar.
#### Evolution [&para;](#evolution)
In **Evolution** add a new calendar and address book
respectively with WebDAV. Enter the URL of the Radicale server (e.g.
`http://localhost:5232`) and your username. Clicking on the
search button will list the existing calendars and address books.
Adding CalDAV and CardDAV accounts in Evolution will automatically
make them available in GNOME Contacts and GNOME Calendar.
#### KDE PIM Applications [&para;](#kde-pim-applications)
In **Kontact** add a *DAV Groupware resource* to
Akonadi under *Settings \> Configure Kontact \> Calendar \>
General \> Calendars*, select the protocol (CalDAV or CardDAV),
add the URL to the Radicale collections and enter the credentials. After
synchronization of the calendar resp. addressbook items, you can manage
them in Kontact.
#### Thunderbird [&para;](#thunderbird)
Add a new calendar on the network. Enter your username and the URL of
the Radicale server (e.g. `http://localhost:5232`). After
asking for your password, it will list the existing calendars.
##### Address books with CardBook add-on [&para;](#address-books-with-cardbook-add-on)
Add a new address book on the network with CardDAV. Enter the URL of
the Radicale server (e.g. `http://localhost:5232`) and your
username and password. It will list your existing address books.
#### InfCloud, CalDavZAP and CardDavMATE [&para;](#infcloud-caldavzap-and-carddavmate)
You can integrate InfCloud into Radicale's web interface with by
simply downloading the latest package from [InfCloud](https://www.inf-it.com/open-source/clients/infcloud/)
and extract the content into a folder named `infcloud` in
`radicale/web/internal\_data/`.
No further adjustments are required as content is adjusted on the fly
(tested with 0.13.1).
See also [Wiki/Client
InfCloud](https://github.com/Kozea/Radicale/wiki/Client-InfCloud).
#### Command line [&para;](#command-line)
This is not the recommended way of creating and managing your
calendars and address books. Use Radicale's web interface or a client
with support for it (e.g. **DAVx⁵**).
To create a new calendar run something like:
```
`$ curl -u user -X MKCOL 'http://localhost:5232/user/calendar' --data \\
'\<?xml version="1.0" encoding="UTF-8" ?\>
\<create xmlns="DAV:" xmlns:C="urn:ietf:params:xml:ns:caldav" xmlns:I="http://apple.com/ns/ical/"\>
\<set\>
\<prop\>
\<resourcetype\>
\<collection /\>
\<C:calendar /\>
\</resourcetype\>
\<C:supported-calendar-component-set\>
\<C:comp name="VEVENT" /\>
\<C:comp name="VJOURNAL" /\>
\<C:comp name="VTODO" /\>
\</C:supported-calendar-component-set\>
\<displayname\>Calendar\</displayname\>
\<C:calendar-description\>Example calendar\</C:calendar-description\>
\<I:calendar-color\>#ff0000ff\</I:calendar-color\>
\</prop\>
\</set\>
\</create\>'`
```
To create a new address book run something like:
```
`$ curl -u user -X MKCOL 'http://localhost:5232/user/addressbook' --data \\
'\<?xml version="1.0" encoding="UTF-8" ?\>
\<create xmlns="DAV:" xmlns:CR="urn:ietf:params:xml:ns:carddav"\>
\<set\>
\<prop\>
\<resourcetype\>
\<collection /\>
\<CR:addressbook /\>
\</resourcetype\>
\<displayname\>Address book\</displayname\>
\<CR:addressbook-description\>Example address book\</CR:addressbook-description\>
\</prop\>
\</set\>
\</create\>'`
```
The collection `/USERNAME` will be created automatically,
when the user authenticates to Radicale for the first time. Clients with
automatic discovery of collections will only show calendars and address
books that are direct children of the path `/USERNAME/`.
Delete the collections by running something like:
```
`curl -u user -X DELETE 'http://localhost:5232/user/calendar'`
```
Note: requires config/option
`permit\_delete\_collection = True`
## Internals [&para;](#internals)
### Authorization and Rights [&para;](#authorization-and-rights)
This section describes the format of the rights file for the
`from\_file` authentication backend. The configuration option
`file` in the `rights` section must point to the
rights file.
The recommended rights method is `owner\_only`. If access
is granted to calendars and address books outside the home directory of
users (that's `/USERNAME/`), clients will not detect these
collections automatically, and will not show them to the users. This is
only useful if you access calendars and address books directly via
URL.
An example rights file:
```
`# Allow reading root collection for authenticated users
[root]
user: .+
collection:
permissions: R
# Allow reading and writing principal collection (same as username)
[principal]
user: .+
collection: {user}
permissions: RW
# Allow reading and writing calendars and address books that are direct
# children of the principal collection
[calendars]
user: .+
collection: {user}/[^/]+
permissions: rw`
```
The titles of the sections are ignored (but must be unique). The keys
`user` and `collection` contain regular
expressions, that are matched against the username and the path of the
collection. Permissions from the first matching section are used. If no
section matches, access gets denied.
The username is empty for anonymous users. Therefore, the regex
`.+` only matches authenticated users and `.\*`
matches everyone (including anonymous users).
The path of the collection is separated by `/` and has no
leading or trailing `/`. Therefore, the path of the root
collection is empty.
In the `collection` regex you can use `{user}`
and get groups from the `user` regex with `{0}`,
`{1}`, etc.
In consequence of the parameter substitution you have to write
`{{` and `}}` if you want to use regular curly
braces in the `user` and `collection` regexes.
The following `permissions` are recognized:
* **R:** read collections (excluding address books and
calendars)
* **r:** read address book and calendar collections
* **i:** subset of **r** that only allows
direct access via HTTP method GET (CalDAV/CardDAV is susceptible to
expensive search requests)
* **W:** write collections (excluding address books and
calendars)
* **w:** write address book and calendar collections
* **D:** allow deleting a collection in case
`permit\_delete\_collection=False` *(\>= 3.3.0)*
* **d:** deny deleting a collection in case
`permit\_delete\_collection=True` *(\>= 3.3.0)*
* **O:** allow overwriting a collection in case
`permit\_overwrite\_collection=False` *(\>=
3.3.0)*
* **o:** deny overwriting a collection in case
`permit\_overwrite\_collection=True` *(\>=
3.3.0)*
* **T:** permit create of token-based sharing of
collection in case `permit\_create\_token=False` *(\>=
3.7.0)*
* **t:** deny create of token-based sharing of collection
in case `permit\_create\_token=True` *(\>=
3.7.0)*
* **M:** permit create of map-based sharing of collection
in case `permit\_create\_map= False` *(\>=
3.7.0)*
* **m:** deny create of map-based sharing of collection
in case `permit\_create\_map=True` *(\>= 3.7.0)*
### Storage [&para;](#storage-2)
This document describes the layout and format of the file system
storage, the `multifilesystem` backend.
It is safe to access and manipulate the data by hand or with scripts.
Scripts can be invoked manually, periodically (e.g. using [cron](https://manpages.debian.org/unstable/cron/cron.8.en.html))
or after each change to the storage with the configuration option
`hook` in the `storage` section (e.g. [Versioning collections with
Git](#versioning-collections-with-git)).
#### Layout [&para;](#layout)
The file system comprises the following files and folders:
* `.Radicale.lock`: The lock file for locking the
storage.
* `collection-root`: This folder contains all collections
and items.
Each collection is represented by a folder. This folder may contain
the file `.Radicale.props` with all WebDAV properties of the
collection encoded as [JSON](https://en.wikipedia.org/wiki/JSON).
Each item in a calendar or address book collection is represented by
a file containing the item's iCalendar resp. vCard data.
All files and folders, whose names start with a dot but not with
`.Radicale.` (internal files) are ignored.
Syntax errors in any of the files will cause all requests accessing
the faulty data to fail. The logging output should contain the names of
the culprits.
Caches and sync-tokens are stored in the `.Radicale.cache`
folder inside of collections. This folder may be created or modified,
while the storage is locked for shared access. In theory, it should be
safe to delete the folder. Caches will be recreated automatically and
clients will be told that their sync-token is not valid anymore.
You may encounter files or folders that start with
`.Radicale.tmp-`. Radicale uses them for atomic creation and
deletion of files and folders. They should be deleted after requests are
finished but it is possible that they are left behind when Radicale or
the computer crashes. You can safely delete them.
#### Locking [&para;](#locking)
When the data is accessed by hand or by an externally invoked script,
the storage must be locked. The storage can be locked for exclusive or
shared access. It prevents Radicale from reading or writing the file
system. The storage is locked with exclusive access while the
`hook` runs.
##### Linux shell scripts [&para;](#linux-shell-scripts)
Use the [flock](https://manpages.debian.org/unstable/util-linux/flock.1.en.html)
utility to acquire exclusive or shared locks for the commands you want
to run on Radicale's data.
```
`# Exclusive lock for COMMAND
$ flock --exclusive /path/to/storage/.Radicale.lock COMMAND
# Shared lock for COMMAND
$ flock --shared /path/to/storage/.Radicale.lock COMMAND`
```
##### Linux and MacOS [&para;](#linux-and-macos)
Use the [flock](https://manpages.debian.org/unstable/manpages-dev/flock.2.en.html)
syscall. Python provides it in the [fcntl](https://docs.python.org/3/library/fcntl.html#fcntl.flock)
module.
##### Windows [&para;](#windows-1)
Use [LockFile](https://msdn.microsoft.com/en-us/library/windows/desktop/aa365202(v=vs.85).aspx)
for exclusive access or [LockFileEx](https://msdn.microsoft.com/en-us/library/windows/desktop/aa365203(v=vs.85).aspx)
which also supports shared access. Setting
`nNumberOfBytesToLockLow` to `1` and
`nNumberOfBytesToLockHigh` to `0` works.
#### Manually creating collections [&para;](#manually-creating-collections)
To create a new collection, you need to create the corresponding
folder in the file system storage (e.g.
`collection-root/user/calendar`). To indicate to Radicale and
clients that the collection is a calendar, you have to create the file
`.Radicale.props` with the following content in the
folder:
```
`{"tag": "VCALENDAR"}`
```
The calendar is now available at the URL path (e.g.
`/user/calendar`). For address books
`.Radicale.props` must contain:
```
`{"tag": "VADDRESSBOOK"}`
```
Calendar and address book collections must not have any child
collections. Clients with automatic discovery of collections will only
show calendars and address books that are direct children of the path
`/USERNAME/`.
Delete collections by deleting the corresponding folders.
### Logging overview [&para;](#logging-overview)
Radicale logs to `stderr`. The verbosity of the log output
can be controlled with `--debug` command line argument or the
`level` configuration option in the [logging](#logging) section.
### Architecture [&para;](#architecture)
Radicale is a small piece of software, but understanding it is not as
easy as it seems. But don't worry, reading this short section is enough
to understand what a CalDAV/CardDAV server is, and how Radicale's code
is organized.
#### Protocol overview [&para;](#protocol-overview)
Here is a simple overview of the global architecture for reaching a
calendar or an address book through network:
|Part|Layer|Protocol or Format|
|Server|Calendar/Contact Storage|iCal/vCard|
|''|Calendar/Contact Server|CalDAV/CardDAV Server|
|Transfer|Network|CalDAV/CardDAV (HTTP + TLS)|
|Client|Calendar/Contact Client|CalDAV/CardDAV Client|
|''|GUI|Terminal, GTK, Web interface, etc.|
Radicale is **only the server part** of this
architecture.
Please note:
* CalDAV and CardDAV are extension protocols of WebDAV,
* WebDAV is an extension of the HTTP protocol.
Radicale being a CalDAV/CardDAV server, can also be seen as a special
WebDAV and HTTP server.
Radicale is **not the client part** of this
architecture. It means that Radicale never draws calendars, address
books, events and contacts on the screen. It only stores them and give
the possibility to share them online with other people.
If you want to see or edit your events and your contacts, you have to
use another software called a client, that can be a "normal"
applications with icons and buttons, a terminal or another web
application.
#### Code Architecture [&para;](#code-architecture)
The `radicale` package offers the following modules.
* `\_\_init\_\_` : Contains the entry point for
WSGI.
* `\_\_main\_\_` : Provides the entry point for the
`radicale` executable and includes the command line parser.
It loads configuration files from the default (or specified) paths and
starts the internal server.
* `app` : This is the core part of Radicale, with the
code for the CalDAV/CardDAV server. The code managing the different HTTP
requests according to the CalDAV/CardDAV specification can be found
here.
* `auth` : Used for authenticating users based on
username and password, mapping usernames to internal users and
optionally retrieving credentials from the environment.
* `config` : Contains the code for managing
configuration and loading settings from files.
* `&igrave;tem` : Internal representation of address book and
calendar entries. Based on [VObject](https://github.com/py-vobject/vobject/).
* `log` : The logger for Radicale based on the default
Python logging module.
* `rights` : This module is used by Radicale to manage
access rights to collections, address books and calendars.
* `server` : The integrated HTTP server for standalone
use.
* `storage` : This module contains the classes
representing collections in Radicale and the code for storing and
loading them in the filesystem.
* `sharing` : This module contains the classes
representing collection sharing. *(\>= 3.7.0)*
* `web` : This module contains the web
interface.
* `utils` : Contains general helper functions.
* `httputils` : Contains helper functions for working
with HTTP.
* `pathutils` : Helper functions for working with paths
and the filesystem.
* `xmlutils` : Helper functions for working with the XML
part of CalDAV/CardDAV requests and responses. It's based on the
ElementTree XML API.
### Plugins [&para;](#plugins)
Radicale can be extended by plugins for authentication, rights
management and storage. Plugins are **python** modules.
#### Getting started with plugin development [&para;](#getting-started-with-plugin-development)
To get started we walk through the creation of a simple
authentication plugin, that accepts login attempts with a static
password.
The easiest way to develop and install **python**
modules is [Distutils](https://docs.python.org/3/distutils/setupscript.html).
For a minimal setup create the file `setup.py` with the
following content in an empty folder:
```
`#!/usr/bin/env python3
from distutils.core import setup
setup(name="radicale\_static\_password\_auth",
packages=["radicale\_static\_password\_auth"])`
```
In the same folder create the sub-folder
`radicale\_static\_password\_auth`. The folder must have the
same name as specified in `packages` above.
Create the file `\_\_init\_\_.py` in the
`radicale\_static\_password\_auth` folder with the following
content:
```
`from radicale.auth import BaseAuth
from radicale.log import logger
PLUGIN\_CONFIG\_SCHEMA = {"auth": {
"password": {"value": "", "type": str}}}
class Auth(BaseAuth):
def \_\_init\_\_(self, configuration):
super().\_\_init\_\_(configuration.copy(PLUGIN\_CONFIG\_SCHEMA))
def \_login(self, login, password):
# Get password from configuration option
static\_password = self.configuration.get("auth", "password")
# Check authentication
logger.info("Login attempt by %r with password %r",
login, password)
if password == static\_password:
return login
return ""`
```
Install the python module by running the following command in the
same folder as `setup.py`:
```
`python3 -m pip install .`
```
To make use this great creation in Radicale, set the configuration
option `type` in the `auth` section to
`radicale\_static\_password\_auth`:
```
`[auth]
type = radicale\_static\_password\_auth
password = secret`
```
You can uninstall the module with:
```
`python3 -m pip uninstall radicale\_static\_password\_auth`
```
#### Authentication plugins [&para;](#authentication-plugins)
This plugin type is used to check login credentials. The module must
contain a class `Auth` that extends
`radicale.auth.BaseAuth`. Take a look at the file
`radicale/auth/\_\_init\_\_.py` in Radicale's source code for
more information.
#### Rights management plugins [&para;](#rights-management-plugins)
This plugin type is used to check if a user has access to a path. The
module must contain a class `Rights` that extends
`radicale.rights.BaseRights`. Take a look at the file
`radicale/rights/\_\_init\_\_.py` in Radicale's source code for
more information.
#### Web plugins [&para;](#web-plugins)
This plugin type is used to provide the web interface for Radicale.
The module must contain a class `Web` that extends
`radicale.web.BaseWeb`. Take a look at the file
`radicale/web/\_\_init\_\_.py` in Radicale's source code for more
information.
#### Storage plugins [&para;](#storage-plugins)
This plugin is used to store collections and items. The module must
contain a class `Storage` that extends
`radicale.storage.BaseStorage`. Take a look at the file
`radicale/storage/\_\_init\_\_.py` in Radicale's source code for
more information.
## Contribute [&para;](#contribute)
#### Report Bugs [&para;](#report-bugs)
Found a bug? Want a new feature? Report a new issue on the [Radicale
bug-tracker](https://github.com/Kozea/Radicale/issues).
#### Hack [&para;](#hack)
Interested in hacking? Feel free to clone the [git repository on GitHub](https://github.com/Kozea/Radicale) if
you want to add new features, fix bugs or update the documentation.
#### Documentation [&para;](#documentation-2)
To change or complement the documentation create a pull request to [DOCUMENTATION.md](https://github.com/Kozea/Radicale/blob/master/DOCUMENTATION.md).
## Download [&para;](#download)
#### PyPI [&para;](#pypi)
Radicale is [available on PyPI](https://pypi.python.org/pypi/Radicale/). To
install, just type as superuser:
```
`python3 -m pip install --upgrade radicale`
```
#### Git Repository [&para;](#git-repository)
If you want the development version of Radicale, take a look at the
[git repository on
GitHub](https://github.com/Kozea/Radicale/), or install it directly with:
```
`python3 -m pip install --upgrade https://github.com/Kozea/Radicale/archive/master.tar.gz`
```
You can also download the content of the repository as an [archive](https://github.com/Kozea/Radicale/tarball/master).
#### Source Packages [&para;](#source-packages)
You can find the source packages of all releases on [GitHub](https://github.com/Kozea/Radicale/releases).
#### Docker [&para;](#docker)
Radicale is available as a Docker image for platforms
`linux/amd64` and `linux/arm64` on:
* [Docker Hub](https://hub.docker.com/r/kozea/radicale),
and
* [GitHub's
Container Registry](https://github.com/Kozea/Radicale/pkgs/container/radicale)
Here are the steps to install Radicale via Docker Compose:
1. Create required directories
Create a directory to store the data, configuration and compose
file.
For example, assuming `./radicale`:
```
`$ mkdir radicale
$ cd radicale`
```
Create directories to store data and configuration.
For example, assuming data directory as `./data` and
configuration directory as `./config`:
```
`$ mkdir config data`
```
2. Download the compose file
```
`$ wget https://raw.githubusercontent.com/Kozea/Radicale/refs/heads/master/compose.yaml`
```
The compose file assumes `./config` and
`./data` directories. Review the file and modify as
needed.
3. Create Radicale configuration file as necessary
Create a new configuration file or place an existing one in the
`./config` directory.
**Note**: This section demonstrates only basic steps to
setup Radicale using `docker compose`. For details on
configuring Radicale, including authentication, please refer to the
documentation for [Basic Configuration](#basic-configuration)
or detailed [Configuration](#configuration)
4. Start Radicale
```
`$ docker compose up -d`
```
This will start the Radicale container in detached mode.
To view the logs of the running container, run:
```
`$ docker compose logs -f`
```
To stop the container, run this from the current directory:
```
`$ docker compose down`
```
##### Available tags [&para;](#available-tags)
* `stable`: Points to the latest stable release. This is
recommended for most users.
* Major.Minor.Patch (e.g. `3.6.1`): Points to a specific
release version.
* Major.Minor (e.g. `3.6`): Tracks the latest release for a
minor version.
* Major (e.g. `3`): Tracks the latest release for a major
version.
* nightly tags (e.g. `nightly-20260206`): Nightly
builds.
* `latest`: Points to the most recent build. In most cases,
this is nightly.
#### Linux Distribution Packages [&para;](#linux-distribution-packages)
Radicale has been packaged for:
* [ArchLinux](https://www.archlinux.org/packages/community/any/radicale/)
by David Runge
* [Debian](https://packages.debian.org/radicale) by Jonas
Smedegaard
* [Gentoo](https://packages.gentoo.org/packages/www-apps/radicale)
by Ren&eacute; Neumann, Maxim Koltsov and Manuel R&uuml;ger
* [Fedora/EnterpriseLinux](https://src.fedoraproject.org/rpms/radicale)
by Jorti and Peter Bieringer
* [Mageia](http://madb.mageia.org/package/show/application/0/name/radicale)
by Jani V&auml;limaa
* [OpenBSD](http://openports.se/productivity/radicale) by
Sergey Bronnikov, Stuart Henderson and Ian Darwin
* [openSUSE](http://software.opensuse.org/package/Radicale?search_term=radicale)
by &Aacute;kos Sz&odblac;ts and Rueckert
* [PyPM](http://code.activestate.com/pypm/radicale/)
* [Slackware](http://schoepfer.info/slackware.xhtml#packages-network)
by Johannes Sch&ouml;pfer
* [Trisquel](http://packages.trisquel.info/search?searchon=names&keywords=radicale)
* [Ubuntu](http://packages.ubuntu.com/radicale) by the MOTU
and Jonas Smedegaard
Radicale is also [available
on Cloudron](https://cloudron.io/button.html?app=org.radicale.cloudronapp2).
If you are interested in creating packages for other Linux
distributions, read the ["Contribute"
section](#contribute).
## About [&para;](#about)
#### Main Goals [&para;](#main-goals)
Radicale is a complete calendar and contact storing and manipulating
solution. It can store multiple calendars and multiple address
books.
Calendar and contact manipulation is available from both local and
distant accesses, possibly limited through authentication policies.
It aims to be a lightweight solution, easy to use, easy to install,
easy to configure. As a consequence, it requires few software
dependencies and is preconfigured to work out-of-the-box.
Radicale is written in Python. It runs on most of the UNIX-like
platforms (Linux, \*BSD, macOS) and Windows. It is free and open-source
software.
#### What Radicale Will Never Be [&para;](#what-radicale-will-never-be)
Radicale is a server, not a client. No interfaces will be created to
work with the server.
CalDAV and CardDAV are not perfect protocols. We think that their
main problem is their complexity, that is why we decided not to
implement the whole standard but just enough to understand some of its
client-side implementations.
CalDAV and CardDAV are the best open standards available, and they
are quite widely used by both clients and servers. We decided to use it,
and we will not use another one.
#### Technical Choices [&para;](#technical-choices)
Important global development choices have been decided before writing
code. They are very useful to understand why the Radicale Project is
different from other CalDAV and CardDAV servers, and why features are
included or not in the code.
##### Oriented to Calendar and Contact User Agents [&para;](#oriented-to-calendar-and-contact-user-agents)
Calendar and contact servers work with calendar and contact clients,
using a defined protocol. CalDAV and CardDAV are good protocols,
covering lots of features and use cases, but it is quite hard to
implement fully.
Some calendar servers have been created to follow the CalDAV and
CardDAV RFCs as much as possible: [Davical](http://www.davical.org/), [Ba&iuml;kal](http://sabre.io/baikal/) and [Darwin Calendar Server](http://trac.calendarserver.org/), for
example, are much more respectful of CalDAV and CardDAV and can be used
with many clients. They are very good choices if you want to develop and
test new CalDAV clients, or if you have a possibly heterogeneous list of
user agents.
Even if it tries it best to follow the RFCs, Radicale does not and
**will not** blindly implement the CalDAV and CardDAV
standards. It is mainly designed to support the CalDAV and CardDAV
implementations of different clients.
##### Simple [&para;](#simple)
Radicale is designed to be simple to install, simple to configure,
simple to use.
The installation is very easy, particularly with Linux: one
dependency, no superuser rights needed, no configuration required, no
database. Installing and launching the main script out-of-the-box, as a
normal user, are often the only steps to have a simple remote calendar
and contact access.
Contrary to other servers that are often complicated, require high
privileges or need a strong configuration, the Radicale Server can
(sometimes, if not often) be launched in a couple of minutes, if you
follow the [tutorial](#simple-5-minute-setup).
##### Lazy [&para;](#lazy)
The CalDAV RFC defines what must be done, what can be done and what
cannot be done. Many violations of the protocol are totally defined and
behaviors are given in such cases.
Radicale often assumes that the clients are perfect and that protocol
violations do not exist. That is why most of the errors in client
requests have undetermined consequences for the lazy server that can
reply good answers, bad answers, or even no answer.
#### History [&para;](#history)
Radicale has been started as a (free topic) stupid school project
replacing another (assigned topic) even more stupid school project.
At the beginning, it was just a proof-of-concept. The main goal was
to write a small, dirty and simple CalDAV server working with Lightning,
using no external libraries. That's how we created a piece of code
that's (quite) easy to understand, to use and to hack.
The [first
lines](https://github.com/Kozea/Radicale/commit/b1591aea) have been added to the SVN (!) repository as I was drinking
(many) beers at the very end of 2008 (Python 2.6 and 3.0 were just
released). It's now packaged for a growing number of Linux
distributions.
And that was fun going from here to there thanks to you!