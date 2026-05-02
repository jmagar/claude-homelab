Plex API: Get All TV Show Episodes - Plexopedia
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
A TV show that has been added to Plex has multiple levels of information. A TV show contains a season and within each season, there could be one or more episodes. This API command returns all episodes for a season for a TV show.
## URL
```
GET http://{ip\_address}:32400/library/metadata/{id}/children?X-Plex-Token={plex\_token}&includeGuids={include\_guids}&{filter}
```
### Parameters
|Name|Description|
|ip\_address|The IP address of the Plex Media server.|
|plex\_token|The [Plex token](https://www.plexopedia.com/plex-media-server/general/plex-token/).|
|id|The key associated with a TV show season. This key can be found by calling the [Get All TV Show Seasons API command](/plex-media-server/api/server/libraries/) and looking for a `ratingKey` for the season.|
|include\_guids|(Optional) Returns the GUID values of the online metadata services associated to the media item.|
|filter|(Optional) The [filter](/plex-media-server/api/filter/) to apply to the response. See the [Filtering](#filter) section below for parameters that can be used to filter the response.|
## Return Status
|HTTP Code|Description|
|200|Success - The request was successful.|
|401|Unauthorized - The Plex token provided was not valid.|
## Response
XML string value that lists the all the TV show episodes in the library. An example of the XML returned from the request is shown below:
```
\<MediaContainer size="13" allowSync="1" art="/library/metadata/275479/art/1673348103" grandparentContentRating="TV-G" grandparentRatingKey="275479" grandparentStudio="WIPB" grandparentTheme="/library/metadata/275479/theme/1673348103" grandparentThumb="/library/metadata/275479/thumb/1673348103" grandparentTitle="The Joy of Painting" identifier="com.plexapp.plugins.library" key="275480" librarySectionID="4" librarySectionTitle="TV Shows" librarySectionUUID="3bbbe6f7-628f-4983-ae5d-7c05779c4c28" mediaTagPrefix="/system/bundle/media/flags/" mediaTagVersion="1677707382" nocache="1" parentIndex="1" parentTitle="The Joy of Painting" sortAsc="1" summary="Season 1 of The Joy of Painting with Bob Ross features the following wonderful painting instructions: A Walk in the Woods, Mt. McKinley, Ebony Sunset, Winter Mist, Quiet Stream, Winter Moon, Autumn Mountains, Peaceful Valley, Seascape, Mountain Lake, Winter Glow, and Snowfall." theme="/library/metadata/275479/theme/1673348103" thumb="/library/metadata/275480/thumb/1659190872" title1="The Joy of Painting" title2="The Joy of Painting" viewGroup="episode" viewMode="131133"\>
\<Video ratingKey="275481" key="/library/metadata/275481" parentRatingKey="275480" grandparentRatingKey="275479" guid="plex://episode/5d9c12c8705e7a001e76391f" parentGuid="plex://season/602e683d88e0a9002df8a4ff" grandparentGuid="plex://show/5d9c086e3c3f87001f34fc00" type="episode" title="A Walk in the Woods" titleSort="Walk in the Woods" grandparentKey="/library/metadata/275479" parentKey="/library/metadata/275480" grandparentTitle="The Joy of Painting" parentTitle="The Joy of Painting" contentRating="TV-G" summary="Bob Ross introduces us to his "Almighty" assortment of tools and colors, tells us that anyone can paint, and creates a landscape of a forest path just after a rain shower." index="1" parentIndex="1" year="1983" thumb="/library/metadata/275481/thumb/1674982811" art="/library/metadata/275479/art/1673348103" parentThumb="/library/metadata/275480/thumb/1659190872" grandparentThumb="/library/metadata/275479/thumb/1673348103" grandparentArt="/library/metadata/275479/art/1673348103" grandparentTheme="/library/metadata/275479/theme/1673348103" duration="1681271" originallyAvailableAt="1983-01-11" addedAt="1619709963" updatedAt="1674982811"\>
\<Media id="334942" duration="1681271" bitrate="827" width="640" height="480" aspectRatio="1.33" audioChannels="2" audioCodec="aac" videoCodec="h264" videoResolution="480" container="mp4" videoFrameRate="NTSC" optimizedForStreaming="1" audioProfile="lc" has64bitOffsets="0" videoProfile="constrained baseline"\>
\<Part id="335274" key="/library/parts/335274/1619732910/file.mp4" duration="1681271" file="M:\\Media\\TV Shows\\The Joy of Painting\\Season 01\\Bob Ross - The Joy of Painting - s01e01.mp4" size="175144278" audioProfile="lc" container="mp4" has64bitOffsets="0" optimizedForStreaming="1" videoProfile="constrained baseline" /\>
\</Media\>
\<Role tag="Steve Ross" /\>
\</Video\>
...
\</MediaContainer\>
```
The XML returned provides a list of the episodes in a season that are available on the Plex server. The root is the `MediaContainer` element. This element contains a few attributes that provide overall information about the season's episodes on the server.
MediaContainer Attributes|Attribute|Description|
|size|The number of episodes.|
|allowSync|1 - allow syncing content.
0 - don't allow syncing content.|
|art|Background artwork used to represent the episode.|
|grandparentContentRating|The content rating for the TV show.|
|grandparentRatingKey|The key associated with the TV show.|
|grandparentStudio|The studio associated with the TV show.|
|grandparentTheme|The theme associated with the TV show.|
|grandparentThumb|The thumbnail image associated with the TV show.|
|grandparentTitle|The title of the TV show.|
|identifier|The type of item.|
|key|Unique identifier for the episode.|
|librarySectionID|The unique key associated with the library.|
|librarySectionTitle|The title of the library.|
|librarySectionUUID|Unique GUID identifier for the library.|
|mediaTagPrefix|Prefix for the media tag.|
|mediaTagVersion|Media tag version.
**Note:** This could be a date and time value.|
|nocache|1 - cache the library.
0 - do not cache the library.|
|parentIndex|The index of the season.|
|parentTitle|The title of the season.|
|sortAsc|1 - the library is sorted in ascending order.
0 - the library is sorted in descending order.|
|summary|The summary for the episode.|
|theme|The theme for the episode.|
|thumb|The thumbnail for the episode.|
|title1|The title of the episode.
**Note:** This appears to be internally created, and can't be changed by the server owner.|
|title2|A descriptive title for the episode.|
|viewGroup|The group type used to view the episode.|
|viewMode|Unknown integer value.|
Within the `MediaContainer` there are one or more `Video` child elements. Each `Video` element represents one episode available on the Plex server for the season.
Video Attributes|Attribute|Description|
|ratingKey|A key associated with the episode.|
|key|The relative URL of the episode information.|
|parentRatingKey|The relative URL of the information for the season.|
|grandparentRatingKey|The relative URL of the information for the TV show.|
|guid|The unique identifier comprised of the Plex agent and episode identifier for the agent.|
|parentGuid|The GUID for the season.|
|grandparentGuid|The GUID for the TV show.|
|type|The type of media.|
|title|The title of the episode.|
|titleSort|The title of the episode used to sort the episodes in a collection or list.|
|grandparentKey|The unique identifier for the TV show.|
|parentKey|The unique identifier for the season.|
|grandparentTitle|The title of the TV show.|
|parentTitle|The title of the season.|
|contentRating|The content rating associated with the episode.|
|summary|A summary of the episode.|
|index|The index of the episode.|
|parentIndex|The index of the season.|
|year|The year the episode was released.|
|thumb|The thumbnail for the episode.|
|art|The background artwork used to represent the episode.|
|parentThumb|The thumbnail for the season.|
|grandparentThumb|The thumbnail for the TV show.|
|grandparentArt|The background artwork used to represent the TV show.|
|grandparentTheme|The theme of the TV show.|
|duration|The length of the episode in milliseconds.|
|originallyAvailableAt|The original release date of the episode.|
|addedAt|The date and time, in [Unix time](https://en.wikipedia.org/wiki/Unix_time), the episode was added to the library.|
|updatedAt|The date and time in [epoch time](https://en.wikipedia.org/wiki/Unix_time), the episode was updated in the library.|
Within the `Video` there are one or more `Media` child elements. Each `Media` element represents one media file of the episode available on the Plex server.
If there are two media files associated with the movie, such as a 1080p and 480p version, then there would be two `Media` child elements in the `Video` element.
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
|optimizedForStreaming|The media item is optimized for streaming.
0 - not optimized, 1 - optimized.|
|audioProfile|The audio profile of the media.|
|has64bitOffsets|The media item contains 64 bit offsets|
|videoProfile|The video profile of the media.|
Within the `Media` there are one or more `Part` child elements. Each `Part` element represents one part of the episode. If the episode has been added to the Plex server as a multi-part episode, then each of those parts will be represented by one `Part` child element.
Part Attributes|Attribute|Description|
|id|Unique ID associated with the part.|
|key|The unique relative path for the part that is used at its key.|
|duration|The length of the part in milliseconds.|
|file|The file associated with the part.|
|size|The file size of the part.|
|audioProfile|The audio profile associated with the audio part.|
|container|The type of media container.|
|has64bitOffsets|The media item contains 64 bit offsets|
|optimizedForStreaming|The media item is optimized for streaming.
0 - not optimized, 1 - optimized.|
|videoProfile|The video profile associated with the video part.|
Also within the `Video` element there are multiple additional child elements that provide more details about the movie. These child elements include `Genre`, `Director`, `Writer`, `Country`, `Collection`, and `Role`.
Within each of these child elements is a single `tag` attribute that provides the information for the element. There could be multiple of the same child element within the `Video`, such as multiple directors or writers.
Genre Attributes|Attribute|Description|
|tag|A genre of the episode.|
Director Attributes|Attribute|Description|
|tag|A director of the episode.|
Writer Attributes|Attribute|Description|
|tag|A writer for the episode|
Country Attributes|Attribute|Description|
|tag|A country of origin for the episode.|
Collection Attributes|Attribute|Description|
|tag|The name of a collection containing the episode.|
Role Attributes|Attribute|Description|
|tag|The name of a person with a role in the episode.|
If the `include\_guids` parameter was specified with the value of 1, then there would be a `Guid` element for each online metadata service associated with the item.
## Filtering
To reduce the number of items returned, you can filter the API response to only return items that meet a specific criteria.
For more information, check out the [Filter](/plex-media-server/api/filter/) page.
The results from this endpoint can be filtered by adding the following optional parameters to the request:
Filter Parameters|Parameter|Description|
|addedAt|Gets all the TV show episodes that were added based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. The value is in [epoch time](https://en.wikipedia.org/wiki/Unix_time).|
|audienceRating|Gets all TV show episodes that match the audience rating condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error.|
|contentRating|Gets all TV show episodes that match the content rating. This value is case-sensitive.|
|duration|Gets all the TV show episodes that match the condition on the movie duration. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. This value is is milliseconds.|
|lastViewedAt|Gets all the TV show episodes that were last viewed based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. The value is in [epoch time](https://en.wikipedia.org/wiki/Unix_time).|
|originallyAvailableAt|Gets all the TV show episodes that match were originally available time based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. Must be in the format YYYY or YYY-MM-DD.|
|rating|Gets all the TV show episodes that match the rating based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error.|
|title|Will match any part of the TV show episode title. The value provide is not case-sensitive.|
|updatedAt|Gets all the TV show episodes that were updated based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. The value is in [epoch time](https://en.wikipedia.org/wiki/Unix_time).|
|viewCount|Gets all the TV show episodes that were viewed a specified number of times. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error.|
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
[Get All TV Shows](https://www.plexopedia.com/plex-media-server/api/library/tvshows/) [Get All TV Show Seasons](https://www.plexopedia.com/plex-media-server/api/library/tvshows-seasons/) [Update a TV Show Series Using Match](https://www.plexopedia.com/plex-media-server/api/library/tvshow-update-match/) Get All TV Show Episodes [Get Recently Added TV Shows](https://www.plexopedia.com/plex-media-server/api/library/tvshows-recently-added/)
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