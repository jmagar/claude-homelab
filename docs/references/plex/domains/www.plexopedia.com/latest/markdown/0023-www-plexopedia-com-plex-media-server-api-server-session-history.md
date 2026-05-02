Plex API: Get Session History - Plexopedia
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
Plex stores information about the media play sessions for both videos and music tracks. This API command will return the information about each of those play sessions.
## URL
```
GET http://{ip\_address}:32400/status/sessions/history/all?X-Plex-Token={plex\_token}&{filter}
```
### Parameters
|Name|Description|
|ip\_address|The IP address of the Plex Media server.|
|plex\_token|The [Plex token](https://www.plexopedia.com/plex-media-server/general/plex-token/).|
|filter|(Optional) The [filter](/plex-media-server/api/filter/) to apply to the response. See the [Filtering](#filter) section below for parameters that can be used to filter the response.|
## Return Status
|HTTP Code|Description|
|200|Success - The request was successful.|
|401|Unauthorized - The Plex token provided was not valid.|
## Response
XML string value that lists all media being played from the Plex server. An example of the XML returned from the request is shown below for a video being transcoded:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="3693"\>
\<Video historyKey="/status/sessions/history/1" key="/library/metadata/218860" ratingKey="218860" librarySectionID="2" title="Captain America: The Winter Soldier" type="movie" thumb="/library/metadata/218860/thumb/-1" viewedAt="1419652344" accountID="1" /\>
\<Video historyKey="/status/sessions/history/2" key="/library/metadata/917" ratingKey="917" librarySectionID="4" parentKey="/library/metadata/916" grandparentKey="/library/metadata/871" title="At the Garbage Dump" grandparentTitle="Mighty Machines" type="episode" thumb="/library/metadata/917/thumb/-1" parentThumb="/library/metadata/916/thumb/1659190874" grandparentThumb="/library/metadata/871/thumb/1668149194" grandparentArt="/library/metadata/871/art/1668149194" index="7" parentIndex="1" originallyAvailableAt="1998-01-25" viewedAt="1419652401" accountID="1" /\>
\<Video historyKey="/status/sessions/history/3" librarySectionID="2" title="Pixar Short Films Collection 1" type="movie" viewedAt="1419653678" accountID="1" /\>
\<Video historyKey="/status/sessions/history/4" librarySectionID="2" title="Thomas and Friends Best of Percy" type="movie" viewedAt="1419653704" accountID="1" /\>
\<Video historyKey="/status/sessions/history/5" librarySectionID="2" title="Thomas and Friends Best of Percy" type="movie" viewedAt="1419653743" accountID="1" /\>
\<Video historyKey="/status/sessions/history/6" librarySectionID="2" title="Thomas and Friends Best of Percy" type="movie" viewedAt="1419653743" accountID="1" /\>
\<Video historyKey="/status/sessions/history/7" librarySectionID="2" title="Thomas and Friends Best of Percy" type="movie" viewedAt="1419653744" accountID="1" /\>
\<Video historyKey="/status/sessions/history/8" librarySectionID="2" title="Thomas and Friends Best of Percy" type="movie" viewedAt="1419653744" accountID="1" /\>
...
\</MediaContainer\>
```
The XML returned provides a list of all the play session history on the Plex server. The root is the `MediaContainer` element. This element contains one attribute that provides a count of the number of items in the session history.
MediaContainer Attributes|Attribute|Description|
|size|The number of sessions history.|
Within the `MediaContainer` element are one or more `Video` elements. Each `Video` element represent the playing of one video at a point in time.
The attributes within a `Video` element is dependent on the type of video that was played.
Video Attributes|Attribute|Description|
|historyKey|The unique identifier the history record.|
|key|The relative URL of the video information.|
|ratingKey|A key associated with the video.|
|librarySectionID|The ID of the library section.|
|parentKey|The unique identifier for the season.|
|grandparentKey|The unique identifier for the TV show.|
|title|The title of the video.|
|grandparentTitle|The title of the TV show.|
|type|The type of media.|
|thumb|The thumbnail for the video.|
|parentThumb|The thumbnail for the season.|
|grandparentThumb|The thumbnail for the TV show.|
|grandparentArt|The background artwork used to represent the TV show.|
|index|The index of the video.|
|parentIndex|The index of the season.|
|originallyAvailableAt|The original release date of the video.|
|viewedAt|The date and time in [epoch time](https://en.wikipedia.org/wiki/Unix_time), the video was played.|
|accountID|The unique ID associated with the account.|
A `Track` element can also be found within the `MediaContainer` element. Each `Track` element represents on music track that was played from the Plex server.
Track Attributes|Attribute|Description|
|historyKey|The unique identifier the history record.|
|key|The relative URL of the music track information.|
|ratingKey|A key associated with the music track.|
|librarySectionID|The ID of the library section.|
|parentKey|The unique identifier for the artist.|
|grandparentKey|The unique identifier for the album.|
|title|The title of the music track.|
|parentTitle|The title of the artist.|
|grandparentTitle|The title of the album.|
|type|The type of media.|
|thumb|The thumbnail for the music track.|
|parentThumb|The thumbnail for the artist.|
|grandparentThumb|The thumbnail for the album.|
|grandparentArt|The background artwork used to represent the album.|
|index|The index of the music track.|
|parentIndex|The index of the artist.|
|viewedAt|The date and time in [epoch time](https://en.wikipedia.org/wiki/Unix_time), the music track was played.|
|accountID|The unique ID associated with the account.|
|deviceID|The unique ID associated with the device.|
## Filtering
To reduce the number of items returned, you can filter the API response to only return items that meet a specific criteria.
For more information, check out the [Filter](/plex-media-server/api/filter/) page.
The results from this endpoint can be filtered by adding the following optional parameters to the request:
Filter Parameters|Parameter|Description|
## Examples
curl Python Powershell
```
curl -X GET http://{ip\_address}:32400/status/sessions/history/all?X-Plex-Token={plex\_token}
```
```
import requests
plex\_url = http://{ip\_address}:32400/status/sessions/history/all?X-Plex-Token={plex\_token}
response = requests.get(plex\_url)
print(response.text)
```
```
$response = Invoke-RestMethod 'http://{ip\_address}:32400/status/sessions/history/all?X-Plex-Token={plex\_token}' -Method GET
Write-Output $response
```
## Script examples
Below are a list of post and articles that provide an example that use this API endpoint:
* [How to Get a Plex Server's Session History](https://www.plexopedia.com/blog/get-session-history/)
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
[Get Active Sessions](https://www.plexopedia.com/plex-media-server/api/server/sessions/) [Get Transcode Sessions](https://www.plexopedia.com/plex-media-server/api/server/transcode-sessions/) [Terminate a Session](https://www.plexopedia.com/plex-media-server/api/server/session-terminate/) [Terminate a Transcode Session](https://www.plexopedia.com/plex-media-server/api/server/session-transcode-terminate/) Get Session History
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