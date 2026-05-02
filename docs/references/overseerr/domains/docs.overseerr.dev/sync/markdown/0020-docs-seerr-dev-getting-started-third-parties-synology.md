Synology (Advanced) | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
warning
Third-party installation methods are maintained by the community. The Seerr team is not responsible for these packages.
warning
This method is not recommended for most users. It is intended for advanced users who are using Synology NAS.
## Prerequisites[​](#prerequisites)
* Synology NAS running **DSM 7.2** or later
* 64-bit architecture (x86\_64 or ARMv8)
* [SynoCommunity package source](https://synocommunity.com/) added to Package Center
## Adding the SynoCommunity Package Source[​](#adding-the-synocommunity-package-source)
If you haven't already added SynoCommunity to your Package Center:
1. Open **Package Center** in DSM
2. Click **Settings** in the top-right corner
3. Go to the **Package Sources** tab
4. Click **Add**
5. Enter the following:
* **Name**: `SynoCommunity`
* **Location**: `https://packages.synocommunity.com`
* Click **OK**
## Installation[​](#installation)
1. In **Package Center**, search for **Seerr**
2. Click **Install**
3. Follow the installation wizard prompts
4. Package Center will automatically install any required dependencies (Node.js v22)
### Access Seerr[​](#access-seerr)
Once installed, access Seerr at:
```
`http://\<your-synology-ip\>:5055
`
```
You can also click the **Open** button in Package Center or find Seerr in the DSM main menu.
## Configuration[​](#configuration)
Seerr's configuration files are stored at:
```
`/var/packages/seerr/var/config
`
```
info
The Seerr package runs as a dedicated service user managed by DSM. No manual permission configuration is required.
## Managing the Service[​](#managing-the-service)
You can start, stop, and restart Seerr from **Package Center** → Find Seerr → Use the action buttons.
## Updating[​](#updating)
When a new version is available:
1. Open **Package Center**
2. Go to **Installed** packages
3. Find **Seerr** and click **Update** if available
tip
Enable automatic updates in Package Center settings to keep Seerr up to date.
## Troubleshooting[​](#troubleshooting)
### Viewing Logs[​](#viewing-logs)
Seerr logs are located at `/var/packages/seerr/var/config/logs` and can be accessed using:
* **File Browser** package (recommended for most users)
* SSH (advanced users)
### Port Conflicts[​](#port-conflicts)
Seerr uses port 5055. If this port is already in use:
* **Docker containers**: Remap the conflicting container to a different port
* **Other packages**: The conflicting package will need to be uninstalled as Seerr's port cannot be changed
SynoCommunity ensures there are no port conflicts with other SynoCommunity packages or official Synology packages.
### Package Won't Start[​](#package-wont-start)
Ensure Node.js v22 is installed and running by checking its status in **Package Center**.
## Uninstallation[​](#uninstallation)
1. Open **Package Center**
2. Find **Seerr** in your installed packages
3. Click **Uninstall**
caution
Uninstalling will remove the application but preserve your configuration data by default. Select "Remove data" during uninstallation if you want a complete removal.
* [Prerequisites](#prerequisites)
* [Adding the SynoCommunity Package Source](#adding-the-synocommunity-package-source)
* [Installation](#installation)
* [Access Seerr](#access-seerr)
* [Configuration](#configuration)
* [Managing the Service](#managing-the-service)
* [Updating](#updating)
* [Troubleshooting](#troubleshooting)
* [Viewing Logs](#viewing-logs)
* [Port Conflicts](#port-conflicts)
* [Package Won't Start](#package-wont-start)
* [Uninstallation](#uninstallation)