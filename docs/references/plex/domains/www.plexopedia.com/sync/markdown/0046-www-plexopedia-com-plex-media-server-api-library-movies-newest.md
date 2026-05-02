Plex API: Get Newest Movies - Plexopedia
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
A library, such as movies or TV shows, can contain many items. This API command will return information about movies by the order in which they were released. The order of the movies is the newest to the oldest.
## URL
```
GET http://{ip\_address}:32400/library/sections/{id}/newest?X-Plex-Token={plex\_token}
```
### Parameters
|Name|Description|
|ip\_address|The IP address of the Plex Media server.|
|plex\_token|The [Plex token](https://www.plexopedia.com/plex-media-server/general/plex-token/).|
|id|The key associated with a movies library. This key can be found by calling the [Libraries API command](/plex-media-server/api/server/libraries/) and looking for a movies library.|
## Return Status
|HTTP Code|Description|
|200|Success - The request was successful.|
|401|Unauthorized - The Plex token provided was not valid.|
## Response
XML string value that lists the all the movies in the library. An example of the XML returned from the request is shown below:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="42" allowSync="1" art="/:/resources/movie-fanart.jpg" identifier="com.plexapp.plugins.library" librarySectionID="2" librarySectionTitle="Movies" librarySectionUUID="493a64e7-b541-4667-b050-d702beebf2f6" mediaTagPrefix="/system/bundle/media/flags/" mediaTagVersion="1675127862" sortAsc="1" thumb="/:/resources/movie.png" title1="Movies" title2="Recently Released" viewGroup="movie" viewMode="131624"\>
\<Video ratingKey="217704" key="/library/metadata/217704" guid="plex://movie/5d7769ff47dd6e001f6cd584" studio="Lucasfilm Ltd." type="movie" title="Star Wars: Episode IX - The Rise of Skywalker" titleSort="Star Wars 09" contentRating="PG-13" summary="In the riveting conclusion of the landmark Skywalker saga, new legends will be born-and the final battle for freedom is yet to come." rating="5.2" audienceRating="8.6" viewCount="1" lastViewedAt="1611698558" year="2019" tagline="Every generation has a legend" thumb="/library/metadata/217704/thumb/1675422252" art="/library/metadata/217704/art/1675422252" duration="8513034" originallyAvailableAt="2019-12-18" addedAt="1586033313" updatedAt="1675422252" audienceRatingImage="rottentomatoes://image.rating.upright" chapterSource="media" primaryExtraKey="/library/metadata/284375" ratingImage="rottentomatoes://image.rating.rotten"\>
\<Media id="277001" duration="8513034" bitrate="13574" width="1920" height="804" aspectRatio="2.35" audioChannels="8" audioCodec="dca-ma" videoCodec="h264" videoResolution="1080" container="mkv" videoFrameRate="24p" audioProfile="ma" videoProfile="high" title="Original"\>
\<Part id="277331" key="/library/parts/277331/1585988083/file.mkv" duration="8513034" file="M:\\Media\\Movies\\Star Wars - Episode 9 (2019)\\Star Wars - Episode 9 (2019) [1080p h.264][AAC DTS DTS-HD].mkv" size="14460683991" audioProfile="ma" container="mkv" videoProfile="high" /\>
\</Media\>
\<Media id="277002" duration="8513054" bitrate="8960" width="1920" height="804" aspectRatio="2.35" audioChannels="6" audioCodec="aac" videoCodec="h264" videoResolution="1080" container="mp4" videoFrameRate="24p" optimizedForStreaming="1" proxyType="42" audioProfile="lc" has64bitOffsets="1" target="Optimized for TV" targetTagID="6208" videoProfile="high" title="Optimized for TV"\>
\<Part id="277332" key="/library/parts/277332/1586041096/file.mp4" duration="8513054" file="M:\\Media\\Movies\\Star Wars - Episode 9 (2019)\\Plex Versions\\Optimized for TV\\Star Wars\_ The Rise of Skywalker (2019).mp4" size="9555743604" audioProfile="lc" container="mp4" has64bitOffsets="1" optimizedForStreaming="1" videoProfile="high" /\>
\</Media\>
\<Media id="277003" duration="8513054" bitrate="3122" width="1280" height="536" aspectRatio="2.35" audioChannels="2" audioCodec="aac" videoCodec="h264" videoResolution="720" container="mp4" videoFrameRate="24p" optimizedForStreaming="1" proxyType="42" audioProfile="lc" has64bitOffsets="0" target="Optimized for Mobile" targetTagID="6207" videoProfile="high" title="Optimized for Mobile"\>
\<Part id="277333" key="/library/parts/277333/1586044380/file.mp4" duration="8513054" file="M:\\Media\\Movies\\Star Wars - Episode 9 (2019)\\Plex Versions\\Optimized for Mobile\\Star Wars\_ The Rise of Skywalker (2019).mp4" size="3338774672" audioProfile="lc" container="mp4" has64bitOffsets="0" optimizedForStreaming="1" videoProfile="high" /\>
\</Media\>
\<Genre tag="Action" /\>
\<Genre tag="Adventure" /\>
\<Director tag="J.J. Abrams" /\>
\<Writer tag="George Lucas" /\>
\<Writer tag="J.J. Abrams" /\>
\<Country tag="United States of America" /\>
\<Collection tag="Star Wars" /\>
\<Role tag="Carrie Fisher" /\>
\<Role tag="Mark Hamill" /\>
\<Role tag="Daisy Ridley" /\>
\</Video\>
\<Video ratingKey="214970" key="/library/metadata/214970" guid="plex://movie/5d776cca7a53e9001e74c43f" studio="Vertigo Entertainment" type="movie" title="The Lego Movie 2: The Second Part" titleSort="Lego 02" contentRating="PG" summary="It's been five years since everything was awesome and the citizens are facing a huge new threat: Lego Duplo invaders from outer space, wrecking everything faster than they can rebuild." rating="8.4" audienceRating="6.8" year="2019" tagline="They come in pieces" thumb="/library/metadata/214970/thumb/1675422250" art="/library/metadata/214970/art/1675422250" duration="6429493" originallyAvailableAt="2019-02-06" addedAt="1561007022" updatedAt="1675422250" audienceRatingImage="rottentomatoes://image.rating.upright" chapterSource="media" primaryExtraKey="/library/metadata/283682" ratingImage="rottentomatoes://image.rating.ripe"\>
\<Media id="274316" duration="6429493" bitrate="6541" width="1920" height="804" aspectRatio="2.35" audioChannels="6" audioCodec="ac3" videoCodec="h264" videoResolution="1080" container="mkv" videoFrameRate="24p" videoProfile="high" title="Original"\>
\<Part id="274646" key="/library/parts/274646/1561004040/file.mkv" duration="6429493" file="M:\\Media\\Movies\\The Lego Movie 2 The Second Part (2019)\\The Lego Movie 2 The Second Part [1080p h.264][AAC AC3 DTS-HD].mkv" size="5265626703" container="mkv" videoProfile="high" /\>
\</Media\>
\<Media id="274317" duration="6429492" bitrate="4966" width="1920" height="804" aspectRatio="2.35" audioChannels="6" audioCodec="ac3" videoCodec="h264" videoResolution="1080" container="mp4" videoFrameRate="24p" optimizedForStreaming="1" proxyType="42" has64bitOffsets="0" target="Optimized for TV" targetTagID="6208" videoProfile="high" title="Optimized for TV"\>
\<Part id="274647" key="/library/parts/274647/1561167430/file.mp4" duration="6429492" file="M:\\Media\\Movies\\The Lego Movie 2 The Second Part (2019)\\Plex Versions\\Optimized for TV\\The Lego Movie 2\_ The Second Part (2019).mp4" size="4002185893" container="mp4" has64bitOffsets="0" optimizedForStreaming="1" videoProfile="high" /\>
\</Media\>
\<Genre tag="Family" /\>
\<Genre tag="Science Fiction" /\>
\<Director tag="Mike Mitchell" /\>
\<Writer tag="Bob Kane" /\>
\<Writer tag="Jerry Siegel" /\>
\<Country tag="Australia" /\>
\<Country tag="United States of America" /\>
\<Collection tag="Lego" /\>
\<Role tag="Chris Pratt" /\>
\<Role tag="Elizabeth Banks" /\>
\<Role tag="Will Arnett" /\>
\</Video\>
...
\</MediaContainer\>
```
The XML returned provides a list of the all movies in a library that are available on the Plex server. The root is the `MediaContainer` element. This element contains a few attributes that provide overall information about the movies on the server.
MediaContainer Attributes|Attribute|Description|
|size|The number of libraries.|
|allowSync|1 - allow syncing content.
0 - don't allow syncing content.|
|art|Background artwork used to represent the library.|
|identifier|The type of item.|
|librarySectionID|The unique key associated with the library.|
|librarySectionTitle|The title of the library.|
|librarySectionUUID|Unique GUID identifier for the library.|
|mediaTagPrefix|Prefix for the media tag.|
|mediaTagVersion|Media tag version.
**Note:** This could be a date and time value.|
|sortAsc|1 - the library is sorted in ascending order.
0 - the library is sorted in descending order.|
|thumb|The thumbnail for the library.|
|title1|The title of the library.
**Note:** This appears to be internally created, and can't be changed by the server owner.|
|title2|A descriptive title for the library.|
|viewGroup|The group type used to view the library.|
|viewMode|Unknown integer value.|
Within the `MediaContainer` there are one or more `Video` child elements. Each `Video` element represents one movie available on the Plex server.
Video Attributes|Attribute|Description|
|ratingKey|A key associated with the item.|
|key|The relative URL of the item information.|
|guid|The unique identifier comprised of the Plex agent and item identifier for the agent.|
|studio|The name of the item studio.|
|type|The type of media.|
|title|The title of the item.|
|contentRating|The content rating associated with the item.|
|summary|A summary of the item.|
|rating|The rating for the item.|
|audienceRating|The audience rating for the item.|
|skipCount|The skip count.|
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
|audioProfile|The audio profile of the media.|
|videoProfile|The video profile of the media.|
|title|The title of the item.|
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
## Examples
curl Python Powershell
```
curl -X GET http://{ip\_address}:32400/library/sections/{id}/newest?X-Plex-Token={plex\_token}
```
```
import requests
plex\_url = http://{ip\_address}:32400/library/sections/{id}/newest?X-Plex-Token={plex\_token}
response = requests.get(plex\_url)
print(response.text)
```
```
$response = Invoke-RestMethod 'http://{ip\_address}:32400/library/sections/{id}/newest?X-Plex-Token={plex\_token}' -Method GET
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
[Get All Movies](https://www.plexopedia.com/plex-media-server/api/library/movies/) [Get a Movie](https://www.plexopedia.com/plex-media-server/api/library/movie/) [Update a Movie](https://www.plexopedia.com/plex-media-server/api/library/movie-update/) [Update a Movie Using Match](https://www.plexopedia.com/plex-media-server/api/library/movie-update-match/) [Delete a Movie](https://www.plexopedia.com/plex-media-server/api/library/movie-delete/) Get Newest Movies [Get Recently Added Movies](https://www.plexopedia.com/plex-media-server/api/library/movies-recently-added/) [Get Recently Viewed Movies](https://www.plexopedia.com/plex-media-server/api/library/movies-recently-viewed/) [Get On Deck Movies](https://www.plexopedia.com/plex-media-server/api/library/movies-on-deck/) [Get All Movies for a Resolution](https://www.plexopedia.com/plex-media-server/api/library/movies-resolution/) [Get All Movies for a Decade](https://www.plexopedia.com/plex-media-server/api/library/movies-decade/) [Get All Unwatched Movies for a User](https://www.plexopedia.com/plex-media-server/api/library/movies-unwatched/) [Get a Movie's Poster](https://www.plexopedia.com/plex-media-server/api/library/movie-poster/) [Get a Movie's Background](https://www.plexopedia.com/plex-media-server/api/library/movie-background/)
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