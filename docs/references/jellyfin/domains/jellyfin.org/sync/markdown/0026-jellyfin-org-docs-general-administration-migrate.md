Migrating | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
This page covers migrations of Jellyfin as well as migrations to Jellyfin.
Jellyfins internal databases cannot be copied or adjusted easily. Depending on your case there may be ways to work around this, for example by just migrating parts of the data, or because it's possible maintain the same file paths.
## Watched Status Migration[​](#watched-status-migration)
There are third-party scripts available that will use the API to copy watched status and users from one instance to another.
This can be done from Plex, Emby or another Jellyfin instance.
[Emby/Jellyfin to Jellyfin migration](https://github.com/CobayeGunther/Emby2Jelly)
[Plex to Jellyfin migration](https://github.com/wilmardo/migrate-plex-to-jellyfin)
## Migrating Linux install to Docker[​](#migrating-linux-install-to-docker)
It's possible to use the data of a local install in the official docker image by mapping files and folders to the same locations and configuring the image accordingly. It's possible to do this via the command line or by using Docker environment variables. To read more, see the [Configuration](/docs/general/administration/configuration) page.
note
You need to have exactly matching paths for your files inside the docker container!
This means that if your media is stored at `/media/raid/` this path needs to be accessible at `/media/raid/` inside the docker container too - the configurations below do include examples.
To guarantee proper permissions, get the `uid` and `gid` of the local user Jellyfin runs as (on a default install this is the `jellyfin` system user).
You can do this by running the following command:
```
`
id jellyfin
`
```
You need to replace the `\<uid\>:\<gid\>` placeholder below with the correct values.
note
To properly map the folders for your install, go to `Dashboard \> Paths`.
### Using docker cli[​](#using-docker-cli)
```
`
docker run -d \\
--user \<uid\>:\<gid\> \\
-e JELLYFIN\_CACHE\_DIR=/var/cache/jellyfin \\
-e JELLYFIN\_CONFIG\_DIR=/etc/jellyfin \\
-e JELLYFIN\_DATA\_DIR=/var/lib/jellyfin \\
-e JELLYFIN\_LOG\_DIR=/var/log/jellyfin \\
--mount type=bind,source=/etc/jellyfin,target=/etc/jellyfin \\
--mount type=bind,source=/var/cache/jellyfin,target=/var/cache/jellyfin \\
--mount type=bind,source=/var/lib/jellyfin,target=/var/lib/jellyfin \\
--mount type=bind,source=/var/log/jellyfin,target=/var/log/jellyfin \\
--mount type=bind,source=\</path/to/media\>,target=\</path/to/media\> \\
--net=host \\
--restart=unless-stopped \\
jellyfin/jellyfin
`
```
### Using docker-compose yaml[​](#using-docker-compose-yaml)
```
`
services:
jellyfin:
image: jellyfin/jellyfin
user: \<uid\>:\<gid\>
network\_mode: 'host'
restart: 'unless-stopped'
environment:
- JELLYFIN\_CACHE\_DIR=/var/cache/jellyfin
- JELLYFIN\_CONFIG\_DIR=/etc/jellyfin
- JELLYFIN\_DATA\_DIR=/var/lib/jellyfin
- JELLYFIN\_LOG\_DIR=/var/log/jellyfin
volumes:
- /etc/jellyfin:/etc/jellyfin
- /var/cache/jellyfin:/var/cache/jellyfin
- /var/lib/jellyfin:/var/lib/jellyfin
- /var/log/jellyfin:/var/log/jellyfin
- \<path-to-media\>:\<path-to-media\>
`
```
## Migrating From Emby 3.5.2 to Jellyfin[​](#migrating-from-emby-352-to-jellyfin)
info
Direct database migration from Emby (of any version) to Jellyfin is NOT SUPPORTED.
We have found many subtle bugs due to the inconsistent database schemas that result from trying to do this, and strongly recommend that all Jellyfin users migrating from Emby start with a fresh database and library scan.
The original procedure is provided below for reference however we cannot support it nor guarantee that a system upgraded in this way will work properly, if at all.
If anyone is interested in writing a database migration script which will correct the deficiencies in the existing database and properly import them into Jellyfin, [we would welcome it however](/docs/general/contributing)!
caution
While it is technically possible to migrate existing configuration of Emby version 3.5.2 or earlier, due to subtle and weird bugs reported after such attempts we do not recommend this migration.
Emby versions 3.5.3 or 3.6+ cannot be migrated.
Thus, we recommend creating a new Jellyfin configuration and rebuilding your library instead.
Windows users may take advantage of the `install-jellyfin.ps1` script in the [Jellyfin repository](https://github.com/jellyfin/jellyfin) which includes an automatic upgrade option.
This procedure is written for Debian-based Linux distributions, but can be translated to other platforms by following the same general principles.
1. Upgrade to Emby version 3.5.2, so that the database schema is fully up-to-date and consistent.
While this is not required, it can help reduce the possibility of obscure bugs in the database.
2. Stop the `emby-server` daemon:
```
`
sudo service emby-server stop
`
```
3. Move your existing Emby data directory out of the way:
```
`
sudo mv /var/lib/emby /var/lib/emby.backup
`
```
4. Remove or purge the `emby-server` package:
```
`
sudo apt purge emby-server
`
```
5. Install the `jellyfin` package using the [installation instructions](/docs/general/installation).
6. Stop the `jellyfin` daemon:
```
`
sudo service jellyfin stop
`
```
7. Copy over all the data files from the Emby backup data directory:
```
`
sudo cp -a /var/lib/emby.backup/\* /var/lib/jellyfin/
`
```
8. Correct ownership on the new data directory:
```
`
sudo chown -R jellyfin:jellyfin /var/lib/jellyfin
`
```
9. Mark Startup Wizard as completed - if not marked as completed then it can be a security risk especially if remote access is enabled:
```
`
sudo sed -i '/IsStartupWizardCompleted/s/false/true/' /etc/jellyfin/system.xml
`
```
10. Start the `jellyfin` daemon:
```
`
sudo service jellyfin start
`
```
* [Watched Status Migration](#watched-status-migration)
* [Migrating Linux install to Docker](#migrating-linux-install-to-docker)
* [Using docker cli](#using-docker-cli)
* [Using docker-compose yaml](#using-docker-compose-yaml)
* [Migrating From Emby 3.5.2 to Jellyfin](#migrating-from-emby-352-to-jellyfin)