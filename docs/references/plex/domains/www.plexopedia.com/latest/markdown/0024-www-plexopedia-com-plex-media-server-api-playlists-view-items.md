Plex API: Get Items in a Playlist - Plexopedia
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
Each playlist that is created on a Plex server contains different media files. Each playlist can contain only one type of file, but can contain hundreds of the same media type.
This API command will return the details of all items that are associated with a specific playlist.
## URL
```
GET http://{ip\_address}:32400/playlists/{id}/items?X-Plex-Token={plex\_token}
```
### Parameters
|Name|Description|
|ip\_address|The IP address of the Plex Media server.|
|plex\_token|The [Plex user token](https://www.plexopedia.com/plex-media-server/general/plex-token/#getcurrentusertoken).|
|id|The key associated with a playlist. This key can be found by calling the [view playlists for a user API command](/plex-media-server/api/playlists/view/) and getting the value in the `ratingsKey` attribute.|
## Return Status
|HTTP Code|Description|
|200|Success - The request was successful.|
|401|Unauthorized - The Plex token provided was not valid.|
|404|Not Found - The playlist associated with the ID was not found.|
## Response
XML string value that lists the all the items in a playlist. The XML return is dependent on the type of media that is contained in the playlist.
For movie playlists, an example XML returned is:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="22" composite="/playlists/279065/composite/1649882407" duration="150764" leafCount="22" playlistType="video" ratingKey="279065" smart="1" title="1980's Movies"\>
\<Video ratingKey="279061" key="/library/metadata/279061" guid="com.plexapp.agents.imdb://tt0088763?lang=en" studio="Universal Pictures" type="movie" title="Back to the Future" titleSort="Back to the Future 1" librarySectionTitle="Movies" librarySectionID="2" librarySectionKey="/library/sections/2" contentRating="PG" summary="Marty McFly, a typical American teenager of the Eighties, is accidentally sent back to 1955 in a plutonium-powered DeLorean "time machine" invented by a slightly mad scientist. During his often hysterical, always amazing trip back in time, Marty must make certain his teenage parents-to-be meet and fall in love - so he can get back to the future." rating="8.5" viewCount="1" lastViewedAt="1533441384" year="1985" tagline="He's the only kid ever to get into trouble before he was born." thumb="/library/metadata/279061/thumb/1649456734" art="/library/metadata/279061/art/1649456734" duration="6964469" originallyAvailableAt="1985-07-02" addedAt="1649456672" updatedAt="1649456734" chapterSource="media"\>
\<Media id="338432" duration="6964469" bitrate="3285" width="720" height="460" aspectRatio="1.85" audioChannels="6" audioCodec="ac3" videoCodec="h264" videoResolution="sd" container="mkv" videoFrameRate="NTSC" videoProfile="high"\>
\<Part id="338785" key="/library/parts/338785/1464487773/file.mkv" duration="6964469" file="M:\\Media\\Movies\\Back to the Future (1985)\\Back to the Future (1985) [480p h.264][AAC AC3].mkv" size="2865442785" container="mkv" videoProfile="high" /\>
\</Media\>
\<Genre tag="Adventure" /\>
\<Genre tag="Comedy" /\>
\<Country tag="USA" /\>
\<Collection tag="Back to the Future" /\>
\</Video\>
...
\</MediaContainer\>
```
For music playlists, an example XML returned is:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="1096" composite="/playlists/275025/composite/1647266136" duration="268843" leafCount="1096" playlistType="audio" ratingKey="275025" smart="1" title="All Music"\>
\<Track ratingKey="218550" key="/library/metadata/218550" parentRatingKey="218549" grandparentRatingKey="218548" guid="plex://track/5d07cdc7403c640290f6a452" parentGuid="plex://album/5d07c182403c64029084e584" grandparentGuid="plex://artist/5d07bbfd403c6402904a6593" parentStudio="Polydor" type="track" title="Dancing Queen" grandparentKey="/library/metadata/218548" parentKey="/library/metadata/218549" librarySectionTitle="Music" librarySectionID="8" librarySectionKey="/library/sections/8" grandparentTitle="ABBA" parentTitle="Gold: Greatest Hits" summary="" index="1" parentIndex="1" ratingCount="1134970" parentYear="1992" thumb="/library/metadata/218549/thumb/1648794696" art="/library/metadata/218548/art/1649916521" parentThumb="/library/metadata/218549/thumb/1648794696" grandparentThumb="/library/metadata/218548/thumb/1649916521" grandparentArt="/library/metadata/218548/art/1649916521" duration="231400" addedAt="1598373482" updatedAt="1648794696"\>
\<Media id="278042" duration="231400" bitrate="978" audioChannels="2" audioCodec="flac" container="flac"\>
\<Part id="278372" key="/library/parts/278372/1598369723/file.flac" duration="231400" file="I:\\Music\\ABBA\\Gold- Greatest Hits\\01 Dancing Queen.flac" size="28310307" container="flac" /\>
\</Media\>
\</Track\>
...
\</MediaContainer\>
```
For photo playlists, an example XML returned is:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="1" composite="/playlists/279108/composite/1649881265" leafCount="1" playlistType="photo" ratingKey="279108" smart="0" title="Vacation"\>
\<Photo ratingKey="193259" key="/library/metadata/193259" parentRatingKey="3680" grandparentRatingKey="3663" guid="com.plexapp.agents.none://3681?lang=xn" parentGuid="local://3680" grandparentGuid="local://3663" type="photo" title="100-0001\_CRW" grandparentKey="/library/metadata/3663" parentKey="/library/metadata/3680" librarySectionTitle="Photos" librarySectionID="1" librarySectionKey="/library/sections/1" grandparentTitle="2002" parentTitle="Mexico" summary="" index="1" parentIndex="1" year="2002" thumb="/library/metadata/193259/thumb/1492274439" art="/library/metadata/3680/art/1492274446" parentThumb="/library/metadata/3680/thumb/1492274446" grandparentThumb="/library/metadata/3663/thumb/1611751196" grandparentArt="/library/metadata/3663/art/1611751196" playlistItemID="11382" originallyAvailableAt="2002-11-08" addedAt="1430260595" updatedAt="1492274439" createdAtAccuracy="local" createdAtTZOffset="-18000"\>
\<Media id="252958" width="2312" height="1720" aspectRatio="1.33" container="raw"\>
\<Part id="253288" key="/library/parts/253288/1036805184/file.Crw" file="I:\\Pictures\\2002\\Mexico\\100-0001\_CRW.Crw" size="2128044" container="raw" orientation="1" /\>
\</Media\>
\</Photo\>
...
\</MediaContainer\>
```
The XML returned provides information about the items associated with the specified playlist ID. The root is the `MediaContainer` element. This element contains a few attributes that provide overall information about the items in the playlist.
MediaContainer Attributes|Attribute|Description|
|size|The number of items in the playlist.|
|composite|The URL of the composite image used for the playlist.|
|duration|Total time in milliseconds for all items in the playlist. This attribute is not available for photo playlists.|
|leafCount|Total items in the playlist.|
|playlistType|The type of media in the playlist.|
|ratingKey|The unique ID for the playlist.|
|smart|1 - playlist is a smart playlist.
0 - playlist is not a smart playlist.|
|title|The title of the playlist.|
### Movie Playlists
Within the `MediaContainer` there is one or more `Video` child elements that contain the details about the movie items in the playlist.
Video Attributes|Attribute|Description|
|ratingKey|A key associated with the movie.|
|key|The relative URL of the movie information.|
|guid|The unique identifier comprised of the Plex agent and movie identifier for the agent.|
|studio|The name of the movie studio.|
|type|The type of media.|
|title|The title of the movie.|
|titleSort|The title of the movie used to sort the movies in a collection or list.|
|librarySectionTitle|The name of the library section where the movie is located.|
|librarySectionID|The ID of the library section.|
|librarySectionKey|The relative URL of the library section.|
|contentRating|The content rating associated with the movie.|
|summary|A summary of the movie.|
|rating|The rating for the movie.|
|audienceRating|The audience rating for the movie.|
|viewCount|The number of times the movie has been viewed.|
|lastViewedAt|The date and time for the last time the movie was viewed.|
|year|The year the movie was released.|
|thumb|The thumbnail for the movie.|
|art|The background artwork used to represent the movie.|
|playlistItemID|The unique ID of the item in the playlist.|
|duration|The length of the movie in milliseconds.|
|originallyAvailableAt|The original release date of the movie.|
|addedAt|The date and time, in [Unix time](https://en.wikipedia.org/wiki/Unix_time), the movie was added to the library.|
|updatedAt|The date and time in [epoch time](https://en.wikipedia.org/wiki/Unix_time), the movie was updated in the library.|
|chapterSource|The chapter source type.|
Within the `Video` there are one or more `Media` child elements. Each `Media` element represents one media file of the movie available on the Plex server.
If there are two media files associated with the movie, such as a 1080p and 480p version, then there would be two `Media` child elements in the `Video` element.
Media Attributes|Attribute|Description|
|id|Unique ID associated with the movie.|
|duration|The length of the movie in milliseconds.|
|bitrate|The bitrate of the movie.|
|width|The width of the movie.|
|height|The height of the movie.|
|aspectRatio|The aspect ratio of the movie.|
|audioChannels|The number of audio channels.|
|audioCodec|The audio codec used to encode the audio.|
|videoCodec|The video codec used to encode the video.|
|videoResolution|The video resolution.|
|container|The movie container.|
|videoFrameRate|The framerate standard used for the video.|
|audioProfile|The audio profile of the media.|
|videoProfile|The video profile of the media.|
Within the `Media` there are one or more `Part` child elements. Each `Part` element represents one part of the movie. If the movie has been added to the Plex server as a multi-part movie, then each of those parts will be represented by one `Part` child element.
Part Attributes|Attribute|Description|
|id|Unique ID associated with the part.|
|key|The unique relative path for the part that is used at its key.|
|duration|The length of the part in milliseconds.|
|file|The file associated with the part.|
|size|The file size of the part.|
|audioProfile|The audio profile associated with the audio part.|
|container|The type of media container.|
|videoProfile|The video profile associated with the video part.|
Also within the `Video` element there are multiple additional child elements that provide more details about the movie. These child elements include `Genre`, `Director`, `Writer`, `Country`, `Collection`, and `Role`.
Within each of these child elements is a single `tag` attribute that provides the information for the element. There could be multiple of the same child element within the `Video`, such as multiple directors or writers.
Genre Attributes|Attribute|Description|
|tag|A genre of the movie.|
Director Attributes|Attribute|Description|
|tag|A director of the movie.|
Writer Attributes|Attribute|Description|
|tag|A writer for the movie|
Country Attributes|Attribute|Description|
|tag|A country of origin for the movie.|
Collection Attributes|Attribute|Description|
|tag|The name of a collection containing the movie.|
Role Attributes|Attribute|Description|
|tag|The name of a person with a role in the movie.|
### Music Playlists
Within the `MediaContainer` there is one or more `Track` child elements that contain the details about the music items in the playlist.
The parent item for the tracks refers to the album that includes the track.
Track Attributes|Attribute|Description|
|ratingKey|A key associated with the track.|
|key|The relative URL of the track information.|
|parentRatingKey|The relative URL of the information for the album.|
|grandparentRatingKey|The relative URL of the information for the artist.|
|guid|The unique identifier comprised of the Plex agent and track identifier for the agent.|
|parentGuid|The GUID for the album.|
|grandparentGuid|The GUID for the artist.|
|parentStudio|The name of the studio for the album.|
|type|The type of media.|
|title|The title of the track.|
|grandparentKey|The unique identifier for the artist.|
|parentKey|The unique identifier for the album.|
|librarySectionTitle|The name of the library section where the track is located.|
|librarySectionID|The ID of the library section.|
|librarySectionKey|The relative URL of the library section.|
|grandparentTitle|The title of the artist.|
|parentTitle|The title of the album.|
|summary|A summary of the track.|
|index|The index of the track.|
|parentIndex|The index of the album.|
|ratingCount|A count of the rating.|
|parentYear|The year the album was released.|
|thumb|The thumbnail for the track.|
|art|The background artwork used to represent the track.|
|parentThumb|The thumbnail for the album.|
|grandparentThumb|The thumbnail for the artist.|
|grandparentArt|The background artwork used to represent the artist.|
|duration|The length of the track in milliseconds.|
|addedAt|The date and time, in [Unix time](https://en.wikipedia.org/wiki/Unix_time), the track was added to the library.|
|updatedAt|The date and time in [epoch time](https://en.wikipedia.org/wiki/Unix_time), the track was updated in the library.|
Within the `Track` there are one or more `Media` child elements. Each `Media` element represents one media file of the track available on the Plex server.
Media Attributes|Attribute|Description|
|id|Unique ID associated with the track.|
|duration|The length of the track in milliseconds.|
|bitrate|The bitrate of the track.|
|audioChannels|The number of audio channels.|
|audioCodec|The audio codec used to encode the audio.|
|container|The track container.|
Within the `Media` there are one or more `Part` child elements.
Part Attributes|Attribute|Description|
|id|Unique ID associated with the part.|
|key|The unique relative path for the part that is used at its key.|
|duration|The length of the part in milliseconds.|
|file|The file associated with the part.|
|size|The file size of the part.|
|container|The type of media container.|
### Photo Playlists
Within the `MediaContainer` there is one or more `Photo` child elements that contain the details about the photo items in the playlist.
Photo Attributes|Attribute|Description|
|ratingKey|A key associated with the photo.|
|key|The relative URL of the photo information.|
|parentRatingKey|The relative URL of the information for the parent.|
|grandparentRatingKey|The relative URL of the information for the grandparent.|
|guid|The unique identifier comprised of the Plex agent and photo identifier for the agent.|
|parentGuid|The GUID for the parent.|
|grandparentGuid|The GUID for the grandparent.|
|type|The type of media.|
|title|The title of the photo.|
|grandparentKey|The unique identifier for the grandparent.|
|parentKey|The unique identifier for the parent.|
|librarySectionTitle|The name of the library section where the photo is located.|
|librarySectionID|The ID of the library section.|
|librarySectionKey|The relative URL of the library section.|
|grandparentTitle|The title of the grandparent.|
|parentTitle|The title of the parent.|
|summary|A summary of the photo.|
|index|The index of the photo.|
|parentIndex|The index of the parent.|
|parentYear|The year the parent was released.|
|thumb|The thumbnail for the photo.|
|art|The background artwork used to represent the photo.|
|parentThumb|The thumbnail for the parent.|
|grandparentThumb|The thumbnail for the grandparent.|
|grandparentArt|The background artwork used to represent the grandparent.|
|playlistItemID|The unique ID of the item in the playlist.|
|originallyAvailableAt|The original release date of the photo.|
|addedAt|The date and time, in [Unix time](https://en.wikipedia.org/wiki/Unix_time), the photo was added to the library.|
|updatedAt|The date and time in [epoch time](https://en.wikipedia.org/wiki/Unix_time), the photo was updated in the library.|
Within the `Photo` there are one or more `Media` child elements.
Media Attributes|Attribute|Description|
|id|Unique ID associated with the photo.|
|width|The width of the photo.|
|height|The height of the photo.|
|aspectRatio|The aspect ratio of the photo.|
|container|The photo container.|
Within the `Media` there are one or more `Part` child elements.
Part Attributes|Attribute|Description|
|id|Unique ID associated with the part.|
|key|The unique relative path for the part that is used at its key.|
|file|The file associated with the part.|
|size|The file size of the part.|
|container|The type of media container.|
|orientation|1 - photo is in landscape.
8 - photo is in portrait.|
## Remarks
A playlist is specific to a user on the Plex server. Only that user can request information about a playlist.
When using a device Plex authentication token, the administrative user playlists will be returned by the Plex server. This means that the administrator's Plex token and any device token will return the same XML response.
## Examples
curl Python Powershell
```
curl -X GET http://{ip\_address}:32400/playlists/{id}/items?X-Plex-Token={plex\_token}
```
```
import requests
plex\_url = http://{ip\_address}:32400/playlists/{id}/items?X-Plex-Token={plex\_token}
response = requests.get(plex\_url)
print(response.text)
```
```
$response = Invoke-RestMethod 'http://{ip\_address}:32400/playlists/{id}/items?X-Plex-Token={plex\_token}' -Method GET
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
[Get All Playlists](https://www.plexopedia.com/plex-media-server/api/playlists/view/) [Get a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/view-single/) [Create a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/create/) [Update a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/update/) [Delete a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/delete/) Get Items in a Playlist [Add an Item to a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/add-item/) [Delete an Item from a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/delete-item/) [Delete All Items from a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/delete-items/)
### Maintenance
[Empty Trash](https://www.plexopedia.com/plex-media-server/api/library/empty-trash/) [Clean Bundles](https://www.plexopedia.com/plex-media-server/api/library/clean-bundles/) [Optimize Database](https://www.plexopedia.com/plex-media-server/api/library/optimize-database/)
### Scheduled Tasks
[Get All Scheduled Tasks](https://www.plexopedia.com/plex-media-server/api/server/scheduled-tasks/) [Run All Scheduled Tasks](https://www.plexopedia.com/plex-media-server/api/server/task-run-all/) [Stop All Scheduled Tasks](https://www.plexopedia.com/plex-media-server/api/server/task-stop-all/) [Run Backup Database Task](https://www.plexopedia.com/plex-media-server/api/server/task-backup-database/) [Stop Backup Database Task](https://www.plexopedia.com/plex-media-server/api/server/task-backup-database-stop/) [Run Optimize Database Task](https://www.plexopedia.com/plex-media-server/api/server/task-optimize-database/) [Stop Optimize Database Task](https://www.plexopedia.com/plex-media-server/api/server/task-optimize-database-stop/) [Run Clean Old Bundles Task](https://www.plexopedia.com/plex-media-server/api/server/task-clean-old-bundles/) [Stop Clean Old Bundles Task](https://www.plexopedia.com/plex-media-server/api/server/task-clean-old-bundles-stop/) [Run Clean Old Cache Files Task](https://www.plexopedia.com/plex-media-server/api/server/task-clean-old-cache-files/) [Stop Clean Old Cache Files Task](https://www.plexopedia.com/plex-media-server/api/server/task-clean-old-cache-files-stop/) [Run Refresh Local Metadata Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-local-metadata/) [Stop Refresh Local Metadata Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-local-metadata-stop/) [Run Refresh Libraries Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-libraries/) [Stop Refresh Libraries Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-libraries-stop/) [Run Extensive Media Analysis Task](https://www.plexopedia.com/plex-media-server/api/server/task-extensive-media-analysis/) [Stop Extensive Media Analysis Task](https://www.plexopedia.com/plex-media-server/api/server/task-extensive-media-analysis-stop/) [Run Refresh Metadata Periodically Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-metadata-periodically/) [Stop Refresh Metadata Periodically Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-metadata-periodically-stop/) [Run Upgrade Media Analysis Task](https://www.plexopedia.com/plex-media-server/api/server/task-upgrade-media-analysis/) [Stop Upgrade Media Analysis Task](https://www.plexopedia.com/plex-media-server/api/server/task-upgrade-media-analysis-stop/)
### Troubleshooting
[Log a Single Message](https://www.plexopedia.com/plex-media-server/api/server/log-single/) [Log Multiple Messages](https://www.plexopedia.com/plex-media-server/api/server/log-multiple/) [Download Databases](https://www.plexopedia.com/plex-media-server/api/server/download-databases/) [Download Logs](https://www.plexopedia.com/plex-media-server/api/server/download-logs/)
### Reference
[Arrays](https://www.plexopedia.com/plex-media-server/api/arrays/) [Filtering](https://www.plexopedia.com/plex-media-server/api/filter/)
[&uarr;](#top-of-page)