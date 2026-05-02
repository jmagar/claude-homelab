WebUI API (qBittorrent 5.0) · qbittorrent/qBittorrent Wiki · GitHub
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
# WebUI API (qBittorrent 5.0)
[Jump to bottom](#wiki-pages-box)
xavier2k6 edited this page Jan 22, 2026
&middot;
[5 revisions](/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-5.0)/_history)
This WebUI API documentation applies to qBittorrent v5.0+. For other WebUI API versions, visit [WebUI API](https://github.com/qbittorrent/qBittorrent/wiki#WebUI-API).
# Table of Contents
[](#table-of-contents)
1. [Changes](#changes)
1. [API v2.9.3](#api-v293)
2. [API v2.11.3](#api-v2113)
3. [General information](#general-information)
4. [Authentication](#authentication)
1. [Login](#login)
2. [Logout](#logout)
3. [Application](#application)
1. [Get application version](#get-application-version)
2. [Get API version](#get-api-version)
3. [Get build info](#get-build-info)
4. [Shutdown application](#shutdown-application)
5. [Get application preferences](#get-application-preferences)
6. [Set application preferences](#set-application-preferences)
7. [Get default save path](#get-default-save-path)
8. [Get cookies](#get-cookies)
9. [Set cookies](#set-cookies)
10. [Log](#log)
1. [Get log](#get-log)
2. [Get peer log](#get-peer-log)
3. [Sync](#sync)
1. [Get main data](#get-main-data)
2. [Get torrent peers data](#get-torrent-peers-data)
3. [Transfer info](#transfer-info)
1. [Get global transfer info](#get-global-transfer-info)
2. [Get alternative speed limits state](#get-alternative-speed-limits-state)
3. [Toggle alternative speed limits](#toggle-alternative-speed-limits)
4. [Get global download limit](#get-global-download-limit)
5. [Set global download limit](#set-global-download-limit)
6. [Get global upload limit](#get-global-upload-limit)
7. [Set global upload limit](#set-global-upload-limit)
8. [Ban peers](#ban-peers)
9. [Torrent management](#torrent-management)
1. [Get torrent list](#get-torrent-list)
2. [Get torrent generic properties](#get-torrent-generic-properties)
3. [Get torrent trackers](#get-torrent-trackers)
4. [Get torrent web seeds](#get-torrent-web-seeds)
5. [Get torrent contents](#get-torrent-contents)
6. [Get torrent pieces' states](#get-torrent-pieces-states)
7. [Get torrent pieces' hashes](#get-torrent-pieces-hashes)
8. [Pause torrents](#pause-torrents)
9. [Resume torrents](#resume-torrents)
10. [Delete torrents](#delete-torrents)
11. [Recheck torrents](#recheck-torrents)
12. [Reannounce torrents](#reannounce-torrents)
13. [Edit trackers](#edit-trackers)
14. [Remove trackers](#remove-trackers)
15. [Add peers](#add-peers)
16. [Add new torrent](#add-new-torrent)
17. [Add trackers to torrent](#add-trackers-to-torrent)
18. [Increase torrent priority](#increase-torrent-priority)
19. [Decrease torrent priority](#decrease-torrent-priority)
20. [Maximal torrent priority](#maximal-torrent-priority)
21. [Minimal torrent priority](#minimal-torrent-priority)
22. [Set file priority](#set-file-priority)
23. [Get torrent download limit](#get-torrent-download-limit)
24. [Set torrent download limit](#set-torrent-download-limit)
25. [Set torrent share limit](#set-torrent-share-limit)
26. [Get torrent upload limit](#get-torrent-upload-limit)
27. [Set torrent upload limit](#set-torrent-upload-limit)
28. [Set torrent location](#set-torrent-location)
29. [Set torrent name](#set-torrent-name)
30. [Set torrent category](#set-torrent-category)
31. [Get all categories](#get-all-categories)
32. [Add new category](#add-new-category)
33. [Edit category](#edit-category)
34. [Remove categories](#remove-categories)
35. [Add torrent tags](#add-torrent-tags)
36. [Remove torrent tags](#remove-torrent-tags)
37. [Get all tags](#get-all-tags)
38. [Create tags](#create-tags)
39. [Delete tags](#delete-tags)
40. [Set automatic torrent management](#set-automatic-torrent-management)
41. [Toggle sequential download](#toggle-sequential-download)
42. [Set first/last piece priority](#set-firstlast-piece-priority)
43. [Set force start](#set-force-start)
44. [Set super seeding](#set-super-seeding)
45. [Rename file](#rename-file)
46. [Rename folder](#rename-folder)
47. [RSS (experimental)](#rss-experimental)
1. [Add folder](#add-folder)
2. [Add feed](#add-feed)
3. [Remove item](#remove-item)
4. [Move item](#move-item)
5. [Get all items](#get-all-items)
6. [Mark as read](#mark-as-read)
7. [Refresh item](#refresh-item)
8. [Set auto-downloading rule](#set-auto-downloading-rule)
9. [Rename auto-downloading rule](#rename-auto-downloading-rule)
10. [Remove auto-downloading rule](#remove-auto-downloading-rule)
11. [Get all auto-downloading rules](#get-all-auto-downloading-rules)
12. [Get all articles matching a rule](#get-all-articles-matching-a-rule)
13. [Search](#search)
1. [Start search](#start-search)
2. [Stop search](#stop-search)
3. [Get search status](#get-search-status)
4. [Get search results](#get-search-results)
5. [Delete search](#delete-search)
6. [Get search plugins](#get-search-plugins)
7. [Install search plugin](#install-search-plugin)
8. [Uninstall search plugin](#uninstall-search-plugin)
9. [Enable search plugin](#enable-search-plugin)
10. [Update search plugins](#update-search-plugins)
11. [WebAPI versioning](#webapi-versioning)
# Changes
[](#changes)
## API v2.9.3
[](#api-v293)
* Added `reannounce` to `/torrents/info` ([#19571](https://github.com/qbittorrent/qBittorrent/pull/19571))
## API v2.11.3
[](#api-v2113)
* Add APIs for managing cookies` ([#21340](https://github.com/qbittorrent/qBittorrent/pull/21340))
* Remove `cookie` field from `/torrents/add` request
# General Information
[](#general-information)
* All API methods follows the format `/api/v2/APIName/methodName`, where `APIName` is a certain subgroup of API methods whose functionality is related.
* All API methods only allows `GET` or `POST` methods. Use `POST` when you are mutating some state (or when your request is too big to fit into `GET`) and use `GET` otherwise. Starting with qBittorrent v4.4.4, server will return `405 Method Not Allowed` when you used the wrong request method.
* All API methods require [authentication](#authentication) (except `/api/v2/auth/login`, obviously).
# Authentication
[](#authentication)
All Authentication API methods are under "auth", e.g.: `/api/v2/auth/methodName`.
qBittorrent uses cookie-based authentication.
## Login
[](#login)
Name: `login`
**Parameters:**
|Parameter|Type|Description|
|`username`|string|Username used to access the WebUI|
|`password`|string|Password used to access the WebUI|
**Returns:**
|HTTP Status Code|Scenario|
|403|User's IP is banned for too many failed login attempts|
|200|All other scenarios|
Upon success, the response will contain a cookie with your SID. You must supply the cookie whenever you want to perform an operation that requires authentication.
Example showing how to login and execute a command that requires authentication using `curl`:
```
$ curl -i --header 'Referer: http://localhost:8080' --data 'username=admin&password=adminadmin' http://localhost:8080/api/v2/auth/login
HTTP/1.1 200 OK
Content-Encoding:
Content-Length: 3
Content-Type: text/plain; charset=UTF-8
Set-Cookie: SID=hBc7TxF76ERhvIw0jQQ4LZ7Z1jQUV0tQ; path=/
$ curl http://localhost:8080/api/v2/torrents/info --cookie "SID=hBc7TxF76ERhvIw0jQQ4LZ7Z1jQUV0tQ"
```
Note: Set `Referer` or `Origin` header to the exact same domain and port as used in the HTTP query `Host` header.
## Logout
[](#logout)
Name: `logout`
**Parameters:**
None
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
# Application
[](#application)
All Application API methods are under "app", e.g.: `/api/v2/app/methodName`.
## Get application version
[](#get-application-version)
Name: `version`
**Parameters:**
None
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
The response is a string with the application version, e.g. `v4.1.3`
## Get API version
[](#get-api-version)
Name: `webapiVersion`
**Parameters:**
None
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
The response is a string with the WebAPI version, e.g. `2.0`
## Get build info
[](#get-build-info)
Name: `buildInfo`
**Parameters:**
None
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios- see JSON below|
The response is a JSON object containing the following fields
|Property|Type|Description|
|`qt`|string|QT version|
|`libtorrent`|string|libtorrent version|
|`boost`|string|Boost version|
|`openssl`|string|OpenSSL version|
|`bitness`|int|Application bitness (e.g. 64-bit)|
## Shutdown application
[](#shutdown-application)
Name: `shutdown`
**Parameters:**
None
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Get application preferences
[](#get-application-preferences)
Name: `preferences`
**Parameters:**
None
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios- see JSON below|
The response is a JSON object with several fields (key-value) pairs representing the application's settings. The contents may vary depending on which settings are present in qBittorrent.ini.
Possible fields:
|Property|Type|Description|
|`locale`|string|Currently selected language (e.g. en\_GB for English)|
|`create\_subfolder\_enabled`|bool|True if a subfolder should be created when adding a torrent|
|`start\_paused\_enabled`|bool|True if torrents should be added in a Paused state|
|`auto\_delete\_mode`|integer|TODO|
|`preallocate\_all`|bool|True if disk space should be pre-allocated for all files|
|`incomplete\_files\_ext`|bool|True if ".!qB" should be appended to incomplete files|
|`auto\_tmm\_enabled`|bool|True if Automatic Torrent Management is enabled by default|
|`torrent\_changed\_tmm\_enabled`|bool|True if torrent should be relocated when its Category changes|
|`save\_path\_changed\_tmm\_enabled`|bool|True if torrent should be relocated when the default save path changes|
|`category\_changed\_tmm\_enabled`|bool|True if torrent should be relocated when its Category's save path changes|
|`save\_path`|string|Default save path for torrents, separated by slashes|
|`temp\_path\_enabled`|bool|True if folder for incomplete torrents is enabled|
|`temp\_path`|string|Path for incomplete torrents, separated by slashes|
|`scan\_dirs`|object|Property: directory to watch for torrent files, value: where torrents loaded from this directory should be downloaded to (see list of possible values below). Slashes are used as path separators; multiple key/value pairs can be specified|
|`export\_dir`|string|Path to directory to copy .torrent files to. Slashes are used as path separators|
|`export\_dir\_fin`|string|Path to directory to copy .torrent files of completed downloads to. Slashes are used as path separators|
|`mail\_notification\_enabled`|bool|True if e-mail notification should be enabled|
|`mail\_notification\_sender`|string|e-mail where notifications should originate from|
|`mail\_notification\_email`|string|e-mail to send notifications to|
|`mail\_notification\_smtp`|string|smtp server for e-mail notifications|
|`mail\_notification\_ssl\_enabled`|bool|True if smtp server requires SSL connection|
|`mail\_notification\_auth\_enabled`|bool|True if smtp server requires authentication|
|`mail\_notification\_username`|string|Username for smtp authentication|
|`mail\_notification\_password`|string|Password for smtp authentication|
|`autorun\_enabled`|bool|True if external program should be run after torrent has finished downloading|
|`autorun\_program`|string|Program path/name/arguments to run if `autorun\_enabled` is enabled; path is separated by slashes; you can use `%f` and `%n` arguments, which will be expanded by qBittorrent as path\_to\_torrent\_file and torrent\_name (from the GUI; not the .torrent file name) respectively|
|`queueing\_enabled`|bool|True if torrent queuing is enabled|
|`max\_active\_downloads`|integer|Maximum number of active simultaneous downloads|
|`max\_active\_torrents`|integer|Maximum number of active simultaneous downloads and uploads|
|`max\_active\_uploads`|integer|Maximum number of active simultaneous uploads|
|`dont\_count\_slow\_torrents`|bool|If true torrents w/o any activity (stalled ones) will not be counted towards `max\_active\_\*` limits; see [dont\_count\_slow\_torrents](https://www.libtorrent.org/reference-Settings.html#dont_count_slow_torrents) for more information|
|`slow\_torrent\_dl\_rate\_threshold`|integer|Download rate in KiB/s for a torrent to be considered "slow"|
|`slow\_torrent\_ul\_rate\_threshold`|integer|Upload rate in KiB/s for a torrent to be considered "slow"|
|`slow\_torrent\_inactive\_timer`|integer|Seconds a torrent should be inactive before considered "slow"|
|`max\_ratio\_enabled`|bool|True if share ratio limit is enabled|
|`max\_ratio`|float|Get the global share ratio limit|
|`max\_ratio\_act`|integer|Action performed when a torrent reaches the maximum share ratio. See list of possible values here below.|
|`listen\_port`|integer|Port for incoming connections|
|`upnp`|bool|True if UPnP/NAT-PMP is enabled|
|`random\_port`|bool|True if the port is randomly selected|
|`dl\_limit`|integer|Global download speed limit in KiB/s; `-1` means no limit is applied|
|`up\_limit`|integer|Global upload speed limit in KiB/s; `-1` means no limit is applied|
|`max\_connec`|integer|Maximum global number of simultaneous connections|
|`max\_connec\_per\_torrent`|integer|Maximum number of simultaneous connections per torrent|
|`max\_uploads`|integer|Maximum number of upload slots|
|`max\_uploads\_per\_torrent`|integer|Maximum number of upload slots per torrent|
|`stop\_tracker\_timeout`|integer|Timeout in seconds for a `stopped` announce request to trackers|
|`enable\_piece\_extent\_affinity`|bool|True if the advanced libtorrent option `piece\_extent\_affinity` is enabled|
|`bittorrent\_protocol`|integer|Bittorrent Protocol to use (see list of possible values below)|
|`limit\_utp\_rate`|bool|True if `[du]l\_limit` should be applied to uTP connections; this option is only available in qBittorrent built against libtorrent version 0.16.X and higher|
|`limit\_tcp\_overhead`|bool|True if `[du]l\_limit` should be applied to estimated TCP overhead (service data: e.g. packet headers)|
|`limit\_lan\_peers`|bool|True if `[du]l\_limit` should be applied to peers on the LAN|
|`alt\_dl\_limit`|integer|Alternative global download speed limit in KiB/s|
|`alt\_up\_limit`|integer|Alternative global upload speed limit in KiB/s|
|`scheduler\_enabled`|bool|True if alternative limits should be applied according to schedule|
|`schedule\_from\_hour`|integer|Scheduler starting hour|
|`schedule\_from\_min`|integer|Scheduler starting minute|
|`schedule\_to\_hour`|integer|Scheduler ending hour|
|`schedule\_to\_min`|integer|Scheduler ending minute|
|`scheduler\_days`|integer|Scheduler days. See possible values here below|
|`dht`|bool|True if DHT is enabled|
|`pex`|bool|True if PeX is enabled|
|`lsd`|bool|True if LSD is enabled|
|`encryption`|integer|See list of possible values here below|
|`anonymous\_mode`|bool|If true anonymous mode will be enabled; read more [here](Anonymous-Mode); this option is only available in qBittorrent built against libtorrent version 0.16.X and higher|
|`proxy\_type`|integer|See list of possible values here below|
|`proxy\_ip`|string|Proxy IP address or domain name|
|`proxy\_port`|integer|Proxy port|
|`proxy\_peer\_connections`|bool|True if peer and web seed connections should be proxified; this option will have any effect only in qBittorrent built against libtorrent version 0.16.X and higher|
|`proxy\_auth\_enabled`|bool|True proxy requires authentication; doesn't apply to SOCKS4 proxies|
|`proxy\_username`|string|Username for proxy authentication|
|`proxy\_password`|string|Password for proxy authentication|
|`proxy\_torrents\_only`|bool|True if proxy is only used for torrents|
|`ip\_filter\_enabled`|bool|True if external IP filter should be enabled|
|`ip\_filter\_path`|string|Path to IP filter file (.dat, .p2p, .p2b files are supported); path is separated by slashes|
|`ip\_filter\_trackers`|bool|True if IP filters are applied to trackers|
|`web\_ui\_domain\_list`|string|Semicolon-separated list of domains to accept when performing Host header validation|
|`web\_ui\_address`|string|IP address to use for the WebUI|
|`web\_ui\_port`|integer|WebUI port|
|`web\_ui\_upnp`|bool|True if UPnP is used for the WebUI port|
|`web\_ui\_username`|string|WebUI username|
|`web\_ui\_password`|string|For API ≥ v2.3.0: Plaintext WebUI password, not readable, write-only. For API \< v2.3.0: MD5 hash of WebUI password, hash is generated from the following string: `username:Web UI Access:plain\_text\_web\_ui\_password`|
|`web\_ui\_csrf\_protection\_enabled`|bool|True if WebUI CSRF protection is enabled|
|`web\_ui\_clickjacking\_protection\_enabled`|bool|True if WebUI clickjacking protection is enabled|
|`web\_ui\_secure\_cookie\_enabled`|bool|True if WebUI cookie `Secure` flag is enabled|
|`web\_ui\_max\_auth\_fail\_count`|integer|Maximum number of authentication failures before WebUI access ban|
|`web\_ui\_ban\_duration`|integer|WebUI access ban duration in seconds|
|`web\_ui\_session\_timeout`|integer|Seconds until WebUI is automatically signed off|
|`web\_ui\_host\_header\_validation\_enabled`|bool|True if WebUI host header validation is enabled|
|`bypass\_local\_auth`|bool|True if authentication challenge for loopback address (127.0.0.1) should be disabled|
|`bypass\_auth\_subnet\_whitelist\_enabled`|bool|True if webui authentication should be bypassed for clients whose ip resides within (at least) one of the subnets on the whitelist|
|`bypass\_auth\_subnet\_whitelist`|string|(White)list of ipv4/ipv6 subnets for which webui authentication should be bypassed; list entries are separated by commas|
|`alternative\_webui\_enabled`|bool|True if an alternative WebUI should be used|
|`alternative\_webui\_path`|string|File path to the alternative WebUI|
|`use\_https`|bool|True if WebUI HTTPS access is enabled|
|`ssl\_key`|string|For API \< v2.0.1: SSL keyfile contents (this is a not a path)|
|`ssl\_cert`|string|For API \< v2.0.1: SSL certificate contents (this is a not a path)|
|`web\_ui\_https\_key\_path`|string|For API ≥ v2.0.1: Path to SSL keyfile|
|`web\_ui\_https\_cert\_path`|string|For API ≥ v2.0.1: Path to SSL certificate|
|`dyndns\_enabled`|bool|True if server DNS should be updated dynamically|
|`dyndns\_service`|integer|See list of possible values here below|
|`dyndns\_username`|string|Username for DDNS service|
|`dyndns\_password`|string|Password for DDNS service|
|`dyndns\_domain`|string|Your DDNS domain name|
|`rss\_refresh\_interval`|integer|RSS refresh interval|
|`rss\_max\_articles\_per\_feed`|integer|Max stored articles per RSS feed|
|`rss\_processing\_enabled`|bool|Enable processing of RSS feeds|
|`rss\_auto\_downloading\_enabled`|bool|Enable auto-downloading of torrents from the RSS feeds|
|`rss\_download\_repack\_proper\_episodes`|bool|For API ≥ v2.5.1: Enable downloading of repack/proper Episodes|
|`rss\_smart\_episode\_filters`|string|For API ≥ v2.5.1: List of RSS Smart Episode Filters|
|`add\_trackers\_enabled`|bool|Enable automatic adding of trackers to new torrents|
|`add\_trackers`|string|List of trackers to add to new torrent|
|`web\_ui\_use\_custom\_http\_headers\_enabled`|bool|For API ≥ v2.5.1: Enable custom http headers|
|`web\_ui\_custom\_http\_headers`|string|For API ≥ v2.5.1: List of custom http headers|
|`max\_seeding\_time\_enabled`|bool|True enables max seeding time|
|`max\_seeding\_time`|integer|Number of minutes to seed a torrent|
|`announce\_ip`|string|TODO|
|`announce\_to\_all\_tiers`|bool|True always announce to all tiers|
|`announce\_to\_all\_trackers`|bool|True always announce to all trackers in a tier|
|`async\_io\_threads`|integer|Number of asynchronous I/O threads|
|`banned\_IPs`|string|List of banned IPs|
|`checking\_memory\_use`|integer|Outstanding memory when checking torrents in MiB|
|`current\_interface\_address`|string|IP Address to bind to. Empty String means All addresses|
|`current\_network\_interface`|string|Network Interface used|
|`disk\_cache`|integer|Disk cache used in MiB|
|`disk\_cache\_ttl`|integer|Disk cache expiry interval in seconds|
|`embedded\_tracker\_port`|integer|Port used for embedded tracker|
|`enable\_coalesce\_read\_write`|bool|True enables coalesce reads & writes|
|`enable\_embedded\_tracker`|bool|True enables embedded tracker|
|`enable\_multi\_connections\_from\_same\_ip`|bool|True allows multiple connections from the same IP address|
|`enable\_os\_cache`|bool|True enables os cache|
|`enable\_upload\_suggestions`|bool|True enables sending of upload piece suggestions|
|`file\_pool\_size`|integer|File pool size|
|`outgoing\_ports\_max`|integer|Maximal outgoing port (0: Disabled)|
|`outgoing\_ports\_min`|integer|Minimal outgoing port (0: Disabled)|
|`recheck\_completed\_torrents`|bool|True rechecks torrents on completion|
|`resolve\_peer\_countries`|bool|True resolves peer countries|
|`save\_resume\_data\_interval`|integer|Save resume data interval in min|
|`send\_buffer\_low\_watermark`|integer|Send buffer low watermark in KiB|
|`send\_buffer\_watermark`|integer|Send buffer watermark in KiB|
|`send\_buffer\_watermark\_factor`|integer|Send buffer watermark factor in percent|
|`socket\_backlog\_size`|integer|Socket backlog size|
|`upload\_choking\_algorithm`|integer|Upload choking algorithm used (see list of possible values below)|
|`upload\_slots\_behavior`|integer|Upload slots behavior used (see list of possible values below)|
|`upnp\_lease\_duration`|integer|UPnP lease duration (0: Permanent lease)|
|`utp\_tcp\_mixed\_mode`|integer|μTP-TCP mixed mode algorithm (see list of possible values below)|
Possible values of `scan\_dirs`:
|Value|Description|
|`0`|Download to the monitored folder|
|`1`|Download to the default save path|
|`"/path/to/download/to"`|Download to this path|
Possible values of `scheduler\_days`:
|Value|Description|
|`0`|Every day|
|`1`|Every weekday|
|`2`|Every weekend|
|`3`|Every Monday|
|`4`|Every Tuesday|
|`5`|Every Wednesday|
|`6`|Every Thursday|
|`7`|Every Friday|
|`8`|Every Saturday|
|`9`|Every Sunday|
Possible values of `encryption`:
|Value|Description|
|`0`|Prefer encryption|
|`1`|Force encryption on|
|`2`|Force encryption off|
NB: the first options allows you to use both encrypted and unencrypted connections (this is the default); other options are mutually exclusive: e.g. by forcing encryption on you won't be able to use unencrypted connections and vice versa.
Possible values of `proxy\_type`:
|Value|Description|
|`-1`|Proxy is disabled|
|`1`|HTTP proxy without authentication|
|`2`|SOCKS5 proxy without authentication|
|`3`|HTTP proxy with authentication|
|`4`|SOCKS5 proxy with authentication|
|`5`|SOCKS4 proxy without authentication|
Possible values of `dyndns\_service`:
|Value|Description|
|`0`|Use DyDNS|
|`1`|Use NOIP|
Possible values of `max\_ratio\_act`:
|Value|Description|
|`0`|Pause torrent|
|`1`|Remove torrent|
Possible values of `bittorrent\_protocol`:
|Value|Description|
|`0`|TCP and μTP|
|`1`|TCP|
|`2`|μTP|
Possible values of `upload\_choking\_algorithm`:
|Value|Description|
|`0`|Round-robin|
|`1`|Fastest upload|
|`2`|Anti-leech|
Possible values of `upload\_slots\_behavior`:
|Value|Description|
|`0`|Fixed slots|
|`1`|Upload rate based|
Possible values of `utp\_tcp\_mixed\_mode`:
|Value|Description|
|`0`|Prefer TCP|
|`1`|Peer proportional|
Example:
```
{
"add\_trackers": "",
"add\_trackers\_enabled": false,
"alt\_dl\_limit": 10240,
"alt\_up\_limit": 10240,
"alternative\_webui\_enabled": false,
"alternative\_webui\_path": "/home/user/Documents/qbit-webui",
"announce\_ip": "",
"announce\_to\_all\_tiers": true,
"announce\_to\_all\_trackers": false,
"anonymous\_mode": false,
"async\_io\_threads": 4,
"auto\_delete\_mode": 0,
"auto\_tmm\_enabled": false,
"autorun\_enabled": false,
"autorun\_program": "",
"banned\_IPs": "",
"bittorrent\_protocol": 0,
"bypass\_auth\_subnet\_whitelist": "",
"bypass\_auth\_subnet\_whitelist\_enabled": false,
"bypass\_local\_auth": false,
"category\_changed\_tmm\_enabled": false,
"checking\_memory\_use": 32,
"create\_subfolder\_enabled": true,
"current\_interface\_address": "",
"current\_network\_interface": "",
"dht": true,
"disk\_cache": -1,
"disk\_cache\_ttl": 60,
"dl\_limit": 0,
"dont\_count\_slow\_torrents": false,
"dyndns\_domain": "changeme.dyndns.org",
"dyndns\_enabled": false,
"dyndns\_password": "",
"dyndns\_service": 0,
"dyndns\_username": "",
"embedded\_tracker\_port": 9000,
"enable\_coalesce\_read\_write": false,
"enable\_embedded\_tracker": false,
"enable\_multi\_connections\_from\_same\_ip": false,
"enable\_os\_cache": true,
"enable\_piece\_extent\_affinity": false,
"enable\_upload\_suggestions": false,
"encryption": 0,
"export\_dir": "/home/user/Downloads/all",
"export\_dir\_fin": "/home/user/Downloads/completed",
"file\_pool\_size": 40,
"incomplete\_files\_ext": false,
"ip\_filter\_enabled": false,
"ip\_filter\_path": "",
"ip\_filter\_trackers": false,
"limit\_lan\_peers": true,
"limit\_tcp\_overhead": false,
"limit\_utp\_rate": true,
"listen\_port": 58925,
"locale": "en",
"lsd": true,
"mail\_notification\_auth\_enabled": false,
"mail\_notification\_email": "",
"mail\_notification\_enabled": false,
"mail\_notification\_password": "",
"mail\_notification\_sender": "qBittorrent\_notification@example.com",
"mail\_notification\_smtp": "smtp.changeme.com",
"mail\_notification\_ssl\_enabled": false,
"mail\_notification\_username": "",
"max\_active\_downloads": 3,
"max\_active\_torrents": 5,
"max\_active\_uploads": 3,
"max\_connec": 500,
"max\_connec\_per\_torrent": 100,
"max\_ratio": -1,
"max\_ratio\_act": 0,
"max\_ratio\_enabled": false,
"max\_seeding\_time": -1,
"max\_seeding\_time\_enabled": false,
"max\_uploads": -1,
"max\_uploads\_per\_torrent": -1,
"outgoing\_ports\_max": 0,
"outgoing\_ports\_min": 0,
"pex": true,
"preallocate\_all": false,
"proxy\_auth\_enabled": false,
"proxy\_ip": "0.0.0.0",
"proxy\_password": "",
"proxy\_peer\_connections": false,
"proxy\_port": 8080,
"proxy\_torrents\_only": false,
"proxy\_type": 0,
"proxy\_username": "",
"queueing\_enabled": false,
"random\_port": false,
"recheck\_completed\_torrents": false,
"resolve\_peer\_countries": true,
"rss\_auto\_downloading\_enabled":true,
"rss\_download\_repack\_proper\_episodes":true,
"rss\_max\_articles\_per\_feed":50,
"rss\_processing\_enabled":true,
"rss\_refresh\_interval":30,
"rss\_smart\_episode\_filters":"s(\\\\d+)e(\\\\d+)\\n(\\\\d+)x(\\\\d+)\\n(\\\\d{4}[.\\\\-]\\\\d{1,2}[.\\\\-]\\\\d{1,2})",
"save\_path": "/home/user/Downloads/",
"save\_path\_changed\_tmm\_enabled": false,
"save\_resume\_data\_interval": 60,
"scan\_dirs":
{
"/home/user/Downloads/incoming/games": 0,
"/home/user/Downloads/incoming/movies": 1,
},
"schedule\_from\_hour": 8,
"schedule\_from\_min": 0,
"schedule\_to\_hour": 20,
"schedule\_to\_min": 0,
"scheduler\_days": 0,
"scheduler\_enabled": false,
"send\_buffer\_low\_watermark": 10,
"send\_buffer\_watermark": 500,
"send\_buffer\_watermark\_factor": 50,
"slow\_torrent\_dl\_rate\_threshold": 2,
"slow\_torrent\_inactive\_timer": 60,
"slow\_torrent\_ul\_rate\_threshold": 2,
"socket\_backlog\_size": 30,
"start\_paused\_enabled": false,
"stop\_tracker\_timeout": 1,
"temp\_path": "/home/user/Downloads/temp",
"temp\_path\_enabled": false,
"torrent\_changed\_tmm\_enabled": true,
"up\_limit": 0,
"upload\_choking\_algorithm": 1,
"upload\_slots\_behavior": 0,
"upnp": true,
"use\_https": false,
"utp\_tcp\_mixed\_mode": 0,
"web\_ui\_address": "\*",
"web\_ui\_ban\_duration": 3600,
"web\_ui\_clickjacking\_protection\_enabled": true,
"web\_ui\_csrf\_protection\_enabled": true,
"web\_ui\_custom\_http\_headers": "",
"web\_ui\_domain\_list": "\*",
"web\_ui\_host\_header\_validation\_enabled": true,
"web\_ui\_https\_cert\_path": "",
"web\_ui\_https\_key\_path": "",
"web\_ui\_max\_auth\_fail\_count": 5,
"web\_ui\_port": 8080,
"web\_ui\_secure\_cookie\_enabled": true,
"web\_ui\_session\_timeout": 3600,
"web\_ui\_upnp": false,
"web\_ui\_use\_custom\_http\_headers\_enabled": false,
"web\_ui\_username": "admin"
}
```
## Set application preferences
[](#set-application-preferences)
Name: `setPreferences`
**Parameters:**
A json object with key-value pairs of the settings you want to change and their new values.
Example:
```
json={"save\_path":"C:/Users/Dayman/Downloads","queueing\_enabled":false,"scan\_dirs":{"C:/Games": 0,"D:/Downloads": 1}}
```
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
**Notes**:
1. There is no need to pass all possible preferences' `token:value` pairs if you only want to change one option
2. Paths in `scan\_dirs` must exist, otherwise this option will have no effect
3. String values must be quoted; integer and boolean values must never be quoted
For a list of possible preference options see [Get application preferences](#get-application-preferences)
## Get default save path
[](#get-default-save-path)
Name: `defaultSavePath`
**Parameters:**
None
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
The response is a string with the default save path, e.g. `C:/Users/Dayman/Downloads`.
## Get cookies
[](#get-cookies)
Name: `cookies`
**Parameters:**
None
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
The response is a JSON array in which each element is an entry of the log.
Each element of the array has the following properties:
|Property|Type|Description|
|`name`|string|Cookie name|
|`domain`|string|Cookie domain|
|`path`|string|Cookie path|
|`value`|string|Cookie value|
|`expirationDate`|integer|Seconds since epoch|
Example:
```
[
{
"name":"Example",
"domain":"example.com",
"path":"/",
"value":"foo=bar"
"expirationDate":1507969127,
},
]
```
## Set cookies
[](#set-cookies)
Name: `setCookies`
**Parameters:**
A json array of cookies to send when downloading .torrent files.
Each element of the array has the following properties:
|Property|Type|Description|
|`name`|string?|Cookie name|
|`domain`|string?|Cookie domain|
|`path`|string?|Cookie path|
|`value`|string?|Cookie value|
|`expirationDate`|integer?|Seconds since epoch|
**Returns:**
|HTTP Status Code|Scenario|
|200|Cookies were saved|
|400|Request was not a valid json array of cookie objects|
# Log
[](#log)
All Log API methods are under "log", e.g.: `/api/v2/log/methodName`.
## Get log
[](#get-log)
Name: `main`
**Parameters:**
|Parameter|Type|Description|
|`normal`|bool|Include normal messages (default: `true`)|
|`info`|bool|Include info messages (default: `true`)|
|`warning`|bool|Include warning messages (default: `true`)|
|`critical`|bool|Include critical messages (default: `true`)|
|`last\_known\_id`|integer|Exclude messages with "message id" \<= `last\_known\_id` (default: `-1`)|
Example:
```
/api/v2/log/main?normal=true&info=true&warning=true&critical=true&last\_known\_id=-1
```
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios- see JSON below|
The response is a JSON array in which each element is an entry of the log.
Each element of the array has the following properties:
|Property|Type|Description|
|`id`|integer|ID of the message|
|`message`|string|Text of the message|
|`timestamp`|integer|Seconds since epoch (Note: switched from milliseconds to seconds in v4.5.0)|
|`type`|integer|Type of the message: Log::NORMAL: `1`, Log::INFO: `2`, Log::WARNING: `4`, Log::CRITICAL: `8`|
Example:
```
[
{
"id":0,
"message":"qBittorrent v3.4.0 started",
"timestamp":1507969127,
"type":1
},
{
"id":1,
"message":"qBittorrent is trying to listen on any interface port: 19036",
"timestamp":1507969127,
"type":2
},
{
"id":2,
"message":"Peer ID: -qB3400-",
"timestamp":1507969127,
"type":1
},
{
"id":3,
"message":"HTTP User-Agent is 'qBittorrent/3.4.0'",
"timestamp":1507969127,
"type":1
},
{
"id":4,
"message":"DHT support [ON]",
"timestamp":1507969127,
"type":2
},
{
"id":5,
"message":"Local Peer Discovery support [ON]",
"timestamp":1507969127,
"type":2
},
{
"id":6,
"message":"PeX support [ON]",
"timestamp":1507969127,
"type":2
},
{
"id":7,
"message":"Anonymous mode [OFF]",
"timestamp":1507969127,
"type":2
},
{
"id":8,
"message":"Encryption support [ON]",
"timestamp":1507969127,
"type":2
},
{
"id":9,
"message":"Embedded Tracker [OFF]",
"timestamp":1507969127,
"type":2
},
{
"id":10,
"message":"UPnP / NAT-PMP support [ON]",
"timestamp":1507969127,
"type":2
},
{
"id":11,
"message":"Web UI: Now listening on port 8080",
"timestamp":1507969127,
"type":1
},
{
"id":12,
"message":"Options were saved successfully.",
"timestamp":1507969128,
"type":1
},
{
"id":13,
"message":"qBittorrent is successfully listening on interface :: port: TCP/19036",
"timestamp":1507969128,
"type":2
},
{
"id":14,
"message":"qBittorrent is successfully listening on interface 0.0.0.0 port: TCP/19036",
"timestamp":1507969128,
"type":2
},
{
"id":15,
"message":"qBittorrent is successfully listening on interface 0.0.0.0 port: UDP/19036",
"timestamp":1507969128,
"type":2
}
]
```
## Get peer log
[](#get-peer-log)
Name: `peers`
**Parameters:**
|Parameter|Type|Description|
|`last\_known\_id`|integer|Exclude messages with "message id" \<= `last\_known\_id` (default: `-1`)|
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios- see JSON below|
The response a JSON array. Each element of the array of objects (each object is the information relative to a peer) containing the following fields
|Property|Type|Description|
|`id`|integer|ID of the peer|
|`ip`|string|IP of the peer|
|`timestamp`|integer|Seconds since epoch|
|`blocked`|boolean|Whether or not the peer was blocked|
|`reason`|string|Reason of the block|
# Sync
[](#sync)
Sync API implements requests for obtaining changes since the last request.
All Sync API methods are under "sync", e.g.: `/api/v2/sync/methodName`.
## Get main data
[](#get-main-data)
Name: `maindata`
**Parameters:**
|Parameter|Type|Description|
|`rid`|integer|Response ID. If not provided, `rid=0` will be assumed. If the given `rid` is different from the one of last server reply, `full\_update` will be `true` (see the server reply details for more info)|
Example:
```
/api/v2/sync/maindata?rid=14
```
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios- see JSON below|
The response is a JSON object with the following possible fields
|Property|Type|Description|
|`rid`|integer|Response ID|
|`full\_update`|bool|Whether the response contains all the data or partial data|
|`torrents`|object|Property: torrent hash, value: same as [torrent list](#get-torrent-list)|
|`torrents\_removed`|array|List of hashes of torrents removed since last request|
|`categories`|object|Info for categories added since last request|
|`categories\_removed`|array|List of categories removed since last request|
|`tags`|array|List of tags added since last request|
|`tags\_removed`|array|List of tags removed since last request|
|`server\_state`|object|Global transfer info|
Example:
```
{
"rid":15,
"torrents":
{
"8c212779b4abde7c6bc608063a0d008b7e40ce32":
{
"state":"pausedUP"
}
}
}
```
## Get torrent peers data
[](#get-torrent-peers-data)
Name: `torrentPeers`
**Parameters:**
|Parameter|Type|Description|
|`hash`|string|Torrent hash|
|`rid`|integer|Response ID. If not provided, `rid=0` will be assumed. If the given `rid` is different from the one of last server reply, `full\_update` will be `true` (see the server reply details for more info)|
Example:
```
/api/v2/sync/torrentPeers?hash=8c212779b4abde7c6bc608063a0d008b7e40ce32?rid=14
```
**Returns:**
|HTTP Status Code|Scenario|
|404|Torrent hash was not found|
|200|All other scenarios- see JSON below|
The response is TODO
# Transfer info
[](#transfer-info)
All Transfer info API methods are under "transfer", e.g.: `/api/v2/transfer/methodName`.
## Get global transfer info
[](#get-global-transfer-info)
This method returns info you usually see in qBt status bar.
Name: `info`
**Parameters:**
None
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios- see JSON below|
The response is a JSON object with the following fields
|Property|Type|Description|
|`dl\_info\_speed`|integer|Global download rate (bytes/s)|
|`dl\_info\_data`|integer|Data downloaded this session (bytes)|
|`up\_info\_speed`|integer|Global upload rate (bytes/s)|
|`up\_info\_data`|integer|Data uploaded this session (bytes)|
|`dl\_rate\_limit`|integer|Download rate limit (bytes/s)|
|`up\_rate\_limit`|integer|Upload rate limit (bytes/s)|
|`dht\_nodes`|integer|DHT nodes connected to|
|`connection\_status`|string|Connection status. See possible values here below|
In addition to the above in partial data requests (see [Get partial data](#get-partial-data) for more info):
|Property|Type|Description|
|`queueing`|bool|True if torrent queueing is enabled|
|`use\_alt\_speed\_limits`|bool|True if alternative speed limits are enabled|
|`refresh\_interval`|integer|Transfer list refresh interval (milliseconds)|
Possible values of `connection\_status`:
|Value|
|`connected`|
|`firewalled`|
|`disconnected`|
Example:
```
{
"connection\_status":"connected",
"dht\_nodes":386,
"dl\_info\_data":681521119,
"dl\_info\_speed":0,
"dl\_rate\_limit":0,
"up\_info\_data":10747904,
"up\_info\_speed":0,
"up\_rate\_limit":1048576
}
```
## Get alternative speed limits state
[](#get-alternative-speed-limits-state)
Name: `speedLimitsMode`
**Parameters:**
None
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
The response is `1` if alternative speed limits are enabled, `0` otherwise.
## Toggle alternative speed limits
[](#toggle-alternative-speed-limits)
Name: `toggleSpeedLimitsMode`
**Parameters:**
None
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Get global download limit
[](#get-global-download-limit)
Name: `downloadLimit`
**Parameters:**
None
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
The response is the value of current global download speed limit in bytes/second; this value will be zero if no limit is applied.
## Set global download limit
[](#set-global-download-limit)
Name: `setDownloadLimit`
**Parameters:**
|Parameter|Type|Description|
|`limit`|integer|The global download speed limit to set in bytes/second|
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Get global upload limit
[](#get-global-upload-limit)
Name: `uploadLimit`
**Parameters:**
None
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
The response is the value of current global upload speed limit in bytes/second; this value will be zero if no limit is applied.
## Set global upload limit
[](#set-global-upload-limit)
Name: `setUploadLimit`
**Parameters:**
|Parameter|Type|Description|
|`limit`|integer|The global upload speed limit to set in bytes/second|
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Ban peers
[](#ban-peers)
Name: `banPeers`
**Parameters:**
|Parameter|Type|Description|
|`peers`|string|The peer to ban, or multiple peers separated by a pipe `|`. Each peer is a colon-separated `host:port`|
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
# Torrent management
[](#torrent-management)
All Torrent management API methods are under "torrents", e.g.: `/api/v2/torrents/methodName`.
## Get torrent list
[](#get-torrent-list)
Name: `info`
**Parameters:**
|Parameter|Type|Description|
|`filter`*optional*|string|Filter torrent list by state. Allowed state filters: `all`, `downloading`, `seeding`, `completed`, `stopped`, `active`, `inactive`, `running`, `stalled`, `stalled\_uploading`, `stalled\_downloading`, `errored`|
|`category`*optional*|string|Get torrents with the given category (empty string means "without category"; no "category" parameter means "any category"). Remember to URL-encode the category name. For example, `My category` becomes `My%20category`|
|`tag`*optional*since 2.8.3|string|Get torrents with the given tag (empty string means "without tag"; no "tag" parameter means "any tag". Remember to URL-encode the category name. For example, `My tag` becomes `My%20tag`|
|`sort`*optional*|string|Sort torrents by given key. They can be sorted using any field of the response's JSON array (which are documented below) as the sort key.|
|`reverse`*optional*|bool|Enable reverse sorting. Defaults to `false`|
|`limit`*optional*|integer|Limit the number of torrents returned|
|`offset`*optional*|integer|Set offset (if less than 0, offset from end)|
|`hashes`*optional*|string|Filter by hashes. Can contain multiple hashes separated by `|`|
Example:
```
/api/v2/torrents/info?filter=downloading&category=sample%20category&sort=ratio
```
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios- see JSON below|
The response is a JSON array with the following fields
|Property|Type|Description|
|`added\_on`|integer|Time (Unix Epoch) when the torrent was added to the client|
|`amount\_left`|integer|Amount of data left to download (bytes)|
|`auto\_tmm`|bool|Whether this torrent is managed by Automatic Torrent Management|
|`availability`|float|Percentage of file pieces currently available|
|`category`|string|Category of the torrent|
|`completed`|integer|Amount of transfer data completed (bytes)|
|`completion\_on`|integer|Time (Unix Epoch) when the torrent completed|
|`content\_path`|string|Absolute path of torrent content (root path for multifile torrents, absolute file path for singlefile torrents)|
|`dl\_limit`|integer|Torrent download speed limit (bytes/s). `-1` if unlimited.|
|`dlspeed`|integer|Torrent download speed (bytes/s)|
|`downloaded`|integer|Amount of data downloaded|
|`downloaded\_session`|integer|Amount of data downloaded this session|
|`eta`|integer|Torrent ETA (seconds)|
|`f\_l\_piece\_prio`|bool|True if first last piece are prioritized|
|`force\_start`|bool|True if force start is enabled for this torrent|
|`hash`|string|Torrent hash|
|`isPrivate`|bool|True if torrent is from a private tracker (added in 5.0.0)|
|`last\_activity`|integer|Last time (Unix Epoch) when a chunk was downloaded/uploaded|
|`magnet\_uri`|string|Magnet URI corresponding to this torrent|
|`max\_ratio`|float|Maximum share ratio until torrent is stopped from seeding/uploading|
|`max\_seeding\_time`|integer|Maximum seeding time (seconds) until torrent is stopped from seeding|
|`name`|string|Torrent name|
|`num\_complete`|integer|Number of seeds in the swarm|
|`num\_incomplete`|integer|Number of leechers in the swarm|
|`num\_leechs`|integer|Number of leechers connected to|
|`num\_seeds`|integer|Number of seeds connected to|
|`priority`|integer|Torrent priority. Returns -1 if queuing is disabled or torrent is in seed mode|
|`progress`|float|Torrent progress (percentage/100)|
|`ratio`|float|Torrent share ratio. Max ratio value: 9999.|
|`ratio\_limit`|float|TODO (what is different from `max\_ratio`?)|
|`reannounce`|integer|Time until the next tracker reannounce|
|`save\_path`|string|Path where this torrent's data is stored|
|`seeding\_time`|integer|Torrent elapsed time while complete (seconds)|
|`seeding\_time\_limit`|integer|TODO (what is different from `max\_seeding\_time`?) seeding\_time\_limit is a per torrent setting, when Automatic Torrent Management is disabled, furthermore then max\_seeding\_time is set to seeding\_time\_limit for this torrent. If Automatic Torrent Management is enabled, the value is -2. And if max\_seeding\_time is unset it have a default value -1.|
|`seen\_complete`|integer|Time (Unix Epoch) when this torrent was last seen complete|
|`seq\_dl`|bool|True if sequential download is enabled|
|`size`|integer|Total size (bytes) of files selected for download|
|`state`|string|Torrent state. See table here below for the possible values|
|`super\_seeding`|bool|True if super seeding is enabled|
|`tags`|string|Comma-concatenated tag list of the torrent|
|`time\_active`|integer|Total active time (seconds)|
|`total\_size`|integer|Total size (bytes) of all file in this torrent (including unselected ones)|
|`tracker`|string|The first tracker with working status. Returns empty string if no tracker is working.|
|`up\_limit`|integer|Torrent upload speed limit (bytes/s). `-1` if unlimited.|
|`uploaded`|integer|Amount of data uploaded|
|`uploaded\_session`|integer|Amount of data uploaded this session|
|`upspeed`|integer|Torrent upload speed (bytes/s)|
Possible values of `state`:
|Value|Description|
|`error`|Some error occurred, applies to paused torrents|
|`missingFiles`|Torrent data files is missing|
|`uploading`|Torrent is being seeded and data is being transferred|
|`pausedUP`|Torrent is paused and has finished downloading|
|`queuedUP`|Queuing is enabled and torrent is queued for upload|
|`stalledUP`|Torrent is being seeded, but no connection were made|
|`checkingUP`|Torrent has finished downloading and is being checked|
|`forcedUP`|Torrent is forced to uploading and ignore queue limit|
|`allocating`|Torrent is allocating disk space for download|
|`downloading`|Torrent is being downloaded and data is being transferred|
|`metaDL`|Torrent has just started downloading and is fetching metadata|
|`pausedDL`|Torrent is paused and has NOT finished downloading|
|`queuedDL`|Queuing is enabled and torrent is queued for download|
|`stalledDL`|Torrent is being downloaded, but no connection were made|
|`checkingDL`|Same as checkingUP, but torrent has NOT finished downloading|
|`forcedDL`|Torrent is forced to downloading to ignore queue limit|
|`checkingResumeData`|Checking resume data on qBt startup|
|`moving`|Torrent is moving to another location|
|`unknown`|Unknown status|
Example:
```
[
{
"dlspeed":9681262,
"eta":87,
"f\_l\_piece\_prio":false,
"force\_start":false,
"hash":"8c212779b4abde7c6bc608063a0d008b7e40ce32",
"category":"",
"tags": "",
"name":"debian-8.1.0-amd64-CD-1.iso",
"num\_complete":-1,
"num\_incomplete":-1,
"num\_leechs":2,
"num\_seeds":54,
"priority":1,
"progress":0.16108787059783936,
"ratio":0,
"seq\_dl":false,
"size":657457152,
"state":"downloading",
"super\_seeding":false,
"upspeed":0,
"isPrivate":true
},
{
another\_torrent\_info
}
]
```
## Get torrent generic properties
[](#get-torrent-generic-properties)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
Name: `properties`
**Parameters:**
|Parameter|Type|Description|
|`hash`|string|The hash of the torrent you want to get the generic properties of|
**Returns:**
|HTTP Status Code|Scenario|
|404|Torrent hash was not found|
|200|All other scenarios- see JSON below|
The response is:
* empty, if the torrent hash is invalid
* otherwise, a JSON object with the following fields
|Property|Type|Description|
|`save\_path`|string|Torrent save path|
|`creation\_date`|integer|Torrent creation date (Unix timestamp)|
|`piece\_size`|integer|Torrent piece size (bytes)|
|`comment`|string|Torrent comment|
|`total\_wasted`|integer|Total data wasted for torrent (bytes)|
|`total\_uploaded`|integer|Total data uploaded for torrent (bytes)|
|`total\_uploaded\_session`|integer|Total data uploaded this session (bytes)|
|`total\_downloaded`|integer|Total data downloaded for torrent (bytes)|
|`total\_downloaded\_session`|integer|Total data downloaded this session (bytes)|
|`up\_limit`|integer|Torrent upload limit (bytes/s)|
|`dl\_limit`|integer|Torrent download limit (bytes/s)|
|`time\_elapsed`|integer|Torrent elapsed time (seconds)|
|`seeding\_time`|integer|Torrent elapsed time while complete (seconds)|
|`nb\_connections`|integer|Torrent connection count|
|`nb\_connections\_limit`|integer|Torrent connection count limit|
|`share\_ratio`|float|Torrent share ratio|
|`addition\_date`|integer|When this torrent was added (unix timestamp)|
|`completion\_date`|integer|Torrent completion date (unix timestamp)|
|`created\_by`|string|Torrent creator|
|`dl\_speed\_avg`|integer|Torrent average download speed (bytes/second)|
|`dl\_speed`|integer|Torrent download speed (bytes/second)|
|`eta`|integer|Torrent ETA (seconds)|
|`last\_seen`|integer|Last seen complete date (unix timestamp)|
|`peers`|integer|Number of peers connected to|
|`peers\_total`|integer|Number of peers in the swarm|
|`pieces\_have`|integer|Number of pieces owned|
|`pieces\_num`|integer|Number of pieces of the torrent|
|`reannounce`|integer|Number of seconds until the next announce|
|`seeds`|integer|Number of seeds connected to|
|`seeds\_total`|integer|Number of seeds in the swarm|
|`total\_size`|integer|Torrent total size (bytes)|
|`up\_speed\_avg`|integer|Torrent average upload speed (bytes/second)|
|`up\_speed`|integer|Torrent upload speed (bytes/second)|
|`isPrivate`|bool|True if torrent is from a private tracker|
NB: `-1` is returned if the type of the property is integer but its value is not known.
Example:
```
{
"addition\_date":1438429165,
"comment":"\\"Debian CD from cdimage.debian.org\\"",
"completion\_date":1438429234,
"created\_by":"",
"creation\_date":1433605214,
"dl\_limit":-1,
"dl\_speed":0,
"dl\_speed\_avg":9736015,
"eta":8640000,
"isPrivate":true,
"last\_seen":1438430354,
"nb\_connections":3,
"nb\_connections\_limit":250,
"peers":1,
"peers\_total":89,
"piece\_size":524288,
"pieces\_have":1254,
"pieces\_num":1254,
"reannounce":672,
"save\_path":"/Downloads/debian-8.1.0-amd64-CD-1.iso",
"seeding\_time":1128,
"seeds":1,
"seeds\_total":254,
"share\_ratio":0.00072121022562178299,
"time\_elapsed":1197,
"total\_downloaded":681521119,
"total\_downloaded\_session":681521119,
"total\_size":657457152,
"total\_uploaded":491520,
"total\_uploaded\_session":491520,
"total\_wasted":23481724,
"up\_limit":-1,
"up\_speed":0,
"up\_speed\_avg":410
}
```
## Get torrent trackers
[](#get-torrent-trackers)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
Name: `trackers`
**Parameters:**
|Parameter|Type|Description|
|`hash`|string|The hash of the torrent you want to get the trackers of|
**Returns:**
|HTTP Status Code|Scenario|
|404|Torrent hash was not found|
|200|All other scenarios- see JSON below|
The response is a JSON array, where each element contains info about one tracker, with the following fields
|Property|Type|Description|
|`url`|string|Tracker url|
|`status`|integer|Tracker status. See the table below for possible values|
|`tier`|integer|Tracker priority tier. Lower tier trackers are tried before higher tiers. Tier numbers are valid when `\>= 0`, `\< 0` is used as placeholder when `tier` does not exist for special entries (such as DHT).|
|`num\_peers`|integer|Number of peers for current torrent, as reported by the tracker|
|`num\_seeds`|integer|Number of seeds for current torrent, asreported by the tracker|
|`num\_leeches`|integer|Number of leeches for current torrent, as reported by the tracker|
|`num\_downloaded`|integer|Number of completed downloads for current torrent, as reported by the tracker|
|`msg`|string|Tracker message (there is no way of knowing what this message is - it's up to tracker admins)|
Possible values of `status`:
|Value|Description|
|0|Tracker is disabled (used for DHT, PeX, and LSD)|
|1|Tracker has not been contacted yet|
|2|Tracker has been contacted and is working|
|3|Tracker is updating|
|4|Tracker has been contacted, but it is not working (or doesn't send proper replies)|
Example:
```
[
{
"msg":"",
"num\_peers":100,
"status":2,
"url":"http://bttracker.debian.org:6969/announce"
},
{
another\_tracker\_info
}
]
```
## Get torrent web seeds
[](#get-torrent-web-seeds)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
Name: `webseeds`
**Parameters:**
|Parameter|Type|Description|
|`hash`|string|The hash of the torrent you want to get the webseeds of|
**Returns:**
|HTTP Status Code|Scenario|
|404|Torrent hash was not found|
|200|All other scenarios- see JSON below|
The response is a JSON array, where each element is information about one webseed, with the following fields
|Property|Type|Description|
|`url`|string|URL of the web seed|
Example:
```
[
{
"url":"http://some\_url/"
},
{
"url":"http://some\_other\_url/"
}
]
```
## Get torrent contents
[](#get-torrent-contents)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
Name: `files`
**Parameters:**
|Parameter|Type|Description|
|`hash`|string|The hash of the torrent you want to get the contents of|
|`indexes`*optional*since 2.8.2|string|The indexes of the files you want to retrieve. `indexes` can contain multiple values separated by `|`.|
**Returns:**
|HTTP Status Code|Scenario|
|404|Torrent hash was not found|
|200|All other scenarios- see JSON below|
The response is:
* empty, if the torrent hash is invalid
* otherwise, a JSON array, where each element contains info about one file, with the following fields
|Property|Type|Description|
|`index`since 2.8.2|integer|File index|
|`name`|string|File name (including relative path)|
|`size`|integer|File size (bytes)|
|`progress`|float|File progress (percentage/100)|
|`priority`|integer|File priority. See possible values here below|
|`is\_seed`|bool|True if file is seeding/complete|
|`piece\_range`|integer array|The first number is the starting piece index and the second number is the ending piece index (inclusive)|
|`availability`|float|Percentage of file pieces currently available (percentage/100)|
Possible values of `priority`:
|Value|Description|
|`0`|Do not download|
|`1`|Normal priority|
|`6`|High priority|
|`7`|Maximal priority|
Example:
```
[
{
"index":0,
"is\_seed":false,
"name":"debian-8.1.0-amd64-CD-1.iso",
"piece\_range":[0,1253],
"priority":1,
"progress":0,
"size":657457152,
"availability":0.5,
}
]
```
## Get torrent pieces' states
[](#get-torrent-pieces-states)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
Name: `pieceStates`
**Parameters:**
|Parameter|Type|Description|
|`hash`|string|The hash of the torrent you want to get the pieces' states of|
**Returns:**
|HTTP Status Code|Scenario|
|404|Torrent hash was not found|
|200|All other scenarios- see JSON below|
The response is:
* empty, if the torrent hash is invalid
* otherwise, an array of states (integers) of all pieces (in order) of a specific torrent.
Value meanings are defined as below:
|Value|Description|
|`0`|Not downloaded yet|
|`1`|Now downloading|
|`2`|Already downloaded|
Example:
```
[0,0,2,1,0,0,2,1]
```
## Get torrent pieces' hashes
[](#get-torrent-pieces-hashes)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
Name: `pieceHashes`
**Parameters:**
|Parameter|Type|Description|
|`hash`|string|The hash of the torrent you want to get the pieces' hashes of|
**Returns:**
|HTTP Status Code|Scenario|
|404|Torrent hash was not found|
|200|All other scenarios- see JSON below|
The response is:
* empty, if the torrent hash is invalid
* otherwise, an array of hashes (strings) of all pieces (in order) of a specific torrent.
Example:
```
["54eddd830a5b58480a6143d616a97e3a6c23c439","f8a99d225aa4241db100f88407fc3bdaead583ab","928fb615b9bd4dd8f9e9022552c8f8f37ef76f58"]
```
## Pause torrents
[](#pause-torrents)
Requires knowing the torrent hashes. You can get it from [torrent list](#get-torrent-list).
Name: `stop`
**Parameters:**
|Parameter|Type|Description|
|`hashes`|string|The hashes of the torrents you want to pause. `hashes` can contain multiple hashes separated by `|`, to pause multiple torrents, or set to `all`, to pause all torrents.|
Example:
```
/api/v2/torrents/stop?hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|54eddd830a5b58480a6143d616a97e3a6c23c439
```
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Resume torrents
[](#resume-torrents)
Requires knowing the torrent hashes. You can get it from [torrent list](#get-torrent-list).
Name: `start`
**Parameters:**
|Parameter|Type|Description|
|`hashes`|string|The hashes of the torrents you want to resume. `hashes` can contain multiple hashes separated by `|`, to resume multiple torrents, or set to `all`, to resume all torrents.|
Example:
```
/api/v2/torrents/start?hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|54eddd830a5b58480a6143d616a97e3a6c23c439
```
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Delete torrents
[](#delete-torrents)
Requires knowing the torrent hashes. You can get it from [torrent list](#get-torrent-list).
Name: `delete`
**Parameters:**
|Parameter|Type|Description|
|`hashes`|string|The hashes of the torrents you want to delete. `hashes` can contain multiple hashes separated by `|`, to delete multiple torrents, or set to `all`, to delete all torrents.|
|`deleteFiles`|If set to `true`, the downloaded data will also be deleted, otherwise has no effect.||
Example:
```
/api/v2/torrents/delete?hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32&deleteFiles=false
```
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Recheck torrents
[](#recheck-torrents)
Requires knowing the torrent hashes. You can get it from [torrent list](#get-torrent-list).
Name: `recheck`
**Parameters:**
|Parameter|Type|Description|
|`hashes`|string|The hashes of the torrents you want to recheck. `hashes` can contain multiple hashes separated by `|`, to recheck multiple torrents, or set to `all`, to recheck all torrents.|
Example:
```
/api/v2/torrents/recheck?hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|54eddd830a5b58480a6143d616a97e3a6c23c439
```
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Reannounce torrents
[](#reannounce-torrents)
Requires knowing the torrent hashes. You can get it from [torrent list](#get-torrent-list).
Name: `reannounce`
**Parameters:**
|Parameter|Type|Description|
|`hashes`|string|The hashes of the torrents you want to reannounce. `hashes` can contain multiple hashes separated by `|`, to reannounce multiple torrents, or set to `all`, to reannounce all torrents.|
Example:
```
/api/v2/torrents/reannounce?hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|54eddd830a5b58480a6143d616a97e3a6c23c439
```
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Add new torrent
[](#add-new-torrent)
This method can add torrents from server local file or from URLs. `http://`, `https://`, `magnet:` and `bc://bt/` links are supported.
Add torrent from URLs example:
```
POST /api/v2/torrents/add HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: multipart/form-data; boundary=---------------------------6688794727912
Content-Length: length
-----------------------------6688794727912
Content-Disposition: form-data; name="urls"
https://torcache.net/torrent/3B1A1469C180F447B77021074DBBCCAEF62611E7.torrent
https://torcache.net/torrent/3B1A1469C180F447B77021074DBBCCAEF62611E8.torrent
-----------------------------6688794727912
Content-Disposition: form-data; name="savepath"
C:/Users/qBit/Downloads
-----------------------------6688794727912
Content-Disposition: form-data; name="category"
movies
-----------------------------6688794727912
Content-Disposition: form-data; name="skip\_checking"
true
-----------------------------6688794727912
Content-Disposition: form-data; name="paused"
true
-----------------------------6688794727912
Content-Disposition: form-data; name="root\_folder"
true
-----------------------------6688794727912--
```
Add torrents from files example:
```
POST /api/v2/torrents/add HTTP/1.1
Content-Type: multipart/form-data; boundary=-------------------------acebdf13572468
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Length: length
---------------------------acebdf13572468
Content-Disposition: form-data; name="torrents"; filename="8f18036b7a205c9347cb84a253975e12f7adddf2.torrent"
Content-Type: application/x-bittorrent
file\_binary\_data\_goes\_here
---------------------------acebdf13572468
Content-Disposition: form-data; name="torrents"; filename="UFS.torrent"
Content-Type: application/x-bittorrent
file\_binary\_data\_goes\_here
---------------------------acebdf13572468--
```
The above example will add two torrent files. `file\_binary\_data\_goes\_here` represents raw data of torrent file (basically a byte array).
|Property|Type|Description|
|`urls`|string|URLs separated with newlines|
|`torrents`|raw|Raw data of torrent file. `torrents` can be presented multiple times.|
|`savepath`*optional*|string|Download folder|
|`category`*optional*|string|Category for the torrent|
|`tags`*optional*|string|Tags for the torrent, split by ','|
|`skip\_checking`*optional*|string|Skip hash checking. Possible values are `true`, `false` (default)|
|`paused`*optional*|string|Add torrents in the paused state. Possible values are `true`, `false` (default)|
|`root\_folder`*optional*|string|Create the root folder. Possible values are `true`, `false`, unset (default)|
|`rename`*optional*|string|Rename torrent|
|`upLimit`*optional*|integer|Set torrent upload speed limit. Unit in bytes/second|
|`dlLimit`*optional*|integer|Set torrent download speed limit. Unit in bytes/second|
|`ratioLimit`*optional*since 2.8.1|float|Set torrent share ratio limit|
|`seedingTimeLimit`*optional*since 2.8.1|integer|Set torrent seeding time limit. Unit in minutes|
|`autoTMM`*optional*|bool|Whether Automatic Torrent Management should be used|
|`sequentialDownload`*optional*|string|Enable sequential download. Possible values are `true`, `false` (default)|
|`firstLastPiecePrio`*optional*|string|Prioritize download first last piece. Possible values are `true`, `false` (default)|
**Returns:**
|HTTP Status Code|Scenario|
|415|Torrent file is not valid|
|200|All other scenarios|
## Add trackers to torrent
[](#add-trackers-to-torrent)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /api/v2/torrents/addTrackers HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hash=8c212779b4abde7c6bc608063a0d008b7e40ce32&urls=http://192.168.0.1/announce%0Audp://192.168.0.1:3333/dummyAnnounce
```
This adds two trackers to torrent with hash `8c212779b4abde7c6bc608063a0d008b7e40ce32`. Note `%0A` (aka LF newline) between trackers. Ampersand in tracker urls **MUST** be escaped.
**Returns:**
|HTTP Status Code|Scenario|
|404|Torrent hash was not found|
|200|All other scenarios|
## Edit trackers
[](#edit-trackers)
Name: `editTracker`
**Parameters:**
|Parameter|Type|Description|
|`hash`|string|The hash of the torrent|
|`origUrl`|string|The tracker URL you want to edit|
|`newUrl`|string|The new URL to replace the `origUrl`|
**Returns:**
|HTTP Status Code|Scenario|
|400|`newUrl` is not a valid URL|
|404|Torrent hash was not found|
|409|`newUrl` already exists for the torrent|
|409|`origUrl` was not found|
|200|All other scenarios|
## Remove trackers
[](#remove-trackers)
Name: `removeTrackers`
**Parameters:**
|Parameter|Type|Description|
|`hash`|string|The hash of the torrent|
|`urls`|string|URLs to remove, separated by `|`|
**Returns:**
|HTTP Status Code|Scenario|
|404|Torrent hash was not found|
|409|All `urls` were not found|
|200|All other scenarios|
## Add peers
[](#add-peers)
Name: `addPeers`
**Parameters:**
|Parameter|Type|Description|
|`hashes`|string|The hash of the torrent, or multiple hashes separated by a pipe `|`|
|`peers`|string|The peer to add, or multiple peers separated by a pipe `|`. Each peer is a colon-separated `host:port`|
**Returns:**
|HTTP Status Code|Scenario|
|400|None of the supplied peers are valid|
|200|All other scenarios|
## Increase torrent priority
[](#increase-torrent-priority)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
Name: `increasePrio`
**Parameters:**
|Parameter|Type|Description|
|`hashes`|string|The hashes of the torrents you want to increase the priority of. `hashes` can contain multiple hashes separated by `|`, to increase the priority of multiple torrents, or set to `all`, to increase the priority of all torrents.|
Example:
```
/api/v2/torrents/increasePrio?hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|54eddd830a5b58480a6143d616a97e3a6c23c439
```
**Returns:**
|HTTP Status Code|Scenario|
|409|Torrent queueing is not enabled|
|200|All other scenarios|
## Decrease torrent priority
[](#decrease-torrent-priority)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
Name: `decreasePrio`
**Parameters:**
|Parameter|Type|Description|
|`hashes`|string|The hashes of the torrents you want to decrease the priority of. `hashes` can contain multiple hashes separated by `|`, to decrease the priority of multiple torrents, or set to `all`, to decrease the priority of all torrents.|
Example:
```
/api/v2/torrents/decreasePrio?hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|54eddd830a5b58480a6143d616a97e3a6c23c439
```
**Returns:**
|HTTP Status Code|Scenario|
|409|Torrent queueing is not enabled|
|200|All other scenarios|
## Maximal torrent priority
[](#maximal-torrent-priority)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
Name: `topPrio`
**Parameters:**
|Parameter|Type|Description|
|`hashes`|string|The hashes of the torrents you want to set to the maximum priority. `hashes` can contain multiple hashes separated by `|`, to set multiple torrents to the maximum priority, or set to `all`, to set all torrents to the maximum priority.|
Example:
```
/api/v2/torrents/topPrio?hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|54eddd830a5b58480a6143d616a97e3a6c23c439
```
**Returns:**
|HTTP Status Code|Scenario|
|409|Torrent queueing is not enabled|
|200|All other scenarios|
## Minimal torrent priority
[](#minimal-torrent-priority)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
Name: `bottomPrio`
**Parameters:**
|Parameter|Type|Description|
|`hashes`|string|The hashes of the torrents you want to set to the minimum priority. `hashes` can contain multiple hashes separated by `|`, to set multiple torrents to the minimum priority, or set to `all`, to set all torrents to the minimum priority.|
Example:
```
/api/v2/torrents/bottomPrio?hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|54eddd830a5b58480a6143d616a97e3a6c23c439
```
**Returns:**
|HTTP Status Code|Scenario|
|409|Torrent queueing is not enabled|
|200|All other scenarios|
## Set file priority
[](#set-file-priority)
Name: `filePrio`
**Parameters:**
|Parameter|Type|Description|
|`hash`|string|The hash of the torrent|
|`id`|string|File ids, separated by `|`|
|`priority`|number|File priority to set (consult [torrent contents API](#get-torrent-contents) for possible values)|
`id` values correspond to file position inside the array returned by [torrent contents API](#get-torrent-contents), e.g. `id=0` for first file, `id=1` for second file, etc.
Since 2.8.2 it is recommended to use `index` field returned by [torrent contents API](#get-torrent-contents) (since the files can be filtered and the `index` value may differ from the position inside the response array).
**Returns:**
|HTTP Status Code|Scenario|
|400|Priority is invalid|
|400|At least one file `id` is not a valid integer|
|404|Torrent hash was not found|
|409|Torrent metadata hasn't downloaded yet|
|409|At least one file `id` was not found|
|200|All other scenarios|
## Get torrent download limit
[](#get-torrent-download-limit)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /api/v2/torrents/downloadLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|284b83c9c7935002391129fd97f43db5d7cc2ba0
```
`hashes` can contain multiple hashes separated by `|` or set to `all`
Server reply (example):
```
HTTP/1.1 200 OK
content-type: application/json
content-length: length
{"8c212779b4abde7c6bc608063a0d008b7e40ce32":338944,"284b83c9c7935002391129fd97f43db5d7cc2ba0":123}
```
`8c212779b4abde7c6bc608063a0d008b7e40ce32` is the hash of the torrent and `338944` its download speed limit in bytes per second; this value will be zero if no limit is applied.
## Set torrent download limit
[](#set-torrent-download-limit)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /api/v2/torrents/setDownloadLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|284b83c9c7935002391129fd97f43db5d7cc2ba0&limit=131072
```
`hashes` can contain multiple hashes separated by `|` or set to `all`
`limit` is the download speed limit in bytes per second you want to set.
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Set torrent share limit
[](#set-torrent-share-limit)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /api/v2/torrents/setShareLimits HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|284b83c9c7935002391129fd97f43db5d7cc2ba0&ratioLimit=1.0&seedingTimeLimit=60&inactiveSeedingTimeLimit=-2
```
**Parameters:**
|Property|Type|Description|
|`hashes`|integer|The hashes of the torrents for which you want to set the share limits. Multiple hashes need to be separated by `|` or set to `all`.|
|`ratioLimit`|float|The maximum seeding ratio for the torrent. `-2` means the global limit should be used, `-1` means no limit.|
|`seedingTimeLimit`|integer|The maximum seeding time (minutes) for the torrent. `-2` means the global limit should be used, `-1` means no limit.|
|`inactiveSeedingTimeLimit`|integer|The maximum amount of time (minutes) the torrent is allowed to seed while being inactive. `-2` means the global limit should be used, `-1` means no limit.|
**Returns:**
|HTTP Status Code|Scenario|
|200|All other scenarios|
|400|Bad Request, e.g. missing parameter|
## Get torrent upload limit
[](#get-torrent-upload-limit)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /api/v2/torrents/uploadLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|284b83c9c7935002391129fd97f43db5d7cc2ba0
```
`hashes` can contain multiple hashes separated by `|` or set to `all`
Server reply (example):
```
HTTP/1.1 200 OK
content-type: application/json
content-length: length
{"8c212779b4abde7c6bc608063a0d008b7e40ce32":338944,"284b83c9c7935002391129fd97f43db5d7cc2ba0":123}
```
`8c212779b4abde7c6bc608063a0d008b7e40ce32` is the hash of the torrent in the request and `338944` its upload speed limit in bytes per second; this value will be zero if no limit is applied.
## Set torrent upload limit
[](#set-torrent-upload-limit)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /api/v2/torrents/setUploadLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|284b83c9c7935002391129fd97f43db5d7cc2ba0&limit=131072
```
`hashes` can contain multiple hashes separated by `|` or set to `all`
`limit` is the upload speed limit in bytes per second you want to set.
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Set torrent location
[](#set-torrent-location)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /api/v2/torrents/setLocation HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|284b83c9c7935002391129fd97f43db5d7cc2ba0&location=/mnt/nfs/media
```
`hashes` can contain multiple hashes separated by `|` or set to `all`
`location` is the location to download the torrent to. If the location doesn't exist, the torrent's location is unchanged.
**Returns:**
|HTTP Status Code|Scenario|
|400|Save path is empty|
|403|User does not have write access to directory|
|409|Unable to create save path directory|
|200|All other scenarios|
## Set torrent name
[](#set-torrent-name)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /api/v2/torrents/rename HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hash=8c212779b4abde7c6bc608063a0d008b7e40ce32&name=This%20is%20a%20test
```
**Returns:**
|HTTP Status Code|Scenario|
|404|Torrent hash is invalid|
|409|Torrent name is empty|
|200|All other scenarios|
## Set torrent category
[](#set-torrent-category)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /api/v2/torrents/setCategory HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|284b83c9c7935002391129fd97f43db5d7cc2ba0&category=CategoryName
```
`hashes` can contain multiple hashes separated by `|` or set to `all`
`category` is the torrent category you want to set.
**Returns:**
|HTTP Status Code|Scenario|
|409|Category name does not exist|
|200|All other scenarios|
## Get all categories
[](#get-all-categories)
Name: `categories`
Parameters:
None
Returns all categories in JSON format, e.g.:
```
{
"Video": {
"name": "Video",
"savePath": "/home/user/torrents/video/"
},
"eBooks": {
"name": "eBooks",
"savePath": "/home/user/torrents/eBooks/"
}
}
```
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Add new category
[](#add-new-category)
```
POST /api/v2/torrents/createCategory HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
category=CategoryName&savePath=/path/to/dir
```
`category` is the category you want to create.
**Returns:**
|HTTP Status Code|Scenario|
|400|Category name is empty|
|409|Category name is invalid|
|200|All other scenarios|
## Edit category
[](#edit-category)
```
POST /api/v2/torrents/editCategory HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
category=CategoryName&savePath=/path/to/save/torrents/to
```
**Returns:**
|HTTP Status Code|Scenario|
|400|Category name is empty|
|409|Category editing failed|
|200|All other scenarios|
## Remove categories
[](#remove-categories)
```
POST /api/v2/torrents/removeCategories HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
categories=Category1%0ACategory2
```
`categories` can contain multiple cateogies separated by `\\n` (%0A urlencoded)
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Add torrent tags
[](#add-torrent-tags)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /api/v2/torrents/addTags HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|284b83c9c7935002391129fd97f43db5d7cc2ba0&tags=TagName1,TagName2
```
`hashes` can contain multiple hashes separated by `|` or set to `all`
`tags` is the list of tags you want to add to passed torrents.
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Remove torrent tags
[](#remove-torrent-tags)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /api/v2/torrents/removeTags HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|284b83c9c7935002391129fd97f43db5d7cc2ba0&tags=TagName1,TagName2
```
`hashes` can contain multiple hashes separated by `|` or set to `all`
`tags` is the list of tags you want to remove from passed torrents.
Empty list removes all tags from relevant torrents.
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Get all tags
[](#get-all-tags)
Name: `tags`
Parameters:
None
Returns all tags in JSON format, e.g.:
```
[
"Tag 1",
"Tag 2"
]
```
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Create tags
[](#create-tags)
```
POST /api/v2/torrents/createTags HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
tags=TagName1,TagName2
```
`tags` is a list of tags you want to create.
Can contain multiple tags separated by `,`.
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Delete tags
[](#delete-tags)
```
POST /api/v2/torrents/deleteTags HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
tags=TagName1,TagName2
```
`tags` is a list of tags you want to delete.
Can contain multiple tags separated by `,`.
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Set automatic torrent management
[](#set-automatic-torrent-management)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /api/v2/torrents/setAutoManagement HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|284b83c9c7935002391129fd97f43db5d7cc2ba0&enable=true
```
`hashes` can contain multiple hashes separated by `|` or set to `all`
`enable` is a boolean, affects the torrents listed in `hashes`, default is `false`
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Toggle sequential download
[](#toggle-sequential-download)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
Name: `toggleSequentialDownload`
**Parameters:**
|Parameter|Type|Description|
|`hashes`|string|The hashes of the torrents you want to toggle sequential download for. `hashes` can contain multiple hashes separated by `|`, to toggle sequential download for multiple torrents, or set to `all`, to toggle sequential download for all torrents.|
Example:
```
/api/v2/torrents/toggleSequentialDownload?hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|54eddd830a5b58480a6143d616a97e3a6c23c439
```
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Set first/last piece priority
[](#set-firstlast-piece-priority)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
Name: `toggleFirstLastPiecePrio`
**Parameters:**
|Parameter|Type|Description|
|`hashes`|string|The hashes of the torrents you want to toggle the first/last piece priority for. `hashes` can contain multiple hashes separated by `|`, to toggle the first/last piece priority for multiple torrents, or set to `all`, to toggle the first/last piece priority for all torrents.|
Example:
```
/api/v2/torrents/toggleFirstLastPiecePrio?hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|54eddd830a5b58480a6143d616a97e3a6c23c439
```
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Set force start
[](#set-force-start)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /api/v2/torrents/setForceStart HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32?value=true
```
`hashes` can contain multiple hashes separated by `|` or set to `all`
`value` is a boolean, affects the torrents listed in `hashes`, default is `false`
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Set super seeding
[](#set-super-seeding)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /api/v2/torrents/setSuperSeeding HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32?value=true
```
`hashes` can contain multiple hashes separated by `|` or set to `all`
`value` is a boolean, affects the torrents listed in `hashes`, default is `false`
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Rename file
[](#rename-file)
Name: `renameFile`
**Parameters:**
|Parameter|Type|Description|
|`hash`|string|The hash of the torrent|
|`oldPath`|string|The old path of the torrent|
|`newPath`|string|The new path to use for the file|
**Returns:**
|HTTP Status Code|Scenario|
|400|Missing `newPath` parameter|
|409|Invalid `newPath` or `oldPath`, or `newPath` already in use|
|200|All other scenarios|
## Rename folder
[](#rename-folder)
Name: `renameFolder`
**Parameters:**
|Parameter|Type|Description|
|`hash`|string|The hash of the torrent|
|`oldPath`|string|The old path of the torrent|
|`newPath`|string|The new path to use for the file|
**Returns:**
|HTTP Status Code|Scenario|
|400|Missing `newPath` parameter|
|409|Invalid `newPath` or `oldPath`, or `newPath` already in use|
|200|All other scenarios|
# RSS (experimental)
[](#rss-experimental)
All RSS API methods are under "rss", e.g.: `/api/v2/rss/methodName`.
## Add folder
[](#add-folder)
Name: `addFolder`
Parameters:
|Parameter|Type|Description|
|`path`|string|Full path of added folder (e.g. "The Pirate Bay\\Top100")|
**Returns:**
|HTTP Status Code|Scenario|
|409|Failure to add folder|
|200|All other scenarios|
## Add feed
[](#add-feed)
Name: `addFeed`
Parameters:
|Parameter|Type|Description|
|`url`|string|URL of RSS feed (e.g. "[http://thepiratebay.org/rss//top100/200](http://thepiratebay.org/rss//top100/200)")|
|`path`*optional*|string|Full path of added folder (e.g. "The Pirate Bay\\Top100\\Video")|
**Returns:**
|HTTP Status Code|Scenario|
|409|Failure to add feed|
|200|All other scenarios|
## Remove item
[](#remove-item)
Removes folder or feed.
Name: `removeItem`
Parameters:
|Parameter|Type|Description|
|`path`|string|Full path of removed item (e.g. "The Pirate Bay\\Top100")|
**Returns:**
|HTTP Status Code|Scenario|
|409|Failure to remove item|
|200|All other scenarios|
## Move item
[](#move-item)
Moves/renames folder or feed.
Name: `moveItem`
Parameters:
|Parameter|Type|Description|
|`itemPath`|string|Current full path of item (e.g. "The Pirate Bay\\Top100")|
|`destPath`|string|New full path of item (e.g. "The Pirate Bay")|
**Returns:**
|HTTP Status Code|Scenario|
|409|Failure to move item|
|200|All other scenarios|
## Get all items
[](#get-all-items)
Name: `items`
Parameters:
|Parameter|Type|Description|
|`withData`*optional*|bool|True if you need current feed articles|
Returns all RSS items in JSON format, e.g.:
```
{
"HD-Torrents.org": "https://hd-torrents.org/rss.php",
"PowerfulJRE": "https://www.youtube.com/feeds/videos.xml?channel\_id=UCzQUP1qoWDoEbmsQxvdjxgQ",
"The Pirate Bay": {
"Audio": "https://thepiratebay.org/rss//top100/100",
"Video": "https://thepiratebay.org/rss//top100/200"
}
}
```
## Mark as read
[](#mark-as-read)
If `articleId` is provided only the article is marked as read otherwise the whole feed is going to be marked as read.
Name: `markAsRead`
Parameters:
|Parameter|Type|Description|
|`itemPath`|string|Current full path of item (e.g. "The Pirate Bay\\Top100")|
|`articleId`*optional*|string|ID of article|
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Refresh item
[](#refresh-item)
Refreshes folder or feed.
Name: `refreshItem`
Parameters:
|Parameter|Type|Description|
|`itemPath`|string|Current full path of item (e.g. "The Pirate Bay\\Top100")|
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Set auto-downloading rule
[](#set-auto-downloading-rule)
Name: `setRule`
Parameters:
|Parameter|Type|Description|
|`ruleName`|string|Rule name (e.g. "Punisher")|
|`ruleDef`|string|JSON encoded rule definition|
Rule definition is JSON encoded dictionary with the following fields:
|Field|Type|Description|
|`enabled`|bool|Whether the rule is enabled|
|`mustContain`|string|The substring that the torrent name must contain|
|`mustNotContain`|string|The substring that the torrent name must not contain|
|`useRegex`|bool|Enable regex mode in "mustContain" and "mustNotContain"|
|`episodeFilter`|string|Episode filter definition|
|`smartFilter`|bool|Enable smart episode filter|
|`previouslyMatchedEpisodes`|list|The list of episode IDs already matched by smart filter|
|`affectedFeeds`|list|The feed URLs the rule applied to|
|`ignoreDays`|number|Ignore sunsequent rule matches|
|`lastMatch`|string|The rule last match time|
|`addPaused`|bool|Add matched torrent in paused mode|
|`assignedCategory`|string|Assign category to the torrent|
|`savePath`|string|Save torrent to the given directory|
E.g.:
```
{
"enabled": false,
"mustContain": "The \*Punisher\*",
"mustNotContain": "",
"useRegex": false,
"episodeFilter": "1x01-;",
"smartFilter": false,
"previouslyMatchedEpisodes": [
],
"affectedFeeds": [
"http://showrss.info/user/134567.rss?magnets=true"
],
"ignoreDays": 0,
"lastMatch": "20 Nov 2017 09:05:11",
"addPaused": true,
"assignedCategory": "",
"savePath": "C:/Users/JohnDoe/Downloads/Punisher"
}
```
## Rename auto-downloading rule
[](#rename-auto-downloading-rule)
Name: `renameRule`
Parameters:
|Parameter|Type|Description|
|`ruleName`|string|Rule name (e.g. "Punisher")|
|`newRuleName`|string|New rule name (e.g. "The Punisher")|
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Remove auto-downloading rule
[](#remove-auto-downloading-rule)
Name: `removeRule`
Parameters:
|Parameter|Type|Description|
|`ruleName`|string|Rule name (e.g. "Punisher")|
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Get all auto-downloading rules
[](#get-all-auto-downloading-rules)
Name: `rules`
Returns all auto-downloading rules in JSON format, e.g.:
```
{
"The Punisher": {
"enabled": false,
"mustContain": "The \*Punisher\*",
"mustNotContain": "",
"useRegex": false,
"episodeFilter": "1x01-;",
"smartFilter": false,
"previouslyMatchedEpisodes": [
],
"affectedFeeds": [
"http://showrss.info/user/134567.rss?magnets=true"
],
"ignoreDays": 0,
"lastMatch": "20 Nov 2017 09:05:11",
"addPaused": true,
"assignedCategory": "",
"savePath": "C:/Users/JohnDoe/Downloads/Punisher"
}
}
```
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Get all articles matching a rule
[](#get-all-articles-matching-a-rule)
Name: `matchingArticles`
|Parameter|Type|Description|
|`ruleName`|string|Rule name (e.g. "Linux")|
Returns all articles that match a rule by feed name in JSON format, e.g.:
```
{
"DistroWatch":[
"sparkylinux-5.11-i686-minimalgui.iso.torrent",
"sparkylinux-5.11-x86\_64-minimalgui.iso.torrent",
"sparkylinux-5.11-i686-xfce.iso.torrent",
"bluestar-linux-5.6.3-2020.04.09-x86\_64.iso.torrent",
"robolinux64-mate3d-v10.10.iso.torrent",
],
"Linuxtracker":[
"[Alpine Linux] alpine-extended-3.11.6",
"[Alpine Linux] alpine-standard-3.11.6",
"[Linuxfx] linuxfx10-wxs-lts-beta5.iso",
"[Linux Lite] linux-lite-5.0-rc1-64bit.iso (MULTI)",
"[Scientific Linux] SL-7.8-x86\_64-Pack",
"[NixOS] nixos-plasma5-20.03.1418.5272327b81e-x86\_64-linux.iso"
]
}
```
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
# Search
[](#search)
All Search API methods are under "search", e.g.: `/api/v2/search/methodName`.
## Start search
[](#start-search)
Name: `start`
**Parameters:**
|Parameter|Type|Description|
|`pattern`|string|Pattern to search for (e.g. "Ubuntu 18.04")|
|`plugins`|string|Plugins to use for searching (e.g. "legittorrents"). Supports multiple plugins separated by `|`. Also supports `all` and `enabled`|
|`category`|string|Categories to limit your search to (e.g. "legittorrents"). Available categories depend on the specified `plugins`. Also supports `all`|
**Returns:**
|HTTP Status Code|Scenario|
|409|User has reached the limit of max `Running` searches (currently set to 5)|
|200|All other scenarios- see JSON below|
The response is a JSON object with the following fields
|Field|Type|Description|
|`id`|number|ID of the search job|
Example:
```
{
"id": 12345
}
```
## Stop search
[](#stop-search)
Name: `stop`
**Parameters:**
|Parameter|Type|Description|
|`id`|number|ID of the search job|
**Returns:**
|HTTP Status Code|Scenario|
|404|Search job was not found|
|200|All other scenarios|
## Get search status
[](#get-search-status)
Name: `status`
**Parameters:**
|Parameter|Type|Description|
|`id`*optional*|number|ID of the search job. If not specified, all search jobs are returned|
**Returns:**
|HTTP Status Code|Scenario|
|404|Search job was not found|
|200|All other scenarios- see JSON below|
The response is a JSON array of objects containing the following fields
|Field|Type|Description|
|`id`|number|ID of the search job|
|`status`|string|Current status of the search job (either `Running` or `Stopped`)|
|`total`|number|Total number of results. If the status is `Running` this number may contineu to increase|
Example:
```
[
{
"id": 12345,
"status": "Running",
"total": 170
}
]
```
## Get search results
[](#get-search-results)
Name: `results`
**Parameters:**
|Parameter|Type|Description|
|`id`|number|ID of the search job|
|`limit`*optional*|number|max number of results to return. 0 or negative means no limit|
|`offset`*optional*|number|result to start at. A negative number means count backwards (e.g. `-2` returns the 2 most recent results)|
**Returns:**
|HTTP Status Code|Scenario|
|404|Search job was not found|
|409|Offset is too large, or too small (e.g. absolute value of negative number is greater than # results)|
|200|All other scenarios- see JSON below|
The response is a JSON object with the following fields
|Field|Type|Description|
|`results`|array|Array of `result` objects- see table below|
|`status`|string|Current status of the search job (either `Running` or `Stopped`)|
|`total`|number|Total number of results. If the status is `Running` this number may continue to increase|
**Result object:**
|Field|Type|Description|
|`descrLink`|string|URL of the torrent's description page|
|`fileName`|string|Name of the file|
|`fileSize`|number|Size of the file in Bytes|
|`fileUrl`|string|Torrent download link (usually either .torrent file or magnet link)|
|`nbLeechers`|number|Number of leechers|
|`nbSeeders`|number|Number of seeders|
|`siteUrl`|string|URL of the torrent site|
Example:
```
{
"results": [
{
"descrLink": "http://www.legittorrents.info/index.php?page=torrent-details&id=8d5f512e1acb687029b8d7cc6c5a84dce51d7a41",
"fileName": "Ubuntu-10.04-32bit-NeTV.ova",
"fileSize": -1,
"fileUrl": "http://www.legittorrents.info/download.php?id=8d5f512e1acb687029b8d7cc6c5a84dce51d7a41&f=Ubuntu-10.04-32bit-NeTV.ova.torrent",
"nbLeechers": 1,
"nbSeeders": 0,
"siteUrl": "http://www.legittorrents.info"
},
{
"descrLink": "http://www.legittorrents.info/index.php?page=torrent-details&id=d5179f53e105dc2c2401bcfaa0c2c4936a6aa475",
"fileName": "mangOH-Legato-17\_06-Ubuntu-16\_04.ova",
"fileSize": -1,
"fileUrl": "http://www.legittorrents.info/download.php?id=d5179f53e105dc2c2401bcfaa0c2c4936a6aa475&f=mangOH-Legato-17\_06-Ubuntu-16\_04.ova.torrent",
"nbLeechers": 0,
"nbSeeders": 59,
"siteUrl": "http://www.legittorrents.info"
}
],
"status": "Running",
"total": 2
}
```
## Delete search
[](#delete-search)
Name: `delete`
**Parameters:**
|Parameter|Type|Description|
|`id`|number|ID of the search job|
**Returns:**
|HTTP Status Code|Scenario|
|404|Search job was not found|
|200|All other scenarios|
## Get search plugins
[](#get-search-plugins)
Name: `plugins`
**Parameters:**
None
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios- see JSON below|
The response is a JSON array of objects containing the following fields
|Field|Type|Description|
|`enabled`|bool|Whether the plugin is enabled|
|`fullName`|string|Full name of the plugin|
|`name`|string|Short name of the plugin|
|`supportedCategories`|array|List of category objects|
|`url`|string|URL of the torrent site|
|`version`|string|Installed version of the plugin|
```
[
{
"enabled": true,
"fullName": "Legit Torrents",
"name": "legittorrents",
"supportedCategories": [{
"id": "all",
"name": "All categories"
}, {
"id": "anime",
"name": "Anime"
}, {
"id": "books",
"name": "Books"
}, {
"id": "games",
"name": "Games"
}, {
"id": "movies",
"name": "Movies"
}, {
"id": "music",
"name": "Music"
}, {
"id": "tv",
"name": "TV shows"
}],
"url": "http://www.legittorrents.info",
"version": "2.3"
}
]
```
## Install search plugin
[](#install-search-plugin)
Name: `installPlugin`
**Parameters:**
|Parameter|Type|Description|
|`sources`|string|Url or file path of the plugin to install (e.g. "[https://raw.githubusercontent.com/qbittorrent/search-plugins/master/nova3/engines/legittorrents.py](https://raw.githubusercontent.com/qbittorrent/search-plugins/master/nova3/engines/legittorrents.py)"). Supports multiple sources separated by `|`|
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Uninstall search plugin
[](#uninstall-search-plugin)
Name: `uninstallPlugin`
**Parameters:**
|Parameter|Type|Description|
|`names`|string|Name of the plugin to uninstall (e.g. "legittorrents"). Supports multiple names separated by `|`|
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Enable search plugin
[](#enable-search-plugin)
Name: `enablePlugin`
**Parameters:**
|Parameter|Type|Description|
|`names`|string|Name of the plugin to enable/disable (e.g. "legittorrents"). Supports multiple names separated by `|`|
|`enable`|bool|Whether the plugins should be enabled|
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
## Update search plugins
[](#update-search-plugins)
Name: `updatePlugins`
**Parameters:**
None
**Returns:**
|HTTP Status Code|Scenario|
|200|All scenarios|
# WebAPI versioning
[](#webapi-versioning)
WebAPI uses the following versioning: `1.2.3`:
1. Main version. Should be changed only on some global changes (e.g. total redesign/relayout)
2. Changed on incompatible API changes (i.e. if it breaks outdated clients). E.g. if you change/remove something
3. Changed on compatible API changes (i.e. if it doesn't break outdated clients). E.g. if you add something new outdated clients still can access old subset of API.
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