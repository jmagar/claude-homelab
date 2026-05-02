SABnzbd -
Wiki -
Categories
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Categories&amp;body=##+URL:+/wiki/configuration/5.0/categories.html
Improvement:
>)
Categories
User-defined categories allow precise control over groups of downloads. When added to the queue, downloads can be placed in the appropriate category automatically depending on your settings. The download's category may also be manually applied later.
### Properties that may be set for a category, as desired:
* What priority to give them. Note that jobs with "Force" priority will ignore the paused state of the queue.
* How the file should be processed (see [Job Options](/wiki/extra/job-options)).
* The user-script to execute after the download (Scripts folders defined in [Folders](/wiki/configuration/5.0/folders)).
* The Folder or full path for final storage (relative folders are based of your complete folder, full paths are also allowed).
Ending the path with an asterisk `\*` will prevent creation of job folders.
NOTE Each row has its own save button. Remember to hit **Save** after each category change!
### Categories are applied:
* When the indexer category tag or newsgroup of the download matches the field for that category.
* When the indexer category tag starts with one of your categories.
* When an RSS feed specifically applies a particular category.
* When added via the [Watched Folder](/wiki/configuration/5.0/folders) using special file or folder name.
* When a download gets added via the API that also specifies a category.
### Indexer tag or Group field
By default, downloads are automatically categorized by the indexer providing a category inside the nzb or the newsgroup in which the job is located (i.e., `alt.binaries.teevee`). Categories can be re-ordered to set the order in which matching should happen. For example this way you can put `Movies \> 4K` in a special category and the rest of the movies in a categories with just the indexer tag `Movies`.
Basic wildcards are supported. For example, some [indexers](/wiki/introduction/nzb-sources) uses sub-categories like `TV \> HD`. Instead of listing all possible categories, you may simply use `TV\*`. The same applies to newsgroups (i.e., `alt.bin\*`).
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)