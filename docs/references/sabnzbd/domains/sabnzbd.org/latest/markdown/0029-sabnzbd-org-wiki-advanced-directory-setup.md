SABnzbd -
Wiki -
Folder Setup
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Folder+Setup&amp;body=##+URL:+/wiki/advanced/directory-setup.html
Improvement:
>)
Folder Setup
SABnzbd uses a number of folders for different purposes, some are just for internal administration.
Given that some folders can become very large, you may want to relocate them. The following table explains the purpose of each folder, its default location and its keyword in the INI file.
All folders can also be changed through the Web-GUI.
The expression `%userprofile%` is for Windows your personal folder in `C:\\Users\\` which can be directly entered in Run (`WindowsKey+R`).
For Posix (Linux) `\~` means your home folder.
NOTE The paths of the `log\_dir`, `admin\_dir` will be relative to the location of the `sabnzbd.ini` file unless a fixed path is set.
The `download\_dir`, `complete\_dir`, `dirscan\_dir` are relative from the current users home directory.
NOTE You can set fixed paths such as `D:\\Downloads`, or `/Volumes/nameofdrive/Downloads`.
However, the path must be accessible to SABnzbd **when it is launched** otherwise it will be reset to the default path.
### Configuration file `sabnzbd.ini`
|Operating System|Path|
|Windows|`%userprofile%\\AppData\\Local\\sabnzbd\\sabnzbd.ini`|
|Posix|`\~/.sabnzbd/sabnzbd.ini`|
|macOS|`\~/Library/Application Support/SABnzbd/sabnzbd.ini`|
### Temporary Download Folder `download\_dir`
Here SABnzbd collects the data for each download and error correction (par2) is done. When complete, the data is moved to the `complete\_dir`. There should be enough space to contain the largest complete job + 10% for error correction data.
|Operating System|Path|
|Windows|`%userprofile%\\Downloads\\incomplete|
|Posix|`\~/Downloads/incomplete|
|macOS|`\~/Downloads/incomplete|
### Complete Download Folder `complete\_dir`
Here all completed download jobs are stored. Each job is placed in a separate folder, named after the NZB file that started it. You want to put this on a volume with plenty of room.
|Operating System|Path|
|Windows|`%userprofile%\\Downloads\\complete`|
|Posix|`\~/Downloads/complete`|
|macOS|`\~/Downloads/complete`|
### Administrative directory `admin\_dir`
Used for the internal administration of the job-queue and history.
|Operating System|Path|
|Windows|`%userprofile%\\AppData\\Local\\sabnzbd\\admin`|
|Posix|`\~/.sabnzbd/admin`|
|macOS|`\~/Library/Application Support/SABnzbd/admin`|
### Log directory `log\_dir`
Here SABnzbd's logging is stored. Although only needed for troubleshooting, you must have this folder. Growth of this folder is normally limited to 5MB.
|Operating System|Path|
|Windows|`%userprofile%\\AppData\\Local\\sabnzbd\\logs`|
|Posix|`\~/.sabnzbd/logs`|
|macOS|`\~/Library/Application Support/SABnzbd/logs`|
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)