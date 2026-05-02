WebUI API (qBittorrent v3.1.x) · qbittorrent/qBittorrent Wiki · GitHub
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
# WebUI API (qBittorrent v3.1.x)
[Jump to bottom](#wiki-pages-box)
xavier2k6 edited this page Jan 22, 2026
&middot;
[7 revisions](/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-v3.1.x)/_history)
This WebUI API documentation applies to qBittorrent v3.1.x. For other API versions, visit [WebUI API](https://github.com/qbittorrent/qBittorrent/wiki#WebUI-API).
# Table of Contents
[](#table-of-contents)
1. [Authorization](#authorization)
2. [GET methods](#get-methods)
3. [Shutdown qBittorrent](#shutdown-qbittorrent)
4. [Get torrent list](#get-torrent-list)
5. [Get torrent generic properties](#get-torrent-generic-properties)
6. [Get torrent trackers](#get-torrent-trackers)
7. [Get torrent contents](#get-torrent-contents)
8. [Get global transfer info](#get-global-transfer-info)
9. [Get qBittorrent preferences](#get-qbittorrent-preferences)
10. [POST methods](#post-methods)
11. [Download torrent from URL](#download-torrent-from-url)
12. [Upload torrent from disk](#upload-torrent-from-disk)
13. [Add trackers to torrent](#add-trackers-to-torrent)
14. [Pause torrent](#pause-torrent)
15. [Pause all torrents](#pause-all-torrents)
16. [Resume torrent](#resume-torrent)
17. [Resume all torrents](#resume-all-torrents)
18. [Delete torrent](#delete-torrent)
19. [Delete torrent with downloaded data](#delete-torrent-with-downloaded-data)
20. [Recheck torrent](#recheck-torrent)
21. [Increase torrent priority](#increase-torrent-priority)
22. [Decrease torrent priority](#decrease-torrent-priority)
23. [Maximal torrent priority](#maximal-torrent-priority)
24. [Minimal torrent priority](#minimal-torrent-priority)
25. [Set file priority](#set-file-priority)
26. [Get global download limit](#get-global-download-limit)
27. [Set global download limit](#set-global-download-limit)
28. [Get global upload limit](#get-global-upload-limit)
29. [Set global upload limit](#set-global-upload-limit)
30. [Get torrent download limit](#get-torrent-download-limit)
31. [Set torrent download limit](#set-torrent-download-limit)
32. [Get torrent upload limit](#get-torrent-upload-limit)
33. [Set torrent upload limit](#set-torrent-upload-limit)
34. [Set qBittorrent preferences](#set-qbittorrent-preferences)
35. [Additional information](#additional-information)
36. [Version 3.0.8 bugs](#version-308-bugs)
# Authorization
[](#authorization)
Authorization requires using `Authorization` header inside GET/POST requests. qBittorrent uses the standard Digest Authorization type (using a MD5 hash generator).
For example on Python using [requests](http://docs.python-requests.org/en/latest/):
```
`import requests
from requests.auth import HTTPDigestAuth
response = requests.post('http://127.0.0.1:8080/command/download', {'urls': magnet\_link}, auth=HTTPDigestAuth(username, password))
if not response.ok:
response.raise\_for\_status()
response.content
`
```
1. Digest Authorization standard
[This page](http://www.w3.org/People/Raggett/security/draft-ietf-http-digest-aa-00.txt) describes how this auth method should ideally work. The most important thing there is `response` field generation.
Response is generated like this: `MD5 ( A1 + ':' + nonce + ':' + A2 )` where
A1 is `MD5 (username + ':' + realm + ':' + password)`
A2 is `MD5 (\<method type string (e.g. GET or POST)\> + ':' + uri)`
1. Server Auth response
When you fail Authorization or don't supply required header qBittorrent will send the following reply (example):
```
HTTP/1.1 401 Unauthorized
WWW-Authenticate: Digest realm="Web UI Access", nonce="a3f396f2dcc1cafae73637e2ac321134", opaque="a3f396f2dcc1cafae73637e2ac321134", stale="false", algorithm="MD5", qop="auth"
```
`nonce` and `opaque` values will be random, nevertheless it looks like matching them is not required for successful authorization - qBittorrent doesn't track user session.
1. Client Auth request
We will now generate our request to the server containing proper Authorization header based on the example above.
1. User-Agent
You can place whatever you want as user agent, it is not required anyway.
`User-Agent: Fiddler`
2. Host
Server address or domain name.
`Host: 127.0.0.1`
3. Authorization
This header is required.
```
``
```
Authorization: Digest username="admin", realm="Web UI Access", nonce="a3f396f2dcc1cafae73637e2ac321134", uri="/", response="4067cfe4c029cd00b56076c78abd034c"
```
```
` All fields in this header are required. Since `nonce` is not tracked by qBittorrent you should MD5-generate it yourself either one-time or each time you do any request. `uri` is not checked, if you want to GET host/someurl and `uri` doesn't match this value - no problem, just remember that `uri` is used in `response` generation.
In Short: \*\*You don't need a previous server reply in order to generate a proper request.\*\*
You must supply Authorization header in any POST/GET request you issue.
`
```
1. End Result
Server reply:
```
```
HTTP/1.1 401 Unauthorized
WWW-Authenticate: Digest realm="Web UI Access", nonce="a3f396f2dcc1cafae73637e2ac321134", opaque="a3f396f2dcc1cafae73637e2ac321134", stale="false", algorithm="MD5", qop="auth"
```
```
` Client request:
```http
`
```
GET / HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: Digest username="admin", realm="Web UI Access", nonce="a3f396f2dcc1cafae73637e2ac321134", uri="/", response="4067cfe4c029cd00b56076c78abd034c"
```
# GET methods
[](#get-methods)
### Shutdown qBittorrent
[](#shutdown-qbittorrent)
```
GET /command/shutdown HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
```
### Get torrent list
[](#get-torrent-list)
```
GET /json/torrents HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
```
Server will return the following reply (example):
```
HTTP/1.1 200 OK
content-type: text/javascript
content-length: length
[{"hash":"0283b35cc14387a4f6d01de33aa012fb1b740df6","name":"Sword of the Stars II Enhanced Edition","size":"1.8 ГиБ","progress":1,"dlspeed":"0 Б/с","upspeed":"0 Б/с","priority":"\*","num\_seeds":"0","num\_leechs":"0","ratio":"0.1","eta":"∞","state":"stalledUP"},{another\_torrent\_info}]
```
where
`hash` - torrent hash; most queries will use torrent hash as parameter
`name` - torrent name
`size` - size of files and folders in torrent selected for download; possible values:
1. `Unknown` - this may happen, which means qBt couldn't determine torrent size for some reason
2. `X suffix` - X B/KiB/MiB/GiB/TiB
Proper suffix is appended automatically by qBt.
`progress` - float number for download completion percentage, where 1 == 100%, 0 == 0%, and, 0.58 == 58%
`dlspeed` and `upspeed`: torrent download and upload speed respectively, possible values:
1. `Unknown` - qBt couldn't determine torrent speed for some reason
2. `X suffix/s` - X B/KiB/MiB/GiB/TiB
`priority` - torrent number in priority queue; contains `\*` if queuing is disabled or torrent is in seed mode
`num\_seeds` and `num\_leechs` - number of peers and lecchers
`ratio` - Uploaded/Downloaded ratio, rounded to first digit after comma; contains `∞` if ratio \> 100
`eta` - contains `∞` if torrent is seeding only or eta \>= 8640000 seconds; possible values:
1. `0` - zero
2. `\< 1m` - less than a minute
3. `MMm` - MM minutes
4. `HHh MMm` - HH hours and MM minutes
5. `DDd HHh` - DD days and HH hours
DD/HH/MM values can be truncated if first digit is zero
`state` - torrent state, possible values:
1. `error` - some error occurred, applies to paused torrents
2. `pausedUP` - torrent is paused and has finished downloading
3. `pausedDL` - torrent is paused and has **NOT** finished downloading
4. `queuedUP` - queuing is enabled and torrent is queued for upload
5. `queuedDL` - queuing is enabled and torrent is queued for download
6. `uploading` - torrent is being seeded and data is being transferred
7. `stalledUP` - torrent is being seeded, but no connection were made
8. `checkingUP` - torrent has finished downloading and is being checked; this status also applies to preallocation (if enabled) and checking resume data on qBt startup
9. `checkingDL` - same as `checkingUP`, but torrent has **NOT** finished downloading
10. `downloading` - torrent is being downloaded and data is being transferred
11. `stalledDL` - torrent is being downloaded, but no connection were made
**BIG FAT WARNING:** `size`, `dlspeed`, `upspeed` and `eta` suffixes (e.g. MiB, KiB/s) will depend on current language selected in qBt; these suffixes will be translated.
**BIG FAT WARNING 2:** Raw data this methods provides can exceed 40 KiB for \~200 torrents. Continuous polling is strongly discouraged for mobile clients.
### Get torrent generic properties
[](#get-torrent-generic-properties)
Requires known torrent hash, get 'em from [torrent list](#torrentlist).
```
GET /json/propertiesGeneral/fae6e49afa359ab07c3ef169438ff95d870bc178 HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
```
If your torrent hash is invalid server will reply with:
```
HTTP/1.1 200 OK
content-type: text/javascript
content-length: 0
```
Otherwise server will return the following reply (example):
```
HTTP/1.1 200 OK
content-type: text/javascript
content-length: length
{"save\_path":"D:/Downloads/somefolder","creation\_date":"16 ноября 2011 г. 20:52:54","piece\_size":"4.0 МиБ","comment":"comment\_string\_if\_any","total\_wasted":"0 Б","total\_uploaded":"41.9 ГиБ (0 Б за эту сессию)","total\_downloaded":"261.2 МиБ (0 Б за эту сессию)","up\_limit":"∞","dl\_limit":"∞","time\_elapsed":"53д 0ч (Раздается 0)","nb\_connections":"0 (100 макс)","share\_ratio":"∞"}
```
where
`path` - path where torrent contents are saved, separated by slashes
`creation\_date` - (translated string) date when torrent was added
`piece\_size` - (translated string) torrent piece size
`comment` - torrent comment
`total\_wasted` - (translated string) amount of data 'wasted'
`total\_uploaded` and `total\_downloaded` - (translated string) amounts of data uploaded and downloaded, value in parentheses count current session data only
`up\_limit` and `dl\_limit` - (translated string) upload and download speed limits for current torrent
`time\_elapsed` - (translated string) total time active; value in parentheses represents current seeding time
`nb\_connections` - (translated string) number of connections, value in parentheses represents maximum number of connections per torrent set in preferences
`share\_ratio` - (translated string) UL/DL ratio; contains `∞` for ratios \> 100
### Get torrent trackers
[](#get-torrent-trackers)
Requires known torrent hash, get 'em from [torrent list](#torrentlist).
```
GET http://127.0.0.1/json/propertiesTrackers/fae6e49afa359ab07c3ef169438ff95d870bc178 HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
```
If your torrent hash is invalid server will reply with:
```
HTTP/1.1 200 OK
content-type: text/javascript
content-length: 2
[]
```
Otherwise server will return the following reply (example):
```
HTTP/1.1 200 OK
content-type: text/javascript
content-length: length
[{"url":"http://someaddress/announce","status":"Работает","num\_peers":"1","msg":""},{"url":"http://retracker.local/announce","status":"Не соединился","num\_peers":"0","msg":""}]
```
where
`url` - tracker url
`status` - (translated string) tracker status; possible values:
1. `Working` - tracker has been contacted and is working
2. `Updating...` - tracker is currently being updated
3. `Not working` - tracker has been contacted, but it is not working (or doesn't send proper replies)
4. `Not contacted yet` - tracker has not been contacted yet
`num\_peers` - number of peers for current torrent eported by tracker
`msg` - tracker message (there is no way of knowing what this message is - it's up to tracker admins)
### Get torrent contents
[](#get-torrent-contents)
Requires known torrent hash, get 'em from [torrent list](#torrentlist).
```
GET http://127.0.0.1/json/propertiesFiles/fae6e49afa359ab07c3ef169438ff95d870bc178 HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
```
If your torrent hash is invalid server will reply with:
```
HTTP/1.1 200 OK
content-type: text/javascript
content-length: 0
```
Otherwise server will return the following reply (example):
```
HTTP/1.1 200 OK
content-type: text/javascript
content-length: length
[{"name":"Isekai no Seikishi Monogatari 01.mka","size":"70.4 МиБ","progress":0,"priority":0,"is\_seed":true},{"name":"Isekai no Seikishi Monogatari 02.mka","size":"62.4 МиБ","progress":0,"priority":0}]
```
where
`name` - file name
`size` - (translated string) file size
`progress` - float value, indicating file progress; 0 == 0% and 1 == 100%
`priority` - file priority, possible values:
1. `0` - do not download
2. `1` - normal priority
3. `2` - high priority
4. `7` - maximal priority
`is\_seed` - only present for the first file in torrent; true if torrent is in seed mode
### Get global transfer info
[](#get-global-transfer-info)
This method returns info you usually see in qBt status bar.
```
GET http://127.0.0.1/json/transferInfo HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
```
Server reply (example):
```
HTTP/1.1 200 OK
content-type: text/javascript
content-length: length
{"dl\_info":"Приём: 0 Б/с - Передано: 0 Б","up\_info":"Отдача: 209.9 КиБ/с - Передано: 7.2 ГиБ"}
```
where
`dl\_info` - (translated string) contains current global download speed and global amount of data downloaded during this session
`up\_info` - (translated string) contains current global upload speed and global amount of data uploaded during this session
### Get qBittorrent preferences
[](#get-qbittorrent-preferences)
```
GET http://127.0.0.1/json/preferences HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
```
Server reply; contents may vary depending on which settings are present in qBittorrent.ini (example):
```
HTTP/1.1 200 OK
content-type: text/javascript
content-length: length
{"locale":"ru\_RU","save\_path":"C:/Users/Dayman/Downloads","temp\_path\_enabled":false,"temp\_path":"C:/Users/Dayman/Documents/Downloads/temp","scan\_dirs":["D:/Browser Downloads"],"download\_in\_scan\_dirs":[false],"export\_dir\_enabled":false,"export\_dir":"","mail\_notification\_enabled":false,"mail\_notification\_email":"","mail\_notification\_smtp":"smtp.changeme.com","mail\_notification\_ssl\_enabled":false,"mail\_notification\_auth\_enabled":false,"mail\_notification\_username":"","mail\_notification\_password":"","autorun\_enabled":false,"autorun\_program":"","preallocate\_all":false,"queueing\_enabled":true,"max\_active\_downloads":2,"max\_active\_torrents":200,"max\_active\_uploads":200,"dont\_count\_slow\_torrents":false,"incomplete\_files\_ext":false,"listen\_port":31498,"upnp":false,"dl\_limit":3072,"up\_limit":3072,"max\_connec":500,"max\_connec\_per\_torrent":100,"max\_uploads\_per\_torrent":15,"enable\_utp":true,"limit\_utp\_rate":false,"limit\_tcp\_overhead":true,"alt\_dl\_limit":1024,"alt\_up\_limit":2048,"scheduler\_enabled":false,"schedule\_from\_hour":8,"schedule\_from\_min":0,"schedule\_to\_hour":20,"schedule\_to\_min":0,"scheduler\_days":0,"dht":true,"dhtSameAsBT":true,"dht\_port":6881,"pex":true,"lsd":true,"encryption":0,"anonymous\_mode":false,"proxy\_type":-1,"proxy\_ip":"0.0.0.0","proxy\_port":8080,"proxy\_peer\_connections":false,"proxy\_auth\_enabled":false,"proxy\_username":"","proxy\_password":"","ip\_filter\_enabled":false,"ip\_filter\_path":null,"web\_ui\_port":80,"web\_ui\_username":"admin","web\_ui\_password":"8888efb275743684292cff99f57867a9","bypass\_local\_auth":false,"use\_https":false,"ssl\_key":"","ssl\_cert":"","dyndns\_enabled":false,"dyndns\_service":0,"dyndns\_username":"","dyndns\_password":"","dyndns\_domain":"changeme.dyndns.org"}
```
where
`locale` - currently selected language (e.g. en\_GB for english)
`save\_path` - default save path for torrents, separated by slashes
`temp\_path\_enabled` - true if folder for incomplete torrents is enabled
`temp\_path` - path for incomplete torrents, separated by slashes
`scan\_dirs` - list of watch folders to add torrent automatically; slashes are used as path separators; list entries are separated by commas
`download\_in\_scan\_dirs` - true if torrents should be downloaded to watch folder; list entries are separated by commas
`export\_dir\_enabled` - true if .torrent file should be copied to export directory upon adding
`export\_dir` - path to directory to copy .torrent files if `export\_dir\_enabled` is enabled; path is separated by slashes
`mail\_notification\_enabled` - true if e-mail notification should be enabled
`mail\_notification\_email` - e-mail to send notifications to
`mail\_notification\_smtp` - smtp server for e-mail notifications
`mail\_notification\_ssl\_enabled` - true if smtp server requires SSL connection
`mail\_notification\_auth\_enabled` - true if smtp server requires authentication
`mail\_notification\_username` - username for smtp authentication
`mail\_notification\_password` - password for smtp authentication
`autorun\_enabled` - true if external program should be run after torrent has finished downloading
`autorun\_program` - program path/name/arguments to run if `autorun\_enabled` is enabled; path is separated by slashes; you can use `%f` and `%n` arguments, which will be expanded by qBittorrent as path\_to\_torrent\_file and torrent\_name (from the GUI; not the .torrent file name) respectively
`preallocate\_all` - true if file preallocation should take place, otherwise sparse files are used
`queueing\_enabled` - true if torrent queuing is enabled
`max\_active\_downloads` - maximum number of active simultaneous downloads
`max\_active\_torrents` - maximum number of active simultaneous downloads and uploads
`max\_active\_uploads` - maximum number of active simultaneous uploads
`dont\_count\_slow\_torrents` - if true torrents w/o any activity (stalled ones) will not be counted towards `max\_active\_\*` limits; see [dont\_count\_slow\_torrents](https://www.libtorrent.org/reference-Settings.html#dont_count_slow_torrents) for more information
`incomplete\_files\_ext` - if true `.!qB` extension will be appended to incomplete files
`listen\_port` - port for incoming connections
`upnp` - true if UPnP/NAT-PMP is enabled
`dl\_limit` - global download speed limit in KiB/s; `-1` means no limit is applied
`up\_limit` - global upload speed limit in KiB/s; `-1` means no limit is applied
`max\_connec` - maximum global number of simultaneous connections
`max\_connec\_per\_torrent` - maximum number of simultaneous connections per torrent
`max\_uploads\_per\_torrent` - maximum number of upload slots per torrent
`enable\_utp` - true if uTP protocol should be enabled; this option is only available in qBittorrent built against libtorrent version 0.16.X and higher
`limit\_utp\_rate` - true if `[du]l\_limit` should be applied to uTP connections; this option is only available in qBittorrent built against libtorrent version 0.16.X and higher
`limit\_tcp\_overhead` - true if `[du]l\_limit` should be applied to estimated TCP overhead (service data: e.g. packet headers)
`alt\_dl\_limit` - alternative global download speed limit in KiB/s
`alt\_up\_limit` - alternative global upload speed limit in KiB/s
`scheduler\_enabled` - true if alternative limits should be applied according to schedule
`schedule\_from\_hour` - scheduler starting hour
`schedule\_from\_min` - scheduler starting minute
`schedule\_to\_hour` - scheduler ending hour
`schedule\_to\_min` - scheduler ending minute
`scheduler\_days` - scheduler days; possible values:
1. `0` - every day
2. `1` - every weekday
3. `2` - every weekend
4. `3` - every Monday
5. `4` - every Tuesday
6. `5` - every Wednesday
7. `6` - every Thursday
8. `7` - every Friday
9. `8` - every Saturday
10. `9` - every Sunday
`dht` - true if DHT is enabled
`dhtSameAsBT` - true if DHT port should match TCP port
`dht\_port` - DHT port if `dhtSameAsBT` is false
`pex` - true if PeX is enabled
`lsd` - true if LSD is enabled
`encryption` - possible values:
1. `0` - prefer encryption
2. `1` - force encryption on
3. `2` - force encryption off
```
`First options allows you to use both encrypted and unencrypted connections (this is the default); other options are mutually exclusive: e.g. by forcing encryption on you won't be able to use unencrypted connections and vice versa.
`
```
`anonymous\_mode` - if true anonymous mode will be enabled; read more [here](Anonymous-Mode); this option is only available in qBittorrent built against libtorrent version 0.16.X and higher
`proxy\_type` - possible values:
1. `-1` - proxy is disabled
2. `1` - HTTP proxy without authentication
3. `2` - SOCKS5 proxy without authentication
4. `3` - HTTP proxy with authentication
5. `4` - SOCKS5 proxy with authentication
6. `5` - SOCKS4 proxy without authentication
`proxy\_ip` - proxy IP address or domain name
`proxy\_port` - proxy port
`proxy\_peer\_connections` - true if peer and web seed connections should be proxified; this option will have any effect only in qBittorrent built against libtorrent version 0.16.X and higher
`proxy\_auth\_enabled` - true proxy requires authentication; doesn't apply to SOCKS4 proxies
`proxy\_username` - username for proxy authentication
`proxy\_password` - password for proxy authentication
`ip\_filter\_enabled` - true if external IP filter should be enabled
`ip\_filter\_path` - path to IP filter file (.dat, .p2p, .p2b files are supported); path is separated by slashes
`web\_ui\_port` - WebUI port
`web\_ui\_username` - WebUI username
`web\_ui\_password` - MD5 hash of WebUI password; hash is generated from the following string: `username:Web UI Access:plain\_text\_web\_ui\_password`
`bypass\_local\_auth` - true if auithetication challenge for loopback address (127.0.0.1) should be disabled
`use\_https` - true if WebUI HTTPS access is enabled
`ssl\_key` - SSL keyfile contents (this is a not a path)
`ssl\_cert` - SSL certificate contents (this is a not a path)
`dyndns\_enabled` - true if server DNS should be updated dynamically
`dyndns\_service` - possible values:
1. `0` - use DyDNS
2. `1` - use NOIP
`dyndns\_username` - username for DDNS service
`dyndns\_password` - password for DDNS service
`dyndns\_domain` - your DDNS domain name
# POST methods
[](#post-methods)
**Please adjust you auth string aacordingly for POST methods.**
### Download torrent from URL
[](#download-torrent-from-url)
This method can add torrents from urls and magnet links. BC links are also supported.
```
POST http://127.0.0.1/command/download HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Type: application/x-www-form-urlencoded
Content-Length: length
urls=http://www.nyaa.eu/?page=download%26tid=305093%0Ahttp://www.nyaa.eu/?page=download%26tid=305255%0Amagnet:?xt=urn:btih:4c284ebef5bf0d967e2e174cfe825d9fb40ae5e1%26dn=QBittorrent+2.8.4+Win7+Vista+64+working+version%26tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A80%26tr=udp%3A%2F%2Ftracker.publicbt.com%3A80%26tr=udp%3A%2F%2Ftracker.istole.it%3A6969%26tr=udp%3A%2F%2Ftracker.ccc.de%3A80
```
Please note that:
1. `Content-Type: application/x-www-form-urlencoded` is required
2. `urls` contains a list of links; links are separated with `%0A` (LF newline)
3. `http://`, `https://`, `magnet:` and `bc://bt/` links are supported
4. Links' contents must be escaped, e.g. `&` becomes `%26` (don't know about other characters but ampersand **MUST** be escaped)
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Upload torrent from disk
[](#upload-torrent-from-disk)
```
POST http://127.0.0.1/command/upload HTTP/1.1
Content-Type: multipart/form-data; boundary=-------------------------acebdf13572468
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
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
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
content-type: text/html
content-length: 64
\<script type="text/javascript"\>window.parent.hideAll();\</script\>HTTP/1.1 200 OK
content-type: text/html
content-length: 64
\<script type="text/javascript"\>window.parent.hideAll();\</script\>
```
### Add trackers to torrent
[](#add-trackers-to-torrent)
Requires known torrent hash, get 'em from [torrent list](#torrentlist).
```
POST http://127.0.0.1/command/addTrackers HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hash=fae6e49afa359ab07c3ef169438ff95d870bc178&urls=http://192.168.0.1/announce%0Audp://192.168.0.1:3333/dummyAnnounce
```
This adds two trackers to torrent with hash `fae6e49afa359ab07c3ef169438ff95d870bc178`. Note `%0A` (aka LF newline) between trackers. Ampersand in tracker urls **MUST** be escaped.
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Pause torrent
[](#pause-torrent)
Requires known torrent hash, get 'em from [torrent list](#torrentlist).
```
POST http://127.0.0.1/command/pause HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hash=fae6e49afa359ab07c3ef169438ff95d870bc178
```
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Pause all torrents
[](#pause-all-torrents)
```
POST http://127.0.0.1/command/pauseall HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Length: 0
```
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Resume torrent
[](#resume-torrent)
Requires known torrent hash, get 'em from [torrent list](#torrentlist).
```
POST http://127.0.0.1/command/resume HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hash=fae6e49afa359ab07c3ef169438ff95d870bc178
```
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Resume all torrents
[](#resume-all-torrents)
```
POST http://127.0.0.1/command/resumeall HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Length: 0
```
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Delete torrent
[](#delete-torrent)
Requires known torrent hash, get 'em from [torrent list](#torrentlist).
```
POST http://127.0.0.1/command/delete HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=fae6e49afa359ab07c3ef169438ff95d870bc178
```
`hashes` can contain multiple hashes separated by `|`
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Delete torrent with downloaded data
[](#delete-torrent-with-downloaded-data)
Requires known torrent hash, get 'em from [torrent list](#torrentlist).
```
POST http://127.0.0.1/command/deletePerm HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=fae6e49afa359ab07c3ef169438ff95d870bc178
```
`hashes` can contain multiple hashes separated by `|`
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Recheck torrent
[](#recheck-torrent)
Requires known torrent hash, get 'em from [torrent list](#torrentlist).
```
POST http://127.0.0.1/command/recheck HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hash=fae6e49afa359ab07c3ef169438ff95d870bc178
```
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Increase torrent priority
[](#increase-torrent-priority)
Requires known torrent hash, get 'em from [torrent list](#torrentlist).
```
POST http://127.0.0.1/command/increasePrio HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=fae6e49afa359ab07c3ef169438ff95d870bc178
```
`hashes` can contain multiple hashes separated by `|`
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Decrease torrent priority
[](#decrease-torrent-priority)
Requires known torrent hash, get 'em from [torrent list](#torrentlist).
```
POST http://127.0.0.1/command/decreasePrio HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=fae6e49afa359ab07c3ef169438ff95d870bc178
```
`hashes` can contain multiple hashes separated by `|`
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Maximal torrent priority
[](#maximal-torrent-priority)
Requires known torrent hash, get 'em from [torrent list](#torrentlist).
```
POST http://127.0.0.1/command/topPrio HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=fae6e49afa359ab07c3ef169438ff95d870bc178
```
`hashes` can contain multiple hashes separated by `|`
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Minimal torrent priority
[](#minimal-torrent-priority)
Requires known torrent hash, get 'em from [torrent list](#torrentlist).
```
POST http://127.0.0.1/command/bottomPrio HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hashes=fae6e49afa359ab07c3ef169438ff95d870bc178
```
`hashes` can contain multiple hashes separated by `|`
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Set file priority
[](#set-file-priority)
Requires known torrent hash, get 'em from [torrent list](#torrentlist).
```
POST http://127.0.0.1/command/setFilePrio HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hash=fae6e49afa359ab07c3ef169438ff95d870bc178&id=0&priority=7
```
Please consult [torrent contents API](#propscont) for possible `priority` values. `id` values coresspond to contents returned by [torrent contents API](#propscont), e.g. `id=0` for first file, `id=1` for second file, etc.
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Get global download limit
[](#get-global-download-limit)
```
POST http://127.0.0.1/command/getGlobalDlLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Length: 0
```
Server reply (example):
```
HTTP/1.1 200 OK
content-type: text/html
content-length: length
3145728
```
`3145728` is the value of current global download speed limit in bytes; this value will be zero if no limit is applied.
### Set global download limit
[](#set-global-download-limit)
```
POST http://127.0.0.1/command/setGlobalDlLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
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
POST http://127.0.0.1/command/getGlobalUpLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Length: 0
```
Server reply (example):
```
HTTP/1.1 200 OK
content-type: text/html
content-length: length
3145728
```
`3145728` is the value of current global upload speed limit in bytes; this value will be zero if no limit is applied.
### Set global upload limit
[](#set-global-upload-limit)
```
POST http://127.0.0.1/command/setGlobalUpLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
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
Requires known torrent hash, get 'em from [torrent list](#torrentlist).
```
POST http://127.0.0.1/command/getTorrentDlLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hash=fae6e49afa359ab07c3ef169438ff95d870bc178
```
Server reply (example):
```
HTTP/1.1 200 OK
content-type: text/html
content-length: length
338944
```
`338944` is the value of current torrent download speed limit in bytes; this value will be zero if no limit is applied.
### Set torrent download limit
[](#set-torrent-download-limit)
Requires known torrent hash, get 'em from [torrent list](#torrentlist).
```
POST http://127.0.0.1/command/setTorrentDlLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hash=fae6e49afa359ab07c3ef169438ff95d870bc178&limit=131072
```
`limit` is torrent download speed limit you want to set in bytes.
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Get torrent upload limit
[](#get-torrent-upload-limit)
Requires known torrent hash, get 'em from [torrent list](#torrentlist).
```
POST http://127.0.0.1/command/getTorrentUpLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hash=fae6e49afa359ab07c3ef169438ff95d870bc178
```
Server reply (example):
```
HTTP/1.1 200 OK
content-type: text/html
content-length: length
338944
```
`338944` is the value of current torrent upload speed limit in bytes; this value will be zero if no limit is applied.
### Set torrent upload limit
[](#set-torrent-upload-limit)
Requires known torrent hash, get 'em from [torrent list](#torrentlist).
```
POST http://127.0.0.1/command/setTorrentUpLimit HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
Content-Type: application/x-www-form-urlencoded
Content-Length: length
hash=fae6e49afa359ab07c3ef169438ff95d870bc178&limit=131072
```
`limit` is torrent download speed limit you want to set in bytes.
No matter if successful or not server will return the following reply:
```
HTTP/1.1 200 OK
```
### Set qBittorrent preferences
[](#set-qbittorrent-preferences)
```
POST http://127.0.0.1/command/setPreferences HTTP/1.1
User-Agent: Fiddler
Host: 127.0.0.1
Authorization: your\_auth\_string
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
For a list of possible preference options see [Get qBittorrent preferences](#prefget)
# Additional information
[](#additional-information)
### Version 3.0.8 bugs
[](#version-308-bugs)
The following WebUI-related bugs exist in qBittorrent v3.0.8 and lower:
1. JSON generation bugs
* `'` and `&` (apostrophe and ampersand) characters are escaped by backslash `\\`
1. JSON parsing bugs
* When [setting qBittorrent preferences](#setpref) JSON values, containing `:` semicolons will be disregarded; this mostly affects Windows users, whose paths start with `DiskName:\\`
* When [setting qBittorrent preferences](#setpref) JSON bool lists (e.g. `"download\_in\_scan\_dirs":[false,true]`) will be treated as all bool values in the list are `false`, this doesn't affect bool values outside JSON lists
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