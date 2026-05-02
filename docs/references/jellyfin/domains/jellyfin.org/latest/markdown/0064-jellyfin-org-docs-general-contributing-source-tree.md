Source Tree | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
Jellyfin is a maze of clients, plugins, and other useful projects. These source trees can serve as an excellent tool to inform new developers about the structure of several projects.
## [Jellyfin Server](https://github.com/jellyfin/jellyfin)[​](#jellyfin-server)
1. .ci: `Azure Pipelines Build definitions`
2. DvdLib: `DVD Analyzer`
3. Emby.Dlna: `DLNA support for the server`
* Profiles: `DLNA Profiles for clients`
* Emby.Drawing: `image processor managing the image encoder and image cache paths`
* Emby.Naming: `parsers for the media filenames`
* Emby.Notifications: `listening for events and sending the associated notification`
* Emby.Photos: `metadata provider for photos`
* Emby.Server.Implementations: `main implementations of the interfaces`
* ScheduledTasks: `all scheduled tasks can be found here`
* Jellyfin.Api: `Jellyfin API`
* Controller: `API controllers answering the Jellyfin API requests`
* Helpers:
* MediaInfoHelper.cs: `logic for the stream builder that determines method of playback such as Direct Play or Transcoding`
* Jellyfin.Data: `models used in the Entity Framework Core Database schema`
* Jellyfin.Drawing.Skia: `image manipulation like resizing images, making image collages`
* Jellyfin.Networking: `managing network interfaces and settings`
* Jellyfin.Server.Implementations: `like Emby.Server.Implementations, implementations using the EF Core Database`
* Jellyfin.Server: `main server project that starts the whole server`
* MediaBrowser.Common: `common methods used throughout the server`
* MediaBrowser.Controller: `interface definitions`
* MediaBrowser.LocalMetadata: `metadata provider and saver for local images, local Collections and Playlists`
* MediaBrowser.MediaEncoding: `managing ffmpeg while interacting with the media files`
* MediaBrowser.Model: `defining models used throughout the server`
* MediaBrowser.Providers: `managing multiple metadata sources`
* MediaBrowser.XbmcMetadata: `metadata provider and saver for local .nfo files`
* RSSDP: [RSSDP library](https://github.com/Yortw/RSSDP)`, including custom changes, for the Simple Service Discovery (SSDP) protocol`
* apiclient: `files used for generating the axios API client`
* deployment: `files used while building Jellyfin for different platforms`
* tests: `multiple Unit Test projects testing Jellyfin functionality`
* Dockerfile.\* `Dockerfiles defining the Jellyfin Docker image`
## [Web Client](https://github.com/jellyfin/jellyfin-web)[​](#web-client)
1. src:
* assets: `images, styles, splash screens, and any other static assets`
* css: `all global stylesheets used throughout the client`
* img: `images for things like device icons and logos`
* splash: `progressive web apps will show these splash screens`
* components: `custom elements used for different sections of the user interface`
* playerstats.js: `display playback info in browsers and other clients that include the web source`
* controllers: `scripts that handle the logic for different pages`
* elements: `custom UI components that are used globally such as buttons or menus`
* legacy: `currently used for all polyfills and scripts related to backwards compatibility`
* libraries: `dependencies that we eventually want to remove and include during the build step`
* scripts: `any script that isn't tied to a UI element or page but rather general functionality`
* strings: `translations for the entire interface`
* themes: `custom and bundled themes can be found here in their own directories`
## [Kodi](https://github.com/jellyfin/jellyfin-kodi)[​](#kodi)
1. jellyfin\_kodi
* database: `manipulating the local Jellyfin sqlite database`
* dialogs: `code behind popup menus for user interaction`
* entrypoint: `main add-on settings page`
* helper: `small helper functions, mostly formatting or reused functions`
* jellyfin: `interacting with the server`
* objects:
* kodi: `handling local Kodi media types and database`
* resources:
* language: `string files for localization`
* skins: `design of popup menus for user interaction`
* [Jellyfin Server](#jellyfin-server)
* [Web Client](#web-client)
* [Kodi](#kodi)