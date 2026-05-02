Plex API: Get Active Sessions - Plexopedia
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
This API command will return information about all the active play sessions happening on the server at the moment. A lot of information is returned by this command, but the content returned is dependent on the type of media and how the media is being played.
If you are looking at providing information to display about what is currently being played, such as displaying the posters of the media, then this command is the one you should use.
## URL
```
GET http://{ip\_address}:32400/status/sessions?X-Plex-Token={plex\_token}
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
XML string value that lists all media being played from the Plex server. An example of the XML returned from the request is shown below for a video being transcoded:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="1"\>
\<Video addedAt="1667839612" art="/library/metadata/286254/art/1667839616" createdAtAccuracy="epoch,local" createdAtTZOffset="0" duration="734166" guid="com.plexapp.agents.none://dcb84084c59465d53f8698a7c75a343a00d1b00f?lang=xn" key="/library/metadata/286254" librarySectionID="14" librarySectionKey="/library/sections/14" librarySectionTitle="Other videos" originallyAvailableAt="2022-11-07" ratingKey="286254" sessionKey="2" skipCount="4" subtype="clip" thumb="/library/metadata/286254/thumb/1667839616" title="tos-1720x720-cfg01" type="movie" updatedAt="1667839616" viewOffset="0" year="2022"\>
\<Media id="350106" videoProfile="main" audioChannels="2" audioCodec="aac" container="mp4" duration="734166" height="720" optimizedForStreaming="1" protocol="dash" videoCodec="h264" videoFrameRate="24p" videoResolution="720p" width="1720" selected="1"\>
\<Part id="350466" videoProfile="main" container="mp4" duration="734166" height="720" optimizedForStreaming="1" protocol="dash" width="1720" decision="transcode" selected="1"\>
\<Stream bitrate="2147483647" codec="h264" default="1" displayTitle="720p (HEVC Main)" extendedDisplayTitle="720p (HEVC Main)" frameRate="24" height="720" id="273542" language="English" languageCode="eng" languageTag="en" streamType="1" width="1720" decision="transcode" location="segments-video" /\>
\<Stream bitrate="256" bitrateMode="cbr" channels="2" codec="aac" default="1" displayTitle="English (AC3 5.1)" extendedDisplayTitle="English (AC3 5.1)" id="273543" language="English" languageCode="eng" languageTag="en" selected="1" streamType="2" decision="transcode" location="segments-audio" /\>
\</Part\>
\</Media\>
\<User id="1" thumb="https://plex.tv/users/64045869dc35e78e/avatar?c=1661361687" title="APlexUser" /\>
\<Player address="127.0.0.1" device="Windows" machineIdentifier="k5y3j33nmvjvd0uhvnd9zi2x" model="bundled" platform="Firefox" platformVersion="108.0" product="Plex Web" profile="Firefox" state="playing" title="Firefox" version="4.87.2" local="1" relayed="0" secure="1" userID="1" /\>
\<Session id="rxiscwekkvkpukgi3pm9nklp" bandwidth="10000000" location="lan" /\>
\<TranscodeSession key="/transcode/sessions/rl42k5xbxdly8rld3itfqq4f" throttled="0" complete="0" progress="5.3000001907348633" size="-22" speed="6.9000000953674316" error="0" duration="734167" remaining="93" context="streaming" sourceVideoCodec="hevc" sourceAudioCodec="ac3" videoDecision="transcode" audioDecision="transcode" protocol="dash" container="mp4" videoCodec="h264" audioCodec="aac" audioChannels="2" transcodeHwRequested="1" transcodeHwEncoding="mf" transcodeHwEncodingTitle="Windows (Media Foundation)" timeStamp="1671053495.3404744" maxOffsetAvailable="39.018666666666668" minOffsetAvailable="0" /\>
\</Video\>
\</MediaContainer\>
```
For comparison, the XML below is for a music track being direct played to a client:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="1"\>
\<Track addedAt="1668524601" art="/library/metadata/286414/art/1670411477" duration="248066" grandparentArt="/library/metadata/286414/art/1670411477" grandparentGuid="plex://artist/5d07bbfc403c6402904a5ed1" grandparentKey="/library/metadata/286414" grandparentRatingKey="286414" grandparentThumb="/library/metadata/286414/thumb/1670411477" grandparentTitle="U2" guid="plex://track/5d07cdb1403c640290f49f0a" index="1" key="/library/metadata/286463" lastViewedAt="1668540997" librarySectionID="8" librarySectionKey="/library/sections/8" librarySectionTitle="Music" parentGuid="plex://album/5d07c170403c6402908451be" parentIndex="1" parentKey="/library/metadata/286462" parentRatingKey="286462" parentStudio="Island" parentThumb="/library/metadata/286462/thumb/1670411478" parentTitle="All That You Can’t Leave Behind" parentYear="2000" ratingCount="1138898" ratingKey="286463" sessionKey="3" thumb="/library/metadata/286462/thumb/1670411478" title="Beautiful Day" type="track" updatedAt="1670411478" viewCount="2" viewOffset="0"\>
\<Media audioChannels="2" audioCodec="flac" bitrate="920" container="flac" duration="248066" id="350307" selected="1"\>
\<Part container="flac" duration="248066" file="I:\\Music\\U2\\All That You Can't Leave Behind\\01 Beautiful Day.flac" hasThumbnail="1" id="350700" key="/library/parts/350700/1558059964/file.flac" size="28656120" decision="directplay" selected="1"\>
\<Stream albumGain="-9.50" albumPeak="1.000000" albumRange="8.879813" audioChannelLayout="stereo" bitDepth="16" bitrate="920" channels="2" codec="flac" displayTitle="FLAC (Stereo)" extendedDisplayTitle="FLAC (Stereo)" gain="-9.50" id="273905" index="0" loudness="-9.23" lra="9.68" peak="1.000000" samplingRate="44100" selected="1" streamType="2" location="direct" /\>
\</Part\>
\</Media\>
\<Mood filter="mood=32718" id="32718" tag="Lively" /\>
\<Mood filter="mood=32079" id="32079" tag="Energetic" /\>
\<Mood filter="mood=2362" id="2362" tag="Confident" /\>
\<Mood filter="mood=2619" id="2619" tag="Exuberant" /\>
\<Mood filter="mood=32078" id="32078" tag="Passionate" /\>
\<User id="1" thumb="https://plex.tv/users/64045869dc35e78e/avatar?c=1661361687" title="APlexUser" /\>
\<Player address="127.0.0.1" device="Windows" machineIdentifier="k5y3j33nmvjvd0uhvnd9zi2x" model="bundled" platform="Firefox" platformVersion="108.0" product="Plex Web" profile="Firefox" state="playing" title="Firefox" version="4.87.2" local="1" relayed="0" secure="1" userID="1" /\>
\<Session id="rxiscwekkvkpukgi3pm9nklp" bandwidth="990" location="lan" /\>
\</Track\>
\</MediaContainer\>
```
## Remarks
The XML returned provides a list of the active play sessions currently on the Plex server. The root is the `MediaContainer` element. This element contains one attribute that provide a count of the number of items being played from the server.
MediaContainer Attributes for Plex Devices|Attribute|Description|
|size|The number of media items being played from the Plex server.|
Within the `MediaContainer` there different elements dependent on the type of media being played. There are also elements that indicate the user playing the media and their player. Information about the play session is also provided along with information related to the media, such as the transcode data.
The XML returned will be unique to the play sessions, so it would be difficult to provide a complete listing of all possible XML elements and attributes. Some common elements include the following:
Play Session Elements|Element|Description|
|Video|Complete information on the video being played, including metadata information, the video specifications, and the video and audio streams.|
|Track|Complete information on the music track being played, which also include the audio stream information.|
|User|Information about the user playing the media item.|
|Player|Information about the client playing the media item.|
|Session|Prefix for the media tag.|
|TranscodeSession|If the media item is being transcoded, information about the transcoding, including the transcoding formats is returned.|
|Mood|This one is displayed for music tracks, and could be related to the type of music. There are multiple `Mood` elements returned.|
If there are no active play sessions, only the `MediaContainer` element is returned with the `size` attribute equal to zero.
## Examples
curl Python Powershell
```
curl -X GET http://{ip\_address}:32400/status/sessions?X-Plex-Token={plex\_token}
```
```
import requests
plex\_url = http://{ip\_address}:32400/status/sessions?X-Plex-Token={plex\_token}
response = requests.get(plex\_url)
print(response.text)
```
```
$response = Invoke-RestMethod 'http://{ip\_address}:32400/status/sessions?X-Plex-Token={plex\_token}' -Method GET
Write-Output $response
```
## Script examples
Below are a list of post and articles that provide an example that use this API endpoint:
* [How to Stop a Transcode Session Automatically](https://www.plexopedia.com/blog/stop-transcode-session-automatically/)
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
Get Active Sessions [Get Transcode Sessions](https://www.plexopedia.com/plex-media-server/api/server/transcode-sessions/) [Terminate a Session](https://www.plexopedia.com/plex-media-server/api/server/session-terminate/) [Terminate a Transcode Session](https://www.plexopedia.com/plex-media-server/api/server/session-transcode-terminate/) [Get Session History](https://www.plexopedia.com/plex-media-server/api/server/session-history/)
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