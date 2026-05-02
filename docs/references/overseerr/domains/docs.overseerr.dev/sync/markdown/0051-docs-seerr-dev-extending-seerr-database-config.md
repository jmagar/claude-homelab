Configuring the Database (Advanced) | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
Seerr supports SQLite and PostgreSQL. The database connection can be configured using the following environment variables:
## SQLite Options[​](#sqlite-options)
If you want to use SQLite, you can simply set the `DB\_TYPE` environment variable to `sqlite`. This is the default configuration so even if you don't set any other options, SQLite will be used.
```
`DB\_TYPE=sqlite # Which DB engine to use, either sqlite or postgres. The default is sqlite.
CONFIG\_DIRECTORY="config" # (optional) The path to the config directory where the db file is stored. The default is "config".
DB\_LOG\_QUERIES="false" # (optional) Whether to log the DB queries for debugging. The default is "false".
`
```
## PostgreSQL Options[​](#postgresql-options)
caution
When migrating Postgres from version 17 to 18 in Docker, note that the data mount point has changed. Instead of using `/var/lib/postgresql/data`, the correct mount path is now `/var/lib/postgresql`.
Refer to the [PostgreSQL Docker documentation](https://hub.docker.com/_/postgres/#pgdata) to learn how to migrate or opt out of this change.
### TCP Connection[​](#tcp-connection)
If your PostgreSQL server is configured to accept TCP connections, you can specify the host and port using the `DB\_HOST` and `DB\_PORT` environment variables. This is useful for remote connections where the server uses a network host and port.
```
`DB\_TYPE=postgres # Which DB engine to use, either sqlite or postgres. The default is sqlite.
DB\_HOST=localhost # (optional) The host (URL) of the database. The default is "localhost".
DB\_PORT="5432" # (optional) The port to connect to. The default is "5432".
DB\_USER= # (required) Username used to connect to the database.
DB\_PASS= # (required) Password of the user used to connect to the database.
DB\_NAME="seerr" # (optional) The name of the database to connect to. The default is "seerr".
DB\_LOG\_QUERIES="false" # (optional) Whether to log the DB queries for debugging. The default is "false".
`
```
### Unix Socket Connection[​](#unix-socket-connection)
If your PostgreSQL server is configured to accept Unix socket connections, you can specify the path to the socket directory using the `DB\_SOCKET\_PATH` environment variable. This is useful for local connections where the server uses a Unix socket.
```
`DB\_TYPE=postgres # Which DB engine to use, either sqlite or postgres. The default is sqlite.
DB\_SOCKET\_PATH="/var/run/postgresql" # (required) The path to the PostgreSQL Unix socket directory.
DB\_USER= # (required) Username used to connect to the database.
DB\_PASS= # (optional) Password of the user used to connect to the database, depending on the server's authentication configuration.
DB\_NAME="seerr" # (optional) The name of the database to connect to. The default is "seerr".
DB\_LOG\_QUERIES="false" # (optional) Whether to log the DB queries for debugging. The default is "false".
`
```
info
**Finding Your PostgreSQL Socket Path**
The PostgreSQL socket path varies by operating system and installation method:
* **Ubuntu/Debian**: `/var/run/postgresql`
* **CentOS/RHEL/Fedora**: `/var/run/postgresql`
* **macOS (Homebrew)**: `/tmp` or `/opt/homebrew/var/postgresql`
* **macOS (Postgres.app)**: `/tmp`
* **Windows**: Not applicable (uses TCP connections)
You can find your socket path by running:
```
`# Find PostgreSQL socket directory
find /tmp /var/run /run -name ".s.PGSQL.\*" 2\>/dev/null | head -1 | xargs dirname
# Or check PostgreSQL configuration
sudo -u postgres psql -c "SHOW unix\_socket\_directories;"
`
```
### SSL configuration[​](#ssl-configuration)
The following options can be used to further configure ssl. Certificates can be provided as a string or a file path, with the string version taking precedence.
```
`DB\_USE\_SSL="false" # (optional) Whether to enable ssl for database connection. This must be "true" to use the other ssl options. The default is "false".
DB\_SSL\_REJECT\_UNAUTHORIZED="true" # (optional) Whether to reject ssl connections with unverifiable certificates i.e. self-signed certificates without providing the below settings. The default is "true".
DB\_SSL\_CA= # (optional) The CA certificate to verify the connection, provided as a string. The default is "".
DB\_SSL\_CA\_FILE= # (optional) The path to a CA certificate to verify the connection. The default is "".
DB\_SSL\_KEY= # (optional) The private key for the connection in PEM format, provided as a string. The default is "".
DB\_SSL\_KEY\_FILE= # (optional) Path to the private key for the connection in PEM format. The default is "".
DB\_SSL\_CERT= # (optional) Certificate chain in pem format for the private key, provided as a string. The default is "".
DB\_SSL\_CERT\_FILE= # (optional) Path to certificate chain in pem format for the private key. The default is "".
`
```
### Migrating from SQLite to PostgreSQL[​](#migrating-from-sqlite-to-postgresql)
1. Set up your PostgreSQL database and configure Seerr to use it
2. Run Seerr to create the tables in the PostgreSQL database
3. Stop Seerr
4. Run the following command to export the data from the SQLite database and import it into the PostgreSQL database:
info
Edit the postgres connection string (without the {{ and }} brackets) to match your setup.
If you don't have or don't want to use docker, you can build the working pgloader version [in this PR](https://github.com/dimitri/pgloader/pull/1531) from source and use the same options as below.
caution
The most recent release of pgloader has an issue quoting the table columns. Use the version in the docker container to avoid this issue.
* Using pgloader Container (Recommended)
* Building pgloader from Source
**Recommended method**: Use the pgloader container even for standalone Seerr installations. This avoids building from source and ensures compatibility.
```
`# For standalone installations (no Docker network needed)
docker run --rm \\
-v /path/to/your/config/db.sqlite3:/db.sqlite3:ro \\
ghcr.io/ralgar/pgloader:pr-1531 \\
pgloader --with "quote identifiers" --with "data only" \\
/db.sqlite3 postgresql://{{DB\_USER}}:{{DB\_PASS}}@{{DB\_HOST}}:{{DB\_PORT}}/{{DB\_NAME}}
`
```
**For Docker Compose setups**: Add the network parameter if your PostgreSQL is also in a container:
```
`docker run --rm \\
--network your-seerr-network \\
-v /path/to/your/config/db.sqlite3:/db.sqlite3:ro \\
ghcr.io/ralgar/pgloader:pr-1531 \\
pgloader --with "quote identifiers" --with "data only" \\
/db.sqlite3 postgresql://{{DB\_USER}}:{{DB\_PASS}}@{{DB\_HOST}}:{{DB\_PORT}}/{{DB\_NAME}}
`
```
1. Start Seerr
* [SQLite Options](#sqlite-options)
* [PostgreSQL Options](#postgresql-options)
* [TCP Connection](#tcp-connection)
* [Unix Socket Connection](#unix-socket-connection)
* [SSL configuration](#ssl-configuration)
* [Migrating from SQLite to PostgreSQL](#migrating-from-sqlite-to-postgresql)