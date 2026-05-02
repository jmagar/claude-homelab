Explanation of Options in qBittorrent · qbittorrent/qBittorrent Wiki · GitHub
[Skip to content](#start-of-content)
{{ message }}
[
qbittorrent
](/qbittorrent)
/
**
[qBittorrent](/qbittorrent/qBittorrent)
**
Public
*
* [ Notifications
](/login?return_to=/qbittorrent/qBittorrent) You must be signed in to change notification settings
* [ Fork
4.6k
](/login?return_to=/qbittorrent/qBittorrent)
*
[
Star
36.8k
](/login?return_to=/qbittorrent/qBittorrent)
# Explanation of Options in qBittorrent
[Jump to bottom](#wiki-pages-box)
LewpyUK edited this page Apr 12, 2026
&middot;
[48 revisions](/qbittorrent/qBittorrent/wiki/Explanation-of-Options-in-qBittorrent/_history)
Here you will find explanation for various settings found under the options in qBittorrent, grouped by the tab. The options can be accessed by hitting **Alt** + **O** or going to *Tools* and clicking on *Options*. Some of these options are pretty self explanatory, so detailed explanations for these have been omitted. For additional clarification or explanation, please visit the [qBittorrent forum](http://forum.qbittorrent.org).
At the bottom, there is a list of deprecated options. This list may not be comprehensive.
|
## Table of Contents
[](#table-of-contents)
* [Behavior](#user-content-Behavior)
* [Language](#user-content-Language)
* [Transfer lists](#user-content-Transfer_lists)
* [Desktop](#user-content-Desktop)
* [Power Management](#user-content-Power_Management)
* [Downloads](#user-content-Downloads)
* [When adding a torrent](#user-content-When_adding_a_torrent)
* [Hard Disk](#user-content-Hard_Disk)
* [Email notification upon download completion](#user-content-Email_notification_upon_download_completion)
* [Run an external program on torrent completion](#user-content-Run_an_external_program_on_torrent_completion)
* [Connection](#user-content-Connection)
* [Listening Port](#user-content-Listening_Port)
* [Connection Limits](#user-content-Connection_Limits)
* [Proxy server](#user-content-Proxy_server)
* [IP filtering](#user-content-IP_filtering)
* [Speed](#user-content-Speed)
* [Global Rate Limits](#user-content-Global_Rate_Limits)
* [Alternative Global Rate Limits](#user-content-Alternative_Global_Rate_Limits)
* [BitTorrent](#user-content-BitTorrent)
* [Privacy](#user-content-Privacy)
* [Torrent Queuing](#user-content-Torrent_Queuing)
* [Share Ratio Limiting](#user-content-Share_Ratio_Limiting)
* [Web UI](#user-content-Web_UI)
* [Advanced](#user-content-Advanced)
* [qBittorrent–specific configuration](#user-content-qBittorrentspecific_configuration)
* [libtorrent–specific configuration](#user-content-libtorrentspecific_configuration)
* [Deprecated options](#user-content-Deprecated_options)|
#
Behavior
[](#behavior)
##
Language
[](#language)
This is used to set the language qBittorrent uses in it's GUI (Graphical User Interface). If you want to provide another language, or update an already existing one, you may do so through Transifex. [Here](https://qbforums.shiki.hu/index.php/topic,2134.0.html) is the corresponding forum topic.
##
Transfer lists
[](#transfer-lists)
* **Use alternating row colors** - using alternating row colors makes it easier for the human eye to read lists from a short distance. It is enabled by default, disable it if you choose.
* **Action on double click** - You can also customize the actions that are triggered upon double clicking with the mouse.
##
Desktop
[](#desktop)
* **Start qBittorrent on Windows start up** - specifies whether or not you want to start qBittorrent when you start up your Windows PC. Disabled by default.
* **Show splash screen on start up** - specifies whether the screen containing the qBittorrent logo along with the current version number should be shown whenever the program is started. Enabled by default.
* **Start qBittorrent minimized** - this specifies whether, when you start qBittorrent, you want it to be minimized to the taskbar or not. Disabled by default.
* **Ask for program exit confirmation** - if you try to close qBittorrent when there are active torrents, it will display a warning stating the same. Enabled by default.
* **Show qBittorrent in notification area** - choose whether you want qBittorrent to be shown in the notification area along with other system icons. There are also two additional options -
* **Minimize qBittorrent to notification area** minimizes qB to the notification area and
* **Close qBittorrent to notification area** results in qB moving to the notification area upon closing (similar to µTorrent).
* **File association** allows you to select or deselect qBittorrent as the default application for opening torrent files and/or magnet links. This is asked upon installation, after which the options can be changed here.
* **Use qBittorrent for .torrent files** allows qBittorrent to associate itself whenever you open a .torrent file. This setting can be also adjusted via the system settings, *Set default programs* in Windows 7 and earlier, or *Choose default apps by file type* in Windows 8 and later.
* **Use qBittorrent for magnet links** allows qBittorrent to pop up whenever you click on a magnet link. This setting can also be adjusted in the browser.
* **Check for program updates** — allows qBittorrent to check for new versions released on GitHub. If a new version is found, user is asked to update qBittorrent.
##
Power Management
[](#power-management)
This allows you to prevent the system from going into sleep mode when torrents are active. Useful if you do not want to change sleep settings for your system, but still don't want it to go into sleep mode when qBittorrent is up and running.
#
Downloads
[](#downloads)
##
When adding a torrent
[](#when-adding-a-torrent)
* **Display the torrent content and some options** - this enables qBittorrent to allow you to configure the save location, specifying whether to start the torrent immediately, skip the hash check, to select the label, and to select the content to download and assign priorities.
* **Bring torrent dialog to the front** does what it says. It brings the torrent dialog to focus.
* **Do not start the download automatically** allows you the option of either starting the download without delay, or to wait for the user to click on the Start button.
##
Hard Disk
[](#hard-disk)
* **Save files to location** allows you to select your default save locations.
* **Append the label of the torrent to the save path** - if you want to append the labels of your torrent to the save path (click here if you want to know what labels are and how to use them), you can choose to do so.
* **Pre-allocate disk space for all files** - this option allows qBittorrent to allocate (that is, assign) space on your hard disk (or SSD) so that the problem of not having enough space does not arise later on.
* **Keep incomplete torrents in** - if you wish to save your incomplete torrents to a temporary folder, before they are moved to another folder upon completion, use this option.
* **Append .!qb extension to incomplete files** - this option is similar to µTorrent's appending of .ut to incomplete files. What this option does is that, to enable you to identify files that have not yet been downloaded fully, it adds a .!qb extension to these files. So, *Hello.mp3* will be stored as *Hello.!qb* until the download is complete, after which it gets renamed to *Hello.mp3*.
* **Automatically add torrent from** option allows qBittorrent to automatically load torrents from specific folders to be downloaded to another set of specific folders.
* **Copy .torrent files to** option allows you to copy .torrent files for the torrents that you download to a specific folder (for example, *Downloaded torrents*).
* **Copy .torrent files for finished downloads to** option is the same as the above, with one difference. Only for completed torrents will qBittorrent copy the .torrent file to the specified location.
##
Email notification upon download completion
[](#email-notification-upon-download-completion)
This allows you to receive an email when your download finishes. For this, you will have to supply the fields required.
* **From** - provide the sending email address for the email notification.
* **To** - provide the recipient email address for the email notification. ***Note:*** This can only be a single recipient email address.
* **SMTP server** - provide the SMTP server address for sending email notifications.
The server address can either be entered as a DNS name ***(recommended)*** or IP address.
The default sending port is either 25 for SMTP or 465 for SMTPS.
To manually specify the server port, add a colon and then the port number to the end of the server address.
***Example: smtp.example.com:465*** - connect to server ***smtp.example.com*** on port ***465***
* **This server requires a secure connection (SSL)** - enable this option if the email server requires the [SMTPS](https://en.wikipedia.org/wiki/SMTPS) protocol. The default sending port is 465 but this can be overridden in the **SMTP server** field if needed.
* **Authentication** - enable this option if the SMTP server requires you to authenticate to be able to send emails.
* **Username** - provide the username for authentication to the SMTP server.
* **Password** - provide the password for authentication to the SMTP server.
* **Send test email** - pressing this button immediately sends a test email using the information you have provided in the other fields. Check your inbox to confirm success. Check the Execution Log for errors.
##
Run an external program on torrent completion
[](#run-an-external-program-on-torrent-completion)
This allows you to run a program on finishing certain types of torrents in a certain location.
#
Connection
[](#connection)
##
Listening Port
[](#listening-port)
* **Port used for incoming connections** - either specify the [port](https://whatismyipaddress.com/port) or choose a random one.
* **Use UPnP/ NAT-PMP port forwarding from my router** - for a helpful introduction to port forwarding, go [here](https://en.wikipedia.org/wiki/Port_forwarding), or [here](https://www.lifewire.com/what-is-port-forwarding-2483494).
* **Use different port on each startup** voids the first option, and randomly assigns a different port every time qBittorrent starts up.
##
Connection Limits
[](#connection-limits)
* **Global maximum number of connections** sets the maximum number of peers to connect to for *all* torrents.
* **Maximum number of connections per torrent** sets the maximum number of peers to connect to for *each* torrent.
* **Global maximum number of upload slots** sets the maximum number of [upload slots](http://wiki.vuze.com/w/Max_upload_slots_per_torrent) (basically the number of peers you connect to) for *all* torrents.
* **Maximum number of upload slots** sets the maximum of upload slots for *each* torrent.
##
Proxy server
[](#proxy-server)
These options allow you to set up a proxy server to use when downloading torrents. A tutorial of sorts can be accessed [here](https://kickass.to/community/show/41088/) (for µTorrent, but can be used for qBittorrent as well).
Disable connections not supported by proxies: [link](/qbittorrent/qBittorrent/wiki/Disable-connections-not-supported-by-proxies)
##
IP filtering
[](#ip-filtering)
This is a feature which allows you to block certain *bad peers*. Didn't understand a word? More information about that [here](https://en.wikipedia.org/wiki/Leecher_(computing)).
#
Speed
[](#speed)
##
Global Rate Limits
[](#global-rate-limits)
You can use this to set global (for all torrents) rate limits for both downloads and uploads. For the other options, read [this](https://en.wikipedia.org/wiki/Micro_Transport_Protocol) Wikipedia article.
##
Alternative Global Rate Limits
[](#alternative-global-rate-limits)
For those of you whose internet connectivity is limited during specific hours (for example, you might have unlimited bandwidth during the night, but limited during the day), this option is for you. You can schedule these to be activated automatically, or manually activate it using the bottom tool bar in qBittorrent.
#
BitTorrent
[](#bittorrent)
##
Privacy
[](#privacy)
* **Enable DHT (decentralized network) to find more peers** - DHT is a solution to make torrent downloading and uploading a tracker independent operation. More about DHT [here](https://en.wikipedia.org/wiki/BitTorrent_(protocol)#Creating_and_publishing_torrents).
* **Enable Peer Exchange (PeX) to find more peers** - another alternative to enable lesser dependency on trackers. More information [here](http://wiki.vuze.com/w/Peer_Exchange).
* **Enable Local Peer Discovery to find more peers** - an extension to the BitTorrent protocol to enable communication via LAN. More information [here](https://en.wikipedia.org/wiki/Local_Peer_Discovery).
* **Enable anonymous mode** - in simple terms, qBittorrent tries to maintain a certain degree of anonymity while using this function. Detailed explanation [here](/qbittorrent/qBittorrent/wiki/Anonymous-Mode).
##
Torrent Queuing
[](#torrent-queuing)
These options allow you to control the number of torrents being downloaded and uploaded. Refer to the documentation [here](https://www.libtorrent.org/single-page-ref.html#queuing) for information on *slow torrents*.
##
Share Ratio Limiting
[](#share-ratio-limiting)
Here, you can configure to what ratio (amount uploaded/amount downloaded) the torrent should be seeded. You can also configure on whether you want them to be paused or removed after this.
#
Web UI
[](#web-ui)
You can use a remote control with qBittorrent. For more information, go [here](https://github.com/qbittorrent/qBittorrent/wiki#webui-related).
#
Advanced
[](#advanced)
The following settings are also documented in qBittorrent and libtorrent, respectively [here](https://github.com/qbittorrent/qBittorrent/blob/master/src/gui/advancedsettings.cpp) and [here](https://github.com/arvidn/libtorrent/blob/master/include/libtorrent/settings_pack.hpp).
###
qBittorrent–specific configuration
[](#qbittorrentspecific-configuration)
* **Process memory priority (Windows \>= 8 only)** — (default: Below normal) Specifies the memory priority for a thread or process.
* **Network interface** — (default: Any interface) Specifies which network interfaces qBittorrent listens on. On multi-NIC systems (e.g. device has an ethernet port and wifi) you may limit which interface should be used to send and transmit data.
* **Optional IP address to bind to** — (default: All addresses) *TBA*
* **Save resume data interval** — (default: 3 min) Duration on which the resume data is saved to the disk. (*TBA*: What is "resume data")
* **Confirm torrent recheck** — (default: enabled) Before manually rechecking torrents (e.g. Context-menu → Force recheck), a user confirmation dialog is displayed.
* **Recheck torrents on completion** — (default: disabled) After the torrent is completely downloaded a recheck operation is performed on the torrent. (*TBA*: completing may or may not be before *seeding* completion.) This is specially useful on unreliable disks or filesystems.
* **Transfer list refresh interval** — (default: 1500 ms) Controls how fast or slow the transfer list view is updated. Adjusting the refresh interval to a lower value displays less accurate speeds in average, but nicer results. If qBittorrent is running in the background, you may increase the value instead. Using lower values might cause qBittorrent to use more resources.
* **Resolve peer host name** — (default: disabled) When enabled, the address list in the Peers tab will try to resolve IP addresses to hostname using reverse lookups. Might not always return accurate results.
* **Resolve peer countries** — (default: enabled) When enabled, qBittorrent tries to lookup the originating country of each peer using the [GeoIP](https://dev.maxmind.com/geoip/geoip2/geolite2/) database.
* **Display notifications** — (default: enabled) Will make qBittorrent output system tray notifications for various events (e.g. download completed, search finished, an error occurred). Disabling this option will silence qBittorrent.
* **Display notifications for added torrents** — (default: disabled) When enabled will make qBittorrent output new notification on adding a new torrent. Specially useful if torrents are added using RSS or the Web UI.
* **Confirm removal of all tags** — (default: enabled) Displays a user confirmation message before removing all tags.
* **Download tracker's favicon** — (default: enabled) When enabled, qBittorrent tries to fetch the "favicon.ico" file from each tracker URL. This icon is displayed in the left pane under "Trackers" in GUI.
* **Save path history length** — (default: 8) This controls how many recent paths qBittorrent will remember.
* **Enable speed graphs** — (default: enabled) Self-explanatory.
* **Enable icons in menus** — (default: enabled) Self-explanatory, restart required (Windows).
* **Enable embedded tracker** — (default: disabled) Enable qbittorrent's tracker functionality. It is not a fully-featured bittorrent tracker, but it supports the basic features need for sharing a few torrents see the [how-to wiki page](https://github.com/qbittorrent/qBittorrent/wiki/How-to-use-qBittorrent-as-a-tracker) for more info.
* **Embedded tracker port** — (default: 9000) The port the embedded tracker should listen on.
###
libtorrent–specific configuration
[](#libtorrentspecific-configuration)
A complete list of libtorrent configuration may be found [here](https://www.libtorrent.org/reference-Settings.html).
* **Asynchronous I/O threads** — (default: 10) I/O threads that `libtorrent` will use. The number of threads actually used for SHA-1 hashing is n/4 (where n is the value of the setting), so for maximum performance, especially during torrent recheck, this setting should be set to 4 times the number of hardware threads on your machine. So for example, if your CPU is 4c/4t or 2c/4t, set this to 16, if your CPU is 4c/8t or 8c/8t set this to 32, etc. It is unlikely that setting this any higher than this will bring a performance benefit.
* **File pool size** — (default: 5000) Sets the upper limit on the total number of files this session will keep open. The reason why files are left open at all is that some anti virus software hooks on every file close, and scans the file for viruses. deferring the closing of the files will be the difference between a usable system and a completely hogged down system. Most operating systems also has a limit on the total number of file descriptors a process may have open.
* **Outstanding memory when checking torrents** — (default: 32 MiB) The amount of memory to use when checking torrents. Higher numbers give faster rechecks but use more memory.
* **Disk cache** — (default: 0 (disabled)) Amount of data that will remain in RAM before being written to disk. If set to `0`, no data will be kept in RAM and instead it will be immediately written to disk (you might see performance impact.)
* **Disk cache expiry interval** — (default: 60 s) is the number of seconds from the last cached write to a piece in the write cache, to when it's forcefully flushed to disk.
* **Enable OS cache** — (default: enabled) Paraphrased from the libtorrent docs: enable for better performance, disable if you also disabled libtorrent's read cache, or to help preventing the operating system from growing its file cache indefinitely, or if you want to prevent qbittorrent from potentially evicting all other processes' cache (which may result in lower perceived system responsiveness).
* **Coalesce reads & writes** — (default: enabled) Allocate separate, contiguous, buffers for read and write calls. Only used where writev/readv cannot be used, and will use more RAM but may improve performance.
* **Use piece extent affinity** — (default: disabled) When this is true, create an affinity for downloading 4 MiB extents of adjacent pieces. This is an attempt to achieve better disk I/O throughput by downloading larger extents of bytes, for torrents with small piece sizes.
* **Send upload piece suggestions** — (default: disabled) Controls whether or not libtorrent will send out suggest messages to create a bias of its peers to request certain pieces. If enabled, libtorrent will send out suggest messages for the most recent pieces that are in the read cache.
* **Send buffer watermark** — (default: 500 KiB) This is the upper limit for the send buffer size. If the send buffer has fewer bytes than this, another 16kB block will be read into it. If set too small, upload rate capacity will suffer. If set too high, memory will be wasted. The actual watermark may be lower than this in case the upload rate is low.
* **Send buffer low watermark** — (default: 10 KiB) The minimum send buffer target size (send buffer includes bytes pending being read from disk). For good and snappy seeding performance, set this fairly high, to at least fit a few blocks. This is essentially the initial window size which will determine how fast we can ramp up the send rate.
* **Send buffer watermark factor** — (default: 50 %) The factor is specified as a percentage. i.e. 50 -\> 0.5. The current upload rate to a peer is multiplied by this factor to get the send buffer watermark. This product is clamped to the "Send buffer watermark" setting so as to not exceed the max. For high speed upload, this should be set to a greater value than 100. For high capacity connections, setting this higher can improve upload performance and disk throughput. Setting it too high may waste RAM and create a bias towards read jobs over write jobs.
* **Socket backlog size** — (default: 30)
* **Outgoing ports [0:Disabled]** — (default: 0) This is the range of ports to use for binding outgoing connections to and it shouldn't be too small. It is useful for users that have routers that allow QoS settings based on local port. Setting outgoing ports will limit the ability to keep multiple connections to the same client, even for different torrents. It is not recommended to change this setting. Its main purpose is to use it as an escape hatch for cheap routers with QoS capability but can only classify flows based on port numbers. It is a range instead of a single port because of the problems with failing to reconnect to peers if a previous socket to that peer and port is in the waiting state.
* **UPnP lease duration [0:Permanent]** — (default: 0 s) The expiration time of UPnP port-mappings, specified in seconds. Some routers do not support expiration times on port-maps (nor correctly returning an error indicating lack of support). In those cases, set this to 0. Otherwise, don't set it any lower than 5 minutes.
* **Type of service (ToS) for connections to peers** — (default: 32) Determines the TOS byte set in the IP header of every packet sent to peers (including web seeds). 0x0 means no marking, 0x20 represents the QBone scavenger service.
* **µTP-TCP mixed mode algorithm** — (default: Prefer TCP) Determines how to treat TCP connections when there are uTP connections. Since uTP is designed to yield to TCP, there's an inherent problem when using swarms that have both TCP and uTP connections. If nothing is done, uTP connections would often be starved out for bandwidth by the TCP connections. This mode is called "Prefer TCP" in qBittorrent. The "Peer proportional" mode on the other hand, simply looks at the current throughput and rate limits all TCP connections to their proportional share based on how many of the connections are TCP. This works best if uTP connections are not rate limited by the global rate limiter.
* **Support internationalized domain name (IDN)** — (default: disabled) When disabled, any tracker or web seed with an IDNA hostname (internationalized domain name) is ignored. This is a security precaution to avoid various unicode encoding attacks that might happen at the application level.
* **Allow multiple connections from the same IP address** — (default: disabled) Determines if connections from the same IP address as existing connections should be rejected or not. This option is disabled by default to prevent abusive behavior by peers. It may be useful to allow such connections in cases where simulations are run on the same machine, and all peers in a swarm have the same IP address.
* **Validate HTTPS tracker certificates** — (default: enabled) When set to true, the certificate of HTTPS trackers and HTTPS web seeds will be validated against the system's certificate store (as defined by OpenSSL). If the system does not have a certificate store, this option may have to be disabled in order to get trackers and web seeds to work).
* **Server-side request forgery (SSRF) mitigation** — (default: enabled) When enabled, tracker and web seed requests are subject to certain restrictions. An HTTP(s) tracker requests to localhost (loopback) must have the request path start with "/announce". This is the conventional bittorrent tracker request. Any other HTTP(S) tracker request to loopback will be rejected. This applies to trackers that redirect to loopback as well. Web seeds that end up on the client's local network (i.e. in a private IP address range) may not include query string arguments. This applies to web seeds redirecting to the local network as well. Web seeds on global IPs (i.e. not local network) may not redirect to a local network address.
* **Disallow connection to peers on privileged ports** — (default: disabled) When this is true, libtorrent will not attempt to make outgoing connections to peers whose port is \< 1024. This is a safety precaution to avoid being part of a DDoS attack.
* **Upload slots behavior** — (default: Fixed slots) It specifies which algorithm to use to determine which peers to unchoke:
* **Fixed slots** — The traditional choker with a fixed number of unchoke slots.
* **Upload rate based** — Opens up unchoke slots based on the upload rate achieved to peers. The more slots that are opened, the marginal upload rate required to open up another slot increases.
* **Upload choking algorithm** — (default: Fastest upload) It controls the seeding unchoke behavior:
* **Round-robin** — Rotates the peers that are unchoked when seeding. This distributes the upload bandwidth uniformly and fairly. It minimizes the ability for a peer to download everything without redistributing it.
* **Fastest upload** — Unchokes the peers we can send to the fastest. This might be a bit more reliable in utilizing all available capacity.
* **Anti-leech** — Prioritizes peers who have just started or are just about to finish the download. The intention is to force peers in the middle of the download to trade with each other.
* **Always announce to all trackers in a tier** — (default: enabled) Controls how multi tracker torrents are treated. If this is set to true, all trackers in the same tier are announced to in parallel. Otherwise the behavior is as defined by the multi tracker specification.
* **Always announce to all tiers** — (default: enabled) also controls how multi tracker torrents are treated. When this is set to true, one tracker from each tier is announced to. This is the uTorrent behavior. To be compliant with the Multi-tracker specification, set it to false.
* **IP Address to report to trackers (requires restart)** — (default: blank) is the IP address passed along to trackers. If this value is blank, the parameter will be omitted.
* **Max concurrent HTTP announces** — (default: 50) limits the number of concurrent HTTP tracker announces. Once the limit is hit, tracker requests are queued and issued when an outstanding announce completes.
* **Stop tracker timeout** — (default: 5 s) is the number of seconds to wait when sending a stopped message before considering a tracker to have timed out. This is usually shorter, to make the client quit faster. If the value is set to 0, the connections to trackers with the stopped event are suppressed.
* **Peer turnover disconnect percentage** — (default: 4 %) is the percentage of peers to disconnect every turnover (Peer turnover disconnect interval) (if we're at the peer limit). When we are connected to more than limit (Peer turnover threshold percentage) peers, disconnect this percentage fraction of the peers.
* **Peer turnover threshold percentage** — (default: 90 %) See above.
* **Peer turnover disconnect interval** — (default: 300 s) is the interval (in seconds) between optimistic disconnects if the disconnects happen. See above.
#
Deprecated options
[](#deprecated-options)
Deprecated options may be safely removed from your config file.
* **Listen on IPv6 address** — Also known as the config string `Connection\\InterfaceListenIPv6` (since `4.2.1`). Replacement: "Optional IP address to bind to", config string `Connection\\InterfaceAddress`. Reason: [#11592](https://github.com/qbittorrent/qBittorrent/pull/11592).
* **Maximum number of half-open connections** — Also known as the config string `BitTorrent/Session/MaxHalfOpenConnections` (since `4.2.0`). Replacement: None. Reason: [option removed from libtorrent as it did not make sense anymore](https://github.com/arvidn/libtorrent/commit/ceccc2a4835fefce836001a7ccff8cca82d58999).
* **Guided read cache** — enables the disk cache to adjust the size of a cache line generated by peers to depend on the upload rate you are sending to that peer. The intention is to optimize the RAM usage of the cache, to read ahead further for peers that you're sending faster to.
* **Strict super seeding** — activate libtorrent's [strict super seeding](https://www.bittorrent.org/beps/bep_0016.html) mode ("when this is set to true, a piece has to have been forwarded to a third peer before another one is handed out. This is the traditional definition of super seeding.").
[Go back to home](https://github.com/qbittorrent/qBittorrent/wiki)
## General
[](#general)
* [Installing qBittorrent](https://github.com/qbittorrent/qBittorrent/wiki/Installing-qBittorrent)
* [Frequently Asked Questions (FAQ)](https://github.com/qbittorrent/qBittorrent/wiki/Frequently-Asked-Questions)
* [qBittorrent options (current and deprecated)](https://github.com/qbittorrent/qBittorrent/wiki/Explanation-of-Options-in-qBittorrent)
* [How to use qBittorrent as a tracker](https://github.com/qbittorrent/qBittorrent/wiki/How-to-use-qBittorrent-as-a-tracker)
* [How to use portable mode](https://github.com/qbittorrent/qBittorrent/wiki/How-to-use-portable-mode)
* [Anonymous mode](https://github.com/qbittorrent/qBittorrent/wiki/Anonymous-Mode)
* [How to bind your vpn to prevent ip leaks](https://github.com/qbittorrent/qBittorrent/wiki/How-to-bind-your-vpn-to-prevent-ip-leaks.md)
### Troubleshooting
[](#troubleshooting)
* [qBittorrent support forum](http://forum.qbittorrent.org/)
* [I forgot my GUI lock password](https://github.com/qbittorrent/qBittorrent/wiki/I-forgot-my-UI-lock-password)
* [I forgot my WebUI password](https://github.com/qbittorrent/qBittorrent/wiki/Web-UI-password-locked-on-qBittorrent-NO-X-(qbittorrent-nox))
* [Speed issues](https://github.com/qbittorrent/qBittorrent/wiki/Things-we-need-to-know-to-help-you-with-'speed'-issues)
### External programs
[](#external-programs)
* [How-to](https://github.com/qbittorrent/qBittorrent/wiki/External-programs-How-to)
* [`savecategory`](https://github.com/qbittorrent/qBittorrent/wiki/External-programs-savecategory)
### Search plugins
[](#search-plugins)
* [List of unofficial search plugins](https://github.com/qbittorrent/search-plugins/wiki/Unofficial-search-plugins)
### Themes
[](#themes)
* [Developing custom UI themes](https://github.com/qbittorrent/qBittorrent/wiki/Create-custom-themes-for-qBittorrent)
* [How to use custom UI themes](https://github.com/qbittorrent/qBittorrent/wiki/How-to-use-custom-UI-themes)
* [List of unofficial themes](https://github.com/qbittorrent/qBittorrent/wiki/List-of-known-qBittorrent-themes)
### Translation
[](#translation)
* [How to translate qBittorrent](https://github.com/qbittorrent/qBittorrent/wiki/How-to-translate-qBittorrent)
## WebUI
[](#webui)
### WebUI API
[](#webui-api)
|State|Version|
|[Current](https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-5.0))|qBittorrent \>= 5.0|
|[Previous](https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1))|qBittorrent v4.1.0 - v4.6.x|
|[Previous](https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-v3.2.0-v4.0.4))|qBittorrent v3.2.0 - v4.0.x|
|[Obsolete](https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-v3.1.x))|qBittorrent \< v3.2.0|
### Authentication
[](#authentication)
* [Username/password](https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-5.0)#login)
* [API key](https://github.com/qbittorrent/qBittorrent/wiki/API-Key-Authentication-(≥v5.2.0))
### WebAPI clients
[](#webapi-clients)
* [List of unofficial WebAPI clients](https://github.com/qbittorrent/qBittorrent/wiki/List-of-unofficial-WebAPI-clients)
### Alternate WebUI
[](#alternate-webui)
* [Alternate WebUI usage](https://github.com/qbittorrent/qBittorrent/wiki/Alternate-WebUI-usage)
* [Developing alternate WebUIs](https://github.com/qbittorrent/qBittorrent/wiki/Developing-alternate-WebUIs-(WIP))
* [List of unofficial alternate WebUIs](https://github.com/qbittorrent/qBittorrent/wiki/List-of-known-alternate-WebUIs)
### Reverse proxy setup for WebUI access
[](#reverse-proxy-setup-for-webui-access)
* [NGINX](https://github.com/qbittorrent/qBittorrent/wiki/NGINX-Reverse-Proxy-for-Web-UI)
* [Microsoft IIS ARR](https://github.com/qbittorrent/qBittorrent/wiki/IIS-ARR-Reverse-Proxy)
* [Traefik](https://github.com/qbittorrent/qBittorrent/wiki/Traefik-Reverse-Proxy-for-Web-UI)
### WebUI HTTPS configuration
[](#webui-https-configuration)
* [Let's Encrypt Certificates + Caddy2 Reverse Proxy](https://github.com/qbittorrent/qBittorrent/wiki/Linux-WebUI-HTTPS-with-Let's-Encrypt-&amp;-Caddy2-reverse-proxy)
* [Let's Encrypt certificates + NGINX reverse proxy - Linux](https://github.com/qbittorrent/qBittorrent/wiki/Linux-WebUI-HTTPS-with-Let's-Encrypt-certificates-and-NGINX-SSL-reverse-proxy)
* [Let's Encrypt certificates - Linux](https://github.com/qbittorrent/qBittorrent/wiki/Linux-WebUI-setting-up-HTTPS-with-Let's-Encrypt-certificates)
* [Self-signed SSL certificates - Linux](https://github.com/qbittorrent/qBittorrent/wiki/Linux-WebUI-setting-up-HTTPS-with-self-signed-SSL-certificates)
## Linux
[](#linux)
* [Running qBittorrent without X server (WebUI only)](https://github.com/qbittorrent/qBittorrent/wiki/Running-qBittorrent-without-X-server-(WebUI-only))
* [Running qBittorrent without X server (WebUI only, systemd service set up, Ubuntu 15.04 or newer)](https://github.com/qbittorrent/qBittorrent/wiki/Running-qBittorrent-without-X-server-(WebUI-only,-systemd-service-set-up,-Ubuntu-15.04-or-newer))
* [OpenVPN and qBittorrent without X server](https://github.com/qbittorrent/qBittorrent/wiki/OpenVPN-and-qBittorrent-without-X-server)
## Development
[](#development)
* [Coding style](https://github.com/qbittorrent/qBittorrent/blob/master/CODING_GUIDELINES.md)
* [Contributing](https://github.com/qbittorrent/qBittorrent/blob/master/CONTRIBUTING.md)
* [How to write a search plugin](https://github.com/qbittorrent/search-plugins/wiki/How-to-write-a-search-plugin)
* [Using VSCode for qBittorrent development](https://github.com/qbittorrent/qBittorrent/wiki/Using-VSCode-for-qBittorrent-development)
* [Setup GDB with Qt pretty printers](https://github.com/qbittorrent/qBittorrent/wiki/Setup-GDB-with-Qt-pretty-printers)
* [How to debug WebUI code](https://github.com/qbittorrent/qBittorrent/wiki/How-to-debug-the-WebUI-code)
### Compilation
[](#compilation)
[Common information for CMake](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-with-CMake-common-information)
#### \*BSD, Linux
[](#bsd-linux)
* [Alpine Linux](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Alpine-Linux)
* [CentOS 8.x](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-CentOS-8.x)
* [Debian / Ubuntu and derivatives (CMake)](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Debian,-Ubuntu,-and-derivatives)
* [Debian / Ubuntu and derivatives (autotools/qmake)](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Debian-and-Ubuntu)
* [Docker](https://github.com/qbittorrent/docker-qbittorrent-nox#readme)
* [FreeBSD (no GUI)](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-FreeBSD-(no-GUI))
* [Fully static binaries on Linux (glibc or musl)](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Fully-static-binaries-on-Linux-(glibc-or-musl))
* [Raspberry Pi OS / DietPi](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Raspberry-Pi-OS-and-DietPi)
* [Raspbian for LeMaker Banana Pro](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Raspbian-for-LeMaker-Banana-Pro)
#### macOS
[](#macos)
* [cmake (x86\_64, arm64, cross-compilation, static linkage)](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-macOS-(x86_64,-arm64,-cross-compilation))
* [autotools/qmake](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-macOS)
#### Windows
[](#windows)
* [MSVC 2019 (CMake, static linkage)](https://github.com/qbittorrent/qBittorrent/wiki/Compilation-Windows-(MSVC-2019,-64-bit,-static-linkage))
* [MSVC 2019 (qmake, static linkage)](https://github.com/qbittorrent/qBittorrent/wiki/Compiling-with-MSVC-2019-(static-linkage))
* [MSYS2](https://github.com/Chocobo1/qbittorrent_msys2#readme)
[Obsolete compilation guides](https://github.com/qbittorrent/qBittorrent/wiki/Obsolete-compilation-guides)
### Clone this wiki locally