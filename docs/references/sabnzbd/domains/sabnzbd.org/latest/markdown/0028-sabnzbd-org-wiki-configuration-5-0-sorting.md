SABnzbd -
Wiki -
Sorting
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Sorting&amp;body=##+URL:+/wiki/configuration/5.0/sorting.html
Improvement:
>)
Sorting
# External sorting tools
NOTE While SABnzbd supports a number of ways to rename files, external tools (like Sonarr, Radarr, etc.) allow for much more extensive automated download management. These tools can automatically search, add and handle renaming in almost every possible way!
Overview of available [Automation Extensions for SABnzbd](/wiki/extensions-for-sabnzbd#automation).
# Sorting
Sorting replaces any pattern keys in the sort string (such as *%sn* for the show or movie name) with real values, before creating the directory structure and renaming files. The sort string as well as the affected categories and job types can be set for every sorter. Sorters are tried in order of appearance, and can be reordered by dragging and dropping in the web interface. The first active sorter that meets both selection criteria (affected category and job type) is applied.
The job name serves as the primary source of information for the sorting. The more standard the naming, the better your chances of a job getting properly recognized, assigned the right job type, and correctly sorted. Additional information may be sourced from metadata embedded in the NZB.
NOTE If Sorting is active for a specific job, the "Deobfuscate final filenames" feature will not be applied.
## Basic settings
|**Enabled**|Enable or disable a configured sorter.|
|**Name**|Set the name of the sorter.|
|**Sort String**|The sorting expression with pattern keys, constructing a path of your choice. If the sort string ends in a pattern that indicates a file name (*.%ext* or *%fn*), its last part will be used for renaming files; otherwise, the constructed path will be created as a directory and the downloaded files moved there without renaming. See the presets and the [sort string examples](#toc6) section below for examples.|
|**Affected Job Types**
Advanced|The job type(s) this sorter should apply to. Use *Ctrl* or *Shift* to select multiple options.|
|**Affected Categories**|One or more categories this sorter should apply to. Use *Ctrl* or *Shift* to select multiple options.|
|**Minimum Filesize**
Advanced|The minimum file size that at least one file in a job must meet for the sorter to kick in.|
|**Multi-part Label**
Advanced|Label to apply to sequences of files (such as *CD1, CD2, ...*). Rarely used nowadays; previously defaulted to * CD%1* for movie sorting, where pattern key *%1* is the sequence number.|
## Pattern Keys
|Meaning|Pattern|Result|
|Show or Movie Name|%sn|Show or Movie Name (case-adjusted)|
||%s.n|Show.or.Movie.Name (case-adjusted)|
||%s\_n|Show\_or\_Movie\_Name (case-adjusted)|
|Show or Movie Name|%sN|Show or Movie Name|
||%s.N|Show.or.Movie.Name|
||%s\_N|Show\_or\_Movie\_Name|
||%title|Show or Movie Name|
||%.title|Show.or.Movie.Name|
||%\_title|Show.or.Movie\_Name|
|Resolution|%r|1080p|
|Year|%y|2021|
|Decade|%decade|20|
||%0decade|2020|
|Season Number|%s|1|
||%0s|01|
|Episode Number|%e|5|
||%0e|05|
|Episode Name|%en|Episode Name|
||%e.n|Episode.Name|
||%e\_n|Episode\_Name|
|File Extension|%ext|mkv|
|Original File Name|%fn|file name|
|Original Job Name|%dn|folder name|
|Lower Case|{TEXT}|text (in case of folders, apply to each part separately: *{%sn}/{%dn.%ext}*)|
Behind the scenes, the GuessIt module does much of the sorting-related guess work. In addition to the commonly-used features above that get their own pattern keys,
the full suite of GuessIt properties is exposed. The available properties depend on the installed GuessIt version and are listed in the web interface under the pattern key.
|**GuessIt Property**
Advanced|%GI\<property\>|GuessIt Property|
||%G.I\<property\>|GuessIt.Property|
||%G\_I\<property\>|GuessIt\_Property|
|For example:|%GI\<audio\_codec\>|DTS|
## Job names
### Series naming
Common, well recognized formats for season and episode numbers include **1x01** (Series**x**Episode) or **S01E01** (**S**series**E**episode).
For example:
`Show Name - 1x01 - Episode Name.nzb`
`Show.Name.S01E01.Episode.Name.nzb`
`Show Name.1x01.nzb`
### Season packs
The sorting includes support for season packs.
Episode numbers are detected from the names of the downloaded files; all other information is based on the job name or metadata.
To qualify for season pack handling, a job must be detected as type *tv*, its name must indicate a single *season* and either *multiple episodes*, or *no episodes* at all.
Examples of job names that would be recognised as season packs include:
`Show Name S02E04-05-06 Resolution-Group.nzb`
`Show.Name.S04.Resolution.Source.Codec-Group.nzb`
`Show Name S03E02E05E66.nzb`
`Show Name 4x01-02.nzb`
Season pack handling is automatically activated for qualifying jobs, unless it has been disabled globally via the [Special](/wiki/configuration/5.0/special) `enable\_season\_sorting` setting.
### Date naming
Most standard date formats are recognized, including `MM-DD-YYYY`, `MM.DD.YYYY` and `YYYY-MM-DD/YYYY.MM.DD`.
For example:
`Show.Name.25.12.2022.HDTV-RLS.nzb`
## Sort String examples
### General examples
**Job Name as File Name:**
`%dn.%ext`
Example: Job Name.mkv
### Series examples
**1x01 Season Folder:**
`%sn/Season %s/%sn - %sx%0e - %en.%ext`
Example: Show Name/Season 1/Show Name - 1x05 - Episode Name.mkv
**S01E01 Season Folder:**
`%sn/Season %s/%sn - S%0sE%0e - %en.%ext`
Example: Show Name/Season 1/Show Name - S01E05 - Episode Name.mkv
**1x01 Individual Episode Folder:**
`%sn/%sx%0e - %en/%sn - %sx%0e - %en.%ext`
Example: Show Name/1x05 - Episode Name/Show Name - 1x05 - Episode Name.mkv
**S01E01 Individual Episode Folder:**
`%sn/S%0sE%0e - %en/%sn - S%0sE%0e - %en.%ext`
Example: Show Name/S01E05 - Episode Name/Show Name - S01E05 - Episode Name.mkv
**Show name and season directories without file renaming:**
`%sn/Season %s`
Example: Show Name/Season 1/old file name.avi
### Movie examples
**In folders:**
`%title (%y)/%title (%y).%ext` with multipart label `CD%1`
Example: Movie Name (2000)/Movie Name (2000) CD1.mkv
**No folders:**
`%title (%y).%ext`
Example: Movie Name (2000).mkv
### Date examples
**Decades 1:**
`%0decade/%title (%y).%ext`
Example: 2000/Movie Name (2000).mkv
**Decades 2:**
`%decade/%title (%y).%ext`
Example: 00/Movie Name (2000).mkv
**Show Name folder:**
`%t/%t - %y-%0m-%0d - %desc.%ext`
Example: Show Name/Show Name - 2009-01-02 - Episode Name.mkv
**Year-Month folders:**
`%y-%0m/%t - %y-%0m-%0d - %desc.%ext`
Example: 2009-01/Show Name - 2009-01-02 - Episode Name.mkv
**Daily folders:**
`%y-%0m-%0d/%t - %y-%0m-%0d - %desc.%ext`
Example: 2009-01-02/Show Name - 2009-01-02 - Episode Name.mkv
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)