Plex API: Listen for Events - Plexopedia
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
Plex provides a way of pushing event notifications to a client over HTTP. This API command will open a connection to the Plex server to allow Plex to send notifications to the client when an event happens on the server.
## URL
```
GET http://{ip\_address}:32400/:/eventsource/notifications?filters={filters}&X-Plex-Token={plex\_token}
```
### Parameters
|Name|Description|
|ip\_address|The IP address of the Plex Media server.|
|plex\_token|The [Plex token](https://www.plexopedia.com/plex-media-server/general/plex-token/).|
|filters|The filters parameter is optional. If not provided, then there will be no filter and all event notifications will be sent. The available filter options are outlined in the [Filters](#filters) section.|
## Return Status
|HTTP Code|Description|
|200|Success - The request was successful.|
|401|Unauthorized - The Plex token provided was not valid.|
## Response
When this API command is running a connection to the server is opened and remains open until the connection is closed. The content type for this command is `text/event-stream`, which is a server-sent event stream.
While the connection is open, the server will send event details to the client as the events happen on the server.
The server will also send a `ping` event every 10 seconds to ensure the client is still connected to the server.
For each event notification sent from the server, the following two fields are included:
Event Notification Fields|Name|Description|
|event|The name of the event.|
|data|Information associated with the event in JSON format.|
The `event` field will always have the name of the event, however, the `data` field can contain no data.
### ping Event
The `ping` event will happen every 10 seconds to ensure the client is still connected to the server. The `data` field contains no information for a `ping` event.
An example of the `ping` event:
```
event: ping
data: {}
```
### activity Event
The `activity` event occurs when there is some job being run on the server. A single activity can return multiple `activity` notifications from the server.
An example of data returned for an `activity` event is shown below:
```
event: activity
data: {"ActivityNotification":{"event":"updated","uuid":"40874a0a-9558-4554-b070-0dae4e2f5b9c","Activity":{"uuid":"40874a0a-9558-4554-b070-0dae4e2f5b9c","type":"library.refresh.items","cancellable":false,"userID":1,"title":"Refreshing","subtitle":"Checking files","progress":0,"Context":{"key":"/library/collections/204922/children"}}}}
```
For an `activity` event, the top-level object is the `ActivityNotification`. This object contains fields about the activity.
ActivityNotification Fields|Name|Description|
|event|The event of the activity, such as `started`, `updated`, or `ended`|
|uuid|A unique identifier for the activity.|
|Activity|More information about the activity. See the next table.|
Activity Fields|Name|Description|
|uuid|A unique identifier for the activity.|
|type|The type of activity being performed.|
|cancellable|Indicates whether the activity can be cancelled.|
|userID|The ID associated with the user running the activity. This ID matches one from the [list of accounts](/plex-media-server/api/server/accounts/) on the server.|
|title|The title of the activity.|
|subtitle|The subtitle of the activity.|
|progress|The progress, as a percentage, of the activity.|
|Context|Additional context for the activity. See the next table.|
Context Fields|Name|Description|
|accessible|The item associated with the activity is accessible.|
|analyzed|The item has been analyzed.|
|exists|Indicates the item exists.|
|key|The key for the item associated with the activity|
|refreshed|Indicates the item has been refreshed.|
As mentioned earlier, a single activity can generate multiple notifications. Each notification would show the current progress for the activity, and then a final end notification once the activity has been completed.
### playing Event
The `playing` event will happen whenever media is played, paused, or stopped. The information in the `data` field will contain information about the media and the play state at the time of the event.
The `playing` event will return something like the following:
```
event: playing
data: {"PlaySessionStateNotification":{"sessionKey":"45","clientIdentifier":"4b453df1-8fb1-4aee-bfb9-3ea219fce481","guid":"","ratingKey":"217468","url":"","key":"/library/metadata/217448","viewOffset":26530,"state":"paused"}}
```
The top-level object in the response is the `PlaySessionStateNotification` object. This object contains details on the play state change from the server.
The following table lists the information included in the `data` field for the `PlaySessionStateNotification` object:
PlaySessionStateNotification Fields|Name|Description|
|sessionKey|Unique key for the play session.|
|clientIdentifier|The unique identifier associated with the client. Should match a device returned by the [Get Devices](/plex-media-server/api/server/devices/) API command.|
|guid|A unique identifier for the play session.|
|ratingKey|The unique key for the media item.|
|url|The URL. It appears to return a blank value for media.|
|key|The key to the information about the media item.|
|viewOffset|The current play progress of the media in milliseconds.|
|playQueueID|The ID associated to the current play queue.|
|state|The play state of the media item. Valid values: `playing`, `paused`, `stopped`.|
|transcodeSession|If the play session is being transcoded, this field will contain the unique identifier for the transcode session.|
### transcodeSession.update Events
When media is transcoded several `transcodeSession` notifications are sent. Plex will send update notifications for a transcode session using the `transcodeSession.update` event.
An example of data associated with this event is shown below:
```
event: transcodeSession.update
data: {"TranscodeSession":{"key":"/transcode/sessions/3gk8278lyxrc905hn8jgrgfr","throttled":false,"complete":false,"progress":1.2999999523162842,"size":-22,"speed":23.600000381469728,"error":false,"duration":8574912,"remaining":361,"context":"streaming","sourceVideoCodec":"h264","sourceAudioCodec":"dca","videoDecision":"copy","audioDecision":"transcode","protocol":"dash","container":"mp4","videoCodec":"h264","audioCodec":"aac","audioChannels":2,"width":1920,"height":1080,"transcodeHwRequested":true,"transcodeHwFullPipeline":false,"timeStamp":1704824487.95772,"maxOffsetAvailable":124.957,"minOffsetAvailable":0.0}}
```
The top-level object is the `TranscodeSession`, and each property of the child object will contain information about that transcode session.
The following table outlines those properties.
TranscodeSession Fields|Name|Description|
|key|The unique key for the transcode session.|
|throttled|Indicates whether the transcode session is throttled.|
|complete|Indicates the transcode session is complete.|
|progress|The progress of the transcode session.|
|size|The size.|
|speed|The speed of the transcoding. 1.0 - the server is transcoding in real-time. Greater than 1.0 - the server is able to transcode fast enough. Less than 1.0 - the server is unable to transcode fast enough.|
|error|Whether there is an error.|
|duration|The length of time for the media item.|
|remaining|The remaining media to be transcoded.|
|context|The context of the transcode session.|
|sourceVideoCodec|The source video codec.|
|sourceAudioCodec|The source audio codec.|
|videoDecision|How the video is being handled.|
|audioDecision|How the audio is being handled.|
|protocol|The streaming protocol.|
|container|The streamining media container.|
|videoCodec|The streaming video codec.|
|audioCodec|The streaming audio codec.|
|audioChannels|The streaming audio channels.|
|width|The width of the media.|
|height|The height of the media.|
|transcodeHwRequested|Indicates the hardware was requested for transcoding.|
|transcodeHwFullPipeline|Indicates the hardware was being used.|
|transcodeHwRequested|Indicates the hardware was requested for transcoding.|
|timeStamp|The current time stamp.|
|maxOffsetAvailable|The current media max offset.|
|minOffsetAvailable|The current media min offset.|
### transcodeSession.end Events
```
event: transcodeSession.end
data: {"TranscodeSession":{"key":"/transcode/sessions/3gk8278lyxrc905hn8jgrgfr","throttled":false,"complete":false,"progress":1.600000023841858,"size":-22,"speed":33.5,"error":false,"duration":8574912,"remaining":291,"context":"streaming","sourceVideoCodec":"h264","sourceAudioCodec":"dca","videoDecision":"copy","audioDecision":"transcode","protocol":"dash","container":"mp4","videoCodec":"h264","audioCodec":"aac","audioChannels":2,"width":1920,"height":1080,"transcodeHwRequested":true,"transcodeHwFullPipeline":false,"timeStamp":1704824487.95772}}
```
The top-level object is the `TranscodeSession`, and each property of the child object will contain information about that transcode session.
The following table outlines those properties.
TranscodeSession Fields|Name|Description|
|key|The unique key for the transcode session.|
|throttled|Indicates whether the transcode session is throttled.|
|complete|Indicates the transcode session is complete.|
|progress|The progress of the transcode session.|
|size|The size.|
|speed|The speed of the transcoding. 1.0 - the server is transcoding in real-time. Greater than 1.0 - the server is able to transcode fast enough. Less than 1.0 - the server is unable to transcode fast enough.|
|error|Whether there is an error.|
|duration|The length of time for the media item.|
|remaining|The remaining media to be transcoded.|
|context|The context of the transcode session.|
|sourceVideoCodec|The source video codec.|
|sourceAudioCodec|The source audio codec.|
|videoDecision|How the video is being handled.|
|audioDecision|How the audio is being handled.|
|protocol|The streaming protocol.|
|container|The streamining media container.|
|videoCodec|The streaming video codec.|
|audioCodec|The streaming audio codec.|
|audioChannels|The streaming audio channels.|
|width|The width of the media.|
|height|The height of the media.|
|transcodeHwRequested|Indicates the hardware was requested for transcoding.|
|transcodeHwFullPipeline|Indicates the hardware was being used.|
|transcodeHwRequested|Indicates the hardware was requested for transcoding.|
|timeStamp|The current time stamp.|
## Remarks
### Filters
To return specific events, you can apply filters to the API command. If a filter parameter is not passed into the command, then all events will be pushed to the client.
The following table lists valid filters that can be passed into the command.
Notification Filter Values|Name|Description|
|activity|An activity is happening on the server.|
|playing|When media is playing, paused, or stopped.|
|transcodeSession.start|A transcoding session is started.|
|transcodeSession.update|A transcoding session has been updated.|
|transcodeSession.end|A transcoding session has ended.|
When passing in multiple filters, separate each filter value with a comma.
```
/:/eventsource/notifications?filters=activity,playing,transcodeSession.start,transcodeSession.update,transcodeSession.end
```
## Examples
curl Python Powershell
```
curl -X GET http://{ip\_address}:32400/:/eventsource/notifications?filters={filters}&X-Plex-Token={plex\_token}
```
```
import requests
plex\_url = http://{ip\_address}:32400/:/eventsource/notifications?filters={filters}&X-Plex-Token={plex\_token}
response = requests.get(plex\_url)
print(response.text)
```
```
$response = Invoke-RestMethod 'http://{ip\_address}:32400/:/eventsource/notifications?filters={filters}&X-Plex-Token={plex\_token}' -Method GET
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
[Server Capabilities](https://www.plexopedia.com/plex-media-server/api/server/capabilities/) [Server Identity](https://www.plexopedia.com/plex-media-server/api/server/identity/) [Get Server Preferences](https://www.plexopedia.com/plex-media-server/api/server/preferences/) [Set a Server Preference](https://www.plexopedia.com/plex-media-server/api/server/preference-set/) [Get Server List](https://www.plexopedia.com/plex-media-server/api/server/list/) [Get Accounts](https://www.plexopedia.com/plex-media-server/api/server/accounts/) [Get a Single Account](https://www.plexopedia.com/plex-media-server/api/server/account/) [Get Devices](https://www.plexopedia.com/plex-media-server/api/server/devices/) [Get a Single Device](https://www.plexopedia.com/plex-media-server/api/server/device/) [Get All Activities](https://www.plexopedia.com/plex-media-server/api/server/activities/) [Stop an Activity](https://www.plexopedia.com/plex-media-server/api/server/stop-activity/) [Get Transient Token](https://www.plexopedia.com/plex-media-server/api/server/transient-token/) [Perform Search](https://www.plexopedia.com/plex-media-server/api/server/search/) [Listen for Notifications](https://www.plexopedia.com/plex-media-server/api/server/listen-notifications/) Listen for Events [Check for Updates](https://www.plexopedia.com/plex-media-server/api/server/update-check/) [Get Update Status](https://www.plexopedia.com/plex-media-server/api/server/update-status/)
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