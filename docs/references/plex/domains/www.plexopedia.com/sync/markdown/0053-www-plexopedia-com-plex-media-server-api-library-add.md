Plex API: Add a Library - Plexopedia
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
Before adding media to a Plex server, a library for the media type must first be created. The API command explained on this page will [add a single library](/plex-media-server/general/add-library/) to a Plex server.
Since all media libraries are added in the same manner, this command can be complex as all options for each library type must be handled.
## URL
```
POST http://{ip\_address}:32400/library/sections?name={name}&type={type}&agent={agent}&scanner={scanner}&language={language}&location={media\_location}&{preferences}&X-Plex-Token={plex\_token}
```
### Parameters
|Name|Description|
|ip\_address|The IP address of the Plex Media server.|
|plex\_token|The [Plex token](https://www.plexopedia.com/plex-media-server/general/plex-token/).|
|name|The name of the new library.|
|type|The type of library to be added See [Library Types](#librarytypes).|
|agent|The agent that will be associated with the library See [Agents](#agents).|
|scanner|The scanner that will be associated with the library See [Scanners](#scanners).|
|language|The language of the library, See [Library Languages](#librarylanguages).|
|media\_location|The location of the media files. This parameter can be specified multiple times if more than one location will be used for the library media.|
|preferences|Optional. Additional settings for the library See [Preferences](#preferences).|
## Return Status
|HTTP Code|Description|
|201|Created - The request was successful.|
|400|Bad Request. A parameter is invalid or not provided. The response contains the error messages.|
|401|Unauthorized - The Plex token provided was not valid.|
## Response
When a library is successfully created, an XML string value that contains information about the new library is returned:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="1"\>
\<Directory art="/:/resources/movie-fanart.jpg" composite="/library/sections/20/composite/1700011778" thumb="/:/resources/movie.png" key="20" type="movie" title="My Movies" agent="tv.plex.agents.movie" scanner="Plex Movie" language="en-US" uuid="23355a75-a85b-4420-8ed9-0a781010c8ad" updatedAt="1700011778" createdAt="1700011778" content="1" directory="1" contentChangedAt="0" hidden="0"\>
\<Location id="23" path="M:\\Movies" /\>
\</Directory\>
\</MediaContainer\>
```
If the library could not be created, string values are returned that explain the reasons why the library could not be created.
The XML returned contains information about the new library. The root is the `MediaContainer` element. This element contains only a single `size` attribute that indicates one `Directory` element was returned.
MediaContainer Attributes|Attribute|Description|
|size|The number of libraries.|
Within the `MediaContainer` there is one `Directory` element. The `Directory` element will contain information about the new library.
Directory Attributes|Attribute|Description|
|art|The background artwork used to represent the item.|
|composite|The composite image associated with the item.|
|thumb|The thumbnail for the item.|
|key|The relative URL of the information for the item.|
|type|The type of item represented by this `Directory` element.|
|title|The name of the item.|
|agent|The agent used to set the metadata for the items in the library.|
|scanner|The name of the scanner used to scan the item.|
Within the `Directory` element there is one `Location` child element that provides information about the media files location for the library.
Location Attributes|Attribute|Description|
|id|The unique identifier for the item.|
|path|The full path of the item.|
## Remarks
## Library Types
There are four types of libraries that can be added to Plex. When using the Web app to add a library, there are five types, but two use the same type when using the API.
The types are as follows:
Library Types|Value|Library Type|
|movie|Movies, Other videos|
|show|TV shows|
|artist|Music|
|photo|Photos|
The **Value** in the table above is what you would use in the API request to the Plex server.
## Agents
Agents take information from the library scanner and then retrieve the metadata for each item in the library. A library can have one associated agent. One agent must be specified when adding a library, but can be changed later.
The tables in the next sections list the valid agents. The agents marked with "Default" are the agents selected when adding a library using the Plex Web app. Use the value in the "Value" column in the API request.
The valid agents for each library type are as follows:
### Movies and other videos
Movie and Other Video Agents|Value|Name|
|tv.plex.agents.movie|Plex Movie (Default: Movies)|
|com.plexapp.agents.none|Personal media (Default: Other videos)|
|com.plexapp.agents.imdb|Plex Movie (Legacy)|
|com.plexapp.agents.themoviedb|The Movie Database|
### TV shows
TV Shows Agents|Value|Name|
|tv.plex.agents.series|Plex TV Series (Default)|
|com.plexapp.agents.none|Personal Media Shows|
|com.plexapp.agents.thetvdb|TheTVDB|
|com.plexapp.agents.themoviedb|The Movie Database|
### Music
Music Agents|Value|Name|
|tv.plex.agents.music|Plex Music (Default)|
|com.plexapp.agents.none|Personal Media Artists|
|com.plexapp.agents.lastfm|Last.fm|
## Scanners
Library scanners are used to scan the media in the folders associated with the library and then pass that information to the agent.
The valid scanners for each media type are listed in the sections below. The ones marked with "Default" are the default scanners used when adding a library from the Plex Web app. You only include the scanner name in the request.
### Movies and other videos
* Plex Movie (Default: Movies)
* Plex Movie Scanner
* Plex Video Files Scanner
* Plex Video Files Scanner (Default: Other videos)### TV shows
* Plex TV Series (Default)
* lex Series Scanner### Music
* Plex Music (Default)
* Plex Music Scanner## Library languages
All libraries require a language to be specified. The supported languages for a library are dependent on the type. For the "Other Videos" library, the only option available is "None", which means no true language can be selected.
The next few sections list all the available language options for each library type.
### Movies and TV shows
Movies and TV Shows Languages|Code|Language|
|ar-SA|Arabic (Saudi Arabia)|
|bg-BG|Bulgarian|
|ca-ES|Catalan|
|zh-CN|Chinese|
|zh-HK|Chinese (Hong Kong)|
|zh-TW|Chinese (Taiwan)|
|hr-HR|Croatian|
|cs-CZ|Czech|
|da-DK|Danish|
|nl-NL|Dutch|
|en-US|English|
|en-AU|English (Australia)|
|en-CA|English (Canada)|
|en-GB|English (UK)|
|et-EE|Estonian|
|fi-FI|Finnish|
|fr-FR|French|
|fr-CA|French (Canada)|
|de-DE|German|
|el-GR|Greek|
|he-IL|Hebrew|
|hi-IN|Hindi|
|hu-HU|Hungarian|
|id-ID|Indonesian|
|it-IT|Italian|
|ja-JP|Japanese|
|ko-KR|Korean|
|lv-LV|Latvian|
|lt-LT|Lithuanian|
|nb-NO|Norwegian Bokmål|
|fa-IR|Persian|
|pl-PL|Polish|
|pt-BR|Portuguese|
|pt-PT|Portuguese (Portugal)|
|ro-RO|Romanian|
|ru-RU|Russian|
|sk-SK|Slovak|
|es-ES|Spanish|
|es-MX|Spanish (Mexico)|
|sv-SE|Swedish|
|th-TH|Thai|
|tr-TR|Turkish|
|uk-UA|Ukrainian|
|vi-VN|Vietnamese|
### Music and photos
Music and Photos Languages|Code|Language|
|id|Bahasa Indonesia|
|da|Dansk|
|de|Deutsch|
|en|English|
|es|Español|
|fr|Français|
|it|Italiano|
|hu|Magyar|
|nl|Nederlands|
|nn|Norsk nynorsk|
|pl|Polski|
|pt|Português|
|fi|Suomeksi|
|sv|Svenska|
|vi|Tiếng Việt|
|tr|Türkçe|
|xx|Unknown|
|hr|hrvatski|
|ro|română|
|sk|slovenčina|
|cs|čeština|
|el|Ελληνικά|
|bg|български език|
|ru|русский язык|
|sr|српски језик|
|ar|العربية|
|th|ไทย|
|zh|中文|
|ja|日本語|
|ko|한국어|
Photos include all languages in the above table and the option of "None" in the next table.
### Photos and other videos
Photos and Other Videos Languages|Code|Language|
|xn|None|
## Preferences
When adding a library using the Plex Web app there is an **Advanced** section that provides different options for each library type.
When using the API to add a library, these options are provided in the request in the form `prefs[*name*]`. Each preference option would be a separate parameter in the request.
There are default values for each preference and if you wish to use the default value then you wouldn't specify the preference in the request. This means that all preferences are optional if you just wish to use the default values.
Each library will have its own set of preferences, and some preferences can be set for different library types. The preferences are listed below.
#### Visibility
* **Name: ** hidden
* **Parameter Values:
** 0 - (Default) Include in home screen and global search
1 - Exclude from home screen
2 - Exclude from home screen and global search
* **Library Type:** Moves, TV Shows, Music, Photos#### Enable Cinema Trailers
* **Name:** enableCinemaTrailers
* **Value:**
0 - Unchecked
1 - (Default) Checked
* **Library Type:** Moves, Other Videos#### Use original titles
* **Name:** originalTitles
* **Value:**
0 - (Default) Unchecked
1 - Checked
* **Library Type:** Movies, TV Shows#### Prefer artwork based on library language
* **Name:** localizedArtwork
* **Value:**
0 - Unchecked
1 - (Default) Checked
* **Library Type:** Movies, TV Shows#### Use local assets
* **Name:** useLocalAssets
* **Value:**
0 - Unchecked
1 - (Default) Checked
* **Library Type:** Movies, TV Shows#### Prefer local metadata
* **Name:** respectTags
* **Value:**
0 - (Default) Unchecked
1 - Checked
* **Library Type:** Movies, TV Shows, Music#### Find extras
* **Name:** useExternalExtras
* **Value:**
0 - Unchecked
1 - (Default) Checked
* **Library Type:** Movies, TV Shows#### Only show trailers
* **Name:** skipNonTrailerExtras
* **Value:**
0 - (Default) Unchecked
1 - Checked
* **Library Type:** Movies, TV Shows#### Allow red band trailers
* **Name:** useRedbandTrailers
* **Value:**
0 - (Default) Unchecked
1 - Checked
* **Library Type:** Movies, TV Shows#### Localized subtitles
* **Name:** includeExtrasWithLocalizedSubtitles
* **Value:**
0 - (Default) Unchecked
1 - Checked
* **Library Type:** Movies, TV Shows#### Include adult content
* **Name:** includeAdultContent
* **Value:**
0 - (Default) Unchecked
1 - Checked
* **Library Type:** Movies, TV Shows#### Minimum automatic collection size
* **Name:** autoCollectionThreshold
* **Value:**
0 - (Default) Disabled
1 - 1
2 - 2
3 - 3
4 - 4
* **Library Type:** Movies#### Ratings Source
* **Name:** ratingsSource
* **Value:**
rottentomatoes - (Default) Rotten Tomatoes
imdb - IMDb
themoviedb - The Movie Database
* **Library Type:** Movies#### Enable video preview thumbnails
* **Name:** enableBIFGeneration
* **Value:**
0 - Unchecked
1 - (Default) Checked
* **Library Type:** Movies, TV Shows, Photos, Other Videos#### Collections
* **Name:** collectionMode
* **Value:**
0 - Disabled
1 - Hide items which are in collections
2 - (Default) Show collections and their items
* **Library Type:** Movies, TV Shows, Other Videos#### Episode sorting
* **Name:** episodeSort
* **Value:**
-1 - (Default) Library default
0 - Oldest first
1 - Newest first
* **Library Type:** TV Shows#### Episode ordering
* **Name:** showOrdering
* **Value:**
tmdbAiring - (Default) The Movie Database
aired - TheTVDB
* **Library Type:** TV Shows#### Use season titles
* **Name:** useSeasonTitles
* **Value:**
0 - (Default) Unchecked
1 - Checked
* **Library Type:** TV Shows#### Seasons
* **Name:** flattenSeasons
* **Value:**
0 - (Default) Show
1 - Hide
2 - Hide for single-season series
* **Library Type:** TV Shows#### Album sorting
* **Name:** albumSort
* **Value:**
-1 - (Default) Library default
0 - Oldest first
1 - Newest first
2 - By name
* **Library Type:** Music#### Store track progress
* **Name:** enableTrackOffsets
* **Value:**
0 - (Default) Unchecked
1 - Checked
* **Library Type:** Music#### Include related content from shared libraries
* **Name:** augmentWithSharedContent
* **Value:**
0 - Unchecked
1 - (Default) Checked
* **Library Type:** Music#### Artist Bios
* **Name:** artistBios
* **Value:**
0 - Unchecked
1 - (Default) Checked
* **Library Type:** Music#### Album Reviews and Critic Ratings
* **Name:** albumReviews
* **Value:**
0 - Unchecked
1 - (Default) Checked
* **Library Type:** Music#### Popular Tracks
* **Name:** popularTracks
* **Value:**
0 - Unchecked
1 - (Default) Checked
* **Library Type:** Music#### Genres
* **Name:** genres
* **Value:**
0 - Unchecked
1 - (Default) Checked
* **Library Type:** Music#### Album Artist
* **Name:** albumPosters
* **Value:**
1 - (Default) Both Plex Music and Local Files
2 - Plex Music Only
3 - Local Files Only
* **Library Type:** Music### Plex Movie (Legacy) Preferences
If you select **Plex Movie (Legacy)** as the movie agent, there are some additional preferences that can be set for that agent.
The preferences for this agent are listed below.
#### Localized titles
* **Name:** title
* **Value:**
0 - (Default) Unchecked
1 - Checked
* **Library Type:** Movies#### Find trailers and extras automatically (Plex Pass required)
* **Name:** extras
* **Value:**
0 - Unchecked
1 - (Default) Checked
* **Library Type:** Movies#### Skip extras which aren't trailers
* **Name:** only\_trailers
* **Value:**
0 - (Default) Unchecked
1 - Checked
* **Library Type:** Movies#### Use red band (restricted audiences) trailers when available
* **Name:** redband
* **Value:**
0 - (Default) Unchecked
1 - Checked
* **Library Type:** Movies
To set the above preferences, a second API request will need to be sent to the Plex server. This request is as follows:
```
GET http://{ip\_address}:32400/:/plugins/com.plexapp.agents.imdb/prefs/set?title=[Value]&extras=[Value]&only\_trailers=[Value]&redband=[Value]&X-Plex-Token={plex\_token}
```
### The Movie Database Settings
There are additional preferences that can be specified when using **The Movie Database** agent. These setting are listed below.
#### Use collection info from The Movie Database
* **Name:** collections
* **Value:**
0 - (Default) Unchecked
1 - Checked
* **Library Type:** Movies#### Prefer artwork based on library language
* **Name:** localart
* **Value:**
0 - Unchecked
1 - (Default) Checked
* **Library Type:** Movies#### Include adult content
* **Name:** adult
* **Value:**
0 - (Default) Unchecked
1 - Checked
* **Library Type:** Movies#### Country
* **Name:** country
* **Value:**
A value from the below table.
* **Library Type:** MoviesThe Movie Database Languages|Value|Language|
|0|(Blank)|
|1|Argentina|
|2|Australia|
|3|Austria|
|4|Belgium|
|5|Belize|
|6|Bolivia|
|7|Brazil|
|8|Canada|
|9|Chile|
|10|Colombia|
|11|Costa Rica|
|12|Czech Republic|
|13|Denmark|
|14|Dominican Republic|
|15|Ecuador|
|16|El Salvador|
|17|France|
|18|Germany|
|19|Guatemala|
|20|Honduras|
|21|Hong Kong SAR|
|22|Ireland|
|23|Italy|
|24|Jamaica|
|25|Korea|
|26|Liechtenstein|
|27|Luxembourg|
|28|Mexico|
|29|Netherlands|
|30|New Zealand|
|31|Nicaragua|
|32|Panama|
|33|Paraguay|
|34|Peru|
|35|Portugal|
|36|Peoples Republic of China|
|37|Puerto Rico|
|38|Russia|
|39|Singapore|
|40|South Africa|
|41|Spain|
|42|Sweden|
|43|Switzerland|
|44|Taiwan|
|45|Trinidad|
|46|United Kingdom|
|47|United States|
|48|Uruguay|
|49|Venezuela|
To set The Movie Database preferences, a second API request will need to be sent to the Plex server. This request is as follows:
```
GET http://{ip\_address}:32400/:/plugins/com.plexapp.agents.themoviedb/prefs/set?collections=[Value]&localart=[Value]&adult=[Value]&country=[Value]&X-Plex-Token={plex\_token}
```
## Examples
curl Python Powershell
```
curl -X POST http://{ip\_address}:32400/library/sections?name={name}&type={type}&agent={agent}&scanner={scanner}&language={language}&location={media\_location}&{preferences}&X-Plex-Token={plex\_token}
```
```
import requests
plex\_url = http://{ip\_address}:32400/library/sections?name={name}&type={type}&agent={agent}&scanner={scanner}&language={language}&location={media\_location}&{preferences}&X-Plex-Token={plex\_token}
response = requests.post(plex\_url)
print(response.text)
```
```
$response = Invoke-RestMethod 'http://{ip\_address}:32400/library/sections?name={name}&type={type}&agent={agent}&scanner={scanner}&language={language}&location={media\_location}&{preferences}&X-Plex-Token={plex\_token}' -Method POST
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
[Get Libraries](https://www.plexopedia.com/plex-media-server/api/server/libraries/) [Get Library Details](https://www.plexopedia.com/plex-media-server/api/library/details/) Add a Library [Delete a Library](https://www.plexopedia.com/plex-media-server/api/server/library-delete/) [Scan All Libraries](https://www.plexopedia.com/plex-media-server/api/library/scan/) [Scan a Single Library](https://www.plexopedia.com/plex-media-server/api/library/scan-single/) [Scan a Partial Library](https://www.plexopedia.com/plex-media-server/api/library/scan-partial/) [Refresh Metadata for a Library](https://www.plexopedia.com/plex-media-server/api/library/refresh-metadata/)
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