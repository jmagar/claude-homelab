Plex API: Search for Match - Plexopedia
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
When Plex scans the media files to download the metadata, it searches online for a match. When it finds a match it downloads and displays the metadata.
Sometimes it may not be able to find a match or find an incorrect match. In that situation, you can use the [Match](/plex-media-server/general/fix-match/#unmatched) or [Fix Match](/plex-media-server/general/fix-match/#incorrectmatch) options in Plex to manually match the items.
This API command will have Plex return all the matches it finds for a specific media item.
## URL
```
GET http://{ip\_address}:32400/library/metadata/{id}/matches?manual=1&X-Plex-Token={plex\_token}
```
### Parameters
|Name|Description|
|ip\_address|The IP address of the Plex Media server.|
|plex\_token|The [Plex token](https://www.plexopedia.com/plex-media-server/general/plex-token/).|
|id|The key associated with a media item on the Plex server. This key can be found from the Plex Web App and hovering over the media item and looking for number in the `key` parameter of the URL.|
## Return Status
|HTTP Code|Description|
|200|Success - The request was successful.|
|401|Unauthorized - The Plex token provided was not valid.|
|403|Forbidden - TheID for the media item was not valid.|
## Response
XML string value that returns a list of all the search results for the specified media ID. An example of the XML returned from the request is shown below:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="15" identifier="com.plexapp.plugins.library" mediaTagPrefix="/system/bundle/media/flags/" mediaTagVersion="1682076900"\>
\<SearchResult thumb="https://images.plex.tv/photo?height=336&width=225&minSize=1&upscale=1&url=https%3A%2F%2Fmetadata-static%2Eplex%2Etv%2F2%2Fgracenote%2F2e4e8322b279380ce4f0fe45706afd56%2Ejpg" type="movie" guid="plex://movie/5d776840999c64001ec317ab" name="Persuasion" year="1995" summary="Anne Elliot, the daughter of a financially troubled aristocratic family, is persuaded to break her engagement to Frederick Wentworth, a young sea captain of meager means. Years later, money troubles force Anne's father to rent out the family estate to Admiral Croft, and Anne is again thrown into company with Frederick -- who is now rich, successful, and perhaps still in love with Anne." lifespanEnded="0"\>\</SearchResult\>
\<SearchResult thumb="https://images.plex.tv/photo?height=336&width=225&minSize=1&upscale=1&url=https%3A%2F%2Fm%2Emedia-amazon%2Ecom%2Fimages%2FM%2FMV5BNDI5YWM5YTMtYmY4Zi00OWU0LTg3MjQtZDY3MjlmNTg1NWQ1XkEyXkFqcGdeQXVyMDcxODUzNw%40%40%2E\_V1\_%2Ejpg" type="movie" guid="plex://movie/62f6918557587a76f9549b4d" name="Jane Austen's Persuasion" summary="Theatrical film of Persuasion with Ciaran Hinds & Amanda Root. Directed by Roger Michell." lifespanEnded="0"\>\</SearchResult\>
\<SearchResult thumb="https://images.plex.tv/photo?height=336&width=225&minSize=1&upscale=1&url=https%3A%2F%2Fm%2Emedia-amazon%2Ecom%2Fimages%2FM%2FMV5BYTdhMmEyOGYtZGQyNS00NTZlLWExYTgtZTdlYTIwMmZlYzk2XkEyXkFqcGdeQXVyNjY2MTYyMg%40%40%2E\_V1\_%2Ejpg" type="movie" guid="plex://movie/6242c10be358a5a82815e85f" name="Persuasion" year="1995" summary="A young spinster Englishwoman and the now-successful Navy Captain she was "persuaded" to refuse seven years earlier meet again, while experiencing a reversal of fortunes." lifespanEnded="0"\>\</SearchResult\>
...
\</MediaContainer\>
```
The XML returned provides a brief of the search results for the media item. The search results returned will have fields specific to the tpe of media that was searched.
MediaContainer Attributes|Attribute|Description|
|size|The number of media items.|
|identifier|The type of item.|
|mediaTagPrefix|Prefix for the media tag.|
|mediaTagVersion|Media tag version.
**Note:** This could be a date and time value.|
## Movies
Within the `MediaContainer` there are one or more `SearchResult` child elements. Each `SearchResult` element represents one movie result for the media item.
Search Result Attributes|Attribute|Description|
|thumb|The thumbnail for the movie.|
|type|The type of item represented by this `SearchResult` element.|
|guid|The unique identifier for the movie.|
|name|The name of the movie.|
|year|The year the movie was released.|
|summary|Information about the movie.|
|lifespanEnded|The date the movie ended. 0 for no date|
## TV Show Series
Each TV show series will return one or more `SearchResult` element.
Search Result Attributes|Attribute|Description|
|thumb|The thumbnail for the tv show series.|
|type|The type of item represented by this `SearchResult` element.|
|guid|The unique identifier for the tv show series.|
|name|The name of the tv show series.|
|year|The year the tv show series was released.|
|summary|Information about the tv show series.|
|lifespanEnded|The date the tv show series ended. 0 for no date|
## TV Show Season
A TV show series will also have one or more seasons. If the TV show series matches, then there shouldn't be too much issue with the seasons. A `SearchResult` element would also be returned for a season, although there will usually be only one returned.
Search Result Attributes|Attribute|Description|
|thumb|The thumbnail for the tv show season.|
|type|The type of item represented by this `SearchResult` element.|
|guid|The unique identifier for the tv show season.|
|name|The name of the tv show season.|
|parentName|The name of the TV show series.|
|parentGUID|N/A|
|year|The year the tv show season was released.|
|summary|Information about the tv show season.|
|lifespanEnded|The date the tv show season ended. 0 for no date|
## Music Artist
There could multiple `SearchResult` elements returned when search for a music artist. EAch `SearchResult` will have the following attributes:
Search Result Attributes|Attribute|Description|
|thumb|The thumbnail for the music artist.|
|type|The type of item represented by this `SearchResult` element.|
|guid|The unique identifier for the music artist.|
|name|The name of the music artist.|
|score|The accuracy of the match. 100 is a perfect match.|
|disambiguation|A brief description of the music artist.|
|beginArea|Location where the music artist started.|
|area|Location of the music artist.|
|lifespanBegin|The date the music artist started.|
|lifespanEnded|The date the music artist ended. 0 for no date|
## Music Album
The album for an artist can produce multiple `SearchResult` elements. Within each of the `SearchResult` elements could be a child `SearchResult` element for each track of the album.
Search Result Attributes|Attribute|Description|
|thumb|The thumbnail for the music album.|
|type|The type of item represented by this `SearchResult` element.|
|guid|The unique identifier for the music album.|
|name|The name of the music album.|
|parentName|The name of the music artist.|
|parentGUID|N/A|
|score|The accuracy of the match. 100 is a perfect match.|
|year|The year the music album was released.|
|lifespanEnded|The date the music album ended. 0 for no date|
### Music Album Track
This is the only `SearchResult` child element. Each `SearchResult` element represents one track of an album.
Search Result Attributes|Attribute|Description|
|id|The identifier of the music track.|
|type|The type of item represented by this `SearchResult` element.|
|index|The order of the music track.|
|guid|The unique identifier for the music track.|
|name|The name of the music track.|
|matched|The music track was matched with a media file successfully.|
|lifespanEnded|The date the music track ended. 0 for no date|
## Examples
curl Python Powershell
```
curl -X GET http://{ip\_address}:32400/library/metadata/{id}/matches?manual=1&X-Plex-Token={plex\_token}
```
```
import requests
plex\_url = http://{ip\_address}:32400/library/metadata/{id}/matches?manual=1&X-Plex-Token={plex\_token}
response = requests.get(plex\_url)
print(response.text)
```
```
$response = Invoke-RestMethod 'http://{ip\_address}:32400/library/metadata/{id}/matches?manual=1&X-Plex-Token={plex\_token}' -Method GET
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
[Get Recently Added Media](https://www.plexopedia.com/plex-media-server/api/library/recently-added/) [Mark Item as Watched](https://www.plexopedia.com/plex-media-server/api/library/media-mark-watched/) [Mark Item as Unwatched](https://www.plexopedia.com/plex-media-server/api/library/media-mark-unwatched/) Search for Match [Download Media File](https://www.plexopedia.com/plex-media-server/api/library/download-media-file/) [Update Play Progress](https://www.plexopedia.com/plex-media-server/api/server/update-media-progress/)
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