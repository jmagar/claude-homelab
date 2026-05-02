Plex API: Get All TV Show Seasons - Plexopedia
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
Each TV show added to a Plex server can have one or more seasons associated with it. You can use this API command to get information about each season.
## URL
```
GET http://{ip\_address}:32400/library/metadata/{id}/children?X-Plex-Token={plex\_token}&includeGuids={include\_guids}&{filter}
```
### Parameters
|Name|Description|
|ip\_address|The IP address of the Plex Media server.|
|plex\_token|The [Plex token](https://www.plexopedia.com/plex-media-server/general/plex-token/).|
|id|The key associated with a TV show. This key can be found by calling the [Get all TVShows command](/plex-media-server/api/library/tvshows/) and using the value in the `ratingKey` attribute.|
|include\_guids|(Optional) Returns the GUID values of the online metadata services associated to the media item.|
|filter|(Optional) The [filter](/plex-media-server/api/filter/) to apply to the response. See the [Filtering](#filter) section below for parameters that can be used to filter the response.|
## Return Status
|HTTP Code|Description|
|200|Success - The request was successful.|
|401|Unauthorized - The Plex token provided was not valid.|
## Response
XML string value that lists the all the TV show seasons in the library. An example of the XML returned from the request is shown below:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="5" allowSync="1" art="/library/metadata/275479/art/1673348103" identifier="com.plexapp.plugins.library" key="275479" librarySectionID="4" librarySectionTitle="TV Shows" librarySectionUUID="3bbbe6f7-628f-4983-ae5d-7c05779c4c28" mediaTagPrefix="/system/bundle/media/flags/" mediaTagVersion="1677707382" nocache="1" parentIndex="1" parentTitle="The Joy of Painting" parentYear="1983" sortAsc="1" summary="In this half-hour program, artist Bob Ross paints a beautiful oil painting on canvas." theme="/library/metadata/275479/theme/1673348103" thumb="/library/metadata/275479/thumb/1673348103" title1="TV Shows" title2="The Joy of Painting" viewGroup="season" viewMode="458810"\>
\<Directory leafCount="52" thumb="/library/metadata/275479/thumb/1673348103" viewedLeafCount="0" key="/library/metadata/275479/allLeaves" title="All episodes" /\>
\<Directory ratingKey="275480" key="/library/metadata/275480/children" parentRatingKey="275479" guid="plex://season/602e683d88e0a9002df8a4ff" parentGuid="plex://show/5d9c086e3c3f87001f34fc00" parentStudio="WIPB" type="season" title="The Joy of Painting" titleSort="Joy of Painting" parentKey="/library/metadata/275479" parentTitle="The Joy of Painting" summary="Season 1 of The Joy of Painting with Bob Ross features the following wonderful painting instructions: A Walk in the Woods, Mt. McKinley, Ebony Sunset, Winter Mist, Quiet Stream, Winter Moon, Autumn Mountains, Peaceful Valley, Seascape, Mountain Lake, Winter Glow, and Snowfall." index="1" parentIndex="1" parentYear="1983" thumb="/library/metadata/275480/thumb/1659190872" art="/library/metadata/275479/art/1673348103" parentThumb="/library/metadata/275479/thumb/1673348103" parentTheme="/library/metadata/275479/theme/1673348103" leafCount="13" viewedLeafCount="0" addedAt="1619710207" updatedAt="1659190872"\>\</Directory\>
\<Directory ratingKey="275494" key="/library/metadata/275494/children" parentRatingKey="275479" guid="plex://season/602e683e88e0a9002df8a504" parentGuid="plex://show/5d9c086e3c3f87001f34fc00" parentStudio="WIPB" type="season" title="Season 2" parentKey="/library/metadata/275479" parentTitle="The Joy of Painting" summary="Season 2 of The Joy of Painting with Bob Ross features the following wonderful painting instructions: Meadow Lake, Winter Sun, Ebony Sea, Shades of Grey, Autumn Splendor, Black River, Brown Mountain, Reflections, Black and White Seascape, Lazy River, Black Waterfall, Mountain Waterfall, Final Grace." index="2" parentIndex="1" parentYear="1983" thumb="/library/metadata/275494/thumb/1659190874" art="/library/metadata/275479/art/1673348103" parentThumb="/library/metadata/275479/thumb/1673348103" parentTheme="/library/metadata/275479/theme/1673348103" leafCount="13" viewedLeafCount="0" addedAt="1619733355" updatedAt="1659190874"\>\</Directory\>
...
\</MediaContainer\>
```
The XML returned provides a list of the all seasons for a TV show that are available on the Plex server. The root is the `MediaContainer` element. This element contains a few attributes that provide overall information about the TV show seasons on the server.
MediaContainer Attributes|Attribute|Description|
|size|The number of TV show seasons.|
|allowSync|1 - allow syncing content.
0 - don't allow syncing content.|
|art|Background artwork used to represent the TV show season.|
|identifier|The type of item.|
|key|Unique identifier for the TV show season.|
|librarySectionID|The unique key associated with the library.|
|librarySectionTitle|The title of the library.|
|librarySectionUUID|Unique GUID identifier for the library.|
|mediaTagPrefix|Prefix for the media tag.|
|mediaTagVersion|Media tag version.
**Note:** This could be a date and time value.|
|nocache|1 - cache the library.
0 - do not cache the library.|
|parentIndex|The index of the TV show.|
|parentTitle|The title of the TV show.|
|parentYear|The year of the TV show.|
|sortAsc|1 - the library is sorted in ascending order.
0 - the library is sorted in descending order.|
|summary|The summary for the TV show season.|
|theme|The theme for the TV show season.|
|thumb|The thumbnail for the TV show season.|
|title1|The title of the TV show season.
**Note:** This appears to be internally created, and can't be changed by the server owner.|
|title2|A descriptive title for the TV show season.|
|viewGroup|The group type used to view the TV show season.|
|viewMode|Unknown integer value.|
Within the `MediaContainer` there are one or more `Directory` child elements. The first `Directory` element is used to view all episodes for the TV show.
Directory Attributes|Attribute|Description|
|leafCount|The number of items in the TV show season.|
|thumb|The thumbnail for the TV show season.|
|viewedLeafCount|The number of the TV show season items that have been viewed.|
|key|The relative URL of the information for the TV show season.|
|title|The name of the TV show season.|
After the 'All Episodes' `Directory` element, there is a `Directory` element for each season for the TV show that is available on the Plex server.
Directory Attributes|Attribute|Description|
|ratingKey|A key associated with the TV show season.|
|key|The relative URL of the information for the TV show season.|
|parentRatingKey|A key associated with the TV show.|
|guid|The unique identifier for the TV show season.|
|parentGuid|The unique identifier associated with the TV show.|
|parentStudio|The studio associated with the TV show.|
|type|The type of item represented by this `Directory` element.|
|title|The name of the TV show season.|
|titleSort|The title used to sort the seasons.|
|parentKey|The key associated with the TV show.|
|parentTitle|The title associated with the TV show.|
|summary|Information about the TV show season.|
|index|Unknown.|
|parentIndex|The index associated with the TV show.|
|parentYear|The studio associated with the TV show.|
|thumb|The thumbnail for the TV show season.|
|art|The background artwork used to represent the TV show season.|
|parentThumb|The studio associated with the TV show.|
|parentTheme|The theme song associated with the TV show.|
|leafCount|The number of items in the TV show season.|
|viewedLeafCount|The number of the TV show season items that have been viewed.|
|addedAt|The date and time the TV show season was added to the library.|
|updatedAt|The date and time the TV show season was updated in the library.|
If the `include\_guids` parameter was specified with the value of 1, then there would be a `Guid` element for each online metadata service associated with the item.
## Filtering
To reduce the number of items returned, you can filter the API response to only return items that meet a specific criteria.
For more information, check out the [Filter](/plex-media-server/api/filter/) page.
The results from this endpoint can be filtered by adding the following optional parameters to the request:
Filter Parameters|Parameter|Description|
|addedAt|Gets all the TV show seasons that were added based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. The value is in [epoch time](https://en.wikipedia.org/wiki/Unix_time).|
|rating|Gets all the TV show seasons that match the rating based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error.|
|updatedAt|Gets all the TV show seasons that were updated based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. The value is in [epoch time](https://en.wikipedia.org/wiki/Unix_time).|
|viewCount|Gets all the TV show seasons that were viewed a specified number of times. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error.|
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
[Get All TV Shows](https://www.plexopedia.com/plex-media-server/api/library/tvshows/) Get All TV Show Seasons [Update a TV Show Series Using Match](https://www.plexopedia.com/plex-media-server/api/library/tvshow-update-match/) [Get All TV Show Episodes](https://www.plexopedia.com/plex-media-server/api/library/tvshows-episodes/) [Get Recently Added TV Shows](https://www.plexopedia.com/plex-media-server/api/library/tvshows-recently-added/)
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