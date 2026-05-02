Plex API: Perform Search - Plexopedia
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
This API command performs a search across all libraries or within a single library. The response is grouped by type.
This command will perform spell checking, looking for partial matches and orders the hubs based on the quality of results.
It will also return related matches, such as returning movies for a genre that is a match for the search query.
## URL
```
GET http://{ip\_address}:32400/hubs/search/?X-Plex-Token={plex\_token}&query={query\_string}&limit={limit}&sectionId={id}
```
### Parameters
|Name|Description|
|ip\_address|The IP address of the Plex Media server.|
|plex\_token|The [Plex token](https://www.plexopedia.com/plex-media-server/general/plex-token/).|
|query\_string|The query term used to perform the search.|
|limit\_number|(Optional) The number of items to return for each hub.
Default: 3.|
|id|(Optional) Provides context to the search. Can result in re-ordering of the search result hubs.|
## Return Status
|HTTP Code|Description|
|200|Success - The request was successful.|
|401|Unauthorized - The Plex token provided was not valid.|
## Response
XML string value that contains all the items in the Plex server that match the search criteria. The items are grouped into hubs. An example of the XML is shown below:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="17"\>
\<Hub title="Movies" type="movie" hubIdentifier="movie" context="" size="3" more="0" style="shelf"\>
\<Video librarySectionTitle="Movies" score="0.53091" ratingKey="217346" key="/library/metadata/217346" guid="plex://movie/5d776829151a60001f24b3db" studio="Marvel Studios" type="movie" title="Iron Man" titleSort="Iron Man 01" librarySectionID="2" librarySectionKey="/library/sections/2" contentRating="PG-13" summary="After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil." rating="9.4" audienceRating="9.1" year="2008" tagline="Heroes aren't born. They're built." thumb="/library/metadata/217346/thumb/1683272336" art="/library/metadata/217346/art/1683272336" duration="7561717" originallyAvailableAt="2008-04-30" addedAt="1577944931" updatedAt="1683272336" audienceRatingImage="rottentomatoes://image.rating.upright" chapterSource="media" primaryExtraKey="/library/metadata/283491" ratingImage="rottentomatoes://image.rating.ripe"\>
\<Media id="276669" duration="7561717" bitrate="9682" width="1920" height="800" aspectRatio="2.35" audioChannels="6" audioCodec="ac3" videoCodec="h264" videoResolution="1080" container="mkv" videoFrameRate="24p" videoProfile="high"\>
\<Part id="276999" key="/library/parts/276999/1577940796/file.mkv" duration="7561717" file="M:\\Media\\Movies\\Iron Man (2008)\\Iron Man (2008) [1080p h.264][AAC AC3 TrueHD].mkv" size="9220910229" container="mkv" videoProfile="high" /\>
\</Media\>
\<Genre tag="Action" /\>
\<Genre tag="Adventure" /\>
\<Country tag="United States of America" /\>
\<Collection tag="Iron Man" /\>
\<Collection tag="Marvel Universe" /\>
\<Director tag="Jon Favreau" /\>
\<Writer tag="Stan Lee" /\>
\<Writer tag="Jack Kirby" /\>
\<Role tag="Robert Downey Jr." /\>
\<Role tag="Terrence Howard" /\>
\<Role tag="Jeff Bridges" /\>
\</Video\>
...
\</Hub\>
\<Hub title="Tracks" type="track" hubIdentifier="track" context="" size="3" more="0" style="shelf"\>
\<Track librarySectionTitle="iTunes" score="0.51000" ratingKey="56064" key="/library/metadata/56064" parentRatingKey="56059" grandparentRatingKey="56058" guid="plex://track/5d07e974403c640290b5e79d" parentGuid="plex://album/5d07c8b5403c640290c202bd" grandparentGuid="plex://artist/5d07bbfc403c6402904a5ed1" parentStudio="Island" type="track" title="Iris (Hold Me Close)" grandparentKey="/library/metadata/56058" parentKey="/library/metadata/56059" librarySectionID="9" librarySectionKey="/library/sections/9" grandparentTitle="U2" parentTitle="Songs of Innocence" summary="" index="5" parentIndex="1" ratingCount="83418" parentYear="2014" thumb="/library/metadata/56059/thumb/1679377162" art="/library/metadata/56058/art/1683272264" parentThumb="/library/metadata/56059/thumb/1679377162" grandparentThumb="/library/metadata/56058/thumb/1683272264" grandparentArt="/library/metadata/56058/art/1683272264" duration="319506" addedAt="1430698153" updatedAt="1681987327"\>
\<Media id="57782" duration="319506" bitrate="264" audioChannels="2" audioCodec="aac" container="mp4" optimizedForStreaming="1" audioProfile="lc" has64bitOffsets="0"\>
\<Part id="57885" key="/library/parts/57885/1430698153/file.m4a" duration="319506" file="M:\\Media\\Music - iTunes\\Music\\U2\\Songs of Innocence\\05 Iris (Hold Me Close).m4a" size="11149865" audioProfile="lc" container="mp4" has64bitOffsets="0" hasThumbnail="1" optimizedForStreaming="1" /\>
\</Media\>
\</Track\>
...
\</Hub\>
\<Hub title="Actors" type="actor" hubIdentifier="actor" context="" size="3" more="0" style="shelf"\>
\<Directory key="/library/sections/2/all?actor=69641" librarySectionID="2" librarySectionKey="/library/sections/2" librarySectionTitle="Movies" librarySectionType="1" reason="section" reasonID="2" reasonTitle="Movies" score="0.52000" type="tag" id="69641" filter="actor=69641" tag="Irrfan Khan" tagType="6" thumb="https://metadata-static.plex.tv/2/people/276d97a28b83ff87efe20150f0c18e2a.jpg" count="3" /\>
\<Directory key="/library/sections/2/all?actor=68002" librarySectionID="2" librarySectionKey="/library/sections/2" librarySectionTitle="Movies" librarySectionType="1" reason="section" reasonID="2" reasonTitle="Movies" score="0.52000" type="tag" id="68002" filter="actor=68002" tag="Irving Bacon" tagType="6" thumb="https://metadata-static.plex.tv/people/5d7768274de0ee001fcc88ec.jpg" count="2" /\>
...
\</MediaContainer\>
```
The XML returned provides a list of the all items on the Plex server that match the search criteria. The root is the `MediaContainer` element. This element only contains the `size` attribute that indicates the total number of hubs returned.
MediaContainer Attributes|Attribute|Description|
|size|The number of hubs.|
Within the `MediaContainer` there are many `ViHubdeo` child elements. Each `Hub` element represents hub group containing items that match the query.
Context Attributes|Attribute|Description|
|title|The title of the hub.|
|type|The type of items in the hub.|
|hubIdentifier|The identifier of the hub.|
|context|The context of the hub.|
|size|The number of items in the hub.|
|more|Number of additional items in the hub.|
|style|How the items in the hub will be displayed.|
A `hub` element can contain various child elements. The child elements depends on what the type of item the `hub` element contains. The next few sections will detail the various information that a `hub` element can contains.
Within the `Hub` there can be none or multiple `Video` child elements. Each `Video` element represents one video available on the Plex server.
Video Attributes|Attribute|Description|
|librarySectionTitle|The name of the library section where the item is located.|
|score|The score value.|
|ratingKey|A key associated with the item.|
|key|The relative URL of the item information.|
|guid|The unique identifier comprised of the Plex agent and item identifier for the agent.|
|studio|The name of the item studio.|
|type|The type of media.|
|title|The title of the item.|
|titleSort|The title of the item used to sort the items in a collection or list.|
|librarySectionID|The ID of the library section.|
|librarySectionKey|The relative URL of the library section.|
|contentRating|The content rating associated with the item.|
|summary|A summary of the item.|
|rating|The rating for the item.|
|audienceRating|The audience rating for the item.|
|year|The year the item was released.|
|tagline|The tagline associated with the item.|
|thumb|The thumbnail for the item.|
|art|The background artwork used to represent the item.|
|duration|The length of the item in milliseconds.|
|originallyAvailableAt|The original release date of the item.|
|addedAt|The date and time, in [Unix time](https://en.wikipedia.org/wiki/Unix_time), the item was added to the library.|
|updatedAt|The date and time in [epoch time](https://en.wikipedia.org/wiki/Unix_time), the item was updated in the library.|
|audienceRatingImage|The image associated with the audience rating.|
|chapterSource|The chapter source type.|
|primaryExtraKey|The extra key value.|
|ratingImage|The image associated with the rating.|
Within the `Video` there are one or more `Media` child elements. Each `Media` element represents one media file of the movie available on the Plex server.
If there are two media files associated with the movie, such as a 1080p and 480p version, then there would be two `Media` child elements in the `Video` element.
Media Attributes|Attribute|Description|
|id|Unique ID associated with the item.|
|duration|The length of the item in milliseconds.|
|bitrate|The bitrate of the item.|
|width|The width of the item.|
|height|The height of the item.|
|aspectRatio|The aspect ratio of the item.|
|audioChannels|The number of audio channels.|
|audioCodec|The audio codec used to encode the audio.|
|videoCodec|The video codec used to encode the video.|
|videoResolution|The video resolution.|
|container|The item container.|
|videoFrameRate|The framerate standard used for the video.|
|videoProfile|The video profile of the media.|
Within the `Media` there are one or more `Part` child elements. Each `Part` element represents one part of the movie. If the movie has been added to the Plex server as a multi-part movie, then each of those parts will be represented by one `Part` child element.
Part Attributes|Attribute|Description|
|id|Unique ID associated with the part.|
|key|The unique relative path for the part that is used at its key.|
|duration|The length of the part in milliseconds.|
|file|The file associated with the part.|
|size|The file size of the part.|
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
For music hubs, there is none or multiple `Track` child elements that contain the details about the music items in the hub.
The parent item for the tracks refers to the album that includes the track.
Track Attributes|Attribute|Description|
|librarySectionTitle|The name of the library section where the track is located.|
|score|The score value.|
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
|optimizedForStreaming|The media item is optimized for streaming.
0 - not optimized, 1 - optimized.|
|audioProfile|The audio profile of the media.|
|has64bitOffsets|The media item contains 64 bit offsets|
Within the `Media` there are one or more `Part` child elements.
Part Attributes|Attribute|Description|
|id|Unique ID associated with the part.|
|key|The unique relative path for the part that is used at its key.|
|duration|The length of the part in milliseconds.|
|file|The file associated with the part.|
|size|The file size of the part.|
|audioProfile|The audio profile associated with the audio part.|
|container|The type of media container.|
|has64bitOffsets|The media item contains 64 bit offsets|
|hasThumbnail|Indicates whether the media item has an associated thumbnail.
0 - doesn't have a thumbnail, 1 - does have a thumbnail.|
|optimizedForStreaming|The media item is optimized for streaming.
0 - not optimized, 1 - optimized.|
## Examples
curl Python Powershell
```
curl -X GET http://{ip\_address}:32400/hubs/search/?X-Plex-Token={plex\_token}&query={query\_string}&limit={limit}&sectionId={id}
```
```
import requests
plex\_url = http://{ip\_address}:32400/hubs/search/?X-Plex-Token={plex\_token}&query={query\_string}&limit={limit}&sectionId={id}
response = requests.get(plex\_url)
print(response.text)
```
```
$response = Invoke-RestMethod 'http://{ip\_address}:32400/hubs/search/?X-Plex-Token={plex\_token}&query={query\_string}&limit={limit}&sectionId={id}' -Method GET
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
[Server Capabilities](https://www.plexopedia.com/plex-media-server/api/server/capabilities/) [Server Identity](https://www.plexopedia.com/plex-media-server/api/server/identity/) [Get Server Preferences](https://www.plexopedia.com/plex-media-server/api/server/preferences/) [Set a Server Preference](https://www.plexopedia.com/plex-media-server/api/server/preference-set/) [Get Server List](https://www.plexopedia.com/plex-media-server/api/server/list/) [Get Accounts](https://www.plexopedia.com/plex-media-server/api/server/accounts/) [Get a Single Account](https://www.plexopedia.com/plex-media-server/api/server/account/) [Get Devices](https://www.plexopedia.com/plex-media-server/api/server/devices/) [Get a Single Device](https://www.plexopedia.com/plex-media-server/api/server/device/) [Get All Activities](https://www.plexopedia.com/plex-media-server/api/server/activities/) [Stop an Activity](https://www.plexopedia.com/plex-media-server/api/server/stop-activity/) [Get Transient Token](https://www.plexopedia.com/plex-media-server/api/server/transient-token/) Perform Search [Listen for Notifications](https://www.plexopedia.com/plex-media-server/api/server/listen-notifications/) [Listen for Events](https://www.plexopedia.com/plex-media-server/api/server/listen-events/) [Check for Updates](https://www.plexopedia.com/plex-media-server/api/server/update-check/) [Get Update Status](https://www.plexopedia.com/plex-media-server/api/server/update-status/)
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