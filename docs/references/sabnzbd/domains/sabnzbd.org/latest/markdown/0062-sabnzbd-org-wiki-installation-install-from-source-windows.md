SABnzbd -
Wiki -
Install SABnzbd for Windows from source
[
](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=wc1)
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Install+SABnzbd+for+Windows+from+source&amp;body=##+URL:+/wiki/installation/install-from-source-windows.html
Improvement:
>)
Install SABnzbd for Windows from source
Running the source python (.py) files on a Windows system is not recommended unless you want to try the latest GitHub copy, or make changes yourself.
1. Install Python 3.8 or above from [Python.org](http://www.python.org/)
2. Install [Git for Windows](https://git-for-windows.github.io/) on your system. Defaults options are OK
3. Get a local copy (clone) of the SABnzbd source by opening Git Bash from the start menu and running:
```
`git clone -b master https://github.com/sabnzbd/sabnzbd.git `
```
Press "Insert" instead of "Ctrl+V" to paste into Git Bash.
You can specify the target directory as a second argument if you don’t want it in the default location (`C:\\Users\\USERNAME\\sabnzbd\\`).
4. To enable multi-language support type in the Git Bash you still have open:
```
`cd sabnzbd
python tools/make\_mo.py
```
</code>
5. Open a Command Prompt or Git Bash and navigate to the location of the Git clone, run:
```
`pip install -U -r requirements.txt
```
</code>
6. You can start SABnzbd by running in the Command Prompt or Git Bash:
```
`python C:\\Users\\USERNAME\\sabnzbd\\SABnzbd.py
```
</code>
To update the source files to the latest version, open Git Bash and type:
```
`cd sabnzbd
git pull
```
</code>
Optional (not show the DOS command line when SABnzbd is launched):
* Create a `.cmd` file to easily launch SABnzbd such as: `python "path\\to\\folder\\SABnzbd.py"`.
* Put a shortcut to the .cmd file in your startup folder, and set it to start as minimized.
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)