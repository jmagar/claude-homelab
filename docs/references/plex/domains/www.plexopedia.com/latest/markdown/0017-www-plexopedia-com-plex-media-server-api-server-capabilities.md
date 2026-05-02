Plex API: Server Capabilities - Plexopedia
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
This API command is used to get the capabilities of the Plex Media server. The capabilities returned include such items as the [settings of the Plex server](/plex-media-server/general/hidden-settings/), the [operating system](/plex-media-server/general/operating-system-plex/), and the version of Plex that is installed.
## URL
```
GET http://{ip\_address}:32400/?X-Plex-Token={plex\_token}
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
XML string value that lists the capabilities and settings of the server. An example of the XML returned from the request is shown below:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="25" allowCameraUpload="1" allowChannelAccess="1" allowMediaDeletion="1" allowSharing="1" allowSync="1" allowTuners="1" backgroundProcessing="1" companionProxy="1" countryCode="can" diagnostics="logs,databases,streaminglogs" eventStream="1" friendlyName="PlexServer" hubSearch="1" itemClusters="1" livetv="7" machineIdentifier="3a646027a56abd6dbdf72484464db8567c737430" mediaProviders="1" multiuser="1" musicAnalysis="2" myPlex="1" myPlexMappingState="mapped" myPlexSigninState="ok" myPlexSubscription="1" myPlexUsername="PlexUsername" offlineTranscode="1" ownerFeatures="" photoAutoTag="1" platform="Windows" platformVersion="10.0 (Build 19042)" pluginHost="1" pushNotifications="0" readOnlyLibraries="0" streamingBrainABRVersion="3" streamingBrainVersion="2" sync="1" transcoderActiveVideoSessions="0" transcoderAudio="1" transcoderLyrics="1" transcoderPhoto="1" transcoderSubtitles="1" transcoderVideo="1" transcoderVideoBitrates="64,96,208,320,720,1500,2000,3000,4000,8000,10000,12000,20000" transcoderVideoQualities="0,1,2,3,4,5,6,7,8,9,10,11,12" transcoderVideoResolutions="128,128,160,240,320,480,768,720,720,1080,1080,1080,1080" updatedAt="1640814847" updater="1" version="1.25.2.5319-c43dc0277" voiceSearch="1"\>
\<Directory count="1" key="actions" title="actions" /\>
\<Directory count="1" key="activities" title="activities" /\>
\<Directory count="1" key="butler" title="butler" /\>
\<Directory count="1" key="channels" title="channels" /\>
\<Directory count="1" key="clients" title="clients" /\>
\<Directory count="1" key="devices" title="devices" /\>
\<Directory count="1" key="diagnostics" title="diagnostics" /\>
\<Directory count="1" key="hubs" title="hubs" /\>
\<Directory count="3" key="library" title="library" /\>
\<Directory count="3" key="livetv" title="livetv" /\>
\<Directory count="3" key="media" title="media" /\>
\<Directory count="3" key="metadata" title="metadata" /\>
\<Directory count="1" key="neighborhood" title="neighborhood" /\>
\<Directory count="1" key="playQueues" title="playQueues" /\>
\<Directory count="1" key="player" title="player" /\>
\<Directory count="1" key="playlists" title="playlists" /\>
\<Directory count="1" key="resources" title="resources" /\>
\<Directory count="1" key="search" title="search" /\>
\<Directory count="1" key="server" title="server" /\>
\<Directory count="1" key="servers" title="servers" /\>
\<Directory count="1" key="statistics" title="statistics" /\>
\<Directory count="1" key="system" title="system" /\>
\<Directory count="1" key="transcode" title="transcode" /\>
\<Directory count="1" key="updater" title="updater" /\>
\<Directory count="1" key="user" title="user" /\>
\</MediaContainer\>
```
The XML returned lists the capabilities of the server in the attributes of the `MediaContainer` element. Each attribute corresponds to a specific capability, and the status of that capability. There isn't actual documentation on each attribute, so the list below is a best-guess at what the values represent.
The attribute values correspond to the following:
MediaContainer Attributes|Attribute|Description|
|allowCameraUpload|1 - server allows camera upload.
0 - server does not allow camera upload.|
|allowChannelAccess|1 - server allows channel access.
0 - server does not allow channel access.|
|allowMediaDeletion|1 - server allows media to be deleted.
0 - server does not allow media to be deleted.|
|allowSharing|1 - server allows sharing.
0 - server does not allow sharing.|
|allowSync|1 - allow syncing content.
0 - don't allow syncing content.|
|allowTuners|1 - server supports DVR tuners and antennas.
0 - server does not support DVR tuners and antennas.|
|backgroundProcessing|1 - server allows tasks to be processed in the background.
0 - server does not allow tasks to be processed in the background.|
|companionProxy|1 - a proxy has been defined.
0 - a proxy has not been defined.|
|countryCode|The code of the country where the server is located.|
|diagnostics|List of possible [diagnostic logging](https://www.plexopedia.com/plex-media-server/api/server/download-logs/).|
|eventStream|1 - event streaming is enabled
0 - event streaming is not enabled.|
|friendlyName|The name of the Plex server.|
|hubSearch|1 - [Hub Search](https://www.plex.tv/blog/seek-plex-shall-find-leveling-web-app/) is enabled.
0 - Hub Search is not enabled.|
|itemClusters|Unknown.|
|livetv|Related to Plex being able to stream live TV. The values are unknown.|
|machineIdentifier|Unique identifier for the server.|
|mediaProviders|Unknown.|
|multiuser|1 - multi-user is enabled
0 - multi-user is not enabled.|
|musicAnalysis|Related to analyzing music, but the values are unknown.|
|myPlex|1 - myPlex is enabled on the server
0 - myPlex is not enabled.|
|myPlexMappingState|Indicates the mapping state of the server to the myPlex account.|
|myPlexSigninState|The current sign in state to the myPlex account.|
|myPlexSubscription|1 - server is using an account with a myPlex subscription.
0 - server is using an account without a myPlex subscription.|
|myPlexUsername|Username of the Plex server owner.|
|offlineTranscode|1 - offline [transcode](https://www.plexopedia.com/plex-media-server/general/transcoding/) is enabled.
0 - offline transcode is not enabled.|
|ownerFeatures|List of features allowed by the server owner. This list could be based on the [Plex Pass subscription](https://www.plexopedia.com/plex-media-server/general/plex-pass/).|
|photoAutoTag|1 - photo auto tagging is enabled.
0 - photo auto tagging is disabled.|
|platform|The [operating system](https://www.plexopedia.com/plex-media-server/general/operating-system-plex/) of the server.|
|platformVersion|The version of the operating system.|
|pluginHost|Unknown.|
|pushNotifications|1 - allow the server to send push notifications to mobile devices.
0 - do not allow the server to send push notifications to mobile devices.|
|readOnlyLibraries|1 - the libraries are read-only.
0 - the libraries are not read-only.|
|streamingBrainABRVersion|The current [Streaming Brain](https://www.plex.tv/blog/mcstreamy-brain-take-world-two-easy-steps/) ABR version.|
|streamingBrainVersion|The current [Streaming Brain](https://www.plex.tv/blog/mcstreamy-brain-take-world-two-easy-steps/) version.|
|sync|1 - syncing to a device is enabled.
0 - syncing to a device is disabled.|
|transcoderActiveVideoSessions|The number of [active video transcoding sessions](https://www.plexopedia.com/plex-media-server/api/server/sessions/).|
|transcoderAudio|1 - [audio transcoding](https://www.plexopedia.com/plex-media-server/general/transcoding/) is available.
0 - audio transcoding is not available.|
|transcoderLyrics|1 - lyrics transcoding is available.
0 - lyrics transcoding is not available.|
|transcoderPhoto|1 - photo transcoding is available.
0 - photo transcoding is not available.|
|transcoderSubtitles|1 - subtitle transcoding is available.
0 - subtitle transcoding is not available.|
|transcoderVideo|1 - [video transcoding](https://www.plexopedia.com/plex-media-server/general/transcoding/) is available.
0 - video transcoding is not available.|
|transcoderVideoBitrates|List of supported [transcoding video bitrates](https://www.plexopedia.com/plex-media-server/general/transcoding/).|
|transcoderVideoQualities|List of supported [transcoding video qualities](https://www.plexopedia.com/plex-media-server/general/transcoding/).|
|transcoderVideoResolutions|List of supported [transcoding video resolutions](https://www.plexopedia.com/plex-media-server/general/transcoding/).|
|updatedAt|Date and time of the last server update.|
|updater|1 - Plex updater is enabled
0 - Plex updater is not enabled.|
|version|Current version of Plex.|
|voiceSearch|1 - voice search is enabled.
0 - voice search is disabled.|
Within the `MediaContainer` element there are multiple additional child elements that provide more details about the functions of the server. These child elements are listed using multiple `Directory` elements.
Directory Attributes|Attribute|Description|
|count|The number of functions within this element.|
|key|The relative URL of the information for the function.|
|title|The name of the function.|
## Remarks
The values returned in the XML is dependent on the [Plex token](/plex-media-server/general/plex-token/) used to make the request. Using an [administrative token](/plex-media-server/general/plex-token/#wheretoken) may return values that are different when using a [managed user token](/plex-media-server/general/plex-token/#getalltokens). Using a [device token](/plex-media-server/general/plex-token/#wheretoken) will return the same XML response as the administrative token.
## Examples
curl Python Powershell
```
curl -X GET http://{ip\_address}:32400/?X-Plex-Token={plex\_token}
```
```
import requests
plex\_url = http://{ip\_address}:32400/?X-Plex-Token={plex\_token}
response = requests.get(plex\_url)
print(response.text)
```
```
$response = Invoke-RestMethod 'http://{ip\_address}:32400/?X-Plex-Token={plex\_token}' -Method GET
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
Server Capabilities [Server Identity](https://www.plexopedia.com/plex-media-server/api/server/identity/) [Get Server Preferences](https://www.plexopedia.com/plex-media-server/api/server/preferences/) [Set a Server Preference](https://www.plexopedia.com/plex-media-server/api/server/preference-set/) [Get Server List](https://www.plexopedia.com/plex-media-server/api/server/list/) [Get Accounts](https://www.plexopedia.com/plex-media-server/api/server/accounts/) [Get a Single Account](https://www.plexopedia.com/plex-media-server/api/server/account/) [Get Devices](https://www.plexopedia.com/plex-media-server/api/server/devices/) [Get a Single Device](https://www.plexopedia.com/plex-media-server/api/server/device/) [Get All Activities](https://www.plexopedia.com/plex-media-server/api/server/activities/) [Stop an Activity](https://www.plexopedia.com/plex-media-server/api/server/stop-activity/) [Get Transient Token](https://www.plexopedia.com/plex-media-server/api/server/transient-token/) [Perform Search](https://www.plexopedia.com/plex-media-server/api/server/search/) [Listen for Notifications](https://www.plexopedia.com/plex-media-server/api/server/listen-notifications/) [Listen for Events](https://www.plexopedia.com/plex-media-server/api/server/listen-events/) [Check for Updates](https://www.plexopedia.com/plex-media-server/api/server/update-check/) [Get Update Status](https://www.plexopedia.com/plex-media-server/api/server/update-status/)
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