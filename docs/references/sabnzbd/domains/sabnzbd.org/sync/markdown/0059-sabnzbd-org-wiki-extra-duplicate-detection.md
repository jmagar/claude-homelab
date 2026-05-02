SABnzbd -
Wiki -
Duplicate detection
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Duplicate+detection&amp;body=##+URL:+/wiki/extra/duplicate-detection.html
Improvement:
>)
Duplicate detection
# Introduction
If you use RSS feeds or other kinds of automation, you might want to prevent the same file being downloaded twice.
In order to prevent that, SABnzbd has 2 kinds of automation built-in:
* [Identical download detection](#identical-download-detection)
* [Smart duplicate detection](#smart-duplicate-detection)
Both types of detection will follow these steps when a new job is added to the Queue:
1. Check if a similar job (see details) is already present in the Queue or the History.
2. If a similar job was already downloaded successfully and is present in the history, perform the configured action right away.
3. If a similar job is present in the Queue, the new job will be paused and marked `ALTERNATIVE` to the original job.
* When the original job succeeds, the alternatives will be handled as configured.
* If the original job fails, the first alternative will automatically start downloading.
## Identical download detection
This type of detection will check the History and the Queue for an exact match of the NZB name or NZB content.
It will also compare the NZB name to the files in your [.nzb Backup Folder](/wiki/configuration/5.0/folders), if you have one configured.
Use this option if you only want to prevent identical jobs.
## Smart duplicate detection
If you want to prevent multiple versions of the same movie or show to be downloaded, SABnzbd can analyse the name of the job using the GuessIt module.
Specifically, we support detecting duplicates for Movies, Series and Daily shows.
For each type, here are some examples that would be detected as **duplicate**:
### Movies
1. `The.New.Movie.2023.XviD.AC3`
2. `The.new.movie.4k.hdr.2023`
### Series
1. `Show.Name.S11E23.1080p.AC3`
2. `Show.Name.s11e23.The.One.That.Was.Funny.480p.x264`
### Daily shows
1. `Funny.Daily.Standup.2023.11.09`
2. `Funny.daily.standup.2023-11-09`
## Notes
* With `Allow proper releases` [Switch](/wiki/configuration/5.0/switches) enabled, Smart duplicate detection is bypassed *once* if `PROPER`, `REAL` or `REPACK` is found.
If a second *proper* job is added, it will be seen as a duplicate of the first *proper* job.
* You can prevent checking against the `.nzb Backup Folder` by disabling the [Special](/wiki/configuration/5.0/special) setting `backup\_for\_duplicates`.
* If a [Pre-queue script](/wiki/configuration/5.0/scripts/pre-queue-scripts) changes the name of a job, duplicate detection will be triggered again.
* Notifications about duplicate jobs can be enabled or disabled by the [Special](/wiki/configuration/5.0/special) setting `warn\_dupl\_jobs`.
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)