SABnzbd -
Wiki -
Notification Scripts
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Notification+Scripts&amp;body=##+URL:+/wiki/configuration/5.0/scripts/notification-scripts.html
Improvement:
>)
Notification Scripts
SABnzbd can run a user-provided script to be executed when a notification needs to be sent.
In [Config-\>Notifications](/wiki/configuration/5.0/notifications) you can specify for which type of notifications the script should be executed.
Scripts may use any scripting language available on your system; common choices are Python, Unix shell, and Windows batch scripts. All scripts must be located in the scripts-directory, that can be specified in [Config-\>Folders](/wiki/configuration/5.0/folders). Furthermore, the script must be executable. On Linux this means the x-bit must be on. On Windows, the requirement is that the script's extension is listed in your system's `PATHEXT` environment variable.
If everything went well, SABnzbd expects the script to exit with status code `0`. If the returned exit status is non-zero, the output will be shown to the user as an error.
## Parameters
The script will receive the parameters described below.
Use `%1` in Windows scripts and `$1` in Unix scripts. Note that on Windows the input parameters are surrounded by quotes (e.g. `"job name"`).
NOTE **Much more information is available to scripts via environment variables, [see below](#env_vars)!**
|Position|Description|
|1|Type of notification
* `startup` = Startup/Shutdown
* `download` = Added NZB</li>
* `pp` = Post-processing started
* `complete` = Job finished
* `failed` = Job failed
* `warning` = Warning
* `error` = Error
* `disk\_full` = Disk full
* `queue\_done` = Queue finished
* `new\_login` = User logged in
* `other` = Other Messages|
|2|The title of the notification in the user's language|
|3|The notification message|
|Environment variable:
`SAB\_NOTIFICATION\_PARAMETERS`|Parameters (can be specified in [Config-\>Notifications](/wiki/configuration/5.0/notifications))|
## Environment variables
Notification scripts receive a limited amount of extra information via environment variables, in addition to any notification script parameters set in the config:
|Variable|Description|
|`SAB\_VERSION`|The version of SABnzbd|
|`SAB\_PROGRAM\_DIR`|The directory where the current SABnzbd instance is located|
|`SAB\_API\_KEY`|The API-key that can be used to communicate with SABnzbd via its [API](/wiki/configuration/5.0/api).|
|`SAB\_API\_URL`|
The URL to the SABnzbd [API](/wiki/configuration/5.0/api), for example `http://127.0.0.1:8080/api`.
It does not include the required `apikey` parameter, which is supplied via `SAB\_API\_KEY`.
|
|`SAB\_PAR2\_COMMAND`|The path to the `par2` command on the system running SABnzbd|
|`SAB\_RAR\_COMMAND`|The path to the `unrar` command on the system running SABnzbd|
|`SAB\_7ZIP\_COMMAND`|The path to the `7z` command on the system runnning SABnzbd. Not all systems have 7zip installed (it's optional for SABnzbd), so this can also be empty|
## Example Python script
The get the parameters in python, you can do this:
```
`import os
import sys
try:
(scriptname, notification\_type, notification\_title, notification\_text) = sys.argv
except:
print("No commandline parameters found")
sys.exit(1)
parameters = os.environ.get("SAB\_NOTIFICATION\_PARAMETERS")
# continue script
# Your code goes here
# Success code
sys.exit(0)`
```
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)