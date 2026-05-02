Unraid (Advanced) | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
warning
Third-party installation methods are maintained by the community. The Seerr team is not responsible for these packages.
warning
This method is not recommended for most users. It is intended for advanced users who are using Unraid.
## Template installation[​](#template-installation)
Several templates from Unraid Community are available right now
* [Unraid Community Apps](https://unraid.net/community/apps#community-apps-iframe)
In case you still want to do it manually, please follow the instructions below.
## Manual Installation[​](#manual-installation)
Before proceeding, choose which installation method best suits your server:
**Seerr Default** (`UID 1000:1000`) — Runs with the container's native `node` user. Matches the official image, but may break SMB share access, trigger "Fix Common Problems" warnings, and cause issues with backup plugins (such as CA Appdata Backup) and network integrations (such as Tailscale).
**Unraid Default** (`UID 99:100`) — Runs with Unraid's native `nobody:users` ownership. Follows Unraid best practices, but overrides Seerr's built-in rootless user and may cause compatibility issues with future Seerr updates.
* Seerr Default
* Unraid Default
### 1. Create the config directory[​](#1-create-the-config-directory)
Open the Unraid terminal and run:
```
`mkdir -p /mnt/user/appdata/seerr
`
```
### 2. Set folder permissions[​](#2-set-folder-permissions)
```
`chown -R 1000:1000 /mnt/user/appdata/seerr
`
```
### 3. Add the Docker container[​](#3-add-the-docker-container)
warning
The **Extra Parameters** field is critical. You **must** add `--init --restart=unless-stopped` (see table below). Without `--init`, the container will not handle signals properly or shut down cleanly. Without `--restart=unless-stopped`, the container will not automatically restart after a reboot.
To see the **Extra Parameters** field, click **Basic View** in the top-right corner of the template page to switch to the advanced editor.
Navigate to the **Docker** tab in Unraid and click **Add Container**. Fill in the following:
|Field|Value|
|**Name**|`seerr`|
|**Repository**|`ghcr.io/seerr-team/seerr:latest`|
|**Icon URL**|`https://raw.githubusercontent.com/seerr-team/seerr/develop/public/android-chrome-512x512.png`|
|**WebUI**|`http://[IP]:[PORT:5055]`|
|**Extra Parameters**|`--init --restart=unless-stopped`|
|**Network Type**|`bridge`|
|**Privileged**|`Off`|
Then click **Add another Path, Port, Variable** to add:
**Port:**
|Field|Value|
|Container Port|`5055`|
|Host Port|`5055`|
|Connection Type|`TCP`|
**Path:**
|Field|Value|
|Container Path|`/app/config`|
|Host Path|`/mnt/user/appdata/seerr`|
**Variable:**
|Field|Value|
|Key|`TZ`|
|Value|Your [TZ database name](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) (e.g., `America/New\_York`)|
**Variable (optional):**
|Field|Value|
|Key|`LOG\_LEVEL`|
|Value|`info`|
Click **Apply** to create and start the container.
### 4. Access Seerr[​](#4-access-seerr)
Open the WebUI at `http://\<your-unraid-ip\>:5055` and follow the setup wizard.
* [Template installation](#template-installation)
* [Manual Installation](#manual-installation)
* [1. Create the config directory](#1-create-the-config-directory)
* [2. Set folder permissions](#2-set-folder-permissions)
* [3. Add the Docker container](#3-add-the-docker-container)
* [4. Access Seerr](#4-access-seerr)
* [1. Create the config directory](#1-create-the-config-directory-1)
* [2. Set folder permissions](#2-set-folder-permissions-1)
* [3. Add the Docker container](#3-add-the-docker-container-1)
* [4. Access Seerr](#4-access-seerr-1)