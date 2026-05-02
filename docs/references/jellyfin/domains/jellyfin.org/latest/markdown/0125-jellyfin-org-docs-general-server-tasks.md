Tasks | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
Tasks are operations that are scheduled to run periodically. They can also be triggered manually by clicking the run button on the right.
Note: If your media files are unavailable when the `Clean up collections and playlists` task runs (e.g. a network share not yet mounted) your playlists will be lost. By default it runs at Jellyfin startup.
## Default Jellyfin Tasks[​](#default-jellyfin-tasks)
Below is a list of tasks that Jellyfin runs periodically by default:
### Libraries[​](#libraries)
* Download Missing Subtitles
* Refresh Users
* Extract Chapter Images
* Scan Library
* Extract Key Frames
### Application[​](#application)
* Update Plugins
### Maintenance[​](#maintenance)
* Optimize Database
* Clear Log Folder
* Clear Cache Folder
* Clear Activity Logs
* Clear Transcodes Folder
* Clean up collections and playlists
## Plugin Tasks[​](#plugin-tasks)
Plugins can add their own tasks if they include operations that need to be run at specified intervals. These will also show up in the settings for you to configure.
* [Default Jellyfin Tasks](#default-jellyfin-tasks)
* [Libraries](#libraries)
* [Application](#application)
* [Maintenance](#maintenance)
* [Plugin Tasks](#plugin-tasks)