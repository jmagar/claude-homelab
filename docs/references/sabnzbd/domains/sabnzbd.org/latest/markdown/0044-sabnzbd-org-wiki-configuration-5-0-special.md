SABnzbd -
Wiki -
Special settings
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Special+settings&amp;body=##+URL:+/wiki/configuration/5.0/special.html
Improvement:
>)
Special settings
## Switches
|Field name|Default|Meaning|
|`start\_paused`||If checked SABnzbd will always start up in "Paused" mode.|
|`preserve\_paused\_state`||Preserve the downloading state (paused or unpaused) after a restart.|
|`no\_penalties`||Some Usenet servers have intermittent login (or other) problems. For these the server blocking method is not very favorable. Setting this option will limit blocks to 1 minute.|
|`ipv6\_servers`||Allow connections to IPv6 addresses if they are available for your news server.|
|`ipv6\_staging`||
Enable IPv6 features that are non yet mainstream:
Add IPv6 hostnames during address selection.
Internet Bandwidth is measured separately for IPv4 and IPv6.
|
|`fast\_fail`||When starting a download, the first article of each file is downloaded. If `Abort jobs that cannot be completed` is turned on, there are more than 10 files and more than 80% of the first articles is missing the job will be failed. If turned off, it will only be failed if availability is below `req\_completion\_rate`.|
|`overwrite\_files`||When unpacking, this will overwrite existing files instead of creating an alternative name.|
|`enable\_par\_cleanup`||Normally SABnzbd will clean up par2 files after verify/repair. You can disable this by using 0. Disabling this will also force all par2 files to be downloaded.|
|`process\_unpacked\_par2`||During post-processing, if there are any `.par2` files unpacked, they will be analysed and any renames will be performed. Only performed if the job is set to `+Delete`.|
|`queue\_complete\_pers`||Check this if you want end-of-queue actions to be persistent (remembered) after restarts of SABnzbd.|
|`api\_warnings`||
When the API is accessed by external tools without proper authentication, SABnzbd will show a warning.
This is a security warning that you should take seriously. However, it seems that there are some security tools that try to access anything that looks like a webserver.
If you cannot remove the cause of the warnings, you can choose to disable the warning.
If disabled, for blocked requests no error message (such as `Access denied`) is returned to the client.
|
|`helpful\_warnings`||Option to disable helpful warnings about issues on your system such as the usage of FAT filesystems, too long password-files, required `unrar` versions, etc.|
|`ampm`||Display ETA in AM/PM notation, only applicable to some locations in older skins.|
|`enable\_unrar`, `enable\_unzip`, `enable\_7zip`, `enable\_filejoin`, `enable\_tsjoin`||Enable or disable the UnRar, UnZip, 7zip, filejoin and TSJoin tools. If disabled, the archive/split files will not be unpacked.|
|`ignore\_unrar\_dates`||Normally unpacked files will get the date/time stamp they have in the archive. If you set this option, the files will get the date/time of unpacking.|
|`tray\_icon`||Uncheck this to remove the SABnzbd icon from the tray on Windows, macOS and Linux.|
|`allow\_incomplete\_nzb`||Sometimes you get an incomplete NZB file (partial content, incorrect syntax etc.) You can enable this option to allow SABnzbd to salvage as much as possible from the NZB. The job will enter the queue in paused mode.|
|`rss\_filenames`||Normally the RSS titles are used to name jobs. If you prefer the (usually) more compact NZB file names that are generated by index sites, check this. The RSS matching still occurs on titles only!|
|`ipv6\_hosting`||Some systems have problems dealing with the IPv6 equivalent of "localhost" for SABnzbd host. Therefore SABnzbd will not try to bind to the IPv6 localhost by default when the SABnzbd host is set to "localhost". Enabling this will binding to all addresses of localhost. Alternatively you can also set the SABnzbd host to ::1 to only bind to the IPv6 localhost.|
|`keep\_awake`||Disable to stop SABnzbd's attempts to keep the system awake while the queue isn't empty.|
|`new\_nzb\_on\_failure`||Some indexers provide an alternative NZB through a HTTP-header (`X-DNZB-Failure`) when the download is added as an URL. If the first download fails, try and fetch the alternative NZB.|
|`html\_login`||HTML based login form, uncheck for basic authentication. Both offer similar security but password managers might not be able to fill basic authentication automatically.|
|`disable\_archive`||Enable to always skip the Archive when jobs are deleted.
Does not delete jobs that are already in the Archive or jobs moved to the Archive using the History Retention option.|
|`wait\_for\_dfolder`||Some people use external or network drives for the "temporary download folder". It can happen that such a drive isn't mounted yet when SABnzbd starts up, causing it to create a new folder at the default location. To prevent this, set the option to 1. This will make SABnzbd wait until the drive is available. Note that SABnzbd will hang until the drive is available! Also, the folder must already exist otherwise SABnzbd will hang until terminated.|
|`enable\_broadcast`||Make announcements on the local network using Simple Service Discovery Protocol (SSDP) and Apple's [Bonjour](/wiki/extra/bonjour-support) protocol, allowing other systems to auto-discover SABnzbd.|
|`warn\_dupl\_jobs`||If checked, will issue a warning when a duplicate job is detected and subsequently paused or deleted.|
|`backup\_for\_duplicates`||In the duplicate check, also include exact filename matches from the NZB Backup Folder.|
|`disable\_api\_key`||If checked API calls don't require the API key.|
|`api\_logging`||Check to log all API calls.|
|`x\_frame\_options`||Includes HTTP header with every request that prevents SABnzbd to be included in another site within the browser. Disable when trying to use SABnzbd with tools that let you control your HTPC from a single interface.|
|`allow\_old\_ssl\_tls`||By default SABnzbd enforces TLSv1.2+ for SSL-connections to Usenet servers. Older protocol versions (SSLv2, SSLv3, and TLS \<= 1.1) will only be allowed if this is checked.|
|`enable\_season\_sorting`||Enable [season pack](/wiki/configuration/5.0/sorting#toc5) handling when sorting Series. This makes the sorting try to extract episode numbers from the file names of the downloaded files in case a season pack is detected, so it can properly rename all files.|
|`verify\_xff\_header`||Take the IP address(es) in the X-Forwarded-For header into consideration when determining access rights for incoming connections, **in addition to** the client/remote IP. Intended for use with a reverse proxy setup, where the IP address making the connection (as seen from the perspective of SABnzbd) is that of the proxy server rather than the system where the request actually originated, causing access to be granted even if the [External internet access](/wiki/configuration/5.0/general#toc-eia) setting is configured to deny connections from outside the local network.|
|`direct\_write`||
Enable Direct Write mode for the assembler, which uses the Article Cache and sparse files to write data at the correct offsets for improved performance and repair behavior.
See [Direct Write](/wiki/advanced/direct-write.html) for detailed information and tuning tips.
|
## Values
|Field name|Default|Meaning|
|`downloader\_sleep\_time`|`10`| CPU sleep period that is sometimes added between reading data from the connections. Higher values may reduce CPU load but too high values will impact the download speed. A value of 0 should only be used if increasing the number of connections is not sufficient to get maximum speed. A value of 10 means 1 ms.|
|`size\_limit`|`0`|Any download that exceeds this value will be paused and get priority "low". You can use the K/M/G notation, so e.g. 4.7G.|
|`nomedia\_marker`||Just before unpacking of files into the final folder, SABnzbd will put a special marker file (e.g. ".nomedia") in the folder. Afterwards it will be deleted. This prevents some media player software from trying to index the folder while still incomplete. You can disable the feature by clearing the field, or you can set an alternative name. Check your media software's manual.|
|`max\_url\_retries`|`10`|How many times failed NZB fetches will be retried. Each retry increases the waiting interval (60, 120, 180, etc seconds). Only applies to errors that might be resolved when trying again later, like a server being temporarily unresponsive.|
|`req\_completion\_rate`|`100.2`|
Minimum percentage to allow pre-check to continue downloading.
A perfect download (with the usual 10% par2 files) would have 110%.
100% means that the rar files and the par2-files combined are the same amount of bytes as only the rar-set, if it was fully complete.
Anything less than 100% is by definition not repairable.
|
|`wait\_ext\_drive`|`5`|When SABnzbd wants to store files on the final destination, this destination might be an external drive. Especially USB drives can take considerable time to wake up after going into standby. SABnzbd will try 5 times with intervals of one second. You can increase this value if needed.|
|`max\_foldername\_length`|`246`|On most filesystems, the size of each path segment in a filename is limited to 255 characters. Set this option to limit each element of the total path to the provided number of characters. Each element will be truncated to the specified number. Note that this should not be raised above the default (such as to the 'full' 255) since space needs to be reserved for modifications by SABnzbd processes such as automated unpacking.|
|`url\_base`||When using a reverse proxy (or just if you feel like it), you can change the base-URL of SABnzbd that is used during redirects. Trailing slash is not allowed and is automatically removed. Leading slash is required and automatically added.
SABnzbd will forcefully restart after changing this setting, you will need to reload the page after the restart completes.|
|`receive\_threads`|`2`|
Number of threads being used to read and decode data concurrently.
Setting it to 1 may reduce CPU consumption and make bandwidth limiting smoother.
Increasing it may improve download speed.
If you configure a [Maximum line speed](/wiki/configuration/5.0/general) of more than `150MB` it will automatically be set from `2` to `4`.
Requires manual restart of SABnzbd to become active.
|
|`assembler\_max\_queue\_size`|`12`|
Maximum size of the queue of articles waiting to be written to disk. Increasing it may improve download speed.
If you configure a [Maximum line speed](/wiki/configuration/5.0/general) of more than `150MB` it will automatically be set from `12` to `30`.
Requires manual restart of SABnzbd to become active.
|
|`switchinterval`|`0.005`|
The number of seconds a thread is allowed to run before switching to another. Setting a lower number may improve disk write speed.
Requires manual restart of SABnzbd to become active.
|
|`direct\_unpack\_threads`|`3`|When Direct Unpack is enabled we only allow this number of unpackers to be active at the same time. This is to limit strain on the system's disks.
Note that there can be an additional unpack active if a job is also being post-processed.|
|`selftest\_host`|`self-test.sabnzbd.org`|In order to check proper IPv6 connectivity and your external IPv4 address, SABnzbd needs to connect to a known external IPv6 address and a server that returns the external IP address. By default we use our own server for this (we don't send any data). You can choose to use another known IPv6 host, e.g. `http://ipv6.google.com`. However, this will cause the external IPv4 address detection to fail in the status window, this does not affect the functioning of SABnzbd.|
|`ssdp\_broadcast\_interval`|`15`|Interval between Simple Service Discovery Protocol (SSDP) broadcasts, announcing the presence of SABnzbd to other systems on the local network.|
|`unrar\_parameters`||Extra parameters for the unrar extraction commands. Supported parameters are `-mlp` (large memory pages; all operating systems), `-om` (mark of the web; Windows only), and `-ri` (priority and sleep time; also Windows only).|
|`outgoing\_nntp\_ip`||The specific local IP address (IPv4/IPv6) SABnzbd will use for its outgoing NNTP (Network News Transfer Protocol) connections. This is useful on systems with multiple network interfaces (like a VPN) to force traffic through a specific IP.|
|`rss\_odd\_titles`|`nzbindex.nl/`, `nzbindex.com/`, `nzbclub.com/`|Some RSS feeds produce very awkward titles which are fine for filtering, but not as job titles. For all indexers that are listed here, the actual NZB file name will be used instead of the title.|
|`quick\_check\_ext\_ignore`|`nfo, sfv, srr`|A list of file name extensions that will be ignored during QuickCheck. If they are missing but all other files are correct, QuickCheck will still pass.|
|`host\_whitelist`|`hostname`|See [Hostname verification](/wiki/extra/hostname-check.html).|
|`local\_ranges`||Specify a (comma separated) list of one or more network ranges where the [External internet access](/wiki/configuration/5.0/general) level doesn't apply and the full interface is available. Sending Bonjour and SSDP broadcasts is also limited to these ranges. If defined, the local ranges replace the default handling based on rfc1918 and rfc4193 [private](https://en.wikipedia.org/wiki/Private_network) network ranges.
Network ranges should be set in their standard notation with a prefix or netmask (e.g. `192.168.1.0/24` or `10.42.0.0/255.255.0.0`). Input in the form of SABnzbd's older (pre-3.3.0) local\_ranges setting (e.g. `192.168.1.`, intended for use with Python's `str.startswith()`) is also accepted and continues to work.|
|`ext\_rename\_ignore`||Specify a (comma separated) list of one or more additional extensions that SABnzbd should handle also well-known extensions and thus not touch.|
## Very special option
Below is one option that cannot be set from the Web UI, because it would defeat its security purpose.
You can only access it by directly editing the `sabnzbd.ini` file, while SABnzbd is not running.
|Field name|Default|Meaning|
|`config\_lock`||If 1, forbids all access to the Config pages.|
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)