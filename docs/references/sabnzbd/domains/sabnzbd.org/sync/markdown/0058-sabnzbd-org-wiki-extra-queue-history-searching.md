SABnzbd -
Wiki -
Queue and History searching
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Queue+and+History+searching&amp;body=##+URL:+/wiki/extra/queue-history-searching.html
Improvement:
>)
Queue and History searching
# Search options
The queue search box appears only when there are more items than the Queue/History item limit (set in Status and Interface settings), or when editing multiple jobs.
All options accept multiple values, seperated by a comma.
### Category: `cat` or `category`
Examples:
* `show name cat:tv`
### Priority (Queue only): `priority`
Examples:
* `title priority:High,Low`
### Status: `status`
Examples:
* `status:Fetching`
* `status:Queued,Running`
|Status|Type|Description|
|`Propagating`|Queue|Delayed download|
|`Paused`|Queue|Job is paused|
|`Downloading`|Queue|Normal downloading|
|`Checking`|Queue|Pre-check is running|
|`Fetching`|Queue|Job is downloading extra par2 files|
|`Grabbing`|Queue|Getting an NZB from an external site|
|`Queued`|Queue/History|Job is waiting for its turn to download or post-process|
|`Moving`|History|Files are being moved|
|`QuickCheck`|History|QuickCheck verification is running|
|`Repairing`|History|Job is being repaired (by par2)|
|`Running`|History|User's post-processing script is running|
|`Verifying`|History|Job is being verified (by par2)|
|`Completed`|History|Job is finished|
|`Failed`|History|Job has failed, now in History|
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)