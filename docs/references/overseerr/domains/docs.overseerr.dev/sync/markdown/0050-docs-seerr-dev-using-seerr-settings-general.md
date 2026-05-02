General | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
## API Key[​](#api-key)
This is your Seerr API key, which can be used to integrate Seerr with third-party applications. Do **not** share this key publicly, as it can be used to gain administrator access!
If you need to generate a new API key for any reason, simply click the button to the right of the text box.
If you want to set the API key, rather than letting it be randomly generated, you can use the API\_KEY environment variable. Whatever that variable is set to will be your API key.
## Application Title[​](#application-title)
If you aren't a huge fan of the name "Seerr" and would like to display something different to your users, you can customize the application title!
## Application URL[​](#application-url)
Set this to the externally-accessible URL of your Seerr instance.
You must configure this setting in order to enable password reset and generation emails.
## Enable Image Caching[​](#enable-image-caching)
When enabled, Jellseerr will proxy and cache images from pre-configured sources (such as TMDB). This can use a significant amount of disk space.
Images are saved in the `config/cache/images` and stale images are cleared out every 24 hours.
You should enable this if you are having issues with loading images directly from TMDB in your browser.
## Display Language[​](#display-language)
Set the default display language for Seerr. Users can override this setting in their user settings.
## Discover Region, Discover Language & Streaming Region[​](#discover-region-discover-language--streaming-region)
These settings filter content shown on the "Discover" home page based on regional availability and original language, respectively. The Streaming Region filters the available streaming providers on the media page. Users can override these global settings by configuring these same options in their user settings.
## Blocklist Region and Blocklist Language[​](#blocklist-region-and-blocklist-language)
These settings control the region and language used specifically for blocklist content scanning. The "Process Blocklisted Tags" job uses these settings to determine which content to scan for blocklisting, independent of the general Discover settings.
* **Blocklist Region**: The region used for blocklist content scanning. Leave empty to scan all regions.
* **Blocklist Language**: The language used for blocklist content scanning. Leave empty to scan all languages.
These settings are separate from the general "Discover Region" and "Discover Language" settings, allowing you to blocklist content from specific regions/languages regardless of what users see in their Discover pages.
## Blocklist Content with Tags and Limit Content Blocklisted per Tag[​](#blocklist-content-with-tags-and-limit-content-blocklisted-per-tag)
These settings blocklist any TV shows or movies that have one of the entered tags. The "Process Blocklisted Tags" job adds entries to the blocklist based on the configured blocklisted tags. If a blocklisted tag is removed, any media blocklisted under that tag will be removed from the blocklist when the "Process Blocklisted Tags" job runs.
The limit setting determines how many pages per tag the job will process, with each page containing 20 entries. The job cycles through all 16 available discovery sort options, querying the defined number of pages to blocklist media that is most likely to appear at the top of each sort. Higher limits will create a more accurate blocklist, but will require more storage.
Blocklisted tags are disabled until at least one tag is entered. These settings cannot be overridden in user settings.
## Hide Available Media[​](#hide-available-media)
When enabled, media which is already available will not appear on the "Discover" home page, or in the "Recommended" or "Similar" categories or other links on media detail pages.
Available media will still appear in search results, however, so it is possible to locate and view hidden items by searching for them by title.
This setting is **disabled** by default.
## Hide Blocklisted Items[​](#hide-blocklisted-items)
When enabled, media that has been blocklisted will not appear on the "Discover" home page, for all administrators. This can be useful to hide content that you don't want to see, such as content with specific tags or content that has been manually blocklisted when you have the "Manage Blocklist" permission.
This setting is **disabled** by default.
## Allow Partial Series Requests[​](#allow-partial-series-requests)
When enabled, users will be able to submit requests for specific seasons of TV series. If disabled, users will only be able to submit requests for all unavailable seasons.
This setting is **enabled** by default.
* [API Key](#api-key)
* [Application Title](#application-title)
* [Application URL](#application-url)
* [Enable Image Caching](#enable-image-caching)
* [Display Language](#display-language)
* [Discover Region, Discover Language & Streaming Region](#discover-region-discover-language--streaming-region)
* [Blocklist Region and Blocklist Language](#blocklist-region-and-blocklist-language)
* [Blocklist Content with Tags and Limit Content Blocklisted per Tag](#blocklist-content-with-tags-and-limit-content-blocklisted-per-tag)
* [Hide Available Media](#hide-available-media)
* [Hide Blocklisted Items](#hide-blocklisted-items)
* [Allow Partial Series Requests](#allow-partial-series-requests)