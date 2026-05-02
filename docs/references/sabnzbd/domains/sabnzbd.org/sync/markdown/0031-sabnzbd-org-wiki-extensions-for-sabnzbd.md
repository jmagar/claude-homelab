SABnzbd -
Wiki -
Extensions for SABnzbd
#
Wiki menu
Wiki
[User Manual](/wiki/)
[FAQ](/wiki/faq)
[Contact](/wiki/contact)
[
Introduction
](#wiki-menu-start)
* [Quick Setup](/wiki/introduction/quick-setup)
* [Using SABnzbd](/wiki/introduction/usage)
* [NZB Sources](/wiki/introduction/nzb-sources)
* [How To's](/wiki/introduction/howto)
* [Known issues](/wiki/introduction/known-issues)
[
Installation
](#wiki-menu-installation)
* [Windows](/wiki/installation/install-windows)
* [macOS](/wiki/installation/install-macos)
* [Unix](/wiki/installation/install-unix)
* [NAS](/wiki/installation/install-nas)
* [From source](/wiki/installation/install-off-modules)
[
Configuration
](#wiki-menu-configure)
* [Configure](/wiki/configuration/5.0/configure)
* [General](/wiki/configuration/5.0/general)
* [Folders](/wiki/configuration/5.0/folders)
* [Servers](/wiki/configuration/5.0/servers)
* [Categories](/wiki/configuration/5.0/categories)
* [Switches](/wiki/configuration/5.0/switches)
* [Sorting](/wiki/configuration/5.0/sorting)
* [Notifications](/wiki/configuration/5.0/notifications)
* [Scheduling](/wiki/configuration/5.0/scheduling)
* [RSS](/wiki/configuration/5.0/rss)
* [Special Settings](/wiki/configuration/5.0/special)
* [API Reference](/wiki/configuration/5.0/api)
[
Scripts
](#wiki-menu-scripts)
* [Pre-queue scripts](/wiki/configuration/5.0/scripts/pre-queue-scripts)
* [Post-processing scripts](/wiki/configuration/5.0/scripts/post-processing-scripts)
* [Notification scripts](/wiki/configuration/5.0/scripts/notification-scripts)
[
Advanced Topics
](#wiki-menu-advanced)
* [High-Speed Tweaks](/wiki/advanced/highspeed-downloading)
* [HTTPS for the Web UI](/wiki/advanced/https)
* [Command line options](/wiki/advanced/command-line-parameters)
* [Folder setup](/wiki/advanced/directory-setup)
* [Unix permissions](/wiki/advanced/unix-permissions)
* [RAR with password](/wiki/advanced/password-protected-rars)
* [IPv6](/wiki/advanced/ipv6)
* [SSL/TLS security](/wiki/advanced/certificate-errors)
* [SSL Ciphers](/wiki/advanced/ssl-ciphers)
* [Windows Service](/wiki/advanced/sabnzbd-as-a-windows-service)
* [Android](/wiki/advanced/android)
[Extensions for SABnzbd](/wiki/extensions-for-sabnzbd)
[Special Newshosting offer for SABnzbd users: 70% Off + 3 FREE MONTHS!](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=wt)
##
[
Incorrect or missing information?
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Extensions+for+SABnzbd&amp;body=##+URL:+/wiki/extensions-for-sabnzbd.html
Improvement:
>)
Extensions for SABnzbd
Several people have created utilities that work with SABnzbd. The lists below are randomly sorted on every page-load to give each tool equal exposure. Did we miss any? [Let us know!](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Extensions+for+SABnzbd&body=##+URL:+/wiki/extensions-for-sabnzbd.html
Improvement:
>)
### Jump quickly to:
* [Automation](#automation)
* [Post-processing scripts](#pp-scripts)
* [Mobile apps and browser-extensions](#app-browser)
* [HTPC managers](#htpc)
## Automation (Searching and post-processing)
|Program|Description|
|[Sonarr](https://sonarr.tv/)|Sonarr is a PVR for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new episodes of your favorite shows and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available.|
|[Radarr](https://radarr.video/)|Automatic Movie management. Handles searching for downloads, handling of failed downloads and management of the completed download. Radarr is an independent fork of Sonarr reworked for automatically downloading movies via Usenet.|
|[Lidarr](https://lidarr.audio)|Lidarr is a music collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new tracks from your favorite artists and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available.|
|[Watcher](https://github.com/nosmokingbandit/Watcher3)|Watcher is an automated movie NZB &and; Torrent searcher and snatcher. You can add a list of wanted movies and Watcher will automatically send the NZB to SABnzbd. Watcher also has basic post-processing capabilities such as renaming and moving.|
|[SickChill](https://sickchill.github.io/)|SickChill is an automatic Video Library Manager for TV Shows. It watches for new episodes of your favorite shows, and when they are posted it does its magic: automatic torrent/nzb searching, downloading, and processing at the qualities you want.|
|[Medusa](https://pymedusa.com/)|Medusa is an automatic Video Library Manager for TV Shows. It watches for new episodes of your favorite shows, and when they are posted it does its magic: automatic torrent/nzb searching, downloading, and processing at the qualities you want.|
|[SiCKRAGE](https://sickrage.ca/)|Automatic Video Library Manager for TV Shows. It watches for new episodes of your favorite shows, and when they are posted it does its magic.|
|[Headphones](https://github.com/rembo10/headphones)|Headphones is an automated music downloader for NZB and Torrent, written in Python.|
|[Mylar](https://github.com/mylar3/mylar3)|Mylar is an automated Comic Book (cbr/cbz) downloader program heavily-based on the Headphones template and logic (which is also based on Sick-Beard).|
|[LazyLibrarian](https://gitlab.com/LazyLibrarian/LazyLibrarian)|LazyLibrarian is a program to follow authors and grab metadata for all your digital reading needs. It uses a combination of Goodreads Librarything and optionally GoogleBooks as sources for author info and book info.|
|[NZBHydra2](https://github.com/theotherp/nzbhydra2)|NZBHydra2 is a meta search for [NZB indexers](/wiki/introduction/nzb-sources). It provides easy access to a number of raw and newznab based indexers. You can search all your indexers from one place and use it as indexer source for tools like Sonarr or CouchPotato.|
|[FlexGet](https://flexget.com/)|FlexGet is a multipurpose automation tool for all of your media. Support for torrents, nzbs, podcasts, comics, TV, movies, RSS, HTML, CSV, and more.|
## Post-processing scripts
|Program|Description|
|[nzbToMedia](https://github.com/clinton-hall/nzbToMedia)|Provides an efficient way to handle postprocessing for CouchPotato and SickBeard (and its forks) on low performance systems like a NAS. |
|[sickbeard\_mp4\_automator](https://github.com/mdhiggins/sickbeard_mp4_automator)|Automatically converts media files downloaded by various programs to mp4 files, and tags them with the appropriate metadata from theTVDB or TMDB. Media Managers Supported: Sickbeard, SickRage, CouchPotato, Sonarr and Radarr|
|[NZB-Subliminal](https://github.com/caronc/nzb-subliminal)|Automatically fetch subtitles (if available) for movies and TV shows.|
## Mobile apps and browser-extensions
|Program|Description|
|[nzb360](https://nzb360.com/) (Android)|nzb360 is a full-featured NZB manager for Android that focuses on providing the best experience possible for controlling all of your usenet needs.|
|[Sable](https://apps.apple.com/app/sable/id6630387095) (iOS)|Sable is a companion app, designed to connect to an instance of SABnzbd. Sable has been meticulously crafted with the latest features of iOS to make it feel like a native part of your device, and not just an add on.|
|[nzbUnity](https://nzbunity.dozenzb.com/) (iOS)|At home or on the go, nzbUnity makes it easy for you to manage all of your favorites NZB applications from your iOS device.|
|[NZB Unity](https://addons.mozilla.org/addon/nzb-unity) (Firefox)|View/pause SABnzbd directly from the Firefox interface button. Notifications for downloads when they start and finish with statistics. Catch downloads of all NZB files from any website and send them to your download client. Directly integrated into popular indexer websites to add buttons next to each download.|
|[SABConnect++](https://chrome.google.com/webstore/detail/sabconnect++/okphadhbbjadcifjplhifajfacbkkbod) (Chrome/Edge/etc)|SABconnect++ adds one-click 'Send to SABnzbd' buttons to many popular NZB index sites. You also get a taskbar button that allows you to keep an eye on your SABnzbd: current downloads, pause (individual downloads, or pause all, or pause temporarily), or remove individual queued downloads.|
## HTPC managers
NOTE Make sure to disable `x\_frame\_options` in [Special Settings](/wiki/configuration/5.0/special) when using this software. Otherwise SABnzbd doesn't allow to be included within another website.
|Program|Description|
|[Muximux](https://github.com/mescon/Muximux)|This is a lightweight portal to view & manage your webapps without having to run anything more than a PHP enabled webserver. With Muximux you don't need to keep multiple tabs open, or bookmark the URL to all of your apps.|
|[Organizr ](https://github.com/causefx/Organizr)|Lightweight portal to view & manage your webapps. Organizr allows you to setup "Tabs" that will be loaded all in one webpage. You can then work on your server with ease. You can even open up two tabs side by side. Want to give users access to some Tabs? No problem, just enable user support and have them make an account. Want guests to be able to visit too? Enable Guest support for those tabs.
|
|[Ombi](http://www.ombi.io/)|Ombi is a self-hosted web application that automatically gives your shared Plex or Emby users the ability to request content by themselves! Ombi can be linked to multiple TV Show, Movie and Music DVR tools to create a seamless end-to-end experience for your users.|
|[HTPC Manager](http://htpc.io/)
(alternative fork [here](https://github.com/Hellowlol/HTPC-Manager))|A python based web application to manage the software on your Htpc (SABnzbd, CouchPotato, Sick Beard, XBMC). Htpc Manager combines all your favorite software into one slick interface. |
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)