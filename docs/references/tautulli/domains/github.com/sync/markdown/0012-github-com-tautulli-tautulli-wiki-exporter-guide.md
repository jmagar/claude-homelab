Exporter Guide · Tautulli/Tautulli Wiki · GitHub
[Skip to content](#start-of-content)
{{ message }}
[
Tautulli
](/Tautulli)
/
**
[Tautulli](/Tautulli/Tautulli)
**
Public
*
* [ Notifications
](/login?return_to=/Tautulli/Tautulli) You must be signed in to change notification settings
* [ Fork
623
](/login?return_to=/Tautulli/Tautulli)
*
[
Star
6.5k
](/login?return_to=/Tautulli/Tautulli)
# Exporter Guide
[Jump to bottom](#wiki-pages-box)
JonnyWong16 edited this page Mar 23, 2026
&middot;
[31 revisions](/Tautulli/Tautulli/wiki/Exporter-Guide/_history)
### Contents:
[](#contents)
* [Introduction](#introduction)
* [File Formats](#file-formats)
* [Export Individual Files](#export-individual-files)
* [Metadata and Media Info Exports](#metadata-and-media-info-exports)
* [Metadata and Media Info Export Levels](#metadata-and-media-info-export-levels)
* [Custom Fields](#custom-fields)
* [Resource Exports](#resource-exports)
* [Resource Export Levels](#resource-export-levels)
* [Media Type Fields](#media-type-fields)
* [Movies](#movies)
* [Shows](#shows)
* [Seasons](#seasons)
* [Episodes](#episodes)
* [Artists](#artists)
* [Albums](#albums)
* [Tracks](#tracks)
* [Photo Albums](#photo-albums)
* [Photos](#photos)
* [Clips](#clips)
* [Collections](#collections)
* [Playlists](#playlists)
## Introduction
[](#introduction)
The exporter feature of Tautulli allows you to export metadata and media info from your Plex library. The exporter can be accessed from various locations:
1. On any library page from the [Collections](./images/exporter_library_collections.png), [Playlists](./images/exporter_library_playlists.png), or [Export](./images/exporter_library_export.png) tabs. This will allow you to export all of your collections, playlists or all items for any library on your Plex server.
2. On any user page from the [Playlists](./images/exporter_user_playlists.png) tab. This will allow you to export all of a user's playlists for any user on your Plex server.
3. On any media info page from the [Export](./images/exporter_media_info.png) tab. This will allow you to export the metadata for any single media item on your Plex server.
Clicking on the export button on any of those pages will open up the [export metadata modal](./images/exporter_modal.png) where you can customize your export. All the customization options are described in the sections below.
The [metadata exports table](./images/exporter_table.png) on the library, user, or media info page will list all your previous exports and allow you to view or download a copy of the exported files. The download will return the exported file if only a single data file is exported, otherwise the download will return a `zip` archive containing all the exported data files and images. A progress percentage will be shown in the downloads column while an export is in progress. Exports are processed in the background so you may leave the page and check back later when it is complete.
* **Note:** The exporter only exports metadata. There is no import feature available in Tautulli.
## File Formats
[](#file-formats)
Metadata can be exported to various file formats. Notes about each file format is listed in the following table.
|File Format|Description|
|`csv`|Export a comma-separated values file.
* **Note:** Each row in the `csv` file is unique so there may be multiple rows for the same media item (e.g. each `genres.tag` will be on it's own row so a single movie may have multiple rows).|
|`json`|Export a `json` format file.|
|`xml`|Export a `xml` format file.
* **Note:** The `xml` export is not the same as the [Plex XML data](https://support.plex.tv/articles/201998867-investigate-media-information-and-formats/).|
|`m3u`|Only export a `m3u` playlist file with the paths to all the media items without any additional metadata.
* **Note:** All files will be added to the playlist if there are multiple parts/versions.
* **Note:** Export level selections are not allowed.|
### Export Individual Files
[](#export-individual-files)
Enable this option to export one file for each collection/playlist/library item instead of a single file containing all items.
* **Note:** This option is only available when exporting collections, playlists or all items from the library or user page.
## Metadata and Media Info Exports
[](#metadata-and-media-info-exports)
The exporter has several predefined export levels. The export levels are separated into *metadata levels* which include fields about the metadata of the item (e.g. `title`, `year`, `summary`, etc.) and *media info levels* which include fields about the media file (e.g. `media.videoResolution`, `media.audioCodec`, `media.hdr`, etc.). The metadata level and media info level can be different, and the same level *does not* need to be selected for both. Higher levels will include all the fields from the lower levels. The fields that will be exported for each level are listed in the [Media Type Fields](#media-type-field) sections below.
### Metadata and Media Info Export Levels
[](#metadata-and-media-info-export-levels)
|Metadata Export Level|Name|Description|
|**Level 0**|None / Custom|No metadata will be exported. Specify custom metadata fields to select which fields to export.|
|**Level 1**|Basic Metadata|Only basic metadata such as `title`, `year`, `summary`, etc.|
|**Level 2**|Extended Metadata|Tags such as `genres.tag`, `collections.tag`, `roles.tag`, etc.|
|**Level 3**|Advanced Metadata|Fields such as Plex API keys for `art`, `thumb`, `theme`, etc.|
|**Level 9**|All Metadata|All metadata will be exported.|
|Media Info Export Level|Name|Description|
|**Level 0**|None / Custom|No media info will be exported. Specify custom media info fields to select which fields to export.|
|**Level 1**|Basic Media Info|Only basic media info such as `media.bitrate`, `media.videoCodec`, `media.audioChannels`, etc.|
|**Level 2**|Extended Media Info|Fields for the specific media file part such as `media.parts.size`, `media.parts.duration`, etc.|
|**Level 3**|Advanced Media Info|Fields for specific streams inside a media file part such as
`media.parts.videoStream.refFrames`, `media.parts.audioStream.samplingRate`, `media.parts.subtitleStream.language`, etc.|
|**Level 9**|All Media Info|All media info will be exported.|
### Custom Fields
[](#custom-fields)
[Custom fields](./images/exporter_custom_fields.png) can be added *in addition* to any export level. All fields from the selected metadata or media info level *plus* the custom fields will be exported. Start typing in the custom field box to search for a specific field to add. Some fields will be disabled to indicate that it is already included in the selected export level. All the available fields are listed in the [Media Type Fields](#media-type-field) sections below.
* **Note:** Custom fields for child media types are prefixed with the media type and separated with periods (`.`). The periods also delineate the tree structure in the `json` or `xml` file.
* e.g. The `seasons.episodes.title` field will export the episode title for all seasons and all episodes for a TV show.
* **Note:** For [Collections](#collection) and [Playlists](#playlist), the `items` prefix can be different media types depending on the context. Refer to the [Media Type Fields](#media-type-field) sections below for all the possible media types.
* e.g. The `items.title` field will be the movie title in a movie collection or TV show titles in a TV show collection.
## Resource Exports
[](#resource-exports)
[Image and theme resources](./images/exporter_images.png) can be exported along with the metadata. Resources will be exported to a `.resources` folder alongside the data file with the following extensions:
* Posters and Covers: `.thumb.jpg`
* Background Artwork: `.art.jpg`
* Logos: `.logo.png`
* Square Art: `.squareArt.jpg`
* Theme Music: `.theme.mp3`
When downloading an export from the [metadata exports table](./images/exporter_table.png), the resources will be included in a `zip` archive with the data file.
* **Warning:** Exporting resources may take a long time!
* **Note:** Resources will only be exported by the selected resource export level for the following supported media types:
* Movies, shows, seasons, artists, albums, collections and collection items, playlist items
* **Note:** Additional images for *any* media type can be exported by adding the following custom metadata fields:
* Posters and Covers: `thumbFile`
* Background Artwork: `artFile`
* Logos: `logoFile`
* Square Art: `squareArtFile`
* Theme Music: `themeFile`
Adding the custom field will export *all* resources of that type regardless of the selected resource export level.
* e.g. Adding `episodes.thumbFile` to the custom metadata fields will export all episode thumbnails even though it is not included in the supported resource export media types.
### Resource Export Levels
[](#resource-export-levels)
|Poser and Cover Image Export Level|Name|Description|
|**Level 0**|None / Custom|No poster/cover images will be exported. Specific posters/covers can be exported by adding `thumbFile` to the custom metadata fields.|
|**Level 1**|Uploaded and Selected Posters and Covers Only|Only custom poster/cover images which have been uploaded manually and are currently selected as the active poster/cover.|
|**Level 2**|Selected and Locked Posters and Covers Only|Only currently selected poster/cover images which have been changed from the default poster/cover.|
|**Level 9**|All Selected Posters and Covers|All poster/cover images for the supported media types.|
|Background Artwork Image Export Level|Name|Description|
|**Level 0**|None / Custom|No background artwork images will be exported. Specific background art can be exported by adding `artFile` to the custom metadata fields.|
|**Level 1**|Uploaded and Selected Artwork Only|Only custom background artwork images which have been uploaded manually and are currently selected as the active artwork.|
|**Level 2**|Selected and Locked Artwork Only|Only currently selected background artwork images which have been changed from the default artwork.|
|**Level 9**|All Selected Artwork|All background artwork images for the supported media types.|
|Logo Image Export Level|Name|Description|
|**Level 0**|None / Custom|No logo images will be exported. Specific logos can be exported by adding `logoFile` to the custom metadata fields.|
|**Level 1**|Uploaded and Selected Logos Only|Only custom logo images which have been uploaded manually and are currently selected as the active artwork.|
|**Level 2**|Selected and Locked Logos Only|Only currently selected logo images which have been changed from the default logo.|
|**Level 9**|All Selected Logos|All logo images for the supported media types.|
|Square Art Image Export Level|Name|Description|
|**Level 0**|None / Custom|No square art images will be exported. Specific square art can be exported by adding `squareArtFile` to the custom metadata fields.|
|**Level 1**|Uploaded and Selected Square Art Only|Only custom square art images which have been uploaded manually and are currently selected as the active artwork.|
|**Level 2**|Selected and Locked Square Art Only|Only currently selected square art images which have been changed from the default square art.|
|**Level 9**|All Selected Square Art|All square art images for the supported media types.|
|Theme Music Export Level|Name|Description|
|**Level 0**|None / Custom|No theme music will be exported. Specific theme music can be exported by adding `themeFile` to the custom metadata fields.|
|**Level 1**|Uploaded and Selected Theme Music Only|Only custom theme music which has been uploaded manually and is currently selected as the active theme music.|
|**Level 2**|Selected and Locked Theme Music Only|Only currently selected theme music which have been changed from the default theme music.|
|**Level 9**|All Selected Theme Music|All theme music for the supported media types.|
## Media Type Fields
[](#media-type-fields)
### Movies
[](#movies)
**Metadata Fields**
|Metadata Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`addedAt`||✓|✓|✓|✓|
|`art`||||✓|✓|
|`artBlurHash`|||||✓|
|`artFile`|Refer to [Resource Exports](#resource-export)|||||
|`artProvider`|||||✓|
|`audienceRating`||✓|✓|✓|✓|
|`audienceRatingImage`||✓|✓|✓|✓|
|`chapterSource`||||✓|✓|
|`contentRating`||✓|✓|✓|✓|
|`duration`||✓|✓|✓|✓|
|`durationHuman`||✓|✓|✓|✓|
|`editionTitle`||✓|✓|✓|✓|
|`enableCreditsMarkerGeneration`|||||✓|
|`guid`||✓|✓|✓|✓|
|`hasCreditsMarker`||✓|✓|✓|✓|
|`hasPreviewThumbnails`||||✓|✓|
|`hasVoiceActivity`||||✓|✓|
|`key`||||✓|✓|
|`languageOverride`|||||✓|
|`lastRatedAt`||||✓|✓|
|`lastViewedAt`||||✓|✓|
|`librarySectionID`|||||✓|
|`librarySectionKey`|||||✓|
|`librarySectionTitle`|||||✓|
|`logo`|||||✓|
|`logoFile`|Refer to [Resource Exports](#resource-export)|||||
|`logoProvider`|||||✓|
|`metadataDirectory`|||||✓|
|`originalTitle`||✓|✓|✓|✓|
|`originallyAvailableAt`||✓|✓|✓|✓|
|`rating`||✓|✓|✓|✓|
|`ratingImage`||✓|✓|✓|✓|
|`ratingKey`||✓|✓|✓|✓|
|`slug`|||||✓|
|`squareArt`|||||✓|
|`squareArtFile`|Refer to [Resource Exports](#resource-export)|||||
|`squareArtProvider`|||||✓|
|`studio`||✓|✓|✓|✓|
|`summary`||✓|✓|✓|✓|
|`tagline`||✓|✓|✓|✓|
|`theme`|||||✓|
|`themeFile`|Refer to [Resource Exports](#resource-export)|||||
|`themeProvider`|||||✓|
|`thumb`||||✓|✓|
|`thumbBlurHash`|||||✓|
|`thumbFile`|Refer to [Resource Exports](#resource-export)|||||
|`thumbProvider`|||||✓|
|`title`||✓|✓|✓|✓|
|`titleSort`||✓|✓|✓|✓|
|`type`||✓|✓|✓|✓|
|`updatedAt`||||✓|✓|
|`useOriginalTitle`|||||✓|
|`userRating`||✓|✓|✓|✓|
|`viewCount`||||✓|✓|
|`viewOffset`|||||✓|
|`year`||✓|✓|✓|✓|
|`chapters.end`||||✓|✓|
|`chapters.id`|||||✓|
|`chapters.index`||||✓|✓|
|`chapters.start`||||✓|✓|
|`chapters.tag`||||✓|✓|
|`chapters.thumb`||||✓|✓|
|`collections.id`|||||✓|
|`collections.tag`|||✓|✓|✓|
|`countries.id`|||||✓|
|`countries.tag`|||✓|✓|✓|
|`directors.id`|||||✓|
|`directors.tag`|||✓|✓|✓|
|`fields.locked`|||✓|✓|✓|
|`fields.name`|||✓|✓|✓|
|`genres.id`|||||✓|
|`genres.tag`|||✓|✓|✓|
|`guids.id`|||✓|✓|✓|
|`labels.id`|||||✓|
|`labels.tag`|||✓|✓|✓|
|`markers.end`|||✓|✓|✓|
|`markers.final`|||✓|✓|✓|
|`markers.first`|||✓|✓|✓|
|`markers.id`|||||✓|
|`markers.start`|||✓|✓|✓|
|`markers.type`|||✓|✓|✓|
|`producers.id`|||||✓|
|`producers.tag`|||✓|✓|✓|
|`roles.id`|||||✓|
|`roles.role`|||✓|✓|✓|
|`roles.tag`|||✓|✓|✓|
|`roles.thumb`|||||✓|
|`writers.id`|||||✓|
|`writers.tag`|||✓|✓|✓|
**Media Info Fields**
|Media Info Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`locations`||✓|✓|✓|✓|
|`media.aspectRatio`||✓|✓|✓|✓|
|`media.audioChannels`||✓|✓|✓|✓|
|`media.audioCodec`||✓|✓|✓|✓|
|`media.audioProfile`||✓|✓|✓|✓|
|`media.bitrate`||✓|✓|✓|✓|
|`media.container`||✓|✓|✓|✓|
|`media.duration`||✓|✓|✓|✓|
|`media.has64bitOffsets`|||||✓|
|`media.hasVoiceActivity`|||||✓|
|`media.hdr`||✓|✓|✓|✓|
|`media.height`||✓|✓|✓|✓|
|`media.id`|||||✓|
|`media.isOptimizedVersion`||✓|✓|✓|✓|
|`media.optimizedForStreaming`|||||✓|
|`media.proxyType`|||||✓|
|`media.target`|||||✓|
|`media.title`|||||✓|
|`media.videoCodec`||✓|✓|✓|✓|
|`media.videoFrameRate`||✓|✓|✓|✓|
|`media.videoProfile`||✓|✓|✓|✓|
|`media.videoResolution`||✓|✓|✓|✓|
|`media.width`||✓|✓|✓|✓|
|`media.parts.accessible`|||||✓|
|`media.parts.audioProfile`|||✓|✓|✓|
|`media.parts.container`|||✓|✓|✓|
|`media.parts.deepAnalysisVersion`|||✓|✓|✓|
|`media.parts.duration`|||✓|✓|✓|
|`media.parts.exists`|||||✓|
|`media.parts.file`|||✓|✓|✓|
|`media.parts.has64bitOffsets`|||||✓|
|`media.parts.hasPreviewThumbnails`|||✓|✓|✓|
|`media.parts.hasThumbnail`|||||✓|
|`media.parts.id`|||||✓|
|`media.parts.indexes`|||✓|✓|✓|
|`media.parts.key`|||||✓|
|`media.parts.optimizedForStreaming`|||✓|✓|✓|
|`media.parts.packetLength`|||||✓|
|`media.parts.requiredBandwidths`|||||✓|
|`media.parts.size`|||✓|✓|✓|
|`media.parts.sizeHuman`|||✓|✓|✓|
|`media.parts.syncItemId`|||||✓|
|`media.parts.syncState`|||||✓|
|`media.parts.videoProfile`|||✓|✓|✓|
|`media.parts.audioStreams.audioChannelLayout`||||✓|✓|
|`media.parts.audioStreams.bitDepth`||||✓|✓|
|`media.parts.audioStreams.bitrate`||||✓|✓|
|`media.parts.audioStreams.bitrateMode`|||||✓|
|`media.parts.audioStreams.channels`||||✓|✓|
|`media.parts.audioStreams.codec`||||✓|✓|
|`media.parts.audioStreams.default`||||✓|✓|
|`media.parts.audioStreams.displayTitle`||||✓|✓|
|`media.parts.audioStreams.duration`|||||✓|
|`media.parts.audioStreams.extendedDisplayTitle`||||✓|✓|
|`media.parts.audioStreams.id`|||||✓|
|`media.parts.audioStreams.index`|||||✓|
|`media.parts.audioStreams.key`|||||✓|
|`media.parts.audioStreams.language`||||✓|✓|
|`media.parts.audioStreams.languageCode`||||✓|✓|
|`media.parts.audioStreams.languageTag`|||||✓|
|`media.parts.audioStreams.profile`||||✓|✓|
|`media.parts.audioStreams.requiredBandwidths`|||||✓|
|`media.parts.audioStreams.samplingRate`||||✓|✓|
|`media.parts.audioStreams.selected`|||||✓|
|`media.parts.audioStreams.streamIdentifier`|||||✓|
|`media.parts.audioStreams.streamType`|||||✓|
|`media.parts.audioStreams.title`||||✓|✓|
|`media.parts.audioStreams.type`|||||✓|
|`media.parts.audioStreams.visualImpaired`|||||✓|
|`media.parts.subtitleStreams.canAutoSync`|||||✓|
|`media.parts.subtitleStreams.codec`||||✓|✓|
|`media.parts.subtitleStreams.container`||||✓|✓|
|`media.parts.subtitleStreams.default`||||✓|✓|
|`media.parts.subtitleStreams.displayTitle`||||✓|✓|
|`media.parts.subtitleStreams.extendedDisplayTitle`||||✓|✓|
|`media.parts.subtitleStreams.forced`||||✓|✓|
|`media.parts.subtitleStreams.format`||||✓|✓|
|`media.parts.subtitleStreams.headerCompression`|||||✓|
|`media.parts.subtitleStreams.hearingImpaired`|||||✓|
|`media.parts.subtitleStreams.id`|||||✓|
|`media.parts.subtitleStreams.index`|||||✓|
|`media.parts.subtitleStreams.key`|||||✓|
|`media.parts.subtitleStreams.language`||||✓|✓|
|`media.parts.subtitleStreams.languageCode`||||✓|✓|
|`media.parts.subtitleStreams.languageTag`|||||✓|
|`media.parts.subtitleStreams.perfectMatch`|||||✓|
|`media.parts.subtitleStreams.providerTitle`|||||✓|
|`media.parts.subtitleStreams.requiredBandwidths`|||||✓|
|`media.parts.subtitleStreams.score`|||||✓|
|`media.parts.subtitleStreams.selected`|||||✓|
|`media.parts.subtitleStreams.sourceKey`|||||✓|
|`media.parts.subtitleStreams.streamType`|||||✓|
|`media.parts.subtitleStreams.title`||||✓|✓|
|`media.parts.subtitleStreams.transient`|||||✓|
|`media.parts.subtitleStreams.type`|||||✓|
|`media.parts.subtitleStreams.userID`|||||✓|
|`media.parts.videoStreams.DOVIBLCompatID`|||||✓|
|`media.parts.videoStreams.DOVIBLPresent`|||||✓|
|`media.parts.videoStreams.DOVIELPresent`|||||✓|
|`media.parts.videoStreams.DOVILevel`|||||✓|
|`media.parts.videoStreams.DOVIPresent`|||||✓|
|`media.parts.videoStreams.DOVIProfile`|||||✓|
|`media.parts.videoStreams.DOVIRPUPresent`|||||✓|
|`media.parts.videoStreams.DOVIVersion`|||||✓|
|`media.parts.videoStreams.anamorphic`|||||✓|
|`media.parts.videoStreams.bitDepth`||||✓|✓|
|`media.parts.videoStreams.bitrate`||||✓|✓|
|`media.parts.videoStreams.cabac`|||||✓|
|`media.parts.videoStreams.chromaLocation`|||||✓|
|`media.parts.videoStreams.chromaSubsampling`|||||✓|
|`media.parts.videoStreams.codec`||||✓|✓|
|`media.parts.videoStreams.codecID`|||||✓|
|`media.parts.videoStreams.codedHeight`|||||✓|
|`media.parts.videoStreams.codedWidth`|||||✓|
|`media.parts.videoStreams.colorPrimaries`|||||✓|
|`media.parts.videoStreams.colorRange`|||||✓|
|`media.parts.videoStreams.colorSpace`||||✓|✓|
|`media.parts.videoStreams.colorTrc`|||||✓|
|`media.parts.videoStreams.default`||||✓|✓|
|`media.parts.videoStreams.displayTitle`||||✓|✓|
|`media.parts.videoStreams.duration`|||||✓|
|`media.parts.videoStreams.extendedDisplayTitle`||||✓|✓|
|`media.parts.videoStreams.frameRate`||||✓|✓|
|`media.parts.videoStreams.frameRateMode`|||||✓|
|`media.parts.videoStreams.hasScalingMatrix`|||||✓|
|`media.parts.videoStreams.hdr`||||✓|✓|
|`media.parts.videoStreams.height`||||✓|✓|
|`media.parts.videoStreams.id`|||||✓|
|`media.parts.videoStreams.index`|||||✓|
|`media.parts.videoStreams.key`|||||✓|
|`media.parts.videoStreams.language`||||✓|✓|
|`media.parts.videoStreams.languageCode`||||✓|✓|
|`media.parts.videoStreams.languageTag`|||||✓|
|`media.parts.videoStreams.level`||||✓|✓|
|`media.parts.videoStreams.pixelAspectRatio`|||||✓|
|`media.parts.videoStreams.pixelFormat`|||||✓|
|`media.parts.videoStreams.profile`||||✓|✓|
|`media.parts.videoStreams.refFrames`||||✓|✓|
|`media.parts.videoStreams.requiredBandwidths`|||||✓|
|`media.parts.videoStreams.scanType`||||✓|✓|
|`media.parts.videoStreams.selected`|||||✓|
|`media.parts.videoStreams.streamIdentifier`|||||✓|
|`media.parts.videoStreams.streamType`|||||✓|
|`media.parts.videoStreams.title`||||✓|✓|
|`media.parts.videoStreams.type`|||||✓|
|`media.parts.videoStreams.width`||||✓|✓|
### Shows
[](#shows)
**Metadata Fields**
|Metadata Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`addedAt`||✓|✓|✓|✓|
|`art`||||✓|✓|
|`artBlurHash`|||||✓|
|`artFile`|Refer to [Resource Exports](#resource-export)|||||
|`artProvider`|||||✓|
|`audienceRating`||✓|✓|✓|✓|
|`audienceRatingImage`||✓|✓|✓|✓|
|`audioLanguage`|||||✓|
|`autoDeletionItemPolicyUnwatchedLibrary`|||||✓|
|`autoDeletionItemPolicyWatchedLibrary`|||||✓|
|`childCount`||✓|✓|✓|✓|
|`contentRating`||✓|✓|✓|✓|
|`duration`||✓|✓|✓|✓|
|`durationHuman`||✓|✓|✓|✓|
|`enableCreditsMarkerGeneration`|||||✓|
|`episodeSort`|||||✓|
|`flattenSeasons`|||||✓|
|`guid`||✓|✓|✓|✓|
|`index`|||||✓|
|`key`||||✓|✓|
|`languageOverride`|||||✓|
|`lastRatedAt`||||✓|✓|
|`lastViewedAt`||||✓|✓|
|`leafCount`|||||✓|
|`librarySectionID`|||||✓|
|`librarySectionKey`|||||✓|
|`librarySectionTitle`|||||✓|
|`logo`|||||✓|
|`logoFile`|Refer to [Resource Exports](#resource-export)|||||
|`logoProvider`|||||✓|
|`metadataDirectory`|||||✓|
|`network`||✓|✓|✓|✓|
|`originalTitle`||✓|✓|✓|✓|
|`originallyAvailableAt`||✓|✓|✓|✓|
|`rating`||✓|✓|✓|✓|
|`ratingKey`||✓|✓|✓|✓|
|`seasonCount`||✓|✓|✓|✓|
|`showOrdering`|||||✓|
|`slug`|||||✓|
|`squareArt`|||||✓|
|`squareArtFile`|Refer to [Resource Exports](#resource-export)|||||
|`squareArtProvider`|||||✓|
|`studio`||✓|✓|✓|✓|
|`subtitleLanguage`|||||✓|
|`subtitleMode`|||||✓|
|`summary`||✓|✓|✓|✓|
|`tagline`||✓|✓|✓|✓|
|`theme`||||✓|✓|
|`themeFile`|Refer to [Resource Exports](#resource-export)|||||
|`themeProvider`|||||✓|
|`thumb`||||✓|✓|
|`thumbBlurHash`|||||✓|
|`thumbFile`|Refer to [Resource Exports](#resource-export)|||||
|`thumbProvider`|||||✓|
|`title`||✓|✓|✓|✓|
|`titleSort`||✓|✓|✓|✓|
|`type`||✓|✓|✓|✓|
|`updatedAt`||||✓|✓|
|`useOriginalTitle`|||||✓|
|`userRating`||✓|✓|✓|✓|
|`viewCount`||||✓|✓|
|`viewedLeafCount`|||||✓|
|`year`||✓|✓|✓|✓|
|`collections.id`|||||✓|
|`collections.tag`|||✓|✓|✓|
|`fields.locked`|||✓|✓|✓|
|`fields.name`|||✓|✓|✓|
|`genres.id`|||||✓|
|`genres.tag`|||✓|✓|✓|
|`guids.id`|||✓|✓|✓|
|`labels.id`|||||✓|
|`labels.tag`|||✓|✓|✓|
|`roles.id`|||||✓|
|`roles.role`|||✓|✓|✓|
|`roles.tag`|||✓|✓|✓|
|`roles.thumb`|||||✓|
|`seasons`||✓
Includes [Seasons](#show-season) Level 1|✓
Includes [Seasons](#show-season) Level 2|✓
Includes [Seasons](#show-season) Level 3|✓
Includes [Seasons](#show-season) Level 9|
**Media Info Fields**
|Media Info Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`locations`|||||✓|
|`seasons`||✓
Includes [Seasons](#show-season) Level 1|✓
Includes [Seasons](#show-season) Level 2|✓
Includes [Seasons](#show-season) Level 3|✓
Includes [Seasons](#show-season) Level 9|
### Seasons
[](#seasons)
**Metadata Fields**
|Metadata Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`addedAt`||✓|✓|✓|✓|
|`art`||||✓|✓|
|`artBlurHash`|||||✓|
|`artFile`|Refer to [Resource Exports](#resource-export)|||||
|`artProvider`|||||✓|
|`audioLanguage`|||||✓|
|`guid`||✓|✓|✓|✓|
|`index`|||||✓|
|`key`||||✓|✓|
|`lastRatedAt`||||✓|✓|
|`lastViewedAt`||||✓|✓|
|`leafCount`|||||✓|
|`librarySectionID`|||||✓|
|`librarySectionKey`|||||✓|
|`librarySectionTitle`|||||✓|
|`logo`|||||✓|
|`logoFile`|Refer to [Resource Exports](#resource-export)|||||
|`logoProvider`|||||✓|
|`metadataDirectory`|||||✓|
|`parentGuid`||✓|✓|✓|✓|
|`parentIndex`|||||✓|
|`parentKey`||||✓|✓|
|`parentRatingKey`||✓|✓|✓|✓|
|`parentStudio`|||||✓|
|`parentTheme`||||✓|✓|
|`parentThumb`||||✓|✓|
|`parentTitle`||✓|✓|✓|✓|
|`ratingKey`||✓|✓|✓|✓|
|`seasonNumber`||✓|✓|✓|✓|
|`slug`|||||✓|
|`squareArt`|||||✓|
|`squareArtFile`|Refer to [Resource Exports](#resource-export)|||||
|`squareArtProvider`|||||✓|
|`subtitleLanguage`|||||✓|
|`subtitleMode`|||||✓|
|`summary`||✓|✓|✓|✓|
|`thumb`||||✓|✓|
|`thumbBlurHash`|||||✓|
|`thumbFile`|Refer to [Resource Exports](#resource-export)|||||
|`thumbProvider`|||||✓|
|`title`||✓|✓|✓|✓|
|`titleSort`||✓|✓|✓|✓|
|`type`||✓|✓|✓|✓|
|`updatedAt`||||✓|✓|
|`userRating`||✓|✓|✓|✓|
|`viewCount`||||✓|✓|
|`viewedLeafCount`|||||✓|
|`year`||✓|✓|✓|✓|
|`collections.id`|||||✓|
|`collections.tag`|||✓|✓|✓|
|`fields.locked`|||✓|✓|✓|
|`fields.name`|||✓|✓|✓|
|`guids.id`|||✓|✓|✓|
|`labels.id`|||||✓|
|`labels.tag`|||||✓|
|`episodes`||✓
Includes [Episodes](#season-episode) Level 1|✓
Includes [Episodes](#season-episode) Level 2|✓
Includes [Episodes](#season-episode) Level 3|✓
Includes [Episodes](#season-episode) Level 9|
**Media Info Fields**
|Media Info Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`episodes`||✓
Includes [Episodes](#season-episode) Level 1|✓
Includes [Episodes](#season-episode) Level 2|✓
Includes [Episodes](#season-episode) Level 3|✓
Includes [Episodes](#season-episode) Level 9|
### Episodes
[](#episodes)
**Metadata Fields**
|Metadata Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`addedAt`||✓|✓|✓|✓|
|`art`||||✓|✓|
|`artBlurHash`|||||✓|
|`artFile`|||||✓|
|`artProvider`|||||✓|
|`audienceRating`||✓|✓|✓|✓|
|`audienceRatingImage`||✓|✓|✓|✓|
|`chapterSource`||||✓|✓|
|`contentRating`||✓|✓|✓|✓|
|`duration`||✓|✓|✓|✓|
|`durationHuman`||✓|✓|✓|✓|
|`episodeNumber`||✓|✓|✓|✓|
|`grandparentArt`||||✓|✓|
|`grandparentGuid`||✓|✓|✓|✓|
|`grandparentKey`||||✓|✓|
|`grandparentRatingKey`||✓|✓|✓|✓|
|`grandparentTheme`||||✓|✓|
|`grandparentThumb`||||✓|✓|
|`grandparentTitle`||✓|✓|✓|✓|
|`guid`||✓|✓|✓|✓|
|`hasCommercialMarker`||✓|✓|✓|✓|
|`hasCreditsMarker`||✓|✓|✓|✓|
|`hasIntroMarker`||✓|✓|✓|✓|
|`hasPreviewThumbnails`||||✓|✓|
|`hasVoiceActivity`||||✓|✓|
|`index`|||||✓|
|`key`||||✓|✓|
|`lastRatedAt`||||✓|✓|
|`lastViewedAt`||||✓|✓|
|`librarySectionID`|||||✓|
|`librarySectionKey`|||||✓|
|`librarySectionTitle`|||||✓|
|`logo`|||||✓|
|`logoFile`|Refer to [Resource Exports](#resource-export)|||||
|`logoProvider`|||||✓|
|`metadataDirectory`|||||✓|
|`originallyAvailableAt`||✓|✓|✓|✓|
|`parentGuid`||✓|✓|✓|✓|
|`parentIndex`|||||✓|
|`parentKey`||||✓|✓|
|`parentRatingKey`||✓|✓|✓|✓|
|`parentThumb`||||✓|✓|
|`parentTitle`||✓|✓|✓|✓|
|`parentYear`||✓|✓|✓|✓|
|`rating`||✓|✓|✓|✓|
|`ratingKey`||✓|✓|✓|✓|
|`seasonEpisode`||✓|✓|✓|✓|
|`seasonNumber`||✓|✓|✓|✓|
|`slug`|||||✓|
|`squareArt`|||||✓|
|`squareArtFile`|Refer to [Resource Exports](#resource-export)|||||
|`squareArtProvider`|||||✓|
|`summary`||✓|✓|✓|✓|
|`thumb`||||✓|✓|
|`thumbBlurHash`|||||✓|
|`thumbFile`|||||✓|
|`thumbProvider`|||||✓|
|`title`||✓|✓|✓|✓|
|`titleSort`||✓|✓|✓|✓|
|`type`||✓|✓|✓|✓|
|`updatedAt`||||✓|✓|
|`userRating`||✓|✓|✓|✓|
|`viewCount`||||✓|✓|
|`viewOffset`|||||✓|
|`year`||✓|✓|✓|✓|
|`chapters.end`||||✓|✓|
|`chapters.id`|||||✓|
|`chapters.index`||||✓|✓|
|`chapters.start`||||✓|✓|
|`chapters.tag`||||✓|✓|
|`chapters.thumb`||||✓|✓|
|`collections.id`|||||✓|
|`collections.tag`|||✓|✓|✓|
|`directors.id`|||||✓|
|`directors.tag`|||✓|✓|✓|
|`fields.locked`|||✓|✓|✓|
|`fields.name`|||✓|✓|✓|
|`guids.id`|||✓|✓|✓|
|`labels.id`|||||✓|
|`labels.tag`|||||✓|
|`markers.end`|||✓|✓|✓|
|`markers.final`|||✓|✓|✓|
|`markers.first`|||✓|✓|✓|
|`markers.id`|||||✓|
|`markers.start`|||✓|✓|✓|
|`markers.type`|||✓|✓|✓|
|`producers.id`|||||✓|
|`producers.tag`|||✓|✓|✓|
|`roles.id`|||||✓|
|`roles.role`|||✓|✓|✓|
|`roles.tag`|||✓|✓|✓|
|`roles.thumb`|||||✓|
|`writers.id`|||||✓|
|`writers.tag`|||✓|✓|✓|
**Media Info Fields**
|Media Info Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`locations`||✓|✓|✓|✓|
|`media.aspectRatio`||✓|✓|✓|✓|
|`media.audioChannels`||✓|✓|✓|✓|
|`media.audioCodec`||✓|✓|✓|✓|
|`media.audioProfile`||✓|✓|✓|✓|
|`media.bitrate`||✓|✓|✓|✓|
|`media.container`||✓|✓|✓|✓|
|`media.duration`||✓|✓|✓|✓|
|`media.has64bitOffsets`|||||✓|
|`media.hasVoiceActivity`|||||✓|
|`media.hdr`||✓|✓|✓|✓|
|`media.height`||✓|✓|✓|✓|
|`media.id`|||||✓|
|`media.isOptimizedVersion`||✓|✓|✓|✓|
|`media.optimizedForStreaming`|||||✓|
|`media.proxyType`|||||✓|
|`media.target`|||||✓|
|`media.title`|||||✓|
|`media.videoCodec`||✓|✓|✓|✓|
|`media.videoFrameRate`||✓|✓|✓|✓|
|`media.videoProfile`||✓|✓|✓|✓|
|`media.videoResolution`||✓|✓|✓|✓|
|`media.width`||✓|✓|✓|✓|
|`media.parts.accessible`|||||✓|
|`media.parts.audioProfile`|||✓|✓|✓|
|`media.parts.container`|||✓|✓|✓|
|`media.parts.deepAnalysisVersion`|||✓|✓|✓|
|`media.parts.duration`|||✓|✓|✓|
|`media.parts.exists`|||||✓|
|`media.parts.file`|||✓|✓|✓|
|`media.parts.has64bitOffsets`|||||✓|
|`media.parts.hasPreviewThumbnails`|||✓|✓|✓|
|`media.parts.hasThumbnail`|||||✓|
|`media.parts.id`|||||✓|
|`media.parts.indexes`|||✓|✓|✓|
|`media.parts.key`|||||✓|
|`media.parts.optimizedForStreaming`|||✓|✓|✓|
|`media.parts.packetLength`|||||✓|
|`media.parts.requiredBandwidths`|||||✓|
|`media.parts.size`|||✓|✓|✓|
|`media.parts.sizeHuman`|||✓|✓|✓|
|`media.parts.syncItemId`|||||✓|
|`media.parts.syncState`|||||✓|
|`media.parts.videoProfile`|||✓|✓|✓|
|`media.parts.audioStreams.audioChannelLayout`||||✓|✓|
|`media.parts.audioStreams.bitDepth`||||✓|✓|
|`media.parts.audioStreams.bitrate`||||✓|✓|
|`media.parts.audioStreams.bitrateMode`|||||✓|
|`media.parts.audioStreams.channels`||||✓|✓|
|`media.parts.audioStreams.codec`||||✓|✓|
|`media.parts.audioStreams.default`||||✓|✓|
|`media.parts.audioStreams.displayTitle`||||✓|✓|
|`media.parts.audioStreams.duration`|||||✓|
|`media.parts.audioStreams.extendedDisplayTitle`||||✓|✓|
|`media.parts.audioStreams.id`|||||✓|
|`media.parts.audioStreams.index`|||||✓|
|`media.parts.audioStreams.key`|||||✓|
|`media.parts.audioStreams.language`||||✓|✓|
|`media.parts.audioStreams.languageCode`||||✓|✓|
|`media.parts.audioStreams.languageTag`|||||✓|
|`media.parts.audioStreams.profile`||||✓|✓|
|`media.parts.audioStreams.requiredBandwidths`|||||✓|
|`media.parts.audioStreams.samplingRate`||||✓|✓|
|`media.parts.audioStreams.selected`|||||✓|
|`media.parts.audioStreams.streamIdentifier`|||||✓|
|`media.parts.audioStreams.streamType`|||||✓|
|`media.parts.audioStreams.title`||||✓|✓|
|`media.parts.audioStreams.type`|||||✓|
|`media.parts.audioStreams.visualImpaired`|||||✓|
|`media.parts.subtitleStreams.canAutoSync`|||||✓|
|`media.parts.subtitleStreams.codec`||||✓|✓|
|`media.parts.subtitleStreams.container`||||✓|✓|
|`media.parts.subtitleStreams.default`||||✓|✓|
|`media.parts.subtitleStreams.displayTitle`||||✓|✓|
|`media.parts.subtitleStreams.extendedDisplayTitle`||||✓|✓|
|`media.parts.subtitleStreams.forced`||||✓|✓|
|`media.parts.subtitleStreams.format`||||✓|✓|
|`media.parts.subtitleStreams.headerCompression`|||||✓|
|`media.parts.subtitleStreams.hearingImpaired`|||||✓|
|`media.parts.subtitleStreams.id`|||||✓|
|`media.parts.subtitleStreams.index`|||||✓|
|`media.parts.subtitleStreams.key`|||||✓|
|`media.parts.subtitleStreams.language`||||✓|✓|
|`media.parts.subtitleStreams.languageCode`||||✓|✓|
|`media.parts.subtitleStreams.languageTag`|||||✓|
|`media.parts.subtitleStreams.perfectMatch`|||||✓|
|`media.parts.subtitleStreams.providerTitle`|||||✓|
|`media.parts.subtitleStreams.requiredBandwidths`|||||✓|
|`media.parts.subtitleStreams.score`|||||✓|
|`media.parts.subtitleStreams.selected`|||||✓|
|`media.parts.subtitleStreams.sourceKey`|||||✓|
|`media.parts.subtitleStreams.streamType`|||||✓|
|`media.parts.subtitleStreams.title`||||✓|✓|
|`media.parts.subtitleStreams.transient`|||||✓|
|`media.parts.subtitleStreams.type`|||||✓|
|`media.parts.subtitleStreams.userID`|||||✓|
|`media.parts.videoStreams.DOVIBLCompatID`|||||✓|
|`media.parts.videoStreams.DOVIBLPresent`|||||✓|
|`media.parts.videoStreams.DOVIELPresent`|||||✓|
|`media.parts.videoStreams.DOVILevel`|||||✓|
|`media.parts.videoStreams.DOVIPresent`|||||✓|
|`media.parts.videoStreams.DOVIProfile`|||||✓|
|`media.parts.videoStreams.DOVIRPUPresent`|||||✓|
|`media.parts.videoStreams.DOVIVersion`|||||✓|
|`media.parts.videoStreams.anamorphic`|||||✓|
|`media.parts.videoStreams.bitDepth`||||✓|✓|
|`media.parts.videoStreams.bitrate`||||✓|✓|
|`media.parts.videoStreams.cabac`|||||✓|
|`media.parts.videoStreams.chromaLocation`|||||✓|
|`media.parts.videoStreams.chromaSubsampling`|||||✓|
|`media.parts.videoStreams.codec`||||✓|✓|
|`media.parts.videoStreams.codecID`|||||✓|
|`media.parts.videoStreams.codedHeight`|||||✓|
|`media.parts.videoStreams.codedWidth`|||||✓|
|`media.parts.videoStreams.colorPrimaries`|||||✓|
|`media.parts.videoStreams.colorRange`|||||✓|
|`media.parts.videoStreams.colorSpace`||||✓|✓|
|`media.parts.videoStreams.colorTrc`|||||✓|
|`media.parts.videoStreams.default`||||✓|✓|
|`media.parts.videoStreams.displayTitle`||||✓|✓|
|`media.parts.videoStreams.duration`|||||✓|
|`media.parts.videoStreams.extendedDisplayTitle`||||✓|✓|
|`media.parts.videoStreams.frameRate`||||✓|✓|
|`media.parts.videoStreams.frameRateMode`|||||✓|
|`media.parts.videoStreams.hasScalingMatrix`|||||✓|
|`media.parts.videoStreams.hdr`||||✓|✓|
|`media.parts.videoStreams.height`||||✓|✓|
|`media.parts.videoStreams.id`|||||✓|
|`media.parts.videoStreams.index`|||||✓|
|`media.parts.videoStreams.key`|||||✓|
|`media.parts.videoStreams.language`||||✓|✓|
|`media.parts.videoStreams.languageCode`||||✓|✓|
|`media.parts.videoStreams.languageTag`|||||✓|
|`media.parts.videoStreams.level`||||✓|✓|
|`media.parts.videoStreams.pixelAspectRatio`|||||✓|
|`media.parts.videoStreams.pixelFormat`|||||✓|
|`media.parts.videoStreams.profile`||||✓|✓|
|`media.parts.videoStreams.refFrames`||||✓|✓|
|`media.parts.videoStreams.requiredBandwidths`|||||✓|
|`media.parts.videoStreams.scanType`||||✓|✓|
|`media.parts.videoStreams.selected`|||||✓|
|`media.parts.videoStreams.streamIdentifier`|||||✓|
|`media.parts.videoStreams.streamType`|||||✓|
|`media.parts.videoStreams.title`||||✓|✓|
|`media.parts.videoStreams.type`|||||✓|
|`media.parts.videoStreams.width`||||✓|✓|
### Artists
[](#artists)
**Metadata Fields**
|Metadata Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`addedAt`||✓|✓|✓|✓|
|`albumSort`|||||✓|
|`art`||||✓|✓|
|`artBlurHash`|||||✓|
|`artFile`|Refer to [Resource Exports](#resource-export)|||||
|`artProvider`|||||✓|
|`guid`||✓|✓|✓|✓|
|`index`|||||✓|
|`key`||||✓|✓|
|`lastRatedAt`||||✓|✓|
|`lastViewedAt`||||✓|✓|
|`librarySectionID`|||||✓|
|`librarySectionKey`|||||✓|
|`librarySectionTitle`|||||✓|
|`logo`|||||✓|
|`logoFile`|Refer to [Resource Exports](#resource-export)|||||
|`logoProvider`|||||✓|
|`metadataDirectory`|||||✓|
|`rating`||✓|✓|✓|✓|
|`ratingKey`||✓|✓|✓|✓|
|`squareArt`|||||✓|
|`squareArtFile`|Refer to [Resource Exports](#resource-export)|||||
|`squareArtProvider`|||||✓|
|`summary`||✓|✓|✓|✓|
|`theme`|||||✓|
|`themeFile`|Refer to [Resource Exports](#resource-export)|||||
|`themeProvider`|||||✓|
|`thumb`||||✓|✓|
|`thumbBlurHash`|||||✓|
|`thumbFile`|Refer to [Resource Exports](#resource-export)|||||
|`thumbProvider`|||||✓|
|`title`||✓|✓|✓|✓|
|`titleSort`||✓|✓|✓|✓|
|`type`||✓|✓|✓|✓|
|`updatedAt`||||✓|✓|
|`userRating`||✓|✓|✓|✓|
|`viewCount`||||✓|✓|
|`collections.id`|||||✓|
|`collections.tag`|||✓|✓|✓|
|`countries.id`|||||✓|
|`countries.tag`|||✓|✓|✓|
|`fields.locked`|||✓|✓|✓|
|`fields.name`|||✓|✓|✓|
|`genres.id`|||||✓|
|`genres.tag`|||✓|✓|✓|
|`guids.id`|||✓|✓|✓|
|`labels.id`|||||✓|
|`labels.tag`|||||✓|
|`moods.id`|||||✓|
|`moods.tag`|||✓|✓|✓|
|`similar.id`|||||✓|
|`similar.tag`|||✓|✓|✓|
|`styles.id`|||||✓|
|`styles.tag`|||✓|✓|✓|
|`albums`||✓
Includes [Albums](#artist-album) Level 1|✓
Includes [Albums](#artist-album) Level 2|✓
Includes [Albums](#artist-album) Level 3|✓
Includes [Albums](#artist-album) Level 9|
**Media Info Fields**
|Media Info Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`locations`|||||✓|
|`albums`||✓
Includes [Albums](#artist-album) Level 1|✓
Includes [Albums](#artist-album) Level 2|✓
Includes [Albums](#artist-album) Level 3|✓
Includes [Albums](#artist-album) Level 9|
### Albums
[](#albums)
**Metadata Fields**
|Metadata Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`addedAt`||✓|✓|✓|✓|
|`art`||||✓|✓|
|`artBlurHash`|||||✓|
|`artFile`|Refer to [Resource Exports](#resource-export)|||||
|`artProvider`|||||✓|
|`guid`||✓|✓|✓|✓|
|`hasSonicAnalysis`||✓|✓|✓|✓|
|`index`||✓|✓|✓|✓|
|`key`||||✓|✓|
|`lastRatedAt`||||✓|✓|
|`lastViewedAt`||||✓|✓|
|`leafCount`|||||✓|
|`librarySectionID`|||||✓|
|`librarySectionKey`|||||✓|
|`librarySectionTitle`|||||✓|
|`logo`|||||✓|
|`logoFile`|Refer to [Resource Exports](#resource-export)|||||
|`logoProvider`|||||✓|
|`loudnessAnalysisVersion`|||||✓|
|`metadataDirectory`|||||✓|
|`musicAnalysisVersion`|||||✓|
|`originallyAvailableAt`||✓|✓|✓|✓|
|`parentGuid`||✓|✓|✓|✓|
|`parentKey`||||✓|✓|
|`parentRatingKey`||✓|✓|✓|✓|
|`parentTheme`|||||✓|
|`parentThumb`||||✓|✓|
|`parentTitle`||✓|✓|✓|✓|
|`rating`||✓|✓|✓|✓|
|`ratingKey`||✓|✓|✓|✓|
|`squareArt`|||||✓|
|`squareArtFile`|Refer to [Resource Exports](#resource-export)|||||
|`squareArtProvider`|||||✓|
|`studio`||✓|✓|✓|✓|
|`summary`||✓|✓|✓|✓|
|`thumb`||||✓|✓|
|`thumbBlurHash`|||||✓|
|`thumbFile`|Refer to [Resource Exports](#resource-export)|||||
|`thumbProvider`|||||✓|
|`title`||✓|✓|✓|✓|
|`titleSort`||✓|✓|✓|✓|
|`type`||✓|✓|✓|✓|
|`updatedAt`||||✓|✓|
|`userRating`||✓|✓|✓|✓|
|`viewCount`||||✓|✓|
|`viewedLeafCount`|||||✓|
|`year`||✓|✓|✓|✓|
|`collections.id`|||||✓|
|`collections.tag`|||✓|✓|✓|
|`fields.locked`|||✓|✓|✓|
|`fields.name`|||✓|✓|✓|
|`formats.id`|||||✓|
|`formats.tag`|||✓|✓|✓|
|`genres.id`|||||✓|
|`genres.tag`|||✓|✓|✓|
|`guids.id`|||✓|✓|✓|
|`labels.id`|||||✓|
|`labels.tag`|||✓|✓|✓|
|`moods.id`|||||✓|
|`moods.tag`|||✓|✓|✓|
|`styles.id`|||||✓|
|`styles.tag`|||✓|✓|✓|
|`subformats.id`|||||✓|
|`subformats.tag`|||✓|✓|✓|
|`tracks`||✓
Includes [Tracks](#album-track) Level 1|✓
Includes [Tracks](#album-track) Level 2|✓
Includes [Tracks](#album-track) Level 3|✓
Includes [Tracks](#album-track) Level 9|
**Media Info Fields**
|Media Info Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`tracks`||✓
Includes [Tracks](#album-track) Level 1|✓
Includes [Tracks](#album-track) Level 2|✓
Includes [Tracks](#album-track) Level 3|✓
Includes [Tracks](#album-track) Level 9|
### Tracks
[](#tracks)
**Metadata Fields**
|Metadata Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`addedAt`||✓|✓|✓|✓|
|`art`||||✓|✓|
|`artBlurHash`|||||✓|
|`chapterSource`|||||✓|
|`duration`||✓|✓|✓|✓|
|`durationHuman`||✓|✓|✓|✓|
|`grandparentArt`||||✓|✓|
|`grandparentGuid`||✓|✓|✓|✓|
|`grandparentKey`||||✓|✓|
|`grandparentRatingKey`||✓|✓|✓|✓|
|`grandparentTheme`|||||✓|
|`grandparentThumb`||||✓|✓|
|`grandparentTitle`||✓|✓|✓|✓|
|`guid`||✓|✓|✓|✓|
|`hasSonicAnalysis`||✓|✓|✓|✓|
|`index`|||||✓|
|`key`||||✓|✓|
|`lastRatedAt`||||✓|✓|
|`lastViewedAt`||||✓|✓|
|`librarySectionID`|||||✓|
|`librarySectionKey`|||||✓|
|`librarySectionTitle`|||||✓|
|`metadataDirectory`|||||✓|
|`musicAnalysisVersion`|||||✓|
|`originalTitle`||✓|✓|✓|✓|
|`parentGuid`||✓|✓|✓|✓|
|`parentIndex`||✓|✓|✓|✓|
|`parentKey`||||✓|✓|
|`parentRatingKey`||✓|✓|✓|✓|
|`parentThumb`||||✓|✓|
|`parentTitle`||✓|✓|✓|✓|
|`ratingCount`||✓|✓|✓|✓|
|`ratingKey`||✓|✓|✓|✓|
|`skipCount`|||||✓|
|`summary`||✓|✓|✓|✓|
|`thumb`||||✓|✓|
|`thumbBlurHash`|||||✓|
|`title`||✓|✓|✓|✓|
|`titleSort`||✓|✓|✓|✓|
|`trackNumber`||✓|✓|✓|✓|
|`type`||✓|✓|✓|✓|
|`updatedAt`||||✓|✓|
|`userRating`||✓|✓|✓|✓|
|`viewCount`||||✓|✓|
|`viewOffset`|||||✓|
|`year`||✓|✓|✓|✓|
|`chapters.end`|||||✓|
|`chapters.id`|||||✓|
|`chapters.index`|||||✓|
|`chapters.start`|||||✓|
|`chapters.tag`|||||✓|
|`chapters.thumb`|||||✓|
|`collections.id`|||||✓|
|`collections.tag`|||✓|✓|✓|
|`fields.locked`|||✓|✓|✓|
|`fields.name`|||✓|✓|✓|
|`genres.id`|||||✓|
|`genres.tag`|||✓|✓|✓|
|`guids.id`|||✓|✓|✓|
|`labels.id`|||||✓|
|`labels.tag`|||||✓|
|`moods.id`|||||✓|
|`moods.tag`|||✓|✓|✓|
**Media Info Fields**
|Media Info Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`locations`||✓|✓|✓|✓|
|`media.audioChannels`||✓|✓|✓|✓|
|`media.audioCodec`||✓|✓|✓|✓|
|`media.audioProfile`||✓|✓|✓|✓|
|`media.bitrate`||✓|✓|✓|✓|
|`media.container`||✓|✓|✓|✓|
|`media.duration`||✓|✓|✓|✓|
|`media.id`|||||✓|
|`media.title`|||||✓|
|`media.parts.accessible`|||||✓|
|`media.parts.audioProfile`|||✓|✓|✓|
|`media.parts.container`|||✓|✓|✓|
|`media.parts.deepAnalysisVersion`|||✓|✓|✓|
|`media.parts.duration`|||✓|✓|✓|
|`media.parts.exists`|||||✓|
|`media.parts.file`|||✓|✓|✓|
|`media.parts.hasThumbnail`|||✓|✓|✓|
|`media.parts.id`|||||✓|
|`media.parts.key`|||||✓|
|`media.parts.requiredBandwidths`|||||✓|
|`media.parts.size`|||✓|✓|✓|
|`media.parts.sizeHuman`|||✓|✓|✓|
|`media.parts.syncItemId`|||||✓|
|`media.parts.syncState`|||||✓|
|`media.parts.audioStreams.albumGain`||||✓|✓|
|`media.parts.audioStreams.albumPeak`||||✓|✓|
|`media.parts.audioStreams.albumRange`||||✓|✓|
|`media.parts.audioStreams.audioChannelLayout`||||✓|✓|
|`media.parts.audioStreams.bitDepth`|||||✓|
|`media.parts.audioStreams.bitrate`||||✓|✓|
|`media.parts.audioStreams.bitrateMode`|||||✓|
|`media.parts.audioStreams.channels`||||✓|✓|
|`media.parts.audioStreams.codec`||||✓|✓|
|`media.parts.audioStreams.default`||||✓|✓|
|`media.parts.audioStreams.displayTitle`||||✓|✓|
|`media.parts.audioStreams.duration`|||||✓|
|`media.parts.audioStreams.endRamp`||||✓|✓|
|`media.parts.audioStreams.extendedDisplayTitle`||||✓|✓|
|`media.parts.audioStreams.gain`||||✓|✓|
|`media.parts.audioStreams.id`|||||✓|
|`media.parts.audioStreams.index`|||||✓|
|`media.parts.audioStreams.key`|||||✓|
|`media.parts.audioStreams.language`|||||✓|
|`media.parts.audioStreams.languageCode`|||||✓|
|`media.parts.audioStreams.languageTag`|||||✓|
|`media.parts.audioStreams.loudness`||||✓|✓|
|`media.parts.audioStreams.lra`||||✓|✓|
|`media.parts.audioStreams.peak`||||✓|✓|
|`media.parts.audioStreams.profile`|||||✓|
|`media.parts.audioStreams.requiredBandwidths`|||||✓|
|`media.parts.audioStreams.samplingRate`||||✓|✓|
|`media.parts.audioStreams.selected`|||||✓|
|`media.parts.audioStreams.startRamp`||||✓|✓|
|`media.parts.audioStreams.streamIdentifier`|||||✓|
|`media.parts.audioStreams.streamType`|||||✓|
|`media.parts.audioStreams.title`||||✓|✓|
|`media.parts.audioStreams.type`|||||✓|
|`media.parts.audioStreams.visualImpaired`|||||✓|
|`media.parts.lyricStreams.codec`||||✓|✓|
|`media.parts.lyricStreams.default`||||✓|✓|
|`media.parts.lyricStreams.displayTitle`||||✓|✓|
|`media.parts.lyricStreams.extendedDisplayTitle`||||✓|✓|
|`media.parts.lyricStreams.format`||||✓|✓|
|`media.parts.lyricStreams.id`|||||✓|
|`media.parts.lyricStreams.index`|||||✓|
|`media.parts.lyricStreams.key`|||||✓|
|`media.parts.lyricStreams.language`|||||✓|
|`media.parts.lyricStreams.languageCode`|||||✓|
|`media.parts.lyricStreams.languageTag`|||||✓|
|`media.parts.lyricStreams.minLines`||||✓|✓|
|`media.parts.lyricStreams.provider`||||✓|✓|
|`media.parts.lyricStreams.requiredBandwidths`|||||✓|
|`media.parts.lyricStreams.selected`|||||✓|
|`media.parts.lyricStreams.streamType`|||||✓|
|`media.parts.lyricStreams.timed`||||✓|✓|
|`media.parts.lyricStreams.title`||||✓|✓|
|`media.parts.lyricStreams.type`|||||✓|
### Photo Albums
[](#photo-albums)
**Metadata Fields**
|Metadata Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`addedAt`||✓|✓|✓|✓|
|`art`||||✓|✓|
|`artBlurHash`|||||✓|
|`artFile`|Refer to [Resource Exports](#resource-export)|||||
|`artProvider`|||||✓|
|`composite`|||||✓|
|`guid`||✓|✓|✓|✓|
|`index`||✓|✓|✓|✓|
|`key`||||✓|✓|
|`lastRatedAt`||||✓|✓|
|`librarySectionID`|||||✓|
|`librarySectionKey`|||||✓|
|`librarySectionTitle`|||||✓|
|`logo`|||||✓|
|`logoFile`|Refer to [Resource Exports](#resource-export)|||||
|`logoProvider`|||||✓|
|`metadataDirectory`|||||✓|
|`ratingKey`||✓|✓|✓|✓|
|`squareArt`|||||✓|
|`squareArtFile`|Refer to [Resource Exports](#resource-export)|||||
|`squareArtProvider`|||||✓|
|`summary`||✓|✓|✓|✓|
|`thumb`||||✓|✓|
|`thumbBlurHash`|||||✓|
|`thumbFile`|Refer to [Resource Exports](#resource-export)|||||
|`thumbProvider`|||||✓|
|`title`||✓|✓|✓|✓|
|`titleSort`||✓|✓|✓|✓|
|`type`||✓|✓|✓|✓|
|`updatedAt`||||✓|✓|
|`userRating`||✓|✓|✓|✓|
|`fields.locked`|||✓|✓|✓|
|`fields.name`|||✓|✓|✓|
|`photoalbums`||✓
Includes [Photo Albums](#photoalbum-photoalbum) Level 1|✓
Includes [Photo Albums](#photoalbum-photoalbum) Level 2|✓
Includes [Photo Albums](#photoalbum-photoalbum) Level 3|✓
Includes [Photo Albums](#photoalbum-photoalbum) Level 9|
|`photos`||✓
Includes [Photos](#photoalbum-photo) Level 1|✓
Includes [Photos](#photoalbum-photo) Level 2|✓
Includes [Photos](#photoalbum-photo) Level 3|✓
Includes [Photos](#photoalbum-photo) Level 9|
|`clips`||✓
Includes [Clips](#photoalbum-clip) Level 1|✓
Includes [Clips](#photoalbum-clip) Level 2|✓
Includes [Clips](#photoalbum-clip) Level 3|✓
Includes [Clips](#photoalbum-clip) Level 9|
**Media Info Fields**
|Media Info Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`photoalbums`||✓
Includes [Photo Albums](#photoalbum-photoalbum) Level 1|✓
Includes [Photo Albums](#photoalbum-photoalbum) Level 2|✓
Includes [Photo Albums](#photoalbum-photoalbum) Level 3|✓
Includes [Photo Albums](#photoalbum-photoalbum) Level 9|
|`photos`||✓
Includes [Photos](#photoalbum-photo) Level 1|✓
Includes [Photos](#photoalbum-photo) Level 2|✓
Includes [Photos](#photoalbum-photo) Level 3|✓
Includes [Photos](#photoalbum-photo) Level 9|
|`clips`||✓
Includes [Clips](#photoalbum-clip) Level 1|✓
Includes [Clips](#photoalbum-clip) Level 2|✓
Includes [Clips](#photoalbum-clip) Level 3|✓
Includes [Clips](#photoalbum-clip) Level 9|
### Photos
[](#photos)
**Metadata Fields**
|Metadata Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`addedAt`||✓|✓|✓|✓|
|`createdAtAccuracy`||✓|✓|✓|✓|
|`createdAtTZOffset`||✓|✓|✓|✓|
|`guid`||✓|✓|✓|✓|
|`index`||✓|✓|✓|✓|
|`key`||||✓|✓|
|`lastRatedAt`||||✓|✓|
|`librarySectionID`|||||✓|
|`librarySectionKey`|||||✓|
|`librarySectionTitle`|||||✓|
|`metadataDirectory`|||||✓|
|`originallyAvailableAt`||✓|✓|✓|✓|
|`parentGuid`||✓|✓|✓|✓|
|`parentIndex`||✓|✓|✓|✓|
|`parentKey`||||✓|✓|
|`parentRatingKey`||✓|✓|✓|✓|
|`parentThumb`||||✓|✓|
|`parentTitle`||✓|✓|✓|✓|
|`ratingKey`||✓|✓|✓|✓|
|`summary`||✓|✓|✓|✓|
|`thumb`||||✓|✓|
|`title`||✓|✓|✓|✓|
|`titleSort`||✓|✓|✓|✓|
|`type`||✓|✓|✓|✓|
|`updatedAt`||||✓|✓|
|`userRating`||✓|✓|✓|✓|
|`year`||✓|✓|✓|✓|
|`fields.locked`|||||✓|
|`fields.name`|||||✓|
|`tag.id`|||||✓|
|`tag.tag`|||✓|✓|✓|
|`tag.title`|||✓|✓|✓|
**Media Info Fields**
|Media Info Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`locations`||✓|✓|✓|✓|
|`media.aperture`||✓|✓|✓|✓|
|`media.aspectRatio`||✓|✓|✓|✓|
|`media.container`||✓|✓|✓|✓|
|`media.exposure`||✓|✓|✓|✓|
|`media.height`||✓|✓|✓|✓|
|`media.id`|||||✓|
|`media.iso`||✓|✓|✓|✓|
|`media.lens`||✓|✓|✓|✓|
|`media.make`||✓|✓|✓|✓|
|`media.model`||✓|✓|✓|✓|
|`media.width`||✓|✓|✓|✓|
|`media.parts.accessible`|||||✓|
|`media.parts.container`|||✓|✓|✓|
|`media.parts.exists`|||||✓|
|`media.parts.file`|||✓|✓|✓|
|`media.parts.id`|||||✓|
|`media.parts.key`|||||✓|
|`media.parts.size`|||✓|✓|✓|
|`media.parts.sizeHuman`|||✓|✓|✓|
### Clips
[](#clips)
**Metadata Fields**
|Metadata Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`addedAt`||✓|✓|✓|✓|
|`art`||||✓|✓|
|`artBlurHash`|||||✓|
|`artFile`|||||✓|
|`artProvider`|||||✓|
|`audienceRating`||✓|✓|✓|✓|
|`audienceRatingImage`||✓|✓|✓|✓|
|`chapterSource`||||✓|✓|
|`contentRating`||✓|✓|✓|✓|
|`duration`||✓|✓|✓|✓|
|`durationHuman`||✓|✓|✓|✓|
|`episodeNumber`||✓|✓|✓|✓|
|`grandparentArt`||||✓|✓|
|`grandparentGuid`||✓|✓|✓|✓|
|`grandparentKey`||||✓|✓|
|`grandparentRatingKey`||✓|✓|✓|✓|
|`grandparentTheme`||||✓|✓|
|`grandparentThumb`||||✓|✓|
|`grandparentTitle`||✓|✓|✓|✓|
|`guid`||✓|✓|✓|✓|
|`hasCommercialMarker`||✓|✓|✓|✓|
|`hasCreditsMarker`||✓|✓|✓|✓|
|`hasIntroMarker`||✓|✓|✓|✓|
|`hasPreviewThumbnails`||||✓|✓|
|`hasVoiceActivity`||||✓|✓|
|`index`|||||✓|
|`key`||||✓|✓|
|`lastRatedAt`||||✓|✓|
|`lastViewedAt`||||✓|✓|
|`librarySectionID`|||||✓|
|`librarySectionKey`|||||✓|
|`librarySectionTitle`|||||✓|
|`logo`|||||✓|
|`logoFile`|||||✓|
|`logoProvider`|||||✓|
|`metadataDirectory`|||||✓|
|`originallyAvailableAt`||✓|✓|✓|✓|
|`parentGuid`||✓|✓|✓|✓|
|`parentIndex`|||||✓|
|`parentKey`||||✓|✓|
|`parentRatingKey`||✓|✓|✓|✓|
|`parentThumb`||||✓|✓|
|`parentTitle`||✓|✓|✓|✓|
|`parentYear`||✓|✓|✓|✓|
|`rating`||✓|✓|✓|✓|
|`ratingKey`||✓|✓|✓|✓|
|`seasonEpisode`||✓|✓|✓|✓|
|`seasonNumber`||✓|✓|✓|✓|
|`slug`|||||✓|
|`squareArt`|||||✓|
|`squareArtFile`|||||✓|
|`squareArtProvider`|||||✓|
|`summary`||✓|✓|✓|✓|
|`thumb`||||✓|✓|
|`thumbBlurHash`|||||✓|
|`thumbFile`|||||✓|
|`thumbProvider`|||||✓|
|`title`||✓|✓|✓|✓|
|`titleSort`||✓|✓|✓|✓|
|`type`||✓|✓|✓|✓|
|`updatedAt`||||✓|✓|
|`userRating`||✓|✓|✓|✓|
|`viewCount`||||✓|✓|
|`viewOffset`|||||✓|
|`year`||✓|✓|✓|✓|
|`chapters.end`||||✓|✓|
|`chapters.id`|||||✓|
|`chapters.index`||||✓|✓|
|`chapters.start`||||✓|✓|
|`chapters.tag`||||✓|✓|
|`chapters.thumb`||||✓|✓|
|`collections.id`|||||✓|
|`collections.tag`|||✓|✓|✓|
|`directors.id`|||||✓|
|`directors.tag`|||✓|✓|✓|
|`fields.locked`|||✓|✓|✓|
|`fields.name`|||✓|✓|✓|
|`guids.id`|||✓|✓|✓|
|`labels.id`|||||✓|
|`labels.tag`|||||✓|
|`markers.end`|||✓|✓|✓|
|`markers.final`|||✓|✓|✓|
|`markers.first`|||✓|✓|✓|
|`markers.id`|||||✓|
|`markers.start`|||✓|✓|✓|
|`markers.type`|||✓|✓|✓|
|`producers.id`|||||✓|
|`producers.tag`|||✓|✓|✓|
|`roles.id`|||||✓|
|`roles.role`|||✓|✓|✓|
|`roles.tag`|||✓|✓|✓|
|`roles.thumb`|||||✓|
|`writers.id`|||||✓|
|`writers.tag`|||✓|✓|✓|
**Media Info Fields**
|Media Info Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`locations`||✓|✓|✓|✓|
|`media.aspectRatio`||✓|✓|✓|✓|
|`media.audioChannels`||✓|✓|✓|✓|
|`media.audioCodec`||✓|✓|✓|✓|
|`media.audioProfile`||✓|✓|✓|✓|
|`media.bitrate`||✓|✓|✓|✓|
|`media.container`||✓|✓|✓|✓|
|`media.duration`||✓|✓|✓|✓|
|`media.has64bitOffsets`|||||✓|
|`media.hasVoiceActivity`|||||✓|
|`media.hdr`||✓|✓|✓|✓|
|`media.height`||✓|✓|✓|✓|
|`media.id`|||||✓|
|`media.isOptimizedVersion`||✓|✓|✓|✓|
|`media.optimizedForStreaming`|||||✓|
|`media.proxyType`|||||✓|
|`media.target`|||||✓|
|`media.title`|||||✓|
|`media.videoCodec`||✓|✓|✓|✓|
|`media.videoFrameRate`||✓|✓|✓|✓|
|`media.videoProfile`||✓|✓|✓|✓|
|`media.videoResolution`||✓|✓|✓|✓|
|`media.width`||✓|✓|✓|✓|
|`media.parts.accessible`|||||✓|
|`media.parts.audioProfile`|||✓|✓|✓|
|`media.parts.container`|||✓|✓|✓|
|`media.parts.deepAnalysisVersion`|||✓|✓|✓|
|`media.parts.duration`|||✓|✓|✓|
|`media.parts.exists`|||||✓|
|`media.parts.file`|||✓|✓|✓|
|`media.parts.has64bitOffsets`|||||✓|
|`media.parts.hasPreviewThumbnails`|||✓|✓|✓|
|`media.parts.hasThumbnail`|||||✓|
|`media.parts.id`|||||✓|
|`media.parts.indexes`|||✓|✓|✓|
|`media.parts.key`|||||✓|
|`media.parts.optimizedForStreaming`|||✓|✓|✓|
|`media.parts.packetLength`|||||✓|
|`media.parts.requiredBandwidths`|||||✓|
|`media.parts.size`|||✓|✓|✓|
|`media.parts.sizeHuman`|||✓|✓|✓|
|`media.parts.syncItemId`|||||✓|
|`media.parts.syncState`|||||✓|
|`media.parts.videoProfile`|||✓|✓|✓|
|`media.parts.audioStreams.audioChannelLayout`||||✓|✓|
|`media.parts.audioStreams.bitDepth`||||✓|✓|
|`media.parts.audioStreams.bitrate`||||✓|✓|
|`media.parts.audioStreams.bitrateMode`|||||✓|
|`media.parts.audioStreams.channels`||||✓|✓|
|`media.parts.audioStreams.codec`||||✓|✓|
|`media.parts.audioStreams.default`||||✓|✓|
|`media.parts.audioStreams.displayTitle`||||✓|✓|
|`media.parts.audioStreams.duration`|||||✓|
|`media.parts.audioStreams.extendedDisplayTitle`||||✓|✓|
|`media.parts.audioStreams.id`|||||✓|
|`media.parts.audioStreams.index`|||||✓|
|`media.parts.audioStreams.key`|||||✓|
|`media.parts.audioStreams.language`||||✓|✓|
|`media.parts.audioStreams.languageCode`||||✓|✓|
|`media.parts.audioStreams.languageTag`|||||✓|
|`media.parts.audioStreams.profile`||||✓|✓|
|`media.parts.audioStreams.requiredBandwidths`|||||✓|
|`media.parts.audioStreams.samplingRate`||||✓|✓|
|`media.parts.audioStreams.selected`|||||✓|
|`media.parts.audioStreams.streamIdentifier`|||||✓|
|`media.parts.audioStreams.streamType`|||||✓|
|`media.parts.audioStreams.title`||||✓|✓|
|`media.parts.audioStreams.type`|||||✓|
|`media.parts.audioStreams.visualImpaired`|||||✓|
|`media.parts.subtitleStreams.canAutoSync`|||||✓|
|`media.parts.subtitleStreams.codec`||||✓|✓|
|`media.parts.subtitleStreams.container`||||✓|✓|
|`media.parts.subtitleStreams.default`||||✓|✓|
|`media.parts.subtitleStreams.displayTitle`||||✓|✓|
|`media.parts.subtitleStreams.extendedDisplayTitle`||||✓|✓|
|`media.parts.subtitleStreams.forced`||||✓|✓|
|`media.parts.subtitleStreams.format`||||✓|✓|
|`media.parts.subtitleStreams.headerCompression`|||||✓|
|`media.parts.subtitleStreams.hearingImpaired`|||||✓|
|`media.parts.subtitleStreams.id`|||||✓|
|`media.parts.subtitleStreams.index`|||||✓|
|`media.parts.subtitleStreams.key`|||||✓|
|`media.parts.subtitleStreams.language`||||✓|✓|
|`media.parts.subtitleStreams.languageCode`||||✓|✓|
|`media.parts.subtitleStreams.languageTag`|||||✓|
|`media.parts.subtitleStreams.perfectMatch`|||||✓|
|`media.parts.subtitleStreams.providerTitle`|||||✓|
|`media.parts.subtitleStreams.requiredBandwidths`|||||✓|
|`media.parts.subtitleStreams.score`|||||✓|
|`media.parts.subtitleStreams.selected`|||||✓|
|`media.parts.subtitleStreams.sourceKey`|||||✓|
|`media.parts.subtitleStreams.streamType`|||||✓|
|`media.parts.subtitleStreams.title`||||✓|✓|
|`media.parts.subtitleStreams.transient`|||||✓|
|`media.parts.subtitleStreams.type`|||||✓|
|`media.parts.subtitleStreams.userID`|||||✓|
|`media.parts.videoStreams.DOVIBLCompatID`|||||✓|
|`media.parts.videoStreams.DOVIBLPresent`|||||✓|
|`media.parts.videoStreams.DOVIELPresent`|||||✓|
|`media.parts.videoStreams.DOVILevel`|||||✓|
|`media.parts.videoStreams.DOVIPresent`|||||✓|
|`media.parts.videoStreams.DOVIProfile`|||||✓|
|`media.parts.videoStreams.DOVIRPUPresent`|||||✓|
|`media.parts.videoStreams.DOVIVersion`|||||✓|
|`media.parts.videoStreams.anamorphic`|||||✓|
|`media.parts.videoStreams.bitDepth`||||✓|✓|
|`media.parts.videoStreams.bitrate`||||✓|✓|
|`media.parts.videoStreams.cabac`|||||✓|
|`media.parts.videoStreams.chromaLocation`|||||✓|
|`media.parts.videoStreams.chromaSubsampling`|||||✓|
|`media.parts.videoStreams.codec`||||✓|✓|
|`media.parts.videoStreams.codecID`|||||✓|
|`media.parts.videoStreams.codedHeight`|||||✓|
|`media.parts.videoStreams.codedWidth`|||||✓|
|`media.parts.videoStreams.colorPrimaries`|||||✓|
|`media.parts.videoStreams.colorRange`|||||✓|
|`media.parts.videoStreams.colorSpace`||||✓|✓|
|`media.parts.videoStreams.colorTrc`|||||✓|
|`media.parts.videoStreams.default`||||✓|✓|
|`media.parts.videoStreams.displayTitle`||||✓|✓|
|`media.parts.videoStreams.duration`|||||✓|
|`media.parts.videoStreams.extendedDisplayTitle`||||✓|✓|
|`media.parts.videoStreams.frameRate`||||✓|✓|
|`media.parts.videoStreams.frameRateMode`|||||✓|
|`media.parts.videoStreams.hasScalingMatrix`|||||✓|
|`media.parts.videoStreams.hdr`||||✓|✓|
|`media.parts.videoStreams.height`||||✓|✓|
|`media.parts.videoStreams.id`|||||✓|
|`media.parts.videoStreams.index`|||||✓|
|`media.parts.videoStreams.key`|||||✓|
|`media.parts.videoStreams.language`||||✓|✓|
|`media.parts.videoStreams.languageCode`||||✓|✓|
|`media.parts.videoStreams.languageTag`|||||✓|
|`media.parts.videoStreams.level`||||✓|✓|
|`media.parts.videoStreams.pixelAspectRatio`|||||✓|
|`media.parts.videoStreams.pixelFormat`|||||✓|
|`media.parts.videoStreams.profile`||||✓|✓|
|`media.parts.videoStreams.refFrames`||||✓|✓|
|`media.parts.videoStreams.requiredBandwidths`|||||✓|
|`media.parts.videoStreams.scanType`||||✓|✓|
|`media.parts.videoStreams.selected`|||||✓|
|`media.parts.videoStreams.streamIdentifier`|||||✓|
|`media.parts.videoStreams.streamType`|||||✓|
|`media.parts.videoStreams.title`||||✓|✓|
|`media.parts.videoStreams.type`|||||✓|
|`media.parts.videoStreams.width`||||✓|✓|
### Collections
[](#collections)
**Metadata Fields**
|Metadata Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`addedAt`||✓|✓|✓|✓|
|`art`||||✓|✓|
|`artBlurHash`|||||✓|
|`artFile`|Refer to [Resource Exports](#resource-export)|||||
|`artProvider`|||||✓|
|`childCount`||✓|✓|✓|✓|
|`collectionFilterBasedOnUser`|||||✓|
|`collectionMode`||✓|✓|✓|✓|
|`collectionSort`||✓|✓|✓|✓|
|`contentRating`||✓|✓|✓|✓|
|`guid`||✓|✓|✓|✓|
|`index`|||||✓|
|`key`||||✓|✓|
|`lastRatedAt`||||✓|✓|
|`librarySectionID`|||||✓|
|`librarySectionKey`|||||✓|
|`librarySectionTitle`|||||✓|
|`logo`|||||✓|
|`logoFile`|Refer to [Resource Exports](#resource-export)|||||
|`logoProvider`|||||✓|
|`maxYear`||✓|✓|✓|✓|
|`metadataDirectory`|||||✓|
|`minYear`||✓|✓|✓|✓|
|`ratingKey`||✓|✓|✓|✓|
|`squareArt`|||||✓|
|`squareArtFile`|Refer to [Resource Exports](#resource-export)|||||
|`squareArtProvider`|||||✓|
|`subtype`||✓|✓|✓|✓|
|`summary`||✓|✓|✓|✓|
|`theme`|||||✓|
|`themeFile`|Refer to [Resource Exports](#resource-export)|||||
|`themeProvider`|||||✓|
|`thumb`||||✓|✓|
|`thumbBlurHash`|||||✓|
|`thumbFile`|Refer to [Resource Exports](#resource-export)|||||
|`thumbProvider`|||||✓|
|`title`||✓|✓|✓|✓|
|`titleSort`||✓|✓|✓|✓|
|`type`||✓|✓|✓|✓|
|`updatedAt`||||✓|✓|
|`userRating`||✓|✓|✓|✓|
|`fields.locked`|||✓|✓|✓|
|`fields.name`|||✓|✓|✓|
|`labels.id`|||||✓|
|`labels.tag`|||✓|✓|✓|
|`items`||✓
Includes [Items](#collection-item) Level 1|✓
Includes [Items](#collection-item) Level 2|✓
Includes [Items](#collection-item) Level 3|✓
Includes [Items](#collection-item) Level 9|
**Media Info Fields**
|Media Info Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`items`||✓
Includes [Items](#collection-item) Level 1|✓
Includes [Items](#collection-item) Level 2|✓
Includes [Items](#collection-item) Level 3|✓
Includes [Items](#collection-item) Level 9|
* **Note:** Collection `items` can be [Movies](#movie), [Shows](#show), [Seasons](#season), [Episodes](#episode), [Artists](#artist), [Albums](#album), or [Tracks](#track) depending on the type of collection.
### Playlists
[](#playlists)
**Metadata Fields**
|Metadata Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`addedAt`||✓|✓|✓|✓|
|`art`|||||✓|
|`artFile`|Refer to [Resource Exports](#resource-export)|||||
|`artProvider`|||||✓|
|`composite`||||✓|✓|
|`content`|||||✓|
|`duration`||✓|✓|✓|✓|
|`durationHuman`||✓|✓|✓|✓|
|`guid`||✓|✓|✓|✓|
|`icon`|||||✓|
|`key`||||✓|✓|
|`leafCount`|||||✓|
|`logo`|||||✓|
|`logoFile`|Refer to [Resource Exports](#resource-export)|||||
|`logoProvider`|||||✓|
|`metadataDirectory`|||||✓|
|`playlistType`||✓|✓|✓|✓|
|`ratingKey`||✓|✓|✓|✓|
|`smart`||✓|✓|✓|✓|
|`sourceURI`|||||✓|
|`squareArt`|||||✓|
|`squareArtFile`|Refer to [Resource Exports](#resource-export)|||||
|`squareArtProvider`|||||✓|
|`summary`||✓|✓|✓|✓|
|`thumb`|||||✓|
|`thumbFile`|Refer to [Resource Exports](#resource-export)|||||
|`thumbProvider`|||||✓|
|`title`||✓|✓|✓|✓|
|`type`||✓|✓|✓|✓|
|`updatedAt`||||✓|✓|
|`items`||✓
Includes [Items](#playlist-item) Level 1|✓
Includes [Items](#playlist-item) Level 2|✓
Includes [Items](#playlist-item) Level 3|✓
Includes [Items](#playlist-item) Level 9|
**Media Info Fields**
|Media Info Field|Level 0|Level 1|Level 2|Level 3|Level 9|
|`items`||✓
Includes [Items](#playlist-item) Level 1|✓
Includes [Items](#playlist-item) Level 2|✓
Includes [Items](#playlist-item) Level 3|✓
Includes [Items](#playlist-item) Level 9|
* **Note:** Playlist `items` can be [Movies](#movie), [Episodes](#episode), [Tracks](#track), or [Photos](#photo) depending on the type of playlist.
* [Home](/Tautulli/Tautulli/wiki/Home)
* [Installation](/Tautulli/Tautulli/wiki/Installation)
* [Upgrading to Python 3 (Tautulli v2.5)](/Tautulli/Tautulli/wiki/Upgrading-to-Python-3-(Tautulli-v2.5))
* [Asking for Support](/Tautulli/Tautulli/wiki/Asking-for-Support)
* [Frequently Asked Questions](/Tautulli/Tautulli/wiki/Frequently-Asked-Questions)
* [Notification Agents Guide](/Tautulli/Tautulli/wiki/Notification-Agents-Guide)
* [Custom Notification Conditions](/Tautulli/Tautulli/wiki/Custom-Notification-Conditions)
* [Exporter Guide](/Tautulli/Tautulli/wiki/Exporter-Guide)
* [3rd Party APIs Guide](/Tautulli/Tautulli/wiki/3rd-Party-APIs-Guide)
* [Debugging](/Tautulli/Tautulli/wiki/Debugging)
* [Custom Scripts](/Tautulli/Tautulli/wiki/Custom-Scripts)
* [Tautulli API Reference](/Tautulli/Tautulli/wiki/Tautulli-API-Reference)
### Clone this wiki locally