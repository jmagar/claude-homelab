Plugins | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
Jellyfin has a collection of optional plugins that can be installed to provide additional features. To create a plugin, see the [plugin template](https://github.com/jellyfin/jellyfin-plugin-template) repository.
## Installing[​](#installing)
### Catalog[​](#catalog)
Many plugins are available in a repository hosted on our servers, which can be easily installed using the plugin catalog in the settings. At the moment many of these are still being updated frequently so the version number may not be accurate. There are several different categories that can indicate what kind of functionality the plugins may provide.
The *plugins folder* is located in different locations depending on your install:
* `%UserProfile%\\AppData\\Local\\jellyfin\\plugins` for direct installs
* `%ProgramData%\\Jellyfin\\Server\\plugins` for tray installs
After that start Jellyfin back up, and reinstall each plugin you want to update using the above method from the catalog.
Plugin settings should be retained if you do not delete the `.xml` files from the `\<direct or tray path\>\\plugins\\configurations` folder.
**Authentication:** Add new authentication providers, such as LDAP.
**Channels:** Allow streaming remote audio or video content.
**General:** Plugins that serve general purposes, such as sync with Trakt.tv, or Kodi.
**Live TV:** Plugins that help with connecting to tuners, such as NextPVR, or TVHeadend.
**Metadata:** Scrape metadata from a new source or modify existing metadata.
**Notifications:** Allow notifications to connect to many different services, including Gotify and Slack.
### Manual[​](#manual)
All plugins hosted on the repository can be built from source and manually added to your server as well. They just need to be placed in the plugin directory, which is something like `/var/lib/jellyfin/plugins/` on most Linux distributions. Once the server is restarted any additions should automatically show up in your list of installed plugins. If you can't see the new plugin there may be a file permission issue.
## List[​](#list)
### Official Plugins[​](#official-plugins)
#### Metadata Plugins[​](#metadata-plugins)
Manage your Anime in Jellyfin with several different metadata providers and options for organizing your collection.
##### Anilist[​](#anilist)
Provides metadata support from [Anilist](https://anilist.co/).
**Link:**
* [Github](https://github.com/jellyfin/jellyfin-plugin-anilist)
##### Anidb[​](#anidb)
Provides metadata support from [Anidb](https://anidb.net/).
**Link:**
* [Github](https://github.com/jellyfin/jellyfin-plugin-anidb)
##### Anisearch[​](#anisearch)
Provides metadata support from [Anisearch](https://www.anisearch.com/).
**Link:**
* [Github](https://github.com/jellyfin/jellyfin-plugin-anisearch)
##### Bookshelf[​](#bookshelf)
Supports several different metadata providers and options for organizing your collection.
**Links:**
* [GitHub](https://github.com/jellyfin/jellyfin-plugin-bookshelf)
##### Kitsu[​](#kitsu)
Provides metadata support from [Kitsu](https://kitsu.app/).
* [Github](https://github.com/jellyfin/jellyfin-plugin-kitsu)
#### Fanart[​](#fanart)
Scrape poster images for movies, shows, and artists in your library from [fanart.tv](https://fanart.tv).
**Links:**
* [GitHub](https://github.com/jellyfin/jellyfin-plugin-fanart)
#### Kodi Sync Queue[​](#kodi-sync-queue)
Helps keep Jellyfin for Kodi in sync with the library without needing to run periodic full scans.
**Links:**
* [GitHub](https://github.com/jellyfin/jellyfin-plugin-kodisyncqueue)
#### Local Intros[​](#local-intros)
Use pre-roll intro videos from local storage.
**Links:**
* [GitHub](https://github.com/jellyfin/jellyfin-plugin-intros)
#### LDAP[​](#ldap)
Authenticate your Jellyfin users against an LDAP database, and optionally create users who do not yet exist automatically. Allows the administrator to customize most aspects of the LDAP authentication process, including customizable search attributes, username attribute, and a search filter for administrative users (set on user creation). The user, via the "Manual Login" process, can enter any valid attribute value, which will be mapped back to the specified username attribute automatically as well.
**Links:**
* [GitHub](https://github.com/jellyfin/jellyfin-plugin-ldapauth)
#### NextPVR[​](#nextpvr)
Provides access to Live TV, Program Guide, and Recordings from [NextPVR](https://www.nextpvr.com/).
**Links:**
* [GitHub](https://github.com/jellyfin/jellyfin-plugin-nextpvr)
#### [Open Subtitles](/docs/general/server/plugins/open-subtitles)[​](#open-subtitles)
Download subtitles from the internet to use with your media files from [Open Subtitles](https://www.opensubtitles.org/). You can configure the languages it downloads on a per-library basis.
**Links:**
* [GitHub](https://github.com/jellyfin/jellyfin-plugin-opensubtitles)
#### Subtitle Extract[​](#subtitle-extract)
Plugin to automatically extract embedded subtitles in media. This avoids delayed subtitles during streaming if the client does not support direct play and requests subtitles.
**Links:**
* [GitHub](https://github.com/jellyfin/jellyfin-plugin-subtitleextract)
#### Playback Reporting[​](#playback-reporting)
Collect and show user playback statistics, such as total time watched, media watched, time of day watched, and time of week watched. Can keep information for as long as you want or can cull older information automatically. Also allows you to manually query the data collected so you can generate your own reports.
**Links:**
* [GitHub](https://github.com/jellyfin/jellyfin-plugin-playbackreporting)
#### Reports[​](#reports)
Generate reports of your media library.
**Links:**
* [GitHub](https://github.com/jellyfin/jellyfin-plugin-reports)
#### TMDb Box Sets[​](#tmdb-box-sets)
Automatically create movie box sets based on TMDb collections. Configurable minimum number of films to be considered a boxset. Boxsets are created as collections and includes a scheduled task to ensure that new media is automatically put into boxsets.
**Links:**
* [GitHub](https://github.com/jellyfin/jellyfin-plugin-tmdbboxsets)
#### Trakt[​](#trakt)
Record your watched media with [Trakt](https://trakt.tv).
**Links:**
* [GitHub](https://github.com/jellyfin/jellyfin-plugin-trakt)
#### TVHeadend[​](#tvheadend)
Manage TVHeadEnd directly from Jellyfin by visiting the [TVHeadEnd plugin support page](/docs/general/server/plugins/tvheadend).
**Links:**
* [GitHub](https://github.com/jellyfin/jellyfin-plugin-tvheadend)
### 3rd-Party Plugins[​](#3rd-party-plugins)
#### Ani-Sync[​](#ani-sync)
Ani-Sync lets you synchronize/scrobble your Jellyfin Anime watch progress to popular services like MyAnimeList, AniList, Kitsu.
**Links:**
* [GitHub](https://github.com/vosmiic/jellyfin-ani-sync)
#### Kinopoisk metadata plugin[​](#kinopoisk-metadata-plugin)
Fetches metadata from [https://kinopoisk.ru](https://kinopoisk.ru). This site is popular in the Russian-speaking community and contains almost no English-language information. Can provide movies and series rating, description, actors and staff, trailers and so on.
**Links:**
* [GitHub](https://github.com/LinFor/jellyfin-plugin-kinopoisk)
#### Last.FM[​](#lastfm)
Enables audio scrobbling to Last.FM as well as a metadata fetcher source.
**Links:**
* [GitHub](https://github.com/jesseward/jellyfin-plugin-lastfm)
#### Merge Versions[​](#merge-versions)
Automatically group every repeated movie.
**Links:**
* [GitHub](https://github.com/danieladov/jellyfin-plugin-mergeversions)
#### Shokofin[​](#shokofin)
A plugin to integrate your Shoko database with the Jellyfin media server.
**Links:**
* [GitHub](https://github.com/ShokoAnime/Shokofin)
#### Skin Manager[​](#skin-manager)
Download and manage the most popular skins.
**Links:**
* [GitHub](https://github.com/danieladov/jellyfin-plugin-skin-manager)
#### Themerr[​](#themerr)
Plugin for Jellyfin that adds theme songs to movies and tv shows using ThemerrDB.
**Links:**
* [GitHub](https://github.com/LizardByte/themerr-jellyfin)
#### YouTube Metadata[​](#youtube-metadata)
Downloads metadata of YouTube videos with a YouTube API key.
**Links:**
* [GitHub](https://github.com/ankenyr/jellyfin-youtube-metadata-plugin)
#### TubeArchivistMetadata[​](#tubearchivistmetadata)
A plugin to integrate your TubeArchivist library with Jellyfin, providing metadata and organizing media.
**Links:**
* [GitHub](https://github.com/tubearchivist/tubearchivist-jf-plugin)
#### AudioMuse-AI[​](#audiomuse-ai)
Enhance Jellyfin with sonic analysis and smart song clustering, replacing InstantMix with sonically similar music suggestions.
**Links:**
* [GitHub](https://github.com/NeptuneHub/audiomuse-ai-plugin)
#### WizdomSubs Downloader[​](#wizdomsubs-downloader)
Downloads Hebrew subtitles from WizdomSubs for your media files. This plugin provides automatic subtitle downloading for Hebrew-speaking users.
**Links:**
* [GitHub](https://github.com/DeDuplicate/Jellyfin_wizdomsubs_downloader)
#### SmartCovers[​](#smartcovers)
Fallback cover-image provider for books, audiobooks, and PDFs. Extracts covers from files locally (EPUB, PDF, audio embedded art) and fetches from Open Library and Google Books when local extraction fails.
**Links:**
* [GitHub](https://github.com/GeiserX/smart-covers)
#### WhisperSubs[​](#whispersubs)
Local AI-powered subtitle generation using whisper.cpp. Generates SRT subtitles for movies and TV shows using a local Whisper model — no cloud APIs, no subscriptions.
**Links:**
* [GitHub](https://github.com/GeiserX/whisper-subs)
## Repositories[​](#repositories)
### Official Jellyfin Plugin Repositories[​](#official-jellyfin-plugin-repositories)
### Jellyfin
Official
Repository URL
```
https://repo.jellyfin.org/files/plugin/manifest.json
```
### Jellyfin Unstable
OfficialUnstable
Repository URL
```
https://repo.jellyfin.org/files/plugin-unstable/manifest.json
```
### 3rd-Party Plugin Repositories[​](#3rd-party-plugin-repositories)
### 9p4's Single-Sign-On (SSO) Repo
Third Party
Repository URL
```
https://raw.githubusercontent.com/9p4/jellyfin-plugin-sso/manifest-release/manifest.json
```
#### Includes
* [9p4's Single Sign On Plugin](https://github.com/9p4/jellyfin-plugin-sso)
### Ani-Sync Repo
Third Party
Repository URL
```
https://raw.githubusercontent.com/vosmiic/jellyfin-ani-sync/master/manifest.json
```
#### Includes
* [Ani-Sync](https://github.com/vosmiic/jellyfin-ani-sync)
### danieladov's Repo
Third Party
Repository URL
```
https://raw.githubusercontent.com/danieladov/JellyfinPluginManifest/master/manifest.json
```
#### Includes
* [Merge Versions](https://github.com/danieladov/jellyfin-plugin-mergeversions)
* [Skin Manager](https://github.com/danieladov/jellyfin-plugin-skin-manager)
* [Theme Songs](https://github.com/danieladov/jellyfin-plugin-themesongs)
### dkanada's Repo
Third Party
Repository URL
```
https://raw.githubusercontent.com/dkanada/jellyfin-plugin-intros/master/manifest.json
```
#### Includes
* [Intros](https://github.com/dkanada/jellyfin-plugin-intros)
### k-matti's Repo
Third Party
Repository URL
```
https://raw.githubusercontent.com/k-matti/jellyfin-plugin-repository/master/manifest.json
```
#### Includes
* [SMS Notifications](https://github.com/k-matti/jellyfin-plugin-sms)
* [NapiSub](https://github.com/k-matti/jellyfin-plugin-napi)
### LinFor's Repo
Third Party
Repository URL
```
https://raw.githubusercontent.com/LinFor/jellyfin-plugin-kinopoisk/master/dist/manifest.json
```
#### Includes
* [Kinopoisk metadata plugin](https://github.com/LinFor/jellyfin-plugin-kinopoisk)
### LizardByte's Repo
Third Party
Repository URL
```
https://app.lizardbyte.dev/jellyfin-plugin-repo/manifest.json
```
#### Includes
* [Themerr](https://github.com/LizardByte/themerr-jellyfin)
### ShokoAnime's Repo
Third Party
Repository URL
```
https://raw.githubusercontent.com/ShokoAnime/Shokofin/metadata/stable/manifest.json
```
#### Includes
* [Shokofin](https://github.com/ShokoAnime/Shokofin)
### TubeArchivist's Repo
Third Party
Repository URL
```
https://raw.githubusercontent.com/tubearchivist/tubearchivist-jf-plugin/master/manifest.json
```
#### Includes
* [TubeArchivistMetadata](https://github.com/tubearchivist/tubearchivist-jf-plugin)
### AudioMuse-AI's Repo
Third Party
Repository URL
```
https://raw.githubusercontent.com/neptunehub/audiomuse-ai-plugin/master/manifest.json
```
#### Includes
* [AudioMuse-AI](https://github.com/neptunehub/audiomuse-ai-plugin)
### DeDuplicate's WizdomSubs Downloader Repo
Third Party
Repository URL
```
https://raw.githubusercontent.com/DeDuplicate/Jellyfin\_wizdomsubs\_downloader/refs/heads/main/manifest.json
```
#### Includes
* [WizdomSubs Downloader](https://github.com/DeDuplicate/Jellyfin_wizdomsubs_downloader)
### GeiserX's SmartCovers Repo
Third Party
Repository URL
```
https://geiserx.github.io/smart-covers/manifest.json
```
#### Includes
* [SmartCovers](https://github.com/GeiserX/smart-covers)
### GeiserX's WhisperSubs Repo
Third Party
Repository URL
```
https://geiserx.github.io/whisper-subs/manifest.json
```
#### Includes
* [WhisperSubs](https://github.com/GeiserX/whisper-subs)
* [Installing](#installing)
* [Catalog](#catalog)
* [Manual](#manual)
* [List](#list)
* [Official Plugins](#official-plugins)
* [3rd-Party Plugins](#3rd-party-plugins)
* [Repositories](#repositories)
* [Official Jellyfin Plugin Repositories](#official-jellyfin-plugin-repositories)
* [3rd-Party Plugin Repositories](#3rd-party-plugin-repositories)