Tautulli API Reference · Tautulli/Tautulli Wiki · GitHub
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
# Tautulli API Reference
[Jump to bottom](#wiki-pages-box)
JonnyWong16 edited this page Mar 28, 2026
&middot;
[24 revisions](/Tautulli/Tautulli/wiki/Tautulli-API-Reference/_history)
## General structure
[](#general-structure)
The API endpoint is
```
`http://IP\_ADDRESS:PORT + [/HTTP\_ROOT] + /api/v2?apikey=$apikey&cmd=$command
`
```
Example:
```
`http://localhost:8181/api/v2?apikey=66198313a092496b8a725867d2223b5f&cmd=get\_metadata&rating\_key=153037
`
```
Response example (default `json`)
```
`{
"response": {
"data": [
{
"loglevel": "INFO",
"msg": "Signal 2 caught, saving and exiting...",
"thread": "MainThread",
"time": "22-sep-2015 01:42:56 "
}
],
"message": null,
"result": "success"
}
}
`
```
```
`General optional parameters:
out\_type: "json" or "xml"
callback: "pong"
debug: 1
`
```
## API methods
[](#api-methods)
### add\_newsletter\_config
[](#add_newsletter_config)
Add a new notification agent.
```
`Required parameters:
agent\_id (int): The newsletter type to add
Optional parameters:
None
Returns:
None
`
```
### add\_notifier\_config
[](#add_notifier_config)
Add a new notification agent.
```
`Required parameters:
agent\_id (int): The notification agent to add
Optional parameters:
None
Returns:
None
`
```
### arnold
[](#arnold)
Get to the chopper!
### backup\_config
[](#backup_config)
Create a manual backup of the `config.ini` file.
### backup\_db
[](#backup_db)
Create a manual backup of the `plexpy.db` file.
### delete\_all\_library\_history
[](#delete_all_library_history)
Delete all Tautulli history for a specific library.
```
`Required parameters:
server\_id (str): The Plex server identifier of the library section
section\_id (str): The id of the Plex library section
Optional parameters:
row\_ids (str): Comma separated row ids to delete, e.g. "2,3,8"
Returns:
None
`
```
### delete\_all\_user\_history
[](#delete_all_user_history)
Delete all Tautulli history for a specific user.
```
`Required parameters:
user\_id (str): The id of the Plex user
Optional parameters:
row\_ids (str): Comma separated row ids to delete, e.g. "2,3,8"
Returns:
None
`
```
### delete\_cache
[](#delete_cache)
Delete and recreate the cache directory.
### delete\_export
[](#delete_export)
Delete exports from Tautulli.
```
`Required parameters:
export\_id (int): The row id of the exported file to delete
Optional parameters:
delete\_all (bool): 'true' to delete all exported files
Returns:
None
`
```
### delete\_history
[](#delete_history)
Delete history rows from Tautulli.
```
`Required parameters:
row\_ids (str): Comma separated row ids to delete, e.g. "65,110,2,3645"
Optional parameters:
None
Returns:
None
`
```
### delete\_hosted\_images
[](#delete_hosted_images)
Delete the images uploaded to image hosting services.
```
`Required parameters:
None
Optional parameters:
rating\_key (int): 1234
(Note: Must be the movie, show, season, artist, or album rating key)
service (str): 'imgur' or 'cloudinary'
delete\_all (bool): 'true' to delete all images form the service
Returns:
json:
{"result": "success",
"message": "Deleted hosted images from Imgur."}
`
```
### delete\_image\_cache
[](#delete_image_cache)
Delete and recreate the image cache directory.
### delete\_library
[](#delete_library)
Delete a library section from Tautulli. Also erases all history for the library.
```
`Required parameters:
server\_id (str): The Plex server identifier of the library section
section\_id (str): The id of the Plex library section
Optional parameters:
row\_ids (str): Comma separated row ids to delete, e.g. "2,3,8"
Returns:
None
`
```
### delete\_login\_log
[](#delete_login_log)
Delete the Tautulli login logs.
```
`Required parameters:
None
Optional parameters:
None
Returns:
None
`
```
### delete\_lookup\_info
[](#delete_lookup_info)
Delete the 3rd party API lookup info.
```
`Required parameters:
None
Optional parameters:
rating\_key (int): 1234
(Note: Must be the movie, show, artist, album, or track rating key)
service (str): 'themoviedb' or 'tvmaze' or 'musicbrainz'
delete\_all (bool): 'true' to delete all images form the service
Returns:
json:
{"result": "success",
"message": "Deleted lookup info."}
`
```
### delete\_media\_info\_cache
[](#delete_media_info_cache)
Delete the media info table cache for a specific library.
```
`Required parameters:
section\_id (str): The id of the Plex library section
Optional parameters:
None
Returns:
None
`
```
### delete\_mobile\_device
[](#delete_mobile_device)
Remove a mobile device from the database.
```
`Required parameters:
mobile\_device\_id (int): The mobile device database id to delete, OR
device\_id (str): The unique device identifier for the mobile device
Optional parameters:
None
Returns:
None
`
```
### delete\_newsletter
[](#delete_newsletter)
Remove a newsletter from the database.
```
`Required parameters:
newsletter\_id (int): The newsletter to delete
Optional parameters:
None
Returns:
None
`
```
### delete\_newsletter\_log
[](#delete_newsletter_log)
Delete the Tautulli newsletter logs.
```
`Required parameters:
None
Optional parameters:
None
Returns:
None
`
```
### delete\_notification\_log
[](#delete_notification_log)
Delete the Tautulli notification logs.
```
`Required parameters:
None
Optional parameters:
None
Returns:
None
`
```
### delete\_notifier
[](#delete_notifier)
Remove a notifier from the database.
```
`Required parameters:
notifier\_id (int): The notifier to delete
Optional parameters:
None
Returns:
None
`
```
### delete\_recently\_added
[](#delete_recently_added)
Flush out all of the recently added items in the database.
### delete\_synced\_item
[](#delete_synced_item)
Delete a synced item from a device.
```
`Required parameters:
client\_id (str): The client ID of the device to delete from
sync\_id (str): The sync ID of the synced item
Optional parameters:
None
Returns:
None
`
```
### delete\_temp\_sessions
[](#delete_temp_sessions)
Flush out all of the temporary sessions in the database.
### delete\_user
[](#delete_user)
Delete a user from Tautulli. Also erases all history for the user.
```
`Required parameters:
user\_id (str): The id of the Plex user
Optional parameters:
row\_ids (str): Comma separated row ids to delete, e.g. "2,3,8"
Returns:
None
`
```
### docs
[](#docs)
Return the api docs as a dict where commands are keys, docstring are value.
### docs\_md
[](#docs_md)
Return the api docs formatted with markdown.
### download\_config
[](#download_config)
Download the Tautulli configuration file.
### download\_database
[](#download_database)
Download the Tautulli database file.
### download\_export
[](#download_export)
Download an exported metadata file
```
`Required parameters:
export\_id (int): The row id of the exported file to download
Optional parameters:
None
Returns:
download
`
```
### download\_log
[](#download_log)
Download the Tautulli log file.
```
`Required parameters:
None
Optional parameters:
logfile (str): The name of the Tautulli log file,
"tautulli", "tautulli\_api", "plex\_websocket"
Returns:
download
`
```
### download\_plex\_log
[](#download_plex_log)
Download the Plex log file.
```
`Required parameters:
None
Optional parameters:
logfile (int): The name of the Plex log file,
e.g. "Plex Media Server", "Plex Media Scanner"
Returns:
download
`
```
### edit\_library
[](#edit_library)
Update a library section on Tautulli.
```
`Required parameters:
section\_id (str): The id of the Plex library section
custom\_thumb (str): The URL for the custom library thumbnail
custom\_art (str): The URL for the custom library background art
keep\_history (int): 0 or 1
Optional parameters:
None
Returns:
None
`
```
### edit\_user
[](#edit_user)
Update a user on Tautulli.
```
`Required parameters:
user\_id (str): The id of the Plex user
friendly\_name(str): The friendly name of the user
custom\_thumb (str): The URL for the custom user thumbnail
keep\_history (int): 0 or 1
allow\_guest (int): 0 or 1
Optional parameters:
None
Returns:
None
`
```
### export\_metadata
[](#export_metadata)
Export library or media metadata to a file
```
`Required parameters:
section\_id (int): The section id of the library items to export, OR
user\_id (int): The user id of the playlist items to export, OR
rating\_key (int): The rating key of the media item to export
Optional parameters:
file\_format (str): csv (default), json, xml, or m3u
metadata\_level (int): The level of metadata to export (default 1)
media\_info\_level (int): The level of media info to export (default 1)
thumb\_level (int): The level of poster/cover images to export (default 0)
art\_level (int): The level of background artwork images to export (default 0)
logo\_level (int): The level of logo images to export (default 0)
squareArt\_level (int): The level of square art images to export (default 0)
theme\_level (int): The level of theme images to export (default 0)
custom\_fields (str): Comma separated list of custom fields to export
in addition to the export level selected
export\_type (str): 'collection' or 'playlist' for library/user export,
otherwise default to all library items
individual\_files (bool): Export each item as an individual file for library/user export.
Returns:
json:
{"export\_id": 1}
`
```
### get\_activity
[](#get_activity)
Get the current activity on the PMS.
```
`Required parameters:
None
Optional parameters:
session\_key (int): Session key for the session info to return, OR
session\_id (str): Session ID for the session info to return
Returns:
json:
{"lan\_bandwidth": 25318,
"sessions": [
{
"actors": [
"Kit Harington",
"Emilia Clarke",
"Isaac Hempstead-Wright",
"Maisie Williams",
"Liam Cunningham",
],
"added\_at": "1461572396",
"allow\_guest": 1,
"art": "/library/metadata/1219/art/1503306930",
"aspect\_ratio": "1.78",
"audience\_rating": "",
"audience\_rating\_image": "rottentomatoes://image.rating.upright",
"audio\_bitrate": "384",
"audio\_bitrate\_mode": "",
"audio\_channel\_layout": "5.1(side)",
"audio\_channels": "6",
"audio\_codec": "ac3",
"audio\_decision": "direct play",
"audio\_language": "",
"audio\_language\_code": "",
"audio\_profile": "",
"audio\_sample\_rate": "48000",
"bandwidth": "25318",
"banner": "/library/metadata/1219/banner/1503306930",
"bif\_thumb": "/library/parts/274169/indexes/sd/1000",
"bitrate": "10617",
"channel\_call\_sign": "",
"channel\_id": "",
"channel\_identifier": "",
"channel\_stream": 0,
"channel\_title": "",
"channel\_thumb": "",
"channel\_vcn": "",
"children\_count": "",
"collections": [],
"container": "mkv",
"container\_decision": "direct play",
"content\_rating": "TV-MA",
"deleted\_user": 0,
"device": "Windows",
"directors": [
"Jeremy Podeswa"
],
"do\_notify": 0,
"duration": "2998272",
"email": "Jon.Snow.1337@CastleBlack.com",
"file": "/media/TV Shows/Game of Thrones/Season 06/Game of Thrones - S06E01 - The Red Woman.mkv",
"file\_size": "3979115377",
"friendly\_name": "Jon Snow",
"full\_title": "Game of Thrones - The Red Woman",
"genres": [
"Adventure",
"Drama",
"Fantasy"
],
"grandparent\_guid": "com.plexapp.agents.thetvdb://121361?lang=en",
"grandparent\_rating\_key": "1219",
"grandparent\_thumb": "/library/metadata/1219/thumb/1503306930",
"grandparent\_title": "Game of Thrones",
"guid": "com.plexapp.agents.thetvdb://121361/6/1?lang=en",
"height": "1078",
"id": "",
"indexes": 1,
"ip\_address": "10.10.10.1",
"ip\_address\_public": "64.123.23.111",
"is\_admin": 1,
"is\_allow\_sync": 1,
"is\_home\_user": 1,
"is\_restricted": 0,
"keep\_history": 1,
"labels": [],
"last\_viewed\_at": "1462165717",
"library\_name": "TV Shows",
"live": 0,
"live\_uuid": "",
"local": "1",
"location": "lan",
"machine\_id": "lmd93nkn12k29j2lnm",
"media\_index": "1",
"media\_type": "episode",
"optimized\_version": 0,
"optimized\_version\_profile": "",
"optimized\_version\_title": "",
"original\_title": "",
"originally\_available\_at": "2016-04-24",
"parent\_guid": "com.plexapp.agents.thetvdb://121361/6?lang=en",
"parent\_media\_index": "6",
"parent\_rating\_key": "153036",
"parent\_thumb": "/library/metadata/153036/thumb/1503889210",
"parent\_title": "Season 6",
"platform": "Plex Media Player",
"platform\_name": "plex",
"platform\_version": "2.4.1.787-54a020cd",
"player": "Castle-PC",
"product": "Plex Media Player",
"product\_version": "3.35.2",
"profile": "Konvergo",
"progress\_percent": "0",
"quality\_profile": "Original",
"rating": "7.8",
"rating\_image": "rottentomatoes://image.rating.ripe",
"rating\_key": "153037",
"relay": 0,
"section\_id": "2",
"secure": 1,
"session\_id": "helf15l3rxgw01xxe0jf3l3d",
"session\_key": "27",
"shared\_libraries": [
"10",
"1",
"4",
"5",
"15",
"20",
"2"
],
"sort\_title": "Red Woman",
"state": "playing",
"stream\_aspect\_ratio": "1.78",
"stream\_audio\_bitrate": "384",
"stream\_audio\_bitrate\_mode": "",
"stream\_audio\_channel\_layout": "5.1(side)",
"stream\_audio\_channel\_layout\_": "5.1(side)",
"stream\_audio\_channels": "6",
"stream\_audio\_codec": "ac3",
"stream\_audio\_decision": "direct play",
"stream\_audio\_language": "",
"stream\_audio\_language\_code": "",
"stream\_audio\_profile": "",
"stream\_audio\_sample\_rate": "48000",
"stream\_bitrate": "10617",
"stream\_container": "mkv",
"stream\_container\_decision": "direct play",
"stream\_duration": "2998272",
"stream\_subtitle\_codec": "",
"stream\_subtitle\_container": "",
"stream\_subtitle\_decision": "",
"stream\_subtitle\_forced": 0,
"stream\_subtitle\_format": "",
"stream\_subtitle\_language": "",
"stream\_subtitle\_language\_code": "",
"stream\_subtitle\_location": "",
"stream\_video\_bit\_depth": "8",
"stream\_video\_bitrate": "10233",
"stream\_video\_chroma\_subsampling": "4:2:0",
"stream\_video\_codec": "h264",
"stream\_video\_codec\_level": "41",
"stream\_video\_color\_primaries": "",
"stream\_video\_color\_range": "tv",
"stream\_video\_color\_space": "bt709",
"stream\_video\_color\_trc": "",
"stream\_video\_decision": "direct play",
"stream\_video\_dynamic\_range": "SDR",
"stream\_video\_framerate": "24p",
"stream\_video\_full\_resolution": "1080p",
"stream\_video\_height": "1078",
"stream\_video\_language": "",
"stream\_video\_language\_code": "",
"stream\_video\_ref\_frames": "4",
"stream\_video\_resolution": "1080",
"stream\_video\_scan\_type": "progressive",
"stream\_video\_width": "1920",
"studio": "HBO",
"subtitle\_codec": "",
"subtitle\_container": "",
"subtitle\_decision": "",
"subtitle\_forced": 0,
"subtitle\_format": "",
"subtitle\_language": "",
"subtitle\_language\_code": "",
"subtitle\_location": "",
"subtitles": 0,
"summary": "Jon Snow is dead. Daenerys meets a strong man. Cersei sees her daughter again.",
"synced\_version": 0,
"synced\_version\_profile": "",
"tagline": "",
"throttled": "0",
"thumb": "/library/metadata/153037/thumb/1503889207",
"title": "The Red Woman",
"transcode\_audio\_channels": "",
"transcode\_audio\_codec": "",
"transcode\_container": "",
"transcode\_decision": "direct play",
"transcode\_height": "",
"transcode\_hw\_decode": "",
"transcode\_hw\_decode\_title": "",
"transcode\_hw\_decoding": 0,
"transcode\_hw\_encode": "",
"transcode\_hw\_encode\_title": "",
"transcode\_hw\_encoding": 0,
"transcode\_hw\_full\_pipeline": 0,
"transcode\_hw\_requested": 0,
"transcode\_key": "",
"transcode\_max\_offset\_available": 0,
"transcode\_min\_offset\_available": 0,
"transcode\_progress": 0,
"transcode\_protocol": "",
"transcode\_speed": "",
"transcode\_throttled": 0,
"transcode\_video\_codec": "",
"transcode\_width": "",
"type": "",
"updated\_at": "1503889207",
"user": "LordCommanderSnow",
"user\_id": 133788,
"user\_rating": "",
"user\_thumb": "https://plex.tv/users/k10w42309cynaopq/avatar",
"username": "LordCommanderSnow",
"video\_bit\_depth": "8",
"video\_bitrate": "10233",
"video\_chroma\_subsampling": "4:2:0",
"video\_codec": "h264",
"video\_codec\_level": "41",
"video\_color\_primaries": "",
"video\_color\_range": "tv",
"video\_color\_space": "bt709",
"video\_color\_trc": ",
"video\_decision": "direct play",
"video\_dynamic\_range": "SDR",
"video\_frame\_rate": "23.976",
"video\_framerate": "24p",
"video\_full\_resolution": "1080p",
"video\_height": "1078",
"video\_language": "",
"video\_language\_code": "",
"video\_profile": "high",
"video\_ref\_frames": "4",
"video\_resolution": "1080",
"video\_scan\_type": "progressive",
"video\_width": "1920",
"view\_offset": "1000",
"width": "1920",
"writers": [
"David Benioff",
"D. B. Weiss"
],
"year": "2016"
}
],
"stream\_count": "1",
"stream\_count\_direct\_play": 1,
"stream\_count\_direct\_stream": 0,
"stream\_count\_transcode": 0,
"total\_bandwidth": 25318,
"wan\_bandwidth": 0
}
`
```
### get\_children\_metadata
[](#get_children_metadata)
Get the metadata for the children of a media item.
```
`Required parameters:
rating\_key (str): Rating key of the item
media\_type (str): Media type of the item
Optional parameters:
None
Returns:
json:
{"children\_count": 9,
"children\_type": "season",
"title": "Game of Thrones",
"children\_list": [
{...},
{"actors": [],
"added\_at": "1403553078",
"art": "/library/metadata/1219/art/1562110346",
"audience\_rating": "",
"audience\_rating\_image": "",
"banner": "",
"collections": [],
"content\_rating": "",
"directors": [],
"duration": "",
"full\_title": "Season 1"
"genres": [],
"grandparent\_rating\_key": "",
"grandparent\_thumb": "",
"grandparent\_title": "",
"guid": "com.plexapp.agents.thetvdb://121361/1?lang=en",
"labels": [],
"last\_viewed\_at": "1589992348",
"library\_name": "TV Shows",
"media\_index": "1",
"media\_type": "season",
"original\_title": "",
"originally\_available\_at": "",
"parent\_media\_index": "1",
"parent\_rating\_key": "1219",
"parent\_thumb": "/library/metadata/1219/thumb/1562110346",
"parent\_title": "Game of Thrones",
"rating": "",
"rating\_image": "",
"rating\_key": "1220",
"section\_id": "2",
"sort\_title": "",
"studio": "",
"summary": "",
"tagline": "",
"thumb": "/library/metadata/1220/thumb/1602176313",
"title": "Season 1",
"updated\_at": "1602176313",
"user\_rating": "",
"writers": [],
"year": ""
},
{...},
{...}
]
}
`
```
### get\_collections\_table
[](#get_collections_table)
Get the data on the Tautulli collections tables.
```
`Required parameters:
section\_id (str): The id of the Plex library section
Optional parameters:
None
Returns:
json:
{"draw": 1,
"recordsTotal": 5,
"data":
[...]
}
`
```
### get\_concurrent\_streams\_by\_stream\_type
[](#get_concurrent_streams_by_stream_type)
Get graph data for concurrent streams by stream type by date.
```
`Required parameters:
None
Optional parameters:
time\_range (str): The number of days of data to return
user\_id (str): Comma separated list of user id to filter the data
Returns:
json:
{"categories":
["YYYY-MM-DD", "YYYY-MM-DD", ...]
"series":
[{"name": "Direct Play", "data": [...]}
{"name": "Direct Stream", "data": [...]},
{"name": "Transcode", "data": [...]},
{"name": "Max. Concurrent Streams", "data": [...]}
]
}
`
```
### get\_date\_formats
[](#get_date_formats)
Get the date and time formats used by Tautulli.
```
`Required parameters:
None
Optional parameters:
None
Returns:
json:
{"date\_format": "YYYY-MM-DD",
"time\_format": "HH:mm",
}
`
```
### get\_export\_fields
[](#get_export_fields)
Get a list of available custom export fields.
```
`Required parameters:
media\_type (str): The media type of the fields to return
Optional parameters:
sub\_media\_type (str): The child media type for
collections (movie, show, artist, album, photoalbum),
or playlists (video, audio, photo)
Returns:
json:
{"metadata\_fields":
[{"field": "addedAt", "level": 1},
...
],
"media\_info\_fields":
[{"field": "media.aspectRatio", "level": 1},
...
]
}
`
```
### get\_exports\_table
[](#get_exports_table)
Get the data on the Tautulli export tables.
```
`Required parameters:
section\_id (str): The id of the Plex library section, OR
user\_id (str): The id of the Plex user, OR
rating\_key (str): The rating key of the exported item
Optional parameters:
order\_column (str): "added\_at", "sort\_title", "container", "bitrate", "video\_codec",
"video\_resolution", "video\_framerate", "audio\_codec", "audio\_channels",
"file\_size", "last\_played", "play\_count"
order\_dir (str): "desc" or "asc"
start (int): Row to start from, 0
length (int): Number of items to return, 25
search (str): A string to search for, "Thrones"
Returns:
json:
{"draw": 1,
"recordsTotal": 10,
"recordsFiltered": 3,
"data":
[{"timestamp": 1602823644,
"art\_level": 0,
"complete": 1,
"custom\_fields": "",
"exists": true,
"export\_id": 42,
"exported\_items": 28,
"file\_format": "json",
"file\_size": 57793562,
"filename": null,
"individual\_files": 1,
"logo\_level": 0,
"squareArt\_level": 0,
"theme\_level": 0,
"media\_info\_level": 1,
"media\_type": "collection",
"media\_type\_title": "Collection",
"metadata\_level": 1,
"rating\_key": null,
"section\_id": 1,
"thumb\_level": 2,
"title": "Library - Movies - Collection [1]",
"total\_items": 28,
"user\_id": null
},
{...},
{...}
]
}
`
```
### get\_geoip\_lookup
[](#get_geoip_lookup)
Get the geolocation info for an IP address.
```
`Required parameters:
ip\_address
Optional parameters:
None
Returns:
json:
{"city": "Mountain View",
"code": "US",
"continent": "NA",
"country": "United States",
"latitude": 37.386,
"longitude": -122.0838,
"postal\_code": "94035",
"region": "California",
"timezone": "America/Los\_Angeles",
"accuracy": null
}
`
```
### get\_history
[](#get_history)
Get the Tautulli history.
```
`Required parameters:
None
Optional parameters:
grouping (int): 0 or 1
include\_activity (int): 0 or 1
user (str): "Jon Snow"
user\_id (int): 133788
rating\_key (int): 4348
parent\_rating\_key (int): 544
grandparent\_rating\_key (int): 351
start\_date (str): History for the exact date, "YYYY-MM-DD"
before (str): History before and including the date, "YYYY-MM-DD"
after (str): History after and including the date, "YYYY-MM-DD"
section\_id (int): 2
media\_type (str): "movie", "episode", "track", "live", "collection", "playlist"
transcode\_decision (str): "direct play", "copy", "transcode",
guid (str): Plex guid for an item, e.g. "com.plexapp.agents.thetvdb://121361/6/1"
order\_column (str): "date", "friendly\_name", "ip\_address", "platform", "player",
"full\_title", "started", "paused\_counter", "stopped", "duration"
order\_dir (str): "desc" or "asc"
start (int): Row to start from, 0
length (int): Number of items to return, 25
search (str): A string to search for, "Thrones"
Returns:
json:
{"draw": 1,
"recordsTotal": 1000,
"recordsFiltered": 250,
"total\_duration": "42 days 5 hrs 18 mins",
"filter\_duration": "10 hrs 12 mins",
"data":
[{"date": 1462687607,
"friendly\_name": "Mother of Dragons",
"full\_title": "Game of Thrones - The Red Woman",
"grandparent\_rating\_key": 351,
"grandparent\_title": "Game of Thrones",
"original\_title": "",
"group\_count": 1,
"group\_ids": "1124",
"guid": "com.plexapp.agents.thetvdb://121361/6/1?lang=en",
"ip\_address": "xxx.xxx.xxx.xxx",
"live": 0,
"location": "wan",
"machine\_id": "lmd93nkn12k29j2lnm",
"media\_index": 17,
"media\_type": "episode",
"originally\_available\_at": "2016-04-24",
"parent\_media\_index": 7,
"parent\_rating\_key": 544,
"parent\_title": "",
"paused\_counter": 0,
"percent\_complete": 84,
"platform": "Windows",
"play\_duration": 263,
"product": "Plex for Windows",
"player": "Castle-PC",
"rating\_key": 4348,
"reference\_id": 1123,
"relayed": 0,
"row\_id": 1124,
"secure": 1,
"session\_key": null,
"started": 1462688107,
"state": null,
"stopped": 1462688370,
"thumb": "/library/metadata/4348/thumb/1462414561",
"title": "The Red Woman",
"transcode\_decision": "transcode",
"user": "DanyKhaleesi69",
"user\_id": 8008135,
"watched\_status": 0,
"year": 2016
},
{...},
{...}
]
}
`
```
### get\_home\_stats
[](#get_home_stats)
Get the homepage watch statistics.
```
`Required parameters:
None
Optional parameters:
grouping (int): 0 or 1
time\_range (int): The time range to calculate statistics, 30
stats\_type (str): 'plays' or 'duration'
stats\_start (int) The row number of the stat item to start at, 0
stats\_count (int): The number of stat items to return, 5
stat\_id (str): A single stat to return, 'top\_movies', 'popular\_movies',
'top\_tv', 'popular\_tv', 'top\_music', 'popular\_music', 'top\_libraries',
'top\_users', 'top\_platforms', 'last\_watched', 'most\_concurrent'
section\_id (int): The id of the Plex library section
user\_id (int): The id of the Plex user
before (str): Stats before and including the date, "YYYY-MM-DD"
after (str): Stats after and including the date, "YYYY-MM-DD"
Returns:
json:
[{"stat\_id": "top\_movies",
"stat\_type": "total\_plays",
"rows": [{...}]
},
{"stat\_id": "popular\_movies",
"rows": [{...}]
},
{"stat\_id": "top\_tv",
"stat\_type": "total\_plays",
"rows":
[{"content\_rating": "TV-MA",
"friendly\_name": "",
"grandparent\_thumb": "/library/metadata/1219/thumb/1462175063",
"guid": "com.plexapp.agents.thetvdb://121361/6/1?lang=en",
"labels": [],
"last\_play": 1462380698,
"live": 0,
"media\_type": "episode",
"rating": 8.5,
"platform": "",
"rating\_key": 1219,
"row\_id": 1116,
"section\_id": 2,
"thumb": "",
"title": "Game of Thrones",
"total\_duration": 213302,
"total\_plays": 69,
"user": "",
"users\_watched": ""
},
{...},
{...}
]
},
{"stat\_id": "popular\_tv",
"rows": [{...}]
},
{"stat\_id": "top\_music",
"stat\_type": "total\_plays",
"rows": [{...}]
},
{"stat\_id": "popular\_music",
"rows": [{...}]
},
{"stat\_id": "last\_watched",
"rows": [{...}]
},
{"stat\_id": "top\_libraries",
"stat\_type": "total\_plays",
"rows": [{...}]
},
{"stat\_id": "top\_users",
"stat\_type": "total\_plays",
"rows": [{...}]
},
{"stat\_id": "top\_platforms",
"stat\_type": "total\_plays",
"rows": [{...}]
},
{"stat\_id": "most\_concurrent",
"rows": [{...}]
}
]
`
```
### get\_item\_user\_stats
[](#get_item_user_stats)
Get the user stats for the media item.
```
`Required parameters:
rating\_key (str): Rating key of the item
Optional parameters:
media\_type (str): Media type of the item (only required for a collection)
grouping (int): 0 or 1
Returns:
json:
[
{
"friendly\_name": "Jon Snow",
"user\_id": 1601089,
"user\_thumb": "",
"username": "jsnow@thewinteriscoming.com",
"total\_plays": 6,
"total\_time": 28743
},
{
"friendly\_name": "DanyKhaleesi69",
"user\_id": 8008135,
"user\_thumb": "",
"username": "DanyKhaleesi69",
"total\_plays": 5,
"total\_time": 18583
}
]
`
```
### get\_item\_watch\_time\_stats
[](#get_item_watch_time_stats)
Get the watch time stats for the media item.
```
`Required parameters:
rating\_key (str): Rating key of the item
Optional parameters:
media\_type (str): Media type of the item (only required for a collection)
grouping (int): 0 or 1
query\_days (str): Comma separated days, e.g. "1,7,30,0"
Returns:
json:
[
{
"query\_days": 1,
"total\_time": 0,
"total\_plays": 0
},
{
"query\_days": 7,
"total\_time": 0,
"total\_plays": 0
},
{
"query\_days": 30,
"total\_time": 0,
"total\_plays": 0
},
{
"query\_days": 0,
"total\_time": 57776,
"total\_plays": 13
}
]
`
```
### get\_libraries
[](#get_libraries)
Get a list of all libraries on your server.
```
`Required parameters:
None
Optional parameters:
None
Returns:
json:
[{"art": "/:/resources/show-fanart.jpg",
"child\_count": "3745",
"count": "62",
"is\_active": 1,
"parent\_count": "240",
"section\_id": "2",
"section\_name": "TV Shows",
"section\_type": "show",
"thumb": "/:/resources/show.png"
},
{...},
{...}
]
`
```
### get\_libraries\_table
[](#get_libraries_table)
Get the data on the Tautulli libraries table.
```
`Required parameters:
None
Optional parameters:
grouping (int): 0 or 1
order\_column (str): "library\_thumb", "section\_name", "section\_type", "count", "parent\_count",
"child\_count", "last\_accessed", "last\_played", "plays", "duration"
order\_dir (str): "desc" or "asc"
start (int): Row to start from, 0
length (int): Number of items to return, 25
search (str): A string to search for, "Movies"
Returns:
json:
{"draw": 1,
"recordsTotal": 10,
"recordsFiltered": 10,
"data":
[{"child\_count": 3745,
"content\_rating": "TV-MA",
"count": 62,
"do\_notify": 1,
"do\_notify\_created": 1,
"duration": 1578037,
"guid": "com.plexapp.agents.thetvdb://121361/6/1?lang=en",
"histroy\_row\_id": 1128,
"is\_active": 1,
"keep\_history": 1,
"labels": [],
"last\_accessed": 1462693216,
"last\_played": "Game of Thrones - The Red Woman",
"library\_art": "/:/resources/show-fanart.jpg",
"library\_thumb": "/:/resources/show.png",
"live": 0,
"media\_index": 1,
"media\_type": "episode",
"originally\_available\_at": "2016-04-24",
"parent\_count": 240,
"parent\_media\_index": 6,
"parent\_title": "",
"plays": 772,
"rating\_key": 153037,
"row\_id": 1,
"section\_id": 2,
"section\_name": "TV Shows",
"section\_type": "Show",
"server\_id": "ds48g4r354a8v9byrrtr697g3g79w",
"thumb": "/library/metadata/153036/thumb/1462175062",
"year": 2016
},
{...},
{...}
]
}
`
```
### get\_library
[](#get_library)
Get a library's details.
```
`Required parameters:
section\_id (str): The id of the Plex library section
Optional parameters:
include\_last\_accessed (bool): True to include the last\_accessed value for the library.
Returns:
json:
{"child\_count": null,
"count": 887,
"deleted\_section": 0,
"do\_notify": 1,
"do\_notify\_created": 1,
"is\_active": 1,
"keep\_history": 1,
"last\_accessed": 1462693216,
"library\_art": "/:/resources/movie-fanart.jpg",
"library\_thumb": "/:/resources/movie.png",
"parent\_count": null,
"row\_id": 1,
"section\_id": 1,
"section\_name": "Movies",
"section\_type": "movie",
"server\_id": "ds48g4r354a8v9byrrtr697g3g79w"
}
`
```
### get\_library\_media\_info
[](#get_library_media_info)
Get the data on the Tautulli media info tables.
```
`Required parameters:
section\_id (str): The id of the Plex library section, OR
rating\_key (str): The grandparent or parent rating key
Optional parameters:
section\_type (str): "movie", "show", "artist", "photo"
order\_column (str): "added\_at", "sort\_title", "container", "bitrate", "video\_codec",
"video\_resolution", "video\_framerate", "audio\_codec", "audio\_channels",
"file\_size", "last\_played", "play\_count"
order\_dir (str): "desc" or "asc"
start (int): Row to start from, 0
length (int): Number of items to return, 25
search (str): A string to search for, "Thrones"
refresh (str): "true" to refresh the media info table
Returns:
json:
{"draw": 1,
"last\_refreshed": 1678734670,
"recordsTotal": 82,
"recordsFiltered": 82,
"filtered\_file\_size": 2616760056742,
"total\_file\_size": 2616760056742,
"data":
[{"added\_at": "1403553078",
"audio\_channels": "",
"audio\_codec": "",
"bitrate": "",
"container": "",
"file\_size": 253660175293,
"grandparent\_rating\_key": "",
"last\_played": 1462380698,
"media\_index": "1",
"media\_type": "show",
"parent\_media\_index": "",
"parent\_rating\_key": "",
"play\_count": 15,
"rating\_key": "1219",
"section\_id": 2,
"section\_type": "show",
"sort\_title": "Game of Thrones",
"thumb": "/library/metadata/1219/thumb/1436265995",
"title": "Game of Thrones",
"video\_codec": "",
"video\_framerate": "",
"video\_resolution": "",
"year": "2011"
},
{...},
{...}
]
}
`
```
### get\_library\_names
[](#get_library_names)
Get a list of library sections and ids on the PMS.
```
`Required parameters:
None
Optional parameters:
None
Returns:
json:
[{"section\_id": 1, "section\_name": "Movies", "section\_type": "movie"},
{"section\_id": 7, "section\_name": "Music", "section\_type": "artist"},
{"section\_id": 2, "section\_name": "TV Shows", "section\_type": "show"},
{...}
]
`
```
### get\_library\_user\_stats
[](#get_library_user_stats)
Get a library's user statistics.
```
`Required parameters:
section\_id (str): The id of the Plex library section
Optional parameters:
grouping (int): 0 or 1
Returns:
json:
[{"friendly\_name": "Jon Snow",
"total\_plays": 170,
"total\_time": 349618,
"user\_id": 133788,
"user\_thumb": "https://plex.tv/users/k10w42309cynaopq/avatar",
"username": "LordCommanderSnow"
},
{"friendly\_name": "DanyKhaleesi69",
"total\_plays": 42,
"total\_time": 50185,
"user\_id": 8008135,
"user\_thumb": "https://plex.tv/users/568gwwoib5t98a3a/avatar",
"username: "DanyKhaleesi69"
},
{...},
{...}
]
`
```
### get\_library\_watch\_time\_stats
[](#get_library_watch_time_stats)
Get a library's watch time statistics.
```
`Required parameters:
section\_id (str): The id of the Plex library section
Optional parameters:
grouping (int): 0 or 1
query\_days (str): Comma separated days, e.g. "1,7,30,0"
Returns:
json:
[{"query\_days": 1,
"total\_plays": 0,
"total\_time": 0
},
{"query\_days": 7,
"total\_plays": 3,
"total\_time": 15694
},
{"query\_days": 30,
"total\_plays": 35,
"total\_time": 63054
},
{"query\_days": 0,
"total\_plays": 508,
"total\_time": 1183080
}
]
`
```
### get\_logs
[](#get_logs)
Get the Tautulli logs.
```
`Required parameters:
None
Optional parameters:
sort (str): "time", "thread", "msg", "loglevel"
search (str): A string to search for
order (str): "desc" or "asc"
regex (str): A regex string to search for
start (int): Row number to start from
end (int): Row number to end at
Returns:
json:
[{"loglevel": "DEBUG",
"msg": "Latest version is 2d10b0748c7fa2ee4cf59960c3d3fffc6aa9512b",
"thread": "MainThread",
"time": "2016-05-08 09:36:51 "
},
{...},
{...}
]
`
```
### get\_metadata
[](#get_metadata)
Get the metadata for a media item.
```
`Required parameters:
rating\_key (str): Rating key of the item, OR
sync\_id (str): Sync ID of a synced item
Optional parameters:
None
Returns:
json:
{"actors": [
"Emilia Clarke",
"Lena Headey",
"Sophie Turner",
"Kit Harington",
"Peter Dinklage",
"Nikolaj Coster-Waldau",
"Maisie Williams",
"Iain Glen",
"John Bradley",
"Alfie Allen"
],
"added\_at": "1461572396",
"art": "/library/metadata/1219/art/1462175063",
"audience\_rating": "7.4",
"audience\_rating\_image": "themoviedb://image.rating",
"banner": "/library/metadata/1219/banner/1462175063",
"collections": [],
"content\_rating": "TV-MA",
"directors": [
"Jeremy Podeswa"
],
"duration": "2998290",
"edition\_title": "",
"full\_title": "Game of Thrones - The Red Woman",
"genres": [
"Action/Adventure",
"Drama",
"Fantasy",
"Romance"
],
"grandparent\_guid": "plex://show/5d9c086c46115600200aa2fe",
"grandparent\_guids": [
"imdb://tt0944947",
"tmdb://1399",
"tvdb://121361"
],
"grandparent\_rating\_key": "1219",
"grandparent\_slug": "game-of-thrones",
"grandparent\_thumb": "/library/metadata/1219/thumb/1462175063",
"grandparent\_title": "Game of Thrones",
"grandparent\_year": "2011",
"guid": "plex://episode/5d9c1276e9d5a1001f4ff2fa",
"guids": [
"imdb://tt3658014",
"tmdb://1156503",
"tvdb://5469015"
],
"labels": [],
"last\_viewed\_at": "1462165717",
"library\_name": "TV Shows",
"live": 0,
"markers": [
{
"id": 908,
"type": "credits",
"start\_time\_offset": 2923863,
"end\_time\_offset": 2998197,
"first": true,
"final": true
},
{
"id": 908,
"type": "intro",
"start\_time\_offset": 1622,
"end\_time\_offset": 109135,
"first": null,
"final": null
}
],
"media\_index": "1",
"media\_info": [
{
"aspect\_ratio": "1.78",
"audio\_channel\_layout": "5.1",
"audio\_channels": "6",
"audio\_codec": "ac3",
"audio\_profile": "",
"bitrate": "10617",
"channel\_call\_sign": "",
"channel\_id": "",
"channel\_identifier": "",
"channel\_title": "",
"channel\_thumb": "",
"channel\_vcn": "",
"container": "mkv",
"height": "1078",
"id": "257925",
"optimized\_version": 0,
"parts": [
{
"file": "/media/TV Shows/Game of Thrones/Season 06/Game of Thrones - S06E01 - The Red Woman.mkv",
"file\_size": "3979115377",
"id": "274169",
"indexes": 1,
"streams": [
{
"id": "511663",
"type": "1",
"video\_bit\_depth": "8",
"video\_bitrate": "10233",
"video\_codec": "h264",
"video\_codec\_level": "41",
"video\_color\_primaries": "",
"video\_color\_range": "tv",
"video\_color\_space": "bt709",
"video\_color\_trc": "",
"video\_dynamic\_range": "SDR",
"video\_dovi\_bl\_present": 0,
"video\_dovi\_el\_present": 0,
"video\_dovi\_level": 0,
"video\_dovi\_present": 0,
"video\_dovi\_profile": 0,
"video\_dovi\_rpu\_present": 0,
"video\_dovi\_version": 0,
"video\_frame\_rate": "23.976",
"video\_height": "1078",
"video\_language": "",
"video\_language\_code": "",
"video\_profile": "high",
"video\_ref\_frames": "4",
"video\_scan\_type": "progressive",
"video\_width": "1920",
"selected": 0
},
{
"audio\_bitrate": "384",
"audio\_bitrate\_mode": "",
"audio\_channel\_layout": "5.1(side)",
"audio\_channels": "6",
"audio\_codec": "ac3",
"audio\_language": "",
"audio\_language\_code": "",
"audio\_profile": "",
"audio\_sample\_rate": "48000",
"id": "511664",
"type": "2",
"selected": 1
},
{
"id": "511953",
"subtitle\_codec": "srt",
"subtitle\_container": "",
"subtitle\_forced": 0,
"subtitle\_format": "srt",
"subtitle\_language": "English",
"subtitle\_language\_code": "eng",
"subtitle\_location": "external",
"type": "3",
"selected": 1
}
]
}
],
"video\_codec": "h264",
"video\_framerate": "24p",
"video\_full\_resolution": "1080p",
"video\_profile": "high",
"video\_resolution": "1080",
"width": "1920"
}
],
"media\_type": "episode",
"original\_title": "",
"originally\_available\_at": "2016-04-24",
"parent\_guid": "plex://season/602e67e61d3358002c4120f7",
"parent\_guids": [
"tvdb://651357"
],
"parent\_media\_index": "6",
"parent\_rating\_key": "153036",
"parent\_slug": "game-of-thrones",
"parent\_thumb": "/library/metadata/153036/thumb/1462175062",
"parent\_title": "Season 6",
"parent\_year": "2016",
"rating": "",
"rating\_image": "",
"rating\_key": "153037",
"section\_id": "2",
"slug": "game-of-thrones",
"sort\_title": "Red Woman",
"studio": "Revolution Sun Studios",
"summary": "The fate of Jon Snow is revealed. Daenerys meets a strong man. Cersei sees her daughter once again.",
"tagline": "",
"thumb": "/library/metadata/153037/thumb/1462175060",
"title": "The Red Woman",
"updated\_at": "1462175060",
"user\_rating": "9.0",
"writers": [
"David Benioff",
"D. B. Weiss"
],
"year": "2016"
}
`
```
### get\_new\_rating\_keys
[](#get_new_rating_keys)
Get a list of new rating keys for the PMS of all of the item's parent/children.
```
`Required parameters:
rating\_key (str): '12345'
media\_type (str): "movie", "show", "season", "episode", "artist", "album", "track"
Optional parameters:
None
Returns:
json:
{}
`
```
### get\_newsletter\_config
[](#get_newsletter_config)
Get the configuration for an existing notification agent.
```
`Required parameters:
newsletter\_id (int): The newsletter config to retrieve
Optional parameters:
None
Returns:
json:
{"id": 1,
"agent\_id": 0,
"agent\_name": "recently\_added",
"agent\_label": "Recently Added",
"friendly\_name": "",
"id\_name": "",
"cron": "0 0 \* \* 1",
"active": 1,
"subject": "Recently Added to {server\_name}! ({end\_date})",
"body": "View the newsletter here: {newsletter\_url}",
"message": "",
"config": {"custom\_cron": 0,
"filename": "newsletter\_{newsletter\_uuid}.html",
"formatted": 1,
"incl\_libraries": ["1", "2"],
"notifier\_id": 1,
"save\_only": 0,
"time\_frame": 7,
"time\_frame\_units": "days"
},
"email\_config": {...},
"config\_options": [{...}, ...],
"email\_config\_options": [{...}, ...]
}
`
```
### get\_newsletter\_log
[](#get_newsletter_log)
Get the data on the Tautulli newsletter logs table.
```
`Required parameters:
None
Optional parameters:
order\_column (str): "timestamp", "newsletter\_id", "agent\_name", "notify\_action",
"subject\_text", "start\_date", "end\_date", "uuid"
order\_dir (str): "desc" or "asc"
start (int): Row to start from, 0
length (int): Number of items to return, 25
search (str): A string to search for, "Telegram"
Returns:
json:
{"draw": 1,
"recordsTotal": 1039,
"recordsFiltered": 163,
"data":
[{"agent\_id": 0,
"agent\_name": "recently\_added",
"end\_date": "2018-03-18",
"id": 7,
"newsletter\_id": 1,
"notify\_action": "on\_cron",
"start\_date": "2018-03-05",
"subject\_text": "Recently Added to Plex (Winterfell-Server)! (2018-03-18)",
"success": 1,
"timestamp": 1462253821,
"uuid": "7fe4g65i"
},
{...},
{...}
]
}
`
```
### get\_newsletters
[](#get_newsletters)
Get a list of configured newsletters.
```
`Required parameters:
None
Optional parameters:
None
Returns:
json:
[{"id": 1,
"agent\_id": 0,
"agent\_name": "recently\_added",
"agent\_label": "Recently Added",
"friendly\_name": "",
"cron": "0 0 \* \* 1",
"active": 1
}
]
`
```
### get\_notification\_log
[](#get_notification_log)
Get the data on the Tautulli notification logs table.
```
`Required parameters:
None
Optional parameters:
order\_column (str): "timestamp", "notifier\_id", "agent\_name", "notify\_action",
"subject\_text", "body\_text",
order\_dir (str): "desc" or "asc"
start (int): Row to start from, 0
length (int): Number of items to return, 25
search (str): A string to search for, "Telegram"
Returns:
json:
{"draw": 1,
"recordsTotal": 1039,
"recordsFiltered": 163,
"data":
[{"agent\_id": 13,
"agent\_name": "telegram",
"body\_text": "DanyKhaleesi69 started playing The Red Woman.",
"id": 1000,
"notify\_action": "on\_play",
"rating\_key": 153037,
"session\_key": 147,
"subject\_text": "Tautulli (Winterfell-Server)",
"success": 1,
"timestamp": 1462253821,
"user": "DanyKhaleesi69",
"user\_id": 8008135
},
{...},
{...}
]
}
`
```
### get\_notifier\_config
[](#get_notifier_config)
Get the configuration for an existing notification agent.
```
`Required parameters:
notifier\_id (int): The notifier config to retrieve
Optional parameters:
None
Returns:
json:
{"id": 1,
"agent\_id": 13,
"agent\_name": "telegram",
"agent\_label": "Telegram",
"friendly\_name": "",
"config": {"incl\_poster": 0,
"html\_support": 1,
"chat\_id": "123456",
"bot\_token": "13456789:fio9040NNo04jLEp-4S",
"incl\_subject": 1,
"disable\_web\_preview": 0
},
"config\_options": [{...}, ...]
"actions": {"on\_play": 0,
"on\_stop": 0,
...
},
"notify\_text": {"on\_play": {"subject": "...",
"body": "..."
}
"on\_stop": {"subject": "...",
"body": "..."
}
...
}
}
`
```
### get\_notifier\_parameters
[](#get_notifier_parameters)
Get the list of available notification parameters.
```
`Required parameters:
None
Optional parameters:
None
Returns:
json:
{
}
`
```
### get\_notifiers
[](#get_notifiers)
Get a list of configured notifiers.
```
`Required parameters:
None
Optional parameters:
notify\_action (str): The notification action to filter out
Returns:
json:
[{"id": 1,
"agent\_id": 13,
"agent\_name": "telegram",
"agent\_label": "Telegram",
"friendly\_name": "",
"active": 1
}
]
`
```
### get\_old\_rating\_keys
[](#get_old_rating_keys)
Get a list of old rating keys from the Tautulli database for all of the item's parent/children.
```
`Required parameters:
rating\_key (str): '12345'
media\_type (str): "movie", "show", "season", "episode", "artist", "album", "track"
Optional parameters:
None
Returns:
json:
{}
`
```
### get\_playlists\_table
[](#get_playlists_table)
Get the data on the Tautulli playlists tables.
```
`Required parameters:
section\_id (str): The section id of the Plex library, OR
user\_id (str): The user id of the Plex user
Optional parameters:
None
Returns:
json:
{"draw": 1,
"recordsTotal": 5,
"data":
[...]
}
`
```
### get\_plays\_by\_date
[](#get_plays_by_date)
Get graph data by date.
```
`Required parameters:
None
Optional parameters:
time\_range (str): The number of days of data to return
y\_axis (str): "plays" or "duration"
user\_id (str): Comma separated list of user id to filter the data
grouping (int): 0 or 1
Returns:
json:
{"categories":
["YYYY-MM-DD", "YYYY-MM-DD", ...]
"series":
[{"name": "Movies", "data": [...]}
{"name": "TV", "data": [...]},
{"name": "Music", "data": [...]},
{"name": "Live TV", "data": [...]}
]
}
`
```
### get\_plays\_by\_dayofweek
[](#get_plays_by_dayofweek)
Get graph data by day of the week.
```
`Required parameters:
None
Optional parameters:
time\_range (str): The number of days of data to return
y\_axis (str): "plays" or "duration"
user\_id (str): Comma separated list of user id to filter the data
grouping (int): 0 or 1
Returns:
json:
{"categories":
["Sunday", "Monday", "Tuesday", ..., "Saturday"]
"series":
[{"name": "Movies", "data": [...]}
{"name": "TV", "data": [...]},
{"name": "Music", "data": [...]},
{"name": "Live TV", "data": [...]}
]
}
`
```
### get\_plays\_by\_hourofday
[](#get_plays_by_hourofday)
Get graph data by hour of the day.
```
`Required parameters:
None
Optional parameters:
time\_range (str): The number of days of data to return
y\_axis (str): "plays" or "duration"
user\_id (str): Comma separated list of user id to filter the data
grouping (int): 0 or 1
Returns:
json:
{"categories":
["00", "01", "02", ..., "23"]
"series":
[{"name": "Movies", "data": [...]}
{"name": "TV", "data": [...]},
{"name": "Music", "data": [...]},
{"name": "Live TV", "data": [...]}
]
}
`
```
### get\_plays\_by\_source\_resolution
[](#get_plays_by_source_resolution)
Get graph data by source resolution.
```
`Required parameters:
None
Optional parameters:
time\_range (str): The number of days of data to return
y\_axis (str): "plays" or "duration"
user\_id (str): Comma separated list of user id to filter the data
grouping (int): 0 or 1
Returns:
json:
{"categories":
["720", "1080", "sd", ...]
"series":
[{"name": "Direct Play", "data": [...]}
{"name": "Direct Stream", "data": [...]},
{"name": "Transcode", "data": [...]}
]
}
`
```
### get\_plays\_by\_stream\_resolution
[](#get_plays_by_stream_resolution)
Get graph data by stream resolution.
```
`Required parameters:
None
Optional parameters:
time\_range (str): The number of days of data to return
y\_axis (str): "plays" or "duration"
user\_id (str): Comma separated list of user id to filter the data
grouping (int): 0 or 1
Returns:
json:
{"categories":
["720", "1080", "sd", ...]
"series":
[{"name": "Direct Play", "data": [...]}
{"name": "Direct Stream", "data": [...]},
{"name": "Transcode", "data": [...]}
]
}
`
```
### get\_plays\_by\_stream\_type
[](#get_plays_by_stream_type)
Get graph data by stream type by date.
```
`Required parameters:
None
Optional parameters:
time\_range (str): The number of days of data to return
y\_axis (str): "plays" or "duration"
user\_id (str): Comma separated list of user id to filter the data
grouping (int): 0 or 1
Returns:
json:
{"categories":
["YYYY-MM-DD", "YYYY-MM-DD", ...]
"series":
[{"name": "Direct Play", "data": [...]}
{"name": "Direct Stream", "data": [...]},
{"name": "Transcode", "data": [...]}
]
}
`
```
### get\_plays\_by\_top\_10\_platforms
[](#get_plays_by_top_10_platforms)
Get graph data by top 10 platforms.
```
`Required parameters:
None
Optional parameters:
time\_range (str): The number of days of data to return
y\_axis (str): "plays" or "duration"
user\_id (str): Comma separated list of user id to filter the data
grouping (int): 0 or 1
Returns:
json:
{"categories":
["iOS", "Android", "Chrome", ...]
"series":
[{"name": "Movies", "data": [...]}
{"name": "TV", "data": [...]},
{"name": "Music", "data": [...]},
{"name": "Live TV", "data": [...]}
]
}
`
```
### get\_plays\_by\_top\_10\_users
[](#get_plays_by_top_10_users)
Get graph data by top 10 users.
```
`Required parameters:
None
Optional parameters:
time\_range (str): The number of days of data to return
y\_axis (str): "plays" or "duration"
user\_id (str): Comma separated list of user id to filter the data
grouping (int): 0 or 1
Returns:
json:
{"categories":
["Jon Snow", "DanyKhaleesi69", "A Girl", ...]
"series":
[{"name": "Movies", "data": [...]}
{"name": "TV", "data": [...]},
{"name": "Music", "data": [...]},
{"name": "Live TV", "data": [...]}
]
}
`
```
### get\_plays\_per\_month
[](#get_plays_per_month)
Get graph data by month.
```
`Required parameters:
None
Optional parameters:
time\_range (str): The number of months of data to return
y\_axis (str): "plays" or "duration"
user\_id (str): Comma separated list of user id to filter the data
grouping (int): 0 or 1
Returns:
json:
{"categories":
["Jan 2016", "Feb 2016", "Mar 2016", ...]
"series":
[{"name": "Movies", "data": [...]}
{"name": "TV", "data": [...]},
{"name": "Music", "data": [...]},
{"name": "Live TV", "data": [...]}
]
}
`
```
### get\_plex\_log
[](#get_plex_log)
Get the PMS logs.
```
`Required parameters:
None
Optional parameters:
window (int): The number of tail lines to return
logfile (int): The name of the Plex log file,
e.g. "Plex Media Server", "Plex Media Scanner"
Returns:
json:
[["May 08, 2016 09:35:37",
"DEBUG",
"Auth: Came in with a super-token, authorization succeeded."
],
[...],
[...]
]
`
```
### get\_pms\_update
[](#get_pms_update)
Check for updates to the Plex Media Server.
```
`Required parameters:
None
Optional parameters:
None
Returns:
json:
{"update\_available": true,
"platform": "Windows",
"release\_date": "1473721409",
"version": "1.1.4.2757-24ffd60",
"requirements": "...",
"extra\_info": "...",
"changelog\_added": "...",
"changelog\_fixed": "...",
"label": "Download",
"distro": "english",
"distro\_build": "windows-i386",
"download\_url": "https://downloads.plex.tv/...",
}
`
```
### get\_recently\_added
[](#get_recently_added)
Get all items that where recently added to plex.
```
`Required parameters:
count (str): Number of items to return
Optional parameters:
start (str): The item number to start at
media\_type (str): The media type: movie, show, artist
section\_id (str): The id of the Plex library section
Returns:
json:
{"recently\_added":
[{"actors": [
"Kit Harington",
"Emilia Clarke",
"Isaac Hempstead-Wright",
"Maisie Williams",
"Liam Cunningham",
],
"added\_at": "1461572396",
"art": "/library/metadata/1219/art/1462175063",
"audience\_rating": "8",
"audience\_rating\_image": "rottentomatoes://image.rating.upright",
"banner": "/library/metadata/1219/banner/1462175063",
"directors": [
"Jeremy Podeswa"
],
"duration": "2998290",
"full\_title": "Game of Thrones - The Red Woman",
"genres": [
"Adventure",
"Drama",
"Fantasy"
],
"grandparent\_rating\_key": "1219",
"grandparent\_thumb": "/library/metadata/1219/thumb/1462175063",
"grandparent\_title": "Game of Thrones",
"guid": "com.plexapp.agents.thetvdb://121361/6/1?lang=en",
"guids": [],
"labels": [],
"last\_viewed\_at": "1462165717",
"library\_name": "TV Shows",
"media\_index": "1",
"media\_type": "episode",
"original\_title": "",
"originally\_available\_at": "2016-04-24",
"parent\_media\_index": "6",
"parent\_rating\_key": "153036",
"parent\_thumb": "/library/metadata/153036/thumb/1462175062",
"parent\_title": "",
"rating": "7.8",
"rating\_image": "rottentomatoes://image.rating.ripe",
"rating\_key": "153037",
"section\_id": "2",
"sort\_title": "Red Woman",
"studio": "HBO",
"summary": "Jon Snow is dead. Daenerys meets a strong man. Cersei sees her daughter again.",
"tagline": "",
"thumb": "/library/metadata/153037/thumb/1462175060",
"title": "The Red Woman",
"user\_rating": "9.0",
"updated\_at": "1462175060",
"writers": [
"David Benioff",
"D. B. Weiss"
],
"year": "2016"
},
{...},
{...}
]
}
`
```
### get\_server\_friendly\_name
[](#get_server_friendly_name)
Get the name of the PMS.
```
`Required parameters:
None
Optional parameters:
None
Returns:
string: "Winterfell-Server"
`
```
### get\_server\_id
[](#get_server_id)
Get the PMS server identifier.
```
`Required parameters:
hostname (str): 'localhost' or '192.160.0.10'
port (int): 32400
Optional parameters:
ssl (int): 0 or 1
remote (int): 0 or 1
Returns:
json:
{'identifier': '08u2phnlkdshf890bhdlksghnljsahgleikjfg9t'}
`
```
### get\_server\_identity
[](#get_server_identity)
Get info about the local server.
```
`Required parameters:
None
Optional parameters:
None
Returns:
json:
[{"machine\_identifier": "ds48g4r354a8v9byrrtr697g3g79w",
"version": "0.9.15.x.xxx-xxxxxxx"
}
]
`
```
### get\_server\_info
[](#get_server_info)
Get the PMS server information.
```
`Required parameters:
None
Optional parameters:
None
Returns:
json:
{"pms\_identifier": "08u2phnlkdshf890bhdlksghnljsahgleikjfg9t",
"pms\_ip": "10.10.10.1",
"pms\_is\_remote": 0,
"pms\_name": "Winterfell-Server",
"pms\_platform": "Windows",
"pms\_plexpass": 1,
"pms\_port": 32400,
"pms\_ssl": 0,
"pms\_url": "http://10.10.10.1:32400",
"pms\_url\_manual": 0,
"pms\_version": "1.20.0.3133-fede5bdc7"
}
`
```
### get\_server\_list
[](#get_server_list)
Get all your servers that are published to Plex.tv.
```
`Required parameters:
None
Optional parameters:
None
Returns:
json:
[{"clientIdentifier": "ds48g4r354a8v9byrrtr697g3g79w",
"httpsRequired": "0",
"ip": "xxx.xxx.xxx.xxx",
"label": "Winterfell-Server",
"local": "1",
"port": "32400",
"value": "xxx.xxx.xxx.xxx"
},
{...},
{...}
]
`
```
### get\_server\_pref
[](#get_server_pref)
Get a specified PMS server preference.
```
`Required parameters:
pref (str): Name of preference
Returns:
string: Value of preference
`
```
### get\_servers\_info
[](#get_servers_info)
Get info about the PMS.
```
`Required parameters:
None
Optional parameters:
None
Returns:
json:
[{"port": "32400",
"host": "10.0.0.97",
"version": "0.9.15.2.1663-7efd046",
"name": "Winterfell-Server",
"machine\_identifier": "ds48g4r354a8v9byrrtr697g3g79w"
}
]
`
```
### get\_settings
[](#get_settings)
Gets all settings from the config file.
```
`Required parameters:
None
Optional parameters:
key (str): Name of a config section to return
Returns:
json:
{"General": {"api\_enabled": true, ...}
"Advanced": {"cache\_sizemb": "32", ...},
...
}
`
```
### get\_stream\_data
[](#get_stream_data)
Get the stream details from history or current stream.
```
`Required parameters:
row\_id (int): The row ID number for the history item, OR
session\_key (int): The session key of the current stream
Optional parameters:
None
Returns:
json:
{"aspect\_ratio": "2.35",
"audio\_bitrate": 231,
"audio\_channels": 6,
"audio\_language": "English",
"audio\_language\_code": "eng",
"audio\_codec": "aac",
"audio\_decision": "transcode",
"bitrate": 2731,
"container": "mp4",
"current\_session": "",
"grandparent\_title": "",
"media\_type": "movie",
"optimized\_version": "",
"optimized\_version\_profile": "",
"optimized\_version\_title": "",
"original\_title": "",
"pre\_tautulli": "",
"quality\_profile": "1.5 Mbps 480p",
"stream\_audio\_bitrate": 203,
"stream\_audio\_channels": 2,
"stream\_audio\_language": "English",
"stream\_audio\_language\_code", "eng",
"stream\_audio\_codec": "aac",
"stream\_audio\_decision": "transcode",
"stream\_bitrate": 730,
"stream\_container": "mkv",
"stream\_container\_decision": "transcode",
"stream\_subtitle\_codec": "",
"stream\_subtitle\_decision": "",
"stream\_video\_bitrate": 527,
"stream\_video\_codec": "h264",
"stream\_video\_decision": "transcode",
"stream\_video\_dynamic\_range": "SDR",
"stream\_video\_framerate": "24p",
"stream\_video\_height": 306,
"stream\_video\_resolution": "SD",
"stream\_video\_width": 720,
"subtitle\_codec": "",
"subtitles": "",
"synced\_version": "",
"synced\_version\_profile": "",
"title": "Frozen",
"transcode\_hw\_decoding": "",
"transcode\_hw\_encoding": "",
"video\_bitrate": 2500,
"video\_codec": "h264",
"video\_decision": "transcode",
"video\_dynamic\_range": "SDR",
"video\_framerate": "24p",
"video\_height": 816,
"video\_resolution": "1080",
"video\_width": 1920
}
`
```
### get\_stream\_type\_by\_top\_10\_platforms
[](#get_stream_type_by_top_10_platforms)
Get graph data by stream type by top 10 platforms.
```
`Required parameters:
None
Optional parameters:
time\_range (str): The number of days of data to return
y\_axis (str): "plays" or "duration"
user\_id (str): Comma separated list of user id to filter the data
grouping (int): 0 or 1
Returns:
json:
{"categories":
["iOS", "Android", "Chrome", ...]
"series":
[{"name": "Direct Play", "data": [...]}
{"name": "Direct Stream", "data": [...]},
{"name": "Transcode", "data": [...]}
]
}
`
```
### get\_stream\_type\_by\_top\_10\_users
[](#get_stream_type_by_top_10_users)
Get graph data by stream type by top 10 users.
```
`Required parameters:
None
Optional parameters:
time\_range (str): The number of days of data to return
y\_axis (str): "plays" or "duration"
user\_id (str): Comma separated list of user id to filter the data
grouping (int): 0 or 1
Returns:
json:
{"categories":
["Jon Snow", "DanyKhaleesi69", "A Girl", ...]
"series":
[{"name": "Direct Play", "data": [...]}
{"name": "Direct Stream", "data": [...]},
{"name": "Transcode", "data": [...]}
]
}
`
```
### get\_synced\_items
[](#get_synced_items)
Get a list of synced items on the PMS.
```
`Required parameters:
None
Optional parameters:
machine\_id (str): The PMS identifier
user\_id (str): The id of the Plex user
Returns:
json:
[{"audio\_bitrate": "192",
"client\_id": "95434se643fsf24f-com-plexapp-android",
"content\_type": "video",
"device\_name": "Tyrion's iPad",
"failure": "",
"item\_complete\_count": "1",
"item\_count": "1",
"item\_downloaded\_count": "1",
"item\_downloaded\_percent\_complete": 100,
"metadata\_type": "movie",
"photo\_quality": "74",
"platform": "iOS",
"rating\_key": "154092",
"root\_title": "Movies",
"state": "complete",
"sync\_id": "11617019",
"sync\_media\_type": null,
"sync\_title": "Deadpool",
"total\_size": "560718134",
"user": "DrukenDwarfMan",
"user\_id": "696969",
"username": "DrukenDwarfMan",
"video\_bitrate": "4000"
"video\_quality": "100"
},
{...},
{...}
]
`
```
### get\_tautulli\_info
[](#get_tautulli_info)
Get info about the Tautulli server.
```
`Required parameters:
None
Optional parameters:
None
Returns:
json:
{"tautulli\_install\_type": "git",
"tautulli\_version": "v2.8.1",
"tautulli\_branch": "master",
"tautulli\_commit": "2410eb33805aaac4bd1c5dad0f71e4f15afaf742",
"tautulli\_platform": "Windows",
"tautulli\_platform\_release": "10",
"tautulli\_platform\_version": "10.0.19043",
"tautulli\_platform\_linux\_distro": "",
"tautulli\_platform\_device\_name": "Winterfell-Server",
"tautulli\_python\_version": "3.10.0"
}
`
```
### get\_user
[](#get_user)
Get a user's details.
```
`Required parameters:
user\_id (str): The id of the Plex user
Optional parameters:
include\_last\_seen (bool): True to include the last\_seen value for the user.
Returns:
json:
{"allow\_guest": 1,
"deleted\_user": 0,
"do\_notify": 1,
"email": "Jon.Snow.1337@CastleBlack.com",
"friendly\_name": "Jon Snow",
"is\_active": 1,
"is\_admin": 0,
"is\_allow\_sync": 1,
"is\_home\_user": 1,
"is\_restricted": 0,
"keep\_history": 1,
"last\_seen": 1462591869,
"row\_id": 1,
"shared\_libraries": ["10", "1", "4", "5", "15", "20", "2"],
"user\_id": 133788,
"user\_thumb": "https://plex.tv/users/k10w42309cynaopq/avatar",
"username": "LordCommanderSnow"
}
`
```
### get\_user\_ips
[](#get_user_ips)
Get the data on Tautulli users IP table.
```
`Required parameters:
user\_id (str): The id of the Plex user
Optional parameters:
order\_column (str): "last\_seen", "first\_seen", "ip\_address", "platform",
"player", "last\_played", "play\_count"
order\_dir (str): "desc" or "asc"
start (int): Row to start from, 0
length (int): Number of items to return, 25
search (str): A string to search for, "xxx.xxx.xxx.xxx"
Returns:
json:
{"draw": 1,
"recordsTotal": 2344,
"recordsFiltered": 10,
"data":
[{"friendly\_name": "Jon Snow",
"guid": "com.plexapp.agents.thetvdb://121361/6/1?lang=en",
"id": 1121,
"ip\_address": "xxx.xxx.xxx.xxx",
"last\_played": "Game of Thrones - The Red Woman",
"last\_seen": 1462591869,
"first\_seen": 1583968210,
"live": 0,
"media\_index": 1,
"media\_type": "episode",
"originally\_available\_at": "2016-04-24",
"parent\_media\_index": 6,
"parent\_title": "",
"platform": "Chrome",
"play\_count": 149,
"player": "Plex Web (Chrome)",
"rating\_key": 153037,
"thumb": "/library/metadata/153036/thumb/1462175062",
"transcode\_decision": "transcode",
"user\_id": 133788,
"year": 2016
},
{...},
{...}
]
}
`
```
### get\_user\_logins
[](#get_user_logins)
Get the data on Tautulli user login table.
```
`Required parameters:
user\_id (str): The id of the Plex user
Optional parameters:
order\_column (str): "date", "time", "ip\_address", "host", "os", "browser"
order\_dir (str): "desc" or "asc"
start (int): Row to start from, 0
length (int): Number of items to return, 25
search (str): A string to search for, "xxx.xxx.xxx.xxx"
Returns:
json:
{"draw": 1,
"recordsTotal": 2344,
"recordsFiltered": 10,
"data":
[{"browser": "Safari 7.0.3",
"current": false,
"expiry": "2021-06-30 18:48:03",
"friendly\_name": "Jon Snow",
"host": "http://plexpy.castleblack.com",
"ip\_address": "xxx.xxx.xxx.xxx",
"os": "Mac OS X",
"row\_id": 1,
"timestamp": 1462591869,
"user": "LordCommanderSnow",
"user\_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10\_9\_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A",
"user\_group": "guest",
"user\_id": 133788
},
{...},
{...}
]
}
`
```
### get\_user\_names
[](#get_user_names)
Get a list of all user and user ids.
```
`Required parameters:
None
Optional parameters:
None
Returns:
json:
[{"friendly\_name": "Jon Snow", "user\_id": 133788},
{"friendly\_name": "DanyKhaleesi69", "user\_id": 8008135},
{"friendly\_name": "Tyrion Lannister", "user\_id": 696969},
{...},
]
`
```
### get\_user\_player\_stats
[](#get_user_player_stats)
Get a user's player statistics.
```
`Required parameters:
user\_id (str): The id of the Plex user
Optional parameters:
grouping (int): 0 or 1
Returns:
json:
[{"platform": "Chrome",
"platform\_name": "chrome",
"player\_name": "Plex Web (Chrome)",
"result\_id": 1,
"total\_plays": 170,
"total\_time": 349618
},
{"platform": "Chromecast",
"platform\_name": "chromecast",
"player\_name": "Chromecast",
"result\_id": 2,
"total\_plays": 42,
"total\_time": 50185
},
{...},
{...}
]
`
```
### get\_user\_watch\_time\_stats
[](#get_user_watch_time_stats)
Get a user's watch time statistics.
```
`Required parameters:
user\_id (str): The id of the Plex user
Optional parameters:
grouping (int): 0 or 1
query\_days (str): Comma separated days, e.g. "1,7,30,0"
Returns:
json:
[{"query\_days": 1,
"total\_plays": 0,
"total\_time": 0
},
{"query\_days": 7,
"total\_plays": 3,
"total\_time": 15694
},
{"query\_days": 30,
"total\_plays": 35,
"total\_time": 63054
},
{"query\_days": 0,
"total\_plays": 508,
"total\_time": 1183080
}
]
`
```
### get\_users
[](#get_users)
Get a list of all users that have access to your server.
```
`Required parameters:
None
Optional parameters:
None
Returns:
json:
[{"allow\_guest": 1,
"do\_notify": 1,
"email": "Jon.Snow.1337@CastleBlack.com",
"filter\_all": "",
"filter\_movies": "",
"filter\_music": "",
"filter\_photos": "",
"filter\_tv": "",
"is\_active": 1,
"is\_admin": 0,
"is\_allow\_sync": 1,
"is\_home\_user": 1,
"is\_restricted": 0,
"keep\_history": 1,
"row\_id": 1,
"shared\_libraries": ["1", "2", "3"],
"thumb": "https://plex.tv/users/k10w42309cynaopq/avatar",
"user\_id": "133788",
"username": "Jon Snow"
},
{...},
{...}
]
`
```
### get\_users\_table
[](#get_users_table)
Get the data on Tautulli users table.
```
`Required parameters:
None
Optional parameters:
grouping (int): 0 or 1
order\_column (str): "user\_thumb", "friendly\_name", "last\_seen", "ip\_address", "platform",
"player", "last\_played", "plays", "duration"
order\_dir (str): "desc" or "asc"
start (int): Row to start from, 0
length (int): Number of items to return, 25
search (str): A string to search for, "Jon Snow"
Returns:
json:
{"draw": 1,
"recordsTotal": 10,
"recordsFiltered": 10,
"data":
[{"allow\_guest": 1,
"do\_notify": 1,
"duration": 2998290,
"email": "Jon.Snow.1337@CastleBlack.com",
"friendly\_name": "Jon Snow",
"guid": "com.plexapp.agents.thetvdb://121361/6/1?lang=en",
"history\_row\_id": 1121,
"ip\_address": "xxx.xxx.xxx.xxx",
"is\_active": 1,
"keep\_history": 1,
"last\_played": "Game of Thrones - The Red Woman",
"last\_seen": 1462591869,
"live": 0,
"media\_index": 1,
"media\_type": "episode",
"originally\_available\_at": "2016-04-24",
"parent\_media\_index": 6,
"parent\_title": "",
"platform": "Chrome",
"player": "Plex Web (Chrome)",
"plays": 487,
"rating\_key": 153037,
"row\_id": 1,
"thumb": "/library/metadata/153036/thumb/1462175062",
"title": "Jon Snow",
"transcode\_decision": "transcode",
"user\_id": 133788,
"user\_thumb": "https://plex.tv/users/568gwwoib5t98a3a/avatar",
"username": "LordCommanderSnow",
"year": 2016
},
{...},
{...}
]
}
`
```
### get\_whois\_lookup
[](#get_whois_lookup)
Get the connection info for an IP address.
```
`Required parameters:
ip\_address
Optional parameters:
None
Returns:
json:
{"host": "google-public-dns-a.google.com",
"nets": [{"description": "Google Inc.",
"address": "1600 Amphitheatre Parkway",
"city": "Mountain View",
"state": "CA",
"postal\_code": "94043",
"country": "United States",
...
},
{...}
]
json:
{"host": "Not available",
"nets": [],
"error": "IPv4 address 127.0.0.1 is already defined as Loopback via RFC 1122, Section 3.2.1.3."
}
`
```
### import\_config
[](#import_config)
Import a Tautulli config file.
```
`Required parameters:
config\_file (file): The config file to import (multipart/form-data)
or
config\_path (str): The full path to the config file to import
Optional parameters:
backup (bool): true or false whether to backup
the current config before importing
Returns:
json:
{"result": "success",
"message": "Config import has started. Check the logs to monitor any problems. "
"Tautulli will restart automatically."
}
`
```
### import\_database
[](#import_database)
Import a Tautulli, PlexWatch, or Plexivity database into Tautulli.
```
`Required parameters:
app (str): "tautulli" or "plexwatch" or "plexivity"
database\_file (file): The database file to import (multipart/form-data)
or
database\_path (str): The full path to the database file to import
method (str): For Tautulli only, "merge" or "overwrite"
table\_name (str): For PlexWatch or Plexivity only, "processed" or "grouped"
Optional parameters:
backup (bool): For Tautulli only, true or false whether to backup
the current database before importing
import\_ignore\_interval (int): For PlexWatch or Plexivity only, the minimum number
of seconds for a stream to import
Returns:
json:
{"result": "success",
"message": "Database import has started. Check the logs to monitor any problems."
}
`
```
### logout\_user\_session
[](#logout_user_session)
Logout Tautulli user sessions.
```
`Required parameters:
row\_ids (str): Comma separated row ids to sign out, e.g. "2,3,8"
Optional parameters:
None
Returns:
None
`
```
### notify
[](#notify)
Send a notification using Tautulli.
```
`Required parameters:
notifier\_id (int): The ID number of the notification agent
subject (str): The subject of the message
body (str): The body of the message
Optional parameters:
headers (str): The JSON headers for webhook notifications
script\_args (str): The arguments for script notifications
Returns:
json:
{"notification\_id": 1}
`
```
### notify\_newsletter
[](#notify_newsletter)
Send a newsletter using Tautulli.
```
`Required parameters:
newsletter\_id (int): The ID number of the newsletter agent
Optional parameters:
subject (str): The subject of the newsletter
body (str): The body of the newsletter
message (str): The message of the newsletter
Returns:
json:
{"newsletter\_notification\_id": 1}
`
```
### notify\_recently\_added
[](#notify_recently_added)
Send a recently added notification using Tautulli.
```
`Required parameters:
rating\_key (int): The rating key for the media
Optional parameters:
notifier\_id (int): The ID number of the notification agent.
The notification will send to all enabled notification agents if notifier id is not provided.
Returns:
json
{"result": "success",
"message": "Notification queued."
}
`
```
### pms\_image\_proxy
[](#pms_image_proxy)
Gets an image from the PMS and saves it to the image cache directory.
```
`Required parameters:
img (str): /library/metadata/153037/thumb/1462175060
or
rating\_key (str): 54321
Optional parameters:
width (str): 300
height (str): 450
opacity (str): 25
background (str): Hex color, e.g. 282828
blur (str): 3
img\_format (str): png or jpg
fallback (str): "poster", "cover", "art", "poster-live", "art-live", "art-live-full", "user"
refresh (bool): True or False whether to refresh the image cache
return\_hash (bool): True or False to return the self-hosted image hash instead of the image
Returns:
None
`
```
### refresh\_libraries\_list
[](#refresh_libraries_list)
Refresh the Tautulli libraries list.
### refresh\_users\_list
[](#refresh_users_list)
Refresh the Tautulli users list.
### register\_device
[](#register_device)
Registers the Tautulli Remote App.
```
`Required parameters:
device\_id (str): The unique device identifier for the mobile device
device\_name (str): The device name of the mobile device
Optional parameters:
platform (str): The platform of the mobile devices
version (str): The version of the app
friendly\_name (str): A friendly name to identify the mobile device
onesignal\_id (str): The OneSignal id for the mobile device
min\_version (str): The minimum Tautulli version supported by the mobile device, e.g. v2.5.6
Returns:
json:
{"pms\_identifier": "08u2phnlkdshf890bhdlksghnljsahgleikjfg9t",
"pms\_ip": "10.10.10.1",
"pms\_is\_remote": 0,
"pms\_name": "Winterfell-Server",
"pms\_platform": "Windows",
"pms\_plexpass": 1,
"pms\_port": 32400,
"pms\_ssl": 0,
"pms\_url": "http://10.10.10.1:32400",
"pms\_url\_manual": 0,
"pms\_version": "1.20.0.3133-fede5bdc7"
"server\_id": "2ce060c87958445d8399a7a0c5663755",
"tautulli\_install\_type": "git",
"tautulli\_branch": "master",
"tautulli\_commit": "14b98a32e085d969f010f0249c3d2f660db50880",
"tautulli\_platform": "Windows",
"tautulli\_platform\_device\_name": "Winterfell-PC",
"tautulli\_platform\_linux\_distro": "",
"tautulli\_platform\_release": "10",
"tautulli\_platform\_version": "10.0.18362",
"tautulli\_python\_version": "3.8.3"
"tautulli\_version": "v2.5.6",
}
`
```
### regroup\_history
[](#regroup_history)
Regroup play history in the database.
### restart
[](#restart)
Restart Tautulli.
### search
[](#search)
Get search results from the PMS.
```
`Required parameters:
query (str): The query string to search for
Optional parameters:
limit (int): The maximum number of items to return per media type
Returns:
json:
{"results\_count": 69,
"results\_list":
{"movie":
[{...},
{...},
]
},
{"episode":
[{...},
{...},
]
},
{...}
}
`
```
### server\_status
[](#server_status)
Get the current status of Tautulli's connection to the Plex server.
```
`Required parameters:
None
Optional parameters:
None
Returns:
json:
{"result": "success",
"connected": true,
}
`
```
### set\_mobile\_device\_config
[](#set_mobile_device_config)
Configure an existing notification agent.
```
`Required parameters:
mobile\_device\_id (int): The mobile device config to update
Optional parameters:
friendly\_name (str): A friendly name to identify the mobile device
Returns:
None
`
```
### set\_newsletter\_config
[](#set_newsletter_config)
Configure an existing newsletter agent.
```
`Required parameters:
newsletter\_id (int): The newsletter config to update
agent\_id (int): The newsletter type of the newsletter
Optional parameters:
Pass all the config options for the agent with the 'newsletter\_config\_' and 'newsletter\_email\_' prefix.
Returns:
None
`
```
### set\_notifier\_config
[](#set_notifier_config)
Configure an existing notification agent.
```
`Required parameters:
notifier\_id (int): The notifier config to update
agent\_id (int): The agent of the notifier
Optional parameters:
Pass all the config options for the agent with the agent prefix:
e.g. For Telegram: telegram\_bot\_token
telegram\_chat\_id
telegram\_disable\_web\_preview
telegram\_html\_support
telegram\_incl\_poster
telegram\_incl\_subject
Notify actions (int): 0 or 1,
e.g. on\_play, on\_stop, etc.
Notify text (str):
e.g. on\_play\_subject, on\_play\_body, etc.
Returns:
None
`
```
### sql
[](#sql)
Query the Tautulli database with raw SQL. Automatically makes a backup of
the database if the latest backup is older then 24h. `api\_sql` must be
manually enabled in the config file while Tautulli is shut down.
```
`Required parameters:
query (str): The SQL query
Optional parameters:
None
Returns:
None
`
```
### status
[](#status)
Get the current status of Tautulli.
```
`Required parameters:
None
Optional parameters:
check (str): database
Returns:
json:
{"result": "success",
"message": "Ok",
}
`
```
### terminate\_session
[](#terminate_session)
Stop a streaming session.
```
`Required parameters:
session\_key (int): The session key of the session to terminate, OR
session\_id (str): The session id of the session to terminate
Optional parameters:
message (str): A custom message to send to the client
Returns:
None
`
```
### undelete\_library
[](#undelete_library)
Restore a deleted library section to Tautulli.
```
`Required parameters:
section\_id (str): The id of the Plex library section
section\_name (str): The name of the Plex library section
Optional parameters:
None
Returns:
None
`
```
### undelete\_user
[](#undelete_user)
Restore a deleted user to Tautulli.
```
`Required parameters:
user\_id (str): The id of the Plex user
username (str): The username of the Plex user
Optional parameters:
None
Returns:
None
`
```
### update
[](#update)
Update Tautulli.
### update\_check
[](#update_check)
Check for Tautulli updates.
```
`Required parameters:
None
Optional parameters:
None
Returns:
json
{"result": "success",
"update": true,
"message": "An update for Tautulli is available."
}
`
```
### update\_metadata\_details
[](#update_metadata_details)
Update the metadata in the Tautulli database by matching rating keys.
Also updates all parents or children of the media item if it is a show/season/episode
or artist/album/track.
```
`Required parameters:
old\_rating\_key (str): 12345
new\_rating\_key (str): 54321
media\_type (str): "movie", "show", "season", "episode", "artist", "album", "track"
Optional parameters:
None
Returns:
None
`
```
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