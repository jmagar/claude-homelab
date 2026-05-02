Options | linkding
[Skip to content](#_top)
# Options
This document lists the options that linkding can be configured with and explains how to use them in the individual install scenarios.
## Using options
[Section titled “Using options”](#using-options)
### Docker
[Section titled “Docker”](#docker)
Options are passed as environment variables to the Docker container by using the `-e` argument when using `docker run`. For example:
```
`
docker run --name linkding -p 9090:9090 -d -e LD\_DISABLE\_URL\_VALIDATION=True sissbruecker/linkding:latest
`
```
For multiple options, use one `-e` argument per option.
### Docker-compose
[Section titled “Docker-compose”](#docker-compose)
For docker-compose options are configured using an `.env` file.
Follow the docker-compose setup in the README and copy `.env.sample` to `.env`. Then modify the options in `.env`.
## List of options
[Section titled “List of options”](#list-of-options)
### `LD\_SUPERUSER\_NAME`
[Section titled “LD\_SUPERUSER\_NAME”](#ld_superuser_name)
Values: `String` | Default = None
When set, creates an initial superuser with the specified username when starting the container.
Does nothing if the user already exists.
See [`LD\_SUPERUSER\_PASSWORD`](#ld_superuser_password) on how to configure the respective password.
### `LD\_SUPERUSER\_PASSWORD`
[Section titled “LD\_SUPERUSER\_PASSWORD”](#ld_superuser_password)
Values: `String` | Default = None
The password for the initial superuser.
When left undefined, the superuser will be created without a usable password, which means the user can not authenticate using credentials / through the login form, and can only be authenticated using proxy authentication (see [`LD\_ENABLE\_AUTH\_PROXY`](#ld_enable_auth_proxy)).
### `LD\_DISABLE\_BACKGROUND\_TASKS`
[Section titled “LD\_DISABLE\_BACKGROUND\_TASKS”](#ld_disable_background_tasks)
Values: `True`, `False` | Default = `False`
Disables background tasks, such as creating snapshots for bookmarks on the [the Internet Archive Wayback Machine](https://archive.org/web/).
Enabling this flag will prevent the background task processor from starting up, and prevents scheduling tasks.
This might be useful if you are experiencing performance issues or other problematic behaviour due to background task processing.
### `LD\_SUPERVISOR\_MANAGED` (Experimental)
[Section titled “LD\_SUPERVISOR\_MANAGED (Experimental)”](#ld_supervisor_managed-experimental)
Values: `True`, `False` | Default = `False`
Changes how processes are managed within the container.
When enabled, supervisor manages both the background task processor and the web server (uwsgi).
This enables background task logs to appear in the container output (visible via `docker logs`).
At the moment, supervisor will automatically restart crashed processes and the `LD\_DISABLE\_BACKGROUND\_TASKS` setting is ignored.
When disabled (default), the background task processor runs as a daemon and uwsgi runs as the main process.
Background task logs are written to a file (`background\_tasks.log`) instead of the container output.
### `LD\_DISABLE\_URL\_VALIDATION`
[Section titled “LD\_DISABLE\_URL\_VALIDATION”](#ld_disable_url_validation)
Values: `True`, `False` | Default = `False`
Completely disables URL validation for bookmarks.
This can be useful if you intend to store non fully qualified domain name URLs, such as network paths, or you want to store URLs that use another protocol than `http` or `https`.
### `LD\_REQUEST\_MAX\_CONTENT\_LENGTH`
[Section titled “LD\_REQUEST\_MAX\_CONTENT\_LENGTH”](#ld_request_max_content_length)
Values: `Integer` as bytes | Default = `None`
Configures the maximum content length for POST requests in the uwsgi application server. This can be used to prevent uploading large files that might cause the server to run out of memory. By default, the server does not limit the content length.
### `LD\_REQUEST\_TIMEOUT`
[Section titled “LD\_REQUEST\_TIMEOUT”](#ld_request_timeout)
Values: `Integer` as seconds | Default = `60`
Configures the request timeout in the uwsgi application server. This can be useful if you want to import a bookmark file with a high number of bookmarks and run into request timeouts.
### `LD\_SERVER\_HOST`
[Section titled “LD\_SERVER\_HOST”](#ld_server_host)
Values: Valid address for socket to bind to | Default = `[::]`
Allows to set a custom host for the UWSGI server running in the container. The default creates a dual stack socket, which will respond to IPv4 and IPv6 requests. IPv4 requests are logged as IPv4-mapped IPv6 addresses, such as “::ffff:127.0.0.1”. If reverting to an IPv4-only socket is desired, this can be set to “0.0.0.0”.
### `LD\_SERVER\_PORT`
[Section titled “LD\_SERVER\_PORT”](#ld_server_port)
Values: Valid port number | Default = `9090`
Allows to set a custom port for the UWSGI server running in the container. While Docker containers have their own IP address namespace and port collisions are impossible to achieve, there are other container solutions that share one. Podman, for example, runs all containers in a pod under one namespace, which results in every port only being allowed to be assigned once. This option allows to set a custom port in order to avoid collisions with other containers.
### `LD\_CONTEXT\_PATH`
[Section titled “LD\_CONTEXT\_PATH”](#ld_context_path)
Values: `String` | Default = None
Allows configuring the context path of the website. Useful for setting up Nginx reverse proxy.
The context path must end with a slash. For example: `linkding/`
### `LD\_ENABLE\_AUTH\_PROXY`
[Section titled “LD\_ENABLE\_AUTH\_PROXY”](#ld_enable_auth_proxy)
Values: `True`, `False` | Default = `False`
Enables support for authentication proxies such as Authelia.
This effectively disables credentials-based authentication and instead authenticates users if a specific request header contains a known username.
You must make sure that your proxy (nginx, Traefik, Caddy, …) forwards this header from your auth proxy to linkding. Check the documentation of your auth proxy and your reverse proxy on how to correctly set this up.
Note that this automatically creates new users in the database if they do not already exist.
Enabling this setting also requires configuring the following options:
* `LD\_AUTH\_PROXY\_USERNAME\_HEADER` - The name of the request header that the auth proxy passes to the proxied application (linkding in this case), so that the application can identify the user.
Check the documentation of your auth proxy to get this information.
Note that the request headers are rewritten in linkding: all HTTP headers are prefixed with `HTTP\_`, all letters are in uppercase, and dashes are replaced with underscores.
For example, for Authelia, which passes the `Remote-User` HTTP header, the `LD\_AUTH\_PROXY\_USERNAME\_HEADER` needs to be configured as `HTTP\_REMOTE\_USER`.
* `LD\_AUTH\_PROXY\_LOGOUT\_URL` - The URL that linkding should redirect to after a logout.
By default, the logout redirects to the login URL, which means the user will be automatically authenticated again.
Instead, you might want to configure the logout URL of the auth proxy here.
### `LD\_ENABLE\_OIDC`
[Section titled “LD\_ENABLE\_OIDC”](#ld_enable_oidc)
Values: `True`, `False` | Default = `False`
Enables support for OpenID Connect (OIDC) authentication, allowing to use single sign-on (SSO) with OIDC providers.
When enabled, this shows a button on the login page that allows users to authenticate using an OIDC provider.
Users are associated by the email address provided from the OIDC provider, which is by default also used as username in linkding. You can configure a custom claim to be used as username with `OIDC\_USERNAME\_CLAIM`.
If there is no user with that email address as username, a new user is created automatically.
This requires configuring a number of options, which of those you need depends on which OIDC provider you use and how it is configured.
In general, you should find the required information in the UI of your OIDC provider, or its documentation.
The options are adopted from the [mozilla-django-oidc](https://mozilla-django-oidc.readthedocs.io/en/stable/) library, which is used by linkding for OIDC support.
Please check their documentation for more information on the options.
The following options can be configured:
* `OIDC\_OP\_AUTHORIZATION\_ENDPOINT` - The authorization endpoint of the OIDC provider.
* `OIDC\_OP\_TOKEN\_ENDPOINT` - The token endpoint of the OIDC provider.
* `OIDC\_OP\_USER\_ENDPOINT` - The user info endpoint of the OIDC provider.
* `OIDC\_OP\_JWKS\_ENDPOINT` - The JWKS endpoint of the OIDC provider.
* `OIDC\_RP\_CLIENT\_ID` - The client ID of the application.
* `OIDC\_RP\_CLIENT\_SECRET` - The client secret of the application.
* `OIDC\_RP\_SIGN\_ALGO` - The algorithm the OIDC provider uses to sign ID tokens. Default is `RS256`.
* `OIDC\_USE\_PKCE` - Whether to use PKCE for the OIDC flow. Default is `True`.
* `OIDC\_VERIFY\_SSL` - Whether to verify the SSL certificate of the OIDC provider. Set to `False` if using self-signed certificates or custom certificate authority. Default is `True`.
* `OIDC\_RP\_SCOPES` - Scopes asked for on the authorization flow. Default is `oidc email profile`.
* `OIDC\_USERNAME\_CLAIM` - A custom claim to used as username for new accounts, for example `preferred\_username`. If the configured claim does not exist or is empty, the email claim is used as fallback. Default is `email`.
#### `OIDC` and `LD\_SUPERUSER\_NAME`
[Section titled “OIDC and LD\_SUPERUSER\_NAME”](#oidc-and-ld_superuser_name)
As noted above, OIDC matches users by email address, but `LD\_SUPERUSER\_NAME` will only set the username.
Instead of setting `LD\_SUPERUSER\_NAME` it is recommended that you use the method described in [User setup](/installation#user-setup) to configure a superuser with both username and email address.
This way when OIDC searches for a matching user it will find the superuser account you created.
Note that you should create the superuser **before** logging in with OIDC for the first time.
Authelia Example
#### Linkding Configuration
[Section titled “Linkding Configuration”](#linkding-configuration)
Terminal window
```
`
LD\_ENABLE\_OIDC=True
OIDC\_OP\_AUTHORIZATION\_ENDPOINT=https://auth.example.com/api/oidc/authorization
OIDC\_OP\_TOKEN\_ENDPOINT=https://auth.example.com/api/oidc/token
OIDC\_OP\_USER\_ENDPOINT=https://auth.example.com/api/oidc/userinfo
OIDC\_OP\_JWKS\_ENDPOINT=https://auth.example.com/jwks.json
OIDC\_RP\_CLIENT\_ID=linkding
OIDC\_RP\_CLIENT\_SECRET=myClientSecret
`
```
#### Authelia Configuration
[Section titled “Authelia Configuration”](#authelia-configuration)
```
`
identity\_providers:
oidc:
# --- more OIDC provider configuration ---
clients:
- id: linkding
description: Linkding
# docker run --rm authelia/authelia:latest authelia crypto rand --length 64 --charset alphanumeric
secret: myClientSecret
public: false
token\_endpoint\_auth\_method: client\_secret\_post
scopes:
- openid
- email
- profile
redirect\_uris:
- https://linkding.example.com/oidc/callback/
`
```
### `LD\_DISABLE\_LOGIN\_FORM`
[Section titled “LD\_DISABLE\_LOGIN\_FORM”](#ld_disable_login_form)
Values: `True`, `False` | Default = `False`
Disables the login form on the login page.
This is useful when you want to enforce authentication through OIDC only.
When enabled, users will not be able to log in using their username and password, and only the “Login with OIDC” button will be shown on the login page.
### `LD\_CSRF\_TRUSTED\_ORIGINS`
[Section titled “LD\_CSRF\_TRUSTED\_ORIGINS”](#ld_csrf_trusted_origins)
Values: `String` | Default = None
List of trusted origins / host names to allow for `POST` requests, for example when logging in, or saving bookmarks.
For these type of requests, the `Origin` header must match the `Host` header, otherwise the request will fail with a `403` status code, and the message `CSRF verification failed.`
This option allows to declare a list of trusted origins that will be accepted even if the headers do not match. This can be the case when using a reverse proxy that rewrites the `Host` header, such as Nginx.
For example, to allow requests to [https://linkding.mydomain.com](https://linkding.mydomain.com), configure the setting to `https://linkding.mydomain.com`.
Note that the setting **must** include the correct protocol (`https` or `http`), and **must not** include the application / context path.
Multiple origins can be specified by separating them with a comma (`,`).
This setting is adopted from the Django framework used by linkding, more information on the setting is available in the [Django documentation](https://docs.djangoproject.com/en/4.0/ref/settings/#std-setting-CSRF_TRUSTED_ORIGINS).
### `LD\_USE\_X\_FORWARDED\_HOST`
[Section titled “LD\_USE\_X\_FORWARDED\_HOST”](#ld_use_x_forwarded_host)
Values: `true` or `false` | Default = `false`
If enabled the server will trust the `X-Forwarded-Host` header over the `Host` header to determine the hostname of the server. This should only be enabled if a proxy which sets this header is in use.
This setting is adopted from the Django framework used by linkding, more information on the setting is available in the [Django documentation](https://docs.djangoproject.com/en/6.0/ref/settings/#std-setting-USE_X_FORWARDED_HOST).
### `LD\_LOG\_X\_FORWARDED\_FOR`
[Section titled “LD\_LOG\_X\_FORWARDED\_FOR”](#ld_log_x_forwarded_for)
Values: `true` or `false` | Default = `false`
Set uWSGI [log-x-forwarded-for](https://uwsgi-docs.readthedocs.io/en/latest/Options.html?#log-x-forwarded-for) parameter allowing to keep the real IP of clients in logs when using a reverse proxy.
### `LD\_DB\_ENGINE`
[Section titled “LD\_DB\_ENGINE”](#ld_db_engine)
Values: `postgres` or `sqlite` | Default = `sqlite`
Database engine used by linkding to store data.
Currently, linkding supports SQLite and PostgreSQL.
By default, linkding uses SQLite, for which you don’t need to configure anything.
All the other database variables below are only required for configured PostgresSQL.
### `LD\_DB\_DATABASE`
[Section titled “LD\_DB\_DATABASE”](#ld_db_database)
Values: `String` | Default = `linkding`
The name of the database.
### `LD\_DB\_USER`
[Section titled “LD\_DB\_USER”](#ld_db_user)
Values: `String` | Default = `linkding`
The name of the user to connect to the database server.
### `LD\_DB\_PASSWORD`
[Section titled “LD\_DB\_PASSWORD”](#ld_db_password)
Values: `String` | Default = None
The password of the user to connect to the database server.
The password must be configured when using a database other than SQLite, there is no default value.
### `LD\_DB\_HOST`
[Section titled “LD\_DB\_HOST”](#ld_db_host)
Values: `String` | Default = `localhost`
The hostname or IP of the database server.
### `LD\_DB\_PORT`
[Section titled “LD\_DB\_PORT”](#ld_db_port)
Values: `Integer` | Default = None
The port of the database server.
Should use the default port if left empty, for example `5432` for PostgresSQL.
### `LD\_DB\_OPTIONS`
[Section titled “LD\_DB\_OPTIONS”](#ld_db_options)
Values: `String` | Default = `{}`
A json string with additional options for the database. Passed directly to OPTIONS.
### `LD\_FAVICON\_PROVIDER`
[Section titled “LD\_FAVICON\_PROVIDER”](#ld_favicon_provider)
Values: `String` | Default = `https://t1.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback\_opts=TYPE,SIZE,URL&url={url}&size=32`
The favicon provider used for downloading icons if they are enabled in the user profile settings.
The default provider is a Google service that automatically detects the correct favicon for a website, and provides icons in consistent image format (PNG) and in a consistent image size.
This setting allows to configure a custom provider in form of a URL.
When calling the provider with the URL of a website, it must return the image data for the favicon of that website.
The configured favicon provider URL must contain a placeholder that will be replaced with the URL of the website for which to download the favicon.
The available placeholders are:
* `{url}` - Includes the scheme and hostname of the website, for example `https://example.com`
* `{domain}` - Includes only the hostname of the website, for example `example.com`
Which placeholder you need to use depends on the respective favicon provider, please check their documentation or usage examples.
See the default URL for how to insert the placeholder to the favicon provider URL.
Alternative favicon providers:
* DuckDuckGo: `https://icons.duckduckgo.com/ip3/{domain}.ico`
### `LD\_SINGLEFILE\_TIMEOUT\_SEC`
[Section titled “LD\_SINGLEFILE\_TIMEOUT\_SEC”](#ld_singlefile_timeout_sec)
Values: `Float` | Default = 60.0
When creating HTML archive snapshots, control the timeout for how long to wait for the snapshot to complete, in `seconds`.
Defaults to 60 seconds; on lower-powered hardware you may need to increase this value.
### `LD\_SINGLEFILE\_OPTIONS`
[Section titled “LD\_SINGLEFILE\_OPTIONS”](#ld_singlefile_options)
Values: `String` | Default = None
When creating HTML archive snapshots, pass additional options to the `single-file` application that is used to create snapshots.
See `single-file --help` for complete list of arguments, or browse source: [https://github.com/gildas-lormeau/single-file-cli/blob/master/options.js](https://github.com/gildas-lormeau/single-file-cli/blob/master/options.js)
Example: `LD\_SINGLEFILE\_OPTIONS=--user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:124.0) Gecko/20100101 Firefox/124.0"`
### `LD\_DISABLE\_REQUEST\_LOGS`
[Section titled “LD\_DISABLE\_REQUEST\_LOGS”](#ld_disable_request_logs)
Values: `true` or `false` | Default = `false`
Set uWSGI [disable-logging](https://uwsgi-docs.readthedocs.io/en/latest/Options.html#disable-logging) parameter to disable request logs, except for requests with a client (4xx) or server (5xx) error response.