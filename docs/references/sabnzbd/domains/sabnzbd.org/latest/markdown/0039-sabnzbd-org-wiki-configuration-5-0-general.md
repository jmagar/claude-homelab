SABnzbd -
Wiki -
General
#
Wiki menu
Wiki
[User Manual](/wiki/)
[FAQ](/wiki/faq)
[Contact](/wiki/contact)
[
Introduction
](#wiki-menu-start)
* [Quick Setup](/wiki/introduction/quick-setup)
* [Using SABnzbd](/wiki/introduction/usage)
* [NZB Sources](/wiki/introduction/nzb-sources)
* [How To's](/wiki/introduction/howto)
* [Known issues](/wiki/introduction/known-issues)
[
Installation
](#wiki-menu-installation)
* [Windows](/wiki/installation/install-windows)
* [macOS](/wiki/installation/install-macos)
* [Unix](/wiki/installation/install-unix)
* [NAS](/wiki/installation/install-nas)
* [From source](/wiki/installation/install-off-modules)
[
Configuration
](#wiki-menu-configure)
* [Configure](/wiki/configuration/5.0/configure)
* [General](/wiki/configuration/5.0/general)
* [Folders](/wiki/configuration/5.0/folders)
* [Servers](/wiki/configuration/5.0/servers)
* [Categories](/wiki/configuration/5.0/categories)
* [Switches](/wiki/configuration/5.0/switches)
* [Sorting](/wiki/configuration/5.0/sorting)
* [Notifications](/wiki/configuration/5.0/notifications)
* [Scheduling](/wiki/configuration/5.0/scheduling)
* [RSS](/wiki/configuration/5.0/rss)
* [Special Settings](/wiki/configuration/5.0/special)
* [API Reference](/wiki/configuration/5.0/api)
[
Scripts
](#wiki-menu-scripts)
* [Pre-queue scripts](/wiki/configuration/5.0/scripts/pre-queue-scripts)
* [Post-processing scripts](/wiki/configuration/5.0/scripts/post-processing-scripts)
* [Notification scripts](/wiki/configuration/5.0/scripts/notification-scripts)
[
Advanced Topics
](#wiki-menu-advanced)
* [High-Speed Tweaks](/wiki/advanced/highspeed-downloading)
* [HTTPS for the Web UI](/wiki/advanced/https)
* [Command line options](/wiki/advanced/command-line-parameters)
* [Folder setup](/wiki/advanced/directory-setup)
* [Unix permissions](/wiki/advanced/unix-permissions)
* [RAR with password](/wiki/advanced/password-protected-rars)
* [IPv6](/wiki/advanced/ipv6)
* [SSL/TLS security](/wiki/advanced/certificate-errors)
* [SSL Ciphers](/wiki/advanced/ssl-ciphers)
* [Windows Service](/wiki/advanced/sabnzbd-as-a-windows-service)
* [Android](/wiki/advanced/android)
[Extensions for SABnzbd](/wiki/extensions-for-sabnzbd)
[Special Newshosting offer for SABnzbd users: 70% Off + 3 FREE MONTHS!](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=wt)
##
[
Incorrect or missing information?
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+General&amp;body=##+URL:+/wiki/configuration/5.0/general.html
Improvement:
>)
General
## Web server
|**SABnzbd Host**|
The hostname that will be used to access SABnzbd.
* `127.0.0.1` or `[::1]` or `localhost`*(default)* = Access from this computer only
* empty = Finds and listens on your local (IPv4) IP address. Used for accessing from other computers. localhost will not work anymore so update your bookmarks.
* `0.0.0.0` = Listens on multiple interfaces (both local IP and localhost).
* `::` = Listen on both IPv4 and IPv6 addresses for local and network access.
For more information and option to overwrite this setting at startup see [Command Line Parameters](/wiki/advanced/command-line-parameters)|
|**SABnzbd Port**|
The internal webserver needs a port to listen on. The default port is `8080`. Try another one if this address is already occupied by another program on your computer.
NOTE macOS and Linux users: ports below `1025` may require SABnzbd launched as root.
|
|**Web Interface Theme**
|The look and feel of the web interface. SABnzbd must be restarted for the changes to take effect.|
|**Language**|The program supports more languages.
NOTE Help us translate SABnzbd in your language: [add untranslated texts or improved existing translations](/wiki/translate).|
|**Enable HTTPS**|
Enable the webserver to use HTTPS.
For more information, see: [HTTPS](/wiki/advanced/https).
NOTE Modern web browsers and other clients will not accept self-signed certificates and will give a warning and/or won't connect at all.
|
|**HTTPS Port**
Advanced|Port to be used for listening. Must be different from the normal HTTP port. If empty, the SABnzbd Port set above will only listen to HTTPS (this is the default setting).|
|**HTTPS Certificate**
**HTTPS Key**
**HTTPS Chain Certificates**
Advanced|Files containing the HTTPS certificate, key and (optionally) chain Certificates.|
## Security
|**SABnzbd Username**
**SABnzbd Password**|You may want to limit access to the web interface to people knowing a username and password for the interface.|
|**External internet access**|
Set the access level for connections from outside the local network.
By default, all IP addresses in a [private](https://en.wikipedia.org/wiki/Private_network) network range, such as `192.168.0.0/16`, `172.16.0.0/12`, `10.0.0.0/8` and `fd00::/8` are considered local. To define custom local network ranges, use the [Special](/wiki/configuration/5.0/special)`local\_ranges` setting.
* **API:**
* `No access` = No outside access is allowed at all.
* `Add NZB files` = Only NZB's can be added via the API, nothing else.
* `API (no config)` = API is fully available (queue/history/add+remove NZB's/etc), except for methods that get or edit the configuration.
* `Full API` = All API methods are available, including editing the configuration.
* **Full API & Web Interface:**
* `Full Web Interface` = The full API methods and the web interface are available. Users are always shown the login screen if username/password are set.
* `Full Web interface - Only external access requires login` = Only users outside the local network ranges are shown the login screen if username and password are set.|
|**API Key**|This is the *secret key* that is needed in [API calls](/wiki/configuration/5.0/api).
NOTE When you click the Change button, you'll need to tell your utilities the new key.|
|**NZB Key**|
This is similar to the API Key, but only allows external applications to add NZB's.
NOTE After adding NZB's, external applications do not have access to the queue to monitor the progress of the download.
NOTE When you click the Change button, you'll need to tell your utilities the new key.
|
## Switches
|**Launch browser on startup**|Enable to auto-launch of the browser when SABnzbd is started.|
|**Check for new release**|If enabled, SABnzbd will check once a week whether a new release has been published.|
|**HTTPS certificate verification**
Advanced|Verify certificates when connecting to indexers and RSS-sources using HTTPS. Some websites do not have proper certificates and some systems might not be configured correctly.|
|**SOCKS5 Proxy**
Advanced|Connection information is entered as a URL, ie:
* `socks5://username:password@hostname:port` or
* `socks5://hostname:port` (no login)NOTE The connection between the client and the server will use SSL if enabled. However, the connection between the proxy and the client will not.
This means that the data transferred between the client and the server are hidden for anyone including the proxy, but the username and password for the proxy and the server address are unencrypted.|
## Tuning
|**Maximum line speed**|
Set how fast your internet connection is, in bytes/sec.
NOTE If you have an ISP-speed of 10Mbit/sec, you should enter `1MB/s` here.
NOTE If you set a value of `150MB/s` or higher, some [performance settings](/wiki/configuration/5.0/special#toc1) are increased automatically.
|
|**Percentage of line speed**
Advanced|Which percentage of the line speed should SABnzbd use, e.g. 50. This value is used as the default value when SABnzbd starts.
Setting a value of `0` disables any limit.|
|**Article Cache Limit**
Advanced|
How much memory (RAM) can be used for caching (reducing disk access). This value is set automatically when SABnzbd is started for the first time to 25% of the system's memory or `2G` if you have more than 8GB of memory.
You enter the amount in bytes but you can use factors like K, M, G etc. eg: 70M = 70 MB cache.
* `number` = Maximum memory (in bytes)
* `0` = Disable Cache
* `-1` = Unlimited, up to maximum for your system (1 or 4GB).
See [High speed downloading](/wiki/advanced/highspeed-downloading) for more information.
Article Cache is limited to `1G` on 32bit systems and `4G` on 64bit systems.
|
## Backup
|**Create backup**|
Create a backup of the configuration file and databases in the [Backup Folder](/wiki/configuration/5.0/folders).
If the Backup Folder is not set, the backup will be created in the Completed Download Folder.
You can also schedule a recurring backup in [Scheduling](/wiki/configuration/5.0/scheduling).
WARNING The backup contains all sensitive information like your passwords and API keys!
NOTE The backup can only be created in this folder to prevent an attacker easy access to all your passwords and API-keys if they somehow manage to enter the configuration.
|
|**Restore backup**|Restore a backup of the configuration file and databases.|
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)