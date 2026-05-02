Plex API: Get Recently Added TV Shows - Plexopedia
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
This API command is used to get all recently added TV show episodes to a library.
## URL
```
GET http://{ip\_address}:32400/library/sections/{id}/recentlyAdded?X-Plex-Token={plex\_token}
```
### Parameters
|Name|Description|
|ip\_address|The IP address of the Plex Media server.|
|plex\_token|The [Plex token](https://www.plexopedia.com/plex-media-server/general/plex-token/).|
|id|The key associated with a TV show library. This key can be found by calling the [Libraries API command](/plex-media-server/api/server/libraries/) and using the value of the `key` attribute associated with the TV show library.|
## Return Status
|HTTP Code|Description|
|200|Success - The request was successful.|
|401|Unauthorized - The Plex token provided was not valid.|
|404|Not Found - The URL path is incorrect. See [Remarks](#remarks) below.|
## Response
XML string value that lists the all the recently added TV shows in the library. An example of the XML returned from the request is shown below:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="99" allowSync="1" art="/:/resources/show-fanart.jpg" identifier="com.plexapp.plugins.library" librarySectionID="4" librarySectionTitle="TV Shows" librarySectionUUID="3bbbe6f7-628f-4983-ae5d-7c05779c4c28" mediaTagPrefix="/system/bundle/media/flags/" mediaTagVersion="1710434120" mixedParents="1" nocache="1" sortAsc="1" thumb="/:/resources/show.png" title1="TV Shows" title2="Recently Added" viewGroup="episode" viewMode="131133"\>
\<Video ratingKey="284997" key="/library/metadata/284997" skipParent="1" parentRatingKey="284996" grandparentRatingKey="284995" guid="plex://episode/5ee7425070a20200424dcd66" parentGuid="plex://season/602e7afac96042002d09cdaa" grandparentGuid="plex://show/5ee7425070a20200424dcd49" grandparentSlug="men-in-kilts-a-roadtrip-with-sam-and-graham" type="episode" title="Food and Drink" grandparentKey="/library/metadata/284995" parentKey="/library/metadata/284996" grandparentTitle="Men in Kilts: A Roadtrip with Sam and Graham" parentTitle="Season 1" contentRating="TV-PG" summary="Scotland's cuisine and whisky are renown throughout the world, for different reasons. In this episode, Sam and Graham explore the world's finest whisky and dishes like Haggis." index="1" parentIndex="1" viewCount="1" lastViewedAt="1660701675" thumb="/library/metadata/284997/thumb/1660697962" art="/library/metadata/284995/art/1710311992" parentThumb="/library/metadata/284996/thumb/1660697962" grandparentThumb="/library/metadata/284995/thumb/1710311992" grandparentArt="/library/metadata/284995/art/1710311992" duration="1745792" originallyAvailableAt="2021-02-14" addedAt="1660697959" updatedAt="1660697962"\>
\<Media id="347530" duration="1745792" bitrate="9847" width="1920" height="1080" aspectRatio="1.78" audioChannels="6" audioCodec="eac3" videoCodec="h264" videoResolution="1080" container="mkv" videoFrameRate="24p" videoProfile="high"\>
\<Part id="347884" key="/library/parts/347884/1660602452/file.mkv" duration="1745792" file="M:\\Media\\TV Shows\\Men in Kilts - A Roadtrip with Sam and Graham\\Season 1\\Men.in.Kilts.A.Roadtrip.with.Sam.and.Graham.S01E01.Food.and.Drink.1080p.AMZN.WEB-DL.DDP.5.1.H.264-FLUX[eztv.re].mkv" size="2149536961" container="mkv" videoProfile="high" /\>
\</Media\>
\</Video\>
...
\</MediaContainer\>
```
The XML returned provides a list of the all TV shows in a library have been recently added to the Plex server. The root is the `MediaContainer` element. This element contains a few attributes that provide overall information about the TV shows on the server.
MediaContainer Attributes|Attribute|Description|
|size|The number of episodes.|
|allowSync|1 - allow syncing content.
0 - don't allow syncing content.|
|art|Background artwork used to represent the episode.|
|identifier|The type of item.|
|librarySectionID|The unique key associated with the library.|
|librarySectionTitle|The title of the library.|
|librarySectionUUID|Unique GUID identifier for the library.|
|mediaTagPrefix|Prefix for the media tag.|
|mediaTagVersion|Media tag version.
**Note:** This could be a date and time value.|
|mixedParents|Media items returned contain multiple parents.|
|nocache|1 - cache the library.
0 - do not cache the library.|
|sortAsc|1 - the library is sorted in ascending order.
0 - the library is sorted in descending order.|
|thumb|The thumbnail for the episode.|
|title1|The title of the episode.
**Note:** This appears to be internally created, and can't be changed by the server owner.|
|title2|A descriptive title for the episode.|
|viewGroup|The group type used to view the episode.|
|viewMode|Unknown integer value.|
Within the `MediaContainer` there are one or more `Video` child elements. Each `Video` element represents one TV show available on the Plex server.
Video Attributes|Attribute|Description|
|ratingKey|A key associated with the episode.|
|key|The relative URL of the episode information.|
|skipParent|Flag indicate how to display the seasons. 0 - show the season.
1 - hide for single-season series.
2 - hide all seasons.|
|parentRatingKey|The relative URL of the information for the season.|
|grandparentRatingKey|The relative URL of the information for the TV show.|
|guid|The unique identifier comprised of the Plex agent and episode identifier for the agent.|
|parentGuid|The GUID for the season.|
|grandparentGuid|The GUID for the TV show.|
|grandparentSlug|The short path name for the TV show.|
|type|The type of media.|
|title|The title of the episode.|
|grandparentKey|The unique identifier for the TV show.|
|parentKey|The unique identifier for the season.|
|grandparentTitle|The title of the TV show.|
|parentTitle|The title of the season.|
|contentRating|The content rating associated with the episode.|
|summary|A summary of the episode.|
|index|The index of the episode.|
|parentIndex|The index of the season.|
|viewCount|The number of times the episode has been viewed.|
|lastViewedAt|The date and time for the last time the episode was viewed.|
|thumb|The thumbnail for the episode.|
|art|The background artwork used to represent the episode.|
|parentThumb|The thumbnail for the season.|
|grandparentThumb|The thumbnail for the TV show.|
|grandparentArt|The background artwork used to represent the TV show.|
|duration|The length of the episode in milliseconds.|
|originallyAvailableAt|The original release date of the episode.|
|addedAt|The date and time, in [Unix time](https://en.wikipedia.org/wiki/Unix_time), the episode was added to the library.|
|updatedAt|The date and time in [epoch time](https://en.wikipedia.org/wiki/Unix_time), the episode was updated in the library.|
Within the `Video` there are one or more `Media` child elements. Each `Media` element represents one media file of the episode available on the Plex server.
If there are two media files associated with the episode, such as a 1080p and 480p version, then there would be two `Media` child elements in the `Video` element.
Media Attributes|Attribute|Description|
|id|Unique ID associated with the episode.|
|duration|The length of the episode in milliseconds.|
|bitrate|The bitrate of the episode.|
|width|The width of the episode.|
|height|The height of the episode.|
|aspectRatio|The aspect ratio of the episode.|
|audioChannels|The number of audio channels.|
|audioCodec|The audio codec used to encode the audio.|
|videoCodec|The video codec used to encode the video.|
|videoResolution|The video resolution.|
|container|The episode container.|
|videoFrameRate|The framerate standard used for the video.|
|videoProfile|The video profile of the media.|
Within the `Media` there are one or more `Part` child elements. Each `Part` element represents one part of the TV show episode.
Part Attributes|Attribute|Description|
|id|Unique ID associated with the part.|
|key|The unique relative path for the part that is used at its key.|
|duration|The length of the part in milliseconds.|
|file|The file associated with the part.|
|size|The file size of the part.|
|container|The type of media container.|
|videoProfile|The video profile associated with the video part.|
## Remarks
When using the command ensure that the 'A' in 'recentlyAdded' is in uppercase. A lowercase 'A' will return a 404 status code.
## Examples
curl Python Powershell
```
curl -X GET http://{ip\_address}:32400/library/sections/{id}/recentlyAdded?X-Plex-Token={plex\_token}
```
```
import requests
plex\_url = http://{ip\_address}:32400/library/sections/{id}/recentlyAdded?X-Plex-Token={plex\_token}
response = requests.get(plex\_url)
print(response.text)
```
```
$response = Invoke-RestMethod 'http://{ip\_address}:32400/library/sections/{id}/recentlyAdded?X-Plex-Token={plex\_token}' -Method GET
Write-Output $response
```
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
Subscribe
Name:
Email:
Articles
API
Blog Posts
[API Home](https://www.plexopedia.com/plex-media-server/api/) [Plex.tv API Home](https://www.plexopedia.com/plex-media-server/api-plextv/)### Server
[Server Capabilities](https://www.plexopedia.com/plex-media-server/api/server/capabilities/) [Server Identity](https://www.plexopedia.com/plex-media-server/api/server/identity/) [Get Server Preferences](https://www.plexopedia.com/plex-media-server/api/server/preferences/) [Set a Server Preference](https://www.plexopedia.com/plex-media-server/api/server/preference-set/) [Get Server List](https://www.plexopedia.com/plex-media-server/api/server/list/) [Get Accounts](https://www.plexopedia.com/plex-media-server/api/server/accounts/) [Get a Single Account](https://www.plexopedia.com/plex-media-server/api/server/account/) [Get Devices](https://www.plexopedia.com/plex-media-server/api/server/devices/) [Get a Single Device](https://www.plexopedia.com/plex-media-server/api/server/device/) [Get All Activities](https://www.plexopedia.com/plex-media-server/api/server/activities/) [Stop an Activity](https://www.plexopedia.com/plex-media-server/api/server/stop-activity/) [Get Transient Token](https://www.plexopedia.com/plex-media-server/api/server/transient-token/) [Perform Search](https://www.plexopedia.com/plex-media-server/api/server/search/) [Listen for Notifications](https://www.plexopedia.com/plex-media-server/api/server/listen-notifications/) [Listen for Events](https://www.plexopedia.com/plex-media-server/api/server/listen-events/) [Check for Updates](https://www.plexopedia.com/plex-media-server/api/server/update-check/) [Get Update Status](https://www.plexopedia.com/plex-media-server/api/server/update-status/)
### Sessions
[Get Active Sessions](https://www.plexopedia.com/plex-media-server/api/server/sessions/) [Get Transcode Sessions](https://www.plexopedia.com/plex-media-server/api/server/transcode-sessions/) [Terminate a Session](https://www.plexopedia.com/plex-media-server/api/server/session-terminate/) [Terminate a Transcode Session](https://www.plexopedia.com/plex-media-server/api/server/session-transcode-terminate/) [Get Session History](https://www.plexopedia.com/plex-media-server/api/server/session-history/)
### Library
[Get Libraries](https://www.plexopedia.com/plex-media-server/api/server/libraries/) [Get Library Details](https://www.plexopedia.com/plex-media-server/api/library/details/) [Add a Library](https://www.plexopedia.com/plex-media-server/api/library/add/) [Delete a Library](https://www.plexopedia.com/plex-media-server/api/server/library-delete/) [Scan All Libraries](https://www.plexopedia.com/plex-media-server/api/library/scan/) [Scan a Single Library](https://www.plexopedia.com/plex-media-server/api/library/scan-single/) [Scan a Partial Library](https://www.plexopedia.com/plex-media-server/api/library/scan-partial/) [Refresh Metadata for a Library](https://www.plexopedia.com/plex-media-server/api/library/refresh-metadata/)
### Media
[Get Recently Added Media](https://www.plexopedia.com/plex-media-server/api/library/recently-added/) [Mark Item as Watched](https://www.plexopedia.com/plex-media-server/api/library/media-mark-watched/) [Mark Item as Unwatched](https://www.plexopedia.com/plex-media-server/api/library/media-mark-unwatched/) [Search for Match](https://www.plexopedia.com/plex-media-server/api/library/search-match/) [Download Media File](https://www.plexopedia.com/plex-media-server/api/library/download-media-file/) [Update Play Progress](https://www.plexopedia.com/plex-media-server/api/server/update-media-progress/)
### Movies
[Get All Movies](https://www.plexopedia.com/plex-media-server/api/library/movies/) [Get a Movie](https://www.plexopedia.com/plex-media-server/api/library/movie/) [Update a Movie](https://www.plexopedia.com/plex-media-server/api/library/movie-update/) [Update a Movie Using Match](https://www.plexopedia.com/plex-media-server/api/library/movie-update-match/) [Delete a Movie](https://www.plexopedia.com/plex-media-server/api/library/movie-delete/) [Get Newest Movies](https://www.plexopedia.com/plex-media-server/api/library/movies-newest/) [Get Recently Added Movies](https://www.plexopedia.com/plex-media-server/api/library/movies-recently-added/) [Get Recently Viewed Movies](https://www.plexopedia.com/plex-media-server/api/library/movies-recently-viewed/) [Get On Deck Movies](https://www.plexopedia.com/plex-media-server/api/library/movies-on-deck/) [Get All Movies for a Resolution](https://www.plexopedia.com/plex-media-server/api/library/movies-resolution/) [Get All Movies for a Decade](https://www.plexopedia.com/plex-media-server/api/library/movies-decade/) [Get All Unwatched Movies for a User](https://www.plexopedia.com/plex-media-server/api/library/movies-unwatched/) [Get a Movie's Poster](https://www.plexopedia.com/plex-media-server/api/library/movie-poster/) [Get a Movie's Background](https://www.plexopedia.com/plex-media-server/api/library/movie-background/)
### TV Shows
[Get All TV Shows](https://www.plexopedia.com/plex-media-server/api/library/tvshows/) [Get All TV Show Seasons](https://www.plexopedia.com/plex-media-server/api/library/tvshows-seasons/) [Update a TV Show Series Using Match](https://www.plexopedia.com/plex-media-server/api/library/tvshow-update-match/) [Get All TV Show Episodes](https://www.plexopedia.com/plex-media-server/api/library/tvshows-episodes/) Get Recently Added TV Shows
### Music
[Get All Music Artists](https://www.plexopedia.com/plex-media-server/api/library/music/) [Get All Music Albums for an Artist](https://www.plexopedia.com/plex-media-server/api/library/music-albums-artist/) [Get All Tracks for a Music Album](https://www.plexopedia.com/plex-media-server/api/library/music-albums-tracks/) [Update Music Artist Details Using Match](https://www.plexopedia.com/plex-media-server/api/library/music-artist-update-match/) [Update Music Album Details Using Match](https://www.plexopedia.com/plex-media-server/api/library/music-album-update-match/)
### Photos
[Get All Photos](https://www.plexopedia.com/plex-media-server/api/library/photos/) [Add a Photo to Favorites](https://www.plexopedia.com/plex-media-server/api/library/photo-favorites-add/)
### Other Videos
[Get All Videos](https://www.plexopedia.com/plex-media-server/api/library/videos/)
### Playlists
[Get All Playlists](https://www.plexopedia.com/plex-media-server/api/playlists/view/) [Get a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/view-single/) [Create a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/create/) [Update a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/update/) [Delete a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/delete/) [Get Items in a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/view-items/) [Add an Item to a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/add-item/) [Delete an Item from a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/delete-item/) [Delete All Items from a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/delete-items/)
### Maintenance
[Empty Trash](https://www.plexopedia.com/plex-media-server/api/library/empty-trash/) [Clean Bundles](https://www.plexopedia.com/plex-media-server/api/library/clean-bundles/) [Optimize Database](https://www.plexopedia.com/plex-media-server/api/library/optimize-database/)
### Scheduled Tasks
[Get All Scheduled Tasks](https://www.plexopedia.com/plex-media-server/api/server/scheduled-tasks/) [Run All Scheduled Tasks](https://www.plexopedia.com/plex-media-server/api/server/task-run-all/) [Stop All Scheduled Tasks](https://www.plexopedia.com/plex-media-server/api/server/task-stop-all/) [Run Backup Database Task](https://www.plexopedia.com/plex-media-server/api/server/task-backup-database/) [Stop Backup Database Task](https://www.plexopedia.com/plex-media-server/api/server/task-backup-database-stop/) [Run Optimize Database Task](https://www.plexopedia.com/plex-media-server/api/server/task-optimize-database/) [Stop Optimize Database Task](https://www.plexopedia.com/plex-media-server/api/server/task-optimize-database-stop/) [Run Clean Old Bundles Task](https://www.plexopedia.com/plex-media-server/api/server/task-clean-old-bundles/) [Stop Clean Old Bundles Task](https://www.plexopedia.com/plex-media-server/api/server/task-clean-old-bundles-stop/) [Run Clean Old Cache Files Task](https://www.plexopedia.com/plex-media-server/api/server/task-clean-old-cache-files/) [Stop Clean Old Cache Files Task](https://www.plexopedia.com/plex-media-server/api/server/task-clean-old-cache-files-stop/) [Run Refresh Local Metadata Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-local-metadata/) [Stop Refresh Local Metadata Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-local-metadata-stop/) [Run Refresh Libraries Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-libraries/) [Stop Refresh Libraries Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-libraries-stop/) [Run Extensive Media Analysis Task](https://www.plexopedia.com/plex-media-server/api/server/task-extensive-media-analysis/) [Stop Extensive Media Analysis Task](https://www.plexopedia.com/plex-media-server/api/server/task-extensive-media-analysis-stop/) [Run Refresh Metadata Periodically Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-metadata-periodically/) [Stop Refresh Metadata Periodically Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-metadata-periodically-stop/) [Run Upgrade Media Analysis Task](https://www.plexopedia.com/plex-media-server/api/server/task-upgrade-media-analysis/) [Stop Upgrade Media Analysis Task](https://www.plexopedia.com/plex-media-server/api/server/task-upgrade-media-analysis-stop/)
### Troubleshooting
[Log a Single Message](https://www.plexopedia.com/plex-media-server/api/server/log-single/) [Log Multiple Messages](https://www.plexopedia.com/plex-media-server/api/server/log-multiple/) [Download Databases](https://www.plexopedia.com/plex-media-server/api/server/download-databases/) [Download Logs](https://www.plexopedia.com/plex-media-server/api/server/download-logs/)
### Reference
[Arrays](https://www.plexopedia.com/plex-media-server/api/arrays/) [Filtering](https://www.plexopedia.com/plex-media-server/api/filter/)
[&uarr;](#top-of-page)