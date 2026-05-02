Installation · Tautulli/Tautulli Wiki · GitHub
[Skip to content](#start-of-content)
{{ message }}
[
Tautulli
](/Tautulli)
/
**
[Tautulli](/Tautulli/Tautulli)
**
Public
*
* [ Notifications
](/login?return_to=/Tautulli/Tautulli) You must be signed in to change notification settings
* [ Fork
623
](/login?return_to=/Tautulli/Tautulli)
*
[
Star
6.5k
](/login?return_to=/Tautulli/Tautulli)
# Installation
[Jump to bottom](#wiki-pages-box)
Landon Abney edited this page Aug 13, 2025
&middot;
[102 revisions](/Tautulli/Tautulli/wiki/Installation/_history)
### Operating Systems:
[](#operating-systems)
* [Windows](#windows)
* [macOS](#macos)
* [Linux](#linux)
* [FreeBSD / TrueNAS](#freebsd--truenas)
* [Docker](#docker)
* [Synology](#synology)
* [Western Digital](#western-digital) (Third party)
* [QNAP](#qnap) (Third party)
* [ReadyNAS](#readynas) (Third party)
* [Thecus NAS](#thecus-nas) (Third party)
* [ArchLinux](#archlinux) (Third party)
## Windows
[](#windows)
Download and run the latest Windows `.exe` installer from the [GitHub Releases page](https://github.com/Tautulli/Tautulli/releases/latest).
* Note: The `.exe` installer requires Windows 8 or newer. For Windows 7 and older please use the alternate installation instructions below.
Tautulli is also available via the Windows Package Manager.
* Open Windows PowerShell (`powershell`) and run `winget install tautulli`.
* To update Tautulli run `winget upgrade tautulli`.
Alternate installation instructions
* Download the latest version of [Python](https://www.python.org/downloads/) and complete the installation with all the default options.
* Option 1 (easy):
* Download Tautulli from GitHub: [https://github.com/Tautulli/Tautulli/zipball/master](https://github.com/Tautulli/Tautulli/zipball/master)
* Extract the ZIP file.
* Double click `start.bat` to run Tautulli.
* Tautulli will be loaded in your browser or listening on [http://localhost:8181](http://localhost:8181).
* Option 2 (preferred):
>
**> NOTE
**> : This will install extra shell extensions and make adjustments to your path environment.
>
* Go to [https://gitforwindows.org/](https://gitforwindows.org/) and download `git`.
* Run the installer, select all the defaults except for the section called "Adjusting your PATH environment" - here select **"Git from the command line and also from 3rd-party software"**.
* Complete the rest of the installation with the default options.
* Right click on your desktop and select "Git Gui".
* Select "Clone Existing Repository".
* In the "Source Location" enter: `https://github.com/Tautulli/Tautulli.git`
* In the "Target Directory" enter a new folder where you want to install Tautulli to (e.g. `C:\\Tautulli`).
* Click "Clone".
* When it's finished a Git Gui windows will appear, just close this Window.
* Browse to where you cloned the Tautulli repository (e.g. `C:\\Tautulli`) in Windows Explorer.
* Double click `start.bat` to run Tautulli.
* Tautulli will be loaded in your browser or listening on [http://localhost:8181](http://localhost:8181).
## macOS
[](#macos)
Download and run the latest macOS `.pkg` installer from the [GitHub Releases page](https://github.com/Tautulli/Tautulli/releases/latest).
* Note: The `.pkg` installer requires macOS 11 (Big Sur) or newer. For macOS 10.15 (Catalina) and older please use the alternate installation instructions below.
Alternate installation instructions
Tautulli will be installed to `/Applications/Tautulli`
* Option 1 (easy):
* Download Tautulli from GitHub: [https://github.com/Tautulli/Tautulli/zipball/master](https://github.com/Tautulli/Tautulli/zipball/master)
* Extract the zip to `/Applications/Tautulli`. Make sure you extract the files directly in the root.
* Open a terminal
* Type: `cd /Applications/Tautulli`
* Option 2 (preferred):
* Open a terminal
* Install Git. This can be done via `xcode-select --install`
* Type: `cd /Applications/`
* Type: `git clone https://github.com/Tautulli/Tautulli.git`
* Type: `cd Tautulli`
* Type: `./start.sh` to run Tautulli.
* Tautulli will be loaded in your browser or listening on [http://localhost:8181](http://localhost:8181).
## Linux
[](#linux)
Tautulli can be installed on most Linux distribution using a Snap.
1. Select your Linux distribution at the bottom of the [Tautulli Snapcraft page](https://snapcraft.io/tautulli) to install `snapd`.
* If your Linux distribution is not listed, additional instructions can be found [here](https://snapcraft.io/docs/installing-snapd).
* Install Tautulli: `sudo snap install tautulli`
* Tautulli will be loaded in your browser or listening on [http://localhost:8181/](http://localhost:8181/)
Alternate installation instructions
Tautulli will be installed to `/opt/Tautulli`.
1. Open a terminal.
2. Install prerequisites:
* Ubuntu/Debian: `sudo apt-get install git python3 python3-setuptools`
* Fedora: `sudo yum install git python3 python3-setuptools`
* Change directory: `cd /opt`
* Clone Tautulli: `sudo git clone https://github.com/Tautulli/Tautulli.git`
* Add the Tautulli user:
* Ubuntu/Debian: `sudo addgroup tautulli && sudo adduser --system --no-create-home tautulli --ingroup tautulli`
* CentOS/Fedora: `sudo adduser --system --no-create-home tautulli`
* Change ownership: `sudo chown -R tautulli:tautulli /opt/Tautulli`
* Copy the service script: `sudo cp /opt/Tautulli/init-scripts/init.systemd /lib/systemd/system/tautulli.service`
* Enable the service: `sudo systemctl daemon-reload && sudo systemctl enable tautulli.service`
* Start Tautulli: `sudo systemctl start tautulli.service`
* Tautulli will be loaded in your browser or listening on [http://localhost:8181](http://localhost:8181)
#### Note:
[](#note)
* Refer to the instructions in the service file to run Tautulli using a different user or move your Tautulli data to a different location:
* [https://github.com/Tautulli/Tautulli/blob/master/init-scripts/init.systemd](https://github.com/Tautulli/Tautulli/blob/master/init-scripts/init.systemd)
## FreeBSD / TrueNAS
[](#freebsd--truenas)
Tautulli will be installed to `/usr/local/share/Tautulli`.
1. Create a new jail for Tautulli and open a terminal for the jail.
2. Install prerequisites: `pkg install python py311-setuptools py311-sqlite3 py311-openssl py311-cryptography security/ca\_root\_nss git-lite`
3. Change directory: `cd /usr/local/share`
4. Clone Tautulli: `git clone https://github.com/Tautulli/Tautulli.git`
5. Add the Tautulli user: `pw useradd -n tautulli -c "Tautulli" -s /sbin/nologin -w no`
6. Change ownership: `chown -R tautulli:tautulli Tautulli`
7. Copy the service script: `mkdir -p /usr/local/etc/rc.d && cp /usr/local/share/Tautulli/init-scripts/init.freenas /usr/local/etc/rc.d/tautulli`
8. Enable the service: `sysrc -f /etc/rc.conf tautulli\_user="tautulli" && sysrc -f /etc/rc.conf tautulli\_enable="YES"`
9. Start Tautulli: `service tautulli start`
10. Tautulli will be loaded in your browser or listening on [http://localhost:8181](http://localhost:8181)
#### Note:
[](#note-1)
* Refer to the instructions in the service file to run Tautulli using a different user or move your Tautulli data to a different location:
* [https://github.com/Tautulli/Tautulli/blob/master/init-scripts/init.freebsd](https://github.com/Tautulli/Tautulli/blob/master/init-scripts/init.freebsd)
## Docker
[](#docker)
### Using `docker run`
[](#using-docker-run)
Create and run the container (substitute your `\<values\>`) with the following command:
```
docker run -d \\
--name=tautulli \\
--restart=unless-stopped \\
-v \<path to data\>:/config \\
-e PUID=\<uid\> \\
-e PGID=\<gid\> \\
-e TZ=\<timezone\> \\
-p 8181:8181 \\
ghcr.io/tautulli/tautulli
```
Update the container by removing and recreating it with the following commands:
```
# Stop the Tautulli container
docker stop tautulli
# Remove the Tautulli container
docker rm tautulli
# Pull the latest Tautulli update
docker pull ghcr.io/tautulli/tautulli
# Run the Tautulli container with the same parameters originally used to create the container
docker run -d ...
```
### Using `docker-compose`
[](#using-docker-compose)
Create a `docker-compose.yml` file with the following contents (substitute your `\<values\>`):
```
version: '3'
services:
tautulli:
image: ghcr.io/tautulli/tautulli
container\_name: tautulli
restart: unless-stopped
volumes:
- \<path to data\>:/config
environment:
- PUID=\<uid\>
- PGID=\<gid\>
- TZ=\<timezone\>
ports:
- 8181:8181
```
Create and start the container with the following command from the same folder as your `docker-compose.yml` file:
```
docker-compose up -d
```
Update the container with the following commands from the same folder as your `docker-compose.yml` file::
```
# Pull the latest Tautulli update
docker-compose pull
# Update and restart the Tautulli container
docker-compose up -d
```
### Parameters
[](#parameters)
You *must* substitute the `\<values\>` with your own settings.
Parameters are split into two halves separated by a colon. The left side represents the host and the right side the container.
**Example**: `-p external:internal` - This shows the port mapping from internal to external of the container.
So `-p 8181:8181` would expose port `8181` from inside the container to be accessible from the host's IP on port `8181` (e.g. `http://\<host\_ip\>:8181`). The internal port *must be* `8181`, but the external port may be changed (e.g. `-p 8080:8181`).
|Parameter|Function|Required / Optional|
|`-p 8181:8181`|Port for web UI|Required|
|`-v \<path to data\>:/config`|Contains Tautulli config and database|Required|
|`-e PUID=\<uid\>`|User ID (see below)|Optional|
|`-e PGID=\<gid\>`|Group ID (see below)|Optional|
|`-e TZ=\<timezone\>`|Lookup `TZ` value [here](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) (e.g. America/Toronto)|Required|
### User / Group Identifiers:
[](#user--group-identifiers)
When using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. To avoid this issue you can specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify.
In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:
```
`$ id dockeruser
uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
`
```
## Synology
[](#synology)
You can easily install *Tautulli* on Synology devices using [Docker](#docker). Depending on your Synology device you may or may not have Docker pre-installed. If your device is 'unsupported' (i.e. Docker is not pre-installed or downloadable through the Synology *Package Center*), follow the guide [here](https://web.archive.org/web/20190730155552/https://tylermade.net/2017/09/28/how-to-install-docker-on-an-unsupported-synology-nas/) and newer versions of the Docker spk found [here](https://archive.synology.com/download/Package/Docker) to install it.
Once you have Docker on your Synology, add the [official image](https://hub.docker.com/r/tautulli/tautulli/) for Tautulli. This is done by opening the Docker program and searching the **Registry** tab for Tautulli. At the time of this write-up, the interface looked like [this](https://imgur.com/EqxJT91). The official image is named `tautulli/tautulli` and it may not be the first option listed. Double-click the image entry to download it. Once downloaded you will see the image show up under your **Image** tab. Before installing the image you will need some additional user information.
Depending on your preference, you can create a unique user on your system for Tautulli, or you can use the default admin user created during your first start-up. You will need the UID and GID of whatever user you have chosen. The steps to obtain these are as follows:
1. SSH into your system using [PuTTy](https://www.putty.org/) (if on Windows) or through Terminal (if on Linux or Mac). Be sure to use the appropriate username when logging in.
* If you're having trouble with this, make sure that [SSH is enabled](http://richardsumilang.com/server/synology/diskstation/enable-ssh-access-to-synology-diskstation/) in your *Terminal and SNMP* settings in your Synology *Control Panel*.
* Type `id`
* This will return a line with the `uid` of that user and their primary group `gid`.
```
`[user@nas \~]$ id
uid=1001(user) gid=1001(user) groups=1001(user)
`
```
Next, you will want to make sure that you have the prerequisite folders for Tautulli to save config files to. Here's an example general/simplified setup:
```
`/root
└──/docker
└──/tautulli
└──/config
`
```
Obviously, the important folder here is `/root/docker/tautulli/config`. You should ensure that the permissions on this folder allows the user you picked earlier, and will set later, has *full* rights to the folder. You can fix the permissions by right-clicking on your folders and going to `Properties` and then the `Permission` tab. Assign the appropriate user/group Full Control and if necessary Enable the option *Apply to this folder, sub-folders and files*.
You may need to restart your DiskStation for the change to take effect.
Next, back in the Docker window, double click your `tautulli/tautulli:latest` image to open the *Create Container* window. On the first menu, name your container whatever you want as long as it is identifiable to you. Next, click *Advanced Settings* to open a new window. Next, follow the instructions for the following tabs:
* **Advanced Settings**:
* Enable *Enable auto-restart*
* If you wish, create a shortcut on the desktop
* **Volume**:
* Click *Add Folder* and add the following paths and corresponding Mount Paths.
|File/Folder|Mount Path|
|`docker/tautulli/config`|`/config`|
* **Port Settings**:
* Change the *Local Port* to `8181` to match the *Container Port*. For some reason the default vale of `Auto` almost never works.
* You may choose a different *Local Port* if port `8181` is already in use, but you cannot change the *Container Port*.
|Local Port|Container Port|Type|
|`8181`|`8181`|`TCP`|
* **Environment**:
* Add the following *variables* and their respective *value*
|variable|value|
|`PUID`|`uid` from your ssh session, eg. `1001`|
|`PGID`|`gid` from your ssh session, eg. `1001`|
|`TZ`|Lookup `TZ` value [here](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) (eg. `America/Los\_Angeles`)|
Finalize the container by applying the *advanced settings* and then following the remaining prompts.
If your container doesn't immediately run, launch it from the Docker window and give it a few dozen seconds to start completely. Your *Tautulli* installation should now be accessible via port `8181` (or your other *Local Port*) on your DiskStation's local IP address. You can find this under Control Panel -\> Network -\> Network Interface under `LAN1` or `LAN2`. For example if it shows `192.168.0.5`, then Tautulli can be found at `http://192.168.0.5:8181/`.
### How to update the container
[](#how-to-update-the-container)
* See [here](https://mariushosting.com/synology-how-to-update-docker-image/) for instructions on updating a Docker container on Synology.
### The packages below are created and maintained by a third party. For support, please contact the creator.
[](#the-packages-below-are-created-and-maintained-by-a-third-party-for-support-please-contact-the-creator)
## Western Digital
[](#western-digital)
You can install Tautulli on Western Digital devices using the [WD package by Tfl](https://community.wd.com/t/package-tautulli-plexpy-adds-monitoring-analytics-and-notifications-for-your-plex-server/217773).
## QNAP
[](#qnap)
You can install Tautulli on QNAP devices using the `.qpkg` by QNAP\_Stephane:
* [QNAP Club](https://qnapclub.eu/en/qpkg/557)
* [QNAP forum thread](https://forum.qnap.com/viewtopic.php?f=320&amp;t=139879)
## ReadyNAS
[](#readynas)
You can install Tautulli on ReadyNAS devices using the [ReadyNAS app by Mhynlo](http://apps.readynas.com/pages/?page_id=9).
## Thecus NAS
[](#thecus-nas)
You can install Tautulli on Thecus devices using the [Thecus app by outkastm](https://forum.thecus.com/showthread.php?tid=12768&amp;pid=70628#pid70628).
## ArchLinux
[](#archlinux)
You can install Tautulli on ArchLinux using the [AUR package by fryfrog/Sonic-Y3k](https://aur.archlinux.org/packages/tautulli/).
* [Home](/Tautulli/Tautulli/wiki/Home)
* [Installation](/Tautulli/Tautulli/wiki/Installation)
* [Upgrading to Python 3 (Tautulli v2.5)](/Tautulli/Tautulli/wiki/Upgrading-to-Python-3-(Tautulli-v2.5))
* [Asking for Support](/Tautulli/Tautulli/wiki/Asking-for-Support)
* [Frequently Asked Questions](/Tautulli/Tautulli/wiki/Frequently-Asked-Questions)
* [Notification Agents Guide](/Tautulli/Tautulli/wiki/Notification-Agents-Guide)
* [Custom Notification Conditions](/Tautulli/Tautulli/wiki/Custom-Notification-Conditions)
* [Exporter Guide](/Tautulli/Tautulli/wiki/Exporter-Guide)
* [3rd Party APIs Guide](/Tautulli/Tautulli/wiki/3rd-Party-APIs-Guide)
* [Debugging](/Tautulli/Tautulli/wiki/Debugging)
* [Custom Scripts](/Tautulli/Tautulli/wiki/Custom-Scripts)
* [Tautulli API Reference](/Tautulli/Tautulli/wiki/Tautulli-API-Reference)
### Clone this wiki locally