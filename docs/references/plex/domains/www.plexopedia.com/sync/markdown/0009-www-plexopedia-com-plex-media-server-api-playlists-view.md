Plex API: Get All Playlists - Plexopedia
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
A user on the Plex server can create multiple playlists for each type of media. This API will return all the playlists that are associated with the user. This command won't get all playlists available on the Plex server for all users. To do so, you would need to run this command once for each user on the Plex server using their Plex token.
## URL
```
GET http://{ip\_address}:32400/playlists?X-Plex-Token={plex\_token}
```
### Parameters
|Name|Description|
|ip\_address|The IP address of the Plex Media server.|
|plex\_token|The [Plex user token](https://www.plexopedia.com/plex-media-server/general/plex-token/#getcurrentusertoken).|
## Return Status
|HTTP Code|Description|
|200|Success - The request was successful.|
|401|Unauthorized - The Plex token provided was not valid.|
## Response
XML string value that lists the all the playlists associated with the user. An example of the XML returned from the request is shown below:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="8"\>
\<Playlist ratingKey="279065" key="/playlists/279065/items" guid="com.plexapp.agents.none://4aeb2048-d28c-4f72-9bd9-ec8ed697dde0" type="playlist" title="1980's Movies" summary="" smart="1" playlistType="video" composite="/playlists/279065/composite/1649880207" icon="playlist://image.smart" viewCount="1" lastViewedAt="1649464327" duration="150764000" leafCount="22" addedAt="1649464327" updatedAt="1649880207"\>\</Playlist\>
\<Playlist ratingKey="279055" key="/playlists/279055/items" guid="com.plexapp.agents.none://63c6563b-9a8c-4a77-8a03-eef1a91662b7" type="playlist" title="1990's Movies" summary="" smart="1" playlistType="video" composite="/playlists/279055/composite/1649449919" icon="playlist://image.smart" viewCount="1" lastViewedAt="1649449844" duration="300463000" leafCount="38" addedAt="1649449844" updatedAt="1649449919"\>\</Playlist\>
\<Playlist ratingKey="279056" key="/playlists/279056/items" guid="com.plexapp.agents.none://6a57094c-855e-4eb5-8ba6-46209cd939f8" type="playlist" title="2000's Movies" summary="" smart="1" playlistType="video" composite="/playlists/279056/composite/1649449929" icon="playlist://image.smart" viewCount="1" lastViewedAt="1649449883" duration="466917000" leafCount="61" addedAt="1649449883" updatedAt="1649449929"\>\</Playlist\>
\<Playlist ratingKey="279057" key="/playlists/279057/items" guid="com.plexapp.agents.none://cdad72bd-8d05-4436-9d92-72f74f844671" type="playlist" title="2010's Movies" summary="" smart="1" playlistType="video" composite="/playlists/279057/composite/1649449944" icon="playlist://image.smart" viewCount="1" lastViewedAt="1649449912" duration="459953000" leafCount="62" addedAt="1649449912" updatedAt="1649449944"\>\</Playlist\>
\<Playlist ratingKey="275025" key="/playlists/275025/items" guid="com.plexapp.agents.none://1fb7c34f-dd93-42cb-9073-f24433cf6baa" type="playlist" title="All Music" summary="The easiest way to play or shuffle your entire collection." smart="1" playlistType="audio" composite="/playlists/275025/composite/1647266136" icon="playlist://image.smart" viewCount="4" lastViewedAt="1649641458" duration="268843000" leafCount="1096" addedAt="1614960582" updatedAt="1647266136"\>\</Playlist\>
\<Playlist ratingKey="275028" key="/playlists/275028/items" guid="com.plexapp.agents.none://a93ad046-919e-4e28-a55c-5b0b43865857" type="playlist" title="Recently Added" summary="Music added to your library recently." smart="1" playlistType="audio" icon="playlist://image.smart" viewCount="1" lastViewedAt="1614960582" leafCount="0" addedAt="1614960582" updatedAt="1614960582"\>\</Playlist\>
\<Playlist ratingKey="275027" key="/playlists/275027/items" guid="com.plexapp.agents.none://1ee47b0f-2814-4546-89d6-b933e2743494" type="playlist" title="Recently Played" summary="Tracks you've listened to lately." smart="1" playlistType="audio" icon="playlist://image.smart" viewCount="2" lastViewedAt="1620000297" leafCount="0" addedAt="1614960582" updatedAt="1638416576"\>\</Playlist\>
\<Playlist ratingKey="134729" key="/playlists/134729/items" guid="com.plexapp.agents.none://b2ae33af-8bfd-42ef-b504-513f52f4da99" type="playlist" title="Christmas" summary="" smart="0" playlistType="audio" composite="/playlists/134729/composite/1634676389" viewCount="3" lastViewedAt="1478569654" duration="11294000" leafCount="68" addedAt="1477075480" updatedAt="1634676389"\>\</Playlist\>
\</MediaContainer\>
```
The XML returned provides a list of the playlists that are available on the Plex server for a user. The root is the `MediaContainer` element. This element contains a few attributes that provide overall information about the playlists for the user on the server.
MediaContainer Attributes|Attribute|Description|
|size|The number of playlists available on the Plex server for the user.|
Within the `MediaContainer` there are one or more `Playlist` child elements. Each `Playlist` element represents one playlist on the Plex server.
Playlist Attributes|Attribute|Description|
|ratingKey|A key associated with the playlist.|
|key|The relative URL of the items in the playlist. This URL returns information about the [items in the playlist](/plex-media-server/api/playlists/view-items/).|
|guid|The unique identifier comprised of the Plex agent and playlist identifier for the agent.|
|type|The type of media.|
|title|The title of the playlist.|
|summary|A description of the playlist. This can be changed by editing the playlist from within Plex after it has been created.|
|smart|1 - playlist is a smart playlist.
0 - playlist is not a smart playlist.|
|playlistType|video - playlist contains videos/movies.
audio - playlist contains audio/music.
photo - playlist contains photos.|
|composite|The URL of the image used to represent the playlist.|
|icon|Icon used for smart playlists. Not used for non-smart playlists.|
|viewCount|The number of times the playlist has been viewed.|
|lastViewedAt|The date and time for the last time the playlist was viewed.|
|duration|The total duration, in milliseconds, of the number of items in the playlist. This value doesn't exist for photo playlists.|
|leafCount|Number of items in the playlist.|
|addedAt|The date and time, in [Unix time](https://en.wikipedia.org/wiki/Unix_time), the playlist was added to the library.|
|updatedAt|The date and time in [epoch time](https://en.wikipedia.org/wiki/Unix_time), the playlist was updated in the library.|
## Remarks
A playlist is specific to a user on the Plex server. Only that user can request information about the playlists.
When using a device Plex authentication token, the administrative user playlists will be returned by the Plex server. This means that the administrator's Plex token and any device token will return the same XML response.
## Examples
curl Python Powershell
```
curl -X GET http://{ip\_address}:32400/playlists?X-Plex-Token={plex\_token}
```
```
import requests
plex\_url = http://{ip\_address}:32400/playlists?X-Plex-Token={plex\_token}
response = requests.get(plex\_url)
print(response.text)
```
```
$response = Invoke-RestMethod 'http://{ip\_address}:32400/playlists?X-Plex-Token={plex\_token}' -Method GET
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
[Get All Videos](https://www.plexopedia.com/plex-media-server/api/library/videos/)
### Playlists
Get All Playlists [Get a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/view-single/) [Create a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/create/) [Update a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/update/) [Delete a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/delete/) [Get Items in a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/view-items/) [Add an Item to a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/add-item/) [Delete an Item from a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/delete-item/) [Delete All Items from a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/delete-items/)
### Maintenance
[Empty Trash](https://www.plexopedia.com/plex-media-server/api/library/empty-trash/) [Clean Bundles](https://www.plexopedia.com/plex-media-server/api/library/clean-bundles/) [Optimize Database](https://www.plexopedia.com/plex-media-server/api/library/optimize-database/)
### Scheduled Tasks
[Get All Scheduled Tasks](https://www.plexopedia.com/plex-media-server/api/server/scheduled-tasks/) [Run All Scheduled Tasks](https://www.plexopedia.com/plex-media-server/api/server/task-run-all/) [Stop All Scheduled Tasks](https://www.plexopedia.com/plex-media-server/api/server/task-stop-all/) [Run Backup Database Task](https://www.plexopedia.com/plex-media-server/api/server/task-backup-database/) [Stop Backup Database Task](https://www.plexopedia.com/plex-media-server/api/server/task-backup-database-stop/) [Run Optimize Database Task](https://www.plexopedia.com/plex-media-server/api/server/task-optimize-database/) [Stop Optimize Database Task](https://www.plexopedia.com/plex-media-server/api/server/task-optimize-database-stop/) [Run Clean Old Bundles Task](https://www.plexopedia.com/plex-media-server/api/server/task-clean-old-bundles/) [Stop Clean Old Bundles Task](https://www.plexopedia.com/plex-media-server/api/server/task-clean-old-bundles-stop/) [Run Clean Old Cache Files Task](https://www.plexopedia.com/plex-media-server/api/server/task-clean-old-cache-files/) [Stop Clean Old Cache Files Task](https://www.plexopedia.com/plex-media-server/api/server/task-clean-old-cache-files-stop/) [Run Refresh Local Metadata Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-local-metadata/) [Stop Refresh Local Metadata Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-local-metadata-stop/) [Run Refresh Libraries Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-libraries/) [Stop Refresh Libraries Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-libraries-stop/) [Run Extensive Media Analysis Task](https://www.plexopedia.com/plex-media-server/api/server/task-extensive-media-analysis/) [Stop Extensive Media Analysis Task](https://www.plexopedia.com/plex-media-server/api/server/task-extensive-media-analysis-stop/) [Run Refresh Metadata Periodically Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-metadata-periodically/) [Stop Refresh Metadata Periodically Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-metadata-periodically-stop/) [Run Upgrade Media Analysis Task](https://www.plexopedia.com/plex-media-server/api/server/task-upgrade-media-analysis/) [Stop Upgrade Media Analysis Task](https://www.plexopedia.com/plex-media-server/api/server/task-upgrade-media-analysis-stop/)
### Troubleshooting
[Log a Single Message](https://www.plexopedia.com/plex-media-server/api/server/log-single/) [Log Multiple Messages](https://www.plexopedia.com/plex-media-server/api/server/log-multiple/) [Download Databases](https://www.plexopedia.com/plex-media-server/api/server/download-databases/) [Download Logs](https://www.plexopedia.com/plex-media-server/api/server/download-logs/)
### Reference
[Arrays](https://www.plexopedia.com/plex-media-server/api/arrays/) [Filtering](https://www.plexopedia.com/plex-media-server/api/filter/)
[&uarr;](#top-of-page)