WebUI API (qBittorrent v3.2.0 v4.0.4) · qbittorrent/qBittorrent Wiki · GitHub
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
# WebUI API (qBittorrent v3.2.0 v4.0.4)
[Jump to bottom](#wiki-pages-box)
xavier2k6 edited this page Jan 22, 2026
&middot;
[4 revisions](/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-v3.2.0-v4.0.4)/_history)
This WebUI API documentation applies to qBittorrent v3.2.0-v4.0.4. For other API versions, visit [WebUI API](https://github.com/qbittorrent/qBittorrent/wiki#WebUI-API).
# Table of Contents
[](#table-of-contents)
1. [Changes](#changes)
2. [Authorization](#authorization)
1. [Login](#login)
2. [Logout](#logout)
3. [GET methods](#get-methods)
1. [Get API version](#get-api-version)
2. [Get minimum API version](#get-minimum-api-version)
3. [Get qBittorrent version](#get-qbittorrent-version)
4. [Shutdown qBittorrent](#shutdown-qbittorrent)
5. [Get torrent list](#get-torrent-list)
6. [Get torrent generic properties](#get-torrent-generic-properties)
7. [Get torrent trackers](#get-torrent-trackers)
8. [Get torrent web seeds](#get-torrent-web-seeds)
9. [Get torrent contents](#get-torrent-contents)
10. [Get torrent pieces' states](#get-torrent-pieces-states)
11. [Get torrent pieces' hashes](#get-torrent-pieces-hashes)
12. [Get global transfer info](#get-global-transfer-info)
13. [Get qBittorrent preferences](#get-qbittorrent-preferences)
14. [Get partial data](#get-partial-data)
15. [Get log](#get-log)
16. [POST methods](#post-methods)
1. [Download torrent from URL](#download-torrent-from-url)
2. [Upload torrent from disk](#upload-torrent-from-disk)
3. [Add trackers to torrent](#add-trackers-to-torrent)
4. [Pause torrent](#pause-torrent)
5. [Pause all torrents](#pause-all-torrents)
6. [Resume torrent](#resume-torrent)
7. [Resume all torrents](#resume-all-torrents)
8. [Delete torrent](#delete-torrent)
9. [Delete torrent with downloaded data](#delete-torrent-with-downloaded-data)
10. [Recheck torrent](#recheck-torrent)
11. [Increase torrent priority](#increase-torrent-priority)
12. [Decrease torrent priority](#decrease-torrent-priority)
13. [Maximal torrent priority](#maximal-torrent-priority)
14. [Minimal torrent priority](#minimal-torrent-priority)
15. [Set file priority](#set-file-priority)
16. [Get global download limit](#get-global-download-limit)
17. [Set global download limit](#set-global-download-limit)
18. [Get global upload limit](#get-global-upload-limit)
19. [Set global upload limit](#set-global-upload-limit)
20. [Get torrent download limit](#get-torrent-download-limit)
21. [Set torrent download limit](#set-torrent-download-limit)
22. [Get torrent upload limit](#get-torrent-upload-limit)
23. [Set torrent upload limit](#set-torrent-upload-limit)
24. [Set torrent location](#set-torrent-location)
25. [Set torrent name](#set-torrent-name)
26. [Set torrent category](#set-torrent-category)
27. [Add new category](#add-new-category)
28. [Remove categories](#remove-categories)
29. [Set automatic torrent management](#set-automatic-torrent-management)
30. [Set qBittorrent preferences](#set-qbittorrent-preferences)
31. [Get alternative speed limits state](#get-alternative-speed-limits-state)
32. [Toggle alternative speed limits](#toggle-alternative-speed-limits)
33. [Toggle sequential download](#toggle-sequential-download)
34. [Set first/last piece priority](#set-firstlast-piece-priority)
35. [Set force start](#set-force-start)
36. [Set super seeding](#set-super-seeding)
37. [Pause all the torrents](#pause-all-the-torrents)
38. [Resume all the torrents](#resume-all-the-torrents)
# Changes
[](#changes)
`APIX`, where `X` is a number representing the API version, specifies the first API version in which the marked entry is available.
`APIX-APIY`, where `X` and `Y` are two different API versions, represents a range where `APIX` and `APIY` are respectively the first and last API version in which the marked entry is available.
`API2` is implied and not reported.
* Changes in `API2`:
* The authentication is now cookie based
* Sizes are expressed in bytes, speed rates in bytes per seconds, dates as unix timestamps and are all reported as integers with no hardcoded unit
* `/json/` was replaced with `/query/` in all the requests
* `/command/getTorrentUpLimit|getTorrentDlLimit|setTorrentUpLimit|setTorrentDlLimit` were replaced by `/command/getTorrentsUpLimit|getTorrentsDlLimit|setTorrentsUpLimit|setTorrentsDlLimit` to handle multiple torrents
* URIs/parameters are case sensitive
* The server replies with an error in case of bad requests, unless differently stated.
* Changes between `API3` and `API4`:
* `application/json` is the MIME type of the replies that had `text/javascript` as MIME type.
* Changes in `API14`:
* The `Referer` header is now expected in all HTTP requests. qBittorrent will drop any request sent without the referer header.
# Authorization
[](#authorization)
qBittorrent uses a cookie based authentication.
### Login
[](#login)
```
POST /login HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Content-Type: application/x-www-form-urlencoded
Content-Length: length
username=admin&password=admin
```
Server reply (example):
```
Content-Length: 3
Content-Type: text/plain; charset=UTF-8
Set-Cookie: SID=3133exaykXDX0mUQRDukIr9YUi0EchFY; path=/
```
You must supply the cookie whenever you want to perform an operation that requires authentication.
Example showing how to login and execute a command that requires authentication using `curl`:
```
$ curl -i --header 'Referer: http://localhost:8080' --data 'username=admin&password=adminadmin' http://localhost:8080/login
HTTP/1.1 200 OK
Content-Encoding:
Content-Length: 3
Content-Type: text/plain; charset=UTF-8
Set-Cookie: SID=hBc7TxF76ERhvIw0jQQ4LZ7Z1jQUV0tQ; path=/
$ curl http://localhost:8080/query/torrents --cookie "SID=hBc7TxF76ERhvIw0jQQ4LZ7Z1jQUV0tQ"
```
Note: Set `Referer` or `Origin` header to the exact same domain and port as used in the HTTP query `Host` header.
### Logout
[](#logout)
```
POST /logout HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
```
# GET methods
[](#get-methods)
### Get API version
[](#get-api-version)
Get the current API version
```
GET /version/api HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
```
Server reply (example):
```
HTTP/1.1 200 OK
Content-Encoding:
Content-Length: 1
Content-Type: text/plain; charset=UTF-8
2
```
### Get minimum API version
[](#get-minimum-api-version)
Get the minimum API version supported. Any application designed to work with an API version greater than or equal to the minimum API version is guaranteed to work.
```
GET /version/api\_min HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
```
Server reply (example):
```
HTTP/1.1 200 OK
Content-Encoding:
Content-Length: 1
Content-Type: text/plain; charset=UTF-8
2
```
### Get qBittorrent version
[](#get-qbittorrent-version)
```
GET /version/qbittorrent HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
```
Server reply (example):
```
HTTP/1.1 200 OK
Content-Encoding:
Content-Length: 1
Content-Type: text/plain; charset=UTF-8
v3.2.0
```
### Shutdown qBittorrent
[](#shutdown-qbittorrent)
```
GET /command/shutdown HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
```
Server reply (example):
```
HTTP/1.1 200 OK
Content-Encoding:
```
### Get torrent list
[](#get-torrent-list)
```
GET /query/torrents HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
```
Params:
|Param|Description|
|`filter`|Filter torrent list. Allowed filters: `all`, `downloading`, `completed`, `paused`, `active`, `inactive`|
|`category`|Get torrents with the given category (empty string means "without category"; no "category" param means "any category")|
|`sort`|Sort torrents by given key. All the possible keys are listed here below|
|`reverse`|Enable reverse sorting. Possible values are `true` and `false` (default)|
|`limit`|Limit the number of torrents returned|
|`offset`|Set offset (if less than 0, offset from end)|
|`hashes`|Filter by hashes. Can contain multiple hashes separated by `|`|
Example:
```
/query/torrents?filter=downloading&category=sample%20category&sort=ratio
```
Server will return the following reply (example):
```
HTTP/1.1 200 OK
content-type: application/json
content-length: length
[{"dlspeed":9681262,"eta":87,"f\_l\_piece\_prio":false,"force\_start":false,"hash":"8c212779b4abde7c6bc608063a0d008b7e40ce32","category":"","name":"debian-8.1.0-amd64-CD-1.iso","num\_complete":-1,"num\_incomplete":-1,"num\_leechs":2,"num\_seeds":54,"priority":1,"progress":0.16108787059783936,"ratio":0,"seq\_dl":false,"size":657457152,"state":"downloading","super\_seeding":false,"upspeed":0},{another\_torrent\_info}]
```
|Property|Type|Description|
|`hash`|string|Torrent hash|
|`name`|string|Torrent name|
|`size`|integer|Total size (bytes) of files selected for download|
|`progress`|float|Torrent progress (percentage/100)|
|`dlspeed`|integer|Torrent download speed (bytes/s)|
|`upspeed`|integer|Torrent upload speed (bytes/s)|
|`priority`|integer|Torrent priority. Returns -1 if queuing is disabled or torrent is in seed mode|
|`num\_seeds`|integer|Number of seeds connected to|
|`num\_complete`|integer|Number of seeds in the swarm|
|`num\_leechs`|integer|Number of leechers connected to|
|`num\_incomplete`|integer|Number of leechers in the swarm|
|`ratio`|float|Torrent share ratio. Max ratio value: 9999.|
|`eta`|integer|Torrent ETA (seconds)|
|`state`|string|Torrent state. See table here below for the possible values|
|`seq\_dl`|bool|True if sequential download is enabled|
|`f\_l\_piece\_prio`|bool|True if first last piece are prioritized|
|`category`|string|Category of the torrent|
|`super\_seeding`|bool|True if super seeding is enabled|
|`force\_start`|bool|True if force start is enabled for this torrent|
Possible values of `state`:
|Value|Description|
|`error`|Some error occurred, applies to paused torrents|
|`pausedUP`|Torrent is paused and has finished downloading|
|`pausedDL`|Torrent is paused and has NOT finished downloading|
|`queuedUP`|Queuing is enabled and torrent is queued for upload|
|`queuedDL`|Queuing is enabled and torrent is queued for download|
|`uploading`|Torrent is being seeded and data is being transferred|
|`stalledUP`|Torrent is being seeded, but no connection were made|
|`checkingUP`|Torrent has finished downloading and is being checked; this status also applies to preallocation (if enabled) and checking resume data on qBt startup|
|`checkingDL`|Same as checkingUP, but torrent has NOT finished downloading|
|`downloading`|Torrent is being downloaded and data is being transferred|
|`stalledDL`|Torrent is being downloaded, but no connection were made|
|`metaDL`|Torrent has just started downloading and is fetching metadata|
### Get torrent generic properties
[](#get-torrent-generic-properties)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
GET /query/propertiesGeneral/8c212779b4abde7c6bc608063a0d008b7e40ce32 HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
```
If your torrent hash is invalid server will reply with:
```
HTTP/1.1 200 OK
content-type: application/json
content-length: 0
```
Otherwise server will return the following reply (example):
```
HTTP/1.1 200 OK
content-type: application/json
content-length: length
{"addition\_date":1438429165,"comment":"\\"Debian CD from cdimage.debian.org\\"","completion\_date":1438429234,"created\_by":"","creation\_date":1433605214,"dl\_limit":-1,"dl\_speed":0,"dl\_speed\_avg":9736015,"eta":8640000,"last\_seen":1438430354,"nb\_connections":3,"nb\_connections\_limit":250,"peers":1,"peers\_total":89,"piece\_size":524288,"pieces\_have":1254,"pieces\_num":1254,"reannounce":672,"save\_path":"/Downloads/debian-8.1.0-amd64-CD-1.iso","seeding\_time":1128,"seeds":1,"seeds\_total":254,"share\_ratio":0.00072121022562178299,"time\_elapsed":1197,"total\_downloaded":681521119,"total\_downloaded\_session":681521119,"total\_size":657457152,"total\_uploaded":491520,"total\_uploaded\_session":491520,"total\_wasted":23481724,"up\_limit":-1,"up\_speed":0,"up\_speed\_avg":410}
```
|Property|Type|Description|
|`save\_path`|string|Torrent save path|
|`creation\_date`|integer|Torrent creation date (Unix timestamp)|
|`piece\_size`|integer|Torrent piece size (bytes)|
|`comment`|string|Torrent comment|
|`total\_wasted`|integer|Total data wasted for torrent (bytes)|
|`total\_uploaded`|integer|Total data uploaded for torrent (bytes)|
|`total\_uploaded\_session`|integer|Total data uploaded this session (bytes)|
|`total\_downloaded`|integer|Total data uploaded for torrent (bytes)|
|`total\_downloaded\_session`|integer|Total data downloaded this session (bytes)|
|`up\_limit`|integer|Torrent upload limit (bytes/s)|
|`dl\_limit`|integer|Torrent download limit (bytes/s)|
|`time\_elapsed`|integer|Torrent elapsed time (seconds)|
|`seeding\_time`|integer|Torrent elapsed time while complete (seconds)|
|`nb\_connections`|integer|Torrent connection count|
|`nb\_connections\_limit`|integer|Torrent connection count limit|
|`share\_ratio`|float|Torrent share ratio|
|`addition\_date``API4`|integer|When this torrent was added (unix timestamp)|
|`completion\_date``API4`|integer|Torrent completion date (unix timestamp)|
|`created\_by``API4`|string|Torrent creator|
|`dl\_speed\_avg``API4`|integer|Torrent average download speed (bytes/second)|
|`dl\_speed``API4`|integer|Torrent download speed (bytes/second)|
|`eta``API4`|integer|Torrent ETA (seconds)|
|`last\_seen``API4`|integer|Last seen complete date (unix timestamp)|
|`peers``API4`|integer|Number of peers connected to|
|`peers\_total``API4`|integer|Number of peers in the swarm|
|`pieces\_have``API4`|integer|Number of pieces owned|
|`pieces\_num``API4`|integer|Number of pieces of the torrent|
|`reannounce``API4`|integer|Number of seconds until the next announce|
|`seeds``API4`|integer|Number of seeds connected to|
|`seeds\_total``API4`|integer|Number of seeds in the swarm|
|`total\_size``API4`|integer|Torrent total size (bytes)|
|`up\_speed\_avg``API4`|integer|Torrent average upload speed (bytes/second)|
|`up\_speed``API4`|integer|Torrent upload speed (bytes/second)|
NB: `-1` is returned when the value is not known if the type is integer.
### Get torrent trackers
[](#get-torrent-trackers)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
GET /query/propertiesTrackers/8c212779b4abde7c6bc608063a0d008b7e40ce32 HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
```
If your torrent hash is invalid server will reply with:
```
HTTP/1.1 200 OK
content-type: application/json
content-length: 2
```
Otherwise server will return the following reply (example):
```
HTTP/1.1 200 OK
content-type: application/json
content-length: length
[{"msg":"","num\_peers":100,"status":"Working","url":"http://bttracker.debian.org:6969/announce"},{another\_tracker\_info}]
```
|Property|Type|Description|
|`url`|string|Tracker url|
|`status`|string|Tracker status (translated string). See the table here below for the possible values|
|`num\_peers`|integer|Number of peers for current torrent reported by the tracker|
|`msg`|string|Tracker message (there is no way of knowing what this message is - it's up to tracker admins)|
Possible values of `status` (translated):
|Value|Description|
|`Working`|Tracker has been contacted and is working|
|`Updating...`|Tracker is currently being updated|
|`Not working`|Tracker has been contacted, but it is not working (or doesn't send proper replies)|
|`Not contacted yet`|Tracker has not been contacted yet|
### Get torrent web seeds
[](#get-torrent-web-seeds)
`API3`
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
GET /query/propertiesWebSeeds/8c212779b4abde7c6bc608063a0d008b7e40ce32 HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
```
```
HTTP/1.1 200 OK
content-type: application/json
content-length: length
[{"url":"http://some\_url/"},{"url":"http://some\_other\_url/"}]
```
|Property|Type|Description|
|`url`|string|URL of the web seed|
### Get torrent contents
[](#get-torrent-contents)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
GET /query/propertiesFiles/8c212779b4abde7c6bc608063a0d008b7e40ce32 HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
```
If your torrent hash is invalid server will reply with:
```
HTTP/1.1 200 OK
content-type: application/json
content-length: 0
```
Otherwise server will return the following reply (example):
```
HTTP/1.1 200 OK
content-type: application/json
content-length: length
[{"is\_seed":false,"name":"debian-8.1.0-amd64-CD-1.iso","piece\_range":[0,1253],"priority":4,"progress":0,"size":657457152}]
```
|Property|Type|Description|
|`name`|string|File name (including relative path)|
|`size`|integer|File size (bytes)|
|`progress`|float|File progress (percentage/100)|
|`priority`|integer|File priority. See possible values here below|
|`is\_seed`|bool|True if file is seeding/complete|
|`piece\_range`|integer array|The first number is the starting piece index and the second number is the ending piece index (inclusive)|
Possible values of `priority`:
|Value|Description|
|`0`|Do not download|
|`1`|Normal priority|
|`6`|High priority|
|`7`|Maximal priority|
### Get torrent pieces' states
[](#get-torrent-pieces-states)
Returns an array of states (integers) of all pieces (in order) of a specific torrent.
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
GET /query/getPieceStates/8c212779b4abde7c6bc608063a0d008b7e40ce32 HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
```
If your torrent hash is invalid server will reply with:
```
HTTP/1.1 200 OK
content-type: application/json
content-length: 0
```
Otherwise server will return the following reply (example):
```
HTTP/1.1 200 OK
content-type: application/json
content-length: length
[0,0,2,1,0,0,2,1]
```
Value meanings are defined as below:
|Value|Description|
|`0`|Not downloaded yet|
|`1`|Now downloading|
|`2`|Already downloaded|
### Get torrent pieces' hashes
[](#get-torrent-pieces-hashes)
Returns an array of hashes (strings) of all pieces (in order) of a specific torrent.
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
GET /query/getPieceHashes/8c212779b4abde7c6bc608063a0d008b7e40ce32 HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
```
If your torrent hash is invalid server will reply with:
```
HTTP/1.1 200 OK
content-type: application/json
content-length: 0
```
Otherwise server will return the following reply (example):
```
HTTP/1.1 200 OK
content-type: application/json
content-length: length
["54eddd830a5b58480a6143d616a97e3a6c23c439","f8a99d225aa4241db100f88407fc3bdaead583ab","928fb615b9bd4dd8f9e9022552c8f8f37ef76f58"]
```
### Get global transfer info
[](#get-global-transfer-info)
This method returns info you usually see in qBt status bar.
```
GET /query/transferInfo HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
```
Server reply (example):
```
HTTP/1.1 200 OK
content-type: application/json
content-length: length
{"connection\_status":"connected","dht\_nodes":386,"dl\_info\_data":681521119,"dl\_info\_speed":0,"dl\_rate\_limit":0,"up\_info\_data":10747904,"up\_info\_speed":0,"up\_rate\_limit":1048576}
```
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
### Get qBittorrent preferences
[](#get-qbittorrent-preferences)
```
GET /query/preferences HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
```
Server reply; contents may vary depending on which settings are present in qBittorrent.ini (example):
```
HTTP/1.1 200 OK
content-type: application/json
content-length: length
{"locale":"ru\_RU","save\_path":"C:/Users/Dayman/Downloads","temp\_path\_enabled":false,"temp\_path":"C:/Users/Dayman/Documents/Downloads/temp","scan\_dirs":["D:/Browser Downloads"],"download\_in\_scan\_dirs":[false],"export\_dir\_enabled":false,"export\_dir":"","mail\_notification\_enabled":false,"mail\_notification\_email":"","mail\_notification\_smtp":"smtp.changeme.com","mail\_notification\_ssl\_enabled":false,"mail\_notification\_auth\_enabled":false,"mail\_notification\_username":"","mail\_notification\_password":"","autorun\_enabled":false,"autorun\_program":"","preallocate\_all":false,"queueing\_enabled":true,"max\_active\_downloads":2,"max\_active\_torrents":200,"max\_active\_uploads":200,"dont\_count\_slow\_torrents":false,"incomplete\_files\_ext":false,"listen\_port":31498,"upnp":false,"dl\_limit":3072,"up\_limit":3072,"max\_connec":500,"max\_connec\_per\_torrent":100,"max\_uploads\_per\_torrent":15,"enable\_utp":true,"limit\_utp\_rate":false,"limit\_tcp\_overhead":true,"alt\_dl\_limit":1024,"alt\_up\_limit":2048,"scheduler\_enabled":false,"schedule\_from\_hour":8,"schedule\_from\_min":0,"schedule\_to\_hour":20,"schedule\_to\_min":0,"scheduler\_days":0,"dht":true,"dhtSameAsBT":true,"dht\_port":6881,"pex":true,"lsd":true,"encryption":0,"anonymous\_mode":false,"proxy\_type":-1,"proxy\_ip":"0.0.0.0","proxy\_port":8080,"proxy\_peer\_connections":false,"proxy\_auth\_enabled":false,"proxy\_username":"","proxy\_password":"","ip\_filter\_enabled":false,"ip\_filter\_path":null,"web\_ui\_port":80,"web\_ui\_username":"admin","web\_ui\_password":"8888efb275743684292cff99f57867a9","bypass\_local\_auth":false,"use\_https":false,"ssl\_key":"","ssl\_cert":"","dyndns\_enabled":false,"dyndns\_service":0,"dyndns\_username":"","dyndns\_password":"","dyndns\_domain":"changeme.dyndns.org"}
```
where
|Property|Type|Description|
|`locale`|string|Currently selected language (e.g. en\_GB for English)|
|`save\_path`|string|Default save path for torrents, separated by slashes|
|`temp\_path\_enabled`|bool|True if folder for incomplete torrents is enabled|
|`temp\_path`|string|Path for incomplete torrents, separated by slashes|
|`scan\_dirs`|string|List of watch folders to add torrent automatically; slashes are used as path separators; list entries are separated by commas|
|`download\_in\_scan\_dirs`|bool|True if torrents should be downloaded to watch folder; list entries are separated by commas|
|`export\_dir\_enabled`|bool|True if .torrent file should be copied to export directory upon adding|
|`export\_dir`|string|Path to directory to copy .torrent files if `export\_dir\_enabled` is enabled; path is separated by slashes|
|`mail\_notification\_enabled`|bool|True if e-mail notification should be enabled|
|`mail\_notification\_email`|string|e-mail to send notifications to|
|`mail\_notification\_smtp`|string|smtp server for e-mail notifications|
|`mail\_notification\_ssl\_enabled`|bool|True if smtp server requires SSL connection|
|`mail\_notification\_auth\_enabled`|bool|True if smtp server requires authentication|
|`mail\_notification\_username`|string|Username for smtp authentication|
|`mail\_notification\_password`|string|Password for smtp authentication|
|`autorun\_enabled`|bool|True if external program should be run after torrent has finished downloading|
|`autorun\_program`|string|Program path/name/arguments to run if `autorun\_enabled` is enabled; path is separated by slashes; you can use `%f` and `%n` arguments, which will be expanded by qBittorrent as path\_to\_torrent\_file and torrent\_name (from the GUI; not the .torrent file name) respectively|
|`preallocate\_all`|bool|True if file preallocation should take place, otherwise sparse files are used|
|`queueing\_enabled`|bool|True if torrent queuing is enabled|
|`max\_active\_downloads`|integer|Maximum number of active simultaneous downloads|
|`max\_active\_torrents`|integer|Maximum number of active simultaneous downloads and uploads|
|`max\_active\_uploads`|integer|Maximum number of active simultaneous uploads|
|`dont\_count\_slow\_torrents`|bool|If true torrents w/o any activity (stalled ones) will not be counted towards `max\_active\_\*` limits; see [dont\_count\_slow\_torrents](https://www.libtorrent.org/reference-Settings.html#dont_count_slow_torrents) for more information|
|`max\_ratio\_enabled``API3`|bool|True if share ratio limit is enabled|
|`max\_ratio``API3`|float|Get the global share ratio limit|
|`max\_ratio\_act``API3`|bool|Action performed when a torrent reaches the maximum share ratio. See list of possible values here below.|
|`incomplete\_files\_ext`|bool|If true `.!qB` extension will be appended to incomplete files|
|`listen\_port`|integer|Port for incoming connections|
|`upnp`|bool|True if UPnP/NAT-PMP is enabled|
|`random\_port``API3`|bool|True if the port is randomly selected|
|`dl\_limit`|integer|Global download speed limit in KiB/s; `-1` means no limit is applied|
|`up\_limit`|integer|Global upload speed limit in KiB/s; `-1` means no limit is applied|
|`max\_connec`|integer|Maximum global number of simultaneous connections|
|`max\_connec\_per\_torrent`|integer|Maximum number of simultaneous connections per torrent|
|`max\_uploads``API3`|integer|Maximum number of upload slots|
|`max\_uploads\_per\_torrent`|integer|Maximum number of upload slots per torrent|
|`enable\_utp`|bool|True if uTP protocol should be enabled; this option is only available in qBittorrent built against libtorrent version 0.16.X and higher|
|`limit\_utp\_rate`|bool|True if `[du]l\_limit` should be applied to uTP connections; this option is only available in qBittorrent built against libtorrent version 0.16.X and higher|
|`limit\_tcp\_overhead`|bool|True if `[du]l\_limit` should be applied to estimated TCP overhead (service data: e.g. packet headers)|
|`alt\_dl\_limit`|integer|Alternative global download speed limit in KiB/s|
|`alt\_up\_limit`|integer|Alternative global upload speed limit in KiB/s|
|`scheduler\_enabled`|bool|True if alternative limits should be applied according to schedule|
|`schedule\_from\_hour`|integer|Scheduler starting hour|
|`schedule\_from\_min`|integer|Scheduler starting minute|
|`schedule\_to\_hour`|integer|Scheduler ending hour|
|`schedule\_to\_min`|integer|Scheduler ending minute|
|`scheduler\_days`|integer|Scheduler days. See possible values here below|
|`dht`|bool|True if DHT is enabled|
|`dhtSameAsBT`|bool|True if DHT port should match TCP port|
|`dht\_port`|integer|DHT port if `dhtSameAsBT` is false|
|`pex`|bool|True if PeX is enabled|
|`lsd`|bool|True if LSD is enabled|
|`encryption`|integer|See list of possible values here below|
|`anonymous\_mode`|bool|If true anonymous mode will be enabled; read more [here](Anonymous-Mode); this option is only available in qBittorrent built against libtorrent version 0.16.X and higher|
|`proxy\_type`|integer|See list of possible values here below|
|`proxy\_ip`|string|Proxy IP address or domain name|
|`proxy\_port`|integer|Proxy port|
|`proxy\_peer\_connections`|bool|True if peer and web seed connections should be proxified; this option will have any effect only in qBittorrent built against libtorrent version 0.16.X and higher|
|`force\_proxy``API3`|bool|True if the connections not supported by the proxy are disabled|
|`proxy\_auth\_enabled`|bool|True proxy requires authentication; doesn't apply to SOCKS4 proxies|
|`proxy\_username`|string|Username for proxy authentication|
|`proxy\_password`|string|Password for proxy authentication|
|`ip\_filter\_enabled`|bool|True if external IP filter should be enabled|
|`ip\_filter\_path`|string|Path to IP filter file (.dat, .p2p, .p2b files are supported); path is separated by slashes|
|`ip\_filter\_trackers``API3`|bool|True if IP filters are applied to trackers|
|`web\_ui\_port`|integer|WebUI port|
|`web\_ui\_upnp``API4`|bool|True if UPnP is used for the WebUI port|
|`web\_ui\_username`|string|WebUI username|
|`web\_ui\_password`|string|MD5 hash of WebUI password; hash is generated from the following string: `username:Web UI Access:plain\_text\_web\_ui\_password`|
|`web\_ui\_csrf\_protection\_enabled`|bool|True if WebUI CSRF protection is enabled|
|`web\_ui\_clickjacking\_protection\_enabled`|bool|True if WebUI clickjacking protection is enabled|
|`bypass\_local\_auth`|bool|True if authentication challenge for loopback address (127.0.0.1) should be disabled|
|`bypass\_auth\_subnet\_whitelist\_enabled`|bool|True if webui authentication should be bypassed for clients whose ip resides within (at least) one of the subnets on the whitelist|
|`bypass\_auth\_subnet\_whitelist`|string|(White)list of ipv4/ipv6 subnets for which webui authentication should be bypassed; list entries are separated by commas|
|`use\_https`|bool|True if WebUI HTTPS access is enabled|
|`ssl\_key`|string|SSL keyfile contents (this is a not a path)|
|`ssl\_cert`|string|SSL certificate contents (this is a not a path)|
|`dyndns\_enabled`|bool|True if server DNS should be updated dynamically|
|`dyndns\_service`|integer|See list of possible values here below|
|`dyndns\_username`|string|Username for DDNS service|
|`dyndns\_password`|string|Password for DDNS service|
|`dyndns\_domain`|string|Your DDNS domain name|
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
### Get partial data
[](#get-partial-data)
Request only for changes since the last request.
```
GET /sync/maindata HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
```
Params:
|Param|Description|
|`rid`|Response ID. If not provided, `rid=0` will be assumed. If the given `rid` is different from the one of last server reply, `full\_update` will be `true` (see the server reply details for more info)|
Example:
```
http://127.0.0.1/sync/maindata?rid=14
```
Server reply (example):
```
HTTP/1.1 200 OK
content-type: application/json
content-length: length
{"rid":15,"torrents":{"8c212779b4abde7c6bc608063a0d008b7e40ce32":{"state":"pausedUP"}}}
```
|Property|Type|Description|
|`rid`|integer|Response ID|
|`full\_update`|bool|Whether the response contains all the data or partial data|
|`torrents`|object|Property: torrent hash, value: same as [torrent list](#get-torrent-list)|
|`torrents\_removed`|array|List of hashes of torrents removed since last request|
|`categories`|array|List of categories added since last request|
|`categories\_removed`|array|List of categories removed since last request|
|`queueing`|bool|Priority system usage flag|
|`server\_state`|object|Same as [global transfer info](#get-global-transfer-info)|
### Get log
[](#get-log)
```
GET /query/getLog HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
```
Params:
|Param|Type|Description|
|`normal`|bool|Include normal messages (default: `true`)|
|`info`|bool|Include info messages (default: `true`)|
|`warning`|bool|Include warning messages (default: `true`)|
|`critical`|bool|Include critical messages (default: `true`)|
|`last\_known\_id`|integer|Exclude messages with "message id" \<= `last\_known\_id` (default: `-1`)|
Example:
```
/query/getLog?normal=true&info=true&warning=true&critical=true&last\_known\_id=-1
```
Server will return the following reply (example):
```
HTTP/1.1 200 OK
content-type: application/json
content-length: length
[{"id":0,"message":"qBittorrent v3.4.0 started","timestamp":1507969127860,"type":1},{"id":1,"message":"qBittorrent is trying to listen on any interface port: 19036","timestamp":1507969127869,"type":2},{"id":2,"message":"Peer ID: -qB3400-","timestamp":1507969127870,"type":1},{"id":3,"message":"HTTP User-Agent is 'qBittorrent/3.4.0'","timestamp":1507969127870,"type":1},{"id":4,"message":"DHT support [ON]","timestamp":1507969127871,"type":2},{"id":5,"message":"Local Peer Discovery support [ON]","timestamp":1507969127871,"type":2},{"id":6,"message":"PeX support [ON]","timestamp":1507969127871,"type":2},{"id":7,"message":"Anonymous mode [OFF]","timestamp":1507969127871,"type":2},{"id":8,"message":"Encryption support [ON]","timestamp":1507969127871,"type":2},{"id":9,"message":"Embedded Tracker [OFF]","timestamp":1507969127871,"type":2},{"id":10,"message":"UPnP / NAT-PMP support [ON]","timestamp":1507969127873,"type":2},{"id":11,"message":"Web UI: Now listening on port 8080","timestamp":1507969127883,"type":1},{"id":12,"message":"Options were saved successfully.","timestamp":1507969128055,"type":1},{"id":13,"message":"qBittorrent is successfully listening on interface :: port: TCP/19036","timestamp":1507969128270,"type":2},{"id":14,"message":"qBittorrent is successfully listening on interface 0.0.0.0 port: TCP/19036","timestamp":1507969128271,"type":2},{"id":15,"message":"qBittorrent is successfully listening on interface 0.0.0.0 port: UDP/19036","timestamp":1507969128272,"type":2}]
```
|Property|Type|Description|
|`id`|integer|ID of the message|
|`message`|string|Text of the message|
|`timestamp`|integer|Milliseconds since epoch|
|`type`|integer|Type of the message: Log::NORMAL: `1`, Log::INFO: `2`, Log::WARNING: `4`, Log::CRITICAL: `8`|
# POST methods
[](#post-methods)
### Download torrent from URL
[](#download-torrent-from-url)
This method can add torrents from URLs. `http://`, `https://`, `magnet:` and `bc://bt/` links are supported.
**After qBittorrent v3.3.1 `API7` (included):**
```
POST /command/download HTTP/1.1
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
Content-Disposition: form-data; name="cookie"
ui=28979218048197
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
|Property|Type|Description|
|`urls`|string|URLs separated with newlines|
|`savepath`|string|(optional) Download folder|
|`cookie`|string|(optional) Cookie sent to download the .torrent file|
|`category`|string|(optional) Category for the torrent|
|`skip\_checking``API13`|string|(optional) Skip hash checking. Possible values are `true`, `false` (default)|
|`paused``API13`|string|(optional) Add torrents in the paused state. Possible values are `true`, `false` (default)|
|`root\_folder``API15`|string|(optional) Create the root folder. Possible values are `true`, `false`, unset (default)|
|`rename`|string|(optional) Rename torrent|
|`upLimit`|integer|(optional) Set torrent upload speed limit. Unit in bytes/second|
|`dlLimit`|integer|(optional) Set torrent download speed limit. Unit in bytes/second|
|`sequentialDownload`|string|(optional) Enable sequential download. Possible values are `true`, `false` (default)|
|`firstLastPiecePrio`|string|(optional) Prioritize download first last piece. Possible values are `true`, `false` (default)|
**Before qBittorrent v3.3.1 `API6`:**
```
POST /command/download HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
urls=http://www.nyaa.eu/?page=download%26tid=305093%0Ahttp://www.nyaa.eu/?page=download%26tid=305255%0Amagnet:?xt=urn:btih:4c284ebef5bf0d967e2e174cfe825d9fb40ae5e1%26dn=QBittorrent+2.8.4+Win7+Vista+64+working+version%26tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A80%26tr=udp%3A%2F%2Ftracker.publicbt.com%3A80%26tr=udp%3A%2F%2Ftracker.istole.it%3A6969%26tr=udp%3A%2F%2Ftracker.ccc.de%3A80
```
Please note that:
1. `Content-Type: application/x-www-form-urlencoded` is required
2. `urls` contains a list of links; links are separated with `%0A` (LF newline)
3. Links' contents must be escaped, e.g. `&` becomes `%26` (don't know about other characters but ampersand **MUST** be escaped)
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Upload torrent from disk
[](#upload-torrent-from-disk)
```
POST /command/upload HTTP/1.1
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
|`torrents`|raw|Raw data of torrent file. `torrents` can be presented multiple times.|
|`savepath`|string|(optional) Download folder|
|`cookie`|string|(optional) Cookie sent to download the .torrent file|
|`category`|string|(optional) Category for the torrent|
|`skip\_checking``API13`|string|(optional) Skip hash checking. Possible values are `true`, `false` (default)|
|`paused``API13`|string|(optional) Add torrents in the paused state. Possible values are `true`, `false` (default)|
|`root\_folder``API15`|string|(optional) Create the root folder. Possible values are `true`, `false`, unset (default)|
|`rename`|string|(optional) Rename torrent|
|`upLimit`|integer|(optional) Set torrent upload speed limit. Unit in bytes/second|
|`dlLimit`|integer|(optional) Set torrent download speed limit. Unit in bytes/second|
|`sequentialDownload`|string|(optional) Enable sequential download. Possible values are `true`, `false` (default)|
|`firstLastPiecePrio`|string|(optional) Prioritize download first last piece. Possible values are `true`, `false` (default)|
### Add trackers to torrent
[](#add-trackers-to-torrent)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/addTrackers HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hash=8c212779b4abde7c6bc608063a0d008b7e40ce32&urls=http://192.168.0.1/announce%0Audp://192.168.0.1:3333/dummyAnnounce
```
This adds two trackers to torrent with hash `8c212779b4abde7c6bc608063a0d008b7e40ce32`. Note `%0A` (aka LF newline) between trackers. Ampersand in tracker urls **MUST** be escaped.
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Pause torrent
[](#pause-torrent)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/pause HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hash=8c212779b4abde7c6bc608063a0d008b7e40ce32
```
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Pause all torrents
[](#pause-all-torrents)
```
POST /command/pauseAll HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Length: 0
```
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Resume torrent
[](#resume-torrent)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/resume HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hash=8c212779b4abde7c6bc608063a0d008b7e40ce32
```
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Resume all torrents
[](#resume-all-torrents)
```
POST /command/resumeAll HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Length: 0
```
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Delete torrent
[](#delete-torrent)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/delete HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32
```
`hashes` can contain multiple hashes separated by `|`
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Delete torrent with downloaded data
[](#delete-torrent-with-downloaded-data)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/deletePerm HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32
```
`hashes` can contain multiple hashes separated by `|`
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Recheck torrent
[](#recheck-torrent)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/recheck HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hash=8c212779b4abde7c6bc608063a0d008b7e40ce32
```
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Increase torrent priority
[](#increase-torrent-priority)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/increasePrio HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32
```
`hashes` can contain multiple hashes separated by `|`
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Decrease torrent priority
[](#decrease-torrent-priority)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/decreasePrio HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32
```
`hashes` can contain multiple hashes separated by `|`
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Maximal torrent priority
[](#maximal-torrent-priority)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/topPrio HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32
```
`hashes` can contain multiple hashes separated by `|`
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Minimal torrent priority
[](#minimal-torrent-priority)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/bottomPrio HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32
```
`hashes` can contain multiple hashes separated by `|`
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Set file priority
[](#set-file-priority)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/setFilePrio HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hash=8c212779b4abde7c6bc608063a0d008b7e40ce32&id=0&priority=7
```
Please consult [torrent contents API](#get-torrent-contents) for possible `priority` values. `id` values coresspond to contents returned by [torrent contents API](#get-torrent-contents), e.g. `id=0` for first file, `id=1` for second file, etc.
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Get global download limit
[](#get-global-download-limit)
```
POST /command/getGlobalDlLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Length: 0
```
Server reply (example):
```
HTTP/1.1 200 OK
content-type: text/plain
content-length: length
3145728
```
`3145728` is the value of current global download speed limit in bytes; this value will be zero if no limit is applied.
### Set global download limit
[](#set-global-download-limit)
```
POST /command/setGlobalDlLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
limit=4194304
```
`limit` is global download speed limit you want to set in bytes.
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Get global upload limit
[](#get-global-upload-limit)
```
POST /command/getGlobalUpLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Length: 0
```
Server reply (example):
```
HTTP/1.1 200 OK
content-type: text/plain
content-length: length
3145728
```
`3145728` is the value of current global upload speed limit in bytes; this value will be zero if no limit is applied.
### Set global upload limit
[](#set-global-upload-limit)
```
POST /command/setGlobalUpLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
limit=4194304
```
`limit` is global upload speed limit you want to set in bytes.
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Get torrent download limit
[](#get-torrent-download-limit)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/getTorrentsDlLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|284b83c9c7935002391129fd97f43db5d7cc2ba0
```
`hashes` can contain multiple hashes separated by `|`
Server reply (example):
```
HTTP/1.1 200 OK
content-type: application/json
content-length: length
{"8c212779b4abde7c6bc608063a0d008b7e40ce32":338944,"284b83c9c7935002391129fd97f43db5d7cc2ba0":123}
```
`8c212779b4abde7c6bc608063a0d008b7e40ce32` is the hash of the torrent and `338944` its download speed limit in bytes per second; this value will be zero if no limit is applied.
### Set torrent download limit
[](#set-torrent-download-limit)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/setTorrentsDlLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|284b83c9c7935002391129fd97f43db5d7cc2ba0&limit=131072
```
`hashes` can contain multiple hashes separated by `|`
`limit` is the download speed limit in bytes per second you want to set.
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Get torrent upload limit
[](#get-torrent-upload-limit)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/getTorrentsUpLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|284b83c9c7935002391129fd97f43db5d7cc2ba0
```
`hashes` can contain multiple hashes separated by `|`
Server reply (example):
```
HTTP/1.1 200 OK
content-type: application/json
content-length: length
{"8c212779b4abde7c6bc608063a0d008b7e40ce32":338944,"284b83c9c7935002391129fd97f43db5d7cc2ba0":123}
```
`8c212779b4abde7c6bc608063a0d008b7e40ce32` is the hash of the torrent in the request and `338944` its upload speed limit in bytes per second; this value will be zero if no limit is applied.
### Set torrent upload limit
[](#set-torrent-upload-limit)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/setTorrentsUpLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|284b83c9c7935002391129fd97f43db5d7cc2ba0&limit=131072
```
`hashes` can contain multiple hashes separated by `|`
`limit` is the upload speed limit in bytes per second you want to set.
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Set torrent location
[](#set-torrent-location)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/setLocation HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|284b83c9c7935002391129fd97f43db5d7cc2ba0&location=/mnt/nfs/media
```
`hashes` can contain multiple hashes separated by `|`
`location` is the location to download the torrent to. If the location doesn't exist, the torrent's location is unchanged.
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Set torrent name
[](#set-torrent-name)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/rename HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hash=8c212779b4abde7c6bc608063a0d008b7e40ce32&name=This%20is%20a%20test
```
If your torrent hash is invalid or the name is empty, the server will reply with:
```
HTTP/1.1 400 Incorrect torrent hash or name
```
Otherwise, the server will reply with:
```
HTTP/1.1 200 OK
```
### Set torrent category
[](#set-torrent-category)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/setCategory HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|284b83c9c7935002391129fd97f43db5d7cc2ba0&category=CategoryName
```
`hashes` can contain multiple hashes separated by `|`
`category` is the torrent category you want to set. If the category doesn't exist, a new category is created.
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Add new category
[](#add-new-category)
```
POST /command/addCategory HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
category=CategoryName
```
`category` is the category you want to create.
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Remove categories
[](#remove-categories)
```
POST /command/removeCategories HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
categories=Category1%0ACategory2
```
`categories` can contain multiple cateogies separated by `\\n` (%0A urlencoded)
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Set automatic torrent management
[](#set-automatic-torrent-management)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/setAutoTMM HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32|284b83c9c7935002391129fd97f43db5d7cc2ba0&enable=true
```
`hashes` can contain multiple hashes separated by `|`
`enable` is a boolean, affects the torrents listed in `hashes`, default is `false`
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Set qBittorrent preferences
[](#set-qbittorrent-preferences)
```
POST /command/setPreferences HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
json={"save\_path":"C:/Users/Dayman/Downloads","queueing\_enabled":false,"scan\_dirs":["C:/Games","D:/Downloads"],"download\_in\_scan\_dirs":[false,true]}
```
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
1. There is no need to pass all possible preferences' `token:value` pairs if you only want to change one option
2. When setting preferences `scan\_dirs` must **always** be accompanied with `download\_in\_scan\_dirs`
3. Paths in `scan\_dirs` must exist, otherwise this option will have no effect
4. String values must be quoted; integer and boolean values must never be quoted
For a list of possible preference options see [Get qBittorrent preferences](#get-qbittorrent-preferences)
### Get alternative speed limits state
[](#get-alternative-speed-limits-state)
Get the state of the alternative speed limits. `1` is returned if enabled, `0` otherwise.
```
POST /command/alternativeSpeedLimitsEnabled HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
```
Server reply (example):
```
HTTP/1.1 200 OK
content-type: text/plain
content-length: length
1
```
### Toggle alternative speed limits
[](#toggle-alternative-speed-limits)
Toggle the state of the alternative speed limits
```
POST /command/toggleAlternativeSpeedLimits HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
```
### Toggle sequential download
[](#toggle-sequential-download)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/toggleSequentialDownload HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32
```
`hashes` can contain multiple hashes separated by `|`
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Set first/last piece priority
[](#set-firstlast-piece-priority)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/toggleFirstLastPiecePrio HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32
```
`hashes` can contain multiple hashes separated by `|`
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Set force start
[](#set-force-start)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/setForceStart HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32&value=true
```
`hashes` can contain multiple hashes separated by `|`
`value` is a boolean, affects the torrents listed in `hashes`, default is `false`
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Set super seeding
[](#set-super-seeding)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/setSuperSeeding HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=8c212779b4abde7c6bc608063a0d008b7e40ce32&value=true
```
`hashes` can contain multiple hashes separated by `|`
`value` is a boolean, affects the torrents listed in `hashes`, default is `false`
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Pause all the torrents
[](#pause-all-the-torrents)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/pauseAll HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
```
### Resume all the torrents
[](#resume-all-the-torrents)
Requires knowing the torrent hash. You can get it from [torrent list](#get-torrent-list).
```
POST /command/resumeAll HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Cookie: SID=your\_sid
Content-Type: application/x-www-form-urlencoded
Content-Length: length
```
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