Plex API: Get All Videos - Plexopedia
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
A library, such as movies or TV shows, can contain many items. This API command will return all other videos for a specific library that is available on the Plex server. These videos can be media files that aren't standard movies, such as home videos.
## URL
```
GET http://{ip\_address}:32400/library/sections/{id}/all?X-Plex-Token={plex\_token}&{filter}
```
### Parameters
|Name|Description|
|ip\_address|The IP address of the Plex Media server.|
|plex\_token|The [Plex token](https://www.plexopedia.com/plex-media-server/general/plex-token/).|
|id|The key associated with a videos library. This key can be found by calling the [Libraries API command](/plex-media-server/api/server/libraries/) and looking for a videos library.|
|filter|(Optional) The [filter](/plex-media-server/api/filter/) to apply to the response. See the [Filtering](#filter) section below for parameters that can be used to filter the response.|
## Return Status
|HTTP Code|Description|
|200|Success - The request was successful.|
|401|Unauthorized - The Plex token provided was not valid.|
## Response
XML string value that lists the all the videos in the library. An example of the XML returned from the request is shown below:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="443" allowSync="1" art="/:/resources/movie-fanart.jpg" identifier="com.plexapp.plugins.library" librarySectionID="7" librarySectionTitle="Home Videos" librarySectionUUID="1704f844-5d35-474d-84d2-3f398c4a1684" mediaTagPrefix="/system/bundle/media/flags/" mediaTagVersion="1641342384" sortAsc="1" thumb="/:/resources/video.png" title1="Home Videos" title2="All Home Videos" viewGroup="movie" viewMode="131624"\>
\<Video ratingKey="77963" key="/library/metadata/77963" guid="com.plexapp.agents.none://a186aa7249d7043eeb16e5b45ffbf2601d0590c0?lang=xn" type="movie" title="00000" contentRating="G" subtype="clip" summary="" viewCount="1" lastViewedAt="1640720544" year="2010" thumb="/library/metadata/77963/thumb/1597469053" art="/library/metadata/77963/art/1597469053" duration="32032" originallyAvailableAt="2010-12-12" addedAt="1450725246" updatedAt="1597469053" createdAtAccuracy="epoch" createdAtTZOffset="-14400"\>
\<Media id="86785" duration="32032" bitrate="23866" width="1920" height="1080" aspectRatio="1.78" audioChannels="2" audioCodec="ac3" videoCodec="h264" videoResolution="1080" container="mpegts" videoFrameRate="NTSC" videoProfile="high" title="Original"\>
\<Part id="86918" key="/library/parts/86918/1292187170/file.MTS" duration="32032" file="I:\\Videos\\2010\\Christmas Tree\\00000.MTS" size="95557632" container="mpegts" packetLength="192" timeStamp="1" videoProfile="high" /\>
\</Media\>
\<Media id="277883" duration="32032" bitrate="3543" width="1280" height="720" aspectRatio="1.78" audioChannels="2" audioCodec="aac" videoCodec="h264" videoResolution="720" container="mp4" videoFrameRate="NTSC" optimizedForStreaming="1" proxyType="42" audioProfile="lc" has64bitOffsets="0" target="Optimized for Mobile" targetTagID="6207" videoProfile="high" title="Optimized for Mobile"\>
\<Part id="278213" key="/library/parts/278213/1597255970/file.mp4" duration="32032" file="I:\\Videos\\2010\\Christmas Tree\\Plex Versions\\Optimized for Mobile\\00000 (2010).mp4" size="14223890" audioProfile="lc" container="mp4" has64bitOffsets="0" optimizedForStreaming="1" videoProfile="high" /\>
\</Media\>
\</Video\>
...
\</MediaContainer\>
```
The XML returned provides a list of the all videos in a library that are available on the Plex server. The root is the `MediaContainer` element. This element contains a few attributes that provide overall information about the videos on the server.
MediaContainer Attributes|Attribute|Description|
|size|The number of videos.|
|allowSync|1 - allow syncing content.
0 - don't allow syncing content.|
|art|Background artwork used to represent the video.|
|identifier|The type of item.|
|librarySectionID|The unique key associated with the library.|
|librarySectionTitle|The title of the library.|
|librarySectionUUID|Unique GUID identifier for the library.|
|mediaTagPrefix|Prefix for the media tag.|
|mediaTagVersion|Media tag version.
**Note:** This could be a date and time value.|
|sortAsc|1 - the library is sorted in ascending order.
0 - the library is sorted in descending order.|
|thumb|The thumbnail for the video.|
|title1|The title of the video.
**Note:** This appears to be internally created, and can't be changed by the server owner.|
|title2|A descriptive title for the video.|
|viewGroup|The group type used to view the video.|
|viewMode|Unknown integer value.|
Within the `MediaContainer` there are one or more `Video` child elements. Each `Video` element represents one video available on the Plex server.
Video Attributes|Attribute|Description|
|ratingKey|A key associated with the video.|
|key|The relative URL of the video information.|
|guid|The unique identifier comprised of the Plex agent and video identifier for the agent.|
|type|The type of media.|
|title|The title of the video.|
|contentRating|The content rating associated with the video.|
|subtype|The subtype of the video.|
|summary|A summary of the video.|
|viewCount|The number of times the video has been viewed.|
|lastViewedAt|The date and time for the last time the video was viewed.|
|year|The year the video was released.|
|thumb|The thumbnail for the video.|
|art|The background artwork used to represent the video.|
|duration|The length of the video in milliseconds.|
|originallyAvailableAt|The original release date of the video.|
|addedAt|The date and time, in [Unix time](https://en.wikipedia.org/wiki/Unix_time), the video was added to the library.|
|updatedAt|The date and time in [epoch time](https://en.wikipedia.org/wiki/Unix_time), the video was updated in the library.|
|createdAtAccuracy|The accuracy of the created date.|
|createdAtTZOffset|The time zone offset to GMT in seconds.|
Within the `Video` there are one or more `Media` child elements. Each `Media` element represents one media file of the video available on the Plex server.
If there are two video files associated with the video, such as a 1080p and 480p version, then there would be two `Media` child elements in the `Video` element.
Media Attributes|Attribute|Description|
|id|Unique ID associated with the video.|
|duration|The length of the video in milliseconds.|
|bitrate|The bitrate of the video.|
|width|The width of the video.|
|height|The height of the video.|
|aspectRatio|The aspect ratio of the video.|
|audioChannels|The number of audio channels.|
|audioCodec|The audio codec used to encode the audio.|
|videoCodec|The video codec used to encode the video.|
|videoResolution|The video resolution.|
|container|The video container.|
|videoFrameRate|The framerate standard used for the video.|
|videoProfile|The video profile of the media.|
|title|The title of the video.|
Within the `Media` there are one or more `Part` child elements. Each `Part` element represents one part of the video. If the video has been added to the Plex server as a multi-part video, then each of those parts will be represented by one `Part` child element.
Part Attributes|Attribute|Description|
|key|The unique relative path for the part that is used at its key.|
|duration|The length of the part in milliseconds.|
|file|The file associated with the part.|
|size|The file size of the part.|
|container|The type of media container.|
|packetLength|The packet length.|
|timeStamp|1 - the video contains a timestamp.
0 - the video doesn't contain a timestamp.|
|videoProfile|The video profile associated with the video part.|
## Filtering
To reduce the number of items returned, you can filter the API response to only return items that meet a specific criteria.
For more information, check out the [Filter](/plex-media-server/api/filter/) page.
The results from this endpoint can be filtered by adding the following optional parameters to the request:
Filter Parameters|Parameter|Description|
|addedAt|Gets all the videos that were added based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. The value is in [epoch time](https://en.wikipedia.org/wiki/Unix_time).|
|contentRating|Gets all videos that match the content rating. This value is case-sensitive.|
|duration|Gets all the videos that match the condition on the movie duration. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. This value is is milliseconds.|
|file|Will match any part of the file name for the video. The value provide is not case-sensitive.|
|lastViewedAt|Gets all the videos that were last viewed based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. The value is in [epoch time](https://en.wikipedia.org/wiki/Unix_time).|
|originallyAvailableAt|Gets all the videos that match were originally available time based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. Must be in the format YYYY or YYY-MM-DD.|
|title|Will match any part of the video title. The value provide is not case-sensitive.|
|updatedAt|Gets all the videos that were updated based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. The value is in [epoch time](https://en.wikipedia.org/wiki/Unix_time).|
|viewCount|Gets all the videos that were viewed a specified number of times. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error.|
|year|Gets all the videos that were released in a specific year(s) based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error.|
## Examples
curl Python Powershell
```
curl -X GET http://{ip\_address}:32400/library/sections/{id}/all?X-Plex-Token={plex\_token}
```
```
import requests
plex\_url = http://{ip\_address}:32400/library/sections/{id}/all?X-Plex-Token={plex\_token}
response = requests.get(plex\_url)
print(response.text)
```
```
$response = Invoke-RestMethod 'http://{ip\_address}:32400/library/sections/{id}/all?X-Plex-Token={plex\_token}' -Method GET
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
[Get All TV Shows](https://www.plexopedia.com/plex-media-server/api/library/tvshows/) [Get All TV Show Seasons](https://www.plexopedia.com/plex-media-server/api/library/tvshows-seasons/) [Update a TV Show Series Using Match](https://www.plexopedia.com/plex-media-server/api/library/tvshow-update-match/) [Get All TV Show Episodes](https://www.plexopedia.com/plex-media-server/api/library/tvshows-episodes/) [Get Recently Added TV Shows](https://www.plexopedia.com/plex-media-server/api/library/tvshows-recently-added/)
### Music
[Get All Music Artists](https://www.plexopedia.com/plex-media-server/api/library/music/) [Get All Music Albums for an Artist](https://www.plexopedia.com/plex-media-server/api/library/music-albums-artist/) [Get All Tracks for a Music Album](https://www.plexopedia.com/plex-media-server/api/library/music-albums-tracks/) [Update Music Artist Details Using Match](https://www.plexopedia.com/plex-media-server/api/library/music-artist-update-match/) [Update Music Album Details Using Match](https://www.plexopedia.com/plex-media-server/api/library/music-album-update-match/)
### Photos
[Get All Photos](https://www.plexopedia.com/plex-media-server/api/library/photos/) [Add a Photo to Favorites](https://www.plexopedia.com/plex-media-server/api/library/photo-favorites-add/)
### Other Videos
Get All Videos
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