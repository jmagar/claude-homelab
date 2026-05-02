Plex API: Get All Tracks for a Music Album - Plexopedia
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
Each music album on Plex can have one or more tracks associated with it. This API command will return information about all the tracks, including the full path to the file.
## URL
```
GET http://{ip\_address}:32400/library/metadata/{id}/children?X-Plex-Token={plex\_token}&includeGuids={include\_guids}&{filter}
```
### Parameters
|Name|Description|
|ip\_address|The IP address of the Plex Media server.|
|plex\_token|The [Plex token](https://www.plexopedia.com/plex-media-server/general/plex-token/).|
|id|The key associated with a music album. This key can be found by calling the [Get All Music Albums for an Artist API command](/plex-media-server/api/library/music-albums-artist/) and using the `ratingKey` attribute for the album.|
|include\_guids|(Optional) Returns the GUID values of the online metadata services associated to the media item.|
|filter|(Optional) The [filter](/plex-media-server/api/filter/) to apply to the response. See the [Filtering](#filter) section below for parameters that can be used to filter the response.|
## Return Status
|HTTP Code|Description|
|200|Success - The request was successful.|
|401|Unauthorized - The Plex token provided was not valid.|
## Response
XML string value that lists all the tracks for the album specified in the request. An example of the XML returned from the request is shown below:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="19" allowSync="1" art="/library/metadata/218548/art/1686115671" grandparentRatingKey="218548" grandparentThumb="/library/metadata/218548/thumb/1686115671" grandparentTitle="ABBA" identifier="com.plexapp.plugins.library" key="218549" librarySectionID="8" librarySectionTitle="Music" librarySectionUUID="b6031749-2969-4027-afee-64172b72b77d" mediaTagPrefix="/system/bundle/media/flags/" mediaTagVersion="1682076900" nocache="1" parentIndex="1" parentTitle="Gold: Greatest Hits" parentYear="1992" sortAsc="1" summary="ABBA's 19-song Gold collection was the first hits compilation prepared specifically for the CD format by the 1970s supergroup, and, appearing after a period of several years in which their music had been off the market, was a welcome addition to the catalog. It is still the simplest and most straightforward collection of the group's material that it is possible to buy. \~ Bruce Eder" thumb="/library/metadata/218549/thumb/1685475601" title1="ABBA" title2="Gold: Greatest Hits" viewGroup="track" viewMode="458810"\>
\<Track ratingKey="218550" key="/library/metadata/218550" parentRatingKey="218549" grandparentRatingKey="218548" guid="plex://track/5d07cdc7403c640290f6a452" parentGuid="plex://album/5d07c182403c64029084e584" grandparentGuid="plex://artist/5d07bbfd403c6402904a6593" parentStudio="Polydor" type="track" title="Dancing Queen" grandparentKey="/library/metadata/218548" parentKey="/library/metadata/218549" grandparentTitle="ABBA" parentTitle="Gold: Greatest Hits" summary="" index="1" parentIndex="1" ratingCount="1448426" parentYear="1992" thumb="/library/metadata/218549/thumb/1685475601" art="/library/metadata/218548/art/1686115671" parentThumb="/library/metadata/218549/thumb/1685475601" grandparentThumb="/library/metadata/218548/thumb/1686115671" grandparentArt="/library/metadata/218548/art/1686115671" duration="231400" addedAt="1598373482" updatedAt="1686115672" musicAnalysisVersion="1"\>
\<Media id="278042" duration="231400" bitrate="978" audioChannels="2" audioCodec="flac" container="flac"\>
\<Part id="278372" key="/library/parts/278372/1598369723/file.flac" duration="231400" file="I:\\Music\\ABBA\\Gold- Greatest Hits\\01 Dancing Queen.flac" size="28310307" container="flac" /\>
\</Media\>
\</Track\>
\<Track ratingKey="218551" key="/library/metadata/218551" parentRatingKey="218549" grandparentRatingKey="218548" guid="plex://track/5d07cdd3403c640290f7cb52" parentGuid="plex://album/5d07c182403c64029084e584" grandparentGuid="plex://artist/5d07bbfd403c6402904a6593" parentStudio="Polydor" type="track" title="Knowing Me, Knowing You" grandparentKey="/library/metadata/218548" parentKey="/library/metadata/218549" grandparentTitle="ABBA" parentTitle="Gold: Greatest Hits" summary="" index="2" parentIndex="1" ratingCount="455281" parentYear="1992" thumb="/library/metadata/218549/thumb/1685475601" art="/library/metadata/218548/art/1686115671" parentThumb="/library/metadata/218549/thumb/1685475601" grandparentThumb="/library/metadata/218548/thumb/1686115671" grandparentArt="/library/metadata/218548/art/1686115671" duration="242226" addedAt="1598373482" updatedAt="1686115672" musicAnalysisVersion="1"\>
\<Media id="278043" duration="242226" bitrate="946" audioChannels="2" audioCodec="flac" container="flac"\>
\<Part id="278373" key="/library/parts/278373/1598369823/file.flac" duration="242226" file="I:\\Music\\ABBA\\Gold- Greatest Hits\\02 Knowing Me, Knowing You.flac" size="28660739" container="flac" /\>
\</Media\>
\</Track\>
...
\</MediaContainer\>
```
The XML returned provides a list of the all the tracks associated with a music album that are available on the Plex server. The root is the `MediaContainer` element. This element contains a few attributes that provide overall information about the tracks on the server.
MediaContainer Attributes|Attribute|Description|
|size|The number of tracks.|
|allowSync|1 - allow syncing content.
0 - don't allow syncing content.|
|art|Background artwork used to represent the track.|
|grandparentRatingKey|The key associated with the artist.|
|grandparentThumb|The thumbnail image associated with the artist.|
|grandparentTitle|The title of the artist.|
|identifier|The type of item.|
|key|Unique identifier for the track.|
|librarySectionID|The unique key associated with the library.|
|librarySectionTitle|The title of the library.|
|librarySectionUUID|Unique GUID identifier for the library.|
|mediaTagPrefix|Prefix for the media tag.|
|mediaTagVersion|Media tag version.
**Note:** This could be a date and time value.|
|nocache|1 - cache the library.
0 - do not cache the library.|
|parentIndex|The index of the album.|
|parentTitle|The title of the album.|
|parentYear|The year of the album.|
|sortAsc|1 - the library is sorted in ascending order.
0 - the library is sorted in descending order.|
|summary|The summary for the track.|
|thumb|The thumbnail for the track.|
|title1|The title of the track.
**Note:** This appears to be internally created, and can't be changed by the server owner.|
|title2|A descriptive title for the track.|
|viewGroup|The group type used to view the track.|
|viewMode|Unknown integer value.|
Within the `MediaContainer` there are one or more `Track` child elements. Each `Track` element represents one music track available on the Plex server.
Track Attributes|Attribute|Description|
|ratingKey|A key associated with the track.|
|key|The relative URL of the track information.|
|parentRatingKey|The relative URL of the information for the album.|
|grandparentRatingKey|The relative URL of the information for the artist.|
|guid|The unique identifier comprised of the Plex agent and track identifier for the agent.|
|parentGuid|The GUID for the album.|
|grandparentGuid|The GUID for the artist.|
|grandparentTitle|The title of the artist.|
|parentTitle|The title of the album.|
|type|The type of media.|
|title|The title of the track.|
|grandparentKey|The unique identifier for the artist.|
|parentKey|The unique identifier for the album.|
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
|musicAnalysisVersion|The version of the music analyzer used.|
Also within the `Track` element there are one or more `Media` elements that represent each media item for that track. If the track has multiple file versions, then each file would be represented by one `Media` element.
Each `Media` element contains the following:
Media Attributes|Attribute|Description|
|id|Unique ID associated with the track.|
|duration|The length of the track in milliseconds.|
|bitrate|The bitrate of the track.|
|audioChannels|The number of audio channels.|
|audioCodec|The audio codec used to encode the audio.|
|container|The track container.|
There is at least one `Part` element that contains information about the actual media file. Teh `Part` element contains the following:
Part Attributes|Attribute|Description|
|id|Unique ID associated with the part.|
|key|The unique relative path for the part that is used at its key.|
|duration|The length of the part in milliseconds.|
|file|The file associated with the part.|
|size|The file size of the part.|
|container|The type of media container.|
If the `include\_guids` parameter was specified with the value of 1, then there would be a `Guid` element for each online metadata service associated with the item.
## Filtering
To reduce the number of items returned, you can filter the API response to only return items that meet a specific criteria.
For more information, check out the [Filter](/plex-media-server/api/filter/) page.
The results from this endpoint can be filtered by adding the following optional parameters to the request:
Filter Parameters|Parameter|Description|
|addedAt|Gets all the tracks that were added based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. The value is in [epoch time](https://en.wikipedia.org/wiki/Unix_time).|
|duration|Gets all the tracks that match the condition on the movie duration. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. This value is is milliseconds.|
|file|Will match any part of the file name for the track. The value provide is not case-sensitive.|
|lastViewedAt|Gets all the tracks that were last viewed based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. The value is in [epoch time](https://en.wikipedia.org/wiki/Unix_time).|
|ratingCount|Gets all the tracks that have been rated a specified number of times.|
|title|Will match any part of the track title. The value provide is not case-sensitive.|
|updatedAt|Gets all the tracks that were updated based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. The value is in [epoch time](https://en.wikipedia.org/wiki/Unix_time).|
|viewCount|Gets all the tracks that were viewed a specified number of times. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error.|
## Examples
curl Python Powershell
```
curl -X GET http://{ip\_address}:32400/library/metadata/{id}/children?X-Plex-Token={plex\_token}
```
```
import requests
plex\_url = http://{ip\_address}:32400/library/metadata/{id}/children?X-Plex-Token={plex\_token}
response = requests.get(plex\_url)
print(response.text)
```
```
$response = Invoke-RestMethod 'http://{ip\_address}:32400/library/metadata/{id}/children?X-Plex-Token={plex\_token}' -Method GET
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
[Get All Music Artists](https://www.plexopedia.com/plex-media-server/api/library/music/) [Get All Music Albums for an Artist](https://www.plexopedia.com/plex-media-server/api/library/music-albums-artist/) Get All Tracks for a Music Album [Update Music Artist Details Using Match](https://www.plexopedia.com/plex-media-server/api/library/music-artist-update-match/) [Update Music Album Details Using Match](https://www.plexopedia.com/plex-media-server/api/library/music-album-update-match/)
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