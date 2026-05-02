Plex API: Get Libraries - Plexopedia
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
A Plex server can have many [different libraries setup for various media](/plex-media-server/general/add-library/). You can easily retrieve the information about all libraries that are available on a Plex server using this API command.
## URL
```
GET http://{ip\_address}:32400/library/sections/?X-Plex-Token={plex\_token}
```
### Parameters
|Name|Description|
|ip\_address|The IP address of the Plex Media server.|
|plex\_token|The [Plex token](https://www.plexopedia.com/plex-media-server/general/plex-token/).|
## Return Status
|HTTP Code|Description|
|200|Success - The request was successful.|
|401|Unauthorized - The Plex token provided was not valid.|
## Response
XML string value that lists the libraries that have been created on the Plex server. An example of the XML returned from the request is shown below:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="4" allowSync="0" identifier="com.plexapp.plugins.library" mediaTagPrefix="/system/bundle/media/flags/" mediaTagVersion="1638961228" title1="Plex Library"\>
\<Directory allowSync="1" art="/:/resources/movie-fanart.jpg" composite="/library/sections/2/composite/1640879224" filters="1" refreshing="0" thumb="/:/resources/movie.png" key="2" type="movie" title="Movies" agent="com.plexapp.agents.imdb" scanner="Plex Movie Scanner" language="en" uuid="493a64e7-b541-4667-b050-d702beebf2f6" updatedAt="1595491662" createdAt="1419621957" scannedAt="1640879224" content="1" directory="1" contentChangedAt="87188911" hidden="0"\>
\<Location id="9" path="M:\\Media\\Movies" /\>
\</Directory\>
\<Directory allowSync="1" art="/:/resources/show-fanart.jpg" composite="/library/sections/4/composite/1640879304" filters="1" refreshing="0" thumb="/:/resources/show.png" key="4" type="show" title="TV Shows" agent="com.plexapp.agents.thetvdb" scanner="Plex Series Scanner" language="en" uuid="3bbbe6f7-628f-4983-ae5d-7c05779c4c28" updatedAt="1595493250" createdAt="1419642504" scannedAt="1640879304" content="1" directory="1" contentChangedAt="5613493" hidden="0"\>
\<Location id="11" path="M:\\Media\\TV Shows" /\>
\</Directory\>
\<Directory allowSync="1" art="/:/resources/artist-fanart.jpg" composite="/library/sections/8/composite/1640879225" filters="1" refreshing="0" thumb="/:/resources/artist.png" key="8" type="artist" title="Music" agent="tv.plex.agents.music" scanner="Plex Music" language="en" uuid="b6031749-2969-4027-afee-64172b72b77d" updatedAt="1598392667" createdAt="1430573735" scannedAt="1640879225" content="1" directory="1" contentChangedAt="59913170" hidden="0"\>
\<Location id="16" path="M:\\Media\\Music" /\>
\</Directory\>
\<Directory allowSync="1" art="/:/resources/photo-fanart.jpg" composite="/library/sections/1/composite/1640879303" filters="1" refreshing="0" thumb="/:/resources/photo.png" key="1" type="photo" title="Photos" agent="com.plexapp.agents.none" scanner="Plex Photo Scanner" language="xn" uuid="fc948ea9-3fad-45e2-99ef-b461b2d746d2" updatedAt="1600821139" createdAt="1419611117" scannedAt="1640879303" enableAutoPhotoTags="0" content="1" directory="1" contentChangedAt="115673999" hidden="0"\>
\<Location id="10" path="M:\\Media\\Pictures" /\>
\</Directory\>
\</MediaContainer\>
```
The XML returned provides a list of the libraries that are available on the Plex server. The root is the `MediaContainer` element. This element contains a few attributes that provide overall information about the libraries on the server.
MediaContainer Attributes|Attribute|Description|
|size|The number of libraries.|
|allowSync|1 - allow syncing content.
0 - don't allow syncing content.|
|identifier|The type of item.|
|mediaTagPrefix|Prefix for the media tag.|
|mediaTagVersion|Media tag version.
**Note:** This could be a date and time value.|
|title1|The title of the library.
**Note:** This appears to be internally created, and can't be changed by the server owner.|
Within the `MediaContainer` there are one or more `Directory` child elements. Each `Directory` element represents one library on the Plex server.
Directory Attributes|Attribute|Description|
|allowSync|1 - allow the items in the to be synced.
0 - do not allow the items in the library to be synced.|
|art|The background artwork used to represent the library.|
|composite|The composite image associated with the library.|
|filters|1 - allow library filters.
0 - do no allow library filters.|
|refreshing|1 - the library is refreshing the metadata.
0 - the library is not refreshing the metadata.|
|thumb|The thumbnail for the library.|
|key|The relative URL of the information for the library.|
|type|The type of item represented by this `Directory` element.|
|title|The name of the library.|
|agent|The agent used to set the metadata for the items in the library.|
|scanner|The name of the scanner used to scan the library.|
|language|The two-character language for the library.|
|uuid|Unique identifier for the library.|
|updatedAt|The date and time the library was updated in the library.|
|createdAt|The date and time when the library was created.|
|scannedAt|The date and time when the library was last scanned.|
|content|Unknown.|
|directory|Unknown.|
|contentChangedAt|The date and time when the library content was last changed.|
|hidden|1 - the library is hidden.
0 - the library is not hidden.|
Within each of the `Directory` elements can be one or more `Location` child elements. These child elements specify the folder path of the files associated with each library.
The attributes of the `Location` elements are:
Location Attributes|Attribute|Description|
|id|Unique integer value used as the location identifier.|
|path|The full path to the folder containing the files for the library. This value was specified when the library was added to the Plex server.|
## Remarks
The Plex authentication token used to make the request will determine what libraries are returned.
If the token used is for a non-administrative user, then the libraries returned will only include the libraries the user can access. Libraries that the user cannot access will not be returned in the XML response.
When using a device Plex token, all libraries will be returned because libraries cannot be restricted for a device, only for users.
## Examples
curl Python Powershell
```
curl -X GET http://{ip\_address}:32400/library/sections/?X-Plex-Token={plex\_token}
```
```
import requests
plex\_url = http://{ip\_address}:32400/library/sections/?X-Plex-Token={plex\_token}
response = requests.get(plex\_url)
print(response.text)
```
```
$response = Invoke-RestMethod 'http://{ip\_address}:32400/library/sections/?X-Plex-Token={plex\_token}' -Method GET
Write-Output $response
```
## Script examples
Below are a list of post and articles that provide an example that use this API endpoint:
* [How to Stop Plex from Changing Movie Posters](https://www.plexopedia.com/blog/keep-plex-posters/)
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
Get Libraries [Get Library Details](https://www.plexopedia.com/plex-media-server/api/library/details/) [Add a Library](https://www.plexopedia.com/plex-media-server/api/library/add/) [Delete a Library](https://www.plexopedia.com/plex-media-server/api/server/library-delete/) [Scan All Libraries](https://www.plexopedia.com/plex-media-server/api/library/scan/) [Scan a Single Library](https://www.plexopedia.com/plex-media-server/api/library/scan-single/) [Scan a Partial Library](https://www.plexopedia.com/plex-media-server/api/library/scan-partial/) [Refresh Metadata for a Library](https://www.plexopedia.com/plex-media-server/api/library/refresh-metadata/)
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