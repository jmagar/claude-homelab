SABnzbd -
Wiki -
Password-protected RARs
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Password-protected+RARs&amp;body=##+URL:+/wiki/advanced/password-protected-rars.html
Improvement:
>)
Password-protected RARs
Sometimes you encounter encrypted (or password-protected) RARs. It's only useful to download a password protected post when you know the password upfront. Trying to get a password afterwards is probably a waste of your time and/or money.
SABnzbd will try all available passwords when it detects an encrypted job during the downloading. If none of the passwords work you can set to automatically [Pause or Abort](/wiki/configuration/5.0/switches) the download.
## Password per NZB
Supposing you know the required password, you can give it to SABnzbd before the download starts post-processing.
You can do this like this:
* In the NZB file name you can embed the password like this: `My Job {{PW}}.nzb` or `My Job password=PW.nzb`
This will set the job name to `My Job` and the password to `PW`.
* When the job is in the queue, hover over the job and click the icon.
At the top of the files list you can set the password.
* You can also rename the job in the queue.
`My Job / PASSWORD` will set the password. The `/` is used as a separator because it cannot be part of a folder name.
The folder name will be `My Job` and `PASSWORD` will be used as the decryption password when unpacking.
The password can be changed until the job enters the post-processing queue.
## Inside the NZB
Indexers and NZB suppliers can include the password inside the NZB `head` section (see [NZB specification](/wiki/extra/nzb-spec)):
```
`\<meta type="password"\>secret\</meta\>`
```
Or as the `x-dnzb-password` header when SABnzbd fetches the URL.
## Password file
If you don't set a password per job, you can create a text file containing all passwords to be tried.
It's a simple ASCII text file (created with Notepad, VI or TextEdit) and should contain one password per line.
Specify where the file is in [Config-\>Folders](/wiki/configuration/5.0/folders).
NOTE Checking passwords is not very fast, the more passwords you list in the file the longer it will take and the more CPU power is lost. Do not list more than \~20 passwords in this file.
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)