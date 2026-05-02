Plex API: Get All Music Albums for an Artist - Plexopedia
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
A music artist can have one or more albums associated with them This API command will return all of the albums from the Plex server that are associated with an artist.
## URL
```
GET http://{ip\_address}:32400/library/sections/{library\_id/all?artist.id={artist\_id}&type=9&X-Plex-Token={plex\_token}&includeGuids={include\_guids}&{filter}
```
### Parameters
|Name|Description|
|ip\_address|The IP address of the Plex Media server.|
|plex\_token|The [Plex token](https://www.plexopedia.com/plex-media-server/general/plex-token/).|
|library\_id|The key associated with a music library. This key can be found by calling the [Libraries API command](/plex-media-server/api/server/libraries/) and looking for a music library.|
|artist\_id|The key associated with the music artist. This key can be found by calling the [Get All Music Artists API command](/plex-media-server/api/library/music/) and using the `ratingKey` attribute associated with the artist.|
|include\_guids|(Optional) Returns the GUID values of the online metadata services associated to the media item.|
|filter|(Optional) The [filter](/plex-media-server/api/filter/) to apply to the response. See the [Filtering](#filter) section below for parameters that can be used to filter the response.|
## Return Status
|HTTP Code|Description|
|200|Success - The request was successful.|
|401|Unauthorized - The Plex token provided was not valid.|
## Response
XML string value that lists all the albums for the music artists in the library. An example of the XML returned from the request is shown below:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="1" allowSync="1" art="/:/resources/artist-fanart.jpg" identifier="com.plexapp.plugins.library" librarySectionID="8" librarySectionTitle="Music" librarySectionUUID="b6031749-2969-4027-afee-64172b72b77d" mediaTagPrefix="/system/bundle/media/flags/" mediaTagVersion="1682076900" nocache="1" thumb="/:/resources/artist.png" title1="Music" title2="All Artists" viewGroup="artist" viewMode="65592"\>
\<Directory ratingKey="218549" key="/library/metadata/218549/children" parentRatingKey="218548" guid="plex://album/5d07c182403c64029084e584" parentGuid="plex://artist/5d07bbfd403c6402904a6593" studio="Polydor" type="album" title="Gold: Greatest Hits" parentKey="/library/metadata/218548" parentTitle="ABBA" summary="ABBA's 19-song Gold collection was the first hits compilation prepared specifically for the CD format by the 1970s supergroup, and, appearing after a period of several years in which their music had been off the market, was a welcome addition to the catalog. It is still the simplest and most straightforward collection of the group's material that it is possible to buy. \~ Bruce Eder" index="1" rating="10.0" lastViewedAt="1646942889" year="1992" thumb="/library/metadata/218549/thumb/1685475601" art="/library/metadata/218548/art/1685475583" parentThumb="/library/metadata/218548/thumb/1685475583" originallyAvailableAt="1992-09-21" addedAt="1598373482" updatedAt="1685475601" loudnessAnalysisVersion="2" musicAnalysisVersion="1"\>
\<Genre tag="Pop/Rock" /\>
\</Directory\>
...
\</MediaContainer\>
```
The XML returned provides a list of the all the albums associated with a music artist that are available on the Plex server. The root is the `MediaContainer` element. This element contains a few attributes that provide overall information about the albums on the server.
MediaContainer Attributes|Attribute|Description|
|size|The number of albums.|
|allowSync|1 - allow syncing content.
0 - don't allow syncing content.|
|art|Background artwork used to represent the album.|
|identifier|The type of item.|
|librarySectionID|The unique key associated with the library.|
|librarySectionTitle|The title of the library.|
|librarySectionUUID|Unique GUID identifier for the library.|
|mediaTagPrefix|Prefix for the media tag.|
|mediaTagVersion|Media tag version.
**Note:** This could be a date and time value.|
|nocache|1 - cache the library.
0 - do not cache the library.|
|thumb|The thumbnail for the album.|
|title1|The title of the album.
**Note:** This appears to be internally created, and can't be changed by the server owner.|
|title2|A descriptive title for the album.|
|viewGroup|The group type used to view the album.|
|viewMode|Unknown integer value.|
Within the `MediaContainer` there are one or more `Directory` child elements. Each `Directory` element represents one album available on the Plex server.
Directory Attributes|Attribute|Description|
|ratingKey|A key associated with the album.|
|key|The relative URL of the information for the album.|
|parentRatingKey|A key associated with the artist.|
|guid|The unique identifier for the album.|
|parentGuid|The unique identifier associated with the artist.|
|studio|The name of the studio that created the album.|
|type|The type of item represented by this `Directory` element.|
|title|The name of the album.|
|parentKey|The key associated with the artist.|
|parentTitle|The title associated with the artist.|
|summary|Information about the album.|
|index|Unknown.|
|rating|The rating for the album.|
|lastViewedAt|The date and time the album was last viewed.|
|year|The year the album was released.|
|thumb|The thumbnail for the album.|
|art|The background artwork used to represent the album.|
|parentThumb|The studio associated with the artist.|
|originallyAvailableAt|The original release date of the album.|
|addedAt|The date and time the album was added to the library.|
|updatedAt|The date and time the album was updated in the library.|
|loudnessAnalysisVersion|The version of the loudness analyzer used.|
|musicAnalysisVersion|The version of the music analyzer used.|
Also within the `Directory` element there are one or more `Genre` child elements that describes the genre of the albums. .
Within each of these child elements is a single `tag` attribute that provides the information for the element.
Genre Attributes|Attribute|Description|
|tag|A genre of the album.|
If the `include\_guids` parameter was specified with the value of 1, then there would be a `Guid` element for each online metadata service associated with the item.
## Filtering
To reduce the number of items returned, you can filter the API response to only return items that meet a specific criteria.
For more information, check out the [Filter](/plex-media-server/api/filter/) page.
The results from this endpoint can be filtered by adding the following optional parameters to the request:
Filter Parameters|Parameter|Description|
|addedAt|Gets all the albums that were added based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. The value is in [epoch time](https://en.wikipedia.org/wiki/Unix_time).|
|lastViewedAt|Gets all the albums that were last viewed based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. The value is in [epoch time](https://en.wikipedia.org/wiki/Unix_time).|
|originallyAvailableAt|Gets all the albums that match were originally available time based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. Must be in the format YYYY or YYY-MM-DD.|
|rating|Gets all the albums that match the rating based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error.|
|studio|Will match any part of the studio name. The value provide is not case-sensitive.|
|title|Will match any part of the album title. The value provide is not case-sensitive.|
|updatedAt|Gets all the albums that were updated based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error. The value is in [epoch time](https://en.wikipedia.org/wiki/Unix_time).|
|year|Gets all the albums that were released in a specific year(s) based on the condition. Can use different conditions: equals (=), less than and equals (\<=), greater and equals (\>=). There must be an equals sign or the response will be a `400 Bad Request` error.|
## Examples
curl Python Powershell
```
curl -X GET http://{ip\_address}:32400/library/sections/{library\_id/all?artist.id={artist\_id}&type=9&X-Plex-Token={plex\_token}
```
```
import requests
plex\_url = http://{ip\_address}:32400/library/sections/{library\_id/all?artist.id={artist\_id}&type=9&X-Plex-Token={plex\_token}
response = requests.get(plex\_url)
print(response.text)
```
```
$response = Invoke-RestMethod 'http://{ip\_address}:32400/library/sections/{library\_id/all?artist.id={artist\_id}&type=9&X-Plex-Token={plex\_token}' -Method GET
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
[Get All Music Artists](https://www.plexopedia.com/plex-media-server/api/library/music/) Get All Music Albums for an Artist [Get All Tracks for a Music Album](https://www.plexopedia.com/plex-media-server/api/library/music-albums-tracks/) [Update Music Artist Details Using Match](https://www.plexopedia.com/plex-media-server/api/library/music-artist-update-match/) [Update Music Album Details Using Match](https://www.plexopedia.com/plex-media-server/api/library/music-album-update-match/)
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