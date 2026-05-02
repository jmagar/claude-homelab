SABnzbd -
Wiki -
Glitter Tips and Tricks
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Glitter+Tips+and+Tricks&amp;body=##+URL:+/wiki/extra/glitter-tips-and-tricks.html
Improvement:
>)
Glitter Tips and Tricks
Help us translate SABnzbd in your language!
Add untranslated texts or improved existing translations here: [https://sabnzbd.org/wiki/translate](https://sabnzbd.org/wiki/translate)
## Extensions
Several people have created utilities that work with SABnzbd to simplify and automate much of your usenet experience: [Extensions for SABnzbd](/wiki/extensions-for-sabnzbd)
## Speed tips
We have some tips and tricks in case SABnzbd is not hitting the limits of your connection: [Highspeed Downloading](/wiki/advanced/highspeed-downloading)
## Edit multiple jobs
To quickly set options for multiple jobs, click .
First select the options to change, then select to which jobs these changes should be applied. Or, first select the jobs and then the changes. Changes are applied instantly.
NOTE Changes are applied to **all** selected jobs, whether they are on the current page or not.
## Searching the Queue and History
The queue search box appears only when there are more items than the Queue item limit (set in Status and Interface settings, , Web Interface) or when editing multiple jobs.
More advanced filtering of the queue and history is possible and described in detail [here](/wiki/extra/queue-history-searching).
## Select ranges of items (jobs, files)
When editing multiple jobs or when viewing the files within a job ( ), select a range of items by clicking the first of the items, then press and hold the `SHIFT` key and select the last item in the range.
It's also possible to use the Check All button to select all items or un-select all in case some were already selected.
## Extra Queue and History columns
Glitter offers the option to display extra information in the Queue and History by selecting them in Status and Interface settings ( , Web Interface). This way you can always see for example a job's Category, Script, etc. or similar information in the History.
## Tabbed layout
If you prefer to have the Queue and History not on the same page but in tabs (much like the old Classic interface), you can activate this in Status and Interface settings ( , Web Interface).
## Keyboard shortcuts
The following keyboard shortcuts are available: `P`ause, `A`dd, `S`tatus and `C`onfig.
New in 3.7.0 Use shortcut `shift + arrow-key` to navigate the Queue and History pages.
The keyboard shortcuts can be disabled in Status and Interface settings ( , Web Interface).
## Pick date/time formats
In Status and Interface settings ( , Web Interface) you can choose to display the time Twitter/Facebook-style instead of the regular date/time format. The notation can also be changed.
## Disable confirmations when deleting items from Queue/History
In Status and Interface settings ( , Web Interface) you can choose to not be asked if you are sure when deleting a job or history item. There is no way to restore jobs or history items after deleting.
## Add (multiple) NZB's by drag-and-drop
You can drag and drop NZB's directly onto the Glitter interface in your browser. It's not limited to a single NZB: you can drag multiple NZB's at once or add archives containing multiple NZB's directly.
## Delete from history based on search term
The History-delete button also allows to delete all the items on the current page, this way when you search for something you can remove all items matching your search term at once.
## Quickly set password for a job
Set a password for a job by adding to the end of the job name. Edit the name and add `/` then the password. SABnzbd will parse it as a password. So set it to `JOBNAME / PASSWORD123` and it will set the password for the job to `PASSWORD123`.
## Custom pause
You are not limited to the pre-defined settings of pausing, in the same menu next to the pause button you can choose Custom. Here you can enter a pause duration in minutes, hours, days or even set a specific end time. When you say `tomorrow 17:00`, it will calculate how many minutes that is. Other examples are `90 minutes`, `2 days`, `Friday 2am` or `10 September, 17:00`.
## Quickly clear speedlimit
When you set a speedlimit, the icon will appear in the speed display. By clicking , the speedlimit will be removed.
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)