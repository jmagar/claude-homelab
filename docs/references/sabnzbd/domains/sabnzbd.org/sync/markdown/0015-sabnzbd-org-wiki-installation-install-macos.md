SABnzbd -
Wiki -
Install SABnzbd for macOS
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Install+SABnzbd+for+macOS&amp;body=##+URL:+/wiki/installation/install-macos.html
Improvement:
>)
Install SABnzbd for macOS
## The official App
If you just want to use SABnzbd, we provide a packaged application (64bit-only) available [here](/downloads).
Pick the right folder for your macOS version and drag SABnzbd to the Applications folder.
## How to run from sources on macOS
Running the source python (.py) files on a macOS system is not recommended unless you want to try the latest GitHub copy, or make changes yourself.
1. Get a local copy (clone) of the SABnzbd source by running in the Terminal:
```
`git clone -b master https://github.com/sabnzbd/sabnzbd.git
cd sabnzbd`
```
2. Install the dependencies by running (might require Xcode):
```
`python3 -m pip install -U -r requirements.txt`
```
3. Start SABnzbd by running:
```
`python3 SABnzbd.py`
```
Your default web browser should now start and show the user interface of SABnzbd.
To update the source files to the latest version, open Terminal and run:
```
`cd sabnzbd
git pull`
```
## Running from Terminal
Since the "-d" option of SABnzbd is not working under Leopard, we need to create a daemon environment. This can easily be done by running the command in *screen*. This also adds running at a low priority so that it will affect system performance less. The final command looks like this (provided that SABnzbd is still on your desktop):
```
`cd SABnzbd/
/usr/bin/screen -m -d /usr/bin/nice -n 20 \~/SABnzbd/SABnzbd.py -b 0`
```
Explanation:
* screen -m -d: starts the command in a detached screen.
* nice -n 20: starts the command with the lowest processor priority.
* SABnzbd.py -b 0: starts the SABnzbd without autostarting your browser.
Start SABnzbd at boottime
Run this script in crontab periodically, so that SABnzb+ is started at boottime and will be kept running.
```
`#!/bin/bash
active=$(/bin/ps aux | grep -v grep | grep SABnzbd.py)
if [ "$active" = "" ]
then
/usr/bin/screen -m -d /usr/bin/nice -n 20 \~/SABnzbd/SABnzbd.py -b 0
fi`
```
Should you ever need to run the compiled app from Terminal, this is the way:
```
`/Applications/SABnzbd.app/Contents/MacOS/SABnzbd`
```
If you need to see the logging output directly tro the console:
```
`/Applications/SABnzbd.app/Contents/MacOS/SABnzbd --console`
```
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)