Backups | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
## Settings[​](#settings)
All configurations from the **Settings** panel in the Seerr web UI are saved, including integrations with Radarr, Sonarr, Jellyfin, Plex, and notification settings.
These settings are stored in the `settings.json` file located in the Seerr data folder.
## User Data[​](#user-data)
Apart from the settings, all other data—including user accounts, media requests, blocklist etc. are stored in the database (either SQLite or PostgreSQL).
# Backup
### SQLite[​](#sqlite)
If your backup system uses filesystem snapshots (such as Kubernetes with Volsync), you can directly back up the Seerr data folder.
Otherwise, you need to stop the Seerr application and back up the `config` folder.
For advanced users, it's possible to back up the database without stopping the application by using the [SQLite CLI](https://www.sqlite.org/download.html). Run the following command to create a backup:
```
`sqlite3 db/db.sqlite3 ".backup '/tmp/seerr\_db.sqlite3.bak'"
`
```
Then, copy the `/tmp/seerr\_dump.sqlite3.bak` file to your desired backup location.
### PostgreSQL[​](#postgresql)
You can back up the `config` folder and dump the PostgreSQL database without stopping the Seerr application.
Install [postgresql-client](https://www.postgresql.org/download/) and run the following command to create a backup (just replace the placeholders):
info
Depending on how your PostgreSQL instance is configured, you may need to add these options to the command below.
-h, --host=HOSTNAME database server host or socket directory
-p, --port=PORT database server port number
```
`pg\_dump -U \<database\_user\> -d \<database\_name\> -f /tmp/seerr\_db.sql
`
```
# Restore
### SQLite[​](#sqlite-1)
After restoring your `db/db.sqlite3` file and, optionally, the `settings.json` file, the `config` folder structure should look like this:
```
`.
├── cache \<-- Optional
├── db
│ └── db.sqlite3
├── logs \<-- Optional
└── settings.json \<-- Optional (required if you want to avoid reconfiguring Seerr)
`
```
Once the files are restored, start the Seerr application.
### PostgreSQL[​](#postgresql-1)
Install the [PostgreSQL client](https://www.postgresql.org/download/) and restore the PostgreSQL database using the following command (replace the placeholders accordingly):
info
Depending on how your PostgreSQL instance is configured, you may need to add these options to the command below.
-h, --host=HOSTNAME database server host or socket directory
-p, --port=PORT database server port number
```
`pg\_restore -U \<database\_user\> -d \<database\_name\> /tmp/seerr\_db.sql
`
```
Optionally, restore the `settings.json` file. The `config` folder structure should look like this:
```
`.
├── cache \<-- Optional
├── logs \<-- Optional
└── settings.json \<-- Optional (required if you want to avoid reconfiguring Seerr)
`
```
Once the database and files are restored, start the Seerr application.
* [Settings](#settings)
* [User Data](#user-data)
* [SQLite](#sqlite)
* [PostgreSQL](#postgresql)
* [SQLite](#sqlite-1)
* [PostgreSQL](#postgresql-1)